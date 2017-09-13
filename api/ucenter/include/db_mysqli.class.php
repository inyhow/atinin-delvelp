<?php

class dbstuffi {

    var $version = '';
    var $querynum = 0;
    var $link;
    var $dbname;

    var $histories;

    function connect($dbhost, $dbuser, $dbpw, $dbname = '', $pconnect = 0, $halt = TRUE) {

        $this->dbname = $dbname;
        if(!$this->link = new mysqli($dbhost, $dbuser, $dbpw, $dbname)) {
            $this->halt('Can not connect to MySQLi server');
        }

        if($this->version() > '4.1') {
            if($dbcharset) {
                $this->link->set_charset($dbcharset);
            }

            if($this->version() > '5.0.1') {
                $this->link->query("SET sql_mode=''");
            }
        }


    }

    function fetch_array($query, $result_type = MYSQLI_ASSOC) {
        return $query ? $query->fetch_array($result_type) : null;
    }


    function result_first($sql) {
        $query = $this->query($sql);
        return $this->result($query, 0);
    }

    function fetch_first($sql) {
        $query = $this->query($sql);
        return $this->fetch_array($query);
    }

    function fetch_all($sql, $id = '') {
        $arr = array();
        $query = $this->query($sql);
        while($data = $this->fetch_array($query)) {
            $id ? $arr[$data[$id]] = $data : $arr[] = $data;
        }
        return $arr;
    }

    function cache_gc() {
        $this->query("DELETE FROM {$this->tablepre}sqlcaches WHERE expiry<$this->time");
    }

    function query($sql, $type = '', $cachetime = FALSE) {
        $resultmode = $type == 'UNBUFFERED' ? MYSQLI_USE_RESULT : MYSQLI_STORE_RESULT;
        if(!($query = $this->link->query($sql, $resultmode)) && $type != 'SILENT') {
            $this->halt('MySQLi Query Error', $sql);
        }
        $this->querynum++;
        $this->histories[] = $sql;
        return $query;
    }

    function affected_rows() {
        return $this->link->affected_rows;
    }

    function error() {
        return (($this->link) ? $this->link->error : mysqli_error());
    }

    function errno() {
        return intval(($this->link) ? $this->link->errno : mysqli_errno());
    }

    function result($query, $row) {
        if(!$query || $query->num_rows == 0) {
            return null;
        }
        $query->data_seek($row);
        $assocs = $query->fetch_row();
        return $assocs[0];
    }

    function num_rows($query) {
        $query = $query ? $query->num_rows : 0;
        return $query;
    }

    function num_fields($query) {
        return $query ? $query->field_count : 0;
    }

    function free_result($query) {
        return $query ? $query->free() : false;
    }

    function insert_id() {
        return ($id = $this->link->insert_id) >= 0 ? $id : $this->result($this->query("SELECT last_insert_id()"), 0);
    }

    function fetch_row($query) {
        $query = $query ? $query->fetch_row() : null;
        return $query;
    }

    function fetch_fields($query) {
        return $query ? $query->fetch_field() : null;
    }

    function version() {
        return $this->link->server_info;
    }

    function escape_string($str) {
        return $this->link->escape_string($str);
    }

    function close() {
        return $this->link->close();
    }

    function halt($message = '', $sql = '') {
        echo 'SQL Error:<br />'.$message.'<br />'.$sql;
    }
}

?>
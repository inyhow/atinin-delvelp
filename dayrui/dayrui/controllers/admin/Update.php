<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Update extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->db->db_debug = TRUE;
    }

    /**
     * 更新程序
     */
    public function index() {


        // 删除不需要的文件
        $this->load->helper('file');
        delete_files(FCPATH.'dayrui/libraries/Chart/', TRUE);
        delete_files(FCPATH.'dayrui/libraries/tmp-upload-images/', TRUE);
        $page = (int)$this->input->get('page');
        if (!$page) {
            $this->load->model('system_model');
            $tableinfo = $this->system_model->cache();
            $this->set_cache_data('table2', $tableinfo, 3600);
            $this->admin_msg('正在升级数据...', dr_url('update/index', array('page' => $page + 1)), 2);
        }
        // 表结构缓存
        $tableinfo = $this->get_cache_data('table2');
        if (!$tableinfo) {
            $this->load->model('system_model');
            $tableinfo = $this->system_model->cache();
            $this->set_cache_data('table2', $tableinfo, 3600);
        }
        delete_files(WEBPATH.'cache/backup/', TRUE);

        switch($page) {
            case 1:

                $this->admin_msg('语言包升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;

            case 2:

                // 模块部分
                $local = @array_diff(dr_dir_map(FCPATH.'module/', 1), array('member', 'space', 'order')); // 搜索本地模块
                if ($local) {
                    foreach ($local as $dir) {
                        if (!is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
                            continue;
                        }
                        $cfg = require FCPATH.'module/'.$dir.'/config/module.php';
                        if ($cfg['nodb']) continue;
                        foreach ($this->site_info as $i => $tt) {
                            if ($this->site[$i]) {
                                $table = $this->db->dbprefix($i.'_'.$dir);
                                // 升级评论表结构
                                if ($tableinfo[$table.'_comment_data_0']
                                    && !isset($tableinfo[$table.'_comment_data_0']['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_comment_data_0` ADD `avgsort` DECIMAL(4,2) NOT NULL;');
                                }
                                if ($tableinfo[$table.'_extend_comment_data_0']
                                    && !isset($tableinfo[$table.'_extend_comment_data_0']['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_extend_comment_data_0` ADD `avgsort` DECIMAL(4,2) NOT NULL;');
                                }
                                // 将评论字段增加到主表
                                if ($tableinfo[$table]
                                    && !isset($tableinfo[$table]['field']['comments'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '` ADD `comments` INT(10) DEFAULT 0;');
                                }
                                if ($tableinfo[$table.'_extend']
                                    && !isset($tableinfo[$table]['field']['comments'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_extend` ADD `comments` INT(10) DEFAULT 0;');
                                }
                                // 将收藏字段增加到主表
                                if ($tableinfo[$table]
                                    && !isset($tableinfo[$table]['field']['favorites'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '` ADD `favorites` INT(10) DEFAULT 0;');
                                }
                                if ($tableinfo[$table.'_extend']
                                    && !isset($tableinfo[$table]['field']['favorites'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_extend` ADD `favorites` INT(10) DEFAULT 0;');
                                }
                                // 将评分字段增加到主表
                                if ($tableinfo[$table]
                                    && !isset($tableinfo[$table]['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '` ADD `avgsort` DECIMAL(4,2) DEFAULT 0;');
                                }
                                if ($tableinfo[$table.'_extend']
                                    && !isset($tableinfo[$table]['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_extend` ADD `avgsort` DECIMAL(4,2) DEFAULT 0;');
                                }
                                // 为评论表增加url字段
                                if ($tableinfo[$table.'_extend_comment_data_0']
                                    && !isset($tableinfo[$table.'_extend_comment_data_0']['field']['url'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_extend_comment_data_0` ADD `url` varchar(250) DEFAULT NULL;');
                                }
                                if ($tableinfo[$table.'_comment_data_0']
                                    && !isset($tableinfo[$table.'_comment_data_0']['field']['url'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_comment_data_0` ADD `url` varchar(250) DEFAULT NULL;');
                                }
                                // 为评论表增加title字段
                                if ($tableinfo[$table.'_extend_comment_data_0']
                                    && !isset($tableinfo[$table.'_extend_comment_data_0']['field']['title'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_extend_comment_data_0` ADD `title` varchar(250) DEFAULT NULL;');
                                }
                                if ($tableinfo[$table.'_comment_data_0']
                                    && !isset($tableinfo[$table.'_comment_data_0']['field']['title'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_comment_data_0` ADD `title` varchar(250) DEFAULT NULL;');
                                }
                            }
                        }
                    }
                }

                $this->admin_msg('模块表结构升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;


            case 3:
                // 为站点安装共享模块表
                $table = $this->db->dbprefix('module');
                if ($tableinfo[$table]
                    && !isset($tableinfo[$table]['field']['share'])) {
                    $this->db->query('ALTER TABLE `'.$table.'`  ADD `share` TINYINT(1) NOT NULL COMMENT \'是否共享模块\' AFTER `dirname`');
                }
                foreach ($this->site_info as $id => $tt) {
                    if ($this->site[$id]) {
                        $db = $this->site[$id];
                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share')."` (
                          `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `mid` varchar(20) NOT NULL COMMENT '模块目录',
                          `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
                          `title` varchar(255) DEFAULT NULL COMMENT '主题',
                          `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
                          `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
                          `description` text COMMENT '描述',
                          `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
                          `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
                          `author` varchar(50) NOT NULL COMMENT '作者名称',
                          `status` tinyint(2) NOT NULL COMMENT '状态',
                          `url` varchar(255) DEFAULT NULL COMMENT '地址',
                          `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
                          `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
                          `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
                          `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
                          `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
                          `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
                          `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
                          `displayorder` tinyint(3) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`),
                          KEY `uid` (`uid`),
                          KEY `mid` (`mid`),
                          KEY `catid` (`catid`,`updatetime`),
                          KEY `link_id` (`link_id`),
                          KEY `comments` (`comments`),
                          KEY `favorites` (`favorites`),
                          KEY `status` (`status`),
                          KEY `hits` (`hits`),
                          KEY `displayorder` (`displayorder`,`updatetime`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块主表' ;
                        "));

                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share_category')."` (
                          `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
                          `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
                          `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
                          `mid` varchar(20) NOT NULL COMMENT '模块目录',
                          `pids` varchar(255) NOT NULL COMMENT '所有上级id',
                          `name` varchar(30) NOT NULL COMMENT '栏目名称',
                          `domain` varchar(50) NOT NULL COMMENT '绑定域名',
                          `letter` char(1) NOT NULL COMMENT '首字母',
                          `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
                          `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
                          `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
                          `childids` text NOT NULL COMMENT '下级所有id',
                          `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
                          `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
                          `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
                          `content` mediumtext NOT NULL COMMENT '单页内容',
                          `permission` text COMMENT '会员权限',
                          `setting` text NOT NULL COMMENT '属性配置',
                          `displayorder` tinyint(3) NOT NULL DEFAULT '0',
                          `benner` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `mid` (`mid`),
                          KEY `tid` (`tid`),
                          KEY `show` (`show`),
                          KEY `dirname` (`dirname`),
                          KEY `module` (`pid`,`displayorder`,`id`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块栏目表';
                        "));

                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share_extend')."` (
                          `id` int(10) unsigned NOT NULL,
                          `mid` varchar(20) NOT NULL COMMENT '模块目录',
                          `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
                          `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
                          `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
                          `author` varchar(50) NOT NULL COMMENT '作者名称',
                          `name` varchar(255) DEFAULT NULL COMMENT '名称',
                          `url` varchar(255) DEFAULT NULL COMMENT '地址',
                          `status` tinyint(2) NOT NULL COMMENT '审核状态',
                          `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
                          `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
                          `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
                          `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
                          `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
                          `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
                          `displayorder` tinyint(3) NOT NULL DEFAULT '0',
                          UNIQUE KEY `id` (`id`),
                          KEY `uid` (`uid`),
                          KEY `mid` (`mid`),
                          KEY `catid` (`catid`),
                          KEY `status` (`status`),
                          KEY `hits` (`hits`),
                          KEY `comments` (`comments`),
                          KEY `favorites` (`favorites`),
                          KEY `displayorder` (`displayorder`,`updatetime`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展表';
                        "));

                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share_index')."` (
                          `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
                          `mid` varchar(20) NOT NULL COMMENT '模块目录',
                          `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
                          `status` tinyint(2) NOT NULL COMMENT '审核状态',
                          `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
                          PRIMARY KEY (`id`),
                          KEY `mid` (`mid`),
                          KEY `uid` (`uid`),
                          KEY `catid` (`catid`),
                          KEY `status` (`status`),
                          KEY `inputtime` (`inputtime`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块内容索引表';
                        "));

                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share_extend_index')."` (
                          `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `mid` varchar(22) NOT NULL,
                          `cid` int(10) unsigned NOT NULL COMMENT '内容id',
                          `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
                          `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
                          `status` tinyint(2) NOT NULL COMMENT '审核状态',
                          PRIMARY KEY (`id`),
                          KEY `mid` (`mid`),
                          KEY `cid` (`cid`),
                          KEY `uid` (`uid`),
                          KEY `catid` (`catid`),
                          KEY `status` (`status`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展索引表';
                        "));

                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share_search')."` (
                          `id` varchar(32) NOT NULL,
                          `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
                          `params` text NOT NULL COMMENT '参数数组',
                          `keyword` varchar(255) NOT NULL COMMENT '关键字',
                          `contentid` mediumtext NOT NULL COMMENT 'id集合',
                          `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `id` (`id`),
                          KEY `catid` (`catid`),
                          KEY `keyword` (`keyword`),
                          KEY `inputtime` (`inputtime`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索表';
                        "));

                        $db->query(trim("
                        CREATE TABLE IF NOT EXISTS `".$this->db->dbprefix($id.'_share_search_index')."` (
                          `id` varchar(32) NOT NULL,
                          `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
                          `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
                          KEY `id` (`id`),
                          KEY `cid` (`cid`),
                          KEY `inputtime` (`inputtime`)
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索索引表';
                        "));
                    }
                }

                $this->admin_msg('站点共享模块数据结构升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;

            case 4:
                // 升级联动菜单表
                $data = $this->db->get('linkage')->result_array();
                if ($data) {
                    foreach ($data as $t) {
                        $table = $this->db->dbprefix('linkage_data_'.$t['id']);
                        if ($tableinfo[$table] && !isset($tableinfo[$table]['field']['hidden'])) {
                            $this->db->query('ALTER TABLE `' . $table . '` ADD `hidden` TINYINT(1) UNSIGNED NULL DEFAULT 0 COMMENT \'前台隐藏\'');
                        }
                    }
                }
                $this->admin_msg('联动菜单表结构升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;

            case 5:
                // 升级会员组模型表
                $table = $this->db->dbprefix('member_group');
                if ($tableinfo[$table] && !isset($tableinfo[$table]['field']['allowregister'])) {
                    $this->db->query('ALTER TABLE `' . $table . '` ADD `allowregister` tinyint(1) unsigned NOT NULL COMMENT \'是否允许会员注册\'');
                }
                if ($tableinfo[$table] && !isset($tableinfo[$table]['field']['allowapply_orther'])) {
                    $this->db->query('ALTER TABLE `' . $table . '` ADD `allowapply_orther` tinyint(1) unsigned NOT NULL COMMENT \'是否允许会员申请其他组\'');
                }
                $this->admin_msg('会员组模型表结构...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;
            case 6:
                // 升级财务记录表
                $table = $this->db->dbprefix('member_paylog');
                $table2 = $this->db->dbprefix('member_scorelog');
                for ($i=0; $i<=9; $i++) {
                    if ($tableinfo[$table.'_'.$i]) {
                        $data = $this->db->query('SELECT * FROM `'.$table.'_'.$i.'`')->result_array();
                        if ($data) {
                            foreach ($data as $t) {
                                unset($t['id']);
                                $this->db->insert($table, $t);
                            }
                        }
                        $this->db->query('DROP TABLE `'.$table.'_'.$i.'`');
                    }
                    if ($tableinfo[$table2.'_'.$i]) {
                        $data = $this->db->query('SELECT * FROM `'.$table2.'_'.$i.'`')->result_array();
                        if ($data) {
                            foreach ($data as $t) {
                                unset($t['id']);
                                $this->db->insert($table2, $t);
                            }
                        }
                        $this->db->query('DROP TABLE `'.$table2.'_'.$i.'`');
                    }
                }
                $this->admin_msg('升级财务记录表结构...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;
            default:
                $this->admin_msg('升级完成，请更新全站缓存在刷新页面', '', 1);exit;
                break;
        }
    }

    private function set_lang($file, $version, $code) {


    }
}
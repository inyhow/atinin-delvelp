<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.1
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

require_once FCPATH . 'dayrui/core/D_App.php';

class M_Controller extends D_App {

    public $mydb;
    public $link;

    /**
     * 应用公共控制器类
     */
    public function __construct() {
        parent::__construct();
        $this->link = $this->mydb = $this->site[SITE_ID];
    }

    // 安装数据表
    protected function _install_table($id) {

        $this->mydb->query("DROP TABLE IF EXISTS `".$this->db->dbprefix($id.'_poster')."`");
        $this->mydb->query(trim("
        CREATE TABLE `".$this->db->dbprefix($id.'_poster')."` (
          `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
          `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '位置id',
          `name` varchar(50) NOT NULL COMMENT '广告名称',
          `value` text NOT NULL COMMENT '广告值',
          `uid` int(10) unsigned NOT NULL COMMENT '发布人uid',
          `username` varchar(50) NOT NULL COMMENT '发布人',
          `price` decimal(10,2) unsigned DEFAULT '0' COMMENT '竞价金额',
          `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
          `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
          `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
          `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
          `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
          `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
          PRIMARY KEY (`id`),
          KEY `spaceid` (`sid`,`status`,`displayorder`),
          KEY `uid` (`uid`),
          KEY `price` (`price`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
        "));

        $this->mydb->query("DROP TABLE IF EXISTS `".$this->db->dbprefix($id.'_poster_space')."`");
        $this->mydb->query(trim("
        CREATE TABLE `".$this->db->dbprefix($id.'_poster_space')."` (
          `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
          `name` varchar(50) NOT NULL COMMENT '广告位名称',
          `type` tinyint(2) NOT NULL COMMENT '广告位类型',
          `value` text NOT NULL COMMENT '参数配置',
          `price` decimal(10,2) unsigned DEFAULT '0' COMMENT '竞价金额',
          `items` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告数量',
          `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
          PRIMARY KEY (`id`),
          KEY `status` (`status`),
          KEY `price` (`price`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
        "));

    }

    // 卸载数据表
    protected function _uninstall_table($id) {

        $this->mydb->query('DROP TABLE IF EXISTS `'.$this->db->dbprefix($id.'_poster').'`');
        $this->mydb->query('DROP TABLE IF EXISTS `'.$this->db->dbprefix($id.'_poster_space').'`');
    }

}
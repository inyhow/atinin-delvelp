<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.5.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

// 不自动初始化模块
define('DR_IS_SO', 1);
require_once FCPATH.'dayrui/core/D_Module.php';

class Show extends D_Module {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->dir = 'share';
        $this->link = $this->site[SITE_ID];
    }

    /**
     * 内容
     */
    public function index($id = 0, $page = 0, $return = FALSE) {
        $id = $id ? $id : (int)$this->input->get('id');
        $page = $page ? $page : max(1, (int)$this->input->get('page'));
        return $this->_show($id, $page, $return);
    }

    /**
     * 创建html
     */
    public function create_html() {
        $this->_create_show_file((int)$this->input->get('id'), FALSE);
    }

    /**
     * 生成html
     */
    public function html() {
        $this->_show_html();
    }

}
<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.2
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Category extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }
	
	/**
     * 栏目列表
     */
    public function index() {

        $catid = (int)$this->input->get('catid');
        $module = $this->get_cache('module-'.SITE_ID.'-'.APP_DIR);
        $select = $this->select_category($module['category'], $catid, 'class="form-control" id=\'dr_catid\' name=\'catid\' onChange="show_category_field(this.value)"', '', 1, 1);
        //print_r($select);exit;
        $this->template->assign(array(
            'select' => $select,
        ));
        $this->_category((int)$this->input->get('id'), $this->input->get('dir', TRUE), max(1, (int)$this->input->get('page')));
    }
	
	/**
     * 生成html
     */
    public function html() {
        $this->_category_html();
    }
	
}
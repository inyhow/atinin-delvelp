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

class Home extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * 首页
     */
    public function index() {

        $catid = 2;
        $module = $this->get_cache('module-'.SITE_ID.'-'.APP_DIR);
        $select = $this->select_category($module['category'], $catid, 'class="form-control" id=\'dr_catid\' name=\'catid\' onChange="show_category_field(this.value)"', '', 1, 1);
        //print_r($select);exit;
        $this->template->assign(array(
            'select' => $select,
        ));

		parent::_index();
    }
}
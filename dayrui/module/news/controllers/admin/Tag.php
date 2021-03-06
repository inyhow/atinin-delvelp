<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/news/controllers/tag.php
 */

require FCPATH.'dayrui/core/D_Tag.php';

class Tag extends D_Tag {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }
	
	public function index() {
		$this->admin_index();
	}
	
	public function add() {
		$this->admin_add();
	}
	
	public function edit() {
		$this->admin_edit();
	}
	
	public function del() {
		$this->admin_del();
	}
	
}
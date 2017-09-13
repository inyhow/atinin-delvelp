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

    /**
     * 应用公共控制器类
     */
    public function __construct() {
        parent::__construct();
    }
    
}
<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/news/controllers/home.php
 */

require FCPATH.'dayrui/core/D_Comment.php';
 
class Publish extends D_Comment {
	
    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->module(APP_DIR);
	}

	public function index(){
        /*is_file(FCPATH.'dayrui/helpers/function_common.php') && include FCPATH.'dayrui/helpers/function_common.php';*/
        
        $this->template->assign(array(
                'meta_title' => '服务方案_联标',
                ));

		$this->template->display('publish.html');
	}

    public function publish_job(){
        /*is_file(FCPATH.'dayrui/helpers/function_common.php') && include FCPATH.'dayrui/helpers/function_common.php';*/
        
        $this->template->assign(array(
                'meta_title' => '服务方案_联标',
                ));

        $this->template->display('publish_job.html');
    }

}
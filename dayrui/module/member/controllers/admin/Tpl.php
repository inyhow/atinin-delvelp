<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/member/controllers/admin/tpl.php
 */

require FCPATH.'dayrui/core/D_File.php';

class Tpl extends D_File {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->path = $this->router->method == 'mobile' || $this->input->get('ismb') ? FCPATH.'module/member/mobiles/member/' : FCPATH.'module/member/templates/member/';
        $this->template->assign(array(
			'path' => $this->path,
			'furi' => 'member/tpl/',
			'auth' => 'member/admin/tpl/',
			'menu' => $this->get_menu(array(
				fc_lang('模板管理') => 'member/admin/tpl/index',
				fc_lang('移动端模板') => 'member/admin/tpl/mobile',
				fc_lang('标签向导') => 'member/admin/tpl/tag',
			)),
            'ismb' => $this->router->method == 'mobile' ? 1 : 0,
		));
    }
	
}
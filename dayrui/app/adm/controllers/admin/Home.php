<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
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
		$this->load->model('application_model');
    }

    /**
     * 配置应用
     */
    public function index() {

		redirect(ADMIN_URL.dr_url(APP_DIR.'/poster/index'), 'refresh');
    }
	
	/**
     * 安装应用
     */
    public function install() {
		
		$this->_admin_install(); // 返回应用id

		$this->cache(1);
		$this->admin_msg('安装成功', $this->url('poster/index'), 2);
    }
	
	/**
     * 卸载应用
     */
    public function uninstall() {
		
		$this->_admin_uninstall();

		// 按站点卸载
		foreach ($this->site_info as $sid => $t) {
			if ($this->site[$sid]
				&& $this->site[$sid]->query("SHOW TABLES LIKE '".$this->db->dbprefix.$sid."_poster'")->row_array()) {
				// 表不存在时创建表
				$this->_uninstall_table($sid);
			}
		}
		
    	$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('application/index'), 1);
    }

	/**
	 * 应用缓存
	 *
	 * @return	NULL
	 */
	public function cache($admin = 0) {

		$this->_admin_cache();

		$admin = $admin ? $admin : $this->input->get('admin');
		if ($this->input->get('todo')) {
			$this->admin_msg(fc_lang('应用(%s)缓存', APP_DIR), $this->url('home/index'), 1);
		}

		// 判断表是否存在，不存在就安装
		foreach ($this->site_info as $sid => $t) {
			if ($this->site[$sid]
				&& !$this->site[$sid]->query("SHOW TABLES LIKE '".$this->db->dbprefix.$sid."_poster'")->row_array()) {
				// 表不存在时创建表
				$this->_install_table($sid);
			}
		}

		$this->load->model('poster_model');
		$this->poster_model->cache(isset($_GET['site']) && $_GET['site'] ? (int)$_GET['site'] : SITE_ID);

		$admin or $this->admin_msg(fc_lang('操作成功，正在刷新...'), isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '', 1);

	}
	
}
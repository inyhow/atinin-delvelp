<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
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

		// 登录验证
		$url = dr_member_url('login/index', array('backurl' => urlencode(dr_now_url())));
		if (!$this->uid) {
			$this->member_msg(fc_lang('会话超时，请重新登录').$this->member_model->logout(), $url);
		}

		//金币记录
		$list = $this->db->where('uid', $this->uid)->where('type', 1)->order_by('inputtime DESC')->limit(4)->get('member_scorelog')->result_array();

		$this->load->library('dip');
		$this->template->assign(array(
			'indexu' => 1,
			'list' => $list,
			'invite' => dr_get_invite($this->uid, 'username'),
			'invite_url' => dr_member_url('register/index', array('uid' => $this->uid, 'invite' => $this->member['username'])),

		));
		$this->template->display(IS_AJAX ? 'main.html' : 'index.html');
    }
	



}
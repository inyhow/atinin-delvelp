<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.3
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Home extends M_Controller {
	
	public $field;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
		$this->load->model('order_model');
    }

    /**
     * 订单管理
     */
    public function index() {
       $this->_admin_list(lang('mod-005'), 0);
    }

    /**
     * 待付款
     */
    public function fk() {
       $this->_admin_list(lang('mod-081'), 1);
    }

    /**
     * 待发货
     */
    public function fh() {
       $this->_admin_list(lang('mod-082'), 2);
    }

    /**
     * 交易完成
     */
    public function wc() {
       $this->_admin_list(lang('mod-083'), 3);
    }

    /**
     * 交易关闭
     */
    public function close() {
       $this->_admin_list(lang('mod-165'), 9);
    }



    /**
     * 订单详情
     */
    public function info() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info($id);
        if (!$data) {
            $this->admin_msg(lang('mod-055'), $_SERVER['HTTP_REFERER']);
        }

        $this->load->library('dip');

        $this->template->assign(array(
            'id' => $id,
            'kd' => require APPPATH.'libraries/Kd.php',
            'log' => $this->link->where('oid', $id)->order_by('inputtime desc')->get(SITE_ID.'_order_operate')->result_array(),
            'menu' => $this->get_menu_v3(array(
                lang('mod-005') => array('javascript:;" onclick="dr_order_back()', 'reply'),
                lang('mod-057') => array('order/admin/home/info/id/'.$id, 'file-text')
            )),
            'back' => ADMIN_URL.SELF.'?s=order&c=home&m=',
            'order' => $data,
            'field' => $this->get_cache('module-'.SITE_ID.'-order', 'field'),
            'paytype' => $this->mconfig['paytype'],
            'transfer' => $this->db->where('oid',$id)->get(SITE_ID.'_order_transfer')->row_array(),
            'meta_name' => lang('mod-057'),
        ));
        $this->template->display('order_info.html');
    }

    // 快递接口
    public function kd() {
        echo str_replace(
            array('<tr><th>时间</th><th>记录</th></tr>'),
            array(''),
            $this->_kd_info($_GET['name'], $_GET['sn'])
        );
        exit;
    }
}
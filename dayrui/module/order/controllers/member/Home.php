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
		$this->load->model('order_model');
    }

    /**
     * 订单管理 (是否商家)
     */
    private function _list($is_sell = 0) {

        if ($is_sell) {
            $this->link->where('sell_uid', $this->uid);
        } else {
            $this->link->where('buy_uid', $this->uid);
        }

        $field = array(
            'sn' => lang('mod-000'),
            'title' => lang('mod-054'),
            'shipping_name' => lang('mod-003'),
        );

        $param = array(
            'kw' => dr_safe_replace($this->input->get('kw')),
            'field' => $this->input->get('field'),
        );

        // 搜索部分
        if (isset($field[$param['field']]) && $param['kw']) {
            if ($param['field'] == 'title') {
                $this->link->where('`id` IN (select oid from `'.$this->db->dbprefix(SITE_ID.'_order_goods').'` where `title` LIKE "%'.$param['kw'].'%")');
            } else {
                $this->link->where($param['field'], $param['kw']);
            }
        }

        $this->link->order_by('order_time desc');

        if ($this->input->get('action') == 'search') {
            // ajax搜索数据
            $page = max(1, (int)$this->input->get('page'));
            $list = $this->link->limit($this->pagesize, $this->pagesize * ($page - 1))->get(SITE_ID.'_order')->result_array();
            if (!$list) {
                exit('null');
            }
            $this->template->assign(array(
                'list' => $this->_format_info($list),
            ));
            $this->template->display('order_data.html');
        } else {
            $page = (int)$this->input->get('page');
            $list = $this->link->limit($page ? $page * $this->pagesize : $this->pagesize)->get(SITE_ID.'_order')->result_array();
            $this->template->assign(array(
                'page' => max(2, $page + 1),
                'list' => $this->_format_info($list),
                'field' => $field,
                'param' => $param,
                'paytype' => $this->mconfig['paytype'],
                'moreurl' => 'index.php?s=member&mod=order&c=home&m='.$this->router->method.'&action=search&'.@http_build_query($param),
            ));
            $this->template->display('order_index.html');
        }
    }

    // 买家
    public function index() {

        // 使用权限判断
        if (!@in_array($this->groupid, $this->mconfig['permission']['buy']['use'])) {
            if ($this->groupid) {
                $this->member_msg(lang('mod-040'));
            } else {
                $this->member_msg(lang('mod-041'), dr_member_url('login/index'), 3, 2);
            }
        }

        $this->_list(0);
    }

    // 商家
    public function sell() {

        // 使用权限判断
        if (!@in_array($this->groupid, $this->mconfig['permission']['sell']['use'])) {
            if ($this->groupid) {
                $this->member_msg(lang('mod-040'));
            } else {
                $this->member_msg(lang('mod-041'), dr_member_url('login/index'), 3, 2);
            }
        }

        $this->_list(1);
    }
	

    /**
     * 订单详情
     */
    public function info() {
		
		$id = (int)$this->input->get('id');
		$data = $this->order_model->get_info($id);
        if (!$data) {
            $this->member_msg(lang('mod-055'));
        }

        // 权限验证
        if ($data['buy_uid'] != $this->uid && $data['sell_uid'] != $this->uid) {
            $this->member_msg(lang('mod-056'));
        }

        // 操作记录（卖家和管理员可查看）
        $log = array();
        if ($data['sell_uid'] == $this->uid || $this->member['admin']) {
            $log = $this->link->where('oid', $id)->order_by('inputtime desc')->get(SITE_ID.'_order_operate')->result_array();
            $this->load->library('dip');
        }

        // 快递配置文件
        $kd = require APPPATH.'libraries/Kd.php';

        // 商家信息
        $store = is_dir(WEBPATH.'store') ? $this->link->where('uid', intval($data['sell_uid']))->get(SITE_ID.'_store')->row_array() : array();

        $this->template->assign(array(
            'id' => $id,
            'kd' => $kd,
            'log' => $log,
            'order' => $data,
            'store' => $store,
            'field' => $this->get_cache('module-'.SITE_ID.'-order', 'field'),
            'paytype' => $this->mconfig['paytype'],
            'meta_name' => lang('mod-057'),
        ));
        $this->template->display('order_info.html');
	}

    // 快递接口
    public function kd() {
        echo str_replace(
            array('ickd_return'),
            array('dr_table dr_order_kd'),
            $this->_kd_info($_GET['name'], $_GET['sn'])
        );
        exit;
    }

    // 订单评论
    public function comment() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info($id);
        if (!$data) {
            $this->member_msg(lang('mod-055'));
        }

        // 权限验证
        if ($data['buy_uid'] != $this->uid && $data['sell_uid'] != $this->uid) {
            $this->member_msg(lang('mod-056'));
        }

        // 订单状态
        if ($data['order_status'] != 3) {
            $this->member_msg(lang('mod-138'));
        }

        $this->template->assign(array(
            'order' => $data,
        ));
        $this->template->display('order_comment.html');
    }
}
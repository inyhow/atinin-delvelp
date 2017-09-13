<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.6.0
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
     * 实名认证
     */
    public function index() {

        /*is_file(FCPATH.'dayrui/helpers/function_common.php') && include FCPATH.'dayrui/helpers/function_common.php';*/
        
        if (!$this->member['complete']) {
            $this->member_msg(fc_lang('请先完善资料之后再实名认证'), dr_member_url('account/index'), 2, 2);
        }

        //判断会员所在分组
        $group = $this->db->where('uid', $this->uid)->get('member')->row_array();
        $groupid=$group['groupid'];

        //认证类型属性
        $auth_personal = $this->db->where('id', 261)->get('field')->row_array();
        $auth_personal = unserialize(stripslashes($auth_personal['setting']));
        $auth_personal = nl2br($auth_personal['option']['options']);
        $auth_personal = explode('<br />', $auth_personal);
        foreach ($auth_personal as $key => $value) {
            $auth_personal[$key] = explode('|', $value);
        }
        
        $data = $this->db->where('uid', $this->uid)->get('member_auth')->row_array();
        $error = NULL;
        $field = $this->get_mytable_field('member_auth', 0);
        $data['status'] = $data ? $data['status'] : 0;

        if (IS_POST && $data['status'] != 3) {
            $post = $this->validate_filter($field);
            if (isset($post['error'])) {
                $error = $post;
                if (IS_AJAX || IS_API_AUTH) {
                    exit(dr_json(0, $error['msg'], $error['error']));
                }
                $data = $this->input->post('data', TRUE);
            } else {
                // 入库
                $udpate = $post[1];
                $udpate['uid'] = $this->uid;
                $udpate['username'] = $this->member['username'];
                $udpate['inputip'] = $this->input->ip_address();
                $udpate['inputtime'] = SYS_TIME;
                $udpate['euid'] = 0;
                $udpate['editor'] = '';
                $udpate['edittime'] = 0;
                $udpate['note'] = '';
                $udpate['status'] = 0;
                $this->db->replace('member_auth', $udpate);
                $this->attachment_handle($this->uid, $this->db->dbprefix('member_auth').'-'.$this->uid, $field, $udpate, $data);
                $this->member_msg(fc_lang('您的申请已提交系统会尽快审核...'), dr_member_url('auth/home/index'), 2);
            }
        }

        $this->template->assign(array(
            'groupid' => $groupid,
            'data' => $data,
            'field' => $field,
            'myfield' => $this->field_input($field, $data, FALSE, 'uid'),
            'meta_name' => fc_lang('实名认证'),
            'result_error' => $error,
            'auth_personal' => $auth_personal,
        ));
        $this->template->display($data['status'] == 3 ? 'auth_show.html' : 'auth.html');
    }



}
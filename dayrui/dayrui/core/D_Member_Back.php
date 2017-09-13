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

class D_Member_Back extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }
	
	/**
     * 被退回
     */
    public function index() {
	
        if (IS_POST) {
		
			$ids = $this->input->post('ids', TRUE);
			if (!$ids) {
                exit(dr_json(0, fc_lang('您还没有选择呢')));
            }
			
			$this->load->model('attachment_model');
			foreach ($ids as $id) {
				$data = $this->link // 主表状态
							 ->where('uid', (int)$this->uid)
							 ->select('uid,catid')
							 ->limit(1)
							 ->get($this->content_model->prefix.'_index')
							 ->row_array();
				if ($data) {
					// 删除数据
					$this->content_model->del_verify($id);
					// 删除表对应的附件
					$this->attachment_model->delete_for_table($this->content_model->prefix.'_verify-'.$id);
				}
			}
			
			exit(dr_json(1, fc_lang('修改成功')));
		}

		$total = (int)$this->input->get('total');

		// 查询结果
		$list = array();
		if (!$total) {
			$this->link->select('count(*) as total');
			$this->link->where('uid', $this->uid)->where('status=0');
			$data = $this->link->get($this->content_model->prefix.'_verify')->row_array();
			$total = (int)$data['total'];
		}

		if ($total) {
			$page = max((int)$this->input->get('page'), 1);
			$list = $this->link
						->select('id,inputtime,catid,content')
						->where('uid', $this->uid)
						->where('status=0')
						->order_by('inputtime DESC')
						->limit($this->pagesize, $this->pagesize * ($page - 1))
						->get($this->content_model->prefix.'_verify')
						->result_array();
		}

		$url = dr_member_url(APP_DIR.'/back/index', array('action' => 'more'));
		$this->template->assign(array(
			'list' => $list,
			'pages'	=> $this->get_member_pagination($url.'&total='.$total, $total),
			'page_total' => $total,
		));
		$this->template->display('module_back_index.html');
    }
	
	/**
     * 修改退回
     */
    public function edit() {
	
		$id = (int)$this->input->get('id');
        $cid = (int)$this->input->get('catid');
		$data = $this->content_model->get_verify($id);
        $catid = $cid ? $cid : $data['catid'];
        $error = array();
		
        // 审核数据不存在
		if (!$data) {
            $this->member_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }
		// 禁止修改他人文档
        if ($data['author'] != $this->member['username']
            && $data['uid'] != $this->member['uid']) {
            $this->member_msg(fc_lang('无权限操作'));
        }
        $field = $this->_get_member_field($catid);
		unset($field['status']);
		$isedit = (int)$this->get_cache('module-'.SITE_ID.'-'.APP_DIR, 'category', $catid, 'setting', 'edit');
		
		if (IS_POST) {
			$_data = $data;
			$catid = $isedit ? $catid : (int)$this->input->post('catid');
            $field = $this->_get_member_field($catid);
			// 设置uid便于校验处理
			$_POST['data']['id'] = $id;
			$_POST['data']['uid'] = $this->uid;
			$_POST['data']['author'] = $this->member['username'];
			$_POST['data']['inputtime'] = $data['inputtime'];
			$_POST['data']['updatetime'] = SYS_TIME;
			$data = $this->validate_filter($field, $_data['content']);
			if (isset($data['error'])) {
				$error = $data;
                if (IS_AJAX || IS_API_AUTH) {
                    exit(dr_json(0, $error['msg'], $error['error']));
                }
				$data['content'] = $this->input->post('data', TRUE);
				$data['backinfo'] = $_data['backinfo'];
			} elseif (!$isedit && !$catid) {
				$data['content'] = $this->input->post('data', TRUE);
				$data['backinfo'] = $_data['backinfo'];
				$error = array('error' => 'catid', 'msg' => fc_lang('还没有选择栏目'));
                if (IS_AJAX || IS_API_AUTH) {
                    exit(dr_json(0, $error['msg'], $error['error']));
                }
			} else {
				$data[1]['catid'] = $catid;
                $data[1]['status'] = 1; // 修改审核后从头开始审核
                $data[1]['updatetime'] = SYS_TIME;
				$data[1]['uid'] = $this->uid;
				$data[1]['author'] = $this->member['username'];
				// 修改数据
				if ($this->content_model->edit($_data['content'], $data)) {
                    $this->attachment_handle($this->uid, $this->content_model->prefix.'_verify-'.$id, $field);
					if (IS_AJAX || IS_API_AUTH) {
                        exit(dr_json(1, fc_lang('发布成功，请等待管理员审核'), dr_member_url(APP_DIR.'/verify/index'), $id));
                    }
					$this->template->assign(array(
						'url' => dr_member_url(APP_DIR.'/verify/index'),
						'add' => dr_member_url(APP_DIR.'/home/add', array('catid' => $catid)),
						'edit' => 1,
						'list' => dr_member_url(APP_DIR.'/home/index'),
						'catid' => $catid,
						'meta_name' => fc_lang('修改成功')
					));
					$this->template->display('module_verify_msg.html');
				} else {
					$this->member_msg(fc_lang('修改失败'));
				}
				exit;
			}
            if (IS_AJAX || IS_API_AUTH) {
                exit(dr_json(0, $error['msg'], $error['error']));
            }
		}

		define('MODULE_CATID', $catid);

		$this->template->assign(array(
			'purl' => dr_member_url(APP_DIR.'/back/edit', array('id' => $id)),
			'data' => $data,
			'catid' => $catid,
			'error' => $error,
			'isedit' => $isedit,
			'select' => $this->select_category($this->get_cache('module-'.SITE_ID.'-'.APP_DIR, 'category'),$catid,'class="form-control" id=\'dr_catid\' name=\'catid\' onChange="show_category_field(this.value)"','',1,1),
            'myfield' => $this->new_field_input($field, $data['content'], TRUE),
            'meta_name' => fc_lang('重新提交'),
            'result_error' => $error,
            'category_field_url' => $this->get_cache('module-'.SITE_ID.'-'.APP_DIR, 'category_field') ? dr_member_url(APP_DIR.'/back/edit', array('id' => $id)) : ''
		));
		$this->template->display('module_back_edit.html');
    }
	
}
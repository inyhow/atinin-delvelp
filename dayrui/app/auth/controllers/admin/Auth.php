<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/member/controllers/admin/tpl.php
 */

require FCPATH.'dayrui/core/D_Admin_Table.php';

class Auth extends D_Admin_Table {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->mydb = $this->db; // 数据库
		$this->myid = 'uid'; // 主键
		$this->tfield = 'inputtime'; // 时间字段用于搜索和排序
		$this->mytable = 'member_auth'; // 表名
		// 表字段
		$this->myfield = $this->get_mytable_field('member_auth', 0);
		$field = array(
			'username' => array(
				'ismain' => 1,
				'fieldname' => 'username',
				'name' => fc_lang('会员名称'),
			),

		);
		$this->template->assign(array(
			'menu' => $this->get_menu(array(
				fc_lang('实名认证') => 'auth/admin/auth/index',
			)),
			'field' => $field + $this->myfield,
		));
    }

	// 管理
	public function index() {

        /*is_file(FCPATH.'dayrui/helpers/function_common.php') && include FCPATH.'dayrui/helpers/function_common.php';*/

		//删除
		if ($this->input->post('action') == 'del') {
			$ids = $this->input->post('ids');
			if (!$ids) {
				exit(dr_json(0, fc_lang('您还没有选择呢')));
			}
			$this->load->model('attachment_model');
			foreach ($ids as $id) {
				$row = $this->mydb->where('uid', (int)$id)->get($this->mytable)->row_array();
				if ($row) {
					$this->mydb->where('uid', (int)$id)->delete($this->mytable);
					$this->attachment_model->delete_for_table($this->db->dbprefix($this->mytable).'-'.$id);
					$this->system_log('删除会员实名认证【'.$row['username'].'】'); // 记录日志
				}
			}
			exit(dr_json(1, fc_lang('操作成功，正在刷新...')));
		}

		//审核通过
		if ($this->input->post('action') == 'pass') {
			$ids = $this->input->post('ids');
			if (!$ids) {
				exit(dr_json(0, fc_lang('您还没有选择呢')));
			}
			$this->load->model('attachment_model');
			// 判断状态--是否是未审核
			foreach ($ids as $key=>$id) {
				$row = $this->mydb->where('uid', (int)$id)->get($this->mytable)->row_array();
                if($row['status'] != 0){
                    exit(dr_json(0, fc_lang('含有非未审核会员，请重新选择！')));
                }
            }
			foreach ($ids as $id) {
				$row = $this->mydb->where('uid', (int)$id)->get($this->mytable)->row_array();
				if ($row) {
					//审核通过，增加经验值和金币(企业会员：经验+200,金币+200；会计会员：经验,金币;)
					$member = $this->db->where('uid', (int)$id)->get('member')->row_array();
					$gid = $member['groupid']; //会员组
					$score = $member['score']; //当前金币
					$exp = $member['experience']; //当前经验值
					//增加的经验值和金币
					if($gid=='4'){  //企业会员
						$add_sc = 200;
						$add_exp = 200;
					}elseif($gid=='3'){  //会计会员
						$types = $this->db->where('uid', (int)$id)->get('member_auth')->row_array();
						$type = $types['auth_personal']; //个人上传的证件类型
						if(!$type){ exit(dr_json(0, fc_lang('该会员证件有误，无法审核，请重新上传'))); }
						switch ($type){  //证件类型
							case 1:case 2:case 5:
							  $add_sc = 100;
							  $add_exp = 100;
							  break;
							case 3:
							  $add_sc = 150;
							  $add_exp = 150;
							  break;
							case 4:case 10:
							  $add_sc = 200;
							  $add_exp = 200;
							  break;
						}
					}
					$sc = $score+$add_sc;
					$ex = $exp+$add_exp;
					$this->db->where('uid', (int)$id)->update('member',array('score'=>$sc,'experience'=>$ex));
					
					$insert['uid'] = (int)$id;
		            $insert['type'] = 1;
		            $insert['value'] = $add_sc;
		            $insert['note'] = '实名认证';
		            $insert['inputtime'] = SYS_TIME;
					$this->db->insert('rs_member_scorelog',$insert); // 记录积分日志

					//审核通过，更新状态
					$this->mydb->where('uid', (int)$id)->update($this->mytable,array('status'=>3,'edittime'=>time()));
					$this->system_log('会员实名认证【'.$row['username'].'】通过'); // 记录日志
				}
			}
			exit(dr_json(1, fc_lang('操作成功，正在刷新...')));
		}

		//审核不通过
		if ($this->input->post('action') == 'not_pass') {
			$ids = $this->input->post('ids');
			$notes = $this->input->post('note');

			if (!$ids) {
				exit(dr_json(0, fc_lang('您还没有选择呢')));
			}
			$this->load->model('attachment_model');

			// 判断状态--是否是未审核
			foreach ($ids as $key=>$id) {
				$row = $this->mydb->where('uid', (int)$id)->get($this->mytable)->row_array();
                if($row['status'] != 0){
                    exit(dr_json(0, fc_lang('含有非未审核会员，请重新选择！')));
                }
            }
			foreach ($ids as $key=>$id) {
				$row = $this->mydb->where('uid', (int)$id)->get($this->mytable)->row_array();
				if ($row) {
					$this->mydb->where('uid', (int)$id)->update($this->mytable,array('status'=>1,'note'=>$notes[$key],'edittime'=>time()));
					//$this->attachment_model->delete_for_table($this->db->dbprefix($this->mytable).'-'.$id);
					$this->system_log('会员实名认证【'.$row['username'].'】未通过'); // 记录日志
				}
			}
			exit(dr_json(1, fc_lang('操作成功，正在刷新...')));
		}


		$this->_index();
		$this->template->display('auth_index.html');
	}

	// 修改
	public function edit() {

		$data = $this->_edit();

		$this->template->assign(array(
			'data' => $data,
			'menu' => $this->get_menu_v3(array(
				fc_lang('实名认证') => array('auth/admin/auth/index', 'user'),
				fc_lang('自定义字段') => array('admin/field/index/rname/table-member_auth/rid/0', 'plus'),
			)),
		));
		$this->template->display('auth_edit.html');
	}

	// 更新操作
	public function _update_data($id, $data, $_data) {

		$my = $this->input->post('my', true);
		$data['status'] = $my['status'];
		$data['note'] = $my['note'];
		if ($my['status']) {
			$data['euid'] = $this->uid;
			$data['editor'] = $this->member['username'];
			if ($_data['stauts'] != 3 || $_data['status'] != $my['status']) {
				$data['edittime'] = SYS_TIME;
			}
			if ($_data['status'] != $my['status']) {
				if ($my['status'] == 3) {
					// 认证成功通知
					$this->member_model->sendsms($data['auth_phone'], fc_lang('您的账号【%s】实名认证成功', $_data['username']));
					$this->db->where('uid', $id)->update('member_data', array(
						'is_auth' => 1,
					));
					//认证后等级上升,经验变为200
					$this->db->where('uid', $id)->update('member', array(
						'experience' => 200,
					));
				} else {
					// 认证失败通知
					$this->member_model->sendsms($data['auth_phone'], fc_lang('您的账号【%s】实名认证未通过，请登录会员中心查看原因', $_data['username']));
					$this->db->where('uid', $id)->update('member_data', array(
						'is_auth' => 0,
					));
				}
			}
		}

		$this->mydb->where($this->myid, $id)->update($this->mytable, $data);
		$this->system_log('修改会员实名认证【'.$_data['username'].'】'); // 记录日志
	}
}
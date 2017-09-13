<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.5.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */
	
class Poster2 extends M_Controller {

    public $sid;
    public $type;
	public $link;
    public $table;
    public $space;
    public $field;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('poster_model');
		$this->sid = (int)$this->input->get('sid');
		$this->link = $this->site[SITE_ID];
		$this->type = $this->poster_model->get_space_type();
        $this->table = SITE_ID.'_poster';
        $this->space = $this->link->where('id', $this->sid)->get($this->table.'_space')->row_array();
        if (!$this->space) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }
        $this->field = array(
            'value_file' => array(
                'ismain' => 1,
                'fieldname' => 'value_file',
                'fieldtype' => 'File',
                'setting' => array(
                    'option' => array(
                        'ext' => 'jpg,gif,png,swf',
                        'size' => 10,
                    )
                )
            ),
        );
        $this->template->assign('menu', $this->get_menu(array(
            fc_lang('广告位管理') => 'adm/admin/poster/index',
            fc_lang('广告管理') => 'adm/admin/poster2/index/sid/'.$this->sid,
            fc_lang('添加') => 'adm/admin/poster2/add/sid/'.$this->sid,
        )));
        $this->template->assign('type', $this->type);
    }
	
	/**
     * 管理
     */
    public function index() {
	
		if (IS_POST) {
			$ids = $this->input->post('ids', TRUE);
			if (!$ids) {
                exit(dr_json(0, fc_lang('您还没有选择呢')));
            }
			if (!$this->is_auth('adm/admin/poster2/del')) {
                exit(dr_json(0, fc_lang('您无权限操作')));
            }
            $this->poster_model->delete('id IN('.@implode(',', $ids).')');
            $this->system_log('删除广告【#'.@implode(',', $ids).'】'); // 记录日志
			exit(dr_json(1, fc_lang('操作成功，正在刷新...')));
		}

        $data = array();
        $page = max(1, (int)$_GET['page']);
        $total = $_GET['total'] ? $_GET['total'] : $this->link->where('sid', $this->sid)->count_all_results($this->table);
        $order = isset($_GET['order']) && strpos($_GET['order'], "undefined") !== 0 ? $_GET['order'] : 'id DESC';

        if ($total) {
            $data = $this->link
                         ->where('sid', $this->sid)
                         ->order_by($order)
                         ->limit(SITE_ADMIN_PAGESIZE, SITE_ADMIN_PAGESIZE * ($page - 1))
                         ->get($this->table)
                         ->result_array();
        }

        $param = array(
            'sid' => $this->sid,
            'total' => $total,
            'order' => $order,
        );

        $this->template->assign(array(
            'sid' => $this->sid,
            'list' => $data,
            'type' => $this->type,
            'total' => $param['total'],
            'pages'	=> $this->get_pagination(dr_url('adm/poster2/index', $param), $param['total']),
        ));
		$this->template->display('poster2_index.html');
    }
	
	/**
     * 添加
     */
    public function add() {
	
		if (IS_POST) {
            $post = array(
                'name' => $_POST['name'],
                'status' => $_POST['data']['status'],
                'starttime' => $_POST['data']['starttime'],
                'endtime' => $_POST['data']['endtime'],
                'uid' => $this->member['uid'],
                'username' => $this->member['username'],
                'inputtime' => SYS_TIME,
                'sid' => $this->sid,
                'clicks' => 0,
                'displayorder' => 0,
            );
            if (empty($post['name'])) {
                $this->admin_msg('Name is NULL');
            }
            $file = $this->validate_filter($this->field);
            $file = isset($file[1]['value_file']) ? $file[1]['value_file'] : '';
            $value = array(
                'url' => $_POST['value_url'],
                'file' => $file,
                'text' => $_POST['value_text'],
                'code' => $_POST['data']['value_code'],
                'color' => $_POST['data']['value_color'],
            );
            $post['value'] = dr_array2string($value);
			$this->link->insert($this->table, $post);
            $id = $this->link->insert_id();
            $this->link->where('id', $this->sid)->update($this->table.'_space', array(
                'items' => $this->space['items'] + 1
            ));
            $this->attachment_handle($this->uid, $this->db->dbprefix($this->table).'-'.$id, $this->field);
            $this->system_log('添加广告【#'.$id.'】'.$post['name']); // 记录日志
			$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('adm/poster2/index', array('sid' => $this->sid)), 1);
		}

		$this->template->assign(array(
            'name' => $this->space['name'],
            'type' => $this->space['type'],
			'data' => array(
                'starttime' => SYS_TIME,
                'status' => 1
            ),
            'field' => $this->field,
        ));
		$this->template->display('poster2_add.html');
    }

	/**
     * 修改
     */
    public function edit() {
	
		$id = (int)$this->input->get('id');
		$data = $this->link
					 ->where('id', $id)
					 ->limit(1)
					 ->get($this->table)
					 ->row_array();
		if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }
		
		if (IS_POST) {
            $post = array(
                'name' => $_POST['name'],
                'status' => $_POST['data']['status'],
                'starttime' => $_POST['data']['starttime'],
                'endtime' => $_POST['data']['endtime'],
            );
            if (empty($post['name'])) {
                $this->admin_msg('Name is NULL');
            }
            $file = $this->validate_filter($this->field);
            $file = isset($file[1]['value_file']) ? $file[1]['value_file'] : '';
            $value = array(
                'url' => $_POST['value_url'],
                'file' => $file,
                'text' => $_POST['value_text'],
                'code' => $_POST['data']['value_code'],
                'color' => $_POST['data']['value_color'],
            );
            $post['value'] = dr_array2string($value);
            $this->link->where('id', $id)->update($this->table, $post);
            $this->attachment_handle($this->uid, $this->db->dbprefix($this->table).'-'.$id, $this->field);
            $this->system_log('修改广告【#'.$id.'】'.$post['name']); // 记录日志
            $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('adm/poster2/index', array('sid' => $this->sid)), 1);
		}
		
		$this->template->assign(array(
            'data' => $data,
            'type' => $this->space['type'],
            'name' => $this->space['name'],
			'value' => dr_string2array($data['value']),
            'field' => $this->field,
        ));
		$this->template->display('poster2_add.html');
    }

}
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
	
class Poster extends M_Controller {

    public $type;
	public $link;
    public $table;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('poster_model');
		$this->template->assign('menu', $this->get_menu(array(
		    fc_lang('广告位管理') => 'adm/admin/poster/index',
		    fc_lang('添加') => 'adm/admin/poster/add_js',
            fc_lang('更新缓存') => 'adm/admin/poster/cache',
		)));
		$this->link = $this->site[SITE_ID];
		$this->type = $this->poster_model->get_space_type();
        $this->table = SITE_ID.'_poster_space';
        $this->template->assign('type', $this->type);
    }
	
	/**
     * 管理
     */
    public function index() {
	
		if (IS_POST) {
			$ids = $this->input->post('ids');
			if (!$ids) {
                exit(dr_json(0, fc_lang('您还没有选择呢')));
            } elseif (!$this->is_auth('adm/admin/poster/del')) {
                exit(dr_json(0, fc_lang('您无权限操作')));
            }
            $this->link->where_in('id', $ids)->delete($this->table);
            $this->poster_model->delete('sid IN('.@implode(',', $ids).')');
            $this->system_log('删除广告位【#'.@implode(',', $ids).'】'); // 记录日志
            $this->cache(1);
			exit(dr_json(1, fc_lang('操作成功，正在刷新...')));
		}

        $data = array();
        $page = max(1, (int)$_GET['page']);
        $total = $_GET['total'] ? $_GET['total'] : $this->link->count_all_results($this->table);
        $order = isset($_GET['order']) && strpos($_GET['order'], "undefined") !== 0 ? $_GET['order'] : 'id DESC';

        if ($total) {
            $data = $this->link->order_by($order)->limit(SITE_ADMIN_PAGESIZE, SITE_ADMIN_PAGESIZE * ($page - 1))->get($this->table)->result_array();
        }

        $param = array(
            'total' => $total,
            'order' => $order,
        );

        $this->template->assign(array(
            'list' => $data,
            'type' => $this->type,
            'total' => $param['total'],
            'pages'	=> $this->get_pagination(dr_url('adm/poster/index', $param), $param['total']),
        ));
		$this->template->display('poster_index.html');
    }
	
	/**
     * 添加
     */
    public function add() {
	
		if (IS_POST) {
			$data = $this->input->post('data');
			$value = $this->input->post('value');
			if (empty($data['name'])) {
                exit(dr_json(0, '', 'name'));
            }
            $data['value'] = dr_array2string($value);
			$this->link->insert($this->table, $data);
            $this->system_log('添加广告位【#'.$this->link->insert_id().'】'.$data['name']); // 记录日志
			$this->cache(1);
			exit(dr_json(1, fc_lang('操作成功，正在刷新...'), ''));
		}

		$this->template->assign(array(
			'data' => array(
                'type' => 1,
                'status' => 1
            ),
            'value' => array(
                2 => array('center' => 1),
                4 => array('scroll' => 1),
            )
        ));
		$this->template->display('poster_add.html');
    }

	/**
     * 修改
     */
    public function edit() {
	
		$id = (int)$this->input->get('id');
		$data = $this->link->where('id', $id)->limit(1)->get($this->table)->row_array();
		if (!$data) {
            exit(fc_lang('对不起，数据被删除或者查询不存在'));
        }
		
		if (IS_POST) {
            $data = $this->input->post('data');
            $value = $this->input->post('value');
            if (empty($data['name'])) {
                exit(dr_json(0, '', 'name'));
            }
            $data['value'] = dr_array2string($value);
            $this->link->where('id', $id)->update($this->table, $data);
            $this->system_log('修改广告位【#'.$id.'】'.$data['name']); // 记录日志
            $this->cache(1);
            exit(dr_json(1, fc_lang('操作成功，正在刷新...'), ''));
		}
		
		$this->template->assign(array(
			'data' => $data,
			'value' => dr_string2array($data['value']),
        ));
		$this->template->display('poster_add.html');
    }

    // 调用代码
    public function code() {

        $id = (int)$this->input->get('id');

        $this->template->assign(array(
            'code1' => '{dr_poster('.$id.')}',
            'code2' => htmlentities('<script src="{SITE_URL}index.php?c=api&m=poster&id='.$id.'"></script>'),
        ));
        $this->template->display('poster_code.html');

    }
	
    /**
     * 缓存
     */
    public function cache($update = 0) {
		$this->poster_model->cache(isset($_GET['site']) && $_GET['site'] ? (int)$_GET['site'] : SITE_ID);
		((int)$_GET['admin'] || $update) or $this->admin_msg(fc_lang('操作成功，正在刷新...'), isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '', 1);
	}
}
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

class Cart extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * 购物车
     */
    public function index() {

		if (IS_AJAX || IS_POST) {
			$ids = $this->input->post('ids');
            if (!$ids) {
                $this->msg(lang('mod-047'));
            }
			// 购买页面地址
            $url = SITE_URL.'index.php?s='.APP_DIR.'&oid='.@implode('-', $ids);
            if (IS_AJAX) {
                exit(dr_json(1, $url));
            }
            // 跳转页面
            redirect($url, 'refresh');
            exit;
		} else {
			$this->template->assign(array(
				'meta_title' => $this->mconfig['config']['cart_title'] ? $this->mconfig['config']['cart_title'] : '我的购物车',
				'meta_keywords' => SITE_KEYWORDS,
				'meta_description' => SITE_DESCRIPTION,
			));
			$this->template->display('cart.html');
		}
    }
	
	// 删除购物车商品
	public function delete() {

        $table = $this->order_model->prefix.'cart_'.(int)substr((string)$this->uid, -1, 1);
        $data = $this->link->where('id', (int)$this->input->get('id'))->get($table)->row_array();
        if (!$data) {
            $this->return_jsonp(dr_json(0, lang('mod-026')));
        }

        if ($this->uid) {
            if ($this->uid != $data['uid']) {
                $this->return_jsonp(dr_json(0, lang('mod-035')));
            }
        } else {
            if ($this->agent != $data['agent']) {
                $this->return_jsonp(dr_json(0, lang('mod-035')));
            }
        }

        $this->link->where('id', $data['id'])->delete($table);

        $this->return_jsonp(dr_json(1, 'ok'));
    }

	// 删除购物车商品 All
	public function delete_all() {

        $ids = $this->input->post('ids');
        if (!$ids) {
            $this->return_jsonp(dr_json(0, lang('mod-036')));
        }
        $_ids = array();
        foreach ($ids as $t) {
            if (intval($t)) {
                $_ids[] = (int)$t;
            }
        }
        if (!$_ids) {
            $this->return_jsonp(dr_json(0, lang('mod-036')));
        }

        $table = $this->order_model->prefix.'cart_'.(int)substr((string)$this->uid, -1, 1);
        $data_all = $this->link->where_in('id', $_ids)->get($table)->result_array();
        if (!$data_all) {
            $this->return_jsonp(dr_json(0, lang('mod-026')));
        }

        $delete = array();
        foreach ($data_all as $data) {
            if ($this->uid) {
                if ($this->uid != $data['uid']) {
                    $this->return_jsonp(dr_json(0, lang('mod-035')));
                }
            } else {
                if ($this->agent != $data['agent']) {
                    $this->return_jsonp(dr_json(0, lang('mod-035')));
                }
            }
            $delete[] = $data['id'];
        }

        $this->link->where_in('id', $delete)->delete($table);

        $this->return_jsonp(dr_json(1, 'ok'));
    }

	// 更新商品数量
	public function update_num() {

		$id = (int)$this->input->get('id');
		$num = max(1, (int)$this->input->get('num'));

        // 购物车数据
		$data = $this->order_model->get_cart_row($this->uid, $id);
		if (!$data) {
            $this->return_jsonp(dr_json(0, lang('mod-026')));
		}

        // 检测商品数据
        $data['quantity'] = $num;
        $error = $this->order_model->get_goods($data);
        if (!is_array($error)) {
            return $this->return_jsonp(dr_json(0, $error));
        }

		// 更新入库
		$this->link->where('id', $id)->update($this->order_model->prefix.'cart_'.(int)substr((string)$this->uid, -1, 1), array(
			'quantity' => $num,
		));

        $this->return_jsonp(dr_json(1, 'ok'));
		
	}
	
	// 动态获取订单列表数据
	public function ajax_data() {

        ob_start();
		list($list, $total, $url) = $this->order_model->get_cart($this->uid, $this->agent);
		$this->template->assign(array(
			'order_url' => $url,
			'order_list' => $list,
			'order_total' => $total,
		));
		$this->template->display('cart_data.html');
        $html = ob_get_contents();
        ob_clean();

        $this->return_jsonp(json_encode(array('html' => $html)));
	}
	
    /**
     * 购物车的商品数量
     */
    public function nums() {
		
		$this->return_jsonp(dr_json(1, $this->order_model->get_cart_nums($this->uid, $this->agent)));
	}
	
    /**
     * 添加购物车
     */
    public function add() {

        $cid = intval($this->input->get('cid'));
		$mid = dr_safe_replace($this->input->get('mid'));
		$quantity = max(1, intval($this->input->get('num')));
		$specification = dr_safe_replace($this->input->get('spec'));

        // 添加的数据格式
        $add = array(
            'mid' => $mid,
            'cid' => $cid,
            'uid' => $this->uid,
            'agent' => $this->agent,
            'quantity' => $quantity,
            'specification' => $specification,
        );

        // 验证模块数据
        $data = $this->order_model->get_goods($add);
        if (!is_array($data)) {
            echo $this->input->get('callback', TRUE).'('.dr_json(0, $data).')';exit;
        }

        if ($data['uid'] == $this->uid) {
            echo $this->input->get('callback', TRUE).'('.dr_json(0, lang('mod-068')).')';exit;
        }

        $add['sell'] = $data['uid'];

		// 添加购物车
		$num = $this->order_model->add_cart($add);
		echo $this->input->get('callback', TRUE).'('.dr_json(1, $num).')';exit;
    }


}
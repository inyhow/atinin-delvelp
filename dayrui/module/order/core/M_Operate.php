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

class M_Operate extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('order_model');
    }

    /**
     * 价格修改
     */
    public function price() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info_row($id);
        if (!$data) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-055'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-055'));
            $this->template->display('operate_price.html');exit;
        }

        // 权限验证
        if (!IS_ADMIN && $data['sell_uid'] != $this->uid) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-056'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-056'));
            $this->template->display('operate_price.html');exit;
        }

        // 验证支付状态权限
        if (in_array($data['pay_status'], array(1,2,3))) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-056'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-056'));
            $this->template->display('operate_price.html');exit;
        } elseif ($data['pay_status'] == 4) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-059'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-059'));
            $this->template->display('operate_price.html');exit;
        }

        if ($this->input->get('submit')) {
            // 提交后
            $old = $data['order_price'];
            $data['order_price'] = $price = abs($this->input->post('price'));
            $this->link->where('id', $id)->update(SITE_ID.'_order', array('order_price' => $price));
            $this->order_model->log($data, dr_lang('mod-060', number_format($old, 2), number_format($price, 2)));
            // 修改价格提醒买家
            $this->order_model->notice(4, $data, $data['buy_uid']);
            echo $this->callback_json(array(
                'msg' => 'ok',
                'code' => 1
            ));exit;
        } else {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => 'ok',
                    'code' => $data
                ));exit;
            }
            $this->template->assign(array(
                'order' => $data,
                'order_error' => ''
            ));
            $this->template->display('operate_price.html');exit;
        }
    }


    /**
     * 确认收货
     */
    public function shouhuo() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info_row($id);
        if (!$data) {
            echo $this->callback_json(array(
                'msg' => lang('mod-055'),
                'code' => 0
            ));exit;
        }

        // 权限验证
        if (!IS_ADMIN && $data['buy_uid'] != $this->uid) {
            echo $this->callback_json(array(
                'msg' => lang('mod-056'),
                'code' => 0
            ));exit;
        }

        // 验证订单状态权限
        if ($data['order_status'] != 4) {
            echo $this->callback_json(array(
                'msg' => lang('mod-063'),
                'code' => 0
            ));exit;
        }

        $this->order_model->shouhuo($data);
        echo $this->callback_json(array(
            'msg' => 'ok',
            'code' => 1
        ));exit;
    }

    /**
     * 确认到账（必须要后台执行）
     */
    public function daozhang() {

        $id = (int)$this->input->get('id');

        $data = $this->order_model->get_info_row($id);
        if (!$data) {
            echo $this->callback_json(array(
                'msg' => lang('mod-055'),
                'code' => 0
            ));exit;
        }

        // 权限验证
        if (!IS_ADMIN) {
            echo $this->callback_json(array(
                'msg' => lang('mod-056'),
                'code' => 0
            ));exit;
        }

        // 验证订单状态权限
        if ($data['order_status'] != 6) {
            echo $this->callback_json(array(
                'msg' => lang('mod-063'),
                'code' => 0
            ));exit;
        }

        $this->order_model->daozhang($data);
        echo $this->callback_json(array(
            'msg' => 'ok',
            'code' => 1
        ));exit;
    }

    /**
     * 保存备注
     */
    public function save_note() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info_row($id);
        if (!$data) {
            echo $this->callback_json(array(
                'msg' => lang('mod-055'),
                'code' => 0
            ));exit;
        }

        // 权限验证
        if (!IS_ADMIN && $data['sell_uid'] != $this->uid) {
            echo $this->callback_json(array(
                'msg' => lang('mod-056'),
                'code' => 0
            ));exit;
        }

        $note = $this->input->post('note');
        $this->link->where('id', $id)->update($this->order_model->prefix.'data_'.$data['tableid'], array(
            'sell_note' => $note,
        ));
        echo $this->callback_json(array(
            'msg' => $note,
            'code' => 1
        ));exit;
    }

    /**
     * 商家发货
     */
    public function shipping() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info($id);
        if (!$data) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-055'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-055'));
            $this->template->display('operate_shipping.html');exit;
        }

        // 权限验证
        if (!IS_ADMIN && $data['sell_uid'] != $this->uid) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-056'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-056'));
            $this->template->display('operate_shipping.html');exit;
        }

        // 验证订单状态权限
        if ($data['order_status'] != 2) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-063'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-063'));
            $this->template->display('operate_shipping.html');exit;
        }

        $kd = require APPPATH.'libraries/Kd.php'; // 快递配置文件

        if ($this->input->get('submit')) {
            // 提交后
            $post = $this->input->post('data');
            $post['name'] = isset($kd[$post['type']]) ? $kd[$post['type']] : '无';
            $this->order_model->shopping($data, $post);
            echo $this->callback_json(array(
                'msg' => 'ok',
                'code' => 1
            ));exit;
        } else {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => 'ok',
                    'code' => $data
                ));exit;
            }
            $this->template->assign(array(
                'kd' => $kd,
                'order' => $data,
                'order_error' => ''
            ));
            $this->template->display('operate_shipping.html');exit;
        }
    }

    /**
     * 关闭订单
     */
    public function close() {

        $id = (int)$this->input->get('id');
        $data = $this->order_model->get_info_row($id);
        if (!$data) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-055'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-055'));
            $this->template->display('operate_shipping.html');exit;
        }

        // 权限验证
        if (!IS_ADMIN && $data['buy_uid'] != $this->uid) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-056'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-056'));
            $this->template->display('operate_shipping.html');exit;
        }

        // 验证订单状态权限
        if ($data['order_status'] != 1) {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-063'),
                    'code' => 0
                ));exit;
            }
            $this->template->assign('order_error', lang('mod-063'));
            $this->template->display('operate_shipping.html');exit;
        }

        if ($this->input->get('submit')) {
            // 提交后
            $post = $this->input->post('data');
            if (empty($post)) {
                echo $this->callback_json(array(
                    'msg' => lang('mod-124'),
                    'code' => 0
                ));exit;
            }
            $this->order_model->close($data, $post);
            echo $this->callback_json(array(
                'msg' => 'ok',
                'code' => 1
            ));exit;
        } else {
            if (IS_AJAX) {
                echo $this->callback_json(array(
                    'msg' => 'ok',
                    'code' => $data
                ));exit;
            }
            $this->template->assign(array(
                'order' => $data,
                'option' => @explode(PHP_EOL, $this->mconfig['config']['close']),
                'order_error' => ''
            ));
            $this->template->display('operate_close.html');exit;
        }
    }

}
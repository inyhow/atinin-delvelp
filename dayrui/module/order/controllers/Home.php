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
     * 计算运费和总价
     */
    public function price() {

        $data = $this->input->post('data');
        if (!$data) {
            echo dr_json(0, lang('mod-050'));exit;
        }

        $is_shopping = intval($this->input->get('is_shopping'));
        if ($is_shopping) {
            $city = intval($this->input->get('city'));
            if (!$city || !dr_linkage('address', $city)) {
                echo dr_json(0, lang('mod-049'));exit;
            }
        } else {
            $city = -1;
        }


        list($score, $price, $info) = $this->order_model->get_price($city, $data);

        echo json_encode(array('status' => 1, 'price' => number_format($price, 2), 'score' => intval($score), 'info' => $info));
        exit;
    }


    /**
     * 下订单
     */
    public function index() {

        // 使用订单权限判断
        if (!@in_array($this->groupid, $this->mconfig['permission']['buy']['use'])) {
            if ($this->groupid) {
                $this->msg(lang('mod-040'));
            } else {
                $this->msg(lang('mod-041'), dr_member_url('login/index'), 3, 2);
            }
        }

        // 来自商品页
        $mid = dr_safe_replace($this->input->get('mid', TRUE));
        $cid = intval($this->input->get('cid'));
        $num = max(1, intval($this->input->get('num')));
        $spec = dr_safe_replace($this->input->get('spec', TRUE));

        // 来自购物车
        $oids = dr_safe_replace($this->input->get('oid', TRUE));

        // 接收参数判断
        if (!$oids && (!$mid || !$cid || !$num)) {
            $this->msg(lang('mod-037'));
        }

        $is_shipping = 0; // 是否使用物流

        // 模块验证
        if ($oids) {
            // 购物车id筛选
            $ids = array();
            $oids = @explode('-', $oids);
            foreach ($oids as $id) {
                if (intval($id)) {
                    $ids[] = intval($id);
                }
            }
            if (!$ids) {
                $this->msg(lang('mod-047'));
            } elseif (!$this->uid) {
                $this->link->where('agent', $this->agent);
            }
            $data = $this->link->where_in('id', $ids)->get(SITE_ID.'_order_cart_'.(int)substr((string)$this->uid, -1, 1))->result_array();
            if (!$data) {
                $this->msg(lang('mod-048'));
            }
            foreach ($data as $t) {
                if (!isset($this->mconfig['module'][$t['mid']])
                    || !$this->mconfig['module'][$t['mid']]['use']) {
                    $this->msg(dr_lang('mod-023', $t['mid'])); // 未开启电商功能
                }
                // 物流验证
                if ($this->mconfig['module'][$t['mid']]['shipping']) {
                    $is_shipping = 1;
                }
            }
        } else {
            // 直接购买
            if (!isset($this->mconfig['module'][$mid])
                || !$this->mconfig['module'][$mid]['use']) {
                $this->msg(dr_lang('mod-023', $mid)); // 未开启电商功能
            }
            // 物流验证
            if ($this->mconfig['module'][$mid]['shipping']) {
                $is_shipping = 1;
            }
            // 组装订单信息
            $data = array(
                array(
                    'mid' => $mid,
                    'cid' => $cid,
                    'quantity' => $num,
                    'specification' => $spec,
                ),
            );
        }

        // 获取商品详情并按组归类
        list($list, $a) = $this->order_model->get_goods_info($data, 1);

        // 无可用商品
        if (!$list) {
            $this->msg(lang('mod-048'));
        }

        foreach ($list as $t) {
            if ($t['uid'] == $this->uid) {
                $this->msg(lang('mod-068'));
            }
        }

        // 判断商品中是否存在不支持货到付款的商品和银行转账商品
        $df = $zz = 1;
        if ($this->order_model->item) {
            foreach ($this->order_model->item as $i => $t) {
                list($dir, $id) = explode('-', $i);
                $cat = dr_cat_value($dir, $t['catid']);
                if (!isset($cat['order_df']) || $cat['order_df'] == 0) {
                    $df = 0; // 排除货到付款
                }
                if ($t['order_score']) {
                    $zz = 0; // 排除银行转账
                }
            }
        }

        // 付款方式选择
        $pay_type = array();
        $pay_type_value = 0;
        if ($this->mconfig['paytype']) {
            foreach ($this->mconfig['paytype'] as $t) {
                if ($t['id'] == 1 && $t['use'] && !$df) {
                    // 判断货到付款是否可用
                    continue;
                } elseif ($t['id'] == 3 && $t['use'] && !$zz) {
                    // 判断银行转账是否可用
                    continue;
                }
                if ($t['use']) {
                    $pay_type[$t['id']] = $t;
                    if (!$pay_type_value) {
                        $pay_type_value = $t['id'];
                    }
                }
            }
            if (isset($pay_type[2])) {
                $pay_type_value = 2;
            }
        }

        $this->load->library('Dfield', array(APP_DIR));
        $field = $this->get_cache('module-'.SITE_ID.'-order', 'field');

        if (IS_POST) {
            // 提交订单处理
            $post = $this->input->post('data');
            if (!isset($pay_type[$post['pay_type']]) || !$pay_type[$post['pay_type']]) {
                $this->msg(lang('mod-051'));
            }
            $is_shipping = 0;
            //print_r($is_shipping);exit;
            if ($is_shipping) {
                $city = $post['shipping_city'];
                if (!$city || !dr_linkage('address', $city)) {
                    $this->msg(lang('mod-049'));
                }
            } else {
                //$city = -1;
            }

            // 计算后的价格
            list($score, $price, $info) = $this->order_model->get_price($city, $list);

            // 订单入库
            $i = 0;
            $order_id = array();
            foreach ($list as $u => $store) {
                $order = array(0 => array(), 1 => array());
                // 随机订单编号
                mt_srand((double) microtime() * 1000000);
                $order[1]['sn'] = $this->mconfig['config']['sn'].date('Ymd').str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT).$i;
                $order[1]['mid'] = $store['mid'];
                $order[1]['buy_uid'] = $order[0]['buy_uid'] = $this->uid;
                $order[1]['buy_username'] = $this->member['username'] ? $this->member['username'] : 'guest';
                $order[1]['buy_step'] = (int)$store['buy_step'];
                $order[1]['sell_uid'] = $order[0]['sell_uid'] = $store['uid'];
                $order[1]['sell_username'] = $store['username'];
                $order[1]['order_time'] = SYS_TIME;
                $order[1]['order_status'] = 1;
                $order[1]['order_youhui'] = 0;
                $order[1]['order_score'] = $store['order_score'];
                $order[1]['order_price'] = $store['order_score'] ? $info[$u]['_score'] : $info[$u]['_price'];
                $order[1]['order_comment'] = 0;
                $order[1]['pay_type'] = $post['pay_type'];
                $order[1]['pay_id'] = 0;
                $order[1]['pay_status'] = 0;
                $order[1]['pay_time'] = 0;
                $order[1]['shipping_time'] = 0;
                $order[1]['shipping_stime'] = 0;
                $order[1]['shipping_status'] = 0;
                $order[1]['shipping_price'] = $info[$u]['_yunfei'];
                $order[1]['tableid'] = 0;
                $order[0]['buy_note'] = $post[$u]['buy_note'];
                $order[0]['shipping_sn'] = '';
                $order[0]['shipping_type'] = '';
                $order[0]['shipping_city'] = dr_linkagepos('address', $city, '', '');
                $order[1]['shipping_name'] = $post['shipping_name'] ? $post['shipping_name'] : '';
                $order[1]['shipping_phone'] = $post['shipping_phone'] ? $post['shipping_phone'] : '';
                $order[0]['shipping_zipcode'] = $post['shipping_zipcode'] ? $post['shipping_zipcode'] : '';
                $order[0]['shipping_address'] = $post['shipping_address'] ? $post['shipping_address'] : '';
                if ($field) {
                    $this->data = array();
                    foreach ($field as $ff) {
                        $this->data[$ff['ismain']][$ff['fieldname']] = $order[$ff['ismain']][$ff['fieldname']] = $post[$u][$ff['fieldname']];
                    }
                }
                // 订单入库
                $table = $this->db->dbprefix(SITE_ID.'_order');
                $this->link->insert($table, $order[1]);
                $order_id[] = $order[0]['id'] = $order[1]['id'] = $oid = $this->link->insert_id();
                $tableid = floor($oid / 50000); // 老规矩，5w分表
                if (!$this->link->query("SHOW TABLES LIKE '".$table.'_data_'.$tableid."'")->row_array() && (D_MARK || $this->mark)) {
                    // 附表不存在时创建附表
                    $sql = $this->link->query("SHOW CREATE TABLE `{$table}_data_0`")->row_array();
                    $this->link->query(str_replace(
                        array($sql['Table'], 'CREATE TABLE '),
                        array($table.'_data_'.$tableid, 'CREATE TABLE IF NOT EXISTS '),
                        $sql['Create Table']
                    ));
                }
                // 入库附表
                $this->link->replace($table.'_data_'.$tableid, $order[0]);
                // 下单通知卖家
                $this->order_model->notice(1, $order[1], 0, $order[1]['sell_uid']);
                foreach ($store['goods'] as $t) {
                    // 入库商品表
                    $this->link->insert($table.'_goods', array(
                        'oid' => $oid,
                        'mid' => $t['mid'],
                        'cid' => $t['cid'],
                        'title' => $t['title'],
                        'catid' => $t['catid'],
                        'thumb' => is_array($t['thumb']) ? ($t['thumb'][0] ? $t['thumb'][0] : '') : $t['thumb'],
                        'url' => $t['url'],
                        'specification' => $t['specification'],
                        'quantity' => (int)$t['quantity'],
                        'sn' => $t['sn'] ? $t['sn'] : '',
                        'sku' => dr_array2string($t['sku']),
                        'price' => $t['price'],
                        'order_price' => $t['order_price'],
                    ));
                    // 删除对应的购物车商品
                    if (isset($t['id']) && $t['id']) {
                        if (!$this->uid) {
                            $this->link->where('agent', $this->agent);
                        }
                        $this->link->where('uid', $this->uid)->delete(SITE_ID.'_order_cart_'.(int)substr((string)$this->uid, -1, 1));
                    }
                }
                // 附件归表
                if ($field) {
                    $this->attachment_handle($this->uid, $this->db->dbprefix.SITE_ID.'_order-'.$oid, $field);
                }
                $i++;
            }
            $url = dr_url('order/buy/index', array('id'=> implode('-', $order_id)));
            redirect($url, 'refresh');
            exit;
        }

        $this->template->assign(array(
            'myfield' => $this->new_field_input($field),
            'is_guest' => !$this->uid,
            'pay_type' => $pay_type,
            'pay_value' => $pay_type_value,
            'order_list' => $list,
            'meta_title' => $this->mconfig['config']['order_title'] ? $this->mconfig['config']['order_title'] : '订单结算',
            'is_shipping' => $is_shipping,
            'meta_keywords' => SITE_KEYWORDS,
            'meta_description' => SITE_DESCRIPTION,
        ));
        $this->template->display('order.html');
    }


}
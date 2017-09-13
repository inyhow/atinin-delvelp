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


/**
 * 订单状态
 *
 * 支付状态
 *
 * 物流状态
 * */
function dr_order_status($order) {
	
	$status = array();

	// 订单状态
	switch($order['order_status']) {
		case 0:
			$status[0] = lang('code-00');
			break;
		case 1:
			$status[0] = lang('code-01');
			break;
		case 2:
			$status[0] = lang('code-02');
			break;
		case 3:
			$status[0] = lang('code-03');
			break;
		case 4:
			$status[0] = lang('code-04');
			break;
		case 5:
			$status[0] = lang('code-05');
            break;
		case 6:
			$status[0] = lang('code-06');
			break;
		case 7:
			$status[0] = lang('code-07');
			break;
		case 8:
			$status[0] = lang('code-08');
            break;
		case 9:
			$status[0] = lang('code-09');
			break;
	}

    // 支付状态
	switch($order['pay_status']) {
		case 0:
			$status[1] = lang('code-10');
			break;
		case 1:
			$status[1] = lang('code-11');
			break;
		case 2:
			$status[1] = lang('code-12');
			break;
		case 3:
			$status[1] = lang('code-13');
            break;
		case 4:
			$status[1] = lang('code-14');
			break;
	}

    // 物流状态
	switch($order['shipping_status']) {
		case 0:
			$status[2] = lang('code-20');
			break;
		case 1:
			$status[2] = lang('code-21');
			break;
		case 2:
			$status[2] = lang('code-22');
			break;
		case 3:
			$status[2] = lang('code-23');
			break;
		case 4:
			$status[2] = lang('code-24');
			break;
		case 5:
			$status[2] = lang('code-25');
			break;
	}

    // 根据订单购买流程
    if (intval($order['buy_step']) == 2) {
        unset($status[2]);
    }
	
	return implode(' , ', $status);
}

// 订单操作状态
function dr_order_member_status($i) {

    // 订单状态
    switch($i) {
        case 0:
            $code = '<font color="red">'.lang('code-00').'</font>';
            break;
        case 1:
            $code = '<font color="blue">'.lang('code-01').'</font>';
            break;
        case 2:
            $code = '<font color="blue">'.lang('code-02').'</font>';
            break;
        case 3:
            $code = '<font color="green">'.lang('code-03').'</font>';
            break;
        case 4:
            $code = '<font color="blue">'.lang('code-04').'</font>';
            break;
        case 5:
            $code = '<font color="red">'.lang('code-05').'</font>';
            break;
        case 7:
            $code = '<font color="red">'.lang('code-07').'</font>';
            break;
        case 8:
            $code = '<font color="red">'.lang('code-08').'</font>';
            break;
        case 9:
            $code = '<font color="blue">'.lang('code-09').'</font>';
            break;
        default:
            $code = $i;
            break;
    }

    return $code;
}

// 订单操作
function dr_order_member_option($uid, $order) {

    $code = '';
    // 订单状态
    switch($order['order_status']) {
        case 0:
            # 失效订单
            $code.= '<p><a href="javascript:;" class="btn red-mint btn-xs"> <i class="fa fa-frown-o"></i> '.lang('code-00').'</a></p>';
            break;
        case 1:
            # 已下单
            if ($uid == $order['buy_uid']) {
                # 买家
                if ($order['pay_status'] == 0) {
                    # 未付款
                    $code.= '<p><a href="'.SITE_URL.'index.php?s='.APP_DIR.'&c=buy&id='.$order['id'].'" class="btn green btn-xs" target="_blank"> <i class="fa fa-paypal"></i> '.lang('mod-087').'</a></p>';
                }
                $code.= '<p><a href="javascript:;" onclick="dr_order_close('.$order['id'].')" class="btn red-mint btn-xs"> <i class="fa fa-trash-o"></i> '.lang('mod-088').'</a></p>';
            } else {
                # 商家
                if ($order['pay_status'] == 0) {
                    # 未付款
                    $code.= '<p><a href="javascript:;" class="btn red-mint btn-xs"> <i class="fa fa-frown-o"></i> '.lang('mod-089').'</a></p>';
                    $code.= '<p><a href="javascript:;" class="btn green btn-xs" onclick="dr_order_price('.$order['id'].')"> <i class="fa fa-edit"></i> '.lang('mod-090').'</a></p>';
                }
                if (IS_ADMIN) {
                    $code.= '<p><a href="javascript:;" class="btn red-mint btn-xs" onclick="dr_order_close('.$order['id'].')"> <i class="fa fa-frown-o"></i> '.lang('mod-088').'</a></p>';
                }
            }
            break;
        case 2:
            # 配货中
            if ($uid == $order['buy_uid']) {
                # 买家
                $code.= '<p><a href="javascript:;" class="btn green btn-xs"> <i class="fa fa-truck"></i> '.lang('mod-091').'</a></p>';
            } else {
                # 商家
                $code.= '<p><a href="javascript:;" onclick="dr_order_shipping('.$order['id'].')" class="btn green btn-xs"> <i class="fa fa-truck"></i> '.lang('mod-092').'</a></p>';

            }
           // $code.= '<p><a href="javascript:;" onclick="dr_order_tuikuan('.$order['id'].')">退款</a></p>';
            break;
        case 3:
            # 交易完成
            if ($uid == $order['buy_uid']) {
                # 买家
                $code.= '<p><a href="javascript:;" class="btn green btn-xs"> <i class="fa fa-check-circle"></i> '.lang('code-03').'</a></p>';
            } else {
                # 商家
                $code.= '<p><a href="javascript:;" class="btn green btn-xs"> <i class="fa fa-check-circle"></i> '.lang('code-03').'</a></p>';
            }
            break;
        case 4:
            # 待收货
            if (IS_ADMIN || $uid == $order['buy_uid']) {
                # 买家
                $code.= '<p><a href="javascript:;" onclick="dr_order_shouhuo('.$order['id'].')" class="btn green btn-xs"> <i class="fa fa-paper-plane"></i> '.lang('mod-093').'</a></p>';
            } else {
                # 商家
                $code.= '<a href="javascript:;" class="btn green btn-xs"> <i class="fa fa-paper-plane"></i> '.lang('mod-094').'</a>';
            }
            break;
        case 5:
            # 卖家缺货
            if ($uid == $order['buy_uid']) {
                # 买家
            } else {
                # 商家
            }
            break;
        case 6:
            # 银行转账中
            if ($uid == $order['buy_uid']) {
                # 买家
                $code.= '<p><a href="javascript:;" class="btn blue btn-xs"> <i class="fa fa-rmb"></i> '.lang('mod-122').'</a></p>';
            } else {
                # 商家
                $code.= '<p><a href="javascript:;" class="btn blue btn-xs"> <i class="fa fa-rmb"></i> '.lang('mod-135').'</a></p>';
            }
            break;
        case 7:
            # 退货
            if ($uid == $order['buy_uid']) {
                # 买家
            } else {
                # 商家
            }
            break;
        case 8:
            # 退款
            if ($uid == $order['buy_uid']) {
                # 买家
            } else {
                # 商家
            }
            break;
        case 9:
            # 交易关闭
            $code.= '<p><a href="javascript:;" class="btn red-mint btn-xs"> <i class="fa fa-frown-o"></i> '.lang('code-09').'</a></p>';
            break;

    }

    return $code;
}

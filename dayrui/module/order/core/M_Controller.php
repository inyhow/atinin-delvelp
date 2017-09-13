<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/order/core/M_Controller.php
 */

require_once FCPATH.'dayrui/core/D_Common.php';

class M_Controller extends D_Common {

    public $dir;
    public $link; // 当前模块数据库对象
    public $mconfig; // 当前模块的配置信息
    public $groupid; // 会员组id
    public $agent; // 客户端认证码

    /**
     * 模块初始化
     */
    public function __construct() {
        parent::__construct();
        // 检查模块
        $module = $this->get_cache('module-'.SITE_ID.'-'.APP_DIR);
        $this->dir = APP_DIR;
		// 模块缓存不存在时
        if (!$module) {
            $data = $this->db->where('dirname', APP_DIR)->get('module')->row_array();
            if ($data) {
                if ($data['disabled']) {
                    $this->admin_msg(fc_lang('当前模块【'.APP_DIR.'】已被系统禁用')); // 模块被禁用
                }
                // 尝试生成缓存数据
                $this->load->model('module_model');
                $this->module_model->cache(APP_DIR);
                $module = $this->get_cache('module-'.SITE_ID.'-'.APP_DIR);
                if (!$module) {
                    $this->admin_msg(fc_lang('模块不存在，请尝试更新缓存'));
                }
            } else {
                $this->admin_msg(fc_lang('模块尚未安装<br>请到后台-网站-模块管理-安装这个模块')); // 模块没有安装
            }
            unset($data);
        }
		
        $this->lang->load('module');
        $this->load->helper('order');
        $this->link = $this->site[SITE_ID];

        // 模块常量
        define('MOD_DIR', APP_DIR);
        define('MODULE_ID', $module['id']);
        define('MODULE_URL', $this->mobile ? SITE_URL.'index.php?s='.$this->dir : $module['url']);
        define('MODULE_NAME', $module['name']);
        define('MODULE_TITLE', $module['site'][SITE]['module_title']);
        define('MODULE_THEME_PATH', strpos($module['theme'], 'http://') === 0 ? trim($module['theme'], '/').'/' : THEME_PATH.($module['theme'] ? $module['theme'] : 'default').'/');

        // 设置模块模板
        $this->template->module($module['template']);

        $this->groupid = $this->uid ? $this->member['groupid'] : 0;
        $this->mconfig = isset($module['setting'][SITE_ID]) ? $module['setting'][SITE_ID] : $module['setting'];

        $this->load->model('order_model');
        $this->agent = md5($this->input->ip_address().$this->input->user_agent());

    }

    // msg
    public function order_msg($status, $msg) {

        if (IS_AJAX) {
            exit(dr_json($status, $msg));
        } else {
            $this->msg($msg);
        }
    }

    // 格式化商品
    protected function _format_info($list) {

        if ($list) {
            foreach ($list as $i => $t) {
                $list[$i]['goods'] = $this->link->where('oid', $t['id'])->get(SITE_ID.'_order_goods')->result_array();
                $list[$i]['goods_num'] = count($list[$i]['goods']);
                // 判断过期订单
                if ($this->order_model->clear($t)) {
                    $list[$i]['order_status'] = 0;
                }
            }
        }

        return $list;
    }

    // 获取快递信息
    public function _kd_info($name, $sn) {
        //103253 fe55a16163d94c3d9af269345df22716
        return dr_catcher_data("http://api.ickd.cn/?id=".$this->mconfig['config']['id']."&secret=".$this->mconfig['config']['key']."&com=".$name."&nu=".$sn."&type=html&encode=utf8&ord=desc");
    }



    // 后台搜索时
    protected function _admin_list($name, $status = 0, $transfer = 0) {

        if (IS_POST) {
            $_GET['page'] = $_GET['total'] = 0; // 重置页数和统计
        } else {
            $param['where'] = $where = (int)$this->input->get('where');
        }

        list($list, $param) = $this->order_model->limit_page($status, $transfer); // 分页查询

        $menu = array(
            $name => array('order/admin/'.$this->router->class.'/'.$this->router->method, 'shopping-cart')
        );

        $this->field = array(
            'sn' => array(
                'name' => lang('mod-000'),
                'fieldname' => 'sn',
            ),
            'title' => array(
                'name' => lang('mod-054'),
                'fieldname' => 'title',
            ),
            'cid' => array(
                'name' => lang('mod-134'),
                'fieldname' => 'cid',
            ),
            'buy_username' => array(
                'name' => lang('mod-001'),
                'fieldname' => 'buy_username',
            ),
            'sell_username' => array(
                'name' => lang('mod-002'),
                'fieldname' => 'sell_username',
            ),
            'shipping_name' => array(
                'name' => lang('mod-003'),
                'fieldname' => 'shipping_name',
            ),
            'shipping_phone' => array(
                'name' => lang('mod-004'),
                'fieldname' => 'shipping_phone',
            ),
            'id' => array(
                'name' => lang('mod-007'),
                'fieldname' => 'id',
            ),
        );

        // 可用模块
        $module = array();
        $result = $this->get_module(SITE_ID);
        if ($result) {
            foreach ($result as $t) {
                if (isset($this->mconfig['module'][$t['dirname']])
                    && $this->mconfig['module'][$t['dirname']]['use']) {
                    $module[] = $t;
                }
            }
        }

        $this->template->assign(array(
            'list' => $this->_format_info($list),
            'menu' => $this->get_menu_v3($menu),
            'param' => $param,
            'field' => $this->field,
            'pages'	=> $this->get_pagination(dr_url('order/'.$this->router->class.'/'.$this->router->method, $param), $param['total']),
            'module' => $module,
            'paytype' => $this->mconfig['paytype'],
        ));
        $this->template->display('order_index.html');
    }
}

// 兼容判断
if (!function_exists('dr_store_url')) {
    function dr_store_url($uid) {
        return dr_space_url($uid);
    }
}

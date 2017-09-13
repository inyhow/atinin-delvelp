<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');


class Transfer extends M_Controller {

    public function __construct() {
        parent::__construct();
        $this->field = array(
            'bank_note' => array(
                'ismain' => 1,
                'fieldname' => 'thumb',
                'fieldtype' => 'File',
                'setting' => array(
                    'option' => array(
                        'ext' => 'jpg,gif,png',
                        'size' => 10,
                    )
                )
            ),
        );
    }

    /**
     * 转账受理主页
     */
    public function index() {
        $this->_admin_list(lang('mod-137'), 0, 1);
    }

    /**
     * 录入转账信息方法
     */
    public function info() {

        $id = (int)$this->input->get('id');
        $order = $this->order_model->get_info($id);
        if (!$order) {
            $this->admin_msg(lang('mod-055'), $_SERVER['HTTP_REFERER']);
        } else if ($order['pay_type'] != 3) {
            $this->admin_msg(lang('mod-141'), $_SERVER['HTTP_REFERER']);
        }

        $data = $this->link->where('oid', $id)->get(SITE_ID.'_order_transfer')->row_array();

        if (IS_POST) {
            $this->validate_filter($this->field);
            $post = $this->input->post('data');
            if(!$post['note'] || !$post['bank_name'] || !$post['bank_sn']) {
                $this->admin_msg(lang('mod-139'));
            }
            $post['oid'] = $order['id'];
            $post['uid'] = $this->uid;
            $post['buy_uid'] = $order['buy_uid'];
            $post['sell_uid'] = $order['sell_uid'];
            $post['username'] = $this->member['username'];
            $post['inputtime'] = SYS_TIME;
            if (!$data) {
                // 新增记录
                $this->link->insert(SITE_ID.'_order_transfer', $post);
                $data['id'] = $this->link->insert_id();
                $this->order_model->daozhang($order); // 录入之后自动到账
            } else {
                // 更新记录
                $this->link->where('id', $data['id'])->update(SITE_ID.'_order_transfer', $post);
            }
            $this->attachment_handle($this->uid, SITE_ID.'_order_transfer' .'-'.$data['id'], $this->field);
            $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('order/transfer/index'), 1);

        }

        $this->template->assign(
            array(
                'data' => $data,
                'menu' => $this->get_menu_v3(array(
                    lang('mod-137') => array('order/admin/transfer/index', 'shopping-cart'),
                    lang('mod-136') => array('order/admin/transfer/info/id/'.$id, 'rmb'),
                )),
                'order' => $order,
                'field' =>$this->field,
            )
        );
        $this->template->display('transfer_info.html');
    }

}
<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.5
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Register extends M_Controller {

	/**
	 * 构造函数
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * 注册
	 */
	public function index() {

		// 会员配置
		$MEMBER = $this->get_cache('MEMBER');

		// 来路认证
		$json = 0;
		$auth = $this->input->get('auth');
		if ($auth) {
			if ($auth != md5(SYS_KEY)) {
				exit($this->callback_json(array(
					'msg' => '授权认证码不正确',
					'code' => 0
				)));
			}
			if (!IS_POST) {
				echo $this->callback_json(array(
					'msg' => '请用POST方式提交',
					'code' => 0,
				));
				exit;
			}
			$json = 1;
			$MEMBER['setting']['regcode'] = 0;
		}

		$groupid1 = (int)$this->input->get('groupid');
		$groupid2 = $_POST['groupid'];
		$groupid = $groupid2?$groupid2:$groupid1;
		//print_r($groupid);exit;

		// 判断是否开启注册
		if (!$MEMBER['setting']['register']) {
			if ($json) {
				exit($this->callback_json(array(
					'msg' => fc_lang('站点已经关闭了会员注册'),
					'code' => 0
				)));
			}
			$this->member_msg(fc_lang('站点已经关闭了会员注册'));
		} elseif ($groupid && !$MEMBER['group'][$groupid]['allowregister']) {
			// 指定模型注册验证
			if ($json) {
				exit($this->callback_json(array(
					'msg' => fc_lang('此会员组模型系统不允许注册'),
					'code' => 0
				)));
			}
			$this->member_msg(fc_lang('此会员组模型系统不允许注册'));
		} elseif ($this->member && !$json) {
			// 已经登录不允许注册
			$this->member_msg(fc_lang('您已经登录了，不能注册'));
		}

		session_start();

		if (IS_POST) {
			$data = $this->input->post('data', TRUE);
			$back_url = $_POST['back'] ? urldecode($this->input->post('back')) : '';
			if (!$json && $MEMBER['setting']['regcode'] && !$this->check_captcha('code')) {
				//$error = array('name' => 'code', 'msg' => fc_lang('验证码不正确'));
			} elseif($_SESSION['phone_code'] != $data['phone_code']) {
				//$error = array('name' => 'phone_code', 'msg' => fc_lang('短信验证码不正确'));
			} elseif (@in_array('username', $MEMBER['setting']['regfield'])
				&& $result = $this->is_username($data['username'])) {
				$error = array('name' => 'username', 'msg' => $result);
			} elseif (!$data['password']) {
				$error = array('name' => 'password', 'msg' => fc_lang('密码不能为空'));
			} elseif ($data['password'] !== $data['password2']) {
				$error = array('name' => 'password2', 'msg' => fc_lang('两次密码输入不一致'));
			} elseif (@in_array('email', $MEMBER['setting']['regfield'])
				&& $result = $this->is_email($data['email'])) {
				$error = array('name' => 'email', 'msg' => $result);
			} else {
				$this->hooks->call_hook('member_register_before', $data); // 注册之前挂钩点
				$id = $this->member_model->register($data, $groupid);
				if ($id > 0) {
					// 注册成功
					$data['uid'] = $id;
					$this->hooks->call_hook('member_register_after', $data); // 注册之后挂钩点
					// 注册后的登录
					$code = $this->member_model->login($id, $data['password'], $data['auto'] ? 8640000 : $MEMBER['setting']['loginexpire'], 0, 1);
					//if (strlen($code) > 3) {
					if ($code == 'ok') {
						$this->hooks->call_hook('member_login', $data); // 登录成功挂钩点
					}
					if ($json) {
						exit($this->callback_json(array(
							'msg' => 'ok',
							'code' => 1,
							'uid' => $id,
							'return' => dr_member_info($id)
						)));
					}
					$member = $this->db->select('password')->where('uid', $id)->get('member')->row_array();
					$expire = 86400;
			        $this->input->set_cookie('member_uid', $id, $expire);
			        $this->input->set_cookie('member_cookie', substr(md5(SYS_KEY.$member['password']), 5, 20), $expire);
					redirect(dr_member_url('account/index'));
					//$this->member_msg(fc_lang('注册成功').$code, $back_url && strpos($back_url, 'register') === FALSE ? $back_url : dr_member_url('home/index'), 1,0);
				} elseif ($id == -1) {
					$error = array('name' => 'username', 'msg' => fc_lang('该会员【%s】已经被注册', $data['username']));
				} elseif ($id == -2) {
					$error = array('name' => 'email', 'msg' => fc_lang('邮箱格式不正确'));
				} elseif ($id == -3) {
					$error = array('name' => 'email', 'msg' => fc_lang('该邮箱【%s】已经被注册', $data['email']));
				} elseif ($id == -4) {
					$error = array('name' => 'username', 'msg' => fc_lang('同一IP在限制时间内注册过多'));
				} elseif ($id == -5) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：会员名称不合法'));
				} elseif ($id == -6) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：包含不允许注册的词语'));
				} elseif ($id == -7) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：Email格式有误'));
				} elseif ($id == -8) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：Email不允许注册'));
				} elseif ($id == -9) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：Email已经被注册'));
				} elseif ($id == -10) {
					$error = array('name' => 'phone', 'msg' => fc_lang('手机号码必须是11位的整数'));
				} elseif ($id == -11) {
					$error = array('name' => 'phone', 'msg' => fc_lang('该手机号码已经注册'));
				}
			}
			if ($json) {
				exit($this->callback_json(array(
					'msg' => $error['msg'],
					'code' => 0
				)));
			}
		} else {
			$data = array();
			$error = '';
			$back_url = isset($_SERVER['HTTP_REFERER']) ? (strpos($_SERVER['HTTP_REFERER'], 'login') !== false ? '' : $_SERVER['HTTP_REFERER']) : '';
		}

		$this->template->assign(array(
			'data' => $data,
			'code' => $MEMBER['setting']['regcode'],
			'back_url' => $back_url,
			'regfield' => $MEMBER['setting']['regfield'],
			'meta_title' => fc_lang('会员注册'),
			'result_error' => $error,
		));
		$tpl = 'register'.($groupid ? '_'.$groupid : '').'.html';
		$this->template->display(is_file(FCPATH.'module/member/templates/member/'.MEMBER_TEMPLATE.'/'.$tpl) ? $tpl : 'register.html');
	}

	/**
     * ajax注册验证
     */
    public function check(){

    	// 会员配置
		$MEMBER = $this->get_cache('MEMBER');

		// 来路认证
		$json = 0;
		$auth = $this->input->get('auth');
		if ($auth) {
			if ($auth != md5(SYS_KEY)) {
				exit($this->callback_json(array(
					'msg' => '授权认证码不正确',
					'code' => 0
				)));
			}
			if (!IS_POST) {
				echo $this->callback_json(array(
					'msg' => '请用POST方式提交',
					'code' => 0,
				));
				exit;
			}
			$json = 1;
			$MEMBER['setting']['regcode'] = 0;
		}

		$groupid1 = (int)$this->input->get('groupid');
		$groupid2 = $_POST['groupid'];
		$groupid = $groupid2?$groupid2:$groupid1;

		// 判断是否开启注册
		if (!$MEMBER['setting']['register']) {
			if ($json) {
				exit($this->callback_json(array(
					'msg' => fc_lang('站点已经关闭了会员注册'),
					'code' => 0
				)));
			}
			$this->member_msg(fc_lang('站点已经关闭了会员注册'));
		} elseif ($groupid && !$MEMBER['group'][$groupid]['allowregister']) {
			// 指定模型注册验证
			if ($json) {
				exit($this->callback_json(array(
					'msg' => fc_lang('此会员组模型系统不允许注册'),
					'code' => 0
				)));
			}
			$this->member_msg(fc_lang('此会员组模型系统不允许注册'));
		} elseif ($this->member && !$json) {
			// 已经登录不允许注册
			$this->member_msg(fc_lang('您已经登录了，不能注册'));
		}
		
    	session_start();

    	$data = $_POST['data'];
		$back_url = $_POST['back'] ? urldecode($_POST['back']) : '';
		if (!$json && $MEMBER['setting']['regcode'] && !$this->check_captcha('code')) {
			//$error = array('name' => 'code', 'msg' => fc_lang('验证码不正确'));
		} elseif($_SESSION['phone_code'] != $data['phone_code']) {
			//$error = array('name' => 'phone_code', 'msg' => fc_lang('短信验证码不正确'));
		} elseif (@in_array('username', $MEMBER['setting']['regfield'])
			&& $result = $this->is_username($data['username'])) {
			$error = array('name' => 'username', 'msg' => $result);
		} elseif (!$data['password']) {
			$error = array('name' => 'password', 'msg' => fc_lang('密码不能为空'));
		} elseif ($data['password'] !== $data['password2']) {
			$error = array('name' => 'password2', 'msg' => fc_lang('两次密码输入不一致'));
		} elseif (@in_array('email', $MEMBER['setting']['regfield'])
			&& $result = $this->is_email($data['email'])) {
			$error = array('name' => 'email', 'msg' => $result);
		}else {
				$this->hooks->call_hook('member_register_before', $data); // 注册之前挂钩点
				$id = $this->member_model->register($data, $groupid);
				if ($id > 0) {
					// 注册成功
					$data['uid'] = $id;
					$this->hooks->call_hook('member_register_after', $data); // 注册之后挂钩点
					// 注册后的登录
					$code = $this->member_model->login($id, $data['password'], $data['auto'] ? 8640000 : $MEMBER['setting']['loginexpire'], 0, 1);
					if ($code == 'ok') {
						$this->hooks->call_hook('member_login', $data); // 登录成功挂钩点
					}
					if ($json) {
						exit($this->callback_json(array(
							'msg' => 'ok',
							'code' => 1,
							'uid' => $id,
							'return' => dr_member_info($id)
						)));
					}
					$member = $this->db->select('password')->where('uid', $id)->get('member')->row_array();
					$expire = 86400;
			        $this->input->set_cookie('member_uid', $id, $expire);
			        $this->input->set_cookie('member_cookie', substr(md5(SYS_KEY.$member['password']), 5, 20), $expire);
					$error = array('success' => '1', 'msg' => fc_lang('注册成功'));
				} elseif ($id == -1) {
					$error = array('name' => 'username', 'msg' => fc_lang('该会员【%s】已经被注册', $data['username']));
				} elseif ($id == -2) {
					$error = array('name' => 'email', 'msg' => fc_lang('邮箱格式不正确'));
				} elseif ($id == -3) {
					$error = array('name' => 'email', 'msg' => fc_lang('该邮箱【%s】已经被注册', $data['email']));
				} elseif ($id == -4) {
					$error = array('name' => 'username', 'msg' => fc_lang('同一IP在限制时间内注册过多'));
				} elseif ($id == -5) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：会员名称不合法'));
				} elseif ($id == -6) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：包含不允许注册的词语'));
				} elseif ($id == -7) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：Email格式有误'));
				} elseif ($id == -8) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：Email不允许注册'));
				} elseif ($id == -9) {
					$error = array('name' => 'username', 'msg' => fc_lang('Ucenter：Email已经被注册'));
				} elseif ($id == -10) {
					$error = array('name' => 'phone', 'msg' => fc_lang('手机号码必须是11位的整数'));
				} elseif ($id == -11) {
					$error = array('name' => 'phone', 'msg' => fc_lang('该手机号码已经注册'));
				}
			}

		echo json_encode($error);

    }

	/**
     * 短信认证验证码发送
     */
    public function sendsms() {

        // 重复发送
        if (get_cookie('send_sms')) {
            exit(dr_json(0, fc_lang('验证码已发送，请在1分钟之后再试')));
        }

        // 安全字符替换
        $mobile = dr_safe_replace($this->input->get('phone'));
        if (strlen($mobile) != 11 || !is_numeric($mobile)) {
            exit(dr_json(0, fc_lang('手机号码必须是11位的整数')));
        }

        // 号码是否重复
        if ($this->db->where('uid<>', $this->uid)->where('phone', $mobile)->count_all_results('member')) {
            exit(dr_json(0, fc_lang('该手机号码已经注册')));
        }

        $code = dr_randcode();
        $result = $this->member_model->sendsms($mobile, fc_lang('尊敬的用户，您的本次验证码是：%s', $code));
        if ($result['status']) {
            // 发送成功
            //$this->db->where('uid', $this->uid)->update('member', array('randcode' => $code, 'phone' => $mobile));
            session_start();
            $_SESSION['phone_code'] = $code;
            set_cookie('send_sms', 1, 60);
            exit(dr_json(1, fc_lang('验证码发送成功，请注意查收')));
        } else {
            // 发送失败
            exit(dr_json(0, $result['msg']));
        }
    }
}
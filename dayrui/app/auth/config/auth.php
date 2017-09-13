<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 应用的权限认证列表
 */

$config['auth'][] = array(
	'auth' => array(
		'admin/auth/index' => fc_lang('实名认证'),
		'admin/auth/edit' => fc_lang('修改'),
		'admin/auth/del' => fc_lang('删除'),
	)
);
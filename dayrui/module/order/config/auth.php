<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 *
 */

$config['auth'][] = array(
	'name' => fc_lang('内容管理'),
	'auth' => array(
		'admin/home/index' => fc_lang('管理'),
		'admin/home/add' => fc_lang('添加'),
		'admin/home/edit' => fc_lang('修改'),
		'admin/home/del' => fc_lang('删除'),
		'admin/home/verify' => fc_lang('审核'),
		'admin/home/url' => fc_lang('更新URL'),
		'admin/home/html' => fc_lang('生成静态'),
	)
);

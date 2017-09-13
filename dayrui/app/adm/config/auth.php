<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 应用的权限认证列表
 */

$config['auth'][] = array(
	'auth' => array(
		'admin/poster/index' => fc_lang('广告管理'),
		'admin/poster/add' => fc_lang('添加'),
		'admin/poster/edit' => fc_lang('修改'),
		'admin/poster/del' => fc_lang('删除'),
	)
);

$config['auth'][] = array(
	'auth' => array(
		'admin/poster2/index' => fc_lang('广告位管理'),
		'admin/poster2/add' => fc_lang('添加'),
		'admin/poster2/edit' => fc_lang('修改'),
		'admin/poster2/del' => fc_lang('删除'),
	)
);
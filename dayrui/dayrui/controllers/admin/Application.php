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
	
class Application extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
		$this->template->assign('menu', $this->get_menu_v3(array(
		    fc_lang('应用管理') => array('admin/application/index', 'cloud'),
            fc_lang('更新缓存') => array('admin/home/cache', 'refresh'),
		    fc_lang('应用商店') => array('admin/application/store', 'shopping-cart'),
		)));
		$this->load->model('application_model');
    }
	
	/**
     * 管理
     */
    public function index() {
	
		$store = $data = array();
		$local = dr_dir_map(FCPATH.'app/', 1); // 搜索本地应用
		$application = $this->application_model->get_data(); // 库中已安装应用
		
		if ($local) {
			foreach ($local as $dir) {
				if (is_file(FCPATH.'app/'.$dir.'/config/app.php')) {
					if (isset($application[$dir])) {
						$config = $data[1][$dir] = array_merge($application[$dir], require FCPATH.'app/'.$dir.'/config/app.php');
						if ($config['key']) {
							if (isset($store[$config['key']])) {
								if (version_compare($config['version'], $store[$config['key']], '<')) {
                                    $store[$config['key']] = $config['version'];
                                }
							} else {
								$store[$config['key']] = $config['version'];
							}
						}
					} else {
						$data[0][$dir] = require FCPATH.'app/'.$dir.'/config/app.php';
					}
				}
			}
		}
		
		$this->template->assign(array(
			'list' => $data,
			'store' => dr_base64_encode(dr_array2string($store)),
		));
		$this->template->display('application_index.html');
    }
    
	/**
     * 禁用/可用
     */
    public function disabled() {
	
		if ($this->is_auth('admin/application/config')) {
			$id = (int)$this->input->get('id');
			$data = $this->db->where('id', $id)->get('application')->row_array();
            $value = $data['disabled'] == 1 ? 0 : 1;
			$this->db->where('id', $id)->update('application', array(
                'disabled' => $value
            ));
            $this->clear_cache('app');
            $this->system_log(($value ? '禁用' : '启用').'应用【'.$data['dirname'].'】'); // 记录日志
		}
		
		exit(dr_json(1, fc_lang('操作成功')));
    }
	
	/**
     * 删除
     */
    public function delete() {

        if ($this->admin['adminid'] != 1) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'delete'));
        }

		$dir = $this->input->get('dir');

        $this->load->helper('file');
		delete_files(FCPATH.'app/'.$dir.'/', TRUE);

		if (is_dir(FCPATH.'app/'.$dir.'/')) {
            @rmdir(FCPATH.'app/'.$dir.'/');
        }

        if (is_dir(FCPATH.'app/'.$dir.'/')) {
            $this->admin_msg(fc_lang('无文件删除权限，建议通过FTP等工具删除此目录'));
        }

        // 删除菜单
        $this->db->where('mark', 'app-'.$dir)->delete('admin_menu');
        $this->db->where('mark', 'app-'.$dir)->delete('member_menu');

        $this->clear_cache('app');
        $this->system_log('删除应用【'.$dir.'】'); // 记录日志

		$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('application/index'), 1);
    }
	
	/**
     * 商店
     */
    public function store() {
	
		$data = array();
		$local = dr_dir_map(FCPATH.'app/', 1); // 搜索本地应用
		if ($local) {
			foreach ($local as $dir) {
				if (is_file(FCPATH.'app/'.$dir.'/config/app.php')) {
					$config = require FCPATH.'app/'.$dir.'/config/app.php';
					if ($config['key']) {
						$data[$config['key']] = $config['version'];
					}
				}
			}
		}
		
		$url = 'http://store.dayrui.com/index.php?c=category&id=1&action=application&param='.dr_base64_encode(dr_array2string(array(
			'site' => SITE_URL,
			'name' => SITE_NAME,
			'data' => $data,
			'admin' => ADMIN_URL.SELF,
			'version' => DR_VERSION_ID,
            'fc' => DR_LICENSE_ID
		)));
		$this->template->assign(array(
			'url' => $url,
		));
		$this->template->display('online.html');
    }
	
	/**
     * 云端下载程序
     */
    public function down() {
    	
    	$dir = $this->input->get('dir');
		if (is_dir(FCPATH.'app/'.$dir.'/')) {
            $this->admin_msg('目录（/app/'.$dir.'/）已经存在');
        }
		
    	$data = dr_catcher_data(urldecode($this->input->get('id')));
    	if (!$data) {
            $this->admin_msg('文件下载失败，请尝试其他方式下载');
        }
    	
    	$save = WEBPATH.'cache/down/app.zip';
    	$check = WEBPATH.'cache/down/app/';
		if (!@file_put_contents($save, $data)) {
            $this->admin_msg('目录（/cache/down/）没有写入权限');
        }
		
		// 载入解压缩类
		$this->load->helper('file');
		$this->load->library('Pclzip');

        // 文件安全性检测
        $this->pclzip->PclFile($save);
        $content = $this->pclzip->listContent();
        if (!$content) {
            $this->admin_msg('文件下载不完整或者已经损坏！<br>请检查网站目录权限或者联系应用开发者。');
        }
        foreach ($content as $t) {
            if (strpos($t['stored_filename'], '..') !== FALSE ||
                strpos($t['stored_filename'], '/') === 0) {
                $this->admin_msg('含有非法名称的文件：'.basename($t['stored_filename']));
            }
        }
        unset($content);

        // 开始解压文件
		if ($this->pclzip->extract(PCLZIP_OPT_PATH, $check, PCLZIP_OPT_REPLACE_NEWER) == 0) {
			@unlink($save);
			delete_files(WEBPATH.'cache/down/', TRUE);
			$this->admin_msg("Error : " . $this->pclzip->errorInfo(true));
		}
		
		// 检查版本文件
    	if (!is_file($check.'config/app.php') || !filesize($check.'config/app.php')) {
			delete_files(WEBPATH.'cache/down/', TRUE);
    		$this->admin_msg('文件不完整，请重试');
    	}
    	
    	// 覆盖至网站根目录
    	$this->pclzip->extract(PCLZIP_OPT_PATH, FCPATH.'app/'.$dir.'/', PCLZIP_OPT_REPLACE_NEWER);
    	
    	delete_files(WEBPATH.'cache/down/', TRUE);

        $this->system_log('云端下载应用【'.$dir.'】'); // 记录日志
		$this->admin_msg('下载成功，即将为您跳转到应用中心', dr_url('application/index'), 1);
    }
	
	/**
     * 更新
     */
    public function update() {

        if ($this->admin['adminid'] > 1) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', '升级'));
        }

		$key = 0;
		$dir = $this->input->get('id');
		if (is_file(FCPATH.'app/'.$dir.'/config/app.php')) {
			$config = require FCPATH.'app/'.$dir.'/config/app.php';
			$key = (int)$config['key'];
		}
		if (!$key) {
            $this->admin_msg('此应用无法在线更新（key不存在）');
        }
		
		$url = 'http://store.dayrui.com/index.php?c=down&m=update&action=application&param='.dr_base64_encode(dr_array2string(array(
			'site' => SITE_URL,
			'name' => SITE_NAME,
			'data' => array(
				'id' => $key,
				'dir' => $dir,
				'version' => $config['version']
			),
			'admin' => ADMIN_URL.SELF,
			'domain' => SITE_URL,
			'version' => DR_VERSION_ID,
		)));
		$this->template->assign(array(
			'url' => $url,
		));
		$this->template->display('online.html');
    }
	
	/**
     * 升级程序
     */
    public function upgrade() {

        if ($this->admin['adminid'] > 1) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', '升级'));
        }
    	
    	$key = (int)$this->input->get('key');
    	$dir = $this->input->get('dir');
		if (is_file(FCPATH.'app/'.$dir.'/config/app.php')) {
			$config = require FCPATH.'app/'.$dir.'/config/app.php';
			if ((int)$config['key'] != $key) {
                $this->admin_msg('此应用无法在线升级，key不匹配');
            }
		} else {
			 $this->admin_msg('此应用无法在线升级，目录（/app/'.$dir.'/）不存在');
		}
		
    	$data = dr_catcher_data(urldecode($this->input->get('id')));
    	if (!$data) {
            $this->admin_msg('文件下载失败，请尝试其他方式下载');
        }
    	
    	$save = WEBPATH.'cache/down/app.zip';
    	$check = WEBPATH.'cache/down/app/';
		if (!@file_put_contents($save, $data)) {
            $this->admin_msg('目录/cache/down/没有写入权限');
        }
		
		// 解压缩文件
		$this->load->helper('file');
		$this->load->library('Pclzip');

        // 文件安全性检测
        $this->pclzip->PclFile($save);
        $content = $this->pclzip->listContent();
        if (!$content) {
            $this->admin_msg('文件下载不完整或者已经损坏！<br>请检查网站目录权限或者联系应用开发者。');
        }
        foreach ($content as $t) {
            if (strpos($t['stored_filename'], '..') !== FALSE ||
                strpos($t['stored_filename'], '/') === 0) {
                $this->admin_msg('含有非法名称的文件：'.basename($t['stored_filename']));
            }
        }
        unset($content);

        // 开始解压文件
		if ($this->pclzip->extract(PCLZIP_OPT_PATH, $check, PCLZIP_OPT_REPLACE_NEWER) == 0) {
			@unlink($save);
			delete_files(WEBPATH.'cache/down/', TRUE);
			$this->admin_msg("Error : " . $this->pclzip->errorInfo(true));
		}
		
		// 检查版本文件
    	if (!is_file($check.'config/app.php') || !filesize($check.'config/app.php')) {
			delete_files(WEBPATH.'cache/down/', TRUE);
    		$this->admin_msg('升级文件不完整，请重试');
    	}
    	
    	// 覆盖至网站目录
    	$this->pclzip->extract(PCLZIP_OPT_PATH, FCPATH.'app/'.$dir, PCLZIP_OPT_REPLACE_NEWER);
    	delete_files(WEBPATH.'cache/down/', TRUE);
    	
    	// 运行SQL语句
    	if (is_file(FCPATH.'app/'.$dir.'/update.sql')) {
    		$sql = file_get_contents(FCPATH.'app/'.$dir.'/update.sql');
			$sql = str_replace('{dbprefix}', $this->db->dbprefix, $sql);
			$this->sql_query($sql);
			@unlink(FCPATH.'app/'.$dir.'/update.sql');
    	}
    	
    	//检查update控制器
		if (is_file(FCPATH.'app/'.$dir.'/controllers/admin/Update.php')) {
            $this->admin_msg('正在升级数据，请稍候...', dr_url($dir.'/update/index'), 2);
        }

        $this->system_log('升级应用【'.$dir.'】'); // 记录日志
		$this->admin_msg('升级完成，请重新检测一次版本', dr_url('application/index'), 1);
    }

    /**
     * 缓存
     */
    public function cache() {
        $this->application_model->cache();
        (int)$_GET['admin'] or $this->admin_msg(fc_lang('操作成功，正在刷新...'), isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '', 1);
    }
}
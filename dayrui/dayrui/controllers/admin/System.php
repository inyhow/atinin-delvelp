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

class System extends M_Controller {
	
    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
		$this->template->assign(array(
			'menu' => $this->get_menu_v3(array(
				fc_lang('系统配置') => array('admin/system/index', 'cog'),
			))
		));
    }

	private function _save($is_memcache = 0, $action = '') {

		$page = (int)$this->input->get('page');
		$data = require WEBPATH.'config/system.php'; // 加载网站系统配置文件

		if (IS_POST) {
			$this->system_model->save_config($data, $this->input->post('data'), $action);
			if ($is_memcache) {
				$memcache = $this->input->post('memcache');
				$memcache = "<?php".PHP_EOL
					."if (!defined('BASEPATH')) exit('No direct script access allowed');".PHP_EOL.PHP_EOL
					."\$config = array(".PHP_EOL
					."	'default' => array(".PHP_EOL
					."		'hostname' => '".$memcache['hostname']."',".PHP_EOL
					."		'port'     => '".$memcache['port']."',".PHP_EOL
					."		'weight'   => '1',".PHP_EOL
					."	),".PHP_EOL
					.");".PHP_EOL;
				file_put_contents(WEBPATH.'config/memcached.php', $memcache);
			}
			$this->system_log('修改系统配置'); // 记录日志
			$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('system/'.$this->router->method, array('page' => (int)$this->input->post('page'))), 1);
		}

		$this->config->load('memcached', TRUE);
		$memcache = $this->config->item('memcached');
		$data['SYS_ONLINE_NUM'] = isset($data['SYS_ONLINE_NUM']) ? $data['SYS_ONLINE_NUM'] : 10000;
		$data['SYS_ONLINE_TIME'] = isset($data['SYS_ONLINE_TIME']) ? $data['SYS_ONLINE_TIME'] : 7200;
		$data['SYS_UPLOAD_DIR'] = isset($data['SYS_UPLOAD_DIR']) && $data['SYS_UPLOAD_DIR'] ? $data['SYS_UPLOAD_DIR'] : 'uploadfile';
		$data['SYS_UPLOAD_DIR'] == '/member/uploadfile/' && $data['SYS_UPLOAD_DIR'] = 'member/uploadfile';
		$data['SYS_CMS'] = $data['SYS_CMS'] ? $data['SYS_CMS'] : DR_NAME;
		$data['SYS_NAME'] = $data['SYS_NAME'] ? $data['SYS_NAME'] : 'FineCMS';

		$this->template->assign(array(
			'page' => $page,
			'data' => $data,
			'config' => $this->system_model->config,
			'memcache' => $memcache['default'],
			'is_upload' => is_dir(strpos($data['SYS_UPLOAD_DIR'], '/') === 0 || strpos($data['SYS_UPLOAD_DIR'], ':') !== false ? $data['SYS_UPLOAD_DIR'] : WEBPATH.$data['SYS_UPLOAD_DIR']),
		));
	}
	
    /**
     * 配置
     */
    public function index() {

		$this->_save(1);
		$this->template->display('system_index.html');
	}

    /**
     * 文件分离
     */
    public function file() {

		$index = file_get_contents(WEBPATH.'index.php');
		$database = file_get_contents(WEBPATH.'config/database.php');

		if (IS_POST) {
			$new_index = $this->input->post('edit_index');
			if ($new_index != $index) {
				if (file_put_contents(WEBPATH.'new_index.php', $new_index)) {
					$this->admin_msg(fc_lang('新的入口new_index.php文件创建成功,再将它手动替换成index.php<p> 注意还需要将/dayrui/目录手动移动到你配置的位置</p>'), '', 1);
				} else {
					$this->admin_msg(fc_lang('根目录无权限创建文件'));
				}
			}
			$new_database = $this->input->post('edit_database');
			if ($new_database != $database) {
				if (file_put_contents(WEBPATH.'config/new_database.php', $new_database)) {
					$this->admin_msg(fc_lang('新的配置文件new_database.php文件创建成功,再将它手动替换成database.php'), '', 1);
				} else {
					$this->admin_msg(fc_lang('目录config无权限创建文件'));
				}
			}
		}

		$this->_save(0, 'file');
		$this->template->assign(array(
			'index' => $index,
			'database' => $database,
		));
		$this->template->display('system_file.html');
	}
	
	/**
     * 系统操作日志
     */
    public function oplog() {

		$time = isset($_POST['data']['time']) && $_POST['data']['time'] ? (int)$_POST['data']['time'] : (int)$this->input->get('time');
        $time = $time ? $time : SYS_TIME;
        $file = WEBPATH.'cache/optionlog/'.date('Ym', $time).'/'.date('d', $time).'.log';

        $list = array();
        $data = @explode(PHP_EOL, file_get_contents($file));
        $data = @array_reverse($data);

        $page = IS_POST ? 1 : max(1, (int)$this->input->get('page'));
        $total = count($data);
        $limit = ($page - 1) * SITE_ADMIN_PAGESIZE;

        $i = $j = 0;

        foreach ($data as $v) {
            if ($v && $i >= $limit && $j < SITE_ADMIN_PAGESIZE) {
                $list[] = $v;
                $j ++;
            }
            $i ++;
        }

        $this->load->library('dip');

        $this->template->assign(array(
            'time' => $time,
            'list' => $list,
            'total' => $total,
            'pages'	=> $this->get_pagination(dr_url('system/oplog', array('time' => $time)), $total)
        ));
        $this->template->display('system_oplog.html');
	}

	/**
     * 生成安全码
     */
    public function syskey() {
		echo 'FC'.strtoupper(substr((md5(SYS_TIME)), rand(0, 10), 13));exit;
	}

	/**
     * 生成来路随机字符
     */
    public function referer() {
		$s = strtoupper(base64_encode(md5(SYS_TIME).md5(rand(0, 2015).md5(rand(0, 2015)))).md5(rand(0, 2009)));
		echo str_replace('=', '', substr($s, 0, 64));exit;
	}
	
	/**
     * memcache 检查
     */
	public function memcache() {
	

		if (!extension_loaded('memcached') && !extension_loaded('memcache')) {
            exit("服务器不支持memcache");
        }
		if (!$this->cache->memcached->is_supported()) {
            exit("无法连接");
        }
		
		$this->cache->memcached->save('memcache_test', 'test', 10);
		if ($this->cache->memcached->get('memcache_test') != 'test') {
			exit("没有生效");
		} else {
			exit("ok");
		}
	}

}
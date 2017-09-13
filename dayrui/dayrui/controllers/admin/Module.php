<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.8.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Module extends M_Controller {
	
	private $_menu;
	private $_to_file;
	private $_from_file;
	
    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
		$this->_menu = array(
			fc_lang('模块管理') => array('admin/module/index', 'cogs'),
			fc_lang('模块商店') => array('admin/module/store', 'cart-arrow-down'),
		);
		$this->template->assign(array(
			'menu' => $this->get_menu_v3($this->_menu),
			'duri' => $this->duri
		));
		$this->load->model('module_model');
    }

    /**
     * 模块
     */
    public function index() {

        if (IS_POST) {
            $data = $this->input->post('data');
            if ($data) {
                foreach ($data as $id => $t) {
                    $this->db->where('id', $id)->update('module', array('displayorder' => (int)$t['displayorder']));
                    $this->system_log('模块排序【#'.$id.'】'); // 记录日志
                }
            }
        }

		$store = $data = array();
		$local = @array_diff(dr_dir_map(FCPATH.'module', 1), array('member')); // 搜索本地模块
		$module = $this->module_model->get_data(); // 库中已安装模块
        $space = $this->member_model->space();
        if ($space['open']) {
            // 开启空间表示安装了
            $module['space'] = array(
                'id' => 'space',
            );
        }
		if ($local) {
			// 从后台菜单中获取模块名称
			$menu = $this->db
                         ->select('mark,name')
                         ->where('pid', 0)
                         ->like('mark', 'module-')
                         ->get('admin_menu')
                         ->result_array();
			$name = array();
			if ($menu) {
				foreach ($menu as $t) {
					list($a, $dir) = explode('-', $t['mark']);
					$name[$dir] = $t['name'];
				}
			}
			foreach ($local as $dir) {
				if (is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
					if (isset($module[$dir])) {
						$module[$dir]['url'] = $module[$dir]['site'][SITE_ID]['domain'] ? dr_http_prefix($module[$dir]['site'][SITE_ID]['domain']) : SITE_URL.$dir;
						$config = $module[$dir] = array_merge($module[$dir], require FCPATH.'module/'.$dir.'/config/module.php');
						if (isset($name[$dir])) {
                            $module[$dir]['name'] = $name[$dir];
                        }
                        $module[$dir]['nodb'] = isset($config['nodb']) && $config['nodb'] ? 1 : 0;
                        $module[$dir]['space'] = isset($config['space']) && $config['space'] ? 1 : 0;
						if ($config['key']) {
							$store[$dir] = array(
								'key' => $config['key'],
								'version' => $config['version'],
							);
						}
					} else {
						$data[0][$dir] = require FCPATH.'module/'.$dir.'/config/module.php';
					}
				}
			}
		}
        $data[1] = $module;
		
		$this->template->assign(array(
			'list' => $data,
			'store' => dr_base64_encode(dr_array2string($store)),
		));
		$this->template->display('module_index.html');
	}
	
	/**
     * 配置
     */
    public function config() {
	
		$id = (int)$this->input->get('id');
		$all = (int)$this->input->get('all');
		$data = $this->module_model->get($id);
		$result	= 0;
		if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }

        $cfg = require FCPATH.'module/'.$data['dirname'].'/config/module.php';

		if (IS_POST) {
			$post = $this->input->post('data');
            $cfg['name'] = $name = $this->input->post('name');
            $post['setting']['config'] = isset($data['setting']['config']) ? $data['setting']['config'] : array();
            $this->module_model->edit($id, $post);
            // 更新后台菜单
            $this->db->where('pid', 0)->where('mark', 'module-'.$data['dirname'])->update('admin_menu', array('name' => $name));
            // 更新会员菜单
            $this->db->where('mark', 'left-'.$data['dirname'])->update('member_menu', array('name' => $name));
            // 更新配置文件
            $this->load->library('dconfig');
            $this->dconfig->file(FCPATH.'module/'.$data['dirname'].'/config/module.php')->note('模块配置文件')->space(24)->to_require_one($cfg);
            $this->clear_cache('module');
            $this->system_log('配置模块属性【'.$data['dirname'].'】'); // 记录日志
            $this->admin_msg(fc_lang('操作成功'), $all ? dr_url('module/index') : dr_url('module/config', array('id' => $id)), 1);
		} else {
            if (isset($cfg['nodb']) && $cfg['nodb']) {
                // 跳转到模块自身的配置页面去
                redirect(ADMIN_URL.dr_url($data['dirname'].'/mconfig/index'), 'refresh');
            }
        }

		// 模块名称
		$name = $this->db
                     ->select('name')
                     ->where('pid', 0)
                     ->where('mark', 'module-'.$data['dirname'])
                     ->limit(1)
                     ->get('admin_menu')
                     ->row_array();
        $this->_menu[fc_lang('模块配置')] = array('admin/module/config/id/'.$id.'/all/1/', 'cog');
		
		$this->template->assign(array(
            'all' => $all,
			'data' => $data,
			'role' => $this->get_cache('role'),
			'menu' => $this->get_menu_v3($this->_menu),
            'name' => $name['name'] ? $name['name'] : $cfg['name'],
            'mycfg' => is_file(FCPATH.'dayrui/templates/admin/my_module.html') ? FCPATH.'dayrui/templates/admin/my_module.html' : 0,
            'field' => $this->db->where('disabled', 0)->where('relatedid', $id)->where('relatedname', 'module')->order_by('displayorder ASC, id ASC')->get('field')->result_array(),
			'extend' => $cfg['extend'],
			'result' => $result,
		));
		$this->template->display('module_config.html');
    }
	
	/**
     * 权限划分
     */
	public function role() {
	
		$id = (int)$this->input->get('id');
		$dir = $this->input->get('dir');
		
		if ($id == 1) {
            exit(fc_lang('超级管理员拥有最高权限，不需要配置'));
        }
		if (!is_file(FCPATH.'module/'.$dir.'/config/auth.php')) {
            exit(fc_lang('<p>权限配置文件(%s)不存在</p>', '/'.$dir.'/config/auth.php'));
        }
		if (is_file(FCPATH.'module/'.$dir.'/language/'.SITE_LANGUAGE.'/module_lang.php')) {
            $lang = array();
			require FCPATH.'module/'.$dir.'/language/'.SITE_LANGUAGE.'/module_lang.php';
			$this->lang->language = $this->lang->language + $lang;
		}
		
		if (IS_POST) {
			$rule = NULL;
			$post = $this->input->post('data', TRUE);
			$data = $this->db->where('id', $id)->get('admin_role')->row_array();
			if ($data['module']) {
				$rule = dr_string2array($data['module']);
				if ($rule) {
					foreach ($rule as $i => $t) {
						if (strpos($t, $dir.'/admin') === 0) {
                            unset($rule[$i]);
                        }
					}
				}
			}
			if ($rule) {
                $post = array_merge($rule, $post);
            }
			$this->auth_model->update_auth($id, 'module', $post);
            $this->system_log('配置模块后台管理权限【'.$dir.'】'); // 记录日志
			exit;
		}
		
		$data = $this->auth_model->get_role($id);
        $config = array();
		require FCPATH.'module/'.$dir.'/config/auth.php';
		
		$this->template->assign(array(
			'data' => $data['module'],
			'list' => $config['auth'],
			'prefix' => $dir.'/',
		));
        $this->template->display('admin_auth.html');
	}

    /**
     * 开启和关闭生成静态功能
     */
    public function html() {
        if ($this->is_auth('admin/module/config')) {
            $id = $this->input->get('id');
            if (is_numeric($id)) {
                $this->db->where('id', (int)$id);
            } else {
                $this->db->where('dirname', (string)$id);
            }
            $data = $this->db->get('module')->row_array();
            if (!$data) {
                $this->admin_msg(fc_lang('模块信息不存在'));
            }
            $sid = (int)$this->input->get('sid');
            $site = dr_string2array($data['site']);
            $value = $site[$sid]['html'] == 1 ? 0 : 1;
            $site[$sid]['html'] = $value;
            $this->db->where('id', $data['id'])->update(
                'module',
                array(
                    'site' => dr_array2string($site)
                )
            );
            $name = $value ? '开启静态生成功能' : '关闭静态生成功能';
            $this->system_log('模块【'.$data['dirname'].'】'.$name); // 记录日志
            $this->clear_cache('module');
            $this->admin_msg(fc_lang($name), $_SERVER['HTTP_REFERER'], 1);
        } else {
            $this->admin_msg(fc_lang('您无权限操作'));
        }
    }
	
	/**
     * 禁用/可用
     */
    public function disabled() {
		if ($this->is_auth('admin/module/config')) {
			$id = (int)$this->input->get('id');
			$_data = $this->db->where('id', $id)->get('module')->row_array();
            $value = $_data['disabled'] == 1 ? 0 : 1;
			$this->db->where('id', $id)->update('module', array('disabled' => $value));
            $this->system_log(($value ? '禁用' : '启用').'模块【'.$_data['dirname'].'】'); // 记录日志
            $this->clear_cache('module');
		}
		exit(dr_json(1, fc_lang('操作成功')));
    }
	
	/**
     * 复制
     */
    public function copy() {
		if ($this->is_auth('admin/module/config')) {
			$dir = strtolower($this->input->get('dir'));
			if (IS_POST) {
                $config = require FCPATH.'module/'.$dir.'/config/module.php';
                if (isset($config['nocopy']) && $config['nocopy']) {
                    exit(dr_json(0, fc_lang('此模块禁止复制'))); // 模块禁止复制
                }
				$data = $this->input->post('data');
				if (!$data['dirname'] || !preg_match('/^[a-z]+$/U', $data['dirname'])) {
					exit(dr_json(0, fc_lang('模块目录格式不正确，只能由英文字母组成')));
				} elseif (is_dir(FCPATH.'module/'.$data['dirname'])) {
					exit(dr_json(0, fc_lang('此目录已经存在了，请换一个试试')));
				} elseif ($data['name'] && strpos($data['name'], "'") !== FALSE) {
					exit(dr_json(0, fc_lang('名称不不规范')));
				}
                $file = FCPATH.'module/'.$data['dirname'].'/config/module.php';
				$this->_copy_file(FCPATH.'module/'.$dir, FCPATH.'module/'.$data['dirname']);
				if ($data['name']) {
					$config['name'] = $data['name'];
					$this->load->library('dconfig');
					$this->dconfig->file($file)->note('模块配置文件')->space(24)->to_require_one($config);
				}
                $this->system_log('复制模块【'.$dir.'】为【'.$data['dirname'].'】'); // 记录日志
				exit(dr_json(1, fc_lang('模块复制成功，正在刷新页面...')));
			} else {
				$this->template->display('module_copy.html');
			}
		} else {
			exit(dr_json(1, fc_lang('操作成功')));
		}
    }
	
	/**
     * 导出
     */
    public function export() {
		if ($this->is_auth('admin/module/config')) {
			$dir = strtolower($this->input->get('dir'));
			$name = $this->input->get('name');
			if ($this->input->get('action') == 1) {
				$this->_copy_file(FCPATH.'module/'.$dir.'/config/', FCPATH.'module/'.$dir.'/_config/');
				$error = $this->module_model->export($dir, $name);
				if ($error) {
					$this->admin_msg($error);
				} else {
                    $this->system_log('生成模块【'.$dir.'】'); // 记录日志
					$this->admin_msg('模块导出成功，原配置目录为_config。', dr_url('module/index'), 1, 10);
				}
			} else {
				$this->admin_msg(fc_lang('正在执行中...'), dr_url('module/export', array('dir' => $dir, 'name' => $name, 'action' => 1)), 2);
			}
		} else {
			$this->admin_msg(fc_lang('操作成功'));
		}
    }

    /**
     * 安装到站点
     */
    public function install_all() {

        // 安装权限判断
        if ($this->admin['adminid'] > 1
            && !@in_array(SITE_ID, $this->admin['role']['site'])) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'site'));
        }

        // 验证目录规则
        $dir = strtolower(basename($this->input->get('dir')));
        if (!preg_match('/^[a-z]+$/U', $dir)) {
            $this->admin_msg(fc_lang('模块目录格式不正确，只能由英文字母组成'));
        } elseif (!is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
            $this->admin_msg(fc_lang('模块(%s)配置文件不存在', $dir));
        }

        // 对当前模块属性判断
        $cfg = require FCPATH.'module/'.$dir.'/config/module.php';
        if (isset($cfg['space']) && $cfg['space']) {
            // 空间黄页安装时
            $this->load->add_package_path(FCPATH.'module/space/');
            $space = $this->member_model->space();
            $space['open'] = 1;
            $this->member_model->space($space);
            $this->module_model->install('space', 'space', SITE_ID, $cfg);
            $this->member_model->cache();
            $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('space/setting/space'), 1);
            exit;
        }

        $nodb = isset($cfg['nodb']) && $cfg['nodb'] ? 1 : 0;

        // 是否作为共享模块安装
        $cfg['share'] = (int)$this->input->get('share');

        // 非自定义表时
        if (!$nodb) {
            if (!is_file(FCPATH.'module/'.$dir.'/config/main.table.php')) {
                $this->admin_msg(fc_lang('模块(%s)主表结构文件不存在', $dir));
            }
            if (!is_file(FCPATH.'module/'.$dir.'/config/data.table.php')) {
                $this->admin_msg(fc_lang('模块(%s)附表结构文件不存在', $dir));
            }
        }

        // 入库模块表和字段
        $id = $this->module_model->add($dir, $cfg, $nodb);
        if (!$id) {
            $this->admin_msg(fc_lang('模块(%s)安装失败', $dir));
        }

        // 安装当前站点的数据表
        $this->module_model->install($id, $dir, SITE_ID, $cfg, $nodb);

        // 更新站点到模块表
        $this->db->where('id', $id)->update('module', array('site' => dr_array2string(array(
            SITE_ID => array(
                'use' => 1,
                'html' => 0,
                'theme' => SITE_THEME,
                'domain' => '',
                'template' => SITE_TEMPLATE,
            )
        ))));

        $this->system_log('安装模块【'.$dir.'】到站点【#'.SITE_ID.'】'); // 记录日志

        // 更新后台菜单缓存
        $this->load->model('menu_model');
        $this->menu_model->cache();

        // 更新会员菜单缓存
        $this->load->model('member_model');
        $this->member_model->cache();

        if ((int)$_GET['admin']) {
            exit('ok');
        }

        if ($dir == 'weixin') {
            $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/index'), 1);
        } else {
            $this->admin_msg(fc_lang('当前站点安装成功（请更新模块缓存）'), dr_url('module/install', array('id'=>$id)), 1);
        }
    }
	
	/**
     * 站点的安装管理
     */
    public function install() {

        $id = (int)$this->input->get('id');
        $data = $this->module_model->get($id);
        if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }

        // 菜单
        $this->_menu = array(
            fc_lang('模块管理') => array('admin/module/index', 'cogs'),
            fc_lang('【%s】模块站点管理', $data['name']) => array('admin/module/install/id/'.$id, 'globe'),
        );

        $this->template->assign(array(
            'id' => $id,
            'dir' => $data['dirname'],
            'data' => $data,
            'menu' => $this->get_menu_v3($this->_menu),
        ));
        $this->template->display('module_install.html');

    }

    /**
     * 站点配置
     */
    public function install3() {

        $sid = (int)$this->input->get('sid');
        if ($this->admin['adminid'] > 1
            && !@in_array($sid, $this->admin['role']['site'])) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'site'));
        }

        $id = $this->input->get('id');
        $all = (int)$this->input->get('all');
        $data = $this->module_model->get($id);
        if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        } elseif (!$data['site'][$sid]) {
            $this->admin_msg(fc_lang('该模块尚未安装在该站点中'));
        }
        $id = $data['id'];

        if (IS_POST) {
            $post = $this->input->post('data');
            $post['use'] = 1;
            $data['site'][$sid] = $post;
            $this->db->where('id', $id)->update('module', array(
                'site' => dr_array2string($data['site']),
            ));
            $this->system_log('配置模块【'.$data['dirname'].'】在站点【#'.$sid.'】的属性'); // 记录日志
            $this->clear_cache('module');
            if ($all) {
                $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/install3', array('id' => $id, 'sid' => $sid, 'all' => 1)), 1);
            } else {
                $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/install', array('id' => $id)), 1);
            }
        }

        // 菜单
        if ($all) {
            $this->_menu = array(
                fc_lang('模块配置') => array('admin/module/config/id/'.$id.'/all/0', 'cog'),
                fc_lang('站点配置') => array('admin/module/install3/id/'.$id.'/sid/'.$sid.'/all/1/', 'globe'),
            );
        } else {
            $this->_menu = array(
                fc_lang('模块管理') => array('admin/module/index', 'cogs'),
                fc_lang('【%s】模块站点管理', $data['name']) => array('admin/module/install/id/'.$id, 'cog'),
                fc_lang('站点配置') => array('admin/module/install3/id/'.$id.'/sid/'.$sid, 'globe'),
            );
        }

        $this->template->assign(array(
            'sid' => $sid,
            'data' => $data,
            'menu' => $this->get_menu_v3($this->_menu),
            'theme' => dr_get_theme(),
            'mycfg' => is_file(FCPATH.'dayrui/templates/admin/my_module_site.html') ? FCPATH.'dayrui/templates/admin/my_module_site.html' : 0,
            'is_theme' => strpos($data['site'][$sid]['theme'], 'http://') === 0 ? 1 : 0,
            'template_path' => @array_diff(dr_dir_map(FCPATH.'module/'.$data['dirname'].'/templates/', 1), array('admin', 'member')),
        ));
        $this->template->display('module_install3.html');

    }

    // 执行站点安装
    public function install2() {

        $id = (int)$this->input->get('id');
        $sid = (int)$this->input->get('sid');
        if ($this->admin['adminid'] > 1
            && !@in_array($sid, $this->admin['role']['site'])) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'site'));
        }

        $data = $this->module_model->get($id);
        if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }

        $dir = $data['dirname'];
        $cfg = require FCPATH.'module/'.$dir.'/config/module.php';
        $nodb = isset($cfg['nodb']) && $cfg['nodb'] ? 1 : 0;

        // 非自定义表时
        if (!$nodb) {
            if (!is_file(FCPATH.'module/'.$dir.'/config/main.table.php')) {
                $this->admin_msg(fc_lang('模块(%s)主表结构文件不存在', $dir));
            }
            if (!is_file(FCPATH.'module/'.$dir.'/config/data.table.php')) {
                $this->admin_msg(fc_lang('模块(%s)附表结构文件不存在', $dir));
            }
        }

        $first = 0;
        if (isset($data['site']) && $data['site']) {
            foreach ($data['site'] as $i => $t) {
                $first = $i;
                break;
            }
        }

        // 是否作为共享模块安装
        $cfg['share'] = (int)$data['share'];

		// 安装当前站点的数据表
        $this->module_model->install($id, $data['dirname'], $sid, $cfg, $nodb, $first);
		
		// 更新站点到模块表
        $data['site'][$sid] = array(
            'use' => 1,
            'html' => 0,
            'theme' => SITE_THEME,
            'domain' => '',
            'template' => SITE_TEMPLATE,
        );
		$this->db->where('id', $id)->update('module', array('site' => dr_array2string($data['site'])));

        $this->system_log('安装模块【'.$dir.'】到站点【#'.$sid.'】'); // 记录日志
        $this->clear_cache('module');
        $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/install3', array('id'=>$id, 'sid'=>$sid)), 1);
    }
	
	/**
     * 卸载
     */
    public function uninstall() {
        $id = $this->input->get('id');
        if ($id == 'space') {
            // 卸载空间黄页
            $this->load->add_package_path(FCPATH.'module/space/');
            $space = $this->member_model->space();
            $space['open'] = 0;
            $this->member_model->space($space);
            $model = $this->db->get('space_model')->result_array();
            if ($model) {
                $this->load->model('space_model_model');
                foreach ($model as $t) {
                    $this->space_model_model->del($t['id']);
                }
            }
            $this->module_model->uninstall($id, 'space', SITE_ID);
            $this->admin_msg(fc_lang('全部站点卸载成功（请更新模块缓存）'), dr_url('module/index'), 1);
        } else {
            $this->module_model->del((int)$id);
            $this->system_log('卸载模块【#'.$id.'】'); // 记录日志
            $this->clear_cache('module');
            $this->admin_msg(fc_lang('全部站点卸载成功（请更新模块缓存）'), dr_url('module/index'), 1);
        }
    }
    
	/**
     * 卸载站点
     */
    public function uninstall2() {

        $id = (int)$this->input->get('id');
        $sid = (int)$this->input->get('sid');
        if ($this->admin['adminid'] > 1
            && !@in_array($sid, $this->admin['role']['site'])) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'site'));
        }
        $data = $this->module_model->get($id);
        if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }

        // 删除站点记录
        unset($data['site'][$sid]);
        $this->db->where('id', $id)->update('module', array(
            'site' => dr_array2string($data['site']),
        ));

        // 删除站点数据
		$this->module_model->uninstall(
            $id,
            $this->input->get('dir'),
            (int)$this->input->get('sid'),
            3
        );

        $this->system_log('删除模块【'.$data['dirname'].'】在站点【#'.$sid.'】的数据'); // 记录日志
        $this->clear_cache('module');
		$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/install', array('id'=>$id)), 1);
    }

	/**
     * 清空
     */
    public function clear() {
        $dir = $this->input->get('dir');
        $sid = (int)$this->input->get('sid');
        if ($this->admin['adminid'] > 1
            && !@in_array($sid, $this->admin['role']['site'])) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'site'));
        }
		$this->module_model->clear($dir, $sid);
        $this->system_log('清空模块【'.$dir.'】数据'); // 记录日志
        $this->clear_cache('module');
		$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/install', array('id'=>(int)$this->input->get('id'))), 1);
    }
	
	/**
     * 删除
     */
    public function delete() {

        if ($this->admin['adminid'] > 1) {
            $this->admin_msg(fc_lang('抱歉！您无权限操作(%s)', 'delete'));
        }

		$id = (int)$this->input->get('id');
		$dir = $this->input->get('dir');
		if ($id) {
            $this->module_model->del($id);
        }
		
		$this->load->helper('file');
		delete_files(FCPATH.'module/'.$dir.'/', TRUE);
		if (is_dir(FCPATH.'module/'.$dir.'/')) {
            @rmdir(FCPATH.'module/'.$dir.'/');
        }

        if (is_dir(FCPATH.'module/'.$dir.'/')) {
            $this->admin_msg(fc_lang('无文件删除权限，建议通过FTP等工具删除此目录'));
        }

        $this->system_log('删除模块【'.$dir.'】'); // 记录日志
        $this->clear_cache('module');
		$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('module/index'), 1);
    }
	
	/**
     * 推荐位收费
     */
    public function flag() {
		$this->template->display('module_flag.html');
		$this->output->enable_profiler(FALSE);
    }
	
	/**
     * 模块商店
     */
    public function store() {
	
		$data = array();
		$local = @array_diff(dr_dir_map(FCPATH.'module/', 1), array('member')); // 搜索本地模块
		if ($local) {
			foreach ($local as $dir) {
				if (is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
					$config = require FCPATH.'module/'.$dir.'/config/module.php';
					if ($config['key']) {
						$data[$config['key']] = $config['version'];
					}
				}
			}
		}
		
		$url = 'http://store.dayrui.com/index.php?c=category&id=3&action=module&param='.dr_base64_encode(dr_array2string(array(
			'site' => SITE_URL,
			'name' => SITE_NAME,
			'data' => $data,
            'admin' => ADMIN_URL.SELF,
			'version' => DR_VERSION_ID,
			'fc' => DR_LICENSE_ID,
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
		if (is_dir(FCPATH.'module/'.$dir.'/')) {
            $this->admin_msg('目录（/'.$dir.'/）已经存在');
        }
		
    	$data = dr_catcher_data(urldecode($this->input->get('id')));
    	if (!$data) {
            $this->admin_msg('文件下载失败，请尝试其他方式下载');
        }
		
    	$save = WEBPATH.'cache/down/module.zip';
    	$check = WEBPATH.'cache/down/module/';
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
            $this->admin_msg('文件下载不完整或者已经损坏！<br>请检查网站目录权限或者联系模块开发者。');
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
    	if (!is_file($check.'config/module.php') || !filesize($check.'config/module.php')) {
			delete_files(WEBPATH.'cache/down/', TRUE);
    		$this->admin_msg('文件不完整，请重试');
    	}
		
    	// 覆盖至网站根目录
    	$this->pclzip->extract(PCLZIP_OPT_PATH, FCPATH.'module/'.$dir.'/', PCLZIP_OPT_REPLACE_NEWER);
    	delete_files(WEBPATH.'cache/down/', TRUE);

        $this->system_log('云端下载模块【'.$dir.'】'); // 记录日志
		$this->admin_msg('下载成功，即将为您跳转到应用中心', dr_url('module/index'), 1);
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
		if (is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
			$config = require FCPATH.'module/'.$dir.'/config/module.php';
			$key = (int)$config['key'];
		}
		
		if (!$key) {
            $this->admin_msg('此模块无法在线更新（key不存在）');
        }
		$url = 'http://store.dayrui.com/index.php?c=down&m=update&action=module&param='.dr_base64_encode(dr_array2string(array(
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
		
		if (is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
			$config = require FCPATH.'module/'.$dir.'/config/module.php';
			if ((int)$config['key'] != $key) {
                $this->admin_msg('此应用无法在线升级，key不匹配');
            }
		} else {
			 $this->admin_msg('此模块无法在线升级，目录（/'.$dir.'/）不存在');
		}
		
    	$data = dr_catcher_data(urldecode($this->input->get('id')));
    	if (!$data) {
            $this->admin_msg('文件下载失败，请尝试其他方式下载');
        }
		
    	$save = WEBPATH.'cache/down/module.zip';
    	$check = WEBPATH.'cache/down/module/';
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
            $this->admin_msg('文件下载不完整或者已经损坏！<br>请检查网站目录权限或者联系模块开发者。');
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
    	if (!is_file($check.'config/module.php') || !filesize($check.'config/module.php')) {
			delete_files(WEBPATH.'cache/down/', TRUE);
    		$this->admin_msg('升级文件不完整，请重试');
    	}
		
    	// 覆盖至网站目录
    	$this->pclzip->extract(PCLZIP_OPT_PATH, FCPATH.'module/'.$dir, PCLZIP_OPT_REPLACE_NEWER);
    	delete_files(WEBPATH.'cache/down/', TRUE);
		
    	// 运行SQL语句
    	if (is_file(FCPATH.'module/'.$dir.'update.sql')) {
    		$sql = file_get_contents(FCPATH.'module/'.$dir.'update.sql');
			$sql = str_replace('{dbprefix}', $this->db->dbprefix, $sql);
			$this->sql_query($sql);
			@unlink(WEBPATH.$dir.'update.sql');
    	}
		
    	//检查update控制器
		if (is_file(FCPATH.'module/'.$dir.'/controllers/admin/Update.php')) {
            $this->admin_msg('正在升级数据，请稍候...', dr_url($dir.'/update/index'), 2);
        }

        $this->system_log('升级模块【'.$dir.'】'); // 记录日志
		$this->admin_msg('升级完成，请重新检测一次版本', dr_url('module/index'), 1);
    }
	
	/**
     * 缓存
	 *
	 * 模块缓存文件格式：module-站点id-模块名称 = array(模块数组);
	 * 模块数据缓存文件：module = array( 模块名称1, 模块名称2, 模块名称3);
	 *
     */
    public function cache($update = 1) {
	
		$dir = $this->input->get('dir');
		$admin = (int)$this->input->get('admin');
		
		// 更新后台菜单缓存
		$this->load->model('menu_model');
		$this->menu_model->cache();
		
		if ($dir) {
			$url = $this->input->get('url') ? $this->input->get('url') : (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '');
			$todo = (int)$this->input->get('todo');
			if (!($admin || !$update) && !$todo) {
				$this->admin_msg(fc_lang('正在执行中...'), dr_url('module/cache', array('dir' => $dir, 'todo' => 1, 'url' => urlencode($url))), 2, 0);
			}
			$this->module_model->cache($dir, $update);
			if ($admin || !$update) {
                return '';
            }
			$this->admin_msg(fc_lang('操作成功，正在刷新...'), urldecode($url), 1);
		} else {
			// 模块页面更新缓存
			$step = (int)$this->input->get('step');
			$todo = (int)$this->input->get('todo');
			$module = $this->db->where('disabled', 0)->get('module')->result_array();
			if (!$todo && $module) {
				$cache = array();
				foreach ($module as $t) {
					$site = dr_string2array($t['site']);
					foreach ($site as $_site => $url) {
						$cache[$_site][] = $t['dirname']; // 将模块归类至站点
					}
				}
				$this->dcache->set('module', $cache);
				$this->admin_msg(fc_lang('正在执行中...'), dr_url('module/cache', array('step' => 0, 'todo' => 1)), 2, 0);
			}
			if (!isset($module[$step])) {
                $this->admin_msg(fc_lang('缓存更新成功'), dr_url('module/index'), 1);
            }
			$this->module_model->cache($module[$step]['dirname'], $update);
			$this->admin_msg(fc_lang('模块(%s)缓存', $module[$step]['dirname']).' ...', dr_url('module/cache', array('step' => $step + 1, 'todo' => 1)), 2, 0);
		}
	}
	
	/**
	 * $fromFile  要复制谁
	 * $toFile    复制到那
	 */
	private function _copy_file($fromFile, $toFile){
		$this->_create_folder($toFile);
		$folder1 = opendir($fromFile);
		while ($f1 = readdir($folder1)) {
			if ($f1 != "." && $f1 != "..") {
				$path2 = "{$fromFile}/{$f1}";
				if (is_file($path2)) {	
					$file = $path2;
					$newfile = "{$toFile}/{$f1}";
					@copy($file, $newfile);
				} elseif (is_dir($path2)) {
					$toFiles = $toFile.'/'.$f1;
					$this->_copy_file($path2, $toFiles);
				}
			}
		}
	}
	
	/**
	 * 递归创建文件夹
	 */
	private function _create_folder($dir, $mode = 0777){
		if (is_dir($dir) || @mkdir($dir, $mode)) {
			return true;
		}	
		if (!$this->_create_folder(dirname($dir), $mode)) {
			return false;
		}
		return @mkdir($dir, $mode);
	}
}
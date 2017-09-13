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

class Upgrade extends M_Controller {

    private $rid;
    private $version;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->version = DR_VERSION;
    }

    /**
     * 程序管理
     */
    public function index() {

        $data = $branch = array();
        $local = dr_dir_map(FCPATH.'branch/', 1);
        if ($local) {
            foreach ($local as $dir) {
                if (is_file(FCPATH.'branch/'.$dir.'/version.php')) {
                    $branch[$dir] = require FCPATH.'branch/'.$dir.'/version.php';
                    $branch[$dir]['install'] = is_file(FCPATH.'branch/'.$dir.'/install.lock') ? 1 : 0;
                    $data['branch'][$branch[$dir]['V_ID']] = $branch[$dir]['V_VERSION_ID'];
                }
            }
        }
        $data['system'] = DR_VERSION_ID;

        $this->template->assign(array(
            'url' => 'http://update.dayrui.com/index.php?fc='.DR_LICENSE_ID.'&id='.DR_VERSION_ID.'&site='.urlencode(SITE_URL).'&admin='.ADMIN_URL.SELF,
            'burl' => 'http://update.dayrui.com/index.php?c=branch&fc='.DR_LICENSE_ID.'&site='.urlencode(SITE_URL).'&admin='.ADMIN_URL.SELF,
            'menu' => $this->get_menu_v3(array(
                fc_lang('程序管理') => array('admin/upgrade/index', 'plug'),
                fc_lang('更多扩展程序下载') => array('admin/upgrade/more', 'plus'),
            )),
            'data' => dr_array2string($data),
            'branch' => $branch,
        ));
        $this->template->display('upgrande.html');
    }


    // 安装分支系统
    public function install() {

        $dir = dr_safe_replace($_GET['dir']);
        $path = FCPATH.'branch/'.$dir.'/';
        if (is_file($path.'install.lock')) {
            $this->admin_msg('安装程序已经锁定，如果重新安装请删除install.lock文件');
        }

        if (!is_dir($path)) {
            $this->admin_msg('安装目录不存在');
        } elseif (!is_file($path.'install.sql')) {
            $this->admin_msg('安装执行SQL不存在');
        }

        // 运行安装SQL
        if ($sql = file_get_contents($path.'install.sql')) {
            $this->_query(str_replace('{dbprefix}', $this->db->dbprefix, $sql));
        }

        // 运行菜单
        if ($sql = file_get_contents($path.'admin_menu.sql')) {
            $this->_query(str_replace('{dbprefix}', $this->db->dbprefix, $sql));
        }

        // 运行安装脚本
        if (is_file($path.'install.php')) {
            require $path.'install.php';
        }

        // 安装菜单
        $menu = require $path.'menu.php';
        if ($menu['admin'] && $menu['admin']['menu']) {
            // 插入后台的顶级菜单
            $this->system_model->add_admin_menu(array(
                'uri' => '',
                'pid' => 0,
                'mark' => 'branch-'.$dir,
                'name' => $menu['admin']['name'],
                'icon' => $menu['admin']['icon'] ? $menu['admin']['icon'] : dr_get_icon_m($dir),
                'hidden' => 0,
                'displayorder' => 0,
            ));
            $topid = $this->db->insert_id();
            foreach ($menu['admin']['menu'] as $left) { // 分组菜单名称
                $this->system_model->add_admin_menu(array(
                    'uri' => '',
                    'pid' => $topid,
                    'mark' => 'branch-'.$dir,
                    'name' => $left['name'],
                    'icon' => $left['icon'] ? $left['icon'] : dr_get_icon_left($left['name']),
                    'hidden' => 0,
                    'displayorder' => 0,
                ));
                $leftid = $this->db->insert_id();
                foreach ($left['menu'] as $link) { // 链接菜单
                    $this->system_model->add_admin_menu(array(
                        'pid' => $leftid,
                        'uri' => 'admin/'.$link['uri'],
                        'mark' => 'branch-'.$dir,
                        'name' => $link['name'],
                        'icon' => $link['icon'] ? $link['icon'] : dr_get_icon($link['uri']),
                        'hidden' => 0,
                        'displayorder' => 0,
                    ));
                }
            }
        }
        if ($menu['member'] && $menu['member']['menu']) {
            // 会员顶级菜单
            $this->system_model->add_member_menu(array(
                'uri' => '',
                'url' => '',
                'pid' => 0,
                'mark' => 'branch-'.$dir,
                'name' => $menu['member']['name'],
                'icon' => $menu['member']['icon'] ? $menu['member']['icon'] : dr_get_icon_m($dir),
                'hidden' => 0,
                'displayorder' => 0,
            ));
            $topid = $this->db->insert_id();
            foreach ($menu['member']['menu'] as $left) {
                if ($left['menu']) {
                    // 分组菜单名称
                    $this->system_model->add_member_menu(array(
                        'uri' => '',
                        'url' => '',
                        'pid' => $topid,
                        'mark' => 'branch-'.$dir,
                        'name' => $left['name'],
                        'icon' => $left['icon'] ? $left['icon'] : 'fa fa-th-large',
                        'target' => 0,
                        'hidden' => 0,
                        'displayorder' => 0,
                    ));
                    $leftid = $this->db->insert_id();
                    foreach ($left['menu'] as $link) {
                        $this->system_model->add_member_menu(array(
                            'pid' => $leftid,
                            'url' => '',
                            'uri' => 'member/'.$link['uri'],
                            'mark' => 'branch-'.$dir,
                            'name' => $link['name'],
                            'icon' => $link['icon'] ? $link['icon'] : 'fa fa-th-large',
                            'target' => 0,
                            'hidden' => 0,
                            'displayorder' => 0,
                        ));
                    }
                }
            }
        }
        // 安装完成写入锁定文件
        @file_put_contents($path.'install.lock', time());
        if (!is_file($path.'install.lock')) {
            $this->admin_msg('文件权限不足,请手动创建install.lock文件');
        }
        $this->admin_msg(fc_lang('安装成功'), dr_url('upgrade/index'), 1);
    }

    // 卸载分支系统
    public function uninstall() {

        $dir = dr_safe_replace($_GET['dir']);
        $path = FCPATH.'branch/'.$dir.'/';
        if (!is_dir($path)) {
            $this->admin_msg('目录不存在');
        } elseif (!is_file($path.'uninstall.sql')) {
            $this->admin_msg('执行卸载SQL不存在');
        }

        // 运行SQL
        if ($sql = file_get_contents($path.'uninstall.sql')) {
            $this->_query(str_replace('{dbprefix}', $this->db->dbprefix, $sql));
        }

        // 运行脚本
        if (is_file($path.'uninstall.php')) {
            require $path.'uninstall.php';
        }

        // 删除后台菜单
        $this->db->where('mark', 'branch-'.$dir)->delete('admin_menu');
        $this->db->like('mark', 'branch-'.$dir.'-%')->delete('admin_menu');
        // 删除会员菜单
        $this->db->where('mark', 'branch-'.$dir)->delete('member_menu');
        $this->db->like('mark', 'branch-'.$dir.'-%')->delete('member_menu');

        // 删除锁定文件
        @unlink($path.'install.lock');
        if (is_file($path.'install.lock')) {
            $this->admin_msg('文件权限不足,请手动删除install.lock文件');
        }
        $this->admin_msg(fc_lang('卸载成功'), dr_url('upgrade/index'), 1);
    }


    /**
     * 更多扩展程序
     */
    public function more() {

        $this->template->assign(array(
            'url' => 'http://update.dayrui.com/index.php?c=more&fc='.DR_LICENSE_ID.'&admin='.ADMIN_URL.SELF,
            'menu' => $this->get_menu(array(
                fc_lang('程序管理') => 'admin/upgrade/index'
            ))
        ));
        $this->template->display('online.html');
    }

    /**
     * 程序升级环境
     */
    public function branch() {

        $this->index();exit;

        $branch = require WEBPATH.'config/version_branch.php';
        $this->template->assign(array(
            'url' => 'http://update.dayrui.com/index.php?c=branch&fc='.DR_LICENSE_ID.'&id='.$branch['V_ID'].'&eid='.$branch['V_VERSION_ID'].'&site='.urlencode(SITE_URL).'&admin='.ADMIN_URL.SELF,
            'menu' => $this->get_menu(array(
                fc_lang('内核升级') => 'admin/upgrade/index'
            ))
        ));
        $this->template->display('online.html');
    }

    /**
     * 检查下载程序
     */
    public function update() {

        $rid = $this->rid = (int)$this->input->get('rid');
        $branch = (int)$this->input->get('branch');
        if ($branch) {
            $dir = $this->branch[$branch];
            if (!$dir) {
                $this->admin_msg('此程序'.$branch.'不存在');
            } elseif (!is_dir(FCPATH.'branch/'.$dir.'/')) {
                $this->admin_msg('程序目录'.FCPATH.'branch/'.$dir.'/'.'不存在');
            }
            $branch = require FCPATH.'branch/'.$dir.'/version.php';
            if ($rid) {
                if ($branch['V_VERSION_ID'] != $rid) {
                    $this->admin_msg('您的系统版本不满足重新升级的条件');
                }
            } else {

            }
        } else {
            if ($rid) {
                if (DR_VERSION_ID != $rid) {
                    $this->admin_msg('您的系统版本不满足重新升级的条件');
                }
            } else {
                if (DR_VERSION_ID != $this->input->get('id') - 1) {
                    $this->admin_msg('您的系统版本不满足升级条件');
                }
            }
        }

        $data = dr_catcher_data(urldecode($this->input->get('fid')));
        if (!$data) {
            $this->admin_msg('您的服务器不支持远程下载');
        } elseif ($data == -1) {
            $this->admin_msg('更新包数据不存在');
        } elseif ($data == -2) {
            $this->admin_msg('您无权限下载更新包');
        } elseif ($data == -3) {
            $this->admin_msg('您的账号认证失败，请检查密码是否正确');
        } elseif ($data == -4) {
            $this->admin_msg('服务端核心文件不完整(2)，请联系在线客服纠正');
        } elseif ($data == -5) {
            $this->admin_msg('服务端文件不完整(1)，请联系在线客服纠正');
        } elseif ($data == -6) {
            $this->admin_msg('您的账号尚未认证通过，请联系在线客服补全资料');
        }

        $save = WEBPATH.'cache/down/update.zip';
        $check = WEBPATH.'cache/down/update/';
        if (!@file_put_contents($save, $data)) {
            $this->admin_msg('目录/cache/down/没有写入权限');
        }

        // 解压缩文件
        $this->load->helper('file');
        $this->load->library('Pclzip');
        $this->pclzip->PclFile($save);
        if ($this->pclzip->extract(PCLZIP_OPT_PATH, $check, PCLZIP_OPT_REPLACE_NEWER) == 0) {
            @unlink($save);
            delete_files(WEBPATH.'cache/down/', TRUE);
            $this->admin_msg("Error : " . $this->pclzip->errorInfo(true));
        }

        // 检查版本文件
        if ($branch) {
            if (!is_file($check.'dayrui/'.$this->branch[$branch].'/version.php')
                || !filesize($check.'dayrui/'.$this->branch[$branch].'/version.php')) {
                delete_files(WEBPATH.'cache/down/', TRUE);
                $this->admin_msg('升级文件不完整，没有找到版本文件');
            }
        } else {
            if (!is_file($check.'config/version.php') || !filesize($check.'config/version.php')) {
                delete_files(WEBPATH.'cache/down/', TRUE);
                $this->admin_msg('升级文件不完整，没有找到版本文件');
            }
        }

        // 覆盖至网站根目录
        $this->pclzip->extract(PCLZIP_OPT_PATH, WEBPATH, PCLZIP_OPT_REPLACE_NEWER);

        // 逐一验证文件是否被覆盖
        $this->_check_file(WEBPATH.'cache/down/update/');

        // 删除更新包
        $this->dcache->set('install', TRUE);
        delete_files(WEBPATH.'cache/down/', TRUE);

        // 运行SQL语句
        if (is_file(WEBPATH.'update.sql')) {
            $sql = file_get_contents(WEBPATH.'update.sql');
            $sql = str_replace('{dbprefix}', $this->db->dbprefix, $sql);
            $sql_data = explode(';SQL_FINECMS_EOL', trim(str_replace(array(PHP_EOL, chr(13), chr(10)), 'SQL_FINECMS_EOL', $sql)));
            foreach($sql_data as $query){
                if (!$query) continue;
                $queries = explode('SQL_FINECMS_EOL', trim($query));
                $ret = '';
                foreach($queries as $query) {
                    $ret .= $query[0] == '#' || $query[0].$query[1] == '--' ? '' : $query;
                }
                if (!$ret) continue;
                $this->db->query($ret);
            }
            @unlink(WEBPATH.'update.sql');
        }

        $this->system_log('升级版本'); // 记录日志
        //检查update控制器
        if (is_file(FCPATH.'dayrui/controllers/admin/Update.php')) {
            $this->admin_msg('正在升级数据，请稍候...', dr_url('update/index'), 2);
        }

        $this->admin_msg('升级完成，请按F5刷新整个页面', dr_url('home/main'), 1);
    }

    // 遍历检测文件
    private function _check_file($source_dir, $directory_depth = 0) {

        if ($fp = @opendir($source_dir)) {
            $filedata	= array();
            $new_depth	= $directory_depth - 1;
            $source_dir	= rtrim($source_dir, DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR;
            while (FALSE !== ($file = readdir($fp))) {
                if ($file === '.'
                    || $file === '..'
                    || $file[0] === '.') {
                    continue;
                }
                is_dir($source_dir.$file) && $file .= DIRECTORY_SEPARATOR;

                if (($directory_depth < 1 || $new_depth > 0)
                    && is_dir($source_dir.$file)) {
                    $filedata[$file] = $this->_check_file($source_dir.$file, $new_depth);
                } else {
                    $file1 = $source_dir.$file; // 更新包文件
                    if (!is_file($file1)) {
                        $this->admin_msg($file1.'不存在');
                    }
                    $file2 = str_replace('cache/down/update/', '', $source_dir).$file; // 当前系统文件
                    if (is_file($file2)) {
                        $md1 = md5(file_get_contents($file1));
                        $md2 = md5(file_get_contents($file2));
                        if ($md1 != $md2) {
                            delete_files(WEBPATH.'cache/down/', TRUE);
                            delete_files(WEBPATH.'cache/backup/'.$this->version.'/', TRUE);
                            $this->admin_msg('文件/'.str_replace(FCPATH, '', $file2).'覆盖失败，<br>在线升级前请给全站可写权限，以便更新文件的写入<br>然后再点“重新升级”的链接升级程序');
                            exit;
                        }
                    }
                }
            }
            closedir($fp);
            return $filedata;
        }
    }

    // 执行sql
    private function _query($sql) {

        if (!$sql) {
            return NULL;
        }

        $sql_data = explode(';SQL_FINECMS_EOL', trim(str_replace(array(PHP_EOL, chr(13), chr(10)), 'SQL_FINECMS_EOL', $sql)));

        foreach($sql_data as $query){
            if (!$query) {
                continue;
            }
            $ret = '';
            $queries = explode('SQL_FINECMS_EOL', trim($query));
            foreach($queries as $query) {
                $ret.= $query[0] == '#' || $query[0].$query[1] == '--' ? '' : $query;
            }
            if (!$ret) {
                continue;
            }
            $this->db->query($ret);
        }
    }

}
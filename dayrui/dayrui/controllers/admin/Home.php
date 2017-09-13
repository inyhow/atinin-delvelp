<?php

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Chunjie <chunjie@dayrui.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Home extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->output->enable_profiler(FALSE);
    }

    /**
     * 重置
     */
    public function home() {
        $this->index();
    }

    /**
     * 首页
     */
    public function index() {

        if ($this->admin['color'] == 'v2') {
            $top = array();
            $smenu = $this->_get_menu();
            $topid = $id = 0;
            $mymenu = TRUE;
            $sitemap = $string = '';
            foreach ($smenu as $ii => $t) {
                $_left = $select = 0;
                $selurl	= '';
                $_first	= FALSE;
                $string.= '<div class="d_menu" id="D_M_'.$ii.'"'.($topid == 0 ? '' : 'style="display:none"').'>';
                $sitemap.= '<div class="d_top"><div class="d_name">'.fc_lang($t['top']['name']).'</div><ul>';
                foreach ($t['data'] as $left) {
                    $string.= '<div class="subnav '.($_left ? '' : 'subnav-hidden').'">';
                    $string.= '<div class="subnav-title">';
                    $string.= '<a href="#" class="toggle-subnav">';
                    $string.= '<i class="iconm icon-angle-'.($_left ? 'right' : 'down').'"></i>';
                    $string.= '<span>'.fc_lang($left['left']['name']).'</span></a>';
                    $string.= '</div>';
                    $string.= '<ul class="subnav-menu" style="'.($_left ? 'display:none' : '').'">';
                    $_left = 1;
                    foreach ($left['data'] as $link) {
                        $id ++;
                        if ($_first == FALSE) {
                            $class = 'dropdown';
                            $select	= $id;
                            $selurl	= $link['url'];
                            $_first	= TRUE;
                        } else {
                            $class = '';
                        }
                        $link['icon'] = $link['icon'] ? $link['icon'] : 'icon-th-large';
                        $string.= '<li id="_MP_'.$id.'" class="'.$class.'"><a href="javascript:_MP(\''.$id.'\', \''.$link['url'].'\');" ><i class="iconm '.$link['icon'].'"></i> '.fc_lang($link['name']).'</a></li>';
                        if ($mymenu == TRUE && $this->admin['usermenu']) {
                            foreach ($this->admin['usermenu'] as $my) {
                                $id ++;
                                $ico = strpos($my['name'], 'icon-') ? ' ' : '<i class="iconm icon-th-large"></i> ';
                                $string.= '<li id="_MP_'.$id.'"><a href="javascript:_MP(\''.$id.'\', \''.$my['url'].'\');">'.$ico.$my['name'].'</a></li>';
                            }
                            $mymenu = FALSE;
                        }
                        $sitemap.= '<li><a href="javascript:_MAP(\''.$ii.'\', \''.$id.'\', \''.$link['url'].'\');" >'.fc_lang($link['name']).'</a></li>';
                    }
                    $string.= '</ul>';
                    $string.= '</div>';
                }
                $string.= '</div>';
                $sitemap.= '</ul></div>';
                $sitemap = $topid == 0 ? '' : $sitemap;
                $t['top']['selurl'] = $selurl;
                $t['top']['select'] = $select;
                $top[$topid] = $t['top'];
                $topid ++;
            }
            $this->template->assign(array(
                'top' => $top,
                'left' => $string,
                'sitemap' => $sitemap,
            ));
        } else {
            $top = array();
            $smenu = $this->_get_menu();
            $topid = 0; // 顶部菜单id
            $top_menu = array(); // 生成的菜单
            foreach ($smenu as $ii => $t) {
                //$string.= '<li class="heading"><h3 class="uppercase" id="D_T_'.$ii.'">'.$t['top']['name'].'</h3></li>';
                $_link = 0; // 是否第一个链接菜单，0表示第一个
                $_left = 0; // 是否第一个分组菜单，0表示第一个
                $string = '';
                foreach ($t['data'] as $left) {
                    $string.= '<li id="D_M_'.$left['left']['id'].'" class="dr_left nav-item '.($_left ? '' : 'active open').'">
                    <a href="javascript:;" class="nav-link nav-toggle">
                        <i class="'.$left['left']['icon'].'"></i>
                        <span class="title">'.fc_lang($left['left']['name']).'</span>
                        <span class="arrow '.($_left ? '' : 'open').'"></span>
                    </a>';
                    if (defined('SYS_CATE_SHARE') && SYS_CATE_SHARE && $left['left']['mark'] == 'share-content') {
                        $string.= ' <ul class="sub-menu" style="margin-top:0">';
                        // 表示共享栏目的内容管理
                        require FCPATH.'dayrui/libraries/CategoryTree.php';
                        $cat = $this->get_cache('module-'.SITE_ID.'-share', 'category');
                        $now = array();
                        if ($cat) {
                            // 判断管理权限
                            foreach ($cat as $i => $c) {
                                if ($this->admin['adminid'] != 1
                                    && !$c['child']
                                    && !$c['setting']['admin'][$this->admin['adminid']]['show']) {
                                  unset($cat[$i]);
                                } elseif (!$c['child'] && $c['mid'] && !$now) {
                                    $now = $c;
                                }
                                $cat[$i]['url'] = $c['mid'] ? dr_url($c['mid'].'/home/index', array('catid'=>$c['id'])) : dr_url('category_share/edit', array('id'=>$c['id']));
                            }
                        }
                        $tree = new CategoryTree($cat);
                        $string.= '<li> '.$tree->get_treeview(0, 'tree').'</li>';
                    } else {
                        $string.= ' <ul class="sub-menu">';
                    }
                    $_left = 1; // 标识以后的菜单就不是第一个了
                    foreach ($left['data'] as $link) {
                        if (!$_link) {
                            // 第一个链接菜单时 指定class
                            $class = 'dr_link nav-item active open';
                            $t['top']['link'] = $link;
                        } else {
                            $class = 'dr_link nav-item';
                        }
                        $_link = 1; // 标识以后的菜单就不是第一个了
                        $link['icon'] = $link['icon'] ? $link['icon'] : 'icon-th-large';
                        $string.= '<li tid="'.$ii.'" fid="'.$left['left']['id'].'" id="_MP_'.$link['id'].'" class="'.$class.'"><a href="javascript:_MP(\''.$link['id'].'\', \''.$link['url'].'\');" ><i class="iconm '.$link['icon'].'"></i> <span class="title">'.fc_lang($link['name']).'</span></a></li>';
                    }

                    $string.= '</ul>';
                    $string.= '</li>';
                    $top_menu[$ii] = $string;
                }
                unset($t['top']['left']);
                $top[$topid] = $t['top'];
                $topid ++;
            }
            $this->template->assign(array(
                'top' => $top,
                'left' => $top_menu,
            ));
        }

        $mysite = array();
        foreach ($this->site_info as $sid => $t) {
            if ($this->admin['adminid'] == 1
                || ($this->admin['role']['site'] && in_array($sid, $this->admin['role']['site']))) {
                $mysite[$sid] = $t['SITE_NAME'];
            }
        }

        ob_clean();
        $this->template->assign('sys_color', array(
            'default' => '#333438',
            'blue' => '#368ee0',
            'darkblue' => '#2b3643',
            'grey' => '#697380',
            'light' => '#F9FAFD',
            'light2' => '#F1F1F1',
            //'v2' => '#368ee0',
        ));
        $this->template->assign(array(
            'mysite' => $mysite,
        ));

        if ($this->admin['color'] == 'v2') {
            $this->template->display('index2.html');
        } else {
            $this->template->display('index.html');
        }

    }

    /**
     * 菜单缓存格式化
     */
    private function _get_menu() {

        $menu = $this->dcache->get('menu');
        $smenu = array();
        if (!$menu) {
            $this->load->model('menu_model');
            $menu = $this->menu_model->cache();
        }

        foreach ($menu as $t) {
            if ($t['mark'] == 'myspace' && !MEMBER_OPEN_SPACE) {
                continue; // 空间开启之后再显示
            } elseif ($t['mark'] == 'share' && !SYS_SHARE) {
                continue; // 存在共享模块时再显示内容菜单
            } elseif (is_array($t['left'])) {
                $left = array();
                if ($t['mark'] && strpos($t['mark'], 'module-') === 0) {
                    list($a, $dir) = explode('-', $t['mark']);
                    $mod = $this->get_cache('module-'.SITE_ID.'-'.$dir);
                    if (!$mod) {
                        continue; // 当前站点模块不存在时不显示
                    }
                }
                foreach ($t['left'] as $m) {
                    $link = array();
                    if (is_array($m['link'])) {
                        foreach ($m['link'] as $n) {
                            $n['tid'] = $t['id'];
                            if (!$n['uri'] && $n['url']) {
                                $link[] = $n;
                            } elseif ($this->is_auth($n['uri'])) {
                                // 判断表单权限
                                if ($n['mark']
                                    && strpos($n['mark'], 'module-') === 0
                                    && strpos($n['uri'], 'admin/form_')
                                    && substr_count($n['mark'], '-') == 3) {
                                    list($a, $mod, $sid, $mid) = explode('-', $n['mark']);
                                    // 判断是否是当前站点
                                    if ($sid != SITE_ID) {
                                        continue;
                                    } elseif (!$this->is_auth($mod.'/admin/home/index')) {
                                        continue; // 判断是否具有内容管理权限
                                    }
                                }
                                $n['url'] = $this->duri->uri2url($n['uri']);
                                $link[] = $n;
                            }
                        }
                    }
                    if ($link || $m['mark'] == 'share-content') {
                        $left[] = array('left' => $m, 'data' => $link);
                    }
                }
                if ($left) {
                    $smenu[$t['id']] = array('top' => $t, 'data' => $left);
                }
            }
        }

        return $smenu;
    }

    // 初始化系统
    public function init() {

        // 首次安装系统判断
        if (!is_file(WEBPATH.'cache/install.new')) {
            $this->admin_msg(fc_lang('正在为您更新全站缓存...'), dr_url('home/cache'), 2, 2);
            exit;
        }

        $this->template->assign(array(
            'step' => $this->_get_step(),
        ));
        $this->template->display('init.html');
    }

    /**
     * 后台首页
     */
    public function main() {

        // 首次安装系统-跳转到欢迎界面-并安装默认模块
        if ($this->dcache->get('install')) {
            $this->admin_msg(fc_lang('欢迎使用FineCMS软件...'), dr_url('home/init'), 2);
            exit;
        }

        $store = array();

        // 搜索本地模块
        $local = @array_diff(dr_dir_map(FCPATH.'module/', 1), array('member'));
        if ($local) {
            foreach ($local as $dir) {
                if (is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
                    $config = require FCPATH.'module/'.$dir.'/config/module.php';
                    if ($config['key']) {
                        if (isset($store[$config['key']])) {
                            if (version_compare($config['version'], $store[$config['key']], '<')) {
                                $store[$config['key']] = $config['version'];
                            }
                        } else {
                            $store[$config['key']] = $config['version'];
                        }
                    }
                }
            }
        }

        // 搜索本地应用
        $local = dr_dir_map(FCPATH.'app/', 1);
        if ($local) {
            foreach ($local as $dir) {
                if (is_file(FCPATH.'app/'.$dir.'/config/app.php')) {
                    $config = require FCPATH.'app/'.$dir.'/config/app.php';
                    if ($config['key']) {
                        $store[$config['key']] = $config['version'];
                    }
                }
            }
        }

        // 判断管理员ip状况
        $ip = '';
        $login = $this->db->where('uid', $this->uid)->order_by('logintime desc') ->limit(2)->get('admin_login')->result_array();
        if ($login
            && count($login) == 2
            && $login[0]['loginip'] != $login[1]['loginip']) {
            $this->load->library('dip');
            $now = $this->dip->address($login[0]['loginip']);
            $last = $this->dip->address($login[1]['loginip']);
            if (@strpos($now, $last) === FALSE
                && @strpos($last, $now) === FALSE) {
                // Ip异常判断
                $ip = fc_lang('登录IP出现异常，您上次登录IP是%s【%s】，请确认是本人登录，<a href="%s" style="color:blue">账号登录查询</a>', $login[1]['loginip'], $last, dr_url('root/log', array('uid' => $this->uid)));
            }
        }

        // 统计模块数据
        $total = array();
        $module = $this->get_module(SITE_ID);
        if ($module) {
            // 查询模块的菜单
            $mymenu = $this->_get_mymenu();
            // 判断审核权限
            if ($this->admin['adminid'] != 1) {
                $my = $this->_get_verify();
                $my = $my[$this->admin['adminid']];
            }
            foreach ($module as $dir => $mod) {
                // 判断模块表是否存在
                if (!$this->site[SITE_ID]->query("SHOW TABLES LIKE '%".$this->db->dbprefix(SITE_ID.'_'.$dir.'_verify')."%'")->row_array()) {
                    continue;
                }
                $total[$dir] = array(
                    'name' => fc_lang($mod['name']),
                    'today' => $this->_set_k_url($mymenu, $dir.'/admin/home/index', $dir.'/admin/home/index'),
                    'content' => $this->_set_k_url($mymenu, $dir.'/admin/home/index', $dir.'/admin/home/index'),
                    'content_verify' => $this->_set_k_url($mymenu, $dir.'/admin/home/verify', $dir.'/admin/home/verify'),
                    'extend_verify' => 'javascript:;',
                    'add' => $this->_set_k_url($mymenu, $dir.'/admin/home/index', $dir.'/admin/home/add'),
                    'url' => $mod['url'],
                );
                if ($this->admin['adminid'] == 1) {
                    // 扩展审核数据
                    if (is_file(FCPATH.'module/'.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $this->_set_k_url($mymenu, $dir.'/admin/verify/index', $dir.'/admin/verify/index');
                    }
                } else {
                    if (!$my) {
                        continue;
                    }
                    if (is_file(FCPATH.'module/'.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $this->_set_k_url($mymenu, $dir.'/admin/verify/index', $dir.'/admin/verify/index');
                    }
                }
            }
            $total['member'] = array(
                'name' => fc_lang('会员'),
                'today' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
                'content' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
                'content_verify' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index/groupid/1'),
                'extend_verify' => 'javascript:;',
                'add' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
                'url' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
            );
        }

        $branch = array();
        if ($this->branch) {
            foreach ($this->branch as $dir) {
                if (is_file(FCPATH.'branch/'.$dir.'/version.php')) {
                    $branch[$dir] = require FCPATH.'branch/'.$dir.'/version.php';
                }
            }
        }

        $server = @explode(' ', strtolower($_SERVER['SERVER_SOFTWARE']));
        if (isset($server[0]) && $server[0]) {
            $server = dr_strcut($server[0], 15);
        } else {
            $server = 'web';
        }

        // 
        $notice = $this->db->query('select * from `'.$this->db->dbprefix('admin_notice').'` where ((`to_uid`='.$this->uid.') or (`to_rid`='.$this->member['adminid'].') or (`to_uid`=0 and `to_rid`=0)) and `status`<>3 order by `status` asc, `inputtime` desc')->result_array();

        $this->template->assign(array(
            'ip' => $ip,
            'sip' => $this->_get_server_ip(),
            'store' => dr_base64_encode(dr_array2string($store)),
            'mymain' => 1,
            'mtotal' => $total,
            'branch' => $branch,
            'server' => ucfirst($server),
            'notice' => $notice,
            'notice_url' => $this->_set_k_url($mymenu, 'admin/notice/index', 'admin/notice/my'),
            'sqlversion' => $this->db->version(),
        ));
        $this->template->display('main.html');
    }

    /**
     * 更新全站缓存
     */
    public function cache() {

        $this->system_log('更新全站缓存'); // 记录日志

        $url = array(
            array(
                'url' => dr_url('site/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('站点管理')),
            ),
            array(
                'url' => dr_url('application/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('应用管理')),
            ),
            array(
                'url' => dr_url('role/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('角色管理')),
            ),
            array(
                'url' => dr_url('menu/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('后台菜单')),
            ),
            array(
                'url' => dr_url('mail/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('邮件系统')),
            ),
            array(
                'url' => dr_url('verify/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('审核流程')),
            ),
            array(
                'url' => dr_url('sysvar/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('全局变量')),
            ),
            array(
                'url' => dr_url('urlrule/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('URL规则')),
            ),
            array(
                'url' => dr_url('attachment2/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('远程附件')),
            ),
            array(
                'url' => dr_url('downservers/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('下载镜像')),
            ),
            array(
                'url' => dr_url('member/menu/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('会员菜单')),
            ),
            array(
                'url' => dr_url('member/setting/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('会员')),
            ),
        );

        $branch = array();
        $local = dr_dir_map(FCPATH.'branch/', 1);
        if ($local) {
            foreach ($local as $dir) {
                if (is_file(FCPATH.'branch/'.$dir.'/install.lock')) {
                    $config = require FCPATH.'branch/'.$dir.'/version.php';
                    $branch[$config['V_ID']] = $dir;
                    $cache = require FCPATH.'branch/'.$dir.'/cache.php';
                    if ($cache) {
                        foreach ($cache as $i => $t) {
                            $url[] = array(
                                'url' => dr_url($i),
                                'name' => fc_lang($t),
                            );
                        }
                    }
                }
            }
        }
        // 生成分支系统配置文件
        $this->load->library('dconfig');
        $this->dconfig->file(WEBPATH.'config/branch.php')->note('分支系统文件')->space(32)->to_require_one($branch);

        if (is_dir(FCPATH.'module/space') && $this->get_cache('member', 'setting', 'space')) {
            $url[] = array(
                'url' => dr_url('space/model/cache', array('admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('会员空间')),
            );
        }

        // 模块缓存
        $module = $this->db->select('disabled,dirname')->get('module')->result_array();
        if ($module) {
            foreach ($module as $mod) {
                if ($mod['disabled'] == 0) {
                    $url[] = array(
                        'url' => dr_url('module/cache', array('dir' => $mod['dirname'], 'admin' => 1)),
                        'name' => fc_lang('模块(%s)缓存', $mod['dirname'])
                    );
                }
            }
        }
        $url[] = array(
            'url' => dr_url('module/cache', array('dir' => 'share', 'admin' => 1)),
            'name' => fc_lang('共享模块')
        );

        $i = 1;
        $count = count($this->site_info);
        foreach ($this->site_info as $sid => $t) { // 分站点缓存
            $url[] = array(
                'url' => dr_url('form/cache', array('site' => $sid, 'admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('表单'))."($i/$count)"
            );
            $url[] = array(
                'url' => dr_url('block/cache', array('site' => $sid, 'admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('资料块'))."($i/$count)"
            );
            $url[] = array(
                'url' => dr_url('page/cache', array('site' => $sid, 'admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('单页管理'))."($i/$count)"
            );
            $url[] = array(
                'url' => dr_url('linkage/cache', array('site' => $sid, 'admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('联动菜单'))."($i/$count)"
            );
            $url[] = array(
                'url' => dr_url('navigator/cache', array('site' => $sid, 'admin' => 1)),
                'name' => fc_lang('%s缓存', fc_lang('网站导航'))."($i/$count)"
            );
            $i ++;
        }

        // 应用缓存
        $app = $this->db->select('disabled,dirname')->get('application')->result_array();
        $aurl = array();
        if ($app) {
            foreach ($app as $a) {
                if ($a['disabled'] == 0) {
                    $aurl[$a['dirname']] = dr_url($a['dirname'].'/home/cache', array('admin' => 1));
                }
            }
        }

        $this->load->helper('file');
        if (!IS_AJAX) {
            delete_files(WEBPATH.'cache/data/');
        }

        $this->dcache->set('version', DR_VERSION); // 生成版本标识符

        $this->template->assign(array(
            'app' => $aurl,
            'list' => $url,
        ));
        $this->template->display('cache.html');

    }

    // 清除缓存数据
    public function clear() {
        if (IS_AJAX || $this->input->get('todo')) {
            $this->_clear_data();
            if (!IS_AJAX) {
                $this->admin_msg(fc_lang('全站缓存数据更新成功'), '', 1);
            }
        } else {
            $this->admin_msg('Clear ... ', dr_url('home/clear', array('todo' => 1)), 2);
        }
    }

    // 域名检查
    public function domain() {
        $ip = $this->_get_server_ip();
        $domain = $this->input->get('domain');
        if (gethostbyname($domain) != $ip) {
            exit(fc_lang('请将域名【%s】解析到【%s】', $domain, $ip));
        }
        exit('');
    }

    // 清除缓存数据
    private function _clear_data() {

        // 删除全部缓存文件
        $this->load->helper('file');
        delete_files(WEBPATH.'cache/sql/');
        delete_files(WEBPATH.'cache/file/');
        delete_files(WEBPATH.'cache/page/');
        delete_files(WEBPATH.'cache/index/');
        delete_files(WEBPATH.'cache/attach/');
        delete_files(WEBPATH.'cache/thumb/');
        delete_files(WEBPATH.'cache/templates/');


        // 删除memcache缓存
        if (SYS_MEMCACHE && $this->cache->memcached->is_supported()) {
            $this->cache->memcached->clean();
        }

        // 模块缓存
        $module = $this->db->select('disabled,dirname')->get('module')->result_array();
        if ($module) {
            foreach ($module as $mod) {
                $site = dr_string2array($mod['site']);
                if ($site[SITE_ID]) {
                    $this->site[SITE_ID]->where('inputtime<>', 0)->delete(SITE_ID.'_'.$mod['dirname'].'_search');
                }
            }
        }


        $this->hooks->call_hook('clear_cache'); // 清除缓存钩子

    }

    // 页面统计是的url
    private function _set_k_url($menu, $nuri, $uri) {
        return 'javascript:parent._MAP(\''.intval($menu[$nuri]['id']).'\', \''.intval($menu[$nuri]['top_id']).'\', \''.$this->duri->uri2url($uri).'\');';
    }

    // 格式菜单
    private function _get_mymenu() {

        $mymenu = $this->dcache->get('mymenu');
        if (!$mymenu) {
            $menu = $this->dcache->get('menu');
            $mymenu = array(); // 按照uri存储
            if (!$menu) {
                $this->load->model('menu_model');
                $menu = $this->menu_model->cache();
            }
            if ($menu) {
                foreach ($menu as $t) {
                    if ($t['left']) {
                        foreach ($t['left'] as $t2) {
                            if ($t2['link']) {
                                foreach ($t2['link'] as $t3) {
                                    $t3['top_id'] = $t['id'];
                                    $t3['left_id'] = $t2['id'];
                                    $mymenu[$t3['uri']] = $t3;
                                }
                            }
                        }
                    }
                }
            }
            $this->dcache->set('mymenu', $mymenu);
        }

        return $mymenu;
    }

    // 统计数据
    public function mtotal() {

        // 统计模块数据
        $total = $this->get_cache_data('admin_mtotal_'.SITE_ID);
        $module = $this->get_module(SITE_ID);
        if (!$module) {
            exit;
        }

        if (!$total) {
            // 查询模块的菜单
            $top = array();
            $menu = $this->db
                ->where('pid=0')
                ->where('hidden', 0)
                ->order_by('displayorder ASC,id ASC')
                ->get('admin_menu')
                ->result_array();
            if ($menu) {
                $i = 0;
                foreach ($menu as $t) {
                    list($a, $dir) = @explode('-', $t['mark']);
                    if ($dir && !$module[$dir] && $dir != 'weixin') {
                        continue;
                    }
                    $top[$dir] = $i;
                    $i++;
                }
            }
            // 判断审核权限
            if ($this->admin['adminid'] != 1) {
                $my = $this->_get_verify();
                $my = $my[$this->admin['adminid']];
            }
            $db = $this->site[SITE_ID];
            foreach ($module as $dir => $mod) {
                // 判断模块表是否存在
                if (!$db->query("SHOW TABLES LIKE '%".$this->db->dbprefix(SITE_ID.'_'.$dir.'_verify')."%'")->row_array()) {
                    continue;
                }
                //
                $total[$dir] = array(
                    'today' => $db->where('status=9')->where('DATEDIFF(from_unixtime(inputtime),now())=0')->count_all_results(SITE_ID.'_'.$dir.'_index'),
                    'content' => $db->where('status=9')->count_all_results(SITE_ID.'_'.$dir.'_index'),
                    'content_verify' => 0,
                    'extend_verify' => 0,
                );
                if ($this->admin['adminid'] == 1) {
                    // 管理员显示审核全部流程数据
                    $total[$dir]['content_verify'] = $db->where('status<>0')->count_all_results(SITE_ID.'_'.$dir.'_verify');
                    // 扩展审核数据
                    if (is_file(WEBPATH.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $db->where('status<>0')->count_all_results(SITE_ID.'_'.$dir.'_extend_verify');
                    }
                } else {
                    if (!$my) {
                        continue;
                    }
                    $total[$dir]['content_verify'] = $db->where_in('status', $my)->count_all_results(SITE_ID.'_'.$dir.'_verify');
                    if (is_file(WEBPATH.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $db->where_in('status', $my)->count_all_results(SITE_ID.'_'.$dir.'_extend_verify');
                    }
                }
            }
            $total['member'] = array(
                'today' => $this->db->where('DATEDIFF(from_unixtime(regtime),now())=0')->count_all_results('member'),
                'content' => $this->db->count_all_results('member'),
                'content_verify' => $this->db->where('groupid', 1)->count_all_results('member'),
                'extend_verify' => 0,
            );
            $this->set_cache_data('admin_mtotal_'.SITE_ID, $total, 60);
        }

        if (!$total) {
            exit;
        }

        // AJAX输出
        foreach ($total as $dir => $t) {
            echo '$("#'.$dir.'_today").html('.$t['today'].');';
            echo '$("#'.$dir.'_content").html('.$t['content'].');';
            echo '$("#'.$dir.'_content_verify").html('.$t['content_verify'].');';
            echo '$("#'.$dir.'_extend_verify").html('.$t['extend_verify'].');';
        }

    }
}
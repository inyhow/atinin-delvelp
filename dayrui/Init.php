<?php

define('EXT', '.php'); // PHP文件扩展名
define('SYSDIR', 'system'); // “系统文件夹”的名称
define('BASEPATH', FCPATH . 'dayrui/system/'); // CI框架目录
define('VIEWPATH', FCPATH . 'dayrui/'); // 定义视图目录，我们把它当做主项目目录
define('ENVIRONMENT', WEBPATH . 'config'); // 环境配置文件目录

require ENVIRONMENT.'/user_agents.php';

// 客户端判定
$host = strtolower($_SERVER['HTTP_HOST']);
$is_mobile = 0;
if ($mobiles) {
    foreach ($mobiles as $key => $val) {
        if (FALSE !== (strpos(strtolower($_SERVER['HTTP_USER_AGENT']), $key))) {
            // 表示移动端
            $is_mobile = 1;
            break;
        }
    }
}

define('IS_PC', !$is_mobile); // 是否pc端
define('IS_MOBILE', $is_mobile); // 是否移动端
define('DOMAIN_NAME', $host); // 当前域名

// 解析自定义域名
if (is_file(ENVIRONMENT.'/module_domain.php')){
    $domain = require ENVIRONMENT.'/module_domain.php';
    if ($domain) {
        if (isset($domain[$host]) && $domain[$host]
            && is_dir(FCPATH.'module/'.$domain[$host])) {
            $_GET['s'] = $domain[$host]; // 强制定义为模块
        } elseif (isset($domain['space']) && $domain['space']
            && strpos($host, $domain['space'])) {
            $domain = require ENVIRONMENT.'/domain.php';
            $system = require ENVIRONMENT.'/system.php';
            if (!isset($domain[$host]) && $system['SYS_DOMAIN'] != $host) {
                $_GET['s'] = 'space'; // 强制定义为模块
            }
        }
    }
    unset($domain);
}

// 伪静态字符串
$uu = isset($_SERVER['HTTP_X_REWRITE_URL']) || trim($_SERVER['REQUEST_URI'], '/') == SELF ? trim($_SERVER['HTTP_X_REWRITE_URL'], '/') : ($_SERVER['REQUEST_URI'] ? trim($_SERVER['REQUEST_URI'], '/') : NULL);
$uri = strpos($uu, SELF) === 0 ? '' : $uu;

if (!defined('IS_MEMBER')) {

    // 根据路由来匹配S变量
    if (!IS_ADMIN && $uri) {

        define('PAGE_CACHE_URL', (IS_MOBILE ? 'mobile-' : '').$host.'/'.ltrim($uri, '/'));
        // 加载单页缓存
        if (is_file(WEBPATH.'cache/page/'.md5(PAGE_CACHE_URL).'.html')) {
            exit(file_get_contents(WEBPATH.'cache/page/'.md5(PAGE_CACHE_URL).'.html'));
        }

        define('DR_URI', $uri);
        include WEBPATH.'config/routes.php';
        $rewrite = require WEBPATH.'config/rewrite.php';
        $routes = $rewrite && is_array($rewrite) && count($rewrite) > 0 ? array_merge($routes, $rewrite) : $routes;

        // 正则匹配路由规则
        $value = $u = '';
        foreach ($routes as $key => $val) {
            $match = array();
            if ($key == $uri || @preg_match('/^'.$key.'$/U', $uri, $match)) {
                unset($match[0]);
                $u = $val;
                $value = $match;
                break;
            }

        }
        if ($u) {
            $array = explode('/', $u);
            $s = array_shift($array);
            if (is_dir(FCPATH.'module/'.$s) || is_dir(FCPATH.'app/'.$s)) {
                $_GET['s'] = $s;
                $_GET['c'] = array_shift($array);
                $_GET['m'] = array_shift($array);
            } elseif (is_file(FCPATH.'dayrui/controllers/'.ucfirst($s).'.php')) {
                $_GET['c'] = $s;
                $_GET['m'] = array_shift($array);
            }
            // 组装GET参数
            if ($array) {
                foreach ($array as $k => $t) {
                    if ($i%2 == 0) {
                        $_GET[str_replace('$', '_', $t)] = isset($array[$k+1]) ? $array[$k+1] : '';
                    }
                    $i ++;
                }
                if ($value) {
                    foreach ($_GET as $k => $v) {
                        if (strpos($v, '$') !== FALSE) {
                            $id = (int)substr($v, 1);
                            $_GET[$k] = isset($value[$id]) ? $value[$id] : $v;
                        }
                    }
                }
            }
        } elseif (isset($_GET['s']) && !isset($_GET['c'])) {
            // 只存在唯一一个s参数时给他强制指向home控制器
            $_GET['c'] = 'home';
        }
    }
    // 判断s参数,“应用程序”文件夹目录
    if (isset($_GET['s']) && preg_match('/^[a-z]+$/i', $_GET['s'])) {
        // 判断会员模块,排除后台调用
        if (!IS_ADMIN && $_GET['s'] == 'member' && is_dir(FCPATH . 'module/' . $_GET['s'])) { // 会员
            if ($_GET['mod'] && is_dir(FCPATH . 'module/' . $_GET['mod'])) { // 模块
                define('APPPATH', FCPATH . 'module/' . $_GET['mod'] . '/');
                define('APP_DIR', $_GET['mod']); // 模块目录名称
                $_GET['d'] = 'member'; // 将项目标识作为directory
            } elseif ($_GET['app'] && is_dir(FCPATH . 'app/' . $_GET['app'] . '/')) { // 应用
                define('APPPATH', FCPATH . 'app/' . $_GET['app'] . '/');
                define('APP_DIR', $_GET['app']); // 应用目录名称
                $_GET['d'] = 'member'; // 将项目标识作为directory
            } else {
                define('APPPATH', FCPATH . 'module/member/');
                define('APP_DIR', 'member'); // 模块目录名称
            }
            define('IS_MEMBER', TRUE);
        } elseif (is_dir(FCPATH . 'module/' . $_GET['s'])) { // 模块
            define('APPPATH', FCPATH . 'module/' . $_GET['s'] . '/');
            define('APP_DIR', $_GET['s']); // 识别目录名称
            define('IS_MEMBER', FALSE);
            // 判断加载模块首页静态文件
            $file = WEBPATH.'cache/index/'.(IS_MOBILE ? 'mobile-' : '').DOMAIN_NAME.'-'.APP_DIR.'.html';
            if (!$uu && is_file($file)) {
                exit(file_get_contents($file));
            }
        } elseif (is_dir(FCPATH . 'app/' . $_GET['s'] . '/')) { // 应用
            define('APPPATH', FCPATH . 'app/' . $_GET['s'] . '/');
            define('APP_DIR', $_GET['s']); // 应用目录名称
            define('IS_MEMBER', FALSE);
        }
    } else {
        // 系统主目录
        define('APPPATH', FCPATH . 'dayrui/');
        define('APP_DIR', '');
        define('IS_MEMBER', FALSE);
        // 判断加载网站首页静态文件
        $file = WEBPATH.'cache/index/'.(IS_MOBILE ? 'mobile-' : '').DOMAIN_NAME.'-home.html';
        if (!IS_ADMIN && !$uu && is_file($file)) {
            exit(file_get_contents($file));
        }

    }
} else {
    // 通过百度编辑器/api接口定义的会员模块
    define('APPPATH', FCPATH . 'module/member/');
    define('APP_DIR', 'member');
}

// 请求URI字符串
if (!defined('DR_URI')) {
    define('DR_URI', '');
}

require BASEPATH . 'core/CodeIgniter.php'; // CI框架核心文件
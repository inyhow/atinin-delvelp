<?php

/**
 * Dayrui Website Management System
 *
 * @since	    version 2.7.0
 * @author	    Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/index.php
 */

header('Content-Type: text/html; charset=utf-8');

// 显示错误提示
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING ^ E_STRICT);
if (function_exists('ini_set')) {
    //ini_set('display_errors', TRUE);
    ini_set('memory_limit', '1024M');
}

// 查询执行超时时间
if (function_exists('set_time_limit')) {
    set_time_limit(0);
}

// 系统核心程序目录,支持自定义路径和改名
define('FCPATH', dirname(__FILE__).'/dayrui/');

// web网站目录,表示index.php文件的目录
define('WEBPATH', dirname(__FILE__).'/');


// 该文件的名称
if (!defined('SELF')) {
    define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));
}

// 后台管理标识
if (!defined('IS_ADMIN')) {
    define('IS_ADMIN', FALSE);
}

if (PHP_SAPI === 'cli' || defined('STDIN')) {
    unset($_GET);
    $_GET['c'] = 'cron';
    $_GET['m'] = 'index';
    chdir(dirname(__FILE__));
}

// 执行主程序
require FCPATH.'Init.php';
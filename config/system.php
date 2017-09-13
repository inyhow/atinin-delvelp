<?php

/**
 * Dayrui Website Management System
 * 
 * @since			version 2.7.5
 * @author			Dayrui <dayrui@gmail.com>
 * @license     	http://www.dayrui.com/license
 * @copyright		Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

/**
 * 系统配置文件
 */

return array(

	'SYS_LOG'                       => 0, //后台操作日志开关
	'SYS_KEY'                       => 'FCD3A4652BB37BC', //安全密钥
	'SYS_DEBUG'                     => 0, //调试器开关
	'SYS_HTTPS'                     => '', //HTTPS安全模式
	'SYS_HELP_URL'                  => 'http://help.dayrui.com/', //系统帮助url前缀部分
	'SYS_EMAIL'                     => '383272361@qq.com', //系统收件邮箱，用于接收系统信息
	'SYS_REFERER'                   => 'ODRLOGQZYTQ2NTJIYJM3YMMWNDJMNJU3NTRKZDM2NTY4NWQ3NMI3NZMYOGU5MMFK', //来路字符串
	'SYS_MEMCACHE'                  => 0, //Memcache缓存开关
	'SYS_ATTACHMENT_DIR'            => '', //系统附件目录名称
	'SYS_ATTACHMENT_DB'             => 0, //附件归档存储开关
	'SYS_UPLOAD_DIR'                => 'uploadfile', //附件上传目录
	'SYS_CATE_SHARE'                => '', //共享栏目展示方式
	'SYS_ATTACHMENT_URL'            => '', //附件域名设置
	'SYS_CRON_QUEUE'                => 0, //任务队列方式
	'SYS_CRON_NUMS'                 => 20, //每次执行任务数量
	'SYS_CRON_TIME'                 => 300, //每次执行任务间隔
	'SYS_ONLINE_NUM'                => 1000, //服务器最大在线人数
	'SYS_ONLINE_TIME'               => 7200, //会员在线保持时间(秒)
	'SYS_NAME'                      => 'RsCMS', //
	'SYS_NEWS'                      => 0, //
	'SYS_CMS'                       => 'RsCMS高级版', //
	'SYS_DOMAIN'                    => '', //后台域名
	'SYS_THEME_DOMAIN'              => '', //风格域名
	'SYS_UPDATE'                    => 0, //兼容升级开关
	'SITE_EXPERIENCE'               => '经验值', //经验值名称
	'SITE_SCORE'                    => '金币', //金币名称
	'SITE_MONEY'                    => '金钱', //金钱名称
	'SITE_CONVERT'                  => 10, //金币兑换金钱的比例
	'SITE_PHONE_MONEY'              => 2, //购买联系方式金币数
	'SITE_ADMIN_CODE'               => 0, //后台登录验证码开关
	'SITE_ADMIN_PAGESIZE'           => 8, //后台数据分页显示数量
	'SYS_GEE_CAPTCHA_ID'            => '', //极验验证ID
	'SYS_GEE_PRIVATE_KEY'           => '', //极验验证KEY
	'SYS_CACHE_INDEX'               => 0, //站点首页静态化
	'SYS_CACHE_MINDEX'              => 0, //模块首页静态化
	'SYS_CACHE_MSHOW'               => 0, //模块内容缓存期
	'SYS_CACHE_MSEARCH'             => 1, //模块搜索缓存期
	'SYS_CACHE_SITEMAP'             => 1, //Sitemap.xml更新周期
	'SYS_CACHE_LIST'                => 1, //List标签查询缓存
	'SYS_CACHE_MEMBER'              => 0, //会员信息缓存期
	'SYS_CACHE_ATTACH'              => 300, //附件信息缓存期
	'SYS_CACHE_FORM'                => 1, //表单内容缓存期
	'SYS_CACHE_POSTER'              => 300, //广告内容缓存期
	'SYS_CACHE_SPACE'               => 1, //会员空间内容缓存期
	'SYS_CACHE_TAG'                 => 1, //Tag内容缓存期
	'SYS_CACHE_COMMENT'             => 1, //评论统计缓存期
	'SYS_CACHE_PAGE'                => 1, //单页静态化

);
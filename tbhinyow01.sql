-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost:3306
-- 生成日期: 2017 年 09 月 18 日 16:48
-- 服务器版本: 5.6.35
-- PHP 版本: 5.3.21

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tbhinyow01`
--

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text,
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=207 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_buy`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用金币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_category`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `rs_1_answer_category`
--

INSERT INTO `rs_1_answer_category` (`id`, `pid`, `pids`, `name`, `letter`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `show`, `permission`, `setting`, `displayorder`) VALUES
(2, 0, '0', '通关物流', 'e', 'enterprise', '', 1, '2,22,23,27', NULL, 1, 'a:15:{s:3:\\"3_1\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_2\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_3\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_4\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_9\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:4:\\"3_10\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_5\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:4:\\"4_11\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_6\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_7\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:4:\\"4_12\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_8\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}i:1;a:0:{}i:0;a:0:{}i:2;a:0:{}}', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(6, 0, '0', '虚拟生产', 'x', 'xnsc', '', 1, '6,24,28,29', NULL, 1, 'a:15:{i:1;a:1:{s:3:\\"add\\";s:1:\\"1\\";}s:3:\\"3_1\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_2\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_3\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_4\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"3_9\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:4:\\"3_10\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_5\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:4:\\"4_11\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_6\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_7\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:4:\\"4_12\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}s:3:\\"4_8\\";a:9:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"1\\";s:9:\\"postcount\\";s:1:\\"0\\";s:11:\\"edit_verify\\";s:1:\\"1\\";}i:0;a:0:{}i:2;a:0:{}}', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(13, 0, '0', '供应链金融', 'z', 'gyljr', '', 1, '13,25,30,31', NULL, 1, 'a:13:{i:1;a:1:{s:3:\\"add\\";s:1:\\"1\\";}s:3:\\"3_1\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"3_2\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"3_3\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"3_4\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"3_9\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:4:\\"3_10\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"4_5\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:4:\\"4_11\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"4_6\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"4_7\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:4:\\"4_12\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}s:3:\\"4_8\\";a:8:{s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"del\\";s:1:\\"1\\";s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";s:7:\\"postnum\\";s:1:\\"5\\";s:6:\\"verify\\";s:1:\\"0\\";s:9:\\"postcount\\";s:1:\\"0\\";}}', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:8:\\"category\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";}}', 0),
(22, 2, '0,2', '通过物流1', 'w', 'wl1', 'enterprise/', 0, '22', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(23, 2, '0,2', '物流2', 'w', 'wuliu2', 'enterprise/', 0, '23', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(24, 6, '0,6', '虚拟生产1', 's', 'shengchan1', 'xnsc/', 0, '24', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(25, 13, '0,13', '金融1', 'j', 'jinrong1', 'gyljr/', 0, '25', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:8:\\"category\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";}}', 0),
(26, 0, '0', '其他', 'q', 'qita', '', 1, '26,32,33,34', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(27, 2, '0,2', '通过物流3', 't', 'tgwl', 'enterprise/', 0, '27', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(28, 6, '0,6', '虚拟生产2', 'x', 'xunishengchan2', 'xnsc/', 0, '28', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(29, 6, '0,6', '虚拟生产3', 'x', 'xunishengchan3', 'xnsc/', 0, '29', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(30, 13, '0,13', '供应链金融1', 'g', 'gongyinglianjinrong1', 'gyljr/', 0, '30', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:8:\\"category\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";}}', 0),
(31, 13, '0,13', '供应链金融3', 'g', 'gongyinglianjinrong3', 'gyljr/', 0, '31', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:8:\\"category\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";}}', 0),
(32, 26, '0,26', '其他其他1', 'q', 'qitaqita1', 'qita/', 0, '32', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(33, 26, '0,26', '其他其他3', 'q', 'qitaqita3', 'qita/', 0, '33', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(34, 26, '0,26', '其他其他2', 'q', 'qitaqita2', 'qita/', 0, '34', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_category_data`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_category_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_comment_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `rs_1_answer_comment_index`
--

INSERT INTO `rs_1_answer_comment_index` (`id`, `cid`, `support`, `oppose`, `comments`, `avgsort`, `sort1`, `sort2`, `sort3`, `sort4`, `sort5`, `sort6`, `sort7`, `sort8`, `sort9`, `tableid`) VALUES
(3, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_comment_my`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_draft`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_favorite`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_flag`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_form_adviser`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_form_adviser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '内容主题',
  `url` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `subject` varchar(255) DEFAULT NULL COMMENT '表单主题',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `detail` text,
  `a_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='顾问咨询表单数据表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_form_adviser_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_form_adviser_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='顾问咨询表单附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_form_consulting`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_form_consulting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '内容主题',
  `url` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `subject` varchar(255) DEFAULT NULL COMMENT '表单主题',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线问答表单数据表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_form_consulting_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_form_consulting_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线问答表单附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_form_wytw`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_form_wytw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '内容主题',
  `url` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `subject` varchar(255) DEFAULT NULL COMMENT '表单主题',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `neirong` text,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我要提问表单数据表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_form_wytw_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_form_wytw_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我要提问表单附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_hits`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `rs_1_answer_hits`
--

INSERT INTO `rs_1_answer_hits` (`id`, `hits`, `day_hits`, `week_hits`, `month_hits`, `year_hits`) VALUES
(5, 1, 1, 1, 1, 1),
(24, 1, 1, 1, 1, 1),
(14, 1, 1, 1, 1, 1),
(25, 1, 1, 1, 1, 1),
(17, 1, 1, 1, 1, 1),
(43, 1, 1, 1, 1, 1),
(48, 1, 1, 1, 1, 1),
(19, 1, 1, 1, 1, 1),
(12, 1, 1, 1, 1, 1),
(16, 1, 1, 1, 1, 1),
(18, 1, 1, 1, 1, 1),
(13, 1, 1, 1, 1, 1),
(9, 1, 1, 1, 1, 1),
(15, 1, 1, 1, 1, 1),
(11, 1, 1, 1, 1, 1),
(20, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_html`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=68 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_search`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_tag`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_answer_verify`
--

CREATE TABLE IF NOT EXISTS `rs_1_answer_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_block`
--

CREATE TABLE IF NOT EXISTS `rs_1_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '文本块名称',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文本块表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `rs_1_block`
--

INSERT INTO `rs_1_block` (`id`, `name`, `content`) VALUES
(1, '公司名字', '福建省联标国际发展有限公司'),
(2, '客服QQ', '12345678');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_form`
--

CREATE TABLE IF NOT EXISTS `rs_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='表单模型表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `rs_1_form`
--

INSERT INTO `rs_1_form` (`id`, `name`, `table`, `setting`) VALUES
(5, '申请注册', 'zhuce', 'a:5:{s:4:\\"icon\\";s:0:\\"\\";s:4:\\"post\\";s:1:\\"1\\";s:4:\\"send\\";s:0:\\"\\";s:8:\\"template\\";s:0:\\"\\";s:6:\\"rt_url\\";s:0:\\"\\";}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_form_account`
--

CREATE TABLE IF NOT EXISTS `rs_1_form_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `nature` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='开账申请表单表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `rs_1_form_account`
--

INSERT INTO `rs_1_form_account` (`id`, `title`, `uid`, `author`, `inputip`, `inputtime`, `displayorder`, `tableid`, `nature`, `mobile`) VALUES
(5, '福建德永信息咨询有限公司', 16, '薛', '120.35.4.185', 1476324992, 0, 0, '财务', '13805088819'),
(6, '厦门正航软件科技有限公司', 0, 'guest', '220.160.107.34', 1477384539, 0, 0, '软件', '13850006596');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_form_account_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_form_account_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='开账申请表单附表';

--
-- 转存表中的数据 `rs_1_form_account_data_0`
--

INSERT INTO `rs_1_form_account_data_0` (`id`, `uid`) VALUES
(5, 16),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_form_zhuce`
--

CREATE TABLE IF NOT EXISTS `rs_1_form_zhuce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='申请注册表单表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_form_zhuce_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_form_zhuce_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `address` varchar(255) DEFAULT NULL,
  `business` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `areacode` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `cooperation` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='申请注册表单附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_job_form_wyzp`
--

CREATE TABLE IF NOT EXISTS `rs_1_job_form_wyzp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '内容主题',
  `url` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `subject` varchar(255) DEFAULT NULL COMMENT '表单主题',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='我要招聘表单数据表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_1_job_form_wyzp`
--

INSERT INTO `rs_1_job_form_wyzp` (`id`, `cid`, `uid`, `author`, `inputip`, `inputtime`, `title`, `url`, `subject`, `tableid`, `mobile`) VALUES
(1, 1, 1, 'admin', '127.0.0.1', 1465353166, '招聘 会计出纳人员', '/index.php?s=job&c=show&id=1', '111', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_job_form_wyzp_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_job_form_wyzp_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `xzdy` varchar(255) DEFAULT NULL,
  `xlyq` varchar(255) DEFAULT NULL,
  `zpzw` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我要招聘表单附表';

--
-- 转存表中的数据 `rs_1_job_form_wyzp_data_0`
--

INSERT INTO `rs_1_job_form_wyzp_data_0` (`id`, `cid`, `uid`, `xzdy`, `xlyq`, `zpzw`) VALUES
(1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_job_phone_buy`
--

CREATE TABLE IF NOT EXISTS `rs_1_job_phone_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `score` int(10) DEFAULT NULL COMMENT '积分',
  `inputtime` int(10) unsigned NOT NULL COMMENT '查看时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `rs_1_job_phone_buy`
--

INSERT INTO `rs_1_job_phone_buy` (`id`, `sid`, `uid`, `score`, `inputtime`) VALUES
(1, 3, 1, -10, 1470791809),
(2, 2, 1, -10, 1470792509),
(3, 10, 41, -2, 1475128994),
(4, 13, 1, -2, 1476344656),
(5, 9, 23, -5, 1477539949),
(6, 16, 1, -2, 1478247017),
(7, 18, 1, -2, 1478852432);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_links_form_links`
--

CREATE TABLE IF NOT EXISTS `rs_1_links_form_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '内容主题',
  `url` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `subject` varchar(255) DEFAULT NULL COMMENT '表单主题',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表单数据表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_links_form_links_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_links_form_links_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表单附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_navigator`
--

CREATE TABLE IF NOT EXISTS `rs_1_navigator` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `pids` text COMMENT '所有上级id数据项',
  `type` tinyint(1) unsigned NOT NULL COMMENT '导航类型',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `url` varchar(255) NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) DEFAULT NULL COMMENT '图片标示',
  `show` tinyint(1) unsigned NOT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有下级',
  `childids` text COMMENT '所有下级数据项',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否站外链接',
  `displayorder` tinyint(3) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `list` (`id`,`type`,`show`,`displayorder`),
  KEY `mark` (`mark`),
  KEY `extend` (`extend`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站导航表' AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `rs_1_navigator`
--

INSERT INTO `rs_1_navigator` (`id`, `pid`, `pids`, `type`, `name`, `title`, `url`, `thumb`, `show`, `mark`, `extend`, `child`, `childids`, `target`, `displayorder`) VALUES
(1, 0, '0', 0, '服务方案', '服务方案', 'publish.html', '', 1, 'page-1', 1, 1, '1,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22', 0, 0),
(2, 0, '0', 0, '申请注册', '申请注册', '/index.php?c=page&amp;id=22', '', 1, '', 0, 0, '2', 0, 0),
(3, 0, '0', 0, '操作平台', '操作平台', 'index.php?s=member&amp;c=login&amp;m=index', '', 1, '', 0, 1, '3,35,38', 1, 0),
(4, 0, '0', 0, '业务拍档', '业务拍档', 'http://demo.hf872.com/index.php?c=page&id=2', '', 1, 'page-2', 0, 0, '4', 0, 0),
(5, 0, '0', 0, '联标商城', '联标商城', '/shop.html', '', 0, '', 0, 0, '5', 0, 0),
(6, 0, '0', 0, '关于我们', '', 'http://demo.hf872.com/index.php?c=page&id=3', '', 1, 'page-3', 1, 1, '6,23,26,33,24,27', 0, 0),
(7, 1, '0,1', 0, '进出口服务', '进出口服务', 'http://demo.hf872.com/index.php?c=page&id=4', '1089', 1, 'page-4', 1, 1, '7,8,9,10,11,12,13,14', 0, 0),
(8, 7, '0,1,7', 0, '报关报检', '报关报检', 'http://demo.hf872.com/index.php?c=page&id=10', '', 1, 'page-10', 1, 0, '8', 0, 0),
(9, 7, '0,1,7', 0, '物流', '物流', 'http://demo.hf872.com/index.php?c=page&id=11', '', 1, 'page-11', 1, 0, '9', 0, 0),
(10, 7, '0,1,7', 0, '退税', '退税', 'http://demo.hf872.com/index.php?c=page&id=12', '', 1, 'page-12', 1, 0, '10', 0, 0),
(11, 7, '0,1,7', 0, '结算', '结算', 'http://demo.hf872.com/index.php?c=page&id=13', '', 1, 'page-13', 1, 0, '11', 0, 0),
(12, 7, '0,1,7', 0, '融资', '融资', 'http://demo.hf872.com/index.php?c=page&id=14', '', 1, 'page-14', 1, 0, '12', 0, 0),
(13, 7, '0,1,7', 0, '信保', '信保', 'http://demo.hf872.com/index.php?c=page&id=15', '', 1, 'page-15', 1, 0, '13', 0, 0),
(14, 7, '0,1,7', 0, '保理', '保理', 'http://demo.hf872.com/index.php?c=page&id=16', '', 1, 'page-16', 1, 0, '14', 0, 0),
(15, 1, '0,1', 0, '分销执行', '分销执行', 'http://demo.hf872.com/index.php?c=page&id=5', '1106', 1, 'page-5', 1, 0, '15', 0, 0),
(16, 1, '0,1', 0, '采购执行', '采购执行', 'http://demo.hf872.com/index.php?c=page&id=6', '1107', 1, 'page-6', 1, 0, '16', 0, 0),
(17, 1, '0,1', 0, '海外仓储', '海外仓储', 'http://demo.hf872.com/index.php?c=page&id=7', '1108', 1, 'page-7', 1, 0, '17', 0, 0),
(18, 1, '0,1', 0, '供应链管理', '供应链管理', 'http://demo.hf872.com/index.php?c=page&id=8', '1109', 1, 'page-8', 1, 1, '18,19,20,21', 0, 0),
(19, 18, '0,1,18', 0, '整合供应链', '整合供应链', 'http://demo.hf872.com/index.php?c=page&id=17', '', 1, 'page-17', 1, 0, '19', 0, 0),
(20, 18, '0,1,18', 0, '资金配套', '资金配套', 'http://demo.hf872.com/index.php?c=page&id=18', '', 1, 'page-18', 1, 0, '20', 0, 0),
(21, 18, '0,1,18', 0, '集成方案', '集成方案', 'http://demo.hf872.com/index.php?c=page&id=19', '', 1, 'page-19', 1, 0, '21', 0, 0),
(22, 1, '0,1', 0, '跨境电商', '跨境电商', 'http://demo.hf872.com/index.php?c=page&id=9', '1110', 1, 'page-9', 1, 0, '22', 0, 0),
(23, 6, '0,6', 0, '公司简介', '公司简介', 'http://demo.hf872.com/index.php?c=page&id=20', '', 1, 'page-20', 1, 0, '23', 0, 1),
(24, 6, '0,6', 0, '人才招聘', '人才招聘', 'http://demo.hf872.com/index.php?c=page&id=21', '', 1, 'page-21', 1, 0, '24', 0, 4),
(26, 6, '0,6', 0, '合作伙伴', '', 'http://demo.hf872.com/news-list-partner.html', '', 1, 'module-news-2', 0, 0, '26', 0, 2),
(27, 6, '0,6', 0, '联标学院', '联标学院', 'http://demo.hf872.com/news-list-study.html', '', 1, 'module-news-3', 0, 0, '27', 0, 5),
(28, 0, '0', 4, '联标发展', '联标发展', 'http://www.baidu.com', '', 1, '', 0, 0, '28', 0, 0),
(33, 6, '0,6', 0, '新闻动态', '新闻动态', 'http://demo.hf872.com/news-list-news.html', '', 1, 'module-news-1', 0, 0, '33', 0, 3),
(35, 3, '0,3', 0, '登录T8', '', 'http://t8.atinin.cn:8082/Login.aspx', '', 1, '', 0, 0, '35', 1, 0),
(38, 3, '0,3', 0, '订单查询', '', 'http://t8.atinin.cn:8099/', '', 1, '', 0, 0, '38', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news`
--

CREATE TABLE IF NOT EXISTS `rs_1_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `avgsort` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_1_news`
--

INSERT INTO `rs_1_news` (`id`, `catid`, `title`, `thumb`, `keywords`, `description`, `hits`, `uid`, `author`, `status`, `url`, `link_id`, `tableid`, `inputip`, `inputtime`, `updatetime`, `comments`, `favorites`, `displayorder`, `avgsort`) VALUES
(1, 1, '福建省联标国际发展有限公司 新站于2017年6月上线', '', '福建,有限公司,福建省,国际', '福建省联标国际发展有限公司 新站于2017年6月上线', 31, 1, 'admin', 9, 'http://demo.hf872.com/news-show-1.html', 0, 0, '192.168.1.80', 1496306212, 1497064215, 0, 0, 0, 0.00);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_buy`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用金币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_category`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `rs_1_news_category`
--

INSERT INTO `rs_1_news_category` (`id`, `pid`, `pids`, `name`, `letter`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `show`, `permission`, `setting`, `displayorder`) VALUES
(1, 0, '0', '新闻动态', 'n', 'news', '', 0, '1', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"1\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:3:{i:2;a:3:{s:4:\\"show\\";s:1:\\"1\\";s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";}i:3;a:3:{s:4:\\"show\\";s:1:\\"1\\";s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";}i:4;a:3:{s:4:\\"show\\";s:1:\\"1\\";s:3:\\"add\\";s:1:\\"1\\";s:4:\\"edit\\";s:1:\\"1\\";}}s:6:\\"member\\";a:0:{}}', 0),
(2, 0, '0', '合作伙伴', 'h', 'partner', '', 0, '2', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(3, 0, '0', '联标学院', 'l', 'study', '', 0, '3', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_category_data`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_category_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_comment_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_comment_my`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `related` text,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `rs_1_news_data_0`
--

INSERT INTO `rs_1_news_data_0` (`id`, `uid`, `catid`, `content`, `related`) VALUES
(1, 1, 1, '<p>福建省联标国际发展有限公司 新站于2017年6月上线</p>', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_draft`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_favorite`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_flag`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_hits`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `rs_1_news_hits`
--

INSERT INTO `rs_1_news_hits` (`id`, `hits`, `day_hits`, `week_hits`, `month_hits`, `year_hits`) VALUES
(134, 1, 1, 2, 2, 1),
(133, 2, 1, 1, 3, 1),
(44, 221, 1, 1, 1, 1),
(139, 2, 2, 3, 3, 1),
(136, 2, 2, 3, 3, 1),
(43, 28, 1, 1, 1, 1),
(135, 1, 1, 2, 2, 1),
(147, 1, 1, 2, 2, 1),
(140, 1, 1, 2, 2, 1),
(138, 12, 12, 13, 13, 1),
(39, 25, 1, 1, 1, 1),
(42, 22, 1, 1, 1, 1),
(86, 136, 1, 1, 1, 10),
(40, 17, 1, 1, 1, 1),
(81, 141, 1, 1, 1, 14),
(82, 160, 1, 1, 1, 15),
(83, 168, 1, 1, 1, 11),
(84, 204, 1, 1, 1, 10),
(85, 174, 1, 1, 1, 12),
(144, 1, 1, 2, 2, 1),
(151, 1, 1, 2, 2, 1),
(87, 291, 1, 1, 1, 15),
(88, 128, 1, 1, 1, 1),
(143, 1, 1, 2, 2, 1),
(41, 19, 1, 1, 1, 1),
(137, 1, 1, 2, 2, 1),
(30, 1, 1, 1, 1, 1),
(103, 58, 1, 1, 1, 21),
(153, 15, 15, 16, 16, 1),
(154, 4, 1, 1, 1, 1),
(155, 7, 1, 1, 1, 1),
(1, 31, 1, 1, 32, 14);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_html`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_1_news_index`
--

INSERT INTO `rs_1_news_index` (`id`, `uid`, `catid`, `status`, `inputtime`) VALUES
(1, 1, 1, 9, 1496306212);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_search`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_tag`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=138 ;

--
-- 转存表中的数据 `rs_1_news_tag`
--

INSERT INTO `rs_1_news_tag` (`id`, `name`, `code`, `hits`) VALUES
(1, '增值税', 'zengzhishui', 1),
(2, '营业税', 'yingyeshui', 1),
(3, '人大代表', 'rendadaibiao', 0),
(4, '公告', 'gonggao', 0),
(5, '111', '111', 0),
(6, '福建', 'fujian', 0),
(7, '网络', 'wangluo', 0),
(8, '创新', 'chuangxin', 0),
(9, '国际贸易', 'guojimaoyi', 0),
(10, '联系我们', 'lianxiwomen', 0),
(11, '网站', 'wangzhan', 0),
(12, '财政部', 'caizhengbu', 0),
(13, '管理局', 'guanliju', 0),
(14, '三证合一', 'sanzhengheyi', 0),
(15, '一照一码', 'yizhaoyima', 0),
(16, '行政', 'xingzheng', 0),
(17, '2016年', '2016nian', 0),
(18, '税收', 'shuishou', 0),
(19, '会计', 'huiji', 0),
(20, '假账', 'jiazhang', 0),
(21, '调账', 'diaozhang', 0),
(22, '会计培训', 'huijipeixun', 0),
(23, '福州', 'fuzhou', 0),
(24, '虚开发票', 'xukaifapiao', 0),
(25, '记录', 'jilu', 0),
(26, '会计要素', 'huijiyaosu', 0),
(27, '会计人员', 'huijirenyuan', 0),
(28, '中恒', 'zhongheng', 0),
(29, '促销', 'cuxiao', 0),
(30, '优惠', 'youhui', 0),
(31, '信息', 'xinxi', 0),
(32, '注册公司', 'zhucegongsi', 0),
(33, '英雄', 'yingxiong', 0),
(34, '电子商务', 'dianzishangwu', 0),
(35, '互联网', 'hulianwang', 0),
(36, '电商', 'dianshang', 0),
(37, '准确率', 'zhunquelu', 0),
(38, '对帐单', 'duizhangdan', 0),
(39, '工作量', 'gongzuoliang', 0),
(40, '操作系统', 'caozuoxitong', 0),
(41, '如何', 'ruhe', 0),
(42, '商务', 'shangwu', 0),
(43, '淘会计', 'taohuiji', 0),
(44, '软件营销', 'ruanjianyingxiao', 0),
(45, '产品', 'chanpin', 0),
(46, 'ERP', 'erp', 0),
(47, '在线', 'zaixian', 0),
(48, '软件', 'ruanjian', 0),
(49, '会员', 'huiyuan', 0),
(50, '会计基础', 'huijijichu', 0),
(51, '专业', 'zhuanye', 0),
(52, '拓展', 'tuozhan', 0),
(53, '开发', 'kaifa', 0),
(54, '培训班', 'peixunban', 0),
(55, '实践', 'shijian', 0),
(56, '提高班', 'tigaoban', 0),
(57, '会计学习', 'huijixuexi', 0),
(58, '计划', 'jihua', 0),
(59, '泉州', 'quanzhou', 0),
(60, '华侨', 'huaqiao', 0),
(61, '会计从业', 'huijicongye', 0),
(62, '资格证书', 'zigezhengshu', 0),
(63, '资格证', 'zigezheng', 0),
(64, '会计班', 'huijiban', 0),
(65, '精算', 'jingsuan', 0),
(66, '福州会计培训', 'fuzhouhuijipeixun', 0),
(67, '会计专业', 'huijizhuanye', 0),
(68, '会计职业发展规划', 'huijizhiyefazhanguihua', 0),
(69, '帮助中心', 'bangzhuzhongxin', 0),
(70, '在线记账', 'zaixianjizhang', 0),
(71, '会计培训班', 'huijipeixunban', 0),
(72, '个体工商', 'getigongshang', 0),
(73, '两证整合', 'liangzhengzhenghe', 0),
(74, '会计实训基地', 'huijishixunjidi', 0),
(75, '实训', 'shixun', 0),
(76, '福建商学院', 'fujianshangxueyuan', 0),
(77, '商学院', 'shangxueyuan', 0),
(78, '营业执照', 'yingyezhizhao', 0),
(79, '财务', 'caiwu', 0),
(80, '研讨会', 'yantaohui', 0),
(81, '讲师', 'jiangshi', 0),
(82, '学员风采', 'xueyuanfengcai', 0),
(83, '仓山地税', 'cangshandishui', 0),
(84, '福州佳航', 'fuzhoujiahang', 0),
(85, '有限公司', 'youxiangongsi', 0),
(86, '企业管理', 'qiyeguanli', 0),
(87, '企业百事通', 'qiyebaishitong', 0),
(88, '百事通', 'baishitong', 0),
(89, '福建省', 'fujiansheng', 0),
(90, '鼓楼区', 'gulouqu', 0),
(91, '商标代理', 'shangbiaodaili', 0),
(92, '顾问', 'guwen', 0),
(93, '品冠', 'pinguan', 0),
(94, '厦门', 'shamen', 0),
(95, '税收政策', 'shuishouzhengce', 0),
(96, '机动车', 'jidongche', 0),
(97, '黑名单', 'heimingdan', 0),
(98, '化妆品', 'huazhuangpin', 0),
(99, '消费税', 'xiaofeishui', 0),
(100, '认证', 'renzheng', 0),
(101, '股东', 'gudong', 0),
(102, '纳税申报', 'nashuishenbao', 0),
(103, '会计实践基地', 'huijishijianjidi', 0),
(104, '学校', 'xuexiao', 0),
(105, '会计实操', 'huijishicao', 0),
(106, '课程', 'kecheng', 0),
(107, '会计课程', 'huijikecheng', 0),
(108, '中心', 'zhongxin', 0),
(109, '服务中心', 'fuwuzhongxin', 0),
(110, '工商局', 'gongshangju', 0),
(111, '经营', 'jingying', 0),
(112, '网络经营', 'wangluojingying', 0),
(113, '福州市', 'fuzhoushi', 0),
(114, '合作伙伴', 'hezuohuoban', 0),
(115, '战略', 'zhanlue', 0),
(116, '会计系', 'huijixi', 0),
(117, '技师', 'jishi', 0),
(118, '学院', 'xueyuan', 0),
(119, '隆重', 'longzhong', 0),
(120, '职业学院', 'zhiyexueyuan', 0),
(121, '工商注册', 'gongshangzhuce', 0),
(122, '人才招聘', 'rencaizhaopin', 0),
(123, '双选会', 'shuangxuanhui', 0),
(124, '委员会', 'weiyuanhui', 0),
(125, '商贸', 'shangmao', 0),
(126, '成绩单', 'chengjidan', 0),
(127, '营改增', 'yinggaizeng', 0),
(128, '纳税', 'nashui', 0),
(129, '申报', 'shenbao', 0),
(130, '所得税', 'suodeshui', 0),
(131, '企业名录', 'qiyeminglu', 0),
(132, '大礼包', 'dalibao', 0),
(133, '职业中专', 'zhiyezhongzhuan', 0),
(134, '消防安全', 'xiaofanganquan', 0),
(135, '供应链', 'gongyinglian', 0),
(136, '电子', 'dianzi', 0),
(137, '国际', 'guoji', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_news_verify`
--

CREATE TABLE IF NOT EXISTS `rs_1_news_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order`
--

CREATE TABLE IF NOT EXISTS `rs_1_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT 'oid',
  `sn` varchar(50) NOT NULL COMMENT '流水序列号',
  `mid` varchar(50) NOT NULL COMMENT '模块名',
  `buy_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '购买者id',
  `buy_username` varchar(50) DEFAULT NULL COMMENT '购买者name',
  `buy_step` tinyint(1) NOT NULL COMMENT '购买步骤流程',
  `sell_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '出售者id',
  `sell_username` varchar(50) DEFAULT NULL COMMENT '出售者name',
  `order_time` int(11) DEFAULT NULL COMMENT '下单时间',
  `order_status` tinyint(1) unsigned DEFAULT NULL COMMENT '订单状态',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `order_score` tinyint(11) DEFAULT NULL COMMENT '是否金币支付',
  `order_youhui` decimal(10,2) NOT NULL COMMENT '优惠的价格',
  `order_comment` int(10) NOT NULL COMMENT '针对商铺的评论id',
  `pay_type` tinyint(2) DEFAULT NULL COMMENT '付款方式',
  `pay_id` int(10) DEFAULT NULL COMMENT '付款id',
  `pay_status` tinyint(1) unsigned DEFAULT NULL COMMENT '付款状态',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `shipping_time` int(10) DEFAULT NULL COMMENT '发货时间',
  `shipping_stime` int(10) NOT NULL COMMENT '收货时间',
  `shipping_status` tinyint(1) unsigned NOT NULL COMMENT '物流状态',
  `shipping_price` decimal(10,2) NOT NULL COMMENT '运费价格',
  `shipping_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `shipping_phone` varchar(50) NOT NULL COMMENT '收货人手机',
  `tableid` tinyint(3) unsigned DEFAULT '0' COMMENT '附表号',
  PRIMARY KEY (`id`),
  KEY `sn` (`sn`),
  KEY `buy_uid` (`buy_uid`),
  KEY `buy_username` (`buy_username`),
  KEY `sell_uid` (`sell_uid`),
  KEY `sell_username` (`sell_username`),
  KEY `order_time` (`order_time`),
  KEY `order_status` (`order_status`),
  KEY `pay_id` (`pay_id`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_time` (`shipping_time`),
  KEY `shipping_status` (`shipping_status`),
  KEY `order_price` (`order_price`),
  KEY `order_comment` (`order_comment`),
  KEY `shipping_phone` (`shipping_phone`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单信息表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `rs_1_order`
--

INSERT INTO `rs_1_order` (`id`, `sn`, `mid`, `buy_uid`, `buy_username`, `buy_step`, `sell_uid`, `sell_username`, `order_time`, `order_status`, `order_price`, `order_score`, `order_youhui`, `order_comment`, `pay_type`, `pay_id`, `pay_status`, `pay_time`, `shipping_time`, `shipping_stime`, `shipping_status`, `shipping_price`, `shipping_name`, `shipping_phone`, `tableid`) VALUES
(30, 'RS201706303850600', 'shop', 68, 'text', 0, 1, 'admin', 1498786276, 1, 12.00, 0, 0.00, 0, 2, 0, 0, 0, 0, 0, 0, 0.00, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_buy`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_buy` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mid` varchar(50) NOT NULL COMMENT '模块名称',
  `oid` bigint(15) unsigned NOT NULL COMMENT '订单id',
  `uid` int(10) NOT NULL COMMENT '购买者id',
  `cid` int(10) NOT NULL COMMENT '内容id',
  `catid` int(10) NOT NULL COMMENT '栏目id',
  `comment` int(10) NOT NULL COMMENT '评论id',
  `specification` varchar(50) NOT NULL COMMENT '规格信息',
  `quantity` int(10) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`),
  KEY `cc` (`uid`,`oid`,`comment`,`cid`,`mid`),
  KEY `bb` (`mid`,`cid`,`uid`,`oid`),
  KEY `aa` (`mid`,`oid`,`cid`,`specification`),
  KEY `uid` (`uid`),
  KEY `oid` (`oid`),
  KEY `catid` (`catid`),
  KEY `comment` (`comment`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购买记录表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_1_order_buy`
--

INSERT INTO `rs_1_order_buy` (`id`, `mid`, `oid`, `uid`, `cid`, `catid`, `comment`, `specification`, `quantity`) VALUES
(1, 'shop', 29, 33, 22, 17, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_0` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=178 ;

--
-- 转存表中的数据 `rs_1_order_cart_0`
--

INSERT INTO `rs_1_order_cart_0` (`id`, `uid`, `sell`, `mid`, `cid`, `quantity`, `specification`, `agent`, `inputtime`) VALUES
(1, 0, 1, 'shop', 11, 2, '', '92a918382561e99e85680fbba6b863f6', 1472246211),
(2, 0, 1, 'shop', 14, 1, '', '92a918382561e99e85680fbba6b863f6', 1472246232),
(3, 0, 1, 'shop', 2, 3, '', '92a918382561e99e85680fbba6b863f6', 1472246246),
(4, 0, 1, 'shop', 10, 1, '', '2bb0623b98d143afc0f4a5df9542f533', 1472312250),
(5, 0, 1, 'shop', 16, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312261),
(6, 0, 1, 'shop', 9, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312264),
(7, 0, 1, 'shop', 1, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312312),
(8, 0, 1, 'shop', 7, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312329),
(9, 0, 1, 'shop', 4, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312340),
(10, 0, 1, 'shop', 15, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312403),
(11, 0, 1, 'shop', 12, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312413),
(12, 0, 1, 'shop', 6, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312480),
(13, 0, 1, 'shop', 13, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312508),
(14, 0, 1, 'shop', 8, 1, '', '92a918382561e99e85680fbba6b863f6', 1472312538),
(15, 0, 1, 'shop', 10, 2, '', 'e34248cb8ffb6593d995dc0190dfad7a', 1472633828),
(16, 0, 1, 'shop', 10, 1, '', 'b6b0b92c6c2b07f4c5ebe1382163060a', 1472636562),
(17, 0, 1, 'shop', 10, 1, '', '1ec30b64413f76d173ce6327158a9dbf', 1472636820),
(53, 0, 1, 'shop', 49, 1, '', '92a918382561e99e85680fbba6b863f6', 1477399772),
(19, 0, 1, 'shop', 19, 1, '', '7ddb61960abc23707a10c36cb72bb48f', 1473104984),
(20, 0, 1, 'shop', 20, 1, '', 'f47587c5de1619182d1d12c84ebbf4d2', 1473364243),
(21, 0, 1, 'shop', 24, 1, '', 'f47587c5de1619182d1d12c84ebbf4d2', 1473364253),
(22, 0, 1, 'shop', 22, 1, '', 'f47587c5de1619182d1d12c84ebbf4d2', 1473364268),
(23, 0, 1, 'shop', 21, 1, '', 'f47587c5de1619182d1d12c84ebbf4d2', 1473364289),
(24, 0, 1, 'shop', 25, 1, '', 'f47587c5de1619182d1d12c84ebbf4d2', 1473364570),
(25, 0, 1, 'shop', 23, 1, '', '7adcdca029b86e39da2a737a805c58b6', 1473465278),
(26, 0, 1, 'shop', 27, 1, '', 'b24b42ea179945619e5d90e149723a9b', 1473623416),
(27, 0, 1, 'shop', 26, 1, '', '9981425549a43191d3971332564bab8a', 1473623531),
(28, 0, 1, 'shop', 32, 1, '', '14026c5578556517e9cdbf199e63c376', 1474189074),
(29, 0, 1, 'shop', 28, 1, '', '9981425549a43191d3971332564bab8a', 1474189156),
(30, 0, 1, 'shop', 30, 1, '', '9981425549a43191d3971332564bab8a', 1474189232),
(31, 0, 1, 'shop', 29, 1, '', '9981425549a43191d3971332564bab8a', 1474189251),
(32, 0, 1, 'shop', 33, 1, '', '9981425549a43191d3971332564bab8a', 1474189268),
(33, 0, 1, 'shop', 31, 1, '', '9981425549a43191d3971332564bab8a', 1474239111),
(34, 0, 1, 'shop', 34, 1, '', '9981425549a43191d3971332564bab8a', 1474269086),
(35, 0, 1, 'shop', 36, 1, '', 'f7a556efeeafe64cd390cacb96d3b61c', 1474357483),
(36, 0, 1, 'shop', 35, 1, '', '950f6515d30f0d823cba434250820d6b', 1474357550),
(37, 0, 1, 'shop', 37, 1, '', '42122fa5838744692c18ad799cafc351', 1474357792),
(38, 0, 1, 'shop', 38, 1, '', 'efad7981a1534c3b8a89dec9cb356a18', 1474477665),
(39, 0, 1, 'shop', 39, 1, '', '92a918382561e99e85680fbba6b863f6', 1474477708),
(40, 0, 1, 'shop', 41, 1, '', '9981425549a43191d3971332564bab8a', 1474725210),
(41, 0, 1, 'shop', 40, 1, '', 'b24b42ea179945619e5d90e149723a9b', 1474725311),
(42, 0, 1, 'shop', 44, 1, '', '9981425549a43191d3971332564bab8a', 1475190592),
(43, 0, 1, 'shop', 43, 1, '', '9981425549a43191d3971332564bab8a', 1475190634),
(44, 0, 1, 'shop', 45, 1, '', 'b24b42ea179945619e5d90e149723a9b', 1475190661),
(45, 0, 1, 'shop', 44, 1, '', '3677c95be39e7abf95d795f19b4c11a4', 1475841200),
(46, 0, 1, 'shop', 43, 1, '', '64f2723c0fa374a56f267fa6e4b138fb', 1475841281),
(47, 0, 1, 'shop', 45, 1, '', '64f2723c0fa374a56f267fa6e4b138fb', 1475841321),
(48, 0, 1, 'shop', 42, 1, '', '64f2723c0fa374a56f267fa6e4b138fb', 1475841407),
(49, 0, 1, 'shop', 47, 1, '', 'b24b42ea179945619e5d90e149723a9b', 1476013756),
(50, 0, 1, 'shop', 46, 1, '', 'b24b42ea179945619e5d90e149723a9b', 1476013808),
(51, 0, 1, 'shop', 27, 1, '', 'be2a31c5b7bbf03b770f7743b5d79551', 1476801242),
(52, 0, 1, 'shop', 40, 1, '', '3d6f6efd5f912f36a4711fb2bfc686eb', 1476845551),
(54, 0, 1, 'shop', 48, 1, '', '92a918382561e99e85680fbba6b863f6', 1477399789),
(55, 0, 1, 'shop', 50, 1, '', '92a918382561e99e85680fbba6b863f6', 1477399849),
(56, 0, 1, 'shop', 29, 1, '', 'efad7981a1534c3b8a89dec9cb356a18', 1477411668),
(57, 0, 1, 'shop', 22, 1, '', '095754a2c01b904bfc0fc8a603827b27', 1477618337),
(58, 0, 1, 'shop', 47, 1, '', '7ddb61960abc23707a10c36cb72bb48f', 1478305810),
(59, 0, 1, 'shop', 46, 1, '', '7ddb61960abc23707a10c36cb72bb48f', 1478305856),
(60, 0, 1, 'shop', 35, 3, '', '1a0d36373ed7a1d578ee56dab756da62', 1483837552),
(61, 0, 1, 'shop', 20, 2, '', '2d2e8e6ab88742154eade31e44c21e75', 1483831925),
(62, 0, 1, 'shop', 38, 2, '', 'a6f577a23abd9d0b0f03ea5673e49fe5', 1484251238),
(63, 0, 1, 'shop', 44, 2, '', 'a6f577a23abd9d0b0f03ea5673e49fe5', 1483918071),
(64, 0, 1, 'shop', 33, 1, '', '1a0d36373ed7a1d578ee56dab756da62', 1482872933),
(65, 0, 1, 'shop', 35, 1, '', '988ff8796c3f55b84789feaacaa99090', 1483089130),
(66, 0, 1, 'shop', 20, 1, '', '90d22dbdc6c3499b67efc13889c07e97', 1483090652),
(67, 0, 1, 'shop', 38, 1, '', '90d22dbdc6c3499b67efc13889c07e97', 1483092482),
(68, 0, 1, 'shop', 44, 1, '', 'b16e4828b886b649453363100254d2bf', 1483094303),
(69, 0, 1, 'shop', 33, 1, '', '90d22dbdc6c3499b67efc13889c07e97', 1483100121),
(70, 0, 1, 'shop', 31, 1, '', '90d22dbdc6c3499b67efc13889c07e97', 1483103791),
(71, 0, 1, 'shop', 35, 1, '', 'b6d518528caa2df259644a6564649aff', 1483390099),
(72, 0, 1, 'shop', 20, 1, '', '7ede5dbcb4f354309f9198fdd8ca31df', 1483391019),
(73, 0, 1, 'shop', 38, 1, '', '9771ec17a808227a6afffa9154ff68c8', 1483393479),
(74, 0, 1, 'shop', 44, 1, '', 'b6d518528caa2df259644a6564649aff', 1483396209),
(75, 0, 1, 'shop', 33, 1, '', '862fe601a5337ce2453754724aa33e9a', 1483402930),
(76, 0, 1, 'shop', 31, 1, '', 'b6d518528caa2df259644a6564649aff', 1483416069),
(77, 0, 1, 'shop', 20, 1, '', 'a6f577a23abd9d0b0f03ea5673e49fe5', 1483621257),
(78, 0, 1, 'shop', 38, 1, '', '1a0d36373ed7a1d578ee56dab756da62', 1483624129),
(79, 0, 1, 'shop', 44, 2, '', '2d2e8e6ab88742154eade31e44c21e75', 1484247889),
(80, 0, 1, 'shop', 33, 1, '', '7d60ccea8589f1cdf35d05910a80f7bd', 1483633293),
(81, 0, 1, 'shop', 33, 1, '', 'a6d5f5fb7335662761ac113540d6acc1', 1483633295),
(82, 0, 1, 'shop', 32, 1, '', '1a0d36373ed7a1d578ee56dab756da62', 1483825209),
(83, 0, 1, 'shop', 33, 1, '', 'a6f577a23abd9d0b0f03ea5673e49fe5', 1483915628),
(84, 0, 1, 'shop', 45, 1, '', '1a0d36373ed7a1d578ee56dab756da62', 1483918988),
(85, 0, 1, 'shop', 38, 1, '', '2d2e8e6ab88742154eade31e44c21e75', 1483919908),
(86, 0, 1, 'shop', 32, 1, '', 'f6cf252dd6b7e881244fce3e51b9f809', 1484091688),
(87, 0, 1, 'shop', 20, 1, '', 'f6cf252dd6b7e881244fce3e51b9f809', 1484094770),
(88, 0, 1, 'shop', 35, 1, '', '5da6db68545be9c1857e03e0f00c649d', 1484098698),
(89, 0, 1, 'shop', 31, 1, '', 'f6cf252dd6b7e881244fce3e51b9f809', 1484105063),
(90, 0, 1, 'shop', 25, 1, '', '8e2ca55544950ad993e8e2861c3ab9b6', 1484106480),
(91, 0, 1, 'shop', 26, 1, '', 'f6cf252dd6b7e881244fce3e51b9f809', 1484109667),
(92, 0, 1, 'shop', 33, 1, '', '2d2e8e6ab88742154eade31e44c21e75', 1484174484),
(93, 0, 1, 'shop', 45, 1, '', '2d2e8e6ab88742154eade31e44c21e75', 1484250939),
(94, 0, 1, 'shop', 32, 1, '', '2323902ac63651439038e12e47cbaac8', 1484363398),
(95, 0, 1, 'shop', 45, 1, '', '167c91527da545f413ae9605e08cbfdb', 1484462254),
(96, 0, 1, 'shop', 33, 1, '', 'f033d920dd5d2c7cb4ea9378436fba91', 1484514894),
(97, 0, 1, 'shop', 32, 1, '', '440aa0218188d1692c7050c760cc0678', 1484594057),
(98, 0, 1, 'shop', 33, 1, '', 'dac765efe84542f736b6fb3e1a748afb', 1484773918),
(99, 0, 1, 'shop', 20, 1, '', '4895bb74ea5f10f1ef580c464ffb00d3', 1485016571),
(100, 0, 1, 'shop', 32, 1, '', 'dac765efe84542f736b6fb3e1a748afb', 1485243995),
(101, 0, 1, 'shop', 44, 1, '', '18a892140595cf441bd25682f454a8d9', 1485380783),
(102, 0, 1, 'shop', 45, 1, '', 'f09da974e5db17b2e45154c7a1f62502', 1485424327),
(103, 0, 1, 'shop', 20, 1, '', '7adcdca029b86e39da2a737a805c58b6', 1486995736),
(104, 0, 1, 'shop', 24, 1, '', '1cb4d7cb7339628846b48d9c13e6aaff', 1486995989),
(105, 0, 1, 'shop', 22, 1, '', '1cb4d7cb7339628846b48d9c13e6aaff', 1486996262),
(106, 0, 1, 'shop', 41, 1, '', '1cb4d7cb7339628846b48d9c13e6aaff', 1486996427),
(107, 0, 1, 'shop', 27, 1, '', '9f4dfb72545ca3e6baa4b7e0b7c9f01a', 1486996461),
(108, 0, 1, 'shop', 21, 1, '', '7adcdca029b86e39da2a737a805c58b6', 1486996821),
(109, 0, 1, 'shop', 40, 1, '', '1cb4d7cb7339628846b48d9c13e6aaff', 1486997009),
(110, 0, 1, 'shop', 43, 1, '', '9f4dfb72545ca3e6baa4b7e0b7c9f01a', 1486997281),
(111, 0, 1, 'shop', 31, 1, '', 'ebee548dfbedb5eafe92efd53b652a12', 1487783931),
(112, 0, 1, 'shop', 26, 1, '', '8c1520a86f4418eb585bda8d8b051c76', 1487801885),
(113, 0, 1, 'shop', 37, 1, '', '48386ba371932da31776ac500080ab64', 1487803031),
(114, 0, 1, 'shop', 30, 1, '', '48386ba371932da31776ac500080ab64', 1487803761),
(115, 0, 1, 'shop', 50, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1487804403),
(116, 0, 1, 'shop', 44, 1, '', '48386ba371932da31776ac500080ab64', 1487805589),
(117, 0, 1, 'shop', 46, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1487807352),
(118, 0, 1, 'shop', 29, 2, '', '48386ba371932da31776ac500080ab64', 1490036897),
(119, 0, 1, 'shop', 35, 1, '', 'ebee548dfbedb5eafe92efd53b652a12', 1487809465),
(120, 0, 1, 'shop', 23, 1, '', '48386ba371932da31776ac500080ab64', 1487813531),
(121, 0, 1, 'shop', 33, 1, '', 'fc798f689fddcfa5a867a60253c7621d', 1487814022),
(122, 0, 1, 'shop', 45, 1, '', 'ebee548dfbedb5eafe92efd53b652a12', 1487816024),
(123, 0, 1, 'shop', 34, 1, '', '48386ba371932da31776ac500080ab64', 1487822061),
(124, 0, 1, 'shop', 47, 1, '', '59c0e2f7d8c93393e2a58176590d15d0', 1487919810),
(125, 0, 1, 'shop', 49, 1, '', 'b0048d6a8257748439b9eb4b5c57534b', 1487920734),
(126, 0, 1, 'shop', 25, 1, '', '48386ba371932da31776ac500080ab64', 1487922088),
(127, 0, 1, 'shop', 32, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1487924289),
(128, 0, 1, 'shop', 48, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1487925667),
(129, 0, 1, 'shop', 36, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1487926959),
(130, 0, 1, 'shop', 28, 1, '', 'ccd7a345285fe6969333cdca1cc9bfda', 1487928390),
(131, 0, 1, 'shop', 38, 1, '', '48386ba371932da31776ac500080ab64', 1487930149),
(132, 0, 1, 'shop', 46, 1, '', '2bb0623b98d143afc0f4a5df9542f533', 1488059404),
(133, 0, 1, 'shop', 27, 1, '', 'efad7981a1534c3b8a89dec9cb356a18', 1488100355),
(134, 0, 1, 'shop', 21, 1, '', '2bb0623b98d143afc0f4a5df9542f533', 1488297439),
(135, 0, 1, 'shop', 39, 1, '', '167c91527da545f413ae9605e08cbfdb', 1489176132),
(136, 0, 1, 'shop', 42, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1489197365),
(137, 0, 1, 'shop', 42, 1, '', 'c975cebb1ab865ad782bcda6b645d099', 1489285903),
(138, 0, 1, 'shop', 21, 1, '', 'f033d920dd5d2c7cb4ea9378436fba91', 1489877294),
(139, 0, 1, 'shop', 39, 1, '', '440aa0218188d1692c7050c760cc0678', 1489883098),
(140, 0, 1, 'shop', 40, 1, '', '2323902ac63651439038e12e47cbaac8', 1489890145),
(141, 0, 1, 'shop', 42, 1, '', 'f033d920dd5d2c7cb4ea9378436fba91', 1489890414),
(142, 0, 1, 'shop', 24, 1, '', '2323902ac63651439038e12e47cbaac8', 1489890723),
(143, 0, 1, 'shop', 24, 1, '', '167c91527da545f413ae9605e08cbfdb', 1489988834),
(144, 0, 1, 'shop', 20, 1, '', '167c91527da545f413ae9605e08cbfdb', 1490008404),
(145, 0, 1, 'shop', 22, 1, '', 'c975cebb1ab865ad782bcda6b645d099', 1490014091),
(146, 0, 1, 'shop', 41, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490017152),
(147, 0, 1, 'shop', 36, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490020015),
(148, 0, 1, 'shop', 21, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490021344),
(149, 0, 1, 'shop', 28, 1, '', 'fc798f689fddcfa5a867a60253c7621d', 1490022221),
(150, 0, 1, 'shop', 38, 1, '', '33b24f866b8d773bccb7b8ecb1d299e7', 1490023228),
(151, 0, 1, 'shop', 37, 1, '', '8c1520a86f4418eb585bda8d8b051c76', 1490025859),
(152, 0, 1, 'shop', 30, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1490026411),
(153, 0, 1, 'shop', 40, 1, '', '48386ba371932da31776ac500080ab64', 1490026886),
(154, 0, 1, 'shop', 44, 1, '', 'ebee548dfbedb5eafe92efd53b652a12', 1490027313),
(155, 0, 1, 'shop', 23, 1, '', '8c8b728599a4606b929b9e9752bf3daf', 1490029520),
(156, 0, 1, 'shop', 45, 1, '', 'f7a556efeeafe64cd390cacb96d3b61c', 1490030739),
(157, 0, 1, 'shop', 42, 1, '', 'f7a556efeeafe64cd390cacb96d3b61c', 1490033323),
(158, 0, 1, 'shop', 39, 1, '', '2ef7796a541dfe79295e6f04c5cf757b', 1490034160),
(159, 0, 1, 'shop', 46, 1, '', 'fc798f689fddcfa5a867a60253c7621d', 1490036053),
(160, 0, 1, 'shop', 35, 1, '', '4585fa46e2ee65ef726c169fed02b9af', 1490037758),
(161, 0, 1, 'shop', 43, 1, '', 'ebee548dfbedb5eafe92efd53b652a12', 1490040906),
(162, 0, 1, 'shop', 34, 1, '', '8c1520a86f4418eb585bda8d8b051c76', 1490042843),
(163, 0, 1, 'shop', 50, 1, '', 'dfe87afcb9ead47f6768ee64391f1593', 1490082439),
(164, 0, 1, 'shop', 47, 1, '', '48386ba371932da31776ac500080ab64', 1490108622),
(165, 0, 1, 'shop', 49, 1, '', '76829007cd104cf155c3aac93690a286', 1490110576),
(166, 0, 1, 'shop', 41, 1, '', '440aa0218188d1692c7050c760cc0678', 1490111936),
(167, 0, 1, 'shop', 25, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490112165),
(168, 0, 1, 'shop', 43, 1, '', 'f033d920dd5d2c7cb4ea9378436fba91', 1490112243),
(169, 0, 1, 'shop', 48, 1, '', 'c975cebb1ab865ad782bcda6b645d099', 1490115907),
(170, 0, 1, 'shop', 26, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490124039),
(171, 0, 1, 'shop', 50, 1, '', 'c975cebb1ab865ad782bcda6b645d099', 1490124878),
(172, 0, 1, 'shop', 33, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490165668),
(173, 0, 1, 'shop', 32, 1, '', '167c91527da545f413ae9605e08cbfdb', 1490168150),
(174, 0, 1, 'shop', 31, 1, '', 'a01ba82d720dc2276939d8b2d4afa317', 1490168745),
(175, 0, 1, 'shop', 22, 1, '', '2323902ac63651439038e12e47cbaac8', 1490204423),
(176, 0, 1, 'shop', 47, 1, '', '440aa0218188d1692c7050c760cc0678', 1490208105),
(177, 0, 1, 'shop', 51, 1, '', '960dd641fc03eb9f32a6a521da5a5cac', 1498294881);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_1`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_1` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_2`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_2` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_3`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_3` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_1_order_cart_3`
--

INSERT INTO `rs_1_order_cart_3` (`id`, `uid`, `sell`, `mid`, `cid`, `quantity`, `specification`, `agent`, `inputtime`) VALUES
(1, 3, 1, 'shop', 12, 1, '', 'e14d275fb10690666856113940718693', 1472560358);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_4`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_4` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_5`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_5` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_6`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_6` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `rs_1_order_cart_6`
--

INSERT INTO `rs_1_order_cart_6` (`id`, `uid`, `sell`, `mid`, `cid`, `quantity`, `specification`, `agent`, `inputtime`) VALUES
(2, 66, 1, 'shop', 51, 1, '', '960dd641fc03eb9f32a6a521da5a5cac', 1498031085);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_7`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_7` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_cart_8`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_cart_8` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_data_0` (
  `id` bigint(18) NOT NULL COMMENT 'oid',
  `buy_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '购买者id',
  `buy_note` text COMMENT '购买者备注或留言',
  `sell_note` text COMMENT '商家备注',
  `sell_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '出售者id',
  `shipping_type` varchar(50) DEFAULT NULL COMMENT '物流方式',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '物流/快递单号',
  `shipping_city` varchar(100) DEFAULT NULL COMMENT '物流城市',
  `shipping_zipcode` varchar(32) DEFAULT NULL COMMENT '物流邮编',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '物流收货地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `buy_uid` (`buy_uid`),
  KEY `sell_uid` (`sell_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息附表';

--
-- 转存表中的数据 `rs_1_order_data_0`
--

INSERT INTO `rs_1_order_data_0` (`id`, `buy_uid`, `buy_note`, `sell_note`, `sell_uid`, `shipping_type`, `shipping_sn`, `shipping_city`, `shipping_zipcode`, `shipping_address`) VALUES
(1, 2, '', NULL, 1, '', '', '', '', ''),
(2, 3, '', NULL, 1, '', '', '', '', ''),
(3, 0, '', NULL, 1, '', '', '', '', ''),
(4, 3, '', NULL, 1, '', '', '', '', ''),
(5, 3, '', NULL, 1, '', '', '', '', ''),
(6, 3, '', NULL, 1, '', '', '', '', ''),
(7, 3, '', NULL, 1, '', '', '', '', ''),
(8, 3, '', NULL, 1, '', '', '天津市', '11', '11'),
(9, 3, '', NULL, 1, '', '', '福建省福州市', '350001', '福州市鼓楼区'),
(10, 3, '', NULL, 1, '', '', '福建省福州市', '350001', '福州市鼓楼区'),
(11, 16, '', NULL, 1, '', '', '福建省福州市', '125', '设计的规范北方有望'),
(12, 3, '', NULL, 1, '', '', '福建省福州市', '350001', '福州市鼓楼区'),
(13, 3, '', NULL, 1, '', '', '福建省福州市', '350001', '福州市鼓楼区'),
(14, 3, '', NULL, 1, '', '', NULL, '', ''),
(15, 3, '', NULL, 1, '', '', NULL, '', ''),
(16, 3, '', NULL, 1, '', '', NULL, '', ''),
(17, 17, '', NULL, 1, '', '', NULL, '', ''),
(18, 23, '', NULL, 1, NULL, NULL, NULL, '', ''),
(19, 17, '', NULL, 1, '', '', NULL, '', ''),
(20, 19, '', NULL, 1, '', '', NULL, '', ''),
(21, 19, '', NULL, 1, '', '', NULL, '', ''),
(22, 27, '', NULL, 1, '', '', NULL, '', ''),
(23, 17, '', NULL, 1, '', '', NULL, '', ''),
(24, 37, '电视', NULL, 1, '', '', NULL, '', ''),
(25, 35, '', NULL, 1, '', '', NULL, '', ''),
(26, 17, '', NULL, 1, '', '', NULL, '', ''),
(27, 37, '', NULL, 1, '', '', NULL, '', ''),
(28, 27, '', NULL, 1, '', '', NULL, '', ''),
(29, 33, '', NULL, 1, NULL, NULL, NULL, '', ''),
(30, 68, '', NULL, 1, '', '', NULL, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_data_9`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_data_9` (
  `id` bigint(18) NOT NULL COMMENT 'oid',
  `buy_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '购买者id',
  `buy_note` text COMMENT '购买者备注或留言',
  `sell_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '出售者id',
  `shipping_type` varchar(50) DEFAULT NULL COMMENT '物流方式',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '物流/快递单号',
  `shipping_city` varchar(100) DEFAULT NULL COMMENT '物流城市',
  `shipping_zipcode` varchar(32) DEFAULT NULL COMMENT '物流邮编',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '物流收货地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `buy_uid` (`buy_uid`),
  KEY `sell_uid` (`sell_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_goods`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_goods` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT 'gid',
  `oid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `mid` varchar(20) NOT NULL COMMENT '模块名',
  `cid` int(11) unsigned NOT NULL COMMENT '内容id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `catid` int(10) NOT NULL COMMENT '栏目',
  `thumb` varchar(100) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `specification` varchar(100) NOT NULL COMMENT '规格',
  `quantity` int(10) NOT NULL COMMENT '购买数量',
  `sn` varchar(100) NOT NULL COMMENT '商品编码',
  `sku` text NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '总价格',
  `order_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`),
  KEY `mid` (`mid`),
  KEY `cid` (`cid`),
  KEY `title` (`title`),
  KEY `order_price` (`order_price`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单商品表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `rs_1_order_goods`
--

INSERT INTO `rs_1_order_goods` (`id`, `oid`, `mid`, `cid`, `title`, `catid`, `thumb`, `url`, `specification`, `quantity`, `sn`, `sku`, `price`, `order_price`) VALUES
(1, 1, 'shop', 1, '测试培训课程', 1, '1', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=1', '0', 1, '', '', 20.00, 20.00),
(2, 2, 'shop', 3, '进出口许可证', 8, '14', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=3', '0', 1, '', '', 100.00, 100.00),
(3, 3, 'shop', 8, 'yryy', 16, '56', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=8', '0', 1, '', '', 11.00, 11.00),
(4, 4, 'shop', 8, 'yryy', 16, '56', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=8', '0', 1, '', '', 11.00, 11.00),
(5, 5, 'shop', 8, 'yryy', 16, '56', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=8', '0', 1, '', '', 11.00, 11.00),
(6, 6, 'shop', 8, 'yryy', 16, '56', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=8', '0', 1, '', '', 11.00, 11.00),
(7, 7, 'shop', 8, 'yryy', 16, '56', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=8', '0', 1, '', '', 11.00, 11.00),
(8, 8, 'shop', 8, 'yryy', 16, '56', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=8', '0', 1, '', '', 11.00, 11.00),
(9, 9, 'shop', 10, 'iii', 12, '58', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=10', '0', 1, '', '', 3.00, 3.00),
(10, 10, 'shop', 10, '个体商户登记 代办营业执照 财务代理', 7, '115', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=10', '0', 1, '', '', 800.00, 800.00),
(11, 11, 'shop', 12, '公司名称变更 公司变更 工商变更 财务代理', 7, '119', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=12', '0', 2, '', '', 1600.00, 800.00),
(12, 12, 'shop', 16, '福州恒凯会计 代办食品流通许可证 财务代理 食流证', 8, '133', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=16', '0', 1, '', '', 2000.00, 2000.00),
(13, 13, 'shop', 15, '代办食品流通许可证 财务代理 食流证', 8, '131', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=15', '0', 1, '', '', 2000.00, 2000.00),
(14, 14, 'shop', 16, '福州恒凯会计 代办食品流通许可证 财务代理 食流证', 8, '133', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=16', '0', 1, '', '', 2000.00, 2000.00),
(15, 15, 'shop', 16, '福州恒凯会计 代办食品流通许可证 财务代理 食流证', 8, '133', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=16', '0', 1, '', '', 2000.00, 2000.00),
(16, 16, 'shop', 15, '代办食品流通许可证 财务代理 食流证', 8, '131', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=15', '0', 1, '', '', 2000.00, 2000.00),
(17, 17, 'shop', 12, '公司名称变更 公司变更 工商变更 财务代理', 7, '119', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=12', '0', 1, '', '', 800.00, 800.00),
(18, 18, 'shop', 21, '福州工商 工商注册 公司注册 代理公司名称变更 公司变更', 7, '223', 'http://www.topkuaiji.com/index.php?s=shop&c=show&id=21', '0', 1, '', '', 800.00, 800.00),
(19, 19, 'shop', 21, '福州工商 工商注册 公司注册 代理公司名称变更 公司变更', 7, '333', 'http://www.topkuaiji.com/shop-show-21.html', '0', 1, '', '', 800.00, 800.00),
(20, 20, 'shop', 20, '福州公司注册 内资公司注册 个体工商注册 工商代理 拍前请联系客服！', 7, '345', 'http://www.topkuaiji.com/shop-show-20.html', '0', 1, '', '', 800.00, 800.00),
(21, 21, 'shop', 21, '公司变更 福州工商 工商注册 公司注册 代理公司名称变更 注册资本变更 法人或股东变更 注册地址变更', 7, '339', 'http://www.topkuaiji.com/shop-show-21.html', '0', 1, '', '', 800.00, 800.00),
(22, 22, 'shop', 20, '福州公司注册 内资公司注册 个体工商注册 工商代理 拍前请联系客服！', 7, '345', 'http://www.topkuaiji.com/shop-show-20.html', '0', 1, '', '', 800.00, 800.00),
(23, 23, 'shop', 40, '股东或法人变更 福州企业故宫或法人变更 工商变更代理', 7, '569', 'http://www.topkuaiji.com/shop-show-40.html', '0', 1, '', '', 800.00, 800.00),
(24, 24, 'shop', 34, '财税顾问 福州企业财税管理顾问 财务代理 ', 17, '485', 'http://www.topkuaiji.com/shop-show-34.html', '0', 1, '', '', 1000.00, 1000.00),
(25, 25, 'shop', 40, '股东或法人变更 福州企业故宫或法人变更 工商变更代理', 7, '569', 'http://www.topkuaiji.com/shop-show-40.html', '0', 1, '', '', 800.00, 800.00),
(26, 26, 'shop', 41, '注册地址变更 公司注册地址变更 福州企业地址变更 工商代理', 7, '574', 'http://www.topkuaiji.com/shop-show-41.html', '0', 1, '', '', 800.00, 800.00),
(27, 27, 'shop', 41, '注册地址变更 公司注册地址变更 福州企业地址变更 工商代理', 7, '574', 'http://www.topkuaiji.com/shop-show-41.html', '0', 1, '', '', 800.00, 800.00),
(28, 28, 'shop', 41, '注册地址变更 公司注册地址变更 福州企业地址变更 工商代理', 7, '574', 'http://www.topkuaiji.com/shop-show-41.html', '0', 1, '', '', 800.00, 800.00),
(29, 29, 'shop', 22, '财务代理 淘会计 福州财务代理 代理记账 兼职会计 ', 17, '331', 'http://www.topkuaiji.com/shop-show-22.html', '0', 1, '', '', 300.00, 300.00),
(30, 30, 'shop', 51, '供需链管理系统', 7, '1111', 'http://demo.hf872.com/shop-show-51.html', '0', 1, '', '', 12.00, 12.00);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_operate`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_operate` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `oid` bigint(18) NOT NULL COMMENT '订单id',
  `uid` int(10) NOT NULL COMMENT '操作人',
  `username` varchar(100) NOT NULL COMMENT '操作人账号',
  `order_status` tinyint(2) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(2) NOT NULL COMMENT '付款状态',
  `shipping_status` tinyint(2) NOT NULL COMMENT '物流状态',
  `note` text NOT NULL COMMENT '备注信息',
  `inputtime` int(10) NOT NULL COMMENT '操作时间',
  `inputip` varchar(100) NOT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`),
  KEY `order_status` (`order_status`),
  KEY `pay_status` (`pay_status`),
  KEY `inputtime` (`inputtime`),
  KEY `shipping_status` (`shipping_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单操作记录表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `rs_1_order_operate`
--

INSERT INTO `rs_1_order_operate` (`id`, `oid`, `uid`, `username`, `order_status`, `pay_status`, `shipping_status`, `note`, `inputtime`, `inputip`) VALUES
(1, 2, 1, 'admin', 1, 0, 0, '卖家把订单价格由 ￥100.00 改为 ￥500.00', 1464770763, '127.0.0.1'),
(2, 10, 1, 'admin', 1, 0, 0, '卖家把订单价格由 ￥800.00 改为 ￥0.00', 1472632835, '120.35.4.185'),
(3, 10, 3, '不简单', 2, 3, 0, '买家已付款', 1472637397, '120.35.4.185'),
(4, 10, 1, 'admin', 4, 3, 3, '卖家已发货，承运：无，运货单号：', 1472693223, '120.35.4.185'),
(5, 18, 1, 'admin', 1, 0, 0, '卖家把订单价格由 ￥800.00 改为 ￥0.01', 1473212481, '120.35.4.185'),
(6, 18, 23, 'bujd', 2, 3, 0, 'mod-062', 1473212785, '120.35.4.185'),
(7, 18, 1, 'admin', 4, 3, 3, '卖家已发货', 1473214270, '120.35.4.185'),
(8, 25, 35, 'cai123', 9, 0, 0, '的股份', 1474613042, '27.156.74.163'),
(9, 24, 37, 'wei0729', 9, 0, 0, '多拍了', 1475129664, '120.39.57.185'),
(10, 29, 33, 'qybst', 2, 3, 0, '买家已付款', 1476084565, '27.156.74.134'),
(11, 29, 1, 'admin', 4, 3, 3, '卖家已发货', 1476084632, '27.156.74.134'),
(12, 29, 33, 'qybst', 3, 3, 5, '买家已收货', 1476084644, '27.156.74.134');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_order_transfer`
--

CREATE TABLE IF NOT EXISTS `rs_1_order_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` mediumint(8) unsigned NOT NULL COMMENT '订单id',
  `sn` varchar(255) NOT NULL COMMENT '订单流水号',
  `note` text COMMENT '备注',
  `sell_uid` mediumint(8) unsigned NOT NULL COMMENT '商家id',
  `buy_uid` mediumint(8) unsigned NOT NULL COMMENT '卖家id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '后台录入人uid',
  `bank_sn` bigint(15) unsigned NOT NULL COMMENT '银行卡号',
  `username` varchar(100) NOT NULL COMMENT '后台录入人账号',
  `bank_note` varchar(225) NOT NULL COMMENT '转账凭证图片',
  `bank_name` varchar(100) NOT NULL COMMENT '银行名称',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `bank_sn` (`bank_sn`),
  KEY `oid` (`oid`),
  KEY `sn` (`sn`),
  KEY `sell_uid` (`sell_uid`),
  KEY `buy_uid` (`buy_uid`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='转账受理表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_page`
--

CREATE TABLE IF NOT EXISTS `rs_1_page` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL COMMENT '模块dir',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(255) NOT NULL COMMENT '单页名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有子类',
  `childids` varchar(255) NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `keywords` varchar(255) NOT NULL COMMENT 'seo关键字',
  `description` varchar(255) NOT NULL COMMENT 'seo描述',
  `content` mediumtext COMMENT '单页内容',
  `attachment` text COMMENT '附件信息',
  `template` varchar(30) NOT NULL COMMENT '模板文件',
  `urlrule` smallint(5) unsigned DEFAULT NULL COMMENT 'url规则id',
  `urllink` varchar(255) NOT NULL COMMENT 'url外链',
  `getchild` tinyint(1) unsigned NOT NULL COMMENT '将下级第一个菜单作为当前菜单',
  `show` tinyint(1) unsigned NOT NULL COMMENT '是否显示在菜单',
  `url` varchar(255) NOT NULL COMMENT 'url地址',
  `setting` mediumtext NOT NULL COMMENT '自定义内容',
  `displayorder` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`module`),
  KEY `pid` (`pid`),
  KEY `show` (`show`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='单页表' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `rs_1_page`
--

INSERT INTO `rs_1_page` (`id`, `module`, `pid`, `pids`, `name`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `title`, `keywords`, `description`, `content`, `attachment`, `template`, `urlrule`, `urllink`, `getchild`, `show`, `url`, `setting`, `displayorder`) VALUES
(1, '', 0, '0', '服务方案', 'service', '', 1, '1,4,10,11,12,13,14,15,16,5,6,7,8,17,18,19,9', '', '', '', '', '<p>服务方案</p>', '', 'publish.html', 0, 'publish.html', 1, 1, 'publish.html', '', 0),
(2, '', 0, '0', '业务拍档', 'partner', '', 0, '2', '', '业务拍档', '', '', '<p>业务拍档</p>', '', 'partner.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=2', '', 0),
(3, '', 0, '0', '关于我们', 'about', '', 1, '3,20,21', '', '', '', '', '<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;福建省联标国际发展有限公司（以下简称公司或“联标发展”）实际控制人是福建省电子信息集团有限责任公司，是设立在香港的母公司联标发展国际投资有限公司的国内综合运营总部，肩负着集团旗下寻求可持续性增长，整合境内、外电子信息行业资源的重任；是以专业化、一站式外贸综合服务平台为载体，开展供应链管理服务与股权运作并进的产融结合经营实体。公司坐落于福建省自由贸易试验区、海丝核心区、福州新区&quot;三区叠加&quot;的重点开发区域——福州市马尾区。</p><p><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 联标发展已经组建和培养一支优秀、专业、高效的外贸综合服务团队，主要管理人员由国际贸易、证券基金、金融投资等专业领域人才组成，汇聚了贸易、关务、物流、市场营销、法律、财务、税务、保险等相关领域的精英，吸收创新了联强国际（SYNNEX）、怡亚通、中电投资、深圳创投等公司的外贸综合服务管理经验。目前公司下设福建业务中心、香港国际采购中心、深圳业务中心、跨境电商中心等部门和机构，具有深厚的人才储备和巨大的成长空间。</p><p><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 联标发展作为专业的外贸综合服务提供商，通过专业、高效的O2O电子商务平台与线下互动的形式，融合物流、资金流、商流、信息流和产品流，为平台上的中小微合作伙伴提供个性化、一站式供应链解决方案，包括中港运输与报关、代理进出口、采购与采购执行、销售与销售执行、虚拟生产、物流仓储、资金结算、保险保理、退税、供应链金融、跨境电商等单独或组合的外贸供应链增值服务方式。</p><p><br/></p><p>　 &nbsp;经过不懈的努力与发展，年轻的联标发展已建立一套完善的服务管理流程及风险管控体系，目前服务网络遍布香港、台湾、韩国、印尼、美国、英国、加拿大、法国、巴西、印度、俄罗斯、阿联酋等国家和地区。公司以“价值、合作、成长”为核心价值观，积极营造平台与合作伙伴的双赢格局，获得境内外合作伙伴的一致好评。联标发展正逐步成长为一家卓越的供应链服务提供商，欢迎海内外有识之士携手合作、共同成长。</p><p><br/></p>', '', 'about.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=3', '', 0),
(4, '', 1, '0,1', '进出口服务', 'jinchukoufuwu', 'service/', 1, '4,10,11,12,13,14,15,16', '1089', '进出口服务', '', '联标发展为客户提供进口、出口报关报验、退单、缮制箱单发票等报关单据、代垫关税、代办产地证、熏蒸证等货运代理服务。', '<p>联标发展为客户提供进口、出口报关报验、退单、缮制箱单发票等报关单据、代垫关税、代办产地证、熏蒸证等货运代理服务。</p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=4', '', 0),
(5, '', 1, '0,1', '分销执行', 'fenxiaozhixing', 'service/', 0, '5', '1106', '分销执行', '', '合作伙伴一对多的销售模式简便为一对一的销售模式，让合作伙伴专注市场拓展；合作伙伴可以让销售服务延伸至国内；', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 14pt; font-family: 宋体;">一、流程</span></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675358110217.png" title="1496675358110217.png" alt="blob.png"/><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体; font-weight: bold;">二、优势</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;"><br/></span><span style="font-size: 12pt; font-family: Calibri;">1</span><span style="font-size: 12pt; font-family: 宋体;">、合作伙伴一对多的销售模式简便为一对一的销售模式，让合作伙伴专注市场拓展；<br/></span><span style="font-size: 12pt; font-family: Calibri;">2</span><span style="font-size: 12pt; font-family: 宋体;">、合作伙伴可以让销售服务延伸至国内；<br/></span><span style="font-size: 12pt; font-family: Calibri;">3</span><span style="font-size: 12pt; font-family: 宋体;">、为合作伙伴提供收款、开票结算服务，物流仓储配送服务，重新包装、贴标增值服务；<br/></span><span style="font-size: 12pt; font-family: Calibri;">4</span><span style="font-size: 12pt; font-family: 宋体;">、为终端合作伙伴提供资金服务，扩大产品市场占有率。</span></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=5', '', 0),
(6, '', 1, '0,1', '采购执行', 'caigouzhixing', 'service/', 0, '6', '1107', '采购执行', '', '合作伙伴一对多的采购模式简便为一对一的采购模式，简化采购手续，合作伙伴专注于核心业务;专业高效的通关物流服务，提高采购效率；', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: 宋体; font-weight: bold;"></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 14pt; font-family: 宋体;">一、流程</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: 宋体; font-weight: bold;"></span><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: 宋体; font-weight: bold;"><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675824305955.png" title="1496675824305955.png" alt="blob.png"/></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: 宋体; font-weight: bold;"></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: 宋体; font-weight: bold;">二、优势&nbsp;</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: Calibri;">1</span><span style="font-size: 12pt; font-family: 宋体;">、合作伙伴一对多的采购模式简便为一对一的采购模式，简化采购手续，合作伙伴专注于核心业务；</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: break-all;"><span style="font-size: 12pt; font-family: Calibri;">2</span><span style="font-size: 12pt; font-family: 宋体;">、专业高效的通关物流服务，提高采购效率；<br/></span><span style="font-size: 12pt; font-family: Calibri;">3</span><span style="font-size: 12pt; font-family: 宋体;">、为合作伙伴采购提供资金服务，增大采购量，降低采购价格；<br/></span><span style="font-size: 12pt; font-family: Calibri;">4</span><span style="font-size: 12pt; font-family: 宋体;">、一站式采购</span><span style="font-size: 12pt; font-family: Calibri;">/</span><span style="font-size: 12pt; font-family: 宋体;">采购执行服务降低合作伙伴综合采购成本，提高供应链效益。</span></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=6', '', 0),
(7, '', 1, '0,1', '海外仓储', 'haiwaicangchu', 'service/', 0, '7', '1108', '海外仓储', '', '快速到货的运输时间；本土派送运费取代国际运费；提供更完善的买家售后退、换货服务；大幅度提升利润空间', '<p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675434780811.png" title="1496675434780811.png" alt="blob.png"/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=7', '', 0),
(8, '', 1, '0,1', '供应链管理', 'gongyinglianguanli', 'service/', 1, '8,17,18,19', '1109', '供应链管理', '', '1、集中的数量优势2、避免复制3、集中采购形成规模运输从而降低运输成本4、减少企业内部的各部门及单位的竞争和冲突5、形成供应基地6、降低采购成本', '<p><span style="font-size: 16px;">1、集中的数量优势</span></p><p><span style="font-size: 16px;">2、避免复制</span></p><p><span style="font-size: 16px;">3、集中采购形成规模运输从而降低运输成本</span></p><p><span style="font-size: 16px;">4、减少企业内部的各部门及单位的竞争和冲突</span></p><p><span style="font-size: 16px;">5、形成供应基地</span></p><p><span style="font-size: 16px;">6、降低采购成本</span></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=8', '', 0),
(9, '', 1, '0,1', '跨境电商', 'kuajingdianshang', 'service/', 0, '9', '1110', '跨境电商', '', '联标发展专业的运营团队，应客户需求提供专业报关服务，并提供相应增值服务；同时，客户亦可通过信息系统查询状态，真正做到贴心，安心的报关服务。', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;">■ 跨境电商通关</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;">联标发展专业的运营团队，应客户需求提供专业报关服务，并提供相应增值服务；同时，客户亦可通过信息系统查询状态，真正做到贴心，安心的报关服务。</span></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675990123505.png" title="1496675990123505.png" alt="blob.png" width="750" height="177" style="width: 750px; height: 177px;"/></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675996483246.png" title="1496675996483246.png" alt="blob.png" width="750" height="388" style="width: 750px; height: 388px;"/></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496676002124589.png" title="1496676002124589.png" alt="blob.png" width="750" height="330" style="width: 750px; height: 330px;"/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;">■ 跨境电商配送服务</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;">联标发展提供一站式跨境电商服务，我们可为客户安排可靠快捷的配送服务。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;">让购买海外商品的客户准时收到完好无缺的商品，提高用户体验，为您赢得更好的口碑，稳定客源，抢占市场份额！</span></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=9', '', 0),
(10, '', 4, '0,1,4', '报关报检', 'baoguanbaojian', 'service/jinchukoufuwu/', 0, '10', '', '报关报检', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">联标发展为客户提供进口、出口报关报验、退单、缮制箱单发票等报关单据、代垫关税、代办产地证、熏蒸证等货运代理服务。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">■ 报关报检业务范围</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1.&nbsp;&nbsp;&nbsp;\r\n出口报关：手续简单.便捷.商品范围广：包含</span><span style="font-size: 12pt; font-family: 宋体;">电子信息产品、机械设备、通讯设备、计算机硬件及配件、家用电器、预包装食品兼散装食品、五金交电、化妆品、日用品、化工产品、建筑材料、室内装饰材料、纺织品、饲料</span><span style="font-size: 12pt; font-family: Calibri;">……等等。贵司（厂）只须将商品品名、数量、重量、价值、包装形式等资料传至我司，（如须检验检疫须提前传至）我司即可代办理一切所需单证，稳妥及时办理好相关手续。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2.&nbsp;&nbsp;&nbsp;\r\n进口报关：形式多样.门路广泛.包括一般贸易正常代理报关.本司包税代理报关.以及散货快递报关。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">3.&nbsp;&nbsp;&nbsp;\r\n全天候一条龙服务：本公司不但代理报关还代理报检.产地证（FA、CO），熏蒸.消毒.运输.仓储等业务。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">&nbsp;</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">■ 报关报检业务操作流程</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1.&nbsp;&nbsp;&nbsp;\r\n为顺利通关，请填写货物的具体名称、配件、材质，不要仅填写“配件”或“样品”等字样。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2.&nbsp;&nbsp;&nbsp;\r\n寄件人应填写全名。寄件人须在运单上签字，并填写实际寄件日期。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">3.&nbsp;&nbsp;&nbsp;\r\n快件运单契约条款（责任范围，责任保险最高保额，疑难件）在各大快递公司运单背面注明。寄件前请仔细阅读本条款。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">&nbsp;</span></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=10', '', 0),
(11, '', 4, '0,1,4', '物流', 'wuliu', 'service/jinchukoufuwu/', 0, '11', '', '物流', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">联合各大物流服务商，为您提供海运整柜&amp;拼箱服务。在线查询船期、订舱、操作，费用透明、真实有效。同时提供拖车、报关，散货还有目的港送货到门等增值服务</span><span style="font-size: 12pt; font-family: 宋体;">。提供珠三角出口至香港的送货到门服务以及可承接各地送货至深圳仓库集中发货到香港。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1、操作灵活。彻底解决小货、散货拼柜难、报关难的问题，固定发货，快速过境，节省时间，安全高效。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2、散货运输500kg-20T,为客户节省运输费用，方便快捷。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">3、单箱发运，一个20GP单独运输，避免了国联要求成对运输的限制。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">4、提供保姆式服务。客户只要提交货物信息，我们负责为客户在口岸办理报关、清关手续，方便快捷。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">5</span><span style="font-size: 12pt; font-family: 宋体;">、上门取货，全程跟踪。专人负责整个货物路线、到站、接货通知等事项，快捷的门到门服务，信息及时准确</span></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=11', '', 0),
(12, '', 4, '0,1,4', '退税', 'tuishui', 'service/jinchukoufuwu/', 0, '12', '', '退税', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">为我司评估签约合作的客户，</span><span style="font-size: 12pt; font-family: 宋体;">代理退税</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">以</span><span style="font-size: 12pt; font-family: 宋体;">联标发展</span><span style="font-size: 12pt; font-family: 宋体;">名义</span><span style="font-size: 12pt; font-family: 宋体;">出口的订单，</span><span style="font-size: 12pt; font-family: 宋体;">为您办理退税，并垫付退税款</span><span style="font-size: 12pt; font-family: 宋体;">；所有退税</span><span style="font-size: 12pt; font-family: 宋体;">单证齐全</span><span style="font-size: 12pt; font-family: 宋体;">后，</span><span style="font-size: 12pt; font-family: Calibri;">3个工作日可拿到退税款</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">为您留住更多利润，让外贸环节更加安全、便捷，让外贸出口更加快速、轻松</span></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=12', '', 0),
(13, '', 4, '0,1,4', '结算', 'jiesuan', 'service/jinchukoufuwu/', 0, '13', '', '结算', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">联标发展</span><span style="font-size: 12pt;">拥有一支精通进出口贸易、物流运输的专业团队，严格按照客户要求提供代理进出口贸易、国际货运、报关、报检、仓储、配送运输、外汇结算等一条龙的专业、高效服务。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt;">■ </span><span style="font-size: 12pt; font-family: 宋体;">代理收付汇结算的服务：</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1</span><span style="font-size: 12pt;">、接受委托进口时办理进口购汇、付汇、外汇核销。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2</span><span style="font-size: 12pt;">、接受委托出口时办理出口收汇、结汇、外汇核销。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">3</span><span style="font-size: 12pt;">、开</span><span style="font-size: 12pt; font-family: 宋体;">支持多种结算方式：</span><span style="font-size: 12pt; font-family: Calibri;">L/C </span><span style="font-size: 12pt; font-family: 宋体;">、</span><span style="font-size: 12pt; font-family: Calibri;">T/T</span><span style="font-size: 12pt; font-family: 宋体;">、</span><span style="font-size: 12pt; font-family: Calibri;">D/P</span><span style="font-size: 12pt; font-family: 宋体;">、</span><span style="font-size: 12pt; font-family: Calibri;">D/A </span><span style="font-size: 12pt; font-family: 宋体;">等</span><span style="font-size: 12pt;">。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">&nbsp;</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt;">■ </span><span style="font-size: 12pt;">外汇收付</span><span style="font-size: 12pt; font-family: 宋体;">结算</span><span style="font-size: 12pt;">业务操作注意事项</span><span style="font-size: 12pt; font-family: Calibri;">:</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1. </span><span style="font-size: 12pt;">确保银行收付汇路径的准确性</span><span style="font-size: 12pt;">。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2.&nbsp;</span><span style="font-size: 12pt;">箱单、发票及合同等单据，Bill</span><span style="font-size: 12pt; font-family: Calibri;"> </span><span style="font-size: 12pt; font-family: Calibri;">To的单位应为代理方公司抬头</span><span style="font-size: 12pt;">。</span></p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=13', '', 0),
(14, '', 4, '0,1,4', '融资', 'rongzi', 'service/jinchukoufuwu/', 0, '14', '', '融资', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">联标发展</span><span style="font-size: 12pt; font-family: 宋体;">是福建省国资委旗下全资企业</span><span style="font-size: 12pt; font-family: 宋体;">，拥有雄厚的资金实力，为广大合作伙伴提供中短期融资，帮助资金周转困难的合作伙伴解决融资难题，垫付资金，短期融资，加快资金周转回笼，提升企业竞争力；</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">●联标发展拥有良好的银行信用，内部完善的信用风险评审机制，经验丰富的贸易金融专家，标准化的操作流程，快速帮助广大合作伙伴进行垫付货款、垫付税金、代开</span><span style="font-size: 12pt; font-family: Calibri;">/</span><span style="font-size: 12pt; font-family: 宋体;">代收信用证、进出口押汇等系列资金周转难题；帮助广大合作伙伴规避国际贸易结算中的结汇损失，降低汇兑产生的风险。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: 宋体;">主要提供以下融资方式：</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1</span><span style="font-size: 12pt; font-family: 宋体;">、采购融资</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2</span><span style="font-size: 12pt; font-family: 宋体;">、进出口货物质押融资</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">3</span><span style="font-size: 12pt; font-family: 宋体;">、保单融资</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">4</span><span style="font-size: 12pt; font-family: 宋体;">、不动产抵押融资</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">5</span><span style="font-size: 12pt; font-family: 宋体;">、信用证融资</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=14', '', 0),
(15, '', 4, '0,1,4', '信保', 'xinbao', 'service/jinchukoufuwu/', 0, '15', '', '信保', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">&nbsp;联标发展为</span><span style="font-size: 12pt;">为中小企业提供定制化的保单融资服务</span><span style="font-size: 12pt; font-family: 宋体;">；</span><span style="font-size: 12pt;">在订单操作中，全程配合客户，在订立合同、签署协议、申请投保等各个环节规范合理。万一出现需要理赔，全程协助客户提交理赔申请、准备理赔资料。降低因订单操作、理赔申请各个环节中出现疏漏，导致无法投保、赔付的风险。</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">1</span><span style="font-size: 12pt; font-family: 宋体;">、保障收汇安全</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">2</span><span style="font-size: 12pt; font-family: 宋体;">、为新买家提供专业指导和资信调查</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">3</span><span style="font-size: 12pt; font-family: 宋体;">、凭保单获得金融机构应收账款融资支持</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">4</span><span style="font-size: 12pt; font-family: 宋体;">、专业的风险管控，帮助企业跨上发展新台阶，扩大出口规模</span></p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=15', '', 0),
(16, '', 4, '0,1,4', '保理', 'baoli', 'service/jinchukoufuwu/', 0, '16', '', '保理', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 12pt; font-family: Calibri;">对于广大中小企业的</span><span style="font-size: 12pt;">货物销售或服务合同所产生的应收账款</span><span style="font-size: 12pt;">，</span><span style="font-size: 12pt; font-family: 宋体;">联标发展</span><span style="font-size: 12pt; font-family: 宋体;">为其</span><span style="font-size: 12pt;">提供贸易融资、销售分户账管理、应收账款的催收、信用风险控制与坏账担保等服务</span><span style="font-size: 12pt;">。</span></p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=16', '', 0),
(21, '', 3, '0,3', '人才招聘', 'renshizhaopin', 'about/', 0, '21', '', '人才招聘', '', '', '<p>人事招聘</p>', '', 'about.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=21', '', 0),
(17, '', 8, '0,1,8', '整合供应链', 'zhenghegongyinglian', 'service/gongyinglianguanli/', 0, '17', '', '整合供应链', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;">根据客户需求，进行集中化采购，来降低客户采购成本</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: Calibri; font-size: 16px;">1、集中的数量优势</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: Calibri; font-size: 16px;">2、避免复制</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: Calibri; font-size: 16px;">3、集中采购形成规模运输从而降低运输成本</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: Calibri; font-size: 16px;">4、减少企业内部的各部门及单位的竞争和冲突</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: Calibri; font-size: 16px;">5、形成供应基地</span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: Calibri; font-size: 16px;">6、降低采购成本</span></p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=17', '', 0),
(18, '', 8, '0,1,8', '资金配套', 'zijinpeitao', 'service/gongyinglianguanli/', 0, '18', '', '资金配套', '', '', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 16px;"><span style="font-family: Calibri;">联标发展</span><span style="font-family: 宋体;">是福建省国资委旗下全资企业，拥有雄厚的资金实力，同时与多家省行级国有股份、商业银行建立深度战略合作关系，可以为广大合作伙伴提供中短期融资，帮助资金周转困难的合作伙伴解决融资难题，垫付资金，短期融资，加快资金周转回笼，提升企业竞争力；</span></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 16px;"><span style="font-family: Calibri;">1</span><span style="font-family: 宋体;">、丰富多样，量身定制的融资解决方案</span></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 16px;"><span style="font-family: Calibri;">2</span><span style="font-family: 宋体;">、以自有资金快速帮助广大合作伙伴进行垫付货款</span></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-size: 16px;"><span style="font-family: Calibri;">3</span><span style="font-family: 宋体;">、垫资提货、代收</span><span style="font-family: Calibri;">LC</span><span style="font-family: 宋体;">、应收款融资、抵押、担保融资、预付货款等</span></span></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><br/></p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=18', '', 0),
(19, '', 8, '0,1,8', '集成方案', 'jichengfangan', 'service/gongyinglianguanli/', 0, '19', '', '集成方案', '', '', '<p><span style="font-size: 16px;"><span style="font-size: 16px;">　　</span>通过借用外部资源进行整合运作，充分参与到客户的订单执行中，通过从料件采购，加工生产，到国内外分销的高度整合服务，帮助客户打造贯穿客户产业的从方案商到原材料供应商、从制造商到渠道商的完整的钻石级供应链体系。</span></p><p><br/></p><p><span style="font-size: 16px;">　　服务模式：</span></p><p><span style="font-size: 16px;">根据客户的要求和概念制造样品。在样品确认后，联标制定完整的生产计划和采购进度，并寻找适合的代工厂，同时对生产进行规划和控制，生产完成后及时向客户提交产品。</span></p><p><br/></p><p><span style="font-size: 16px;">　　服务优势：</span></p><p><span style="font-size: 16px;">　　节约生产基建投资、设备购置费用以及工人人工费用；</span></p><p><span style="font-size: 16px;">　　借用专业工厂制造优势；</span></p><p><span style="font-size: 16px;">　　集中资源投入到高附加值的产品设计和市场营销；</span></p><p><span style="font-size: 16px;">　　整合企业生产资源，以最小投入产生最大产出；</span></p><p><span style="font-size: 16px;">　　提升企业核心竞争力。</span></p><p><br/></p><p><span style="font-size: 16px;">流程：</span></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496676219288313.png" title="1496676219288313.png" alt="blob.png"/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://demo.hf872.com/index.php?c=page&id=19', '', 0),
(20, '', 3, '0,3', '公司简介', 'gongsijianjie', 'about/', 0, '20', '', '公司简介', '', '', '<p style="text-indent:31px"><strong><span style="font-size:16px;font-family:宋体">一、公司基本情况介绍</span></strong></p><p style="text-indent:32px"><span style="font-size:16px;font-family:仿宋">&nbsp;福建省联标国际发展有限公司（以下简称“联标发展”）是福建省电子信息集团、福建省和信科工集团所属的全资公司，是为响应福建省政府关于利用“两个市场、两种资源”设立的对外窗口。公司于2014年9月11日成立，注册地福州市马尾区，投资总额1亿元，注册资金5000万元，主营业务：创新型外贸综合服务。</span></p><p style="line-height:41px"><span style="font-size:16px;font-family:仿宋">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size:16px;font-family:仿宋">联标发展自成立以来，致力于拓展供应链服务这一国际成熟、国内新兴的业态，</span><span style="font-size:16px;font-family:仿宋">打造福建省专业化外贸综合服务的供应链管理平台。</span><span style="font-size:16px;font-family:仿宋">经过一年多的努力，供应链管理各业务模块、跨境电商中心、深圳业务中心等已初具雏形。同时，通过</span><span style="font-size:16px;font-family:仿宋;background:white">多种海外融资渠道，打通了低息境外资金向境内流动的通道。</span></p><p style="text-indent:31px;line-height:41px"><span style="font-size:16px;font-family:仿宋">2016</span><span style="font-size:16px;font-family:仿宋">年</span><span style="font-size:16px;font-family:仿宋">供应链合作服务</span><span style="font-size: 16px;font-family:仿宋">的企业已达100多家，通过借鉴国内、国际大型供应链管理上市公司的运作经验，在严格风险管控的前提下，业务模式日趋成熟。通过整合供应链的各环节，提供除研发、销售之外囊括物流、采购、分销、结算服务于一体的一站式供应链管理/金融服务，形成了独具特色的竞争优势。</span></p><p style="text-indent:40px;line-height:41px"><strong><span style="font-size:16px;font-family:宋体">二、竞争优势</span></strong></p><p style="text-indent:32px;line-height:41px"><strong><span style="font-size:16px;font-family: 宋体">（一）政策优势</span></strong></p><p style="text-indent:32px;line-height:41px"><span style="font-size:16px;font-family:仿宋">当下“供给侧改革”方兴未艾，供应链管理业务已成为深圳三大经济支柱产业之一，深圳集中了全国80%以上供应链管理公司的总部，且相关产业链已向全国辐射。联标发展在业务模式创新方面，进行了大胆、有益的探索，并设立深圳业务中心。目前，供应链管理/金融将迎来新一轮的行业发展机遇，依托国资背景、独特的区域优势和金融开放政策，跨境资金池和外债自律管理等一系列政策优势，公司在拓展供应链管理/金融新业态方面已初步俱备“天时、地利、人和”的发展条件。</span></p><p style="text-indent:40px;line-height:41px"><strong><span style="font-size:16px;font-family: 宋体">（二）平台优势</span></strong></p><p style="text-indent:40px;line-height:41px"><span style="font-size:16px;font-family:仿宋">联标发展作为福建省和信科工集团的外贸综合服务的专业化运作平台，</span><span style="font-family: 仿宋; font-size: 16px; text-indent: 32px;">在开展供应链服务的过程中，公司掌控了合作企业的商流、物流、资金流、信息流等关键信息，并可视于ERP系统中，形成“四流合一”丰富的行业大数据；另外，在长期的供应链深度合作关系中，公司在行业内发现了业务价值、管理团队、行业发展方向等方面具有先入为主的优势，为股权控制、资本运作等打下基础。</span></p><p style="text-indent:32px;line-height:41px"><strong><span style="font-size:16px;font-family: 宋体">（三）人才优势</span></strong></p><p style="text-indent:32px;line-height:41px"><span style="font-size:16px;font-family:仿宋">1</span><span style="font-size:16px;font-family:仿宋">、核心团队：供应链业务的核心团队成员均有过国内外大型供应链公司的管理经验，经历了供应链公司从初创到上市公司的全过程，拥有10多年未出险的优秀运营记录。</span></p><p style="text-indent:32px;line-height:41px"><span style="font-size:16px;font-family:仿宋">2</span><span style="font-size:16px;font-family:仿宋">、合作伙伴：联标发展主要合作企业包括中兴、神舟电脑、百度中国、联想供应商等知名企业，均为平板电脑、手机、显示器行业的资深设计商、供应商和制造商，具有多年OEM/ODM设计、接单、生产等方面的丰富经验。</span></p><p style="text-indent:31px;line-height:41px"><strong><span style="font-size:16px;font-family: 宋体">（四）业务价值与盈利模式</span></strong></p><p style="text-indent:40px;line-height:41px"><span style="font-size:16px;font-family:仿宋">公司通过提供量身打造的个性化服务，为需要资金融通的中小企业提供短期的供应链金融服务，并因出口业务量带来各种附加的财务收益，如出口增量补贴、中信保融资贴息、结汇点差优惠等，服务层次越多，涉及供应链链条越长，获得的收益越高。</span></p><p style="text-indent:39px;line-height:41px"><strong><span style="font-size: 16px;font-family:宋体">三、取得的资质情况</span></strong></p><p style="text-indent:24px"><span style="font-size:16px;font-family:仿宋">&nbsp;</span><span style="font-size:16px;font-family:仿宋">（一）福州市唯一推荐申报福建省外贸综合服务（试点）企业。</span></p><p style="text-indent:40px;line-height:41px"><span style="font-size:16px;font-family:仿宋">(</span><span style="font-size:16px;font-family:仿宋">二)海关认证：已成功通过AEO认证，海关AEO认证对接国际标准，欧盟28国、新加坡、韩国等国家和地区均予以互认。AEO认证通过后，大大提高了进出口通关效率，有利于提高供应链业务的规模和水平 ，提升公司良好形象。</span></p><p style="text-indent:32px;line-height:41px"><span style="font-size:16px;font-family:仿宋">(</span><span style="font-size:16px;font-family:仿宋">三)银行资信：已完成建设银行资信评定，从9级提升到8级，目前已与多家银行建立授信评级关系，为后续业务开展创造有利条件。</span></p><p style="text-indent:32px;line-height:41px"><span style="font-size:16px;font-family:仿宋">(</span><span style="font-size:16px;font-family:仿宋">四)国税评级：已通过福州自贸区国税局综合评定，联标发展已被评为A级信用管理企业、出口退税分类管理一类企业，为出口退税创造更便利的条件。</span></p>', '', 'about.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=20', '', 0),
(22, '', 0, '0', '申请注册', 'zhuce', '', 0, '22', '', '申请注册', '', '申请注册', '<p>注册</p>', '', 'regpage.html', 0, '', 1, 1, 'http://demo.hf872.com/index.php?c=page&id=22', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_poster`
--

CREATE TABLE IF NOT EXISTS `rs_1_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '位置id',
  `name` varchar(50) NOT NULL COMMENT '广告名称',
  `value` text NOT NULL COMMENT '广告值',
  `uid` int(10) unsigned NOT NULL COMMENT '发布人uid',
  `username` varchar(50) NOT NULL COMMENT '发布人',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '竞价金额',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`sid`,`status`,`displayorder`),
  KEY `uid` (`uid`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `rs_1_poster`
--

INSERT INTO `rs_1_poster` (`id`, `sid`, `name`, `value`, `uid`, `username`, `price`, `starttime`, `endtime`, `inputtime`, `clicks`, `displayorder`, `status`) VALUES
(7, 1, 'banner1', 'a:5:{s:3:\\"url\\";s:22:\\"http://demo.hf872.com/\\";s:4:\\"file\\";s:4:\\"1104\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496811066, 0, 1496811081, 1, 0, 1),
(2, 1, 'banner2', 'a:5:{s:3:\\"url\\";s:21:\\"http://demo.hf872.com\\";s:4:\\"file\\";s:4:\\"1105\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496246400, 0, 1496583561, 2, 0, 1),
(3, 2, 'banner1', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1079\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496591238, 0, 1496591331, 0, 0, 1),
(5, 3, 'Banner', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1097\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496719091, 0, 1496719102, 0, 0, 1),
(8, 5, 'Banner', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1130\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1498031158, 0, 1498031222, 0, 0, 1),
(9, 6, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1129\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498306776, 0, 0, 1),
(10, 7, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1122\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498306799, 0, 0, 1),
(11, 8, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1123\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498306833, 0, 0, 1),
(12, 9, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1124\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498306897, 0, 0, 1),
(13, 10, 'Slide', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1125\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498306921, 0, 0, 1),
(14, 11, 'Slide', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1126\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498306947, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_poster_space`
--

CREATE TABLE IF NOT EXISTS `rs_1_poster_space` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '广告位名称',
  `type` tinyint(2) NOT NULL COMMENT '广告位类型',
  `value` text NOT NULL COMMENT '参数配置',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '竞价金额',
  `items` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告数量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `rs_1_poster_space`
--

INSERT INTO `rs_1_poster_space` (`id`, `name`, `type`, `value`, `price`, `items`, `status`) VALUES
(1, '首页轮播图', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 2, 1),
(2, '关于我们Banner', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(3, '服务方案Banner', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(5, '商城Banner', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(6, '商城1F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(7, '商城2F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(8, '商城3F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(9, '商城4F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(10, '商城3F幻灯片', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(11, '商城4F幻灯片', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_qiuzhi_form_wyqz`
--

CREATE TABLE IF NOT EXISTS `rs_1_qiuzhi_form_wyqz` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '内容主题',
  `url` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `subject` varchar(255) DEFAULT NULL COMMENT '表单主题',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `name` char(20) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `xueli` varchar(255) DEFAULT NULL,
  `gznx` varchar(255) DEFAULT NULL,
  `xjzd` mediumint(8) unsigned DEFAULT NULL,
  `qwxz` varchar(255) DEFAULT NULL,
  `zwpj` text,
  `gzjy` text,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='我要求职表单数据表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_qiuzhi_form_wyqz_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_qiuzhi_form_wyqz_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我要求职表单附表';

--
-- 转存表中的数据 `rs_1_qiuzhi_form_wyqz_data_0`
--

INSERT INTO `rs_1_qiuzhi_form_wyqz_data_0` (`id`, `cid`, `uid`) VALUES
(1, 1, 1),
(2, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_qiuzhi_phone_buy`
--

CREATE TABLE IF NOT EXISTS `rs_1_qiuzhi_phone_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `score` int(10) DEFAULT NULL COMMENT '积分',
  `inputtime` int(10) unsigned NOT NULL COMMENT '查看时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `rs_1_qiuzhi_phone_buy`
--

INSERT INTO `rs_1_qiuzhi_phone_buy` (`id`, `sid`, `uid`, `score`, `inputtime`) VALUES
(2, 7, 1, -10, 1470734626),
(3, 8, 1, -10, 1470737822),
(4, 5, 1, -10, 1470737882),
(5, 3, 1, -10, 1470737920),
(6, 4, 1, -10, 1470791000),
(7, 11, 1, -2, 1472698784),
(8, 11, 19, -2, 1473040239),
(9, 12, 19, -2, 1473040443),
(10, 4, 17, -2, 1473041669),
(11, 13, 21, -2, 1473054893),
(12, 13, 21, -2, 1473054907),
(13, 19, 23, -2, 1473215384),
(14, 19, 1, -2, 1473228513),
(15, 20, 1, -2, 1473244038),
(16, 19, 19, -2, 1473315262),
(17, 20, 23, -2, 1473402712),
(18, 23, 37, -2, 1474611070),
(19, 25, 38, -2, 1474611610),
(20, 25, 37, -2, 1474611618),
(21, 28, 1, -2, 1474941467),
(22, 34, 1, -2, 1475194461),
(23, 22, 1, -2, 1477355521),
(24, 22, 23, -5, 1477539917),
(25, 39, 1, -20, 1477540105);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_remote`
--

CREATE TABLE IF NOT EXISTS `rs_1_remote` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '远程附件类型',
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `exts` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='远程附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share`
--

CREATE TABLE IF NOT EXISTS `rs_1_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块主表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share_category`
--

CREATE TABLE IF NOT EXISTS `rs_1_share_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `domain` varchar(50) NOT NULL COMMENT '绑定域名',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `benner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share_extend`
--

CREATE TABLE IF NOT EXISTS `rs_1_share_extend` (
  `id` int(10) unsigned NOT NULL,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share_extend_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_share_extend_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(22) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展索引表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_share_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块内容索引表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share_search`
--

CREATE TABLE IF NOT EXISTS `rs_1_share_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_share_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_share_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `order_price` decimal(10,2) DEFAULT NULL,
  `order_volume` int(10) DEFAULT '0',
  `order_quantity` varchar(255) DEFAULT NULL,
  `favorites` int(10) DEFAULT '0',
  `avgsort` decimal(4,2) DEFAULT '0.00',
  `fj_area` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=207 ;

--
-- 转存表中的数据 `rs_1_shop`
--

INSERT INTO `rs_1_shop` (`id`, `catid`, `title`, `thumb`, `keywords`, `description`, `hits`, `uid`, `author`, `status`, `url`, `link_id`, `tableid`, `inputip`, `inputtime`, `updatetime`, `comments`, `displayorder`, `order_price`, `order_volume`, `order_quantity`, `favorites`, `avgsort`, `fj_area`) VALUES
(51, 7, '供需链管理系统', '1111', '12,供应链,供应链管理,管理系统', '供需链管理系统', 139, 1, 'admin', 9, 'http://demo.hf872.com/shop-show-51.html', 0, 0, '::1', 1493191766, 1498137699, 0, 0, 12.00, 12, '12', 1, 0.00, 2),
(52, 7, '供应链金融系统', '1114', '', '供应链金融系统', 2, 1, 'admin', 9, 'http://demo.hf872.com/shop-show-52.html', 0, 0, '192.168.1.80', 1498138419, 1498465657, 0, 0, 0.00, 0, '', 0, 0.00, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_buy`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用金币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_category`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `rs_1_shop_category`
--

INSERT INTO `rs_1_shop_category` (`id`, `pid`, `pids`, `name`, `letter`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `show`, `permission`, `setting`, `displayorder`) VALUES
(7, 1, '0,1', '进口许可证', 'j', 'jckxkz', 'gszc/', 0, '7', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"16\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(1, 0, '0', '进出口通关物流', 'g', 'gszc', '', 1, '1,7,8', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 1),
(4, 0, '0', '虚拟生产', 'c', 'xnsc', '', 1, '4,17,18,19', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 4),
(3, 0, '0', '供应链金融', 'g', 'gyljr', '', 1, '3,12,13', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 3),
(2, 0, '0', '产业布局', 'c', 'cybj', '', 1, '2,22,23,24,25', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 2),
(22, 2, '0,2', '双鸿电子', 's', 'shdz', 'cybj/', 0, '22', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(5, 0, '0', '其他类', 'q', 'qtl', '', 0, '5', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:5:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";s:6:\\"search\\";s:11:\\"search.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 5),
(8, 1, '0,1', '海关审价', 'h', 'hgsb', 'gszc/', 0, '8', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(19, 4, '0,4', '平板', 'p', 'pb', 'xnsc/', 0, '19', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(12, 3, '0,3', '保险与保理', 'b', 'bxylp', 'gyljr/', 0, '12', NULL, 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(13, 3, '0,3', '进出口押汇 ', 'y', 'yh', 'gyljr/', 0, '13', NULL, 0, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(25, 2, '0,2', '福强电子', 'f', 'fuqiangdianzi', 'cybj/', 0, '25', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(24, 2, '0,2', '海创科技', 'h', 'haichuangkeji', 'cybj/', 0, '24', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(23, 2, '0,2', '瑞达精工', 'r', 'ruidajinggong', 'cybj/', 0, '23', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(17, 4, '0,4', '手机', 's', 'sj', 'xnsc/', 0, '17', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(18, 4, '0,4', '笔记本', 'b', 'bjb', 'xnsc/', 0, '18', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_category_data`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_category_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_comment_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `rs_1_shop_comment_index`
--

INSERT INTO `rs_1_shop_comment_index` (`id`, `cid`, `support`, `oppose`, `comments`, `avgsort`, `sort1`, `sort2`, `sort3`, `sort4`, `sort5`, `sort6`, `sort7`, `sort8`, `sort9`, `tableid`) VALUES
(19, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0),
(51, 51, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0),
(52, 52, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_comment_my`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `duotu` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `rs_1_shop_data_0`
--

INSERT INTO `rs_1_shop_data_0` (`id`, `uid`, `catid`, `content`, `duotu`) VALUES
(51, 1, 7, '<p>供需链管理系统</p>', 'a:1:{i:0;s:4:\\"1112\\";}'),
(52, 1, 7, '<p>供应链金融系统</p>', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_draft`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `rs_1_shop_draft`
--

INSERT INTO `rs_1_shop_draft` (`id`, `cid`, `eid`, `uid`, `catid`, `content`, `inputtime`) VALUES
(6, 52, 0, 1, 7, 'a:18:{s:5:\\"duotu\\";s:0:\\"\\";s:7:\\"content\\";s:28:\\"<p>供应链金融系统</p>\\";s:2:\\"id\\";i:52;s:5:\\"title\\";s:21:\\"供应链金融系统\\";s:8:\\"keywords\\";s:0:\\"\\";s:11:\\"order_price\\";d:0;s:12:\\"order_volume\\";i:0;s:14:\\"order_quantity\\";s:0:\\"\\";s:5:\\"thumb\\";s:4:\\"1114\\";s:7:\\"fj_area\\";s:1:\\"1\\";s:4:\\"hits\\";s:1:\\"1\\";s:6:\\"author\\";s:5:\\"admin\\";s:9:\\"inputtime\\";s:10:\\"1498138419\\";s:10:\\"updatetime\\";s:10:\\"1498465605\\";s:7:\\"inputip\\";s:12:\\"192.168.1.80\\";s:6:\\"status\\";s:1:\\"9\\";s:3:\\"uid\\";i:1;s:5:\\"catid\\";i:7;}', 1498465652);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_favorite`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `rs_1_shop_favorite`
--

INSERT INTO `rs_1_shop_favorite` (`id`, `cid`, `eid`, `uid`, `url`, `title`, `inputtime`) VALUES
(2, 51, 0, 66, 'http://005.dingzhi.cc/shop-show-51.html', '供需链管理系统', 1498031080);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_flag`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_hits`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `rs_1_shop_hits`
--

INSERT INTO `rs_1_shop_hits` (`id`, `hits`, `day_hits`, `week_hits`, `month_hits`, `year_hits`) VALUES
(8, 1, 1, 1, 1, 1),
(1, 1, 1, 1, 1, 1),
(14, 1, 1, 1, 1, 1),
(16, 1, 1, 1, 1, 1),
(12, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1),
(4, 1, 1, 1, 1, 1),
(10, 1, 1, 1, 1, 1),
(9, 1, 1, 1, 1, 1),
(15, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(11, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 1),
(13, 1, 1, 1, 1, 1),
(19, 1, 1, 1, 1, 1),
(51, 139, 1, 1, 1, 115),
(52, 2, 2, 3, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_html`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `rs_1_shop_index`
--

INSERT INTO `rs_1_shop_index` (`id`, `uid`, `catid`, `status`, `inputtime`) VALUES
(51, 1, 7, 9, 1493191766),
(52, 1, 7, 9, 1498138419);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_search`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_tag`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=70 ;

--
-- 转存表中的数据 `rs_1_shop_tag`
--

INSERT INTO `rs_1_shop_tag` (`id`, `name`, `code`, `hits`) VALUES
(1, '培训课程', 'peixunkecheng', 0),
(2, '商标注册', 'shangbiaozhuce', 0),
(3, '许可证', 'xukezheng', 14),
(4, '111', '111', 0),
(5, '财务代理', 'caiwudaili', 0),
(6, '公司注册', 'gongsizhuce', 0),
(7, '工商注册', 'gongshangzhuce', 0),
(8, '营业执照', 'yingyezhizhao', 0),
(9, '公司变更', 'gongsibiangeng', 0),
(10, '增资', 'zengzi', 0),
(11, '法人变更', 'farenbiangeng', 2),
(12, '股东变更', 'gudongbiangeng', 10),
(13, '食品', 'shipin', 14),
(14, '会计', 'huiji', 6),
(15, '福州', 'fuzhou', 24),
(16, '审计报告', 'shenjibaogao', 0),
(17, '工商代理', 'gongshangdaili', 0),
(18, '企业管理', 'qiyeguanli', 0),
(19, '进销存', 'jinxiaocun', 0),
(20, '广告', 'guanggao', 4),
(21, '喷绘', 'penhui', 12),
(22, '公司注销', 'gongsizhuxiao', 0),
(23, '个体户', 'getihu', 0),
(24, '企业注册', 'qiyezhuce', 0),
(25, '申请商标', 'shenqingshangbiao', 0),
(26, '广告设计', 'guanggaosheji', 0),
(27, '印刷', 'yinshua', 0),
(28, '福州公司', 'fuzhougongsi', 0),
(29, '马尾区', 'maweiqu', 0),
(30, '个体户登记', 'getihudengji', 0),
(31, '财务', 'caiwu', 0),
(32, '代理记账', 'dailijizhang', 0),
(33, '兼职会计', 'jianzhihuiji', 0),
(34, '淘会计', 'taohuiji', 0),
(35, '顾问', 'guwen', 0),
(36, '验资', 'yanzi', 0),
(37, '开发', 'kaifa', 0),
(38, '福州企业', 'fuzhouqiye', 0),
(39, '代理开发', 'dailikaifa', 0),
(40, '股东', 'gudong', 0),
(41, '软件', 'ruanjian', 0),
(42, '管理软件', 'guanliruanjian', 0),
(43, '培训班', 'peixunban', 0),
(44, '管理培训班', 'guanlipeixunban', 0),
(45, '管理咨询', 'guanlizixun', 0),
(46, '网站', 'wangzhan', 0),
(47, '网站建设', 'wangzhanjianshe', 0),
(48, '网站开发', 'wangzhankaifa', 0),
(49, '餐饮', 'canyin', 0),
(50, '经营', 'jingying', 0),
(51, '认证', 'renzheng', 0),
(52, '故宫', 'gugong', 0),
(53, '企业经营', 'qiyejingying', 0),
(54, '经营范围', 'jingyingfanwei', 0),
(55, '劳务派遣', 'laowupaiqian', 0),
(56, '环境保护', 'huanjingbaohu', 0),
(57, '质量体系', 'zhiliangtixi', 0),
(58, '名片设计', 'mingpiansheji', 0),
(59, '名片印刷', 'mingpianyinshua', 0),
(60, '企业标志', 'qiyebiaozhi', 0),
(61, 'logo设计', 'logosheji', 0),
(62, 'PS图片处理', 'pstupianchuli', 0),
(63, '平面设计', 'pingmiansheji', 0),
(64, '广告制作', 'guanggaozhizuo', 0),
(65, '画册设计', 'huacesheji', 0),
(66, '包装', 'baozhuang', 0),
(67, '供应链', 'gongyinglian', 0),
(68, '供应链管理', 'gongyinglianguanli', 0),
(69, '管理系统', 'guanlixitong', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_1_shop_verify`
--

CREATE TABLE IF NOT EXISTS `rs_1_shop_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text,
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=207 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_buy`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用金币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_category`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_category_data`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_category_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_draft`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_favorite`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_flag`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_hits`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_html`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_search`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_tag`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_answer_verify`
--

CREATE TABLE IF NOT EXISTS `rs_2_answer_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_block`
--

CREATE TABLE IF NOT EXISTS `rs_2_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '资料块名称',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='资料块表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `rs_2_block`
--

INSERT INTO `rs_2_block` (`id`, `name`, `content`) VALUES
(1, '公司名称', 'A&T INTERNATIONAL Development Co.,Ltd.'),
(2, '公司电话', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_form`
--

CREATE TABLE IF NOT EXISTS `rs_2_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='表单模型表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `rs_2_form`
--

INSERT INTO `rs_2_form` (`id`, `name`, `table`, `setting`) VALUES
(5, '申请注册', 'zhuce', 'a:5:{s:4:\\"icon\\";s:0:\\"\\";s:4:\\"post\\";s:1:\\"1\\";s:4:\\"send\\";s:0:\\"\\";s:8:\\"template\\";s:0:\\"\\";s:6:\\"rt_url\\";s:0:\\"\\";}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_form_account`
--

CREATE TABLE IF NOT EXISTS `rs_2_form_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `nature` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='开账申请表单表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `rs_2_form_account`
--

INSERT INTO `rs_2_form_account` (`id`, `title`, `uid`, `author`, `inputip`, `inputtime`, `displayorder`, `tableid`, `nature`, `mobile`) VALUES
(5, '福建德永信息咨询有限公司', 16, '薛', '120.35.4.185', 1476324992, 0, 0, '财务', '13805088819'),
(6, '厦门正航软件科技有限公司', 0, 'guest', '220.160.107.34', 1477384539, 0, 0, '软件', '13850006596');

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_form_account_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_form_account_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='开账申请表单附表';

--
-- 转存表中的数据 `rs_2_form_account_data_0`
--

INSERT INTO `rs_2_form_account_data_0` (`id`, `uid`) VALUES
(5, 16),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_form_zhuce`
--

CREATE TABLE IF NOT EXISTS `rs_2_form_zhuce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='申请注册表单表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `rs_2_form_zhuce`
--

INSERT INTO `rs_2_form_zhuce` (`id`, `title`, `uid`, `author`, `inputip`, `inputtime`, `displayorder`, `tableid`) VALUES
(1, 'www', 1, 'admin', '112.5.237.9', 1497063989, 0, 0),
(2, '速度快多了几分束带结发', 1, 'admin', '61.154.16.244', 1497150669, 0, 0),
(3, 'test', 0, 'guest', '58.217.245.118', 1498461105, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_form_zhuce_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_form_zhuce_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `address` varchar(255) DEFAULT NULL,
  `business` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `areacode` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `cooperation` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='申请注册表单附表';

--
-- 转存表中的数据 `rs_2_form_zhuce_data_0`
--

INSERT INTO `rs_2_form_zhuce_data_0` (`id`, `uid`, `address`, `business`, `contact`, `phone`, `areacode`, `phonenumber`, `channel`, `cooperation`) VALUES
(1, 1, 'www', '', 'www', '1111111111', '', '', '熟人介绍', NULL),
(2, 1, '东方丽景水电费', '', '水电费第三方', '21313546541', '021', '54456454', '熟人介绍', NULL),
(3, 0, '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_navigator`
--

CREATE TABLE IF NOT EXISTS `rs_2_navigator` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `pids` text COMMENT '所有上级id数据项',
  `type` tinyint(1) unsigned NOT NULL COMMENT '导航类型',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `url` varchar(255) NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) NOT NULL COMMENT '图片标示',
  `show` tinyint(1) unsigned NOT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有下级',
  `childids` text COMMENT '所有下级数据项',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否站外链接',
  `displayorder` tinyint(3) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `list` (`id`,`type`,`show`,`displayorder`),
  KEY `mark` (`mark`),
  KEY `extend` (`extend`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站导航表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `rs_2_navigator`
--

INSERT INTO `rs_2_navigator` (`id`, `pid`, `pids`, `type`, `name`, `title`, `url`, `thumb`, `show`, `mark`, `extend`, `child`, `childids`, `target`, `displayorder`) VALUES
(1, 0, '0', 0, 'Services', 'Service Solution', 'publish.html', '', 1, 'page-1', 1, 1, '1,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22', 0, 0),
(2, 0, '0', 0, 'Register', 'Register', '/index.php?c=page&amp;id=22', '', 1, '', 0, 0, '2', 0, 0),
(3, 0, '0', 0, 'Platform', 'Operating Platform', 'index.php?s=member&amp;c=login&amp;m=index', '', 1, '', 1, 1, '3,34,35', 1, 0),
(4, 0, '0', 0, 'Partner', 'Business Partner', 'http://en.hf872.com/index.php?c=page&id=2', '', 1, 'page-2', 0, 0, '4', 0, 0),
(5, 0, '0', 0, 'A&amp;T Mall', 'A&amp;T mall', '/shop.html', '', 0, '', 0, 0, '5', 0, 0),
(6, 0, '0', 0, 'About', '', 'http://en.hf872.com/index.php?c=page&id=3', '', 1, 'page-3', 1, 1, '6,23,26,33,24,27', 0, 0),
(7, 1, '0,1', 0, 'Import&Export Service', 'Import&Export Service', 'http://en.hf872.com/index.php?c=page&id=4', '1089', 1, 'page-4', 1, 1, '7,8,9,10,11,12,13,14', 0, 0),
(8, 7, '0,1,7', 0, 'Customs declaration', 'Customs declaration', 'http://en.hf872.com/index.php?c=page&id=10', '', 1, 'page-10', 1, 0, '8', 0, 0),
(9, 7, '0,1,7', 0, 'Logistics', 'Logistics', 'http://en.hf872.com/index.php?c=page&id=11', '', 1, 'page-11', 1, 0, '9', 0, 0),
(10, 7, '0,1,7', 0, 'Drawback', 'Drawback', 'http://en.hf872.com/index.php?c=page&id=12', '', 1, 'page-12', 1, 0, '10', 0, 0),
(11, 7, '0,1,7', 0, 'Settlement', 'Settlement', 'http://en.hf872.com/index.php?c=page&id=13', '', 1, 'page-13', 1, 0, '11', 0, 0),
(12, 7, '0,1,7', 0, 'Financing', 'Financing', 'http://en.hf872.com/index.php?c=page&id=14', '', 1, 'page-14', 1, 0, '12', 0, 0),
(13, 7, '0,1,7', 0, 'Credit insurance', 'Credit insurance', 'http://en.hf872.com/index.php?c=page&id=15', '', 1, 'page-15', 1, 0, '13', 0, 0),
(14, 7, '0,1,7', 0, 'Factoring', 'Factoring', 'http://en.hf872.com/index.php?c=page&id=16', '', 1, 'page-16', 1, 0, '14', 0, 0),
(15, 1, '0,1', 0, 'Distribution Executive', 'Distribution Executive', 'http://en.hf872.com/index.php?c=page&id=5', '1106', 1, 'page-5', 1, 0, '15', 0, 0),
(16, 1, '0,1', 0, 'Purchasing execution', 'Purchasing execution', 'http://en.hf872.com/index.php?c=page&id=6', '1107', 1, 'page-6', 1, 0, '16', 0, 0),
(17, 1, '0,1', 0, 'Overseas warehousing', 'Overseas warehousing', 'http://en.hf872.com/index.php?c=page&id=7', '1108', 1, 'page-7', 1, 0, '17', 0, 0),
(18, 1, '0,1', 0, 'Supply chain management', 'Supply chain management', 'http://en.hf872.com/index.php?c=page&id=8', '1109', 1, 'page-8', 1, 1, '18,19,20,21', 0, 0),
(19, 18, '0,1,18', 0, 'Integrated supply chain', 'Integrated supply chain', 'http://en.hf872.com/index.php?c=page&id=17', '', 1, 'page-17', 1, 0, '19', 0, 0),
(20, 18, '0,1,18', 0, 'Fund matching', 'Fund matching', 'http://en.hf872.com/index.php?c=page&id=18', '', 1, 'page-18', 1, 0, '20', 0, 0),
(21, 18, '0,1,18', 0, 'Integration scheme', 'Integration scheme', 'http://en.hf872.com/index.php?c=page&id=19', '', 1, 'page-19', 1, 0, '21', 0, 0),
(22, 1, '0,1', 0, 'Cross-border electricity supplier', 'Cross-border electricity supplier', 'http://en.hf872.com/index.php?c=page&id=9', '1110', 1, 'page-9', 1, 0, '22', 0, 0),
(23, 6, '0,6', 0, 'Company profile', 'Company profile', 'http://en.hf872.com/index.php?c=page&id=20', '', 1, 'page-20', 1, 0, '23', 0, 1),
(24, 6, '0,6', 0, 'Talent recruitment', 'Talent recruitment', 'http://en.hf872.com/index.php?c=page&id=21', '', 1, 'page-21', 1, 0, '24', 0, 4),
(26, 6, '0,6', 0, 'Cooperative partner', '', 'http://en.hf872.com/index.php?s=news&c=category&id=2', '', 1, 'module-news-2', 0, 0, '26', 0, 2),
(27, 6, '0,6', 0, 'A&T School', 'A&T School', 'http://en.hf872.com/index.php?s=news&c=category&id=3', '', 1, 'module-news-3', 0, 0, '27', 0, 5),
(28, 0, '0', 4, 'A&T Development', 'A&T Development', 'http://www.baidu.com', '', 1, '', 0, 0, '28', 0, 0),
(33, 6, '0,6', 0, 'News', 'News', 'http://en.hf872.com/index.php?s=news&c=category&id=1', '', 1, 'module-news-1', 0, 0, '33', 0, 3),
(34, 3, '0,3', 0, 'Login T8', '', 'http://t8.atinin.cn:8082/Login.aspx', '', 1, '', 1, 0, '34', 1, 0),
(35, 3, '0,3', 0, 'order tracking', '', 'http://t8.atinin.cn:8099/', '', 1, '', 1, 0, '35', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news`
--

CREATE TABLE IF NOT EXISTS `rs_2_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `avgsort` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_2_news`
--

INSERT INTO `rs_2_news` (`id`, `catid`, `title`, `thumb`, `keywords`, `description`, `hits`, `uid`, `author`, `status`, `url`, `link_id`, `tableid`, `inputip`, `inputtime`, `updatetime`, `comments`, `favorites`, `displayorder`, `avgsort`) VALUES
(1, 1, 'TestTestTestTestTestTestTestTest', '', '', 'TestTestTestTestTestTestTestTest', 13, 1, 'admin', 9, 'http://en.hf872.com/index.php?s=news&c=show&id=1', 0, 0, '192.168.1.80', 1498045808, 1498465317, 0, 0, 0, 0.00);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_buy`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用金币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_category`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `rs_2_news_category`
--

INSERT INTO `rs_2_news_category` (`id`, `pid`, `pids`, `name`, `letter`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `show`, `permission`, `setting`, `displayorder`) VALUES
(1, 0, '0', 'News', 'n', 'news', '', 0, '1', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(2, 0, '0', 'Cooperative Partner', 'p', 'partner', '', 0, '2', NULL, 1, NULL, 'a:3:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}}', 0),
(3, 0, '0', 'A&T School', 's', 'school', '', 0, '3', NULL, 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_category_data`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_category_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `related` text,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `rs_2_news_data_0`
--

INSERT INTO `rs_2_news_data_0` (`id`, `uid`, `catid`, `content`, `related`) VALUES
(1, 1, 1, '<p>TestTestTestTestTestTestTestTest</p>', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_draft`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_2_news_draft`
--

INSERT INTO `rs_2_news_draft` (`id`, `cid`, `eid`, `uid`, `catid`, `content`, `inputtime`) VALUES
(1, 1, 0, 1, 1, 'a:15:{s:7:\\"content\\";s:39:\\"<p>TestTestTestTestTestTestTestTest</p>\\";s:7:\\"related\\";s:0:\\"\\";s:2:\\"id\\";i:1;s:5:\\"title\\";s:32:\\"TestTestTestTestTestTestTestTest\\";s:5:\\"thumb\\";s:0:\\"\\";s:8:\\"keywords\\";s:0:\\"\\";s:11:\\"description\\";s:32:\\"TestTestTestTestTestTestTestTest\\";s:4:\\"hits\\";s:1:\\"2\\";s:6:\\"author\\";s:5:\\"admin\\";s:9:\\"inputtime\\";s:10:\\"1498045808\\";s:10:\\"updatetime\\";s:10:\\"1498465308\\";s:7:\\"inputip\\";s:12:\\"192.168.1.80\\";s:6:\\"status\\";s:1:\\"9\\";s:3:\\"uid\\";i:1;s:5:\\"catid\\";i:1;}', 1498465314);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_favorite`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_flag`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_hits`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `rs_2_news_hits`
--

INSERT INTO `rs_2_news_hits` (`id`, `hits`, `day_hits`, `week_hits`, `month_hits`, `year_hits`) VALUES
(1, 13, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_html`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_2_news_index`
--

INSERT INTO `rs_2_news_index` (`id`, `uid`, `catid`, `status`, `inputtime`) VALUES
(1, 1, 1, 9, 1498045808);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_search`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_tag`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_news_verify`
--

CREATE TABLE IF NOT EXISTS `rs_2_news_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order`
--

CREATE TABLE IF NOT EXISTS `rs_2_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT 'oid',
  `sn` varchar(50) NOT NULL COMMENT '流水序列号',
  `mid` varchar(50) NOT NULL COMMENT '模块名',
  `buy_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '购买者id',
  `buy_username` varchar(50) DEFAULT NULL COMMENT '购买者name',
  `buy_step` tinyint(1) NOT NULL COMMENT '购买步骤流程',
  `sell_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '出售者id',
  `sell_username` varchar(50) DEFAULT NULL COMMENT '出售者name',
  `order_time` int(11) DEFAULT NULL COMMENT '下单时间',
  `order_status` tinyint(1) unsigned DEFAULT NULL COMMENT '订单状态',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `order_score` tinyint(11) DEFAULT NULL COMMENT '是否金币支付',
  `order_youhui` decimal(10,2) NOT NULL COMMENT '优惠的价格',
  `order_comment` int(10) NOT NULL COMMENT '针对商铺的评论id',
  `pay_type` tinyint(2) DEFAULT NULL COMMENT '付款方式',
  `pay_id` int(10) DEFAULT NULL COMMENT '付款id',
  `pay_status` tinyint(1) unsigned DEFAULT NULL COMMENT '付款状态',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `shipping_time` int(10) DEFAULT NULL COMMENT '发货时间',
  `shipping_stime` int(10) NOT NULL COMMENT '收货时间',
  `shipping_status` tinyint(1) unsigned NOT NULL COMMENT '物流状态',
  `shipping_price` decimal(10,2) NOT NULL COMMENT '运费价格',
  `shipping_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `shipping_phone` varchar(50) NOT NULL COMMENT '收货人手机',
  `tableid` tinyint(3) unsigned DEFAULT '0' COMMENT '附表号',
  PRIMARY KEY (`id`),
  KEY `sn` (`sn`),
  KEY `buy_uid` (`buy_uid`),
  KEY `buy_username` (`buy_username`),
  KEY `sell_uid` (`sell_uid`),
  KEY `sell_username` (`sell_username`),
  KEY `order_time` (`order_time`),
  KEY `order_status` (`order_status`),
  KEY `pay_id` (`pay_id`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_time` (`shipping_time`),
  KEY `shipping_status` (`shipping_status`),
  KEY `order_price` (`order_price`),
  KEY `order_comment` (`order_comment`),
  KEY `shipping_phone` (`shipping_phone`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_buy`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_buy` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mid` varchar(50) NOT NULL COMMENT '模块名称',
  `oid` bigint(15) unsigned NOT NULL COMMENT '订单id',
  `uid` int(10) NOT NULL COMMENT '购买者id',
  `cid` int(10) NOT NULL COMMENT '内容id',
  `catid` int(10) NOT NULL COMMENT '栏目id',
  `comment` int(10) NOT NULL COMMENT '评论id',
  `specification` varchar(50) NOT NULL COMMENT '规格信息',
  `quantity` int(10) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`),
  KEY `cc` (`uid`,`oid`,`comment`,`cid`,`mid`),
  KEY `bb` (`mid`,`cid`,`uid`,`oid`),
  KEY `aa` (`mid`,`oid`,`cid`,`specification`),
  KEY `uid` (`uid`),
  KEY `oid` (`oid`),
  KEY `catid` (`catid`),
  KEY `comment` (`comment`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_0` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_1`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_1` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_2`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_2` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_3`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_3` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_4`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_4` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_5`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_5` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_6`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_6` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_7`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_7` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_cart_8`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_cart_8` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) DEFAULT NULL COMMENT '买家',
  `sell` int(10) DEFAULT NULL COMMENT '卖家',
  `mid` varchar(32) DEFAULT NULL COMMENT '模块',
  `cid` int(10) DEFAULT NULL COMMENT '内容id',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `agent` varchar(50) DEFAULT NULL COMMENT '客户端信息',
  `inputtime` int(10) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sell` (`sell`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  KEY `agent` (`agent`),
  KEY `quantity` (`quantity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_data_0` (
  `id` bigint(18) NOT NULL COMMENT 'oid',
  `buy_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '购买者id',
  `buy_note` text COMMENT '购买者备注或留言',
  `sell_note` text COMMENT '商家备注',
  `sell_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '出售者id',
  `shipping_type` varchar(50) DEFAULT NULL COMMENT '物流方式',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '物流/快递单号',
  `shipping_city` varchar(100) DEFAULT NULL COMMENT '物流城市',
  `shipping_zipcode` varchar(32) DEFAULT NULL COMMENT '物流邮编',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '物流收货地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `buy_uid` (`buy_uid`),
  KEY `sell_uid` (`sell_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_data_9`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_data_9` (
  `id` bigint(18) NOT NULL COMMENT 'oid',
  `buy_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '购买者id',
  `buy_note` text COMMENT '购买者备注或留言',
  `sell_uid` mediumint(8) unsigned DEFAULT NULL COMMENT '出售者id',
  `shipping_type` varchar(50) DEFAULT NULL COMMENT '物流方式',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '物流/快递单号',
  `shipping_city` varchar(100) DEFAULT NULL COMMENT '物流城市',
  `shipping_zipcode` varchar(32) DEFAULT NULL COMMENT '物流邮编',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '物流收货地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `buy_uid` (`buy_uid`),
  KEY `sell_uid` (`sell_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息附表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_goods`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_goods` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT 'gid',
  `oid` bigint(18) unsigned NOT NULL COMMENT '订单id',
  `mid` varchar(20) NOT NULL COMMENT '模块名',
  `cid` int(11) unsigned NOT NULL COMMENT '内容id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `catid` int(10) NOT NULL COMMENT '栏目',
  `thumb` varchar(100) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `specification` varchar(100) NOT NULL COMMENT '规格',
  `quantity` int(10) NOT NULL COMMENT '购买数量',
  `sn` varchar(100) NOT NULL COMMENT '商品编码',
  `sku` text NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '总价格',
  `order_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`),
  KEY `mid` (`mid`),
  KEY `cid` (`cid`),
  KEY `title` (`title`),
  KEY `order_price` (`order_price`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_operate`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_operate` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `oid` bigint(18) NOT NULL COMMENT '订单id',
  `uid` int(10) NOT NULL COMMENT '操作人',
  `username` varchar(100) NOT NULL COMMENT '操作人账号',
  `order_status` tinyint(2) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(2) NOT NULL COMMENT '付款状态',
  `shipping_status` tinyint(2) NOT NULL COMMENT '物流状态',
  `note` text NOT NULL COMMENT '备注信息',
  `inputtime` int(10) NOT NULL COMMENT '操作时间',
  `inputip` varchar(100) NOT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`),
  KEY `order_status` (`order_status`),
  KEY `pay_status` (`pay_status`),
  KEY `inputtime` (`inputtime`),
  KEY `shipping_status` (`shipping_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单操作记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_order_transfer`
--

CREATE TABLE IF NOT EXISTS `rs_2_order_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` mediumint(8) unsigned NOT NULL COMMENT '订单id',
  `sn` varchar(255) NOT NULL COMMENT '订单流水号',
  `note` text COMMENT '备注',
  `sell_uid` mediumint(8) unsigned NOT NULL COMMENT '商家id',
  `buy_uid` mediumint(8) unsigned NOT NULL COMMENT '卖家id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '后台录入人uid',
  `bank_sn` bigint(15) unsigned NOT NULL COMMENT '银行卡号',
  `username` varchar(100) NOT NULL COMMENT '后台录入人账号',
  `bank_note` varchar(225) NOT NULL COMMENT '转账凭证图片',
  `bank_name` varchar(100) NOT NULL COMMENT '银行名称',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `bank_sn` (`bank_sn`),
  KEY `oid` (`oid`),
  KEY `sn` (`sn`),
  KEY `sell_uid` (`sell_uid`),
  KEY `buy_uid` (`buy_uid`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='转账受理表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_page`
--

CREATE TABLE IF NOT EXISTS `rs_2_page` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL COMMENT '模块dir',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(255) NOT NULL COMMENT '单页名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有子类',
  `childids` varchar(255) NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `keywords` varchar(255) NOT NULL COMMENT 'seo关键字',
  `description` varchar(255) NOT NULL COMMENT 'seo描述',
  `content` mediumtext COMMENT '单页内容',
  `attachment` text COMMENT '附件信息',
  `template` varchar(30) NOT NULL COMMENT '模板文件',
  `urlrule` smallint(5) unsigned DEFAULT NULL COMMENT 'url规则id',
  `urllink` varchar(255) NOT NULL COMMENT 'url外链',
  `getchild` tinyint(1) unsigned NOT NULL COMMENT '将下级第一个菜单作为当前菜单',
  `show` tinyint(1) unsigned NOT NULL COMMENT '是否显示在菜单',
  `url` varchar(255) NOT NULL COMMENT 'url地址',
  `setting` mediumtext NOT NULL COMMENT '自定义内容',
  `displayorder` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`module`),
  KEY `pid` (`pid`),
  KEY `show` (`show`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='单页表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `rs_2_page`
--

INSERT INTO `rs_2_page` (`id`, `module`, `pid`, `pids`, `name`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `title`, `keywords`, `description`, `content`, `attachment`, `template`, `urlrule`, `urllink`, `getchild`, `show`, `url`, `setting`, `displayorder`) VALUES
(1, '', 0, '0', 'Service Solution', 'service', '', 1, '1,4,10,11,12,13,14,15,16,5,6,7,8,17,18,19,9', '', '', '', '', '<p>Service Solution</p>', '', 'publish.html', 0, 'publish.html', 1, 1, 'publish.html', '', 0),
(2, '', 0, '0', 'Business partner', 'partner', '', 0, '2', '', 'Business partner', '', '', '<p>Business partner</p>', '', 'partner.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=2', '', 0),
(3, '', 0, '0', 'About Us', 'about', '', 1, '3,20,21', '', '', '', '', '<p>Fujian Province, A&amp;T INTERNATIONAL&nbsp;Development Co. Ltd. (hereinafter referred to as the company or &quot;A&amp;T INTERNATIONAL&quot;) is the actual controller of electronic information Refco Group Ltd in Fujian Province, is located in Hongkong&#39;s parent company, the standard development of the international investment limited company domestic comprehensive operation headquarters, shouldering the group&#39;s Quest for sustainable growth, the integration of domestic and foreign electronic responsibility the information industry resources; is specialized, one-stop integrated service platform for foreign trade as the carrier, to carry out supply chain management services and equity operation and the combination of business entities. The company is located in Fuzhou City, focusing on the development of Mawei District area in Fujian Province, free trade zone, Hester core area, Fuzhou District three area overlap &quot;.</p><p>A&amp;T INTERNATIONAL&nbsp;has been formed and develop an excellent, professional and efficient foreign trade integrated service team, key management personnel is composed of international trade, securities fund, financial investment and other professional personnel, from trade, customs, logistics, marketing, legal, financial, tax, insurance and other related fields of the elite, absorption the innovation of Synnex Technology International (SYNNEX), Yi Yatong, Shenzhen power investment, venture capital companies such as the experience of foreign trade integrated service management. At present, the company has Fujian business center, Hongkong international procurement center, Shenzhen business center, cross-border electricity supplier center and other departments and institutions, has a deep talent pool and huge growth space.</p><p>A&amp;T INTERNATIONAL as a professional foreign trade integrated service provider, through O2O e-commerce platform and the line of professional and efficient interactive form, integration of logistics, capital flow, information flow and product flow, on the platform of small and micro partners to provide personalized, one-stop supply chain solutions, including Hong Kong agent transportation and customs clearance, import and export, procurement and purchasing, sales and marketing execution, virtual production, logistics and warehousing, insurance funds settlement, factoring, tax rebates, supply chain finance, cross-border electricity alone or in combination of foreign trade supply chain value-added services.</p><p>Through the unremitting efforts and development, young standard development has set up a set of perfect service management processes and risk management system, the service network in Hongkong, Taiwan, South Korea, Indonesia, the United States, Britain, Canada, France, Brazil, India, Russia, the United Arab Emirates and other countries and regions. Company to &quot;value, cooperation, growth&quot; as the core values, and actively create a platform and partners win-win situation, access to domestic and foreign partners alike. The joint venture is growing into an excellent supply chain service provider and welcomes people of insight both at home and abroad to work together and grow together.</p><p><br/></p>', '', 'about.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=3', '', 0),
(4, '', 1, '0,1', 'Import&amp;Export Service', 'Import&amp;Export', 'service/', 1, '4,10,11,12,13,14,15,16', '1089', 'Import&amp;Export Service', '', 'A&T INTERNATIONAL Development Co.,Ltd. provide customers with import and export customs inspection, a single, preparing the invoice declaration documents, on behalf of tariffs, agent certificate, fumigation certificate, freight forwarding services.', '<p>A&amp;T INTERNATIONAL Development Co.,Ltd. provide customers with import and export customs inspection, a single, preparing the invoice declaration documents, on behalf of tariffs, agent certificate, fumigation certificate, freight forwarding services.</p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=4', '', 0),
(5, '', 1, '0,1', 'Distribution executive', 'Distributionexecutive', 'service/', 0, '5', '1106', 'Distribution Executive', '', 'Partners, one to many sales model is simple, one to one sales model, so that partners focus on market development; partners can allow sales services extended to the domestic;', '<p>I.process</p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675358110217.png" title="1496675358110217.png" alt="blob.png"/><br/></p><p><br/></p><p>Ⅱ, advantages</p><p>1, partners, one to many sales model, simple to one to one sales model, so that partners focus on market development;</p><p>2, partners can make sales services extended to the domestic;</p><p>3, to provide partners with collection, billing and settlement services, logistics, warehousing, distribution services, re packaging, labeling, value-added services;</p><p>4, provide funding services to end partners and expand product market share.</p><p><br/></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=5', '', 0),
(6, '', 1, '0,1', 'Purchasing execution', 'purchasingexecution', 'service/', 0, '6', '1107', 'Purchasing execution', '', 'Partners, one to many of the procurement model is simple, one to one procurement model, simplifying procurement procedures, partners focus on the core business; professional and efficient customs clearance logistics services to improve procurement efficie', '<p></p><p>I. process</p><p><br/></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675824305955.png" title="1496675824305955.png" alt="blob.png"/></p><p></p><p></p><p>Ⅱ, advantages</p><p>1, partners, one to many procurement model, simple to one to one procurement model, simplify procurement procedures, partners focus on core business;</p><p>2, professional and efficient customs clearance logistics services to improve procurement efficiency;</p><p>3, provide funding services for partners, increase procurement, and reduce procurement prices;</p><p>4, one-stop procurement / procurement executive services to reduce the cost of comprehensive procurement partners, improve supply chain efficiency.</p><p><br/></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=6', '', 0),
(7, '', 1, '0,1', 'Overseas warehousing', 'Overseaswarehousing', 'service/', 0, '7', '1108', 'Overseas warehousing', '', 'Fast delivery time; local delivery of freight instead of international freight; provide more perfect after-sale retreat and replacement service; greatly increase profit margins', '<p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675434780811.png" title="1496675434780811.png" alt="blob.png"/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=7', '', 0),
(8, '', 1, '0,1', 'Supply chain management', 'Supply chain management', 'service/', 1, '8,17,18,19', '1109', 'Supply chain management', '', '1, the concentration of quantitative advantages\r\n2. Avoid duplication\r\n3, centralized procurement to form large-scale transport, thereby reducing transportation costs\r\n4, reduce the competition and conflict between departments and units within the enterpr', '<p>1, the concentration of quantitative advantages</p><p>2. Avoid duplication</p><p>3, centralized procurement to form large-scale transport, thereby reducing transportation costs</p><p>4, reduce the competition and conflict between departments and units within the enterprise</p><p>5, forming a supply base</p><p>6, reduce procurement costs</p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=8', '', 0),
(9, '', 1, '0,1', 'Cross-border electricity supplier', 'Cross-border', 'service/', 0, '9', '1110', 'Cross-border electricity supplier', '', 'In the cross-border electricity supplier clearance\r\nThe standard development of professional operation team, the customer needs to provide professional customs clearance services, and provide value-added services; at the same time, customers can query thr', '<p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;"></span></p><p>In the cross-border electricity supplier clearance</p><p>The standard development of professional operation team, the customer needs to provide professional customs clearance services, and provide value-added services; at the same time, customers can query through the information system, truly intimate, comfortable customs service.</p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675990123505.png" title="1496675990123505.png" alt="blob.png" width="750" height="177" style="width: 750px; height: 177px;"/></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496675996483246.png" title="1496675996483246.png" alt="blob.png" width="750" height="388" style="width: 750px; height: 388px;"/></p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496676002124589.png" title="1496676002124589.png" alt="blob.png" width="750" height="330" style="width: 750px; height: 330px;"/></p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;"></span></p><p>In the cross-border electricity distribution service</p><p>Joint mark development provides one-stop cross-border electricity supplier services, we can arrange reliable and efficient delivery services for customers.</p><p>Let the customer to buy foreign goods are received on flawless and perfect goods, improve the user experience, for you to win a better reputation, stable source, to seize market share!</p><p style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;"><span style="font-family: 宋体; font-size: 16px;"></span><br/></p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=9', '', 0),
(10, '', 4, '0,1,4', 'Customs declaration', 'customsdeclaration', 'service/Import&amp;Export/', 0, '10', '', 'Customs declaration', '', '', '<p>A&amp;T INTERNATIONAL Development Co.,Ltd.&nbsp;provide customers with import and export customs inspection, a single, preparing the invoice declaration documents, on behalf of tariffs, agent certificate, fumigation certificate, freight forwarding services.</p><p>In the customs inspection business scope</p><p>1. export declaration: the procedure is simple. Convenient. A wide range of commodities including: electronic information products, mechanical equipment, communication equipment, computer hardware and accessories, household appliances, pre packaged food and bulk food, hardware, cosmetics, daily necessities, chemical products, building materials, interior decoration materials, textile, feed...... Wait。 Your company (factory) as commodity name, quantity, weight, value and other forms of packaging data transmitted to the Division I, (such as inspection and quarantine shall be required to advance to our generation can be) for all the required documents, and timely handle the relevant formalities.</p><p>2., import declaration: diverse forms. Wide range of roads, including general trade, normal customs declaration. This division of tax agent, customs declaration, as well as bulk delivery declaration.</p><p>3., all-weather one-stop service: our company not only acts as a customs agent, but also acts as agent for inspection. Certificate of origin (FA, CO), fumigation, disinfection, transportation, warehousing and other services.</p><p>In the operation process of customs inspection</p><p>1., for smooth customs clearance, please fill in the specific name of goods, accessories, materials, not only fill in &quot;accessories&quot; or &quot;samples&quot; and so on.</p><p>2. the sender shall fill in the full name. The sender must sign the waybill and fill in the actual delivery date.</p><p>3., the express freight waybill contract terms (scope of liability, liability insurance, maximum amount of insurance, difficult pieces) in the major courier company on the back of the note. Please read the item carefully before sending it.</p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=10', '', 0),
(11, '', 4, '0,1,4', 'Logistics', 'logistics', 'service/Import&amp;Export/', 0, '11', '', 'Logistics', '', '', '<p>The joint logistics service providers, to provide you with marine FCL &amp; LCL service. Online inquiry shipping date, booking, operation, the cost of transparent, true and effective. At the same time to provide trailers, customs clearance, bulk cargo, as well as port of destination, delivery to the door and other value-added services. Deliver Pearl River Delta exports to Hongkong delivery to door service, and can undertake delivery from all parts to Shenzhen, warehouse centralized delivery to Hongkong.</p><p>1,&nbsp;flexible operation. Completely solve the problem of small cargo, bulk containers, difficult customs declaration, fixed delivery, rapid transit, save time, safe and efficient.</p><p>2, bulk cargo transport 500kg-20T, to save transportation costs for customers, convenient and quick.</p><p>3, a single box shipment, a 20GP transport alone, to avoid the requirements of the United Nations requirements of paired transport.</p><p>4, providing nanny service. As long as the customer submits the goods information, we are responsible for the customs declaration and customs clearance procedures for the customers at the port, which is convenient and quick.</p><p>5, door-to-door pick-up, tracking the whole process. The person responsible for the entire cargo line, station, receiving notice and other matters, door to door service fast, timely and accurate information</p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=11', '', 0),
(12, '', 4, '0,1,4', 'Drawback', 'drawback', 'service/Import&amp;Export/', 0, '12', '', 'Drawback', '', '', '<p>To evaluate our contracted clients and tax refund</p><p>With the development of the standard name of export orders, for you to apply for tax refund, and pay the tax rebate; all tax refund documents complete, 3 working days can get tax refund</p><p>For you to retain more profits, so that foreign trade links more secure and convenient, so that foreign trade exports faster and easier</p><p><br/></p>', '', 'service_page.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=12', '', 0),
(13, '', 4, '0,1,4', 'Settlement', 'settlement', 'service/Import&amp;Export/', 0, '13', '', 'Settlement', '', '', '<p>A&amp;T INTERNATIONAL Development Co.,Ltd.has a proficient in import and export trade, logistics and transport team of professionals, in strict accordance with the customer requirements to provide import and export trade, international freight forwarding, customs clearance, inspection, warehousing, distribution, transportation, foreign exchange settlement and other one-stop professional services.</p><p>The receipt and payment settlement service - agent:</p><p>1, import import, payment and foreign exchange verification shall be handled at the time of accepting the import.</p><p>2. When accepting the export of the entrusted goods, apply for export proceeds, settlement of foreign exchange and verification of foreign exchange.</p><p>3, open to support a variety of settlement methods: L/C, T/T, D/P, D/A and so on.</p><p>In the foreign exchange payment settlement business operation notice:</p><p>1. ensure the accuracy of bank collection and payment routing.</p><p>Documents such as&nbsp;</p><p>2. boxes, invoices and contracts, Bill To shall be the agent&#39;s company.</p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=13', '', 0),
(14, '', 4, '0,1,4', 'Financing', 'financing', 'service/Import&amp;Export/', 0, '14', '', 'Financing', '', '', '<p>A&amp;T INTERNATIONAL Development Co.,Ltd. is a wholly owned enterprise in Fujian province SASAC&#39;s, with strong financial strength, to provide our partners in short-term financing, cash flow difficulties help partners to solve the financing problem, advance funds, short-term financing, to accelerate the flow of funds withdrawn from circulation, enhance the competitiveness of enterprises;</p><p>- the standard development banks have good credit, perfect internal credit risk assessment mechanism, rich experience in trade finance experts, standard operating procedures, fast help the partners to advance payment, advance tax, generation / collection of letters of credit, import and export and exchange turnover series of financial problems; help our partners to avoid the loss of settlement in international trade settlement, reduce the risk of exchange rate.</p><p>The following major financing methods are provided:</p><p>1, procurement financing</p><p>2. Pledge financing of import and export goods</p><p>3, policy financing</p><p>4, real estate mortgage financing</p><p>5, letter of credit financing</p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=14', '', 0),
(15, '', 4, '0,1,4', 'Credit insurance', 'creditinsurance', 'service/Import&amp;Export/', 0, '15', '', 'Credit insurance', '', '', '<p>A&amp;T INTERNATIONAL Development Co.,Ltd.&nbsp;provide customized financing services for small and medium-sized enterprises; in order operation, the whole process of coordination with customers is reasonable and standardized in terms of signing contracts, signing agreements, applying for insurance and so on. In case of claims, the whole process will assist the customer to submit claims and prepare claims information. Reduce the order operation, claims in all aspects of the omission, resulting in non insurance, claims risk.</p><p>1, guarantee foreign exchange security</p><p>2, provide professional guidance and credit investigation for new buyers</p><p>3, with the policy to obtain financial institutions accounts receivable financing support</p><p>4, professional risk control, to help enterprises cross the development of new heights, and expand export scale</p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=15', '', 0),
(16, '', 4, '0,1,4', 'Factoring', 'factoring', 'service/Import&amp;Export/', 0, '16', '', 'Factoring', '', '', '<p>For the majority of small and medium-sized enterprises generated by the sale of goods or service contract accounts receivable, the standard development to provide trade financing, sales ledger management, accounts receivable collection, credit risk control and guarantee service etc..</p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=16', '', 0),
(21, '', 3, '0,3', 'Talent recruitment', 'Talentrecruitment', 'about/', 0, '21', '', 'Talent recruitment', '', '', '<p>Talent recruitment</p>', '', 'about.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=21', '', 0),
(17, '', 8, '0,1,8', 'Integrated supply chain', 'Integrated supply chain', 'service/Supply chain management/', 0, '17', '', 'Integrated supply chain', '', '', '<p>Carry out centralized purchasing according to customer demand to reduce customer purchasing cost</p><p>1, the concentration of quantitative advantages</p><p>2. Avoid duplication</p><p>3, centralized procurement to form large-scale transport, thereby reducing transportation costs</p><p>4, reduce the competition and conflict between departments and units within the enterprise</p><p>5, forming a supply base</p><p>6, reduce procurement costs</p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=17', '', 0),
(18, '', 8, '0,1,8', 'Fund matching', 'Fund matching', 'service/Supply chain management/', 0, '18', '', 'Fund matching', '', '', '<p>A&amp;T INTERNATIONAL Development Co.,Ltd.&nbsp;is a wholly owned enterprise in Fujian province SASAC&#39;s, with strong financial strength, at the same time to establish the depth of strategic cooperation with a number of row level of state-owned shares, commercial banks can provide the majority of partners in the short-term financing, cash flow difficulties help partners to solve the financing problem, advance funds, short-term financing, to accelerate the flow of funds withdrawn from circulation, enhance the competitiveness of enterprises;</p><p>1, rich and diverse, tailored financing solutions</p><p>2, with its own funds to quickly help the majority of partners to advance payment</p><p>3, collecting LC, underwritten delivery, receivables financing, mortgage, secured financing, payment etc.</p><p><br/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=18', '', 0),
(19, '', 8, '0,1,8', 'Integration scheme', 'Integration scheme', 'service/Supply chain management/', 0, '19', '', 'Integration scheme', '', '', '<p><span style="font-size: 16px;"><span style="font-size: 16px;"></span></span></p><p>The integration of operations through the use of external resources, to fully participate in the execution of customer orders, from materials procurement, production and processing, domestic and international distribution to the integration of services, to help customers build customer throughout the industry from the solution provider to the suppliers of raw materials, from the manufacturer to the channel&#39;s complete diamond system of supply chain.</p><p>Service model:</p><p>Make samples according to customer&#39;s requirements and concepts. After the sample has been confirmed, the joint mark will establish the complete production plan and the purchase schedule, and look for the suitable foundry, at the same time carry on the plan and the control to the production, after the production completes, promptly submits the product to the customer.</p><p>Service advantage:</p><p>Economize on capital construction investment, equipment purchase costs, and labor costs;</p><p>Advantage of a professional factory building;</p><p>Concentrate resources on product design and marketing with high added value;</p><p>Integration of enterprise production resources, with minimum input to produce maximum output;</p><p>Enhance the core competence of enterprise.</p><p>Technological process：</p><p><img src="http://demo.hf872.com/uploadfile/ueditor/image/20170605/1496676219288313.png" title="1496676219288313.png" alt="blob.png"/></p>', '', 'service_page.html', 0, '', 0, 1, 'http://en.hf872.com/index.php?c=page&id=19', '', 0),
(20, '', 3, '0,3', 'Company profile', 'Companyprofile', 'about/', 0, '20', '', 'Company profile', '', '', '<p>I. Basic information about the company</p><p>Fujian Province, A&amp;T INTERNATIONAL Development Co.,Ltd. (hereinafter referred to as the &quot;A&amp;T INTERNATIONAL&quot;) is a wholly owned company owned electronic information group in Fujian Province, is outside the window in response to the Fujian provincial government on the use of &quot;two markets and two resources to set up. The company was established in September 11, 2014, registered in Mawei District, Fuzhou, with a total investment of 100 million yuan and registered capital of 50 million yuan. Its main business is innovative integrated foreign trade service.</p><p>Since its inception, the joint venture has been committed to expanding the supply chain services in this international mature and emerging domestic formats, and build a supply chain management platform for specialized integrated foreign trade services in Fujian province. After more than a year of efforts, supply chain management business modules, cross-border electricity supplier center, Shenzhen business center has begun to take shape. At the same time, through a variety of overseas financing channels, opened a low-cost foreign funds flow to the territory of the channel.</p><p>In 2016, the supply chain cooperative services enterprises reached more than 100, through the domestic and international large-scale supply chain management of listed companies operating experience, in strict risk control under the premise, business model matures. Through the integration of the supply chain each link, in addition to providing research and development, sales include logistics, procurement and distribution, settlement services in one of the one-stop supply chain management / financial services, forming a unique competitive advantage.</p><p>Two, competitive advantage</p><p>(1) policy advantages</p><p>Just unfolding moment &quot;supply side reforms, supply chain management business has become Shenzhen&#39;s three largest economy one of the pillar industries, Shenzhen focused on the country more than 80% supply chain management company headquarters, and related industrial chain has been the national radiation. The international standard in terms of business model innovation, boldly explored and beneficial, the standard development of Shenzhen business center will be a series of innovative business models, grafted to Fujian, to provide the impetus for the development of small and micro enterprises in mainland Fujian. At present, the supply chain management / financial industry will usher in a new round of development opportunities, relying on the background of the country and unique regional advantages and open financial policy, cross-border capital pool and external self-discipline management and a series of policy advantages, companies in the development of supply chain management / financial new formats have been ready &quot;natural, and the conditions of development.</p><p>(two) platform advantages</p><p>The standard development as the standard of the international domestic operation platform, and the standard of international common construction inside and outside financing channels, on the one hand, capital, debt and other international interest in foreign currency resources, lay the foundation for the development of supply chain management business; on the other hand, provides operational support effective supply chain business for domestic and foreign the intermediation of funds, the standard of international &quot;two markets and two resources advantages into full play.</p><p>In the process of carrying out supply chain services, the company took control of the business flow, logistics, capital flow and information flow of cooperative enterprises and other key information, according to ERP system, the formation of &quot;four in one&quot; rich industry big data; in addition, the depth of cooperation in the supply chain relationship in the long term, the company in the industry that has the advantage of First impressions are strongest business value, management team, industry development direction, lay the foundation for the equity control, capital operation etc..</p><p>(three) talent advantage</p><p>1, the core team: supply chain business core team members have been domestic large company supply chain management experience, through the supply chain companies from start-ups to the whole process of listed companies, with more than 10 years did not happen in real good operating record.</p><p>2, partners: the standard development of cooperative enterprises including Terbury, Baidu, Lenovo, the Shenzhou computer Chinese suppliers and other famous enterprises, are tablet computer, mobile phone, the display industry senior designers, suppliers and manufacturers, has many years of experience in OEM/ODM design, production orders, etc..</p><p>(four) business value and profit model;</p><p>The company by providing personalized service tailored services, supply chain finance for short-term financing needs of small and medium-sized enterprises, and bring additional financial benefits for the export business, such as export subsidies, incremental financing loans, CITIC insurance settlement at preferential service level, more involved in the supply chain is longer, get the higher the income.</p><p>Three, the qualifications obtained</p><p>(1) Fuzhou only recommends the Fujian foreign trade comprehensive service (pilot) enterprise.</p><p>(two) customs certification: has successfully passed AEO certification, customs AEO certification docking international standards, the European Union, 28 countries, Singapore, Korea and other countries and regions are mutual recognition. After the adoption of AEO certification, it greatly improves the efficiency of import and export customs clearance, and helps to improve the scale and level of supply chain business, and enhance the company&#39;s good image.</p><p>(three) bank credit: Completed Construction Bank credit rating, from 9 to 8, has established a credit rating relationship with a number of banks, for the follow-up business to create favorable conditions.</p><p>(four) national tax rating: through the Fuzhou Free Trade Zone National Tax Bureau comprehensive assessment, joint development, has been rated as a level of credit management enterprises, export tax rebate classification management two categories of enterprises, for the export tax rebate to create more convenient conditions.</p>', '', 'about.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=20', '', 0),
(22, '', 0, '0', 'Register', 'Register', '', 0, '22', '', 'Register', '', 'Register', '<p>Register</p>', '', 'regpage.html', 0, '', 1, 1, 'http://en.hf872.com/index.php?c=page&id=22', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_poster`
--

CREATE TABLE IF NOT EXISTS `rs_2_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '位置id',
  `name` varchar(50) NOT NULL COMMENT '广告名称',
  `value` text NOT NULL COMMENT '广告值',
  `uid` int(10) unsigned NOT NULL COMMENT '发布人uid',
  `username` varchar(50) NOT NULL COMMENT '发布人',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '竞价金额',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`sid`,`status`,`displayorder`),
  KEY `uid` (`uid`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `rs_2_poster`
--

INSERT INTO `rs_2_poster` (`id`, `sid`, `name`, `value`, `uid`, `username`, `price`, `starttime`, `endtime`, `inputtime`, `clicks`, `displayorder`, `status`) VALUES
(7, 1, 'banner1', 'a:5:{s:3:\\"url\\";s:22:\\"http://demo.hf872.com/\\";s:4:\\"file\\";s:4:\\"1104\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496811066, 0, 1496811081, 1, 0, 1),
(2, 1, 'banner2', 'a:5:{s:3:\\"url\\";s:21:\\"http://demo.hf872.com\\";s:4:\\"file\\";s:4:\\"1105\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496246400, 0, 1496583561, 0, 0, 1),
(3, 2, 'banner1', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1079\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496591238, 0, 1496591331, 0, 0, 1),
(5, 3, 'Banner', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1097\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1496719091, 0, 1496719102, 0, 0, 1),
(8, 5, 'Banner', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1131\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497974400, 0, 1498061094, 0, 0, 1),
(9, 6, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1115\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498304543, 0, 0, 1),
(10, 7, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1116\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498305296, 0, 0, 1),
(11, 8, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1117\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498305324, 0, 0, 1),
(12, 9, 'AD', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1118\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498305358, 0, 0, 1),
(13, 10, 'Slide', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1119\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498305876, 0, 0, 1),
(14, 11, 'Slide', 'a:5:{s:3:\\"url\\";s:0:\\"\\";s:4:\\"file\\";s:4:\\"1120\\";s:4:\\"text\\";N;s:4:\\"code\\";N;s:5:\\"color\\";N;}', 1, 'admin', 0.00, 1497888000, 0, 1498305900, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_poster_space`
--

CREATE TABLE IF NOT EXISTS `rs_2_poster_space` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '广告位名称',
  `type` tinyint(2) NOT NULL COMMENT '广告位类型',
  `value` text NOT NULL COMMENT '参数配置',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '竞价金额',
  `items` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告数量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `rs_2_poster_space`
--

INSERT INTO `rs_2_poster_space` (`id`, `name`, `type`, `value`, `price`, `items`, `status`) VALUES
(1, '首页轮播图', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 2, 1),
(2, '关于我们Banner', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(3, '服务方案Banner', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(5, '商城Banner', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(6, '商城1F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(7, '商城2F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(8, '商城3F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(9, '商城4F广告', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(10, '商城3F幻灯片', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1),
(11, '商城4F幻灯片', 1, 'a:4:{i:1;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:2;a:5:{s:6:\\"center\\";s:1:\\"1\\";s:4:\\"left\\";s:0:\\"\\";s:3:\\"top\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:3;a:2:{s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}i:4;a:5:{s:3:\\"top\\";s:0:\\"\\";s:4:\\"left\\";s:0:\\"\\";s:5:\\"right\\";s:0:\\"\\";s:5:\\"width\\";s:0:\\"\\";s:6:\\"height\\";s:0:\\"\\";}}', 0.00, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_remote`
--

CREATE TABLE IF NOT EXISTS `rs_2_remote` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '远程附件类型',
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `exts` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='远程附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share`
--

CREATE TABLE IF NOT EXISTS `rs_2_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块主表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share_category`
--

CREATE TABLE IF NOT EXISTS `rs_2_share_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `domain` varchar(50) NOT NULL COMMENT '绑定域名',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `benner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share_extend`
--

CREATE TABLE IF NOT EXISTS `rs_2_share_extend` (
  `id` int(10) unsigned NOT NULL,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share_extend_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_share_extend_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(22) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展索引表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_share_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块内容索引表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share_search`
--

CREATE TABLE IF NOT EXISTS `rs_2_share_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_share_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_share_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `order_price` decimal(10,2) DEFAULT NULL,
  `order_volume` int(10) DEFAULT '0',
  `order_quantity` varchar(255) DEFAULT NULL,
  `favorites` int(10) DEFAULT '0',
  `avgsort` decimal(4,2) DEFAULT '0.00',
  `fj_area` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=207 ;

--
-- 转存表中的数据 `rs_2_shop`
--

INSERT INTO `rs_2_shop` (`id`, `catid`, `title`, `thumb`, `keywords`, `description`, `hits`, `uid`, `author`, `status`, `url`, `link_id`, `tableid`, `inputip`, `inputtime`, `updatetime`, `comments`, `displayorder`, `order_price`, `order_volume`, `order_quantity`, `favorites`, `avgsort`, `fj_area`) VALUES
(1, 7, 'Test', '1127', '', 'Test', 54, 1, 'admin', 9, 'http://en.hf872.com/shop-show-1.html', 0, 0, '192.168.1.80', 1498307019, 1498465361, 0, 0, 0.00, 0, '', 0, 0.00, 1),
(2, 7, 'Test', '1127', '', 'Test', 6, 1, 'admin', 9, 'http://en.hf872.com/shop-show-2.html', 0, 0, '192.168.1.80', 1498307019, 1498307019, 0, 0, 0.00, 0, '', 0, 0.00, 1);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_buy`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用金币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_category`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `rs_2_shop_category`
--

INSERT INTO `rs_2_shop_category` (`id`, `pid`, `pids`, `name`, `letter`, `dirname`, `pdirname`, `child`, `childids`, `thumb`, `show`, `permission`, `setting`, `displayorder`) VALUES
(7, 1, '0,1', 'Import licence', 'j', 'jckxkz', 'gszc/', 0, '7', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"16\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(1, 0, '0', 'Import&export customs clearanc', 'g', 'gszc', '', 1, '1,7,8', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 1),
(4, 0, '0', 'Virtual production', 'c', 'xnsc', '', 1, '4,17,18,19', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 4),
(3, 0, '0', 'Supply chain finance', 'g', 'gyljr', '', 1, '3,12,13', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 3),
(2, 0, '0', 'Industry layout', 'c', 'cybj', '', 1, '2,22,23,24,25', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 2),
(22, 2, '0,2', 'Shuang hung Electronics', 's', 'shdz', 'cybj/', 0, '22', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(5, 0, '0', 'Others', 'q', 'qtl', '', 0, '5', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 5),
(8, 1, '0,1', 'Customs valuation', 'h', 'hgsb', 'gszc/', 0, '8', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(19, 4, '0,4', 'Tablet PC', 'p', 'pb', 'xnsc/', 0, '19', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(12, 3, '0,3', 'Insurance and factoring', 'b', 'bxylp', 'gyljr/', 0, '12', '', 1, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(13, 3, '0,3', 'bill purchased', 'y', 'yh', 'gyljr/', 0, '13', '', 0, '', 'a:6:{s:4:\\"edit\\";s:1:\\"0\\";s:7:\\"linkurl\\";s:0:\\"\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(25, 2, '0,2', 'Fu Qiang Electronics', 'f', 'fuqiangdianzi', 'cybj/', 0, '25', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(24, 2, '0,2', 'HICREAT science and technology', 'h', 'haichuangkeji', 'cybj/', 0, '24', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(23, 2, '0,2', 'Ruida Seiko', 'r', 'ruidajinggong', 'cybj/', 0, '23', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(17, 4, '0,4', 'Mobile phone', 's', 'sj', 'xnsc/', 0, '17', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0),
(18, 4, '0,4', 'Notebook', 'b', 'bjb', 'xnsc/', 0, '18', '', 1, '', 'a:5:{s:4:\\"edit\\";s:1:\\"0\\";s:3:\\"seo\\";a:4:{s:10:\\"show_title\\";s:74:\\"[第{page}页{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}\\";s:10:\\"list_title\\";s:58:\\"[第{page}页{join}]{name}{join}{modname}{join}{SITE_NAME}\\";s:13:\\"list_keywords\\";s:0:\\"\\";s:16:\\"list_description\\";s:0:\\"\\";}s:8:\\"template\\";a:4:{s:8:\\"pagesize\\";s:2:\\"20\\";s:4:\\"show\\";s:9:\\"show.html\\";s:8:\\"category\\";s:13:\\"category.html\\";s:4:\\"list\\";s:9:\\"list.html\\";}s:5:\\"admin\\";a:0:{}s:6:\\"member\\";a:0:{}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_category_data`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_category_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_data_0`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `duotu` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `rs_2_shop_data_0`
--

INSERT INTO `rs_2_shop_data_0` (`id`, `uid`, `catid`, `content`, `duotu`) VALUES
(1, 1, 7, '<p>Test</p>', 'a:1:{i:0;s:4:\\"1127\\";}'),
(2, 1, 7, '<p>Test</p>', 'a:1:{i:0;s:4:\\"1127\\";}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_draft`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_favorite`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_flag`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_hits`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `rs_2_shop_hits`
--

INSERT INTO `rs_2_shop_hits` (`id`, `hits`, `day_hits`, `week_hits`, `month_hits`, `year_hits`) VALUES
(1, 54, 54, 11, 55, 1),
(2, 6, 1, 1, 7, 4);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_html`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `rs_2_shop_index`
--

INSERT INTO `rs_2_shop_index` (`id`, `uid`, `catid`, `status`, `inputtime`) VALUES
(1, 1, 7, 9, 1498307019),
(2, 1, 7, 9, 1498307019);

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_search`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_search_index`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_tag`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_2_shop_verify`
--

CREATE TABLE IF NOT EXISTS `rs_2_shop_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `rs_admin`
--

CREATE TABLE IF NOT EXISTS `rs_admin` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` varchar(50) DEFAULT NULL COMMENT '后台主题',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `rs_admin`
--

INSERT INTO `rs_admin` (`uid`, `realname`, `usermenu`, `color`) VALUES
(1, '网站创始人', '', 'blue');

-- --------------------------------------------------------

--
-- 表的结构 `rs_admin_login`
--

CREATE TABLE IF NOT EXISTS `rs_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='登录日志记录' AUTO_INCREMENT=270 ;

--
-- 转存表中的数据 `rs_admin_login`
--

INSERT INTO `rs_admin_login` (`id`, `uid`, `loginip`, `logintime`, `useragent`) VALUES
(1, 1, '127.0.0.1', 1463649388, 'Windows 7 Chrome 48.0.2564.116'),
(2, 1, '127.0.0.1', 1463712472, 'Windows 7 Chrome 48.0.2564.116'),
(3, 1, '127.0.0.1', 1464065955, 'Windows 7 Chrome 48.0.2564.116'),
(4, 1, '127.0.0.1', 1464161827, 'Windows 7 Chrome 45.0.2454.85'),
(5, 1, '127.0.0.1', 1464233572, 'Windows 7 Chrome 48.0.2564.116'),
(6, 1, '127.0.0.1', 1464341929, 'Windows 7 Chrome 48.0.2564.116'),
(7, 1, '127.0.0.1', 1464601783, 'Windows 7 Chrome 45.0.2454.85'),
(8, 1, '127.0.0.1', 1464747533, 'Windows 7 Chrome 48.0.2564.116'),
(9, 1, '120.35.4.185', 1464746067, 'Windows 7 Chrome 45.0.2454.85'),
(10, 1, '127.0.0.1', 1464858357, 'Windows 7 Chrome 48.0.2564.116'),
(11, 1, '127.0.0.1', 1464914500, 'Windows 7 Chrome 48.0.2564.116'),
(12, 1, '127.0.0.1', 1465175668, 'Windows 7 Chrome 48.0.2564.116'),
(13, 1, '127.0.0.1', 1465262442, 'Windows 7 Chrome 48.0.2564.116'),
(14, 1, '127.0.0.1', 1465349393, 'Windows 7 Chrome 48.0.2564.116'),
(15, 1, '127.0.0.1', 1466042689, 'Windows 7 Chrome 48.0.2564.116'),
(16, 1, '127.0.0.1', 1466126958, 'Windows 7 Chrome 48.0.2564.116'),
(17, 1, '127.0.0.1', 1466383057, 'Windows 7 Chrome 48.0.2564.116'),
(18, 1, '127.0.0.1', 1466475923, 'Windows 7 Chrome 48.0.2564.116'),
(19, 1, '127.0.0.1', 1466587432, 'Windows 7 Chrome 48.0.2564.116'),
(20, 1, '127.0.0.1', 1466644347, 'Windows 7 Chrome 48.0.2564.116'),
(21, 1, '127.0.0.1', 1466728791, 'Windows 7 Chrome 48.0.2564.116'),
(22, 1, '127.0.0.1', 1467017903, 'Windows 7 Chrome 48.0.2564.116'),
(23, 1, '127.0.0.1', 1467074223, 'Windows 7 Chrome 48.0.2564.116'),
(24, 1, '127.0.0.1', 1467181647, 'Windows 7 Chrome 48.0.2564.116'),
(25, 1, '127.0.0.1', 1467266087, 'Windows 7 Chrome 48.0.2564.116'),
(26, 1, '127.0.0.1', 1467613897, 'Windows 7 Chrome 48.0.2564.116'),
(27, 1, '127.0.0.1', 1467706458, 'Windows 7 Chrome 48.0.2564.116'),
(28, 1, '127.0.0.1', 1467765329, 'Windows 7 Chrome 48.0.2564.116'),
(29, 1, '127.0.0.1', 1467851867, 'Windows 7 Chrome 48.0.2564.116'),
(30, 1, '127.0.0.1', 1467970157, 'Windows 7 Chrome 48.0.2564.116'),
(31, 1, '127.0.0.1', 1468310604, 'Windows 7 Chrome 48.0.2564.116'),
(32, 1, '127.0.0.1', 1468555287, 'Windows 7 Chrome 48.0.2564.116'),
(33, 1, '127.0.0.1', 1468985632, 'Windows 7 Chrome 48.0.2564.116'),
(34, 1, '127.0.0.1', 1469063576, 'Windows 7 Chrome 48.0.2564.116'),
(35, 1, '127.0.0.1', 1469174546, 'Windows 7 Chrome 48.0.2564.116'),
(36, 1, '127.0.0.1', 1469434536, 'Windows 7 Chrome 48.0.2564.116'),
(37, 1, '127.0.0.1', 1469497032, 'Windows 7 Chrome 48.0.2564.116'),
(38, 1, '210.25.116.47', 1469760502, 'Windows 7 Chrome 45.0.2454.101'),
(39, 1, '127.0.0.1', 1470054551, 'Windows 7 Chrome 48.0.2564.116'),
(40, 1, '127.0.0.1', 1470207691, 'Windows 7 Chrome 48.0.2564.116'),
(41, 1, '127.0.0.1', 1470293364, 'Windows 7 Chrome 48.0.2564.116'),
(42, 1, '127.0.0.1', 1470361646, 'Windows 7 Chrome 48.0.2564.116'),
(43, 1, '127.0.0.1', 1470473427, 'Windows 7 Chrome 45.0.2454.101'),
(44, 1, '127.0.0.1', 1470624512, 'Windows 7 Chrome 48.0.2564.116'),
(45, 1, '127.0.0.1', 1470726319, 'Windows 7 Chrome 48.0.2564.116'),
(46, 1, '127.0.0.1', 1470824078, 'Windows 7 Chrome 48.0.2564.116'),
(47, 1, '127.0.0.1', 1470902389, 'Windows 7 Chrome 48.0.2564.116'),
(48, 1, '127.0.0.1', 1470974122, 'Windows 7 Chrome 48.0.2564.116'),
(49, 1, '210.25.116.47', 1470991356, 'Windows 7 Chrome 45.0.2454.101'),
(50, 1, '127.0.0.1', 1471241354, 'Windows 7 Chrome 48.0.2564.116'),
(51, 1, '210.25.116.47', 1471252952, 'Windows 7 Chrome 45.0.2454.101'),
(52, 1, '210.25.116.47', 1471308553, 'Windows 7 Chrome 45.0.2454.101'),
(53, 1, '127.0.0.1', 1471308604, 'Windows 7 Chrome 48.0.2564.116'),
(54, 1, '120.35.4.185', 1471336602, 'Windows 7 Chrome 45.0.2454.101'),
(55, 1, '120.35.4.185', 1471488389, 'Windows 7 Chrome 48.0.2564.116'),
(56, 1, '120.35.4.185', 1471603475, 'Windows 7 Chrome 48.0.2564.116'),
(57, 1, '120.35.4.185', 1471861968, 'Windows 7 Chrome 48.0.2564.116'),
(58, 1, '120.35.4.185', 1471947868, 'Windows 7 Chrome 48.0.2564.116'),
(59, 1, '120.35.4.185', 1472002831, 'Windows 7 Chrome 48.0.2564.116'),
(60, 1, '120.35.4.185', 1472121366, 'Windows 7 Chrome 45.0.2454.101'),
(61, 1, '120.35.4.185', 1472204804, 'Windows 7 Chrome 45.0.2454.101'),
(62, 1, '120.35.4.185', 1472451758, 'Windows 7 Chrome 48.0.2564.116'),
(63, 1, '120.35.4.185', 1472526583, 'Windows 7 Chrome 48.0.2564.116'),
(64, 1, '120.35.4.185', 1472632815, 'Windows 7 Chrome 45.0.2454.101'),
(65, 1, '120.35.4.185', 1472698285, 'Windows 7 Internet Explorer 9.0'),
(66, 1, '120.35.4.185', 1472822677, 'Windows 7 Chrome 48.0.2564.116'),
(67, 1, '121.207.218.201', 1472824333, 'Windows 10 Spartan 13.10586'),
(68, 1, '117.25.125.40', 1472858257, 'Windows 7 Internet Explorer 11.0'),
(69, 1, '122.91.157.62', 1472859609, 'Apple iPhone Mozilla 5.0'),
(70, 1, '120.36.123.2', 1472902673, 'Android Chrome 37.0.0.0'),
(71, 20, '120.36.123.2', 1472871562, 'Windows 10 Firefox 48.0'),
(72, 1, '121.207.218.201', 1472907048, 'Windows 10 Spartan 13.10586'),
(73, 1, '121.207.218.201', 1472974858, 'Windows 10 Spartan 13.10586'),
(74, 1, '120.36.123.2', 1473030686, 'Android Chrome 37.0.0.0'),
(75, 1, '61.131.86.95', 1473067410, 'Windows 10 Chrome 49.0.2623.112'),
(76, 1, '120.35.4.185', 1473059755, 'Windows 7 Chrome 45.0.2454.101'),
(77, 1, '61.131.86.95', 1473149952, 'Windows 10 Chrome 49.0.2623.112'),
(78, 1, '120.35.4.185', 1473147915, 'Windows 7 Chrome 45.0.2454.101'),
(79, 1, '61.131.86.95', 1473228986, 'Windows 10 Chrome 49.0.2623.112'),
(80, 1, '120.35.4.185', 1473242016, 'Windows 7 Chrome 45.0.2454.101'),
(81, 1, '61.131.86.95', 1473320617, 'Windows 7 Chrome 45.0.2454.101'),
(82, 1, '120.35.4.185', 1473321147, 'Windows 7 Chrome 45.0.2454.101'),
(83, 1, '61.131.86.95', 1473413791, 'Windows 10 Chrome 49.0.2623.112'),
(84, 1, '120.35.4.185', 1473408838, 'Windows 7 Chrome 45.0.2454.101'),
(85, 1, '121.204.114.117', 1473665702, 'Windows 7 Chrome 45.0.2454.101'),
(86, 1, '120.35.4.185', 1473671655, 'Windows 7 Chrome 45.0.2454.101'),
(87, 1, '121.204.114.117', 1473748325, 'Windows 7 Chrome 45.0.2454.101'),
(88, 1, '120.35.4.185', 1473754728, 'Windows 7 Chrome 48.0.2564.116'),
(89, 1, '121.204.114.117', 1473837465, 'Windows 10 Chrome 49.0.2623.112'),
(90, 1, '120.35.4.185', 1473839572, 'Windows 7 Chrome 45.0.2454.101'),
(91, 1, '27.156.74.163', 1474179764, 'Windows 10 Chrome 49.0.2623.112'),
(92, 1, '120.35.4.185', 1474184775, 'Windows 7 Chrome 45.0.2454.101'),
(93, 1, '27.156.74.163', 1474275680, 'Windows 10 Chrome 49.0.2623.112'),
(94, 1, '120.35.4.185', 1474276138, 'Windows 7 Chrome 48.0.2564.116'),
(95, 1, '27.156.74.163', 1474359005, 'Windows 10 Chrome 49.0.2623.112'),
(96, 1, '120.35.4.185', 1474363715, 'Windows 7 Chrome 45.0.2454.101'),
(97, 1, '27.156.74.163', 1474436676, 'Windows 7 Chrome 45.0.2454.101'),
(98, 1, '27.156.74.163', 1474534646, 'Windows 10 Chrome 49.0.2623.112'),
(99, 1, '27.156.74.163', 1474615202, 'Windows 10 Chrome 49.0.2623.112'),
(100, 1, '120.35.4.185', 1474621585, 'Windows 7 Chrome 45.0.2454.101'),
(101, 1, '120.39.57.185', 1474852513, 'Windows 7 Chrome 45.0.2454.101'),
(102, 1, '120.39.57.185', 1474966504, 'Windows 10 Chrome 49.0.2623.112'),
(103, 1, '120.35.4.185', 1474966030, 'Windows 7 Chrome 45.0.2454.85'),
(104, 1, '120.39.57.185', 1475140912, 'Windows 10 Chrome 49.0.2623.112'),
(105, 1, '112.5.236.135', 1475110305, 'Windows 10 Spartan 13.10586'),
(106, 1, '120.35.4.185', 1475143692, 'Windows 7 Chrome 48.0.2564.116'),
(107, 1, '120.39.57.185', 1475220027, 'Windows 10 Chrome 49.0.2623.112'),
(108, 1, '120.35.4.185', 1475196106, 'Windows 7 Chrome 48.0.2564.116'),
(109, 1, '27.156.74.134', 1475915943, 'Windows 10 Chrome 49.0.2623.112'),
(110, 1, '120.35.4.185', 1475890585, 'Windows 7 Internet Explorer 9.0'),
(111, 1, '27.156.74.134', 1476004131, 'Windows 10 Chrome 49.0.2623.112'),
(112, 1, '120.35.4.185', 1476002262, 'Windows 7 Chrome 45.0.2454.101'),
(113, 1, '27.156.74.134', 1476084602, 'Windows 10 Chrome 49.0.2623.112'),
(114, 1, '120.35.4.185', 1476091601, 'Windows 7 Chrome 45.0.2454.101'),
(115, 1, '27.156.74.134', 1476177089, 'Windows 10 Chrome 49.0.2623.112'),
(116, 1, '120.35.4.185', 1476175984, 'Windows 7 Chrome 45.0.2454.101'),
(117, 1, '27.156.74.134', 1476262423, 'Windows 7 Chrome 45.0.2454.101'),
(118, 1, '120.35.4.185', 1476268884, 'Windows 7 Chrome 48.0.2564.116'),
(119, 1, '27.156.74.134', 1476350872, 'Windows 10 Chrome 49.0.2623.112'),
(120, 1, '120.35.4.185', 1476345821, 'Windows 7 Chrome 45.0.2454.101'),
(121, 1, '27.156.74.134', 1476431742, 'Windows 10 Chrome 49.0.2623.112'),
(122, 1, '120.35.4.185', 1476430815, 'Windows 7 Chrome 48.0.2564.116'),
(123, 1, '140.224.92.210', 1476775565, 'Windows 10 Chrome 49.0.2623.112'),
(124, 1, '120.35.4.185', 1476776840, 'Windows 7 Chrome 48.0.2564.116'),
(125, 1, '140.224.92.210', 1476863632, 'Windows 10 Chrome 49.0.2623.112'),
(126, 1, '120.35.4.185', 1476856547, 'Windows 7 Chrome 48.0.2564.116'),
(127, 1, '140.224.92.210', 1476945196, 'Windows 10 Chrome 49.0.2623.112'),
(128, 1, '120.35.4.185', 1476949903, 'Windows 7 Chrome 45.0.2454.101'),
(129, 1, '140.224.92.210', 1477032097, 'Windows 7 Chrome 50.0.2661.102'),
(130, 1, '120.35.4.185', 1477040590, 'Windows 7 Chrome 50.0.2661.102'),
(131, 1, '120.36.122.241', 1477220925, 'Windows 10 Chrome 54.0.2840.71'),
(132, 1, '27.151.65.127', 1477296697, 'Windows 7 Chrome 50.0.2661.102'),
(134, 1, '120.35.4.185', 1477282358, 'Windows 7 Chrome 45.0.2454.85'),
(210, 1, '::1', 1491314766, 'Windows 10 Chrome 50.0.2661.102'),
(136, 1, '27.151.65.127', 1477386553, 'Windows 10 Chrome 49.0.2623.112'),
(137, 1, '120.35.4.185', 1477375775, 'Windows 7 Chrome 45.0.2454.101'),
(138, 1, '27.151.65.127', 1477443340, 'Windows 10 Chrome 49.0.2623.112'),
(139, 1, '120.35.4.185', 1477444355, 'Windows 7 Chrome 45.0.2454.101'),
(140, 1, '120.35.4.185', 1477550958, 'Windows 7 Chrome 48.0.2564.116'),
(141, 1, '27.151.65.127', 1477537711, 'Windows 7 Chrome 50.0.2661.102'),
(142, 1, '27.151.65.127', 1477644310, 'Windows 10 Chrome 49.0.2623.112'),
(143, 1, '120.35.4.185', 1477618087, 'Windows 7 Chrome 45.0.2454.101'),
(144, 1, '27.151.100.195', 1477897140, 'Windows 10 Chrome 49.0.2623.112'),
(145, 1, '120.35.4.185', 1477874894, 'Windows 7 Chrome 48.0.2564.116'),
(146, 1, '27.151.100.195', 1477971839, 'Windows 10 Chrome 49.0.2623.112'),
(147, 1, '27.151.100.195', 1478056665, 'Windows 10 Chrome 49.0.2623.112'),
(148, 1, '27.151.100.195', 1478154796, 'Windows 10 Chrome 49.0.2623.112'),
(149, 1, '27.151.100.195', 1478218828, 'Windows 10 Chrome 49.0.2623.112'),
(150, 1, '120.35.4.185', 1478227648, 'Windows 7 Chrome 45.0.2454.101'),
(151, 1, '27.151.65.240', 1478507198, 'Windows 10 Chrome 49.0.2623.112'),
(152, 1, '27.151.65.240', 1478564046, 'Windows 10 Chrome 49.0.2623.112'),
(153, 1, '27.151.65.240', 1478669614, 'Windows 10 Chrome 49.0.2623.112'),
(154, 1, '27.151.65.240', 1478738287, 'Windows 10 Chrome 49.0.2623.112'),
(155, 1, '27.151.65.240', 1478851332, 'Windows 10 Chrome 49.0.2623.112'),
(156, 1, '120.35.4.185', 1479112361, 'Windows 7 Chrome 45.0.2454.101'),
(157, 1, '27.151.65.100', 1479191958, 'Windows 7 Chrome 50.0.2661.102'),
(158, 1, '27.151.65.100', 1479283205, 'Windows 10 Chrome 49.0.2623.112'),
(159, 1, '27.151.65.100', 1479346432, 'Windows 10 Chrome 49.0.2623.112'),
(160, 1, '27.151.65.100', 1479433173, 'Windows 10 Chrome 49.0.2623.112'),
(161, 1, '27.151.65.48', 1479797824, 'Windows 10 Chrome 49.0.2623.112'),
(162, 1, '27.151.65.48', 1479867320, 'Windows 10 Chrome 49.0.2623.112'),
(163, 1, '27.151.65.48', 1479951371, 'Windows 10 Chrome 49.0.2623.112'),
(164, 1, '120.35.4.185', 1479957648, 'Windows 7 Chrome 45.0.2454.101'),
(165, 1, '27.151.65.48', 1480053322, 'Windows 10 Chrome 49.0.2623.112'),
(166, 1, '120.35.4.185', 1480044886, 'Windows 7 Chrome 48.0.2564.116'),
(167, 1, '27.151.64.69', 1480324533, 'Windows 7 Chrome 50.0.2661.102'),
(168, 1, '27.151.64.69', 1480380154, 'Windows 10 Chrome 49.0.2623.112'),
(169, 1, '27.151.64.69', 1480494167, 'Windows 7 Chrome 50.0.2661.102'),
(170, 1, '27.151.64.69', 1480553612, 'Windows 7 Chrome 50.0.2661.102'),
(171, 1, '27.151.64.69', 1480666024, 'Windows 7 Chrome 50.0.2661.102'),
(173, 1, '27.151.100.194', 1481184062, 'Windows 10 Chrome 49.0.2623.112'),
(172, 1, '120.35.4.185', 1480665741, 'Windows 7 Chrome 48.0.2564.116'),
(174, 1, '27.151.100.222', 1481533859, 'Windows 7 Chrome 50.0.2661.102'),
(175, 1, '27.151.100.222', 1481619503, 'Windows 10 Chrome 49.0.2623.112'),
(176, 1, '120.35.4.185', 1481696559, 'Windows 7 Chrome 48.0.2564.116'),
(177, 1, '27.151.100.222', 1481794009, 'Windows 10 Chrome 49.0.2623.112'),
(178, 1, '27.156.73.216', 1482112364, 'Windows 7 Chrome 50.0.2661.102'),
(179, 1, '120.35.4.185', 1482115503, 'Windows 7 Chrome 45.0.2454.101'),
(180, 1, '27.156.73.216', 1482204705, 'Windows 10 Chrome 49.0.2623.112'),
(181, 1, '27.156.73.216', 1482305015, 'Windows 7 Chrome 50.0.2661.102'),
(182, 1, '27.156.73.216', 1482478380, 'Windows 7 Chrome 50.0.2661.102'),
(183, 1, '120.39.57.71', 1482718916, 'Windows 7 Chrome 50.0.2661.102'),
(184, 1, '120.39.57.71', 1482976519, 'Windows 7 Chrome 50.0.2661.102'),
(185, 1, '120.39.57.71', 1483061737, 'Windows 7 Chrome 50.0.2661.102'),
(186, 1, '121.204.90.100', 1483404514, 'Windows 7 Chrome 50.0.2661.102'),
(187, 1, '120.35.4.185', 1483603886, 'Windows 7 Chrome 48.0.2564.116'),
(188, 1, '140.224.93.196', 1483945356, 'Windows 7 Chrome 50.0.2661.102'),
(189, 1, '27.156.72.228', 1484795708, 'Windows 7 Chrome 50.0.2661.102'),
(190, 1, '27.151.63.2', 1485239516, 'Windows 7 Chrome 50.0.2661.102'),
(191, 1, '120.39.56.34', 1486107386, 'Windows 10 Chrome 55.0.2883.87'),
(192, 1, '120.39.56.34', 1486177171, 'Windows 7 Chrome 50.0.2661.102'),
(193, 1, '120.39.56.34', 1486340681, 'Windows 7 Chrome 50.0.2661.102'),
(194, 1, '120.39.56.34', 1486429615, 'Windows 10 Chrome 55.0.2883.87'),
(195, 1, '27.151.61.60', 1486706565, 'Windows 10 Chrome 55.0.2883.87'),
(196, 1, '27.151.61.60', 1487119003, 'Windows 7 Chrome 50.0.2661.102'),
(197, 1, '110.80.175.49', 1487205937, 'Windows 7 Chrome 50.0.2661.102'),
(198, 1, '27.151.67.106', 1487810719, 'Windows 7 Chrome 50.0.2661.102'),
(199, 1, '27.151.67.106', 1488157597, 'Windows 7 Chrome 50.0.2661.102'),
(200, 1, '120.39.51.225', 1488248075, 'Windows 7 Chrome 45.0.2454.101'),
(201, 1, '27.151.67.106', 1488249718, 'Windows 10 Chrome 55.0.2883.87'),
(202, 1, '27.156.74.69', 1488503507, 'Windows 7 Chrome 50.0.2661.102'),
(203, 1, '27.156.74.69', 1488780694, 'Windows 7 Chrome 50.0.2661.102'),
(204, 1, '27.156.74.69', 1489044169, 'Windows 7 Chrome 50.0.2661.102'),
(205, 1, '27.156.74.69', 1489390213, 'Windows XP Chrome 45.0.2454.101'),
(206, 1, '27.156.74.69', 1489544442, 'Windows 10 Chrome 55.0.2883.87'),
(207, 1, '121.204.101.2', 1490142324, 'Windows 7 Chrome 50.0.2661.102'),
(208, 1, '121.204.96.66', 1490154844, 'Windows 7 Chrome 45.0.2454.101'),
(209, 1, '218.66.69.134', 1490583462, 'Windows 7 Chrome 50.0.2661.102'),
(211, 1, '::1', 1491383776, 'Windows 10 Chrome 50.0.2661.102'),
(212, 1, '::1', 1492064939, 'Windows 10 Chrome 50.0.2661.102'),
(213, 1, '::1', 1492150632, 'Windows 10 Chrome 50.0.2661.102'),
(214, 1, '::1', 1492507147, 'Windows 10 Chrome 50.0.2661.102'),
(215, 1, '::1', 1493025461, 'Windows 10 Chrome 50.0.2661.102'),
(216, 1, '::1', 1493107038, 'Windows 10 Chrome 50.0.2661.102'),
(217, 1, '::1', 1493190105, 'Windows 10 Chrome 50.0.2661.102'),
(218, 1, '192.168.1.80', 1495415999, 'Windows 7 Chrome 47.0.2526.73'),
(219, 1, '192.168.1.80', 1495548925, 'Windows 7 Chrome 47.0.2526.73'),
(220, 1, '127.0.0.1', 1369035843, 'Windows 7 Chrome 47.0.2526.73'),
(221, 1, '192.168.1.80', 1369047621, 'Windows 7 Chrome 47.0.2526.73'),
(222, 1, '192.168.1.80', 1495624827, 'Windows 7 Chrome 47.0.2526.73'),
(223, 1, '192.168.1.80', 1495709663, 'Windows 7 Chrome 47.0.2526.73'),
(224, 1, '192.168.1.80', 1495762144, 'Windows 7 Chrome 47.0.2526.73'),
(225, 1, '127.0.0.1', 1495861982, 'Windows 7 Chrome 47.0.2526.73'),
(226, 1, '192.168.1.80', 1496141388, 'Windows 7 Chrome 47.0.2526.73'),
(227, 1, '192.168.1.80', 1496221581, 'Windows 7 Chrome 47.0.2526.73'),
(228, 1, '192.168.1.80', 1496309105, 'Windows 7 Chrome 47.0.2526.73'),
(229, 1, '192.168.1.80', 1496358389, 'Windows 7 Chrome 47.0.2526.73'),
(230, 1, '192.168.1.80', 1496497225, 'Windows 7 Chrome 47.0.2526.73'),
(231, 1, '192.168.1.80', 1496538779, 'Windows 7 Chrome 47.0.2526.73'),
(232, 1, '192.168.1.80', 1496669151, 'Windows 7 Chrome 47.0.2526.73'),
(233, 1, '192.168.1.80', 1496713191, 'Windows 7 Chrome 47.0.2526.73'),
(234, 1, '58.217.180.216', 1496726215, 'Windows 7 Chrome 47.0.2526.73'),
(235, 1, '58.217.250.144', 1496811087, 'Windows 7 Chrome 47.0.2526.73'),
(236, 1, '61.154.16.244', 1496810993, 'Windows 10 Chrome 50.0.2661.102'),
(237, 1, '61.154.16.244', 1496914607, 'Windows 10 Chrome 50.0.2661.102'),
(238, 1, '112.5.237.9', 1496974240, 'Windows 7 Chrome 50.0.2661.102'),
(239, 1, '61.154.16.244', 1497063312, 'Windows 10 Chrome 50.0.2661.102'),
(240, 1, '112.5.237.9', 1497063467, 'Windows 7 Chrome 50.0.2661.102'),
(241, 1, '61.154.16.244', 1497149823, 'Windows 10 Chrome 50.0.2661.102'),
(242, 1, '124.72.27.106', 1497192488, 'Windows 10 Chrome 45.0.2454.101'),
(243, 1, '220.200.1.239', 1497211982, 'Apple iPhone Safari 602.1'),
(244, 1, '58.217.250.144', 1497233845, 'Windows 7 Chrome 47.0.2526.73'),
(245, 1, '120.40.97.115', 1497248336, 'Windows 10 Chrome 50.0.2661.102'),
(246, 1, '58.217.232.152', 1497342816, 'Windows 7 Chrome 47.0.2526.73'),
(247, 1, '120.40.97.115', 1497430426, 'Windows 10 Chrome 50.0.2661.102'),
(248, 1, '192.168.1.80', 1497777921, 'Windows 7 Chrome 47.0.2526.73'),
(249, 1, '192.168.1.80', 1497841741, 'Windows 7 Chrome 47.0.2526.73'),
(250, 1, '192.168.1.80', 1497920685, 'Windows 7 Chrome 47.0.2526.73'),
(251, 1, '192.168.1.80', 1498049194, 'Windows 7 Chrome 47.0.2526.73'),
(252, 1, '192.168.1.80', 1498133465, 'Windows 7 Chrome 47.0.2526.73'),
(253, 1, '192.168.1.80', 1498199183, 'Windows 7 Chrome 47.0.2526.73'),
(254, 1, '192.168.1.80', 1498300796, 'Windows 7 Chrome 47.0.2526.73'),
(255, 1, '58.217.245.118', 1498443959, 'Windows 7 Chrome 47.0.2526.73'),
(256, 1, '220.249.190.25', 1498447688, 'Windows 10 Chrome 50.0.2661.102'),
(257, 1, '61.154.16.95', 1498459073, 'Windows 10 Chrome 50.0.2661.102'),
(258, 1, '61.154.16.95', 1498539941, 'Windows 10 Chrome 50.0.2661.102'),
(259, 1, '58.217.233.173', 1498629456, 'Windows 7 Chrome 47.0.2526.73'),
(260, 1, '61.154.16.95', 1498700770, 'Windows 10 Chrome 50.0.2661.102'),
(261, 1, '61.154.16.95', 1498785784, 'Windows 10 Chrome 50.0.2661.102'),
(262, 1, '220.200.1.90', 1503141360, 'Windows 7 Chrome 45.0.2454.101'),
(263, 1, '220.200.1.90', 1503220800, 'Windows 7 Chrome 45.0.2454.101'),
(264, 1, '117.25.52.20', 1505460770, 'Windows 10 Chrome 50.0.2661.102'),
(265, 1, '220.200.1.90', 1505464501, 'Windows 7 Chrome 49.0.2623.75'),
(266, 1, '220.200.1.90', 1505526339, 'Windows 7 Chrome 49.0.2623.75'),
(267, 1, '220.200.1.90', 1505614048, 'Windows 7 Chrome 49.0.2623.75'),
(268, 1, '117.25.52.20', 1505721493, 'Windows 10 Chrome 50.0.2661.102'),
(269, 1, '220.200.1.90', 1505723185, 'Windows 7 Chrome 49.0.2623.75');

-- --------------------------------------------------------

--
-- 表的结构 `rs_admin_menu`
--

CREATE TABLE IF NOT EXISTS `rs_admin_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(20) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表' AUTO_INCREMENT=3081 ;

--
-- 转存表中的数据 `rs_admin_menu`
--

INSERT INTO `rs_admin_menu` (`id`, `pid`, `name`, `uri`, `url`, `mark`, `hidden`, `displayorder`, `icon`) VALUES
(1, 0, '首页', '/', NULL, '', 0, 0, 'icon-home'),
(2, 0, '系统', '/', NULL, 'top_system', 0, 0, 'icon-cog'),
(3, 0, '网站', '/', NULL, 'top_site', 0, 0, 'icon-globe'),
(4, 0, '会员', '/', NULL, 'top_member', 0, 0, 'icon-user'),
(1550, 1549, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(6, 1, '我的面板', '/', NULL, '', 0, 0, 'icon-home'),
(7, 6, '后台首页', 'admin/home/main', '', '', 0, 0, 'icon-home'),
(8, 2, '系统功能', '/', NULL, '', 0, 0, 'fa fa-cog'),
(1546, 1545, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(10, 2, '角色权限', '/', NULL, '', 0, 0, 'fa fa-users'),
(1479, 1477, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(13, 10, '角色管理', 'admin/role/index', '', '', 0, 0, 'icon-group'),
(14, 10, '管理员管理', 'admin/root/index', '', '', 0, 0, 'icon-user'),
(15, 3, '网站功能', '/', NULL, '', 0, 0, 'fa fa-cog'),
(1412, 1411, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1400, 155, '文章发布', 'news/admin/home/add', '', NULL, 0, 1, ''),
(25, 4, '会员管理', '/', NULL, '', 0, 1, 'fa fa-user'),
(26, 25, '会员列表', 'member/admin/home/index', '', '', 0, 0, 'icon-user'),
(27, 25, '会员模型', 'member/admin/group/index', '', '', 0, 0, 'icon-group'),
(1404, 1403, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1532, 1529, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1534, 1533, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1531, 1529, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1395, 15, '友情链接', 'admin/navigator/index/type=4', '', NULL, 0, 0, 'icon-link'),
(39, 25, '会员权限', 'member/admin/setting/permission', '', '', 0, 7, 'icon-group'),
(1539, 1537, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(61, 8, '邮件系统', 'admin/mail/index', '', '', 0, 2, 'icon-envelope'),
(63, 8, '系统配置', 'admin/system/index', '', '', 0, 1, 'icon-cog'),
(1480, 1477, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1538, 1537, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1530, 1529, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1527, 1525, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1528, 1525, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1526, 1525, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1397, 1396, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(79, 6, '资料修改', 'admin/root/my', '', '', 0, 0, 'icon-user-md'),
(1548, 1545, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1398, 1396, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1399, 1396, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(90, 8, '短信系统', 'admin/sms/index', '', '', 0, 2, 'icon-envelope-alt'),
(1535, 1533, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1536, 1533, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(93, 6, '登录日志', 'admin/root/log', '', '', 0, 0, 'icon-save'),
(1424, 1423, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1417, 1415, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1416, 1415, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(98, 6, '更新数据', 'admin/home/clear', '', '', 0, 0, 'icon-trash'),
(99, 6, '更新全站', 'admin/home/cache', '', '', 0, 0, 'icon-refresh'),
(1482, 1481, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1483, 1481, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(257, 256, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(259, 258, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(1547, 1545, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1544, 1541, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1540, 1537, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1542, 1541, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1543, 1541, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(113, 4, '财务管理', '/', NULL, '', 0, 2, 'fa fa-cc-visa'),
(116, 113, '网银配置', 'member/admin/setting/pay', '', '', 0, 0, 'icon-jpy'),
(1392, 1391, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(125, 8, '系统提醒', 'admin/notice/index', '', '', 0, 1, 'fa fa-volume-down'),
(126, 113, '财务流水', 'member/admin/pay/index', '', '', 0, 0, 'fa fa-calculator'),
(1420, 1419, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1418, 1415, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(154, 0, '新闻', '', NULL, 'module-news', 0, 0, 'icon-tasks'),
(155, 154, '新闻管理', '', NULL, 'module-news', 0, 0, 'icon-table'),
(156, 155, '文章管理', 'news/admin/home/index', '', 'module-news', 0, 0, 'icon-th-large'),
(1478, 1477, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(158, 155, '草稿箱', 'news/admin/home/draft', '', 'module-news', 0, 3, 'icon-edit'),
(159, 155, '栏目分类', 'news/admin/category/index', NULL, 'module-news', 0, 4, 'icon-list'),
(1467, 1464, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1470, 1469, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1471, 1469, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1472, 1469, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1474, 1473, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1475, 1473, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1476, 1473, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1524, 1521, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1523, 1521, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1522, 1521, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1520, 1517, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1519, 1517, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(175, 0, '订单', '', NULL, 'module-order', 0, 0, 'icon-shopping-cart'),
(176, 175, '订单管理', '', NULL, 'module-order', 0, 0, 'icon-shopping-cart'),
(177, 176, '全部', 'order/admin/home/index', NULL, 'module-order', 0, 0, 'icon-shopping-cart'),
(178, 176, '待付款', 'order/admin/home/fk', NULL, 'module-order', 0, 0, 'icon-jpy'),
(179, 176, '待发货', 'order/admin/home/fh', NULL, 'module-order', 0, 0, 'fa fa-truck'),
(180, 176, '交易完成', 'order/admin/home/wc', NULL, 'module-order', 0, 0, 'fa fa-check-circle-o'),
(181, 176, '交易关闭', 'order/admin/home/close', NULL, 'module-order', 0, 0, 'fa fa-frown-o'),
(1466, 1464, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1465, 1464, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(184, 175, '订单配置', '', NULL, 'module-order', 0, 0, 'icon-cog'),
(1468, 15, '网站管理', 'admin/site/config/id=1', NULL, NULL, 0, 0, 'icon-globe'),
(186, 184, '付款方式', 'order/admin/mconfig/paytype', NULL, 'module-order', 0, 0, 'icon-jpy'),
(1518, 1517, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1516, 1513, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1515, 1513, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1514, 1513, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(191, 0, '商城', '', NULL, 'module-shop', 0, 0, 'icon-shopping-cart'),
(192, 191, '商品管理', '', NULL, 'module-shop', 0, 0, 'icon-shopping-cart'),
(193, 192, '商品管理', 'shop/admin/home/index', '', 'module-shop', 0, 1, 'icon-th-large'),
(194, 192, '草稿箱', 'shop/admin/home/draft', '', 'module-shop', 0, 5, 'icon-edit'),
(195, 192, '栏目分类', 'shop/admin/category/index', NULL, 'module-shop', 0, 9, 'icon-list'),
(1408, 1407, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1409, 1407, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(198, 191, '商品评论', '', NULL, 'module-shop', 0, 0, 'icon-shopping-cart'),
(199, 198, '评论设置', 'shop/admin/comment/config', NULL, 'module-shop', 0, 0, 'icon-cogs'),
(200, 198, '评论管理', 'shop/admin/comment/index', NULL, 'module-shop', 0, 0, 'icon-comments'),
(1502, 1501, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1503, 1501, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1504, 1501, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1506, 1505, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1507, 1505, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1508, 1505, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1512, 1509, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1511, 1509, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1510, 1509, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1452, 1451, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1453, 1451, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1454, 1451, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1456, 1455, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1457, 1455, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1458, 1455, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1460, 1459, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1461, 1459, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1462, 1459, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1500, 1497, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1499, 1497, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1434, 1431, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1436, 1435, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1437, 1435, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1438, 1435, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1440, 1439, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1441, 1439, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1442, 1439, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1444, 1443, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1445, 1443, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1446, 1443, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1448, 1447, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1449, 1447, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1450, 1447, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(253, 15, '广告管理', 'adm/admin/poster/index', '', 'app-adm', 0, 0, 'icon-eye-open'),
(3079, 3, '表单内容', '', NULL, 'form', 0, 4, 'fa fa-table'),
(261, 260, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(263, 262, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(265, 264, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(267, 266, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(269, 268, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(271, 270, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(273, 272, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(275, 274, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(277, 276, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(279, 278, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(281, 280, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(283, 282, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(285, 284, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(287, 286, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(289, 288, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(291, 290, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(293, 292, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(295, 294, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(297, 296, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(299, 298, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(301, 300, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(303, 302, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(305, 304, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(307, 306, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(309, 308, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(311, 310, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(313, 312, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(315, 314, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(317, 316, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(319, 318, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(321, 320, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(453, 452, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(324, 323, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(326, 325, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(1016, 1014, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1107, 1106, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1105, 1102, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1104, 1102, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1103, 1102, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1101, 1098, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1100, 1098, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1099, 1098, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1097, 1094, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1096, 1094, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1095, 1094, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1093, 1090, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1092, 1090, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1091, 1090, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1089, 1086, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1088, 1086, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1087, 1086, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(349, 329, '友情链接管理', 'links/admin/form_links/index', '', 'module-links-3', 0, 0, 'fa fa-link'),
(351, 350, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(353, 352, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(355, 354, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(357, 356, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(359, 358, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(361, 360, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(363, 362, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(365, 364, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(367, 366, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(369, 368, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(371, 370, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(373, 372, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(375, 374, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(377, 376, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(379, 378, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(381, 380, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(383, 382, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(385, 384, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(387, 386, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(389, 388, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(391, 390, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(393, 392, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(395, 394, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(397, 396, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(399, 398, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(401, 400, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(403, 402, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(405, 404, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(407, 406, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(409, 408, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(411, 410, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(413, 412, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(415, 414, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(417, 416, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(419, 418, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(421, 420, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(423, 422, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(425, 424, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(427, 426, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(429, 428, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(431, 430, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(433, 432, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(435, 434, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(437, 436, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(439, 438, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(441, 440, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(443, 442, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(445, 444, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(447, 446, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(449, 448, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(451, 450, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(455, 454, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(457, 456, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(459, 458, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(460, 0, '在线咨询', '', NULL, 'module-answer', 0, 0, 'icon-table'),
(461, 460, '咨询管理', '', NULL, 'module-answer', 0, 0, 'icon-table'),
(462, 461, '已通过提问', 'answer/admin/home/index', '', 'module-answer', 0, 0, 'icon-th-large'),
(463, 461, '待审核提问', 'answer/admin/home/verify', '', 'module-answer', 0, 0, 'icon-retweet'),
(464, 461, '我的草稿箱', 'answer/admin/home/draft', NULL, 'module-answer', 0, 0, 'icon-edit'),
(465, 461, '栏目分类', 'answer/admin/category/index', NULL, 'module-answer', 0, 0, 'icon-list'),
(1432, 1431, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1433, 1431, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(468, 460, '咨询评论', '', NULL, 'module-answer', 0, 0, 'icon-tasks'),
(469, 468, '评论设置', 'answer/admin/comment/config', NULL, 'module-answer', 0, 0, 'icon-cogs'),
(470, 468, '评论管理', 'answer/admin/comment/index', NULL, 'module-answer', 0, 0, 'icon-comments'),
(1498, 1497, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1496, 1493, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1495, 1493, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1494, 1493, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1492, 1489, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1491, 1489, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1490, 1489, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1488, 1485, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(482, 481, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(484, 483, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(557, 556, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(487, 486, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(489, 488, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(491, 490, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(541, 540, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(543, 542, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(545, 544, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(547, 546, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(549, 548, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(551, 550, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(514, 513, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(537, 536, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(539, 538, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(553, 552, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(555, 554, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(559, 558, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(561, 560, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(563, 562, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(565, 564, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(567, 566, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(569, 568, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(571, 570, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(573, 572, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(575, 574, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(577, 576, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(579, 578, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(581, 580, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(583, 582, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(585, 584, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(587, 586, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(589, 588, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(591, 590, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(593, 592, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(595, 594, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(597, 596, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(988, 986, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(987, 986, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(985, 983, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(984, 983, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(982, 980, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(981, 980, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(979, 977, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(978, 977, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(976, 974, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(975, 974, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(973, 971, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(972, 971, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(970, 968, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(969, 968, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(967, 965, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(966, 965, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(964, 962, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(963, 962, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(620, 619, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(622, 621, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(624, 623, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(626, 625, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(628, 627, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(630, 629, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(632, 631, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(634, 633, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(636, 635, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(637, 25, '实名认证', 'auth/admin/auth/index', '', 'app-auth', 0, 0, 'icon-user'),
(639, 638, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(641, 640, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(643, 642, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(645, 644, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(647, 646, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(649, 648, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(651, 650, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(653, 652, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(655, 654, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(657, 656, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(659, 658, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(661, 660, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(663, 662, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(665, 664, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(667, 666, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(669, 668, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(671, 670, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(673, 672, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(2558, 2557, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2556, 2553, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1405, 1403, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1402, 675, '视频设置', 'video/admin/category/edit/id=1', '', NULL, 1, 0, ''),
(2554, 2553, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1406, 1403, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1401, 192, '商品发布', 'shop/admin/home/add', '', NULL, 0, 2, ''),
(1410, 1407, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1413, 1411, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1414, 1411, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1421, 1419, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1422, 1419, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1425, 1423, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1426, 1423, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1428, 1427, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1429, 1427, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1430, 1427, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1394, 1391, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1393, 1391, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1487, 1485, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1486, 1485, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1484, 1481, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(703, 702, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(705, 704, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(707, 706, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(709, 708, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(711, 710, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(713, 712, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(715, 714, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(717, 716, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(719, 718, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(721, 720, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(723, 722, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(725, 724, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(727, 726, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(729, 728, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(731, 730, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(733, 732, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(735, 734, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(737, 736, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(739, 738, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(741, 740, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(743, 742, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(745, 744, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(747, 746, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(749, 748, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(751, 750, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(753, 752, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(755, 754, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(757, 756, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(759, 758, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(761, 760, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(763, 762, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(765, 764, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(767, 766, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(769, 768, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(771, 770, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(773, 772, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(775, 774, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(777, 776, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(779, 778, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(781, 780, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(783, 782, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(785, 784, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(787, 786, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(789, 788, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(791, 790, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(793, 792, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(795, 794, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(797, 796, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(799, 798, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(801, 800, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(803, 802, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(805, 804, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(807, 806, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(809, 808, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(811, 810, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(813, 812, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(815, 814, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(817, 816, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(819, 818, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(821, 820, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(823, 822, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(825, 824, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(827, 826, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(829, 828, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(831, 830, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(833, 832, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(835, 834, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(837, 836, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(839, 838, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(841, 840, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(843, 842, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(845, 844, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(847, 846, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(849, 848, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(851, 850, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(853, 852, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(855, 854, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(857, 856, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(859, 858, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(861, 860, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(863, 862, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(865, 864, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(867, 866, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(869, 868, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(871, 870, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(873, 872, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(875, 874, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(877, 876, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(879, 878, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(881, 880, '在线记账', 'admin/form_zxjz/index', NULL, 'site-from', 0, 0, 'sticky-note-o'),
(883, 882, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(885, 884, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(887, 886, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(889, 888, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(891, 890, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(893, 892, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(895, 894, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(897, 896, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(899, 898, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(901, 900, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(903, 902, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(905, 904, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(907, 906, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(909, 908, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(911, 910, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(913, 912, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(915, 914, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(917, 916, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(919, 918, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(921, 920, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(923, 922, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(925, 924, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(927, 926, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(929, 928, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(931, 930, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(933, 932, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(935, 934, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(937, 936, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(939, 938, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(941, 940, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(943, 942, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(945, 944, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(947, 946, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(949, 948, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(951, 950, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(953, 952, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(955, 954, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(957, 956, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(959, 958, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(961, 960, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'table'),
(1176, 1175, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1015, 1014, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(992, 991, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(993, 991, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(995, 994, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(996, 994, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(997, 994, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(999, 998, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1000, 998, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1001, 998, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1003, 1002, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1004, 1002, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1005, 1002, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1007, 1006, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1008, 1006, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1009, 1006, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1011, 1010, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1012, 1010, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1013, 1010, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1017, 1014, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1019, 1018, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1020, 1018, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1021, 1018, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1023, 1022, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1024, 1022, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1025, 1022, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1027, 1026, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1028, 1026, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1029, 1026, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1031, 1030, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1032, 1030, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1033, 1030, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1035, 1034, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1036, 1034, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1037, 1034, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1039, 1038, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1040, 1038, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1041, 1038, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1043, 1042, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1044, 1042, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1045, 1042, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1047, 1046, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1048, 1046, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table');
INSERT INTO `rs_admin_menu` (`id`, `pid`, `name`, `uri`, `url`, `mark`, `hidden`, `displayorder`, `icon`) VALUES
(1049, 1046, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1051, 1050, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1052, 1050, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1053, 1050, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1055, 1054, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1056, 1054, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1057, 1054, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1059, 1058, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1060, 1058, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1061, 1058, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1063, 1062, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1064, 1062, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1065, 1062, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1067, 1066, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1068, 1066, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1069, 1066, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1071, 1070, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1072, 1070, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1073, 1070, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1075, 1074, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1076, 1074, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1077, 1074, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1079, 1078, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1080, 1078, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1081, 1078, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1083, 1082, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1084, 1082, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1085, 1082, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1108, 1106, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1109, 1106, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1111, 1110, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1112, 1110, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1113, 1110, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1115, 1114, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1116, 1114, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1117, 1114, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1145, 1143, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1144, 1143, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1142, 1139, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1141, 1139, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1140, 1139, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1124, 1123, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1125, 1123, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1126, 1123, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1128, 1127, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1129, 1127, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1130, 1127, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1132, 1131, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1133, 1131, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1134, 1131, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1136, 1135, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1137, 1135, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1138, 1135, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1146, 1143, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1148, 1147, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1149, 1147, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1150, 1147, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1152, 1151, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1153, 1151, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1154, 1151, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1156, 1155, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1157, 1155, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1158, 1155, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1160, 1159, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1161, 1159, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1162, 1159, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1164, 1163, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1165, 1163, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1166, 1163, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1168, 1167, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1169, 1167, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1170, 1167, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1172, 1171, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1173, 1171, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1174, 1171, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1177, 1175, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1178, 1175, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1180, 1179, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1181, 1179, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1182, 1179, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1184, 1183, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1185, 1183, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1186, 1183, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1188, 1187, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1189, 1187, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1190, 1187, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1192, 1191, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1193, 1191, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1194, 1191, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1196, 1195, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1197, 1195, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1198, 1195, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1200, 1199, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1201, 1199, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1202, 1199, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1204, 1203, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1205, 1203, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1206, 1203, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1208, 1207, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1209, 1207, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1210, 1207, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1212, 1211, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1213, 1211, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1214, 1211, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1216, 1215, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1217, 1215, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1218, 1215, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1220, 1219, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1221, 1219, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1222, 1219, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1224, 1223, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1225, 1223, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1226, 1223, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1228, 1227, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1229, 1227, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1230, 1227, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1232, 1231, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1233, 1231, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1234, 1231, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1236, 1235, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1237, 1235, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1238, 1235, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1240, 1239, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1241, 1239, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1242, 1239, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1244, 1243, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1245, 1243, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1246, 1243, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1248, 1247, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1249, 1247, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1250, 1247, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1252, 1251, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1253, 1251, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1254, 1251, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1256, 1255, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1257, 1255, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1258, 1255, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1260, 1259, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1261, 1259, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1262, 1259, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1264, 1263, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1265, 1263, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1266, 1263, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1268, 1267, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1269, 1267, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1270, 1267, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1272, 1271, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1273, 1271, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1274, 1271, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1276, 1275, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1277, 1275, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1278, 1275, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1280, 1279, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1281, 1279, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1282, 1279, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1284, 1283, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1285, 1283, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1286, 1283, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1288, 1287, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1289, 1287, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1290, 1287, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1292, 1291, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1293, 1291, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1294, 1291, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1296, 1295, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1297, 1295, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1298, 1295, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1300, 1299, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1301, 1299, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1302, 1299, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1304, 1303, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1305, 1303, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1306, 1303, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1308, 1307, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1309, 1307, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1310, 1307, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1312, 1311, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1313, 1311, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1314, 1311, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1316, 1315, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1317, 1315, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1318, 1315, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1320, 1319, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1321, 1319, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1322, 1319, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1324, 1323, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1325, 1323, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1326, 1323, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1328, 1327, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1329, 1327, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1330, 1327, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1332, 1331, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1333, 1331, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1334, 1331, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1336, 1335, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1337, 1335, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1338, 1335, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1340, 1339, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1341, 1339, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1342, 1339, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1344, 1343, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1345, 1343, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1346, 1343, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1348, 1347, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1349, 1347, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1350, 1347, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1352, 1351, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1353, 1351, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1354, 1351, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1356, 1355, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1357, 1355, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1358, 1355, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1360, 1359, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1361, 1359, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1362, 1359, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1364, 1363, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1365, 1363, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1366, 1363, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1368, 1367, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1369, 1367, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1370, 1367, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1372, 1371, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1373, 1371, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1374, 1371, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1376, 1375, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1377, 1375, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1378, 1375, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1380, 1379, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1381, 1379, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1382, 1379, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1384, 1383, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1385, 1383, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1386, 1383, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1388, 1387, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1389, 1387, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1390, 1387, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1551, 1549, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1552, 1549, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1554, 1553, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1555, 1553, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1556, 1553, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1558, 1557, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1559, 1557, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1560, 1557, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1562, 1561, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1563, 1561, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1564, 1561, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1566, 1565, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1567, 1565, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1568, 1565, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1570, 1569, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1571, 1569, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1572, 1569, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1574, 1573, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1575, 1573, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1576, 1573, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1578, 1577, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1579, 1577, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1580, 1577, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1582, 1581, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1583, 1581, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1584, 1581, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1586, 1585, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1587, 1585, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1588, 1585, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1590, 1589, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1591, 1589, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1592, 1589, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1594, 1593, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1595, 1593, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1596, 1593, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1598, 1597, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1599, 1597, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1600, 1597, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1602, 1601, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1603, 1601, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1604, 1601, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1606, 1605, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1607, 1605, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1608, 1605, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1610, 1609, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1611, 1609, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1612, 1609, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1614, 1613, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1615, 1613, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1616, 1613, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1618, 1617, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1619, 1617, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1620, 1617, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1622, 1621, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1623, 1621, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1624, 1621, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1626, 1625, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1627, 1625, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1628, 1625, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1630, 1629, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1631, 1629, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1632, 1629, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1634, 1633, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1635, 1633, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1636, 1633, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1638, 1637, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1639, 1637, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1640, 1637, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1642, 1641, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1643, 1641, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1644, 1641, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1646, 1645, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1647, 1645, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1648, 1645, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1650, 1649, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1651, 1649, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1652, 1649, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1654, 1653, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1655, 1653, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1656, 1653, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1658, 1657, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1659, 1657, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1660, 1657, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1662, 1661, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1663, 1661, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1664, 1661, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1666, 1665, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1667, 1665, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1668, 1665, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1670, 1669, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1671, 1669, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1672, 1669, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1674, 1673, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1675, 1673, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1676, 1673, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1678, 1677, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1679, 1677, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1680, 1677, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1682, 1681, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1683, 1681, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1684, 1681, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1686, 1685, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1687, 1685, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1688, 1685, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1690, 1689, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1691, 1689, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1692, 1689, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1694, 1693, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1695, 1693, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1696, 1693, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1698, 1697, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1699, 1697, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1700, 1697, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1702, 1701, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1703, 1701, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1704, 1701, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1706, 1705, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1707, 1705, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1708, 1705, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1710, 1709, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1711, 1709, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1712, 1709, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1714, 1713, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1715, 1713, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1716, 1713, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1718, 1717, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1719, 1717, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1720, 1717, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1722, 1721, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1723, 1721, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1724, 1721, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1726, 1725, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1727, 1725, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1728, 1725, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1730, 1729, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1731, 1729, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1732, 1729, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1734, 1733, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1735, 1733, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1736, 1733, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1738, 1737, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1739, 1737, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1740, 1737, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1742, 1741, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1743, 1741, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1744, 1741, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1746, 1745, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1747, 1745, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1748, 1745, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1750, 1749, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1751, 1749, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1752, 1749, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1754, 1753, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1755, 1753, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1756, 1753, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1758, 1757, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1759, 1757, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1760, 1757, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1762, 1761, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1763, 1761, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1764, 1761, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1766, 1765, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1767, 1765, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1768, 1765, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1770, 1769, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1771, 1769, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1772, 1769, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1774, 1773, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1775, 1773, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1776, 1773, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1778, 1777, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1779, 1777, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1780, 1777, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1782, 1781, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1783, 1781, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1784, 1781, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1786, 1785, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1787, 1785, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1788, 1785, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1790, 1789, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1791, 1789, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1792, 1789, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1794, 1793, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1795, 1793, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1796, 1793, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1798, 1797, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1799, 1797, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1800, 1797, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1802, 1801, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1803, 1801, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1804, 1801, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1806, 1805, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1807, 1805, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1808, 1805, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1810, 1809, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1811, 1809, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1812, 1809, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1814, 1813, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1815, 1813, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1816, 1813, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1818, 1817, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1819, 1817, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1820, 1817, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1822, 1821, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1823, 1821, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1824, 1821, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1826, 1825, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1827, 1825, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1828, 1825, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1830, 1829, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1831, 1829, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1832, 1829, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1834, 1833, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1835, 1833, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1836, 1833, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1838, 1837, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1839, 1837, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1840, 1837, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1842, 1841, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1843, 1841, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1844, 1841, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1846, 1845, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1847, 1845, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1848, 1845, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1850, 1849, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1851, 1849, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1852, 1849, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1854, 1853, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1855, 1853, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1856, 1853, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1858, 1857, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1859, 1857, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1860, 1857, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1862, 1861, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1863, 1861, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1864, 1861, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1866, 1865, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1867, 1865, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1868, 1865, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1870, 1869, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1871, 1869, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1872, 1869, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1874, 1873, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1875, 1873, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1876, 1873, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1878, 1877, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1879, 1877, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1880, 1877, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1882, 1881, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1883, 1881, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1884, 1881, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1886, 1885, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1887, 1885, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1888, 1885, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1890, 1889, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1891, 1889, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1892, 1889, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1894, 1893, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1895, 1893, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1896, 1893, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1898, 1897, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1899, 1897, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1900, 1897, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1902, 1901, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1903, 1901, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1904, 1901, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1906, 1905, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1907, 1905, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1908, 1905, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1910, 1909, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1911, 1909, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1912, 1909, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1914, 1913, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1915, 1913, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1916, 1913, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1918, 1917, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1919, 1917, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1920, 1917, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1922, 1921, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1923, 1921, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1924, 1921, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1926, 1925, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1927, 1925, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1928, 1925, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1930, 1929, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1931, 1929, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1932, 1929, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1934, 1933, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1935, 1933, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table');
INSERT INTO `rs_admin_menu` (`id`, `pid`, `name`, `uri`, `url`, `mark`, `hidden`, `displayorder`, `icon`) VALUES
(1936, 1933, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1938, 1937, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1939, 1937, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1940, 1937, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1942, 1941, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1943, 1941, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1944, 1941, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1946, 1945, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1947, 1945, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1948, 1945, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1950, 1949, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1951, 1949, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1952, 1949, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1954, 1953, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1955, 1953, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1956, 1953, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1958, 1957, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1959, 1957, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1960, 1957, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1962, 1961, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1963, 1961, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1964, 1961, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1978, 1977, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1966, 1965, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1967, 1965, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1968, 1965, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1970, 1969, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1971, 1969, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1972, 1969, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1974, 1973, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1975, 1973, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1976, 1973, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1979, 1977, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1980, 1977, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1982, 1981, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1983, 1981, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1984, 1981, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1986, 1985, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1987, 1985, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1988, 1985, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1990, 1989, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1991, 1989, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1992, 1989, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1994, 1993, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1995, 1993, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1996, 1993, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1998, 1997, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(1999, 1997, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2000, 1997, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2002, 2001, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2003, 2001, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2004, 2001, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2006, 2005, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2007, 2005, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2008, 2005, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2010, 2009, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2011, 2009, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2012, 2009, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2014, 2013, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2015, 2013, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2016, 2013, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2018, 2017, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2019, 2017, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2020, 2017, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2022, 2021, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2023, 2021, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2024, 2021, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2026, 2025, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2027, 2025, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2028, 2025, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2030, 2029, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2031, 2029, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2032, 2029, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2034, 2033, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2035, 2033, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2036, 2033, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2038, 2037, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2039, 2037, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2040, 2037, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2042, 2041, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2043, 2041, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2044, 2041, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2046, 2045, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2047, 2045, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2048, 2045, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2050, 2049, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2051, 2049, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2052, 2049, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2054, 2053, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2055, 2053, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2056, 2053, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2058, 2057, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2059, 2057, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2060, 2057, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2062, 2061, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2063, 2061, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2064, 2061, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2066, 2065, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2067, 2065, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2068, 2065, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2070, 2069, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2071, 2069, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2072, 2069, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2074, 2073, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2075, 2073, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2076, 2073, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2078, 2077, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2079, 2077, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2080, 2077, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2082, 2081, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2083, 2081, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2084, 2081, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2086, 2085, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2087, 2085, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2088, 2085, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2090, 2089, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2091, 2089, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2092, 2089, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2094, 2093, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2095, 2093, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2096, 2093, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2098, 2097, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2099, 2097, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2100, 2097, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2102, 2101, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2103, 2101, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2104, 2101, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2106, 2105, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2107, 2105, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2108, 2105, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2110, 2109, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2111, 2109, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2112, 2109, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2114, 2113, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2115, 2113, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2116, 2113, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2118, 2117, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2119, 2117, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2120, 2117, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2122, 2121, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2123, 2121, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2124, 2121, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2126, 2125, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2127, 2125, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2128, 2125, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2130, 2129, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2131, 2129, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2132, 2129, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2134, 2133, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2135, 2133, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2136, 2133, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2138, 2137, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2139, 2137, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2140, 2137, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2142, 2141, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2143, 2141, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2144, 2141, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2146, 2145, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2147, 2145, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2148, 2145, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2150, 2149, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2151, 2149, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2152, 2149, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2154, 2153, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2155, 2153, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2156, 2153, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2158, 2157, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2159, 2157, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2160, 2157, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2162, 2161, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2163, 2161, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2164, 2161, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2166, 2165, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2167, 2165, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2168, 2165, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2170, 2169, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2171, 2169, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2172, 2169, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2174, 2173, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2175, 2173, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2176, 2173, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2178, 2177, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2179, 2177, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2180, 2177, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2182, 2181, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2183, 2181, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2184, 2181, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2186, 2185, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2187, 2185, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2188, 2185, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2190, 2189, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2191, 2189, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2192, 2189, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(5, 0, '空间', '/', NULL, 'myspace', 0, 0, 'icon-trello'),
(16, 0, '应用', '/', NULL, 'myapp', 0, 0, 'icon-cloud'),
(9, 2, '系统维护', '/', NULL, '', 0, 0, 'fa fa-database'),
(11, 8, '后台菜单', 'admin/menu/index', '', '', 0, 4, 'icon-list-alt'),
(12, 9, '数据结构', 'admin/db/index', '', '', 0, 0, 'icon-hdd'),
(40, 24, '单页管理', 'admin/page/index', '', '', 0, 0, 'icon-adn'),
(18, 15, '网站配置', 'admin/site/config', '', '', 0, 0, 'icon-cog'),
(19, 8, '网站管理', 'admin/site/index', '', '', 0, 8, 'icon-globe'),
(20, 15, '网站导航', 'admin/navigator/index', '', '', 0, 0, 'icon-map-marker'),
(21, 8, '模块管理', 'admin/module/index', '', '', 0, 9, 'icon-cogs'),
(22, 15, '附件管理', 'admin/attachment/index', '', '', 0, 9, 'icon-folder-close'),
(24, 3, '内容相关', '/', NULL, '', 0, 3, 'fa fa-list-alt'),
(30, 25, '会员设置', 'member/admin/setting/index', '', '', 0, 98, 'icon-cog'),
(32, 4, '模板风格', '/', NULL, '', 0, 4, 'fa fa-file-image-o'),
(33, 25, '自定义字段', 'admin/field/index/rname/member/rid/0', '', '', 0, 99, 'icon-plus-sign-alt'),
(35, 15, '下载镜像', 'admin/downservers/index', '', '', 0, 8, 'icon-thumbs-down'),
(37, 25, '快捷登录', 'member/admin/setting/oauth', '', '', 0, 4, 'icon-weibo'),
(38, 10, '审核流程', 'admin/verify/index', '', '', 0, 0, 'icon-stop'),
(60, 24, '联动菜单', 'admin/linkage/index', '', '', 0, 0, 'icon-windows'),
(65, 9, '系统体检', 'admin/check/index', '', '', 0, 98, 'icon-undo'),
(66, 8, '操作日志', 'admin/system/oplog', '', '', 0, 4, 'icon-save'),
(67, 3, '网站模板', '/', NULL, '', 0, 9, 'fa fa-file-image-o'),
(68, 67, '模板管理', 'admin/tpl/index', '', '', 0, 0, ' icon-folder-close'),
(69, 67, '风格管理', 'admin/theme/index', '', '', 0, 0, 'icon-picture'),
(70, 67, '标签向导', 'admin/tpl/tag', '', '', 0, 0, 'icon-tags'),
(71, 32, '会员模板', 'member/admin/tpl/index', '', '', 0, 0, 'icon-folder-close'),
(72, 32, '会员风格', 'member/admin/theme/index', '', '', 0, 0, 'icon-picture'),
(73, 80, '空间模板', 'space/admin/spacetpl/index', '', '', 0, 99, 'icon-folder-close'),
(74, 80, '空间管理', 'space/admin/space/index', '', '', 0, 1, 'icon-trello'),
(75, 16, '应用中心', '/', NULL, '', 0, 0, 'fa fa-cloud'),
(76, 75, '应用管理', 'admin/application/index', '', '', 0, 0, 'icon-cloud'),
(77, 24, '资料块管理', 'admin/block/index', '', '', 0, 99, 'icon-copy'),
(78, 25, '会员菜单', 'member/admin/menu/index', '', '', 0, 5, 'icon-list-alt'),
(80, 5, '空间黄页', '', '', '', 0, 1, 'fa fa-list-alt'),
(17, 5, '内容管理', '', '', 'space-model', 0, 2, 'fa fa-list-alt'),
(81, 80, '空间模型', 'space/admin/model/index', '', '', 0, 2, 'icon-certificate'),
(82, 24, '表单管理', 'admin/form/index', '', '', 0, 0, 'icon-tasks'),
(88, 80, '空间设置', 'space/admin/setting/space', '', '', 0, 199, 'icon-cog'),
(89, 8, '任务队列', 'admin/cron/index', '', '', 0, 3, 'icon-forward'),
(91, 15, 'URL规则', 'admin/urlrule/index', '', '', 0, 2, 'icon-magnet'),
(92, 80, '自定义字段', 'admin/field/index/rname/spacetable/rid/0', '', '', 0, 200, 'icon-plus-sign-alt'),
(94, 6, '后台菜单', 'admin/menu/index', '', '', 0, 0, 'icon-list-alt'),
(95, 6, '会员菜单', 'member/admin/menu/index', '', '', 0, 0, 'icon-list-alt'),
(96, 6, '应用管理', 'admin/application/index', '', '', 0, 0, 'icon-cloud'),
(97, 6, '模块管理', 'admin/module/index', '', '', 0, 0, 'icon-cogs'),
(100, 6, '系统体检', 'admin/check/index', '', '', 0, 0, 'icon-zoom-out'),
(101, 6, '生成伪静态', 'admin/route/index', '', '', 0, 0, 'icon-compass'),
(102, 80, '默认栏目', 'space/admin/space/init', '', '', 0, 198, 'icon-th'),
(2508, 0, '新闻动态', '', NULL, 'module-xwdt', 0, 0, 'icon-table'),
(2509, 2508, '文档管理', '', NULL, 'module-xwdt', 0, 0, 'icon-table'),
(104, 80, '空间互动', 'space/admin/sns/index', '', '', 0, 3, 'icon-weibo'),
(106, 9, '执行SQL', 'admin/db/sql', '', '', 0, 50, 'icon-magic'),
(107, 15, '远程附件', 'admin/attachment2/index', '', '', 0, 1, 'icon-upload-alt'),
(108, 2, '高级开发', '/', NULL, '', 0, 0, 'fa fa-user-md'),
(109, 108, '全局变量', 'admin/sysvar/index', '', '', 0, 1, 'icon-tumblr'),
(110, 108, '定义控制器', 'admin/syscontroller/index', '', '', 0, 1, 'icon-linux'),
(111, 8, '程序管理', 'admin/upgrade/index', '', '', 0, 98, 'fa fa-plug'),
(123, 8, '分离存储', 'admin/system/file', '', '', 0, 1, 'fa fa-cubes'),
(124, 15, '生成静态', 'admin/html/index', '', '', 0, 1, 'fa fa-file'),
(150, 0, '内容', '/', NULL, 'share', 0, 0, 'fa fa-th-large'),
(151, 150, '内容管理', '/', NULL, 'share-content', 0, 0, 'fa fa-th-large'),
(152, 151, '栏目管理', 'admin/category_share/index', '', '', 0, 0, 'fa fa-list'),
(153, 151, '生成静态', 'admin/html/index', '', '', 0, 0, 'fa fa-file'),
(2194, 2193, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2195, 2193, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2196, 2193, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2198, 2197, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2199, 2197, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2200, 2197, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2202, 2201, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2203, 2201, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2204, 2201, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2206, 2205, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2207, 2205, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2208, 2205, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2210, 2209, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2211, 2209, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2212, 2209, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2214, 2213, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2215, 2213, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2216, 2213, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2218, 2217, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2219, 2217, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2220, 2217, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2222, 2221, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2223, 2221, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2224, 2221, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2226, 2225, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2227, 2225, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2228, 2225, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2230, 2229, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2231, 2229, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2232, 2229, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2234, 2233, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2235, 2233, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2236, 2233, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2238, 2237, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2239, 2237, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2240, 2237, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2242, 2241, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2243, 2241, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2244, 2241, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2246, 2245, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2247, 2245, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2248, 2245, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2250, 2249, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2251, 2249, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2252, 2249, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2254, 2253, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2255, 2253, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2256, 2253, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2258, 2257, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2259, 2257, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2260, 2257, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2262, 2261, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2263, 2261, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2264, 2261, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2266, 2265, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2267, 2265, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2268, 2265, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2270, 2269, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2271, 2269, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2272, 2269, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2274, 2273, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2275, 2273, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2276, 2273, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2278, 2277, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2279, 2277, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2280, 2277, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2282, 2281, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2283, 2281, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2284, 2281, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2286, 2285, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2287, 2285, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2288, 2285, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2290, 2289, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2291, 2289, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2292, 2289, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2294, 2293, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2295, 2293, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2296, 2293, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2298, 2297, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2299, 2297, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2300, 2297, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2302, 2301, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2303, 2301, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2304, 2301, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2306, 2305, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2307, 2305, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2308, 2305, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2310, 2309, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2311, 2309, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2312, 2309, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2314, 2313, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2315, 2313, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2316, 2313, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2318, 2317, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2319, 2317, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2320, 2317, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2322, 2321, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2323, 2321, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2324, 2321, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2326, 2325, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2327, 2325, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2328, 2325, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2330, 2329, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2331, 2329, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2332, 2329, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2334, 2333, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2335, 2333, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2336, 2333, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2337, 2333, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2339, 2338, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2340, 2338, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2341, 2338, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2342, 2338, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2344, 2343, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2345, 2343, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2346, 2343, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2347, 2343, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2349, 2348, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2350, 2348, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2351, 2348, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2352, 2348, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2354, 2353, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2355, 2353, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2356, 2353, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2357, 2353, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2359, 2358, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2360, 2358, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2361, 2358, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2362, 2358, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2364, 2363, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2365, 2363, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2366, 2363, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2367, 2363, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2369, 2368, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2370, 2368, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2371, 2368, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2372, 2368, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2374, 2373, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2375, 2373, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2376, 2373, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2377, 2373, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2379, 2378, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2380, 2378, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2381, 2378, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2382, 2378, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2384, 2383, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2385, 2383, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2386, 2383, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2387, 2383, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2389, 2388, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2390, 2388, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2391, 2388, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2392, 2388, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2394, 2393, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2395, 2393, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2396, 2393, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2397, 2393, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2399, 2398, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2400, 2398, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2401, 2398, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2402, 2398, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2404, 2403, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2405, 2403, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2406, 2403, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2407, 2403, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2409, 2408, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2410, 2408, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2411, 2408, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2412, 2408, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2414, 2413, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2415, 2413, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2416, 2413, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2417, 2413, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2419, 2418, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2420, 2418, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2421, 2418, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2422, 2418, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2424, 2423, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2425, 2423, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2426, 2423, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2427, 2423, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2429, 2428, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2430, 2428, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2431, 2428, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2432, 2428, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2434, 2433, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2435, 2433, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2436, 2433, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2437, 2433, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2439, 2438, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2440, 2438, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2441, 2438, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2442, 2438, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2444, 2443, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2445, 2443, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2446, 2443, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2447, 2443, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2449, 2448, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2450, 2448, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2451, 2448, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2452, 2448, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2454, 2453, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2455, 2453, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2456, 2453, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2457, 2453, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2459, 2458, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2460, 2458, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2461, 2458, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2462, 2458, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2464, 2463, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2465, 2463, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2466, 2463, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2467, 2463, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2469, 2468, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2470, 2468, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2471, 2468, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2472, 2468, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2474, 2473, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2475, 2473, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2476, 2473, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2477, 2473, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2479, 2478, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2480, 2478, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2481, 2478, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2482, 2478, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2484, 2483, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2485, 2483, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2486, 2483, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2487, 2483, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2489, 2488, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2490, 2488, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2491, 2488, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2492, 2488, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2555, 2553, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2494, 2493, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2495, 2493, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2496, 2493, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2497, 2493, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2499, 2498, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2500, 2498, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2501, 2498, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2502, 2498, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2504, 2503, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2505, 2503, '开账申请', 'admin/form_account/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2506, 2503, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2507, 2503, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2510, 2509, '已通过文档', 'xwdt/admin/home/index', NULL, 'module-xwdt', 0, 0, 'icon-th-large'),
(2511, 2509, '待审核文档', 'xwdt/admin/home/verify', NULL, 'module-xwdt', 0, 0, 'icon-retweet'),
(2512, 2509, '我的草稿箱', 'xwdt/admin/home/draft', NULL, 'module-xwdt', 0, 0, 'icon-edit'),
(2513, 2509, '栏目分类', 'xwdt/admin/category/index', NULL, 'module-xwdt', 0, 0, 'icon-list'),
(2514, 2509, 'Tag标签', 'xwdt/admin/tag/index', NULL, 'module-xwdt', 0, 0, 'icon-tags'),
(2515, 2509, '单页管理', 'xwdt/admin/page/index', NULL, 'module-xwdt', 0, 0, 'icon-adn'),
(2516, 2508, '新闻评论', '', NULL, 'module-xwdt', 0, 0, 'icon-tasks'),
(2517, 2516, '评论设置', 'xwdt/admin/comment/config', NULL, 'module-xwdt', 0, 0, 'icon-cogs'),
(2518, 2516, '评论管理', 'xwdt/admin/comment/index', NULL, 'module-xwdt', 0, 0, 'icon-comments'),
(2519, 2516, '自定义字段', 'admin/field/index/rname/comment-module-xwdt/rid/0', NULL, 'module-xwdt', 0, 0, 'icon-plus-sign-alt'),
(2520, 2508, '相关功能', '', NULL, 'module-xwdt', 0, 0, 'fa fa-cog'),
(2521, 2520, '内容维护', 'xwdt/admin/content/index', NULL, 'module-xwdt', 0, 0, 'icon-th-large'),
(2522, 2520, '生成静态', 'xwdt/admin/home/html', NULL, 'module-xwdt', 0, 0, 'icon-html5'),
(2523, 2520, '自定义字段', 'admin/field/index/rname/module/rid/17', NULL, 'module-xwdt', 0, 0, 'icon-plus-sign-alt'),
(2524, 2520, '模块属性配置', 'admin/module/config/id/17', NULL, 'module-xwdt', 0, 0, 'icon-cogs'),
(2525, 2508, '模板风格', '', NULL, 'module-xwdt', 0, 0, 'fa fa-folder'),
(2526, 2525, '模板管理', 'xwdt/admin/tpl/index', NULL, 'module-xwdt', 0, 0, 'icon-folder-close'),
(2527, 2525, '风格管理', 'xwdt/admin/theme/index', NULL, 'module-xwdt', 0, 0, 'icon-picture'),
(2528, 2525, '标签向导', 'xwdt/admin/tpl/tag', NULL, 'module-xwdt', 0, 0, 'icon-tags'),
(2530, 2529, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2531, 2529, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2532, 2529, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2534, 2533, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2535, 2533, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2536, 2533, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2538, 2537, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2539, 2537, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2540, 2537, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2542, 2541, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2543, 2541, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2544, 2541, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2546, 2545, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2547, 2545, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2548, 2545, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2550, 2549, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2551, 2549, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table');
INSERT INTO `rs_admin_menu` (`id`, `pid`, `name`, `uri`, `url`, `mark`, `hidden`, `displayorder`, `icon`) VALUES
(2552, 2549, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2559, 2557, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2560, 2557, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2562, 2561, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2563, 2561, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2564, 2561, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2566, 2565, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2567, 2565, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2568, 2565, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2570, 2569, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2571, 2569, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2572, 2569, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2990, 2989, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2988, 2985, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2987, 2985, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2986, 2985, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2984, 2983, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2982, 2979, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2981, 2979, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2980, 2979, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2978, 2977, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2976, 2973, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2975, 2973, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2974, 2973, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2972, 2971, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2970, 2967, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2969, 2967, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2968, 2967, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2966, 2965, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2964, 2961, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2963, 2961, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2962, 2961, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2616, 2615, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2617, 2615, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2618, 2615, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2620, 2619, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2621, 2619, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2622, 2619, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2624, 2623, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2625, 2623, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2626, 2623, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2628, 2627, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2629, 2627, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2630, 2627, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2632, 2631, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2633, 2631, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2634, 2631, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2636, 2635, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2637, 2635, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2638, 2635, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2640, 2639, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2641, 2639, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2642, 2639, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2644, 2643, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2645, 2643, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2646, 2643, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2648, 2647, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2649, 2647, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2650, 2647, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2652, 2651, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2653, 2651, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2654, 2651, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2656, 2655, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2657, 2655, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2658, 2655, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2660, 2659, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2661, 2659, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2662, 2659, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2664, 2663, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2665, 2663, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2666, 2663, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2668, 2667, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2669, 2667, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2670, 2667, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2672, 2671, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2673, 2671, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2674, 2671, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2676, 2675, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2677, 2675, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2678, 2675, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2680, 2679, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2681, 2679, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2682, 2679, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2684, 2683, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2685, 2683, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2686, 2683, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2688, 2687, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2689, 2687, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2690, 2687, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2692, 2691, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2693, 2691, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2694, 2691, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2696, 2695, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2697, 2695, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2698, 2695, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2700, 2699, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2701, 2699, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2702, 2699, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2704, 2703, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2705, 2703, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2706, 2703, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2708, 2707, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2709, 2707, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2710, 2707, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2712, 2711, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2713, 2711, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2714, 2711, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2716, 2715, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2717, 2715, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2718, 2715, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2720, 2719, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2721, 2719, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2722, 2719, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2724, 2723, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2725, 2723, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2726, 2723, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2728, 2727, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2729, 2727, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2730, 2727, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2732, 2731, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2733, 2731, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2734, 2731, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2736, 2735, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2737, 2735, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2738, 2735, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2740, 2739, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2741, 2739, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2742, 2739, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2744, 2743, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2745, 2743, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2746, 2743, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2748, 2747, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2749, 2747, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2750, 2747, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2752, 2751, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2753, 2751, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2754, 2751, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2756, 2755, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2757, 2755, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2758, 2755, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2760, 2759, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2761, 2759, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2762, 2759, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2764, 2763, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2765, 2763, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2766, 2763, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2768, 2767, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2769, 2767, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2770, 2767, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2772, 2771, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2773, 2771, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2774, 2771, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2776, 2775, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2777, 2775, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2778, 2775, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2780, 2779, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2781, 2779, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2782, 2779, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2784, 2783, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2785, 2783, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2786, 2783, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2788, 2787, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2789, 2787, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2790, 2787, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2792, 2791, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2793, 2791, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2794, 2791, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2796, 2795, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2797, 2795, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2798, 2795, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2800, 2799, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2801, 2799, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2802, 2799, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2804, 2803, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2805, 2803, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2806, 2803, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2808, 2807, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2809, 2807, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2810, 2807, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2812, 2811, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2813, 2811, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2814, 2811, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2816, 2815, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2817, 2815, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2818, 2815, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2820, 2819, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2821, 2819, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2822, 2819, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2824, 2823, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2825, 2823, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2826, 2823, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2828, 2827, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2829, 2827, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2830, 2827, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2832, 2831, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2833, 2831, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2834, 2831, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2836, 2835, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2837, 2835, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2838, 2835, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2840, 2839, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2841, 2839, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2842, 2839, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2844, 2843, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2845, 2843, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2846, 2843, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2848, 2847, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2849, 2847, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2850, 2847, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2852, 2851, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2853, 2851, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2854, 2851, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2856, 2855, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2857, 2855, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2858, 2855, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2860, 2859, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2861, 2859, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2862, 2859, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2864, 2863, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2865, 2863, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2866, 2863, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2868, 2867, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2869, 2867, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2870, 2867, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2872, 2871, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2873, 2871, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2874, 2871, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2876, 2875, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2877, 2875, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2878, 2875, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2880, 2879, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2881, 2879, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2882, 2879, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2884, 2883, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2885, 2883, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2886, 2883, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2888, 2887, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2889, 2887, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2890, 2887, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2892, 2891, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2893, 2891, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2894, 2891, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2896, 2895, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2897, 2895, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2898, 2895, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2900, 2899, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2901, 2899, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2902, 2899, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2904, 2903, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2905, 2903, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2906, 2903, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2908, 2907, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2909, 2907, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2910, 2907, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2912, 2911, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2913, 2911, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2914, 2911, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2916, 2915, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2918, 2917, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2919, 2917, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2920, 2917, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2922, 2921, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2924, 2923, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2926, 2925, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2927, 2925, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2928, 2925, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2930, 2929, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2932, 2931, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2933, 2931, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2934, 2931, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2936, 2935, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2938, 2937, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2939, 2937, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2940, 2937, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2942, 2941, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2944, 2943, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2945, 2943, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2946, 2943, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2948, 2947, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2950, 2949, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2951, 2949, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2952, 2949, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2954, 2953, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2956, 2955, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2957, 2955, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2958, 2955, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2960, 2959, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2992, 2991, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2993, 2991, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2994, 2991, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2996, 2995, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2998, 2997, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(2999, 2997, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3000, 2997, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3002, 3001, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3004, 3003, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3005, 3003, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3006, 3003, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3008, 3007, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3010, 3009, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3011, 3009, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3012, 3009, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3014, 3013, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3015, 3013, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3016, 3013, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3018, 3017, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3019, 3017, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3020, 3017, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3022, 3021, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3024, 3023, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3026, 3025, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3027, 3025, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3028, 3025, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3030, 3029, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3032, 3031, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3033, 3031, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3034, 3031, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3036, 3035, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3038, 3037, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3039, 3037, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3040, 3037, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3042, 3041, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3044, 3043, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3045, 3043, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3046, 3043, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3048, 3047, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3050, 3049, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3051, 3049, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3052, 3049, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3054, 3053, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3056, 3055, '服务商', 'admin/form_service/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3057, 3055, '顾问咨询', 'admin/form_adviser/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3058, 3055, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3060, 3059, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3062, 3061, '操作平台', 'admin/form_caozuopingtai/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3063, 3061, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3065, 3064, '操作平台', 'admin/form_caozuopingtai/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3066, 3064, '登陆T8', 'admin/form_denglut8/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3067, 3064, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3068, 3064, '订单查询', 'admin/form_dingdanchaxun/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3070, 3069, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3072, 3071, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3074, 3073, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3076, 3075, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3078, 3077, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table'),
(3080, 3079, '申请注册', 'admin/form_zhuce/index', NULL, 'site-from', 0, 0, 'fa fa-table');

-- --------------------------------------------------------

--
-- 表的结构 `rs_admin_notice`
--

CREATE TABLE IF NOT EXISTS `rs_admin_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` varchar(20) NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) NOT NULL COMMENT '对应的URI',
  `to_rid` smallint(5) NOT NULL COMMENT '指定角色组',
  `to_uid` int(10) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(10) NOT NULL COMMENT '处理人',
  `username` varchar(100) NOT NULL COMMENT '处理人',
  `updatetime` int(10) NOT NULL COMMENT '处理时间',
  `inputtime` int(10) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `status` (`status`),
  KEY `to_uid` (`to_uid`),
  KEY `to_rid` (`to_rid`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台提醒表' AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `rs_admin_notice`
--

INSERT INTO `rs_admin_notice` (`id`, `type`, `msg`, `uri`, `to_rid`, `to_uid`, `status`, `uid`, `username`, `updatetime`, `inputtime`) VALUES
(50, 'content', '在线咨询 新内容审核', 'answer/admin/home/verifyedit/id/34', 0, 0, 0, 0, '', 0, 1474611994),
(53, 'content', '在线咨询 新内容审核', 'answer/admin/home/verifyedit/id/37', 0, 0, 0, 0, '', 0, 1474612179),
(54, 'content', '新评论审核', 'answer/admin/comment/show/tid/0/id/8', 0, 0, 0, 0, '', 0, 1474938731),
(55, 'content', '新评论审核', 'answer/admin/comment/show/tid/0/id/9', 0, 0, 0, 0, '', 0, 1474938796),
(56, 'content', '新评论审核', 'answer/admin/comment/show/tid/0/id/10', 0, 0, 0, 0, '', 0, 1474939009),
(80, 'content', '新评论审核', 'shop/admin/comment/show/tid/0/id/1', 0, 0, 1, 51, '18060616876', 0, 1476084698),
(85, 'member', '新会员注册审核', 'member/admin/home/index/field/uid/keyword/68', 0, 0, 0, 0, '', 0, 1498786026);

-- --------------------------------------------------------

--
-- 表的结构 `rs_admin_role`
--

CREATE TABLE IF NOT EXISTS `rs_admin_role` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `site` varchar(255) NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text NOT NULL COMMENT '角色组语言名称',
  `system` text NOT NULL COMMENT '系统权限',
  `module` text NOT NULL COMMENT '模块权限',
  `application` text NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台角色权限表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `rs_admin_role`
--

INSERT INTO `rs_admin_role` (`id`, `site`, `name`, `system`, `module`, `application`) VALUES
(1, '', '超级管理员', '', '', ''),
(2, 'a:1:{i:0;s:1:\\"1\\";}', '网站编辑员', 'a:146:{i:0;s:14:\\"admin/root/log\\";i:1;s:18:\\"admin/system/index\\";i:2;s:18:\\"admin/notice/index\\";i:3;s:16:\\"admin/mail/index\\";i:4;s:14:\\"admin/mail/add\\";i:5;s:15:\\"admin/mail/edit\\";i:6;s:14:\\"admin/mail/del\\";i:7;s:14:\\"admin/mail/log\\";i:8;s:15:\\"admin/sms/index\\";i:9;s:13:\\"admin/sms/log\\";i:10;s:16:\\"admin/role/index\\";i:11;s:15:\\"admin/role/auth\\";i:12;s:14:\\"admin/role/add\\";i:13;s:15:\\"admin/role/edit\\";i:14;s:14:\\"admin/role/del\\";i:15;s:16:\\"admin/root/index\\";i:16;s:14:\\"admin/root/add\\";i:17;s:15:\\"admin/root/edit\\";i:18;s:14:\\"admin/root/del\\";i:19;s:22:\\"adm/admin/poster/index\\";i:20;s:20:\\"adm/admin/poster/add\\";i:21;s:21:\\"adm/admin/poster/edit\\";i:22;s:20:\\"adm/admin/poster/del\\";i:23;s:23:\\"adm/admin/poster2/index\\";i:24;s:21:\\"adm/admin/poster2/add\\";i:25;s:22:\\"adm/admin/poster2/edit\\";i:26;s:21:\\"adm/admin/poster2/del\\";i:27;s:28:\\"admin/navigator/index/type=4\\";i:28;s:24:\\"admin/form_service/index\\";i:29;s:22:\\"admin/form_service/add\\";i:30;s:23:\\"admin/form_service/edit\\";i:31;s:22:\\"admin/form_service/del\\";i:32;s:23:\\"admin/form_service/show\\";i:33;s:24:\\"admin/form_account/index\\";i:34;s:22:\\"admin/form_account/add\\";i:35;s:23:\\"admin/form_account/edit\\";i:36;s:22:\\"admin/form_account/del\\";i:37;s:23:\\"admin/form_account/show\\";i:38;s:24:\\"admin/form_adviser/index\\";i:39;s:22:\\"admin/form_adviser/add\\";i:40;s:23:\\"admin/form_adviser/edit\\";i:41;s:22:\\"admin/form_adviser/del\\";i:42;s:23:\\"admin/form_adviser/show\\";i:43;s:23:\\"member/admin/home/index\\";i:44;s:21:\\"member/admin/home/add\\";i:45;s:22:\\"member/admin/home/edit\\";i:46;s:21:\\"member/admin/home/del\\";i:47;s:23:\\"member/admin/home/score\\";i:48;s:28:\\"member/admin/home/experience\\";i:49;s:24:\\"member/admin/group/index\\";i:50;s:22:\\"member/admin/group/add\\";i:51;s:23:\\"member/admin/group/edit\\";i:52;s:22:\\"member/admin/group/del\\";i:53;s:21:\\"auth/admin/auth/index\\";i:54;s:20:\\"auth/admin/auth/edit\\";i:55;s:19:\\"auth/admin/auth/del\\";i:56;s:31:\\"member/admin/setting/permission\\";i:57;s:24:\\"member/admin/setting/pay\\";i:58;s:22:\\"member/admin/pay/index\\";i:59;s:20:\\"member/admin/pay/add\\";i:60;s:21:\\"news/admin/home/index\\";i:61;s:20:\\"news/admin/home/edit\\";i:62;s:19:\\"news/admin/home/del\\";i:63;s:22:\\"news/admin/home/verify\\";i:64;s:23:\\"news/admin/home/content\\";i:65;s:20:\\"news/admin/home/html\\";i:66;s:19:\\"news/admin/home/add\\";i:67;s:21:\\"news/admin/home/draft\\";i:68;s:25:\\"news/admin/category/index\\";i:69;s:23:\\"news/admin/category/add\\";i:70;s:24:\\"news/admin/category/edit\\";i:71;s:23:\\"news/admin/category/del\\";i:72;s:22:\\"order/admin/home/index\\";i:73;s:20:\\"order/admin/home/add\\";i:74;s:21:\\"order/admin/home/edit\\";i:75;s:20:\\"order/admin/home/del\\";i:76;s:23:\\"order/admin/home/verify\\";i:77;s:20:\\"order/admin/home/url\\";i:78;s:21:\\"order/admin/home/html\\";i:79;s:19:\\"order/admin/home/fk\\";i:80;s:19:\\"order/admin/home/fh\\";i:81;s:19:\\"order/admin/home/wc\\";i:82;s:22:\\"order/admin/home/close\\";i:83;s:27:\\"order/admin/mconfig/paytype\\";i:84;s:21:\\"shop/admin/home/index\\";i:85;s:20:\\"shop/admin/home/edit\\";i:86;s:19:\\"shop/admin/home/del\\";i:87;s:22:\\"shop/admin/home/verify\\";i:88;s:23:\\"shop/admin/home/content\\";i:89;s:20:\\"shop/admin/home/html\\";i:90;s:19:\\"shop/admin/home/add\\";i:91;s:21:\\"shop/admin/home/draft\\";i:92;s:25:\\"shop/admin/category/index\\";i:93;s:23:\\"shop/admin/category/add\\";i:94;s:24:\\"shop/admin/category/edit\\";i:95;s:23:\\"shop/admin/category/del\\";i:96;s:25:\\"shop/admin/comment/config\\";i:97;s:24:\\"shop/admin/comment/index\\";i:98;s:20:\\"job/admin/home/index\\";i:99;s:18:\\"job/admin/home/add\\";i:100;s:19:\\"job/admin/home/edit\\";i:101;s:18:\\"job/admin/home/del\\";i:102;s:22:\\"job/admin/home/content\\";i:103;s:19:\\"job/admin/home/html\\";i:104;s:21:\\"job/admin/home/verify\\";i:105;s:20:\\"job/admin/home/draft\\";i:106;s:24:\\"job/admin/category/index\\";i:107;s:22:\\"job/admin/category/add\\";i:108;s:23:\\"job/admin/category/edit\\";i:109;s:22:\\"job/admin/category/del\\";i:110;s:23:\\"qiuzhi/admin/home/index\\";i:111;s:21:\\"qiuzhi/admin/home/add\\";i:112;s:22:\\"qiuzhi/admin/home/edit\\";i:113;s:21:\\"qiuzhi/admin/home/del\\";i:114;s:25:\\"qiuzhi/admin/home/content\\";i:115;s:22:\\"qiuzhi/admin/home/html\\";i:116;s:24:\\"qiuzhi/admin/home/verify\\";i:117;s:23:\\"qiuzhi/admin/home/draft\\";i:118;s:27:\\"qiuzhi/admin/category/index\\";i:119;s:25:\\"qiuzhi/admin/category/add\\";i:120;s:26:\\"qiuzhi/admin/category/edit\\";i:121;s:25:\\"qiuzhi/admin/category/del\\";i:122;s:23:\\"answer/admin/home/index\\";i:123;s:21:\\"answer/admin/home/add\\";i:124;s:22:\\"answer/admin/home/edit\\";i:125;s:21:\\"answer/admin/home/del\\";i:126;s:25:\\"answer/admin/home/content\\";i:127;s:22:\\"answer/admin/home/html\\";i:128;s:24:\\"answer/admin/home/verify\\";i:129;s:23:\\"answer/admin/home/draft\\";i:130;s:27:\\"answer/admin/category/index\\";i:131;s:25:\\"answer/admin/category/add\\";i:132;s:26:\\"answer/admin/category/edit\\";i:133;s:25:\\"answer/admin/category/del\\";i:134;s:27:\\"answer/admin/comment/config\\";i:135;s:26:\\"answer/admin/comment/index\\";i:136;s:22:\\"video/admin/home/index\\";i:137;s:20:\\"video/admin/home/add\\";i:138;s:21:\\"video/admin/home/edit\\";i:139;s:20:\\"video/admin/home/del\\";i:140;s:24:\\"video/admin/home/content\\";i:141;s:21:\\"video/admin/home/html\\";i:142;s:23:\\"video/admin/home/verify\\";i:143;s:24:\\"video/admin/extend/index\\";i:144;s:22:\\"video/admin/home/draft\\";i:145;s:30:\\"video/admin/category/edit/id=1\\";}', '', ''),
(3, 'a:1:{i:0;s:1:\\"1\\";}', '网站维护员', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_admin_verify`
--

CREATE TABLE IF NOT EXISTS `rs_admin_verify` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '名称',
  `verify` text NOT NULL COMMENT '审核部署',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='审核管理表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `rs_admin_verify`
--

INSERT INTO `rs_admin_verify` (`id`, `name`, `verify`) VALUES
(1, '审核一次', 'a:1:{i:1;a:2:{i:0;s:1:\\"2\\";i:1;s:1:\\"3\\";}}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_application`
--

CREATE TABLE IF NOT EXISTS `rs_application` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` text COMMENT '模块划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `rs_application`
--

INSERT INTO `rs_application` (`id`, `module`, `dirname`, `setting`, `disabled`) VALUES
(1, '', 'adm', 'a:1:{s:5:\\"admin\\";a:1:{i:2;i:1;}}', 0),
(5, '', 'auth', 'a:1:{s:5:\\"admin\\";a:1:{i:2;i:1;}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment`
--

CREATE TABLE IF NOT EXISTS `rs_attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1132 ;

--
-- 转存表中的数据 `rs_attachment`
--

INSERT INTO `rs_attachment` (`id`, `uid`, `author`, `siteid`, `related`, `tableid`, `download`, `filesize`, `fileext`, `filemd5`) VALUES
(1064, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 1075722, 'png', '0e931415f2a7b539367afbd718137a39'),
(1062, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 1075722, 'png', '0e931415f2a7b539367afbd718137a39'),
(26, 1, 'admin', 1, 'rs_1_poster-2', 1, 0, 102031, 'png', 'f4a55f139e41d313c989ecdc0bc14f33'),
(251, 1, 'admin', 1, 'rs_1_poster-20', 1, 0, 79770, 'jpg', 'c583e9f91f3cbe500bb2a42cd32a1d71'),
(250, 1, 'admin', 1, 'rs_1_poster-18', 1, 0, 67277, 'jpg', '7044f77bd644c9819009ab9a1cd7499a'),
(27, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 497326, 'png', '9dea1cd1be139007e939768fa5da387f'),
(29, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 114657, 'png', '2412cade921023c5d7cd043eba329f0f'),
(1102, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 111360, 'jpg', '5a5bc71973b1c11713d59eee7d00f3c5'),
(1061, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 1071544, 'png', '5bdc36b6aaf7df4488ff0ef3b3622085'),
(32, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 112466, 'png', 'ad693a0c99d6a83a4ccc7368563e5593'),
(33, 1, 'admin', 1, 'rs_1_poster-8', 1, 0, 115794, 'png', 'c53fbf75d8f87c3e389b5cf580fca0a6'),
(34, 1, 'admin', 1, 'rs_1_poster-9', 1, 0, 77865, 'png', '6c0c385969c9ddc8a3bdad6b411849b1'),
(35, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 82196, 'png', 'ee77df9e06edb0c6d05f83e1b4429beb'),
(36, 1, 'admin', 1, 'rs_1_poster-11', 1, 0, 72602, 'png', 'e9dbf4b1c1cca559267ce9c51b7ccdec'),
(750, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 27771, 'jpg', '203817254dd02c3bb1f132413c123172'),
(47, 1, 'admin', 1, 'rs_1_poster-12', 1, 0, 164751, 'png', '14c8c16d868d7a7e44d7c5f3959be363'),
(48, 1, 'admin', 1, 'rs_1_poster-13', 1, 0, 256236, 'png', '8ab58b88994b4b34b8005cc2be0ae58b'),
(49, 1, 'admin', 1, 'rs_1_poster-14', 1, 0, 268667, 'png', '5cf4b19b050b6cec3516c9ab2f609d7a'),
(50, 1, 'admin', 1, 'rs_1_poster-15', 1, 0, 190853, 'png', '19a9f2a7d4980d6b5c277051b1351317'),
(51, 1, 'admin', 1, 'rs_1_poster-16', 1, 0, 154204, 'png', 'e59f542b15af9bb4c5344ddf5d993bdd'),
(52, 1, 'admin', 1, 'rs_1_poster-17', 1, 0, 154962, 'png', '6cabda8efd018fd261d8d2d7d9a0812e'),
(53, 1, 'admin', 1, 'rs_1_poster-18', 1, 0, 37100, 'png', 'c0abed3fb62de62a3d4655bc06bb064b'),
(54, 1, 'admin', 1, 'rs_1_poster-19', 1, 0, 154962, 'png', '6cabda8efd018fd261d8d2d7d9a0812e'),
(55, 1, 'admin', 1, 'rs_1_poster-20', 1, 0, 154204, 'png', 'e59f542b15af9bb4c5344ddf5d993bdd'),
(59, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 148296, 'png', 'a6e41288cd9ea35ffa619cbb5e7c9f24'),
(307, 1, 'admin', 1, 'rs_1_news-39', 1, 0, 105503, 'jpg', '412039a289a4167d7438d37f22c7097e'),
(88, 1, 'admin', 1, 'rs_1_poster-22', 1, 0, 50033, 'png', '605a0ea14b1a5695401888c1bf0284cc'),
(89, 1, 'admin', 1, 'rs_1_poster-23', 1, 0, 32430, 'png', 'bbece5b5412b115e991fa0d1fee82a19'),
(90, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 189645, 'png', '6f3ea690d2841024ff1620e08d7ec148'),
(249, 1, 'admin', 1, 'rs_1_poster-17', 1, 0, 105820, 'jpg', '4428a478bab27f14b1e13c1a1f49e6d6'),
(1056, 1, 'admin', 1, 'rs_1_news-148', 1, 0, 45507, 'jpg', '667dd6d603ed2dbce146bfe68f577f00'),
(1101, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 102769, 'jpg', 'f5d07fce980179b09bf180dbc0342b32'),
(1047, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 489144, 'png', 'ca2effcdb33733b9aa80e25e5f2cad4a'),
(1048, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 877578, 'png', '72dad488573eded412a3d00bb30f2b37'),
(752, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 37724, 'jpg', '68e516b9dfb00abb01586d20a5a03208'),
(891, 1, 'admin', 1, 'rs_1_news-103', 1, 0, 1790715, 'jpg', '05101cc7c22d7f1b0a962b038cc1915d'),
(1105, 1, 'admin', 1, 'rs_1_poster-2', 1, 0, 209684, 'jpg', '8c148112ac6ae15ca1676ad1ed5944b6'),
(867, 1, 'admin', 1, 'rs_1_news-87', 1, 0, 22132, 'png', 'd038e36354ae6d75e17b3e078304511a'),
(155, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 148296, 'png', 'a6e41288cd9ea35ffa619cbb5e7c9f24'),
(156, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 148296, 'png', 'a6e41288cd9ea35ffa619cbb5e7c9f24'),
(157, 1, 'admin', 1, 'rs_1_poster-13', 1, 0, 256236, 'png', '8ab58b88994b4b34b8005cc2be0ae58b'),
(158, 1, 'admin', 1, 'rs_1_poster-14', 1, 0, 268667, 'png', '5cf4b19b050b6cec3516c9ab2f609d7a'),
(159, 1, 'admin', 1, 'rs_1_poster-15', 1, 0, 190853, 'png', '19a9f2a7d4980d6b5c277051b1351317'),
(160, 1, 'admin', 1, 'rs_1_poster-12', 1, 0, 164751, 'png', '14c8c16d868d7a7e44d7c5f3959be363'),
(894, 1, 'admin', 1, 'rs_1_poster-22', 1, 0, 34836, 'jpg', 'ccd30d8027e4956325ab983d49a842c2'),
(1069, 1, 'admin', 1, 'rs_1_poster-8', 1, 0, 40868, 'png', 'f4f4e58bf879e467353b93e83a5102cc'),
(1055, 1, 'admin', 1, 'rs_1_news-147', 1, 0, 418632, 'jpg', '54b9def08e87e3946045a3df9323b84d'),
(1104, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 817562, 'jpg', 'c8e382de00e14a5bd242c84bb826d0e9'),
(1059, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 1071544, 'png', '5bdc36b6aaf7df4488ff0ef3b3622085'),
(242, 1, 'admin', 1, 'rs_1_poster-32', 1, 0, 127386, 'png', '8fba65f93d44f6411ce243d4bb4db2b0'),
(241, 1, 'admin', 1, 'rs_1_poster-31', 1, 0, 98755, 'png', '1164221c2de78ad4ef16fe8e5e67c0ea'),
(240, 1, 'admin', 1, 'rs_1_poster-30', 1, 0, 108646, 'png', 'b896b96dab4ed3b87fd05a212646323f'),
(239, 1, 'admin', 1, 'rs_1_poster-29', 1, 0, 144722, 'png', 'cd17063c7231216779c24b79a2abe791'),
(238, 1, 'admin', 1, 'rs_1_poster-28', 1, 0, 127846, 'png', '6bf0a299f93645fa48066cf86532b94a'),
(237, 1, 'admin', 1, 'rs_1_poster-27', 1, 0, 159724, 'png', '2dd0b518f901d54a1f0a537cc8670ec4'),
(236, 1, 'admin', 1, 'rs_1_poster-26', 1, 0, 108564, 'png', 'ea8c14e2937d5c79009e2159dd8fdf8f'),
(235, 1, 'admin', 1, 'rs_1_poster-25', 1, 0, 101530, 'png', 'c81a359ebd3c9340ca2cf8369c394f58'),
(1066, 1, 'admin', 1, 'rs_1_news-149', 1, 0, 25907, 'jpg', '2d0b4d4193c08b8ef31eca23be32742a'),
(252, 1, 'admin', 1, 'rs_1_poster-19', 1, 0, 48118, 'jpg', 'd6251d7cf7854a9f95fde3ff620e952e'),
(253, 1, 'admin', 1, 'rs_1_poster-17', 1, 0, 100854, 'jpg', '4fd0368039286ee54eb866dd99acc477'),
(254, 1, 'admin', 1, 'rs_1_poster-17', 1, 0, 102441, 'jpg', '26d400b0762fdb0739bc7edb3beac1b1'),
(881, 1, 'admin', 1, 'rs_1_poster-52', 1, 0, 40878, 'png', 'ff2c4df52d1bb62dfcb08769e6454feb'),
(661, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 314685, 'jpg', '1d31126176a7fbc95f62bee0232c0f2b'),
(866, 1, 'admin', 1, 'rs_1_news-87', 1, 0, 4468, 'png', '5e2841c5c4e5638b3a3ccb6ea5d1af20'),
(888, 1, 'admin', 1, 'rs_1_news-103', 1, 0, 111452, 'png', 'ce6d36d1ebca35d8992ee2349f665c23'),
(889, 1, 'admin', 1, 'rs_1_news-103', 1, 0, 6362, 'png', '2c650d36062e5b5d4ae8afeaa5f7ba51'),
(321, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 189645, 'png', '6f3ea690d2841024ff1620e08d7ec148'),
(322, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 412621, 'jpg', 'e4e8d219066bcf2b4b2d500fa0f5eaed'),
(359, 1, 'admin', 1, 'rs_1_poster-25', 1, 0, 144722, 'png', 'cd17063c7231216779c24b79a2abe791'),
(360, 1, 'admin', 1, 'rs_1_poster-26', 1, 0, 101530, 'png', 'c81a359ebd3c9340ca2cf8369c394f58'),
(361, 1, 'admin', 1, 'rs_1_poster-27', 1, 0, 75418, 'jpg', 'fc85ebaefd2fe4b8dbdadfc03db4229e'),
(362, 1, 'admin', 1, 'rs_1_poster-28', 1, 0, 61317, 'jpg', '7a9699d413e7ef61f3baf4b44c73d3d8'),
(363, 1, 'admin', 1, 'rs_1_poster-29', 1, 0, 127846, 'png', '6bf0a299f93645fa48066cf86532b94a'),
(364, 1, 'admin', 1, 'rs_1_poster-30', 1, 0, 108564, 'png', 'ea8c14e2937d5c79009e2159dd8fdf8f'),
(365, 1, 'admin', 1, 'rs_1_poster-31', 1, 0, 126054, 'png', '5c1b0a6f51755c8bf44b298cdc82d797'),
(1067, 1, 'admin', 1, 'rs_1_news-151', 1, 0, 29082, 'jpg', '1be27732a980644666d65e2425489cc0'),
(1058, 1, 'admin', 1, 'rs_1_news-150', 1, 0, 39485, 'png', '83305002dcb192a980b6fe4233476826'),
(368, 1, 'admin', 1, 'rs_1_poster-35', 1, 0, 108646, 'png', 'b896b96dab4ed3b87fd05a212646323f'),
(369, 1, 'admin', 1, 'rs_1_poster-36', 1, 0, 73226, 'jpg', 'fce6a3575eb00e31e97cdd58d76473a3'),
(370, 1, 'admin', 1, 'rs_1_poster-37', 1, 0, 78490, 'jpg', '3118efe04e4618cfb903b871141f178a'),
(371, 1, 'admin', 1, 'rs_1_poster-38', 1, 0, 62618, 'jpg', 'fb7ee31fcab876cd0e93db8253606ee0'),
(372, 1, 'admin', 1, 'rs_1_poster-39', 1, 0, 56842, 'jpg', 'b4a7a1ce949955d3ad05c70d29c5bd46'),
(373, 1, 'admin', 1, 'rs_1_poster-40', 1, 0, 87429, 'jpg', 'db599659e5882f967fc23a2b965314dd'),
(389, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 198574, 'jpg', 'ac7d30bac3c8372b388e44af0be17f50'),
(896, 1, 'admin', 1, '', 1, 0, 153151, 'jpg', 'fdbb1e95ccc4c50016fef582b5ea1a9a'),
(890, 1, 'admin', 1, 'rs_1_poster-47', 1, 0, 111452, 'png', 'ce6d36d1ebca35d8992ee2349f665c23'),
(868, 1, 'admin', 1, 'rs_1_news-87', 1, 0, 1162016, 'png', '744921788204dd1134c41e1ccd383993'),
(457, 1, 'admin', 1, 'rs_1_poster-42', 1, 0, 138045, 'jpg', 'df5c0efe9f4505715a5a43f1d8dec787'),
(445, 1, 'admin', 1, 'rs_1_poster-41', 1, 0, 109496, 'png', 'ed00c414e758b6b0dbee9a3389c13b65'),
(705, 1, 'admin', 1, 'rs_1_news-87', 1, 0, 36241, 'jpg', 'f5171ea5255f64a700dcd9df9464e1b3'),
(454, 1, 'admin', 1, 'rs_1_poster-41', 1, 0, 25426, 'jpg', '6675a307663ca8f2a2936b548ca917ff'),
(458, 1, 'admin', 1, 'rs_1_poster-41', 1, 0, 86907, 'jpg', '98df40c509189096a6068ec8f2282cef'),
(459, 1, 'admin', 1, 'rs_1_poster-43', 1, 0, 114360, 'jpg', '02712c0de4da4d971cca03a294756d48'),
(460, 1, 'admin', 1, 'rs_1_poster-43', 1, 0, 171889, 'jpg', '6bf9f2e66d3048ce2112530f81f66065'),
(462, 1, 'admin', 1, 'rs_1_poster-44', 1, 0, 101222, 'jpg', 'a1e4c9396a08aa554aba955c509c9781'),
(497, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 455547, 'jpg', 'a2499769c2e3c6c01239e423c4be8bc8'),
(498, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 439286, 'jpg', 'f93fe722dc7f2879a8f8de05f6cb8e96'),
(499, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 437187, 'jpg', '7433259ccefcc57ae3f886ef13d0e158'),
(701, 1, 'admin', 1, 'rs_1_news-87', 1, 0, 36239, 'jpg', 'f5171ea5255f64a700dcd9df9464e1b3'),
(1100, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 126495, 'jpg', '37877312f6730cf3a2c11a4ca8846781'),
(887, 1, 'admin', 1, 'rs_1_news-103', 1, 0, 925495, 'jpg', '9c52a83dc2a599a337f5514304ce0d1e'),
(886, 1, 'admin', 1, 'rs_1_news-103', 1, 0, 42468, 'png', '308187d2a1e8f1c01868c4a414e0c72a'),
(1068, 1, 'admin', 1, 'rs_1_news-152', 1, 0, 86886, 'jpg', '335327557e316677eb6579b269e81155'),
(1065, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 40868, 'png', 'f4f4e58bf879e467353b93e83a5102cc'),
(1052, 1, 'admin', 1, 'rs_1_news-144', 1, 0, 732887, 'jpg', 'b2b4183b6cc4440fff3dc7179995ed38'),
(1053, 1, 'admin', 1, 'rs_1_news-145', 1, 0, 98345, 'jpg', 'd1e861b7944b526dde6db4bfa8c8017d'),
(1054, 1, 'admin', 1, 'rs_1_news-146', 1, 0, 1190533, 'jpg', 'ce3f46f77a810248854376d4b9c5c426'),
(562, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 275200, 'jpg', 'bd08e30194ac30a4952282712e7f26fa'),
(563, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 291758, 'jpg', '3ef1b6e4bf6f929b655ec142667f1d01'),
(564, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 291379, 'jpg', 'b157fc76c2a3b95b96aab678c44e24ce'),
(1046, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 16568, 'jpg', 'b47b886c670bf6fc287a52270198ca2e'),
(1034, 1, 'admin', 1, 'rs_1_news-134', 1, 0, 43915, 'jpg', 'c8b3c9d8ae8207fe112a8cfb86a326a4'),
(1035, 1, 'admin', 1, 'rs_1_news-134', 1, 0, 43919, 'jpg', 'c8b3c9d8ae8207fe112a8cfb86a326a4'),
(1036, 1, 'admin', 1, 'rs_1_poster-48', 1, 0, 29389, 'jpg', '2710a860690b566c8399622ff0bcec16'),
(1037, 1, 'admin', 1, 'rs_1_poster-47', 1, 0, 19241, 'jpg', '2009957ca75856be3f44a48bd8b24bc1'),
(1038, 1, 'admin', 1, 'rs_1_poster-46', 1, 0, 14572, 'jpg', 'c8f995dd2aff2c31d1f6d243e526b478'),
(1039, 1, 'admin', 1, 'rs_1_poster-46', 1, 0, 14572, 'jpg', 'c8f995dd2aff2c31d1f6d243e526b478'),
(1040, 1, 'admin', 1, 'rs_1_poster-45', 1, 0, 25098, 'jpg', 'e39adbbf591c058f71a1a2935e217974'),
(1041, 1, 'admin', 1, 'rs_1_poster-44', 1, 0, 20623, 'jpg', 'bcdbc41b017816879ef656ee47e2d827'),
(1042, 1, 'admin', 1, 'rs_1_poster-43', 1, 0, 17183, 'jpg', 'a06fb9f84fdd9d8f6874b5ac99b6241e'),
(1043, 1, 'admin', 1, 'rs_1_poster-42', 1, 0, 15995, 'jpg', '6431891536c5fa1283498bebb460d05c'),
(1044, 1, 'admin', 1, 'rs_1_poster-41', 1, 0, 26378, 'jpg', 'aa0ba1e921d81a674654ab5c7ec110a5'),
(1099, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 817562, 'jpg', 'c8e382de00e14a5bd242c84bb826d0e9'),
(1033, 1, 'admin', 1, 'rs_1_news-133', 1, 0, 18524, 'jpg', '9e2688b5505cfe2a2d3540907a9a4e46'),
(591, 1, 'admin', 1, 'rs_1_poster-45', 1, 0, 84419, 'jpg', 'ebf40c39744670e3e3ebaa865ec23fb8'),
(592, 1, 'admin', 1, 'rs_1_poster-46', 1, 0, 45158, 'jpg', 'bad699be737f6804ecc4e6e94c5c2576'),
(593, 1, 'admin', 1, 'rs_1_poster-47', 1, 0, 160389, 'jpg', 'f9cf9e8c9e1fc350f4a3fbad75b22ffb'),
(595, 1, 'admin', 1, 'rs_1_poster-48', 1, 0, 39905, 'jpg', '4ab8f3821cc5f1cb18e762a3b0afcefc'),
(1032, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 140206, 'jpg', 'e9426ff18284ac5dc2d38b15444da5e3'),
(1030, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 140206, 'jpg', 'e9426ff18284ac5dc2d38b15444da5e3'),
(622, 1, 'admin', 1, 'rs_1_poster-49', 1, 0, 634450, 'png', '22f3135f4520be9e4d4bcd4657fad3a1'),
(626, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 133540, 'png', '96dd43d7d895081b6ae5826a129866b9'),
(627, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 115794, 'png', 'c53fbf75d8f87c3e389b5cf580fca0a6'),
(628, 1, 'admin', 1, 'rs_1_poster-8', 1, 0, 132792, 'png', 'd26ee02d56a2a1a5a46b138b681dbb42'),
(647, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 175360, 'jpg', '85dd2e2120f69133775e73cdf7b244e9'),
(648, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 160246, 'jpg', '28f0862a0c50a1a2107fff965365b5e3'),
(649, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 148849, 'jpg', 'e85ba106ea438e6d042be016526e2809'),
(650, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 149719, 'jpg', 'ba34dcbe40ea2108c17985caa8e5c9fe'),
(651, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 163492, 'jpg', '3bca9cae649bde950ff0f70c58bc27c3'),
(652, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 162550, 'jpg', 'e6f5d0eece4e058f74a0b9c22dce2194'),
(662, 1, 'admin', 1, 'rs_1_poster-49', 1, 0, 298598, 'jpg', '0ed1f90d983065451fcdf3beede5dc3b'),
(663, 1, 'admin', 1, 'rs_1_poster-24', 1, 0, 294451, 'jpg', 'b46f7541a6150fc0ac25898f7be27c85'),
(665, 1, 'admin', 1, 'rs_1_poster-48', 1, 0, 33167, 'jpg', 'f8f598f9c439e52f964e0be774c3a24d'),
(667, 1, 'admin', 1, 'rs_1_news-81', 1, 0, 40622, 'jpg', '9c65728b9730097fa0bc71ab527b555d'),
(671, 1, 'admin', 1, 'rs_1_news-81', 1, 0, 40625, 'jpg', '9c65728b9730097fa0bc71ab527b555d'),
(672, 1, 'admin', 1, 'rs_1_news-82', 1, 0, 29917, 'jpg', '5357849af23a0922d734b57027bbac77'),
(673, 1, 'admin', 1, 'rs_1_news-82', 1, 0, 29921, 'jpg', '5357849af23a0922d734b57027bbac77'),
(674, 1, 'admin', 1, 'rs_1_news-83', 1, 0, 38114, 'jpg', '0b6244f2b5a6338412eaa7906a5dbc48'),
(675, 1, 'admin', 1, 'rs_1_news-84', 1, 0, 29695, 'jpg', 'd46070962a0db4047601296f581c0235'),
(676, 1, 'admin', 1, 'rs_1_news-84', 1, 0, 29696, 'jpg', 'd46070962a0db4047601296f581c0235'),
(677, 1, 'admin', 1, 'rs_1_news-83', 1, 0, 38113, 'jpg', '0b6244f2b5a6338412eaa7906a5dbc48'),
(678, 1, 'admin', 1, 'rs_1_news-85', 1, 0, 39965, 'jpg', '265e3e03c97611341e9f00691da3920b'),
(679, 1, 'admin', 1, 'rs_1_news-85', 1, 0, 39967, 'jpg', '265e3e03c97611341e9f00691da3920b'),
(680, 1, 'admin', 1, 'rs_1_news-86', 1, 0, 30690, 'jpg', '28dadbe1a1ce2ce2dd446d08733e2247'),
(681, 1, 'admin', 1, 'rs_1_news-86', 1, 0, 30689, 'jpg', '28dadbe1a1ce2ce2dd446d08733e2247'),
(682, 1, 'admin', 1, 'rs_1_poster-42', 1, 0, 29696, 'jpg', 'd46070962a0db4047601296f581c0235'),
(683, 1, 'admin', 1, 'rs_1_poster-41', 1, 0, 86927, 'jpg', '3252101ddce060a5dc58257748257d9c'),
(684, 1, 'admin', 1, 'rs_1_poster-41', 1, 0, 99256, 'jpg', 'e20fef935c322d44a8d3b4f6c9f808f6'),
(880, 1, 'admin', 1, 'rs_1_poster-52', 1, 0, 40806, 'png', '7932f40270c4f1f96e6715173ea7a792'),
(716, 1, 'admin', 1, 'rs_1_poster-48', 1, 0, 27986, 'png', 'de7717d446044bc970d79acc92023c68'),
(717, 1, 'admin', 1, 'rs_1_poster-48', 1, 0, 46746, 'jpg', '93ae18af7b1b89d3a37a3c7459ba0ef7'),
(719, 1, 'admin', 1, 'rs_1_news-88', 1, 0, 37969, 'jpg', 'cc5d29b67df82adf06e3c52b4c567411'),
(720, 1, 'admin', 1, 'rs_1_news-88', 1, 0, 37970, 'jpg', 'cc5d29b67df82adf06e3c52b4c567411'),
(721, 1, 'admin', 1, 'rs_1_poster-48', 1, 0, 46746, 'jpg', '93ae18af7b1b89d3a37a3c7459ba0ef7'),
(1051, 1, 'admin', 1, 'rs_1_news-143', 1, 0, 162990, 'png', 'e25712c8eeeaf6f9c9492002b085ea21'),
(1098, 1, 'admin', 1, 'rs_1_poster-2', 1, 0, 817562, 'jpg', 'c8e382de00e14a5bd242c84bb826d0e9'),
(737, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 46070, 'jpg', '0d025a94bf5eeebb52f38d5e70cd325e'),
(738, 1, 'admin', 1, 'rs_1_poster-21', 1, 0, 291379, 'jpg', 'b157fc76c2a3b95b96aab678c44e24ce'),
(740, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 383959, 'jpg', '67a9f9c7199f057a94dd5a9efcf01ee3'),
(742, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 383959, 'jpg', '67a9f9c7199f057a94dd5a9efcf01ee3'),
(744, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 202496, 'jpg', '9aebe0e93507cd6f66ee2a1aa58ffc8e'),
(745, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 38779, 'png', '67e777d922df1f94e38f24fa9d999068'),
(747, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 202496, 'jpg', '9aebe0e93507cd6f66ee2a1aa58ffc8e'),
(748, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 46070, 'jpg', '0d025a94bf5eeebb52f38d5e70cd325e'),
(754, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 37140, 'jpg', '7c0cdf96042b2a7ff1d9d1b23fd8edc1'),
(1050, 1, 'admin', 1, 'rs_1_news-142', 1, 0, 12247, 'jpg', 'd0277ba9ee828c5d9579eba89fc34eab'),
(1049, 1, 'admin', 1, 'rs_1_news-141', 1, 0, 29686, 'jpg', '29169bd87f09400af28468fd2b761594'),
(769, 1, 'admin', 1, 'rs_1_news-83', 1, 0, 671405, 'png', 'f8e5d09536d3d6f05240ea180d6801f7'),
(804, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 353618, 'jpg', '2684f558ba8ae59caf77511ea8f07db5'),
(805, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 456602, 'jpg', '2cf5d19c9a54ba7e6de07504d0b688be'),
(924, 1, 'admin', 1, '', 1, 0, 58766, 'jpg', '4e5482a24b7aa11faff1df1fffd7a1dd'),
(936, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 376883, 'jpg', '5a731e3653f9aade9a66ee3fca75ac61'),
(937, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 339814, 'jpg', 'b9d4b5825aceac33265c84791a3832a1'),
(939, 1, 'admin', 1, '', 1, 0, 271288, 'jpg', '6d6d5446214ec3c8cef214f53bce0fc9'),
(940, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 271288, 'jpg', '6d6d5446214ec3c8cef214f53bce0fc9'),
(941, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 2932756, 'jpg', 'fbe1ed6100798eec4af03ab9abf68304'),
(942, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 162550, 'jpg', 'e6f5d0eece4e058f74a0b9c22dce2194'),
(943, 1, 'admin', 1, '', 1, 0, 408145, 'jpg', '99ed68d2cc311b68f13408bb17c4f715'),
(944, 1, 'admin', 1, '', 1, 0, 164035, 'jpg', 'f291b6953cb1b2603f039161050d0b8f'),
(956, 1, 'admin', 1, '', 1, 0, 412769, 'jpg', '9518740f7feab8bd77aa2b49c3896d61'),
(959, 1, 'admin', 1, '', 1, 0, 390246, 'jpg', '5ce8eac7440162c730553e547980ebe9'),
(969, 1, 'admin', 1, '', 1, 0, 109286, 'jpg', '78dd726da77eb7274cc45ce355871288'),
(985, 1, 'admin', 1, '', 1, 0, 96298, 'jpg', 'dbe1d29d9bac066730fe17fb2224f9cd'),
(1002, 1, 'admin', 1, '', 1, 0, 366452, 'jpg', '256f3bae32858b5a410556f0b2429180'),
(1003, 1, 'admin', 1, '', 1, 0, 387634, 'jpg', '50466c35f96331ffae1bce1f95a41b16'),
(1004, 1, 'admin', 1, '', 1, 0, 370123, 'jpg', 'f589314cb48b637ddd38ce48fac2ac23'),
(1009, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 453130, 'png', '326fad8301478c7d0d1caec98733f463'),
(1010, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 453048, 'png', 'c1491e39938bf7bec74da740352649c5'),
(1011, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 453048, 'png', 'c1491e39938bf7bec74da740352649c5'),
(1012, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 740454, 'png', '496f486dff90b556b33118d13613ccc2'),
(1013, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 295025, 'png', 'ac51dcf9e17014e9eec25670dfcb124f'),
(1014, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 454103, 'png', 'ea7b5c0dc29255118db1853599d3c292'),
(1018, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 792340, 'png', 'efccb1cdb53ffb285dc627aa45333218'),
(1019, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 782172, 'png', 'f8e0c97048c89543938547cc7b126b90'),
(1070, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 36280, 'jpg', '1e7e10f10f30f91f368e01fde88b3e9a'),
(1071, 1, 'admin', 1, 'rs_1_poster-51', 1, 0, 183572, 'jpg', '50101554413807a218e1533a73896923'),
(1072, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 186778, 'jpg', '3d4b931c697f64ff4dbdc8bcb727d697'),
(1112, 1, 'admin', 1, 'rs_1_shop-51', 1, 0, 16046, 'jpg', '1b63f5e07dd4e886f7c54c7eec571eac'),
(1074, 1, 'admin', 1, 'rs_1_shop-51', 1, 0, 1600073, 'png', '0412d3d18197eb6ba7f37c736eb07d16'),
(1075, 1, 'admin', 1, 'rs_1_poster-55', 1, 0, 106107, 'jpg', 'd1f9c48729f2aba5450629e2d466b696'),
(1076, 1, 'admin', 1, 'rs_1_poster-56', 1, 0, 122327, 'jpg', '7d1bbaeefeb0c8bc514f43608059eea9'),
(1077, 1, 'admin', 1, 'rs_1_poster-57', 1, 0, 112394, 'jpg', 'd2faa0887e973cfb1df7e1c155c08faa'),
(1078, 1, 'admin', 1, 'rs_1_poster-55', 1, 0, 86405, 'jpg', 'd99535c48fd18f274c800f10bc05d3f5'),
(1079, 1, 'admin', 1, 'rs_1_poster-3', 1, 0, 61286, 'jpg', '53390854c3f350f1694829259a817c6e'),
(1080, 1, 'admin', 1, '', 1, 0, 184224, 'png', '1517aee40c702f915eafa0c2ca0b2350'),
(1081, 1, 'admin', 1, '', 1, 0, 127769, 'png', '8870cfc7448e1dd00061e89f188ae173'),
(1082, 1, 'admin', 1, '', 1, 0, 111344, 'png', 'bdcbd9835facc0de494b26bed0301673'),
(1083, 1, 'admin', 1, '', 1, 0, 32151, 'png', '8dfec017cf8d14bac51a1e71689accc3'),
(1084, 1, 'admin', 1, '', 1, 0, 107890, 'png', '267a137438d0a7b0db6ecd111ae39162'),
(1085, 1, 'admin', 1, '', 1, 0, 52029, 'png', '657631955f39552f15e920f1270e361e'),
(1086, 1, 'admin', 1, '', 1, 0, 194809, 'png', '5a33910562fdf0aa9903ec68fb8c9554'),
(1087, 1, 'admin', 1, '', 1, 0, 210780, 'png', '3d28c98479062f074cf442af4681edd4'),
(1088, 1, 'admin', 1, '', 1, 0, 176527, 'png', 'dbe029fadb9ebb3649db83e5bacec095'),
(1089, 1, 'admin', 1, 'rs_1_page-4', 1, 0, 13404, 'jpg', '640742d030ca5ae99ec3c91dbca47938'),
(1091, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 113398, 'jpg', 'cdb351d0a25e3e8b0a7e2f7325b076b7'),
(1092, 1, 'admin', 1, 'rs_1_poster-2', 1, 0, 155730, 'jpg', '42f8ad8a682b4211f81d153a781550fa'),
(1093, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 438538, 'png', 'ee512a826a7444d04f7b47b7d8f6766f'),
(1097, 1, 'admin', 1, 'rs_1_poster-5', 1, 0, 629463, 'jpg', '0db95d7b63731676c960600271b45e87'),
(1095, 1, 'admin', 1, 'rs_1_poster-2', 1, 0, 438538, 'png', 'ee512a826a7444d04f7b47b7d8f6766f'),
(1096, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 388291, 'jpg', '18005a6ca8c49d10d2c9d5786540998c'),
(1103, 1, 'admin', 1, 'rs_1_poster-7', 1, 0, 97567, 'jpg', '7e31fd1c5858755706af8c60b6a2ccb3'),
(1106, 1, 'admin', 1, 'rs_1_page-5', 1, 0, 9933, 'jpg', 'e575e833a3e99c0cdae375596f305f28'),
(1107, 1, 'admin', 1, 'rs_1_page-6', 1, 0, 9062, 'jpg', 'f2e179ee224953223ebb1bbdafe13968'),
(1108, 1, 'admin', 1, 'rs_1_page-7', 1, 0, 23849, 'jpg', 'e7a4b88242c5eb436c5bb1fecd93cfdf'),
(1109, 1, 'admin', 1, 'rs_1_page-8', 1, 0, 16865, 'jpg', 'f9ed6616b124db98f082d0b66267cea4'),
(1110, 1, 'admin', 1, 'rs_1_page-9', 1, 0, 9134, 'jpg', 'e6b07d4e517fc210420cef25733407fa'),
(1111, 1, 'admin', 1, 'rs_1_shop-51', 1, 0, 16046, 'jpg', '1b63f5e07dd4e886f7c54c7eec571eac'),
(1113, 1, 'admin', 1, 'rs_1_poster-8', 1, 0, 208067, 'jpg', 'c2f461c6b5beecc6ff1f38f83a2f7373'),
(1114, 1, 'admin', 1, 'rs_1_shop-52', 1, 0, 15370, 'jpg', '9436cbfb05bd7b23c0d02699dc272097'),
(1115, 1, 'admin', 2, 'rs_2_poster-9', 1, 0, 65761, 'jpg', '04b8b85fcf82d508e7ea499b8e1ff6ed'),
(1116, 1, 'admin', 2, 'rs_2_poster-10', 1, 0, 74885, 'jpg', '03ca1700edaa95362fc5e150f2bed7a8'),
(1117, 1, 'admin', 2, 'rs_2_poster-11', 1, 0, 75837, 'jpg', '3df4930e20b3273080611389129d4986'),
(1118, 1, 'admin', 2, 'rs_2_poster-12', 1, 0, 63447, 'jpg', '7b563a08e1fd936af1f324f09a0384ad'),
(1119, 1, 'admin', 2, 'rs_2_poster-13', 1, 0, 44687, 'jpg', '1b4b2d980d638a7bbe9621859044dcc9'),
(1120, 1, 'admin', 2, 'rs_2_poster-14', 1, 0, 40438, 'jpg', '23e7a1dca538a0d96e3a3a9e45cc4f8a'),
(1121, 1, 'admin', 1, 'rs_1_poster-9', 1, 0, 65761, 'jpg', '04b8b85fcf82d508e7ea499b8e1ff6ed'),
(1122, 1, 'admin', 1, 'rs_1_poster-10', 1, 0, 74885, 'jpg', '03ca1700edaa95362fc5e150f2bed7a8'),
(1123, 1, 'admin', 1, 'rs_1_poster-11', 1, 0, 75837, 'jpg', '3df4930e20b3273080611389129d4986'),
(1124, 1, 'admin', 1, 'rs_1_poster-12', 1, 0, 63447, 'jpg', '7b563a08e1fd936af1f324f09a0384ad'),
(1125, 1, 'admin', 1, 'rs_1_poster-13', 1, 0, 44687, 'jpg', '1b4b2d980d638a7bbe9621859044dcc9'),
(1126, 1, 'admin', 1, 'rs_1_poster-14', 1, 0, 40438, 'jpg', '23e7a1dca538a0d96e3a3a9e45cc4f8a'),
(1127, 1, 'admin', 2, 'rs_2_shop-1', 1, 0, 16046, 'jpg', '1b63f5e07dd4e886f7c54c7eec571eac'),
(1128, 1, 'admin', 1, '', 1, 0, 743496, 'png', '527abff4a0a1cf12d5aa7f6db3bb5487'),
(1129, 1, 'admin', 1, 'rs_1_poster-9', 1, 0, 315433, 'png', 'bf0f5f1a93a0f6935281786f6d85c81e'),
(1130, 1, 'admin', 1, 'rs_1_poster-8', 1, 0, 1911163, 'png', 'b10f888b26f17241964d9b4599598ce8'),
(1131, 1, 'admin', 2, 'rs_2_poster-8', 1, 0, 1911163, 'png', 'b10f888b26f17241964d9b4599598ce8');

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_0`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_0` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表0';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_1`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_1` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表1';

--
-- 转存表中的数据 `rs_attachment_1`
--

INSERT INTO `rs_attachment_1` (`id`, `uid`, `author`, `related`, `filename`, `fileext`, `filesize`, `attachment`, `remote`, `attachinfo`, `inputtime`) VALUES
(1067, 1, 'admin', 'rs_1_news-151', 'timg (8)', 'jpg', 29082, '201704/223b050f9a.jpg', 0, 'a:2:{s:6:\\"height\\";i:449;s:5:\\"width\\";i:680;}', 1493019295),
(1064, 1, 'admin', 'rs_1_poster-3', '未标题-1', 'png', 1075722, '201704/0841659c98.png', 0, 'a:2:{s:6:\\"height\\";i:570;s:5:\\"width\\";i:1920;}', 1493016584),
(1065, 1, 'admin', 'rs_1_poster-7', '00e1312cfc', 'png', 40868, '201704/81d68121f7.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1493018637),
(1062, 1, 'admin', 'rs_1_poster-51', '未标题-1', 'png', 1075722, '201704/39839fced7.png', 0, 'a:2:{s:6:\\"height\\";i:570;s:5:\\"width\\";i:1920;}', 1493016547),
(1061, 1, 'admin', 'rs_1_poster-3', '未标题-1', 'png', 1071544, '201704/ab8b3ace15.png', 0, 'a:2:{s:6:\\"height\\";i:570;s:5:\\"width\\";i:1920;}', 1493016225),
(26, 1, 'admin', 'rs_1_poster-2', 'ad03', 'png', 102031, '201607/14a18f5406.png', 0, 'a:2:{s:6:\\"height\\";i:70;s:5:\\"width\\";i:1201;}', 1467770172),
(27, 1, 'admin', 'rs_1_poster-3', 'slide01', 'png', 497326, '201607/5dd5e10d7d.png', 0, 'a:2:{s:6:\\"height\\";i:371;s:5:\\"width\\";i:1920;}', 1467786202),
(29, 1, 'admin', 'rs_1_poster-5', 'window_l', 'png', 114657, '201607/390d974643.png', 0, 'a:2:{s:6:\\"height\\";i:387;s:5:\\"width\\";i:188;}', 1467789581),
(1101, 1, 'admin', 'rs_1_poster-7', '12', 'jpg', 102769, '201706/f90359ea93.jpg', 0, 'a:2:{s:6:\\"height\\";i:776;s:5:\\"width\\";i:1650;}', 1497197201),
(1070, 1, 'admin', 'rs_1_poster-7', '341095e90a', 'jpg', 36280, '201704/a36f22558c.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1493092482),
(32, 1, 'admin', 'rs_1_poster-7', 'ad04', 'png', 112466, '201607/4aeb524ad0.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1467795272),
(33, 1, 'admin', 'rs_1_poster-8', 'ad08', 'png', 115794, '201607/63a582c7dc.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1467796264),
(34, 1, 'admin', 'rs_1_poster-9', 'ad07', 'png', 77865, '201607/4d140500b2.png', 0, 'a:2:{s:6:\\"height\\";i:595;s:5:\\"width\\";i:241;}', 1467796396),
(35, 1, 'admin', 'rs_1_poster-10', 'ad09', 'png', 82196, '201607/2f6bd41253.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1467797074),
(36, 1, 'admin', 'rs_1_poster-11', 'ad10', 'png', 72602, '201607/48a0de3f0d.png', 0, 'a:2:{s:6:\\"height\\";i:108;s:5:\\"width\\";i:582;}', 1467797273),
(47, 1, 'admin', 'rs_1_poster-12', 'ad23', 'png', 164751, '201607/a3b93f31ab.png', 0, 'a:2:{s:6:\\"height\\";i:476;s:5:\\"width\\";i:319;}', 1469427695),
(48, 1, 'admin', 'rs_1_poster-13', 'ad14', 'png', 256236, '201607/3bd47e6460.png', 0, 'a:2:{s:6:\\"height\\";i:476;s:5:\\"width\\";i:320;}', 1469428235),
(49, 1, 'admin', 'rs_1_poster-14', 'ad21', 'png', 268667, '201607/777d790fe7.png', 0, 'a:2:{s:6:\\"height\\";i:476;s:5:\\"width\\";i:319;}', 1469428262),
(50, 1, 'admin', 'rs_1_poster-15', 'ad22', 'png', 190853, '201607/6de7ca111e.png', 0, 'a:2:{s:6:\\"height\\";i:475;s:5:\\"width\\";i:319;}', 1469428287),
(51, 1, 'admin', 'rs_1_poster-16', 'slideAd01', 'png', 154204, '201607/33c4c07b5a.png', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1469429039),
(52, 1, 'admin', 'rs_1_poster-17', 'slideAd03', 'png', 154962, '201607/9e21cb4924.png', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1469429068),
(53, 1, 'admin', 'rs_1_poster-18', 'news_pic01', 'png', 37100, '201607/ed3aba590c.png', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1469429102),
(54, 1, 'admin', 'rs_1_poster-19', 'slideAd03', 'png', 154962, '201607/15deb90fc6.png', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1469429137),
(55, 1, 'admin', 'rs_1_poster-20', 'slideAd01', 'png', 154204, '201607/2b971f04d4.png', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1469429165),
(1068, 1, 'admin', 'rs_1_news-152', 'timg (9)', 'jpg', 86886, '201704/c2a6494fe3.jpg', 0, 'a:2:{s:6:\\"height\\";i:668;s:5:\\"width\\";i:1000;}', 1493019343),
(59, 1, 'admin', 'rs_1_poster-21', 'banner04', 'png', 148296, '201607/b7c75d1325.png', 0, 'a:2:{s:6:\\"height\\";i:431;s:5:\\"width\\";i:1920;}', 1469434611),
(754, 1, 'admin', 'rs_1_poster-5', '首页浮窗广告1', 'jpg', 37140, '201610/c1f89a0b53.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:70;}', 1476418036),
(88, 1, 'admin', 'rs_1_poster-22', 'ad11', 'png', 50033, '201608/d68278f335.png', 0, 'a:2:{s:6:\\"height\\";i:101;s:5:\\"width\\";i:1199;}', 1470880358),
(89, 1, 'admin', 'rs_1_poster-23', 'ad12', 'png', 32430, '201608/790fce7748.png', 0, 'a:2:{s:6:\\"height\\";i:191;s:5:\\"width\\";i:214;}', 1470880493),
(90, 1, 'admin', 'rs_1_poster-24', 'banner07', 'png', 189645, '201608/6de0ec93d6.png', 0, 'a:2:{s:6:\\"height\\";i:564;s:5:\\"width\\";i:1922;}', 1470880814),
(752, 1, 'admin', 'rs_1_poster-5', '首页浮窗广告1', 'jpg', 37724, '201610/5fb5173c5e.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:70;}', 1476417920),
(750, 1, 'admin', 'rs_1_poster-5', '首页浮窗广告左', 'jpg', 27771, '201610/03789d5285.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:70;}', 1476412680),
(701, 1, 'admin', 'rs_1_news-87', '正航软件', 'jpg', 36239, '201610/7da6425ac7.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476320295),
(155, 1, 'admin', 'rs_1_poster-3', 'banner04', 'png', 148296, '201608/07357da6b9.png', 0, 'a:2:{s:6:\\"height\\";i:431;s:5:\\"width\\";i:1920;}', 1471488829),
(156, 1, 'admin', 'rs_1_poster-21', 'banner04', 'png', 148296, '201608/7c8b66f090.png', 0, 'a:2:{s:6:\\"height\\";i:431;s:5:\\"width\\";i:1920;}', 1471572587),
(157, 1, 'admin', 'rs_1_poster-13', 'ad14', 'png', 256236, '201608/66fd1d441a.png', 0, 'a:2:{s:6:\\"height\\";i:476;s:5:\\"width\\";i:320;}', 1471572613),
(158, 1, 'admin', 'rs_1_poster-14', 'ad21', 'png', 268667, '201608/17c5cd93a8.png', 0, 'a:2:{s:6:\\"height\\";i:476;s:5:\\"width\\";i:319;}', 1471572645),
(159, 1, 'admin', 'rs_1_poster-15', 'ad22', 'png', 190853, '201608/9dcbefb97a.png', 0, 'a:2:{s:6:\\"height\\";i:475;s:5:\\"width\\";i:319;}', 1471572679),
(160, 1, 'admin', 'rs_1_poster-12', 'ad23', 'png', 164751, '201608/bea97c6928.png', 0, 'a:2:{s:6:\\"height\\";i:476;s:5:\\"width\\";i:319;}', 1471572709),
(1055, 1, 'admin', 'rs_1_news-147', '68560cb53f935b3 (1)', 'jpg', 418632, '201704/9612933ce8.jpg', 0, 'a:2:{s:6:\\"height\\";i:458;s:5:\\"width\\";i:1200;}', 1491366731),
(1056, 1, 'admin', 'rs_1_news-148', '40561a34a8c6c53', 'jpg', 45507, '201704/cb478736bd.jpg', 0, 'a:2:{s:6:\\"height\\";i:511;s:5:\\"width\\";i:1200;}', 1491366777),
(1104, 1, 'admin', 'rs_1_poster-7', '1', 'jpg', 817562, '201706/2e4888dedf.jpg', 0, 'a:2:{s:6:\\"height\\";i:900;s:5:\\"width\\";i:1920;}', 1497405228),
(236, 1, 'admin', 'rs_1_poster-26', 'foodDrug001', 'png', 108564, '201609/31b92971bb.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:369;}', 1473143741),
(237, 1, 'admin', 'rs_1_poster-27', 'accounting001', 'png', 159724, '201609/d8693b8cb0.png', 0, 'a:2:{s:6:\\"height\\";i:275;s:5:\\"width\\";i:369;}', 1473143772),
(235, 1, 'admin', 'rs_1_poster-25', 'localTax001', 'png', 101530, '201609/265358360a.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473143667),
(1111, 1, 'admin', 'rs_1_shop-51', 'shop-01', 'jpg', 16046, '201706/d4be82e710.jpg', 0, 'a:2:{s:6:\\"height\\";i:192;s:5:\\"width\\";i:209;}', 1498024953),
(238, 1, 'admin', 'rs_1_poster-28', 'Commerce001', 'png', 127846, '201609/9b366c6324.png', 0, 'a:2:{s:6:\\"height\\";i:278;s:5:\\"width\\";i:366;}', 1473143825),
(239, 1, 'admin', 'rs_1_poster-29', 'irs001', 'png', 144722, '201609/948a2c2b34.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:369;}', 1473143944),
(240, 1, 'admin', 'rs_1_poster-30', 'incomeTax001', 'png', 108646, '201609/e1fe41ceb5.png', 0, 'a:2:{s:6:\\"height\\";i:278;s:5:\\"width\\";i:366;}', 1473143989),
(241, 1, 'admin', 'rs_1_poster-31', 'furtherEducation001', 'png', 98755, '201609/7e6b20af2a.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473144184),
(242, 1, 'admin', 'rs_1_poster-32', 'socialSecurity001', 'png', 127386, '201609/ff828d10f7.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:369;}', 1473144239),
(1059, 1, 'admin', 'rs_1_poster-51', '未标题-1', 'png', 1071544, '201704/35d19657f1.png', 0, 'a:2:{s:6:\\"height\\";i:570;s:5:\\"width\\";i:1920;}', 1493016047),
(249, 1, 'admin', 'rs_1_poster-17', '商城首页楼层广告', 'jpg', 105820, '201609/171ca687a7.jpg', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1473147632),
(250, 1, 'admin', 'rs_1_poster-18', '商城首页楼层广告1', 'jpg', 67277, '201609/3a24c23737.jpg', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1473147719),
(251, 1, 'admin', 'rs_1_poster-20', '商城首页楼层广告3', 'jpg', 79770, '201609/be2c5fb215.jpg', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1473147818),
(252, 1, 'admin', 'rs_1_poster-19', '商城首页楼层广告2', 'jpg', 48118, '201609/6324ece615.jpg', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:439;}', 1473147835),
(253, 1, 'admin', 'rs_1_poster-17', '商城首页楼层广告', 'jpg', 100854, '201609/3fb5aaa116.jpg', 0, 'a:2:{s:6:\\"height\\";i:240;s:5:\\"width\\";i:439;}', 1473147960),
(254, 1, 'admin', 'rs_1_poster-17', '商城首页楼层广告', 'jpg', 102441, '201609/2920977a93.jpg', 0, 'a:2:{s:6:\\"height\\";i:255;s:5:\\"width\\";i:439;}', 1473148037),
(307, 1, 'admin', 'rs_1_news-39', 'hh', 'jpg', 105503, '201609/62c9118d43.jpg', 0, 'a:2:{s:6:\\"height\\";i:420;s:5:\\"width\\";i:300;}', 1473304529),
(321, 1, 'admin', 'rs_1_poster-24', '6de0ec93d6', 'png', 189645, '201609/3187dff1ab.png', 0, 'a:2:{s:6:\\"height\\";i:564;s:5:\\"width\\";i:1922;}', 1473313105),
(322, 1, 'admin', 'rs_1_poster-24', '6de0ec93d6', 'jpg', 412621, '201609/796df3877d.jpg', 0, 'a:2:{s:6:\\"height\\";i:551;s:5:\\"width\\";i:1922;}', 1473313191),
(359, 1, 'admin', 'rs_1_poster-25', '948a2c2b34', 'png', 144722, '201609/6f497170b5.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:369;}', 1473399745),
(360, 1, 'admin', 'rs_1_poster-26', '265358360a', 'png', 101530, '201609/fde0f36b52.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473399804),
(361, 1, 'admin', 'rs_1_poster-27', '财税工具图标6', 'jpg', 75418, '201609/16bf81487a.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473399843),
(362, 1, 'admin', 'rs_1_poster-28', '财税工具图标7', 'jpg', 61317, '201609/fd82abe334.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473399884),
(363, 1, 'admin', 'rs_1_poster-29', '9b366c6324', 'png', 127846, '201609/d7405c545a.png', 0, 'a:2:{s:6:\\"height\\";i:278;s:5:\\"width\\";i:366;}', 1473399914),
(364, 1, 'admin', 'rs_1_poster-30', '31b92971bb', 'png', 108564, '201609/d6f8278e15.png', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:369;}', 1473399949),
(365, 1, 'admin', 'rs_1_poster-31', 'fc8174785c', 'png', 126054, '201609/c21090bf73.png', 0, 'a:2:{s:6:\\"height\\";i:278;s:5:\\"width\\";i:367;}', 1473399984),
(1066, 1, 'admin', 'rs_1_news-149', 'timg (7)', 'jpg', 25907, '201704/714eeeab93.jpg', 0, 'a:2:{s:6:\\"height\\";i:666;s:5:\\"width\\";i:1000;}', 1493019247),
(1058, 1, 'admin', 'rs_1_news-150', 'TB1UDQGMpXXXXcXXVXXXXXXXXXX-293-190', 'png', 39485, '201704/7d91d0a882.png', 0, 'a:2:{s:6:\\"height\\";i:190;s:5:\\"width\\";i:293;}', 1493004934),
(368, 1, 'admin', 'rs_1_poster-35', 'e1fe41ceb5', 'png', 108646, '201609/5fd4f60006.png', 0, 'a:2:{s:6:\\"height\\";i:278;s:5:\\"width\\";i:366;}', 1473400103),
(369, 1, 'admin', 'rs_1_poster-36', '财税工具图标5', 'jpg', 73226, '201609/14e221e676.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473400142),
(370, 1, 'admin', 'rs_1_poster-37', '财税工具图标', 'jpg', 78490, '201609/bf5fec9227.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473400177),
(371, 1, 'admin', 'rs_1_poster-38', '财税工具图标1', 'jpg', 62618, '201609/81b4c7b2f2.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473400219),
(372, 1, 'admin', 'rs_1_poster-39', '财税工具图标2', 'jpg', 56842, '201609/b043717318.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473400257),
(373, 1, 'admin', 'rs_1_poster-40', '财税工具图标4', 'jpg', 87429, '201609/dd1bf1a6ec.jpg', 0, 'a:2:{s:6:\\"height\\";i:276;s:5:\\"width\\";i:368;}', 1473400295),
(389, 1, 'admin', 'rs_1_poster-3', '首页轮播图2', 'jpg', 198574, '201609/e37fad5755.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1473661282),
(445, 1, 'admin', 'rs_1_poster-41', 'ad26', 'png', 109496, '201609/f27e3839b9.png', 0, 'a:2:{s:6:\\"height\\";i:237;s:5:\\"width\\";i:286;}', 1473750907),
(454, 1, 'admin', 'rs_1_poster-41', '180x180', 'jpg', 25426, '201609/b7d907a57e.jpg', 0, 'a:2:{s:6:\\"height\\";i:180;s:5:\\"width\\";i:180;}', 1473820436),
(457, 1, 'admin', 'rs_1_poster-42', '门口广告牌', 'jpg', 138045, '201609/0df720e100.jpg', 0, 'a:2:{s:6:\\"height\\";i:468;s:5:\\"width\\";i:500;}', 1473832141),
(458, 1, 'admin', 'rs_1_poster-41', '门口广告牌', 'jpg', 86907, '201609/823e0a87a8.jpg', 0, 'a:2:{s:6:\\"height\\";i:468;s:5:\\"width\\";i:500;}', 1473832297),
(459, 1, 'admin', 'rs_1_poster-43', '公司形象墙', 'jpg', 114360, '201609/3d5d21a535.jpg', 0, 'a:2:{s:6:\\"height\\";i:800;s:5:\\"width\\";i:800;}', 1473832390),
(460, 1, 'admin', 'rs_1_poster-43', '公司形象墙', 'jpg', 171889, '201609/ef5ceca7f0.jpg', 0, 'a:2:{s:6:\\"height\\";i:500;s:5:\\"width\\";i:500;}', 1473832728),
(462, 1, 'admin', 'rs_1_poster-44', '公司形象墙', 'jpg', 101222, '201609/52668aef1d.jpg', 0, 'a:2:{s:6:\\"height\\";i:500;s:5:\\"width\\";i:500;}', 1473835094),
(497, 1, 'admin', 'rs_1_poster-21', '商城banner', 'jpg', 455547, '201609/1ce9e52c5c.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1474269578),
(498, 1, 'admin', 'rs_1_poster-21', '商城banner', 'jpg', 439286, '201609/94246d7489.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1474270145),
(499, 1, 'admin', 'rs_1_poster-21', '商城banner', 'jpg', 437187, '201609/8092d61cf5.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1474270896),
(705, 1, 'admin', 'rs_1_news-87', '正航软件', 'jpg', 36241, 'ueditor/image/20161013/1476321033136281.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476321032),
(1100, 1, 'admin', 'rs_1_poster-7', '7a10a3bac7', 'jpg', 126495, '201706/4ec682fc89.jpg', 0, 'a:2:{s:6:\\"height\\";i:900;s:5:\\"width\\";i:1920;}', 1497196982),
(1072, 1, 'admin', 'rs_1_poster-3', '未标题-2', 'jpg', 186778, '201704/7d8f88520f.jpg', 0, 'a:2:{s:6:\\"height\\";i:570;s:5:\\"width\\";i:1920;}', 1493108732),
(1069, 1, 'admin', 'rs_1_poster-8', '00e1312cfc', 'png', 40868, '201704/d11c85523e.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1493092379),
(1052, 1, 'admin', 'rs_1_news-144', '1473061988126780', 'jpg', 732887, '201704/2a9ba9dd3a.jpg', 0, 'a:2:{s:6:\\"height\\";i:708;s:5:\\"width\\";i:2826;}', 1491366491),
(1053, 1, 'admin', 'rs_1_news-145', '1473062194892651', 'jpg', 98345, '201704/0bab407bcd.jpg', 0, 'a:2:{s:6:\\"height\\";i:208;s:5:\\"width\\";i:1087;}', 1491366591),
(1054, 1, 'admin', 'rs_1_news-146', '1473061350107824', 'jpg', 1190533, '201704/0d56dc2ace.jpg', 0, 'a:2:{s:6:\\"height\\";i:708;s:5:\\"width\\";i:2826;}', 1491366670),
(562, 1, 'admin', 'rs_1_poster-21', '商城banner', 'jpg', 275200, '201609/d508b08cf6.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1474440223),
(563, 1, 'admin', 'rs_1_poster-21', '商城banner', 'jpg', 291758, '201609/a30cb7960e.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1474440419),
(564, 1, 'admin', 'rs_1_poster-21', '商城banner', 'jpg', 291379, '201609/c4d1758176.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1474440940),
(1034, 1, 'admin', 'rs_1_news-134', 'QQ截图20170403181546', 'jpg', 43915, 'ueditor/image/20170403/1491214561421969.jpg', 0, 'a:2:{s:6:\\"height\\";i:583;s:5:\\"width\\";i:802;}', 1491214559),
(1035, 1, 'admin', 'rs_1_news-134', 'QQ截图20170403181546', 'jpg', 43919, '201704/19b3e721b7.jpg', 0, 'a:2:{s:6:\\"height\\";i:583;s:5:\\"width\\";i:802;}', 1491214603),
(1036, 1, 'admin', 'rs_1_poster-48', '1', 'jpg', 29389, '201704/1f457cdaba.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222446),
(1037, 1, 'admin', 'rs_1_poster-47', '2', 'jpg', 19241, '201704/1b855b4f2d.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222473),
(1038, 1, 'admin', 'rs_1_poster-46', '3', 'jpg', 14572, '201704/fdfeb6ddc7.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222501),
(1039, 1, 'admin', 'rs_1_poster-46', '3', 'jpg', 14572, '201704/d400c0436c.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222530),
(1040, 1, 'admin', 'rs_1_poster-45', '4', 'jpg', 25098, '201704/d690ab2595.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222563),
(1041, 1, 'admin', 'rs_1_poster-44', '5', 'jpg', 20623, '201704/9a1cb5a1fa.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222645),
(1042, 1, 'admin', 'rs_1_poster-43', '6', 'jpg', 17183, '201704/8042ab666c.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222685),
(1043, 1, 'admin', 'rs_1_poster-42', '7', 'jpg', 15995, '201704/a658c098ed.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222729),
(1044, 1, 'admin', 'rs_1_poster-41', '8', 'jpg', 26378, '201704/8cd158f91b.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1491222761),
(1099, 1, 'admin', 'rs_1_poster-7', '1', 'jpg', 817562, '201706/86c56e1032.jpg', 0, 'a:2:{s:6:\\"height\\";i:900;s:5:\\"width\\";i:1920;}', 1496817259),
(1046, 1, 'admin', 'rs_1_poster-5', '1', 'jpg', 16568, '201704/ca25957d4d.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:70;}', 1491269070),
(1033, 1, 'admin', 'rs_1_news-133', 'u=2594566419,4199881695&fm=23&gp=0', 'jpg', 18524, '201704/670b5b4876.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:480;}', 1491214312),
(591, 1, 'admin', 'rs_1_poster-45', '祥榕LOGO', 'jpg', 84419, '201609/47bc1f0614.jpg', 0, 'a:2:{s:6:\\"height\\";i:344;s:5:\\"width\\";i:340;}', 1474592400),
(592, 1, 'admin', 'rs_1_poster-46', '品冠', 'jpg', 45158, '201609/af6a290324.jpg', 0, 'a:2:{s:6:\\"height\\";i:203;s:5:\\"width\\";i:203;}', 1474592557),
(593, 1, 'admin', 'rs_1_poster-47', '俊尚标志', 'jpg', 160389, '201609/81958b05d6.jpg', 0, 'a:2:{s:6:\\"height\\";i:1209;s:5:\\"width\\";i:1209;}', 1474592704),
(595, 1, 'admin', 'rs_1_poster-48', 'logo', 'jpg', 39905, '201609/633f0c9ecb.jpg', 0, 'a:2:{s:6:\\"height\\";i:201;s:5:\\"width\\";i:201;}', 1474594806),
(1030, 1, 'admin', 'rs_1_poster-51', '52cfe29696', 'jpg', 140206, '201704/d0a10a73e4.jpg', 0, 'a:2:{s:6:\\"height\\";i:480;s:5:\\"width\\";i:1920;}', 1491210508),
(1032, 1, 'admin', 'rs_1_poster-3', 'e80a49d21b', 'jpg', 140206, '201704/31c2e85686.jpg', 0, 'a:2:{s:6:\\"height\\";i:480;s:5:\\"width\\";i:1920;}', 1491210595),
(622, 1, 'admin', 'rs_1_poster-49', 'banner01', 'png', 634450, '201609/6ff577b444.png', 0, 'a:2:{s:6:\\"height\\";i:530;s:5:\\"width\\";i:1920;}', 1474962953),
(626, 1, 'admin', 'rs_1_poster-7', '首页横条广告条', 'png', 133540, '201609/7d9e7b403d.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475203200),
(627, 1, 'admin', 'rs_1_poster-7', '中部1', 'png', 115794, '201609/00e1312cfc.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475203305),
(628, 1, 'admin', 'rs_1_poster-8', '首页横条广告条', 'png', 132792, '201609/341095e90a.png', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475203306),
(647, 1, 'admin', 'rs_1_poster-10', '首页横条广告条', 'jpg', 175360, '201610/86e340e335.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475910183),
(648, 1, 'admin', 'rs_1_poster-10', '首页横条广告条', 'jpg', 160246, '201610/dc61489b80.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475910433),
(649, 1, 'admin', 'rs_1_poster-10', '首页横条广告条', 'jpg', 148849, '201610/ca62bd6084.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475910939),
(650, 1, 'admin', 'rs_1_poster-10', '首页横条广告条', 'jpg', 149719, '201610/db0aeaebbe.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475911150),
(651, 1, 'admin', 'rs_1_poster-10', '首页横条广告条', 'jpg', 163492, '201610/9b1706a9fd.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475912177),
(652, 1, 'admin', 'rs_1_poster-10', '首页横条广告条', 'jpg', 162550, '201610/f89a16aa30.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1475912272),
(1071, 1, 'admin', 'rs_1_poster-51', '未标题-2', 'jpg', 183572, '201704/ec99479304.jpg', 0, 'a:2:{s:6:\\"height\\";i:570;s:5:\\"width\\";i:1920;}', 1493107126),
(661, 1, 'admin', 'rs_1_poster-24', '796df3877d', 'jpg', 314685, '201610/c30e482cdb.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476155992),
(662, 1, 'admin', 'rs_1_poster-49', '6ff577b444', 'jpg', 298598, '201610/b029a2b2be.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476156412),
(663, 1, 'admin', 'rs_1_poster-24', '796df3877d', 'jpg', 294451, '201610/14c3d18958.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1922;}', 1476156699),
(665, 1, 'admin', 'rs_1_poster-48', '633f0c9ecb', 'jpg', 33167, '201610/e7ae8432fc.jpg', 0, 'a:2:{s:6:\\"height\\";i:105;s:5:\\"width\\";i:232;}', 1476233948),
(667, 1, 'admin', 'rs_1_news-81', '福州佳航1logo', 'jpg', 40622, '201610/733b6bb216.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476235587),
(671, 1, 'admin', 'rs_1_news-81', '福州佳航1logo', 'jpg', 40625, 'ueditor/image/20161012/1476236190941191.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476236189),
(672, 1, 'admin', 'rs_1_news-82', '福州中恒1logo', 'jpg', 29917, 'ueditor/image/20161012/1476236765358712.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476236764),
(673, 1, 'admin', 'rs_1_news-82', '福州中恒1logo', 'jpg', 29921, '201610/c86caed7cb.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476236819),
(674, 1, 'admin', 'rs_1_news-83', '福建企业百事通', 'jpg', 38114, 'ueditor/image/20161012/1476237392838775.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476237391),
(675, 1, 'admin', 'rs_1_news-84', '福建世创集团', 'jpg', 29695, 'ueditor/image/20161012/1476238562124873.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476238561),
(676, 1, 'admin', 'rs_1_news-84', '福建世创集团', 'jpg', 29696, '201610/c64ecdc7ff.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476238627),
(677, 1, 'admin', 'rs_1_news-83', '福建企业百事通', 'jpg', 38113, '201610/155e0c733f.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476238656),
(678, 1, 'admin', 'rs_1_news-85', '祥榕商标logo', 'jpg', 39965, 'ueditor/image/20161012/1476238905133579.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476238904),
(679, 1, 'admin', 'rs_1_news-85', '祥榕商标logo', 'jpg', 39967, '201610/4068d4fdca.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476238972),
(681, 1, 'admin', 'rs_1_news-86', '品冠logo', 'jpg', 30689, '201610/3f488e7c60.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476239428),
(680, 1, 'admin', 'rs_1_news-86', '品冠logo', 'jpg', 30690, 'ueditor/image/20161012/1476239375354452.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476239373),
(682, 1, 'admin', 'rs_1_poster-42', '福建世创集团', 'jpg', 29696, '201610/5e929c9846.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476239651),
(683, 1, 'admin', 'rs_1_poster-41', '福州佳航logo', 'jpg', 86927, '201610/0de14655f1.jpg', 0, 'a:2:{s:6:\\"height\\";i:400;s:5:\\"width\\";i:400;}', 1476239958),
(684, 1, 'admin', 'rs_1_poster-41', '福州佳航logo', 'jpg', 99256, '201610/959180b170.jpg', 0, 'a:2:{s:6:\\"height\\";i:400;s:5:\\"width\\";i:400;}', 1476240115),
(716, 1, 'admin', 'rs_1_poster-48', '正航软件', 'png', 27986, '201610/1196900218.png', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1476328391),
(717, 1, 'admin', 'rs_1_poster-48', '正航软件', 'jpg', 46746, '201610/c4660478a4.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1476328492),
(719, 1, 'admin', 'rs_1_news-88', '81958b05d6', 'jpg', 37969, 'ueditor/image/20161013/1476328947345330.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476328945),
(720, 1, 'admin', 'rs_1_news-88', '81958b05d6', 'jpg', 37970, '201610/4449466ac8.jpg', 0, 'a:2:{s:6:\\"height\\";i:134;s:5:\\"width\\";i:224;}', 1476329083),
(721, 1, 'admin', 'rs_1_poster-48', '正航软件', 'jpg', 46746, '201610/7f765c5cbd.jpg', 0, 'a:2:{s:6:\\"height\\";i:220;s:5:\\"width\\";i:233;}', 1476329248),
(1051, 1, 'admin', 'rs_1_news-143', '3', 'png', 162990, '201704/2cad91fabe.png', 0, 'a:2:{s:6:\\"height\\";i:371;s:5:\\"width\\";i:442;}', 1491284562),
(1098, 1, 'admin', 'rs_1_poster-2', '1', 'jpg', 817562, '201706/7a10a3bac7.jpg', 0, 'a:2:{s:6:\\"height\\";i:900;s:5:\\"width\\";i:1920;}', 1496817199),
(737, 1, 'admin', 'rs_1_poster-5', '未标题-1', 'jpg', 46070, '201610/efa15939cc.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:80;}', 1476341701),
(738, 1, 'admin', 'rs_1_poster-21', 'c4d1758176', 'jpg', 291379, '201610/ebf13f113e.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476342059),
(740, 1, 'admin', 'rs_1_poster-3', '首页轮播图2', 'jpg', 383959, '201610/4ae7f20bc2.jpg', 0, 'a:2:{s:6:\\"height\\";i:582;s:5:\\"width\\";i:3023;}', 1476342197),
(742, 1, 'admin', 'rs_1_poster-3', '首页轮播图2222', 'jpg', 383959, '201610/067dded514.jpg', 0, 'a:2:{s:6:\\"height\\";i:582;s:5:\\"width\\";i:3023;}', 1476342693),
(744, 1, 'admin', 'rs_1_poster-3', '首页轮播图2222', 'jpg', 202496, '201610/4f9bf6e9d0.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476342811),
(745, 1, 'admin', 'rs_1_poster-5', '正航软件 广告', 'png', 38779, '201610/afdddd264d.png', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:80;}', 1476342817),
(747, 1, 'admin', 'rs_1_poster-3', '首页轮播图2', 'jpg', 202496, '201610/be7edf8276.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476342927),
(748, 1, 'admin', 'rs_1_poster-5', '未标题-1', 'jpg', 46070, '201610/1d976b043a.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:80;}', 1476342966),
(1050, 1, 'admin', 'rs_1_news-142', '2', 'jpg', 12247, '201704/1561810dfc.jpg', 0, 'a:2:{s:6:\\"height\\";i:300;s:5:\\"width\\";i:449;}', 1491284538),
(1049, 1, 'admin', 'rs_1_news-141', '1', 'jpg', 29686, '201704/907a1195cf.jpg', 0, 'a:2:{s:6:\\"height\\";i:350;s:5:\\"width\\";i:614;}', 1491284507),
(769, 1, 'admin', 'rs_1_news-83', '企业百事通', 'png', 671405, 'ueditor/image/20161014/1476429490107695.png', 0, 'a:2:{s:6:\\"height\\";i:643;s:5:\\"width\\";i:1307;}', 1476429489),
(804, 1, 'admin', 'rs_1_poster-51', '首页轮播图', 'jpg', 353618, '201610/3c6054b358.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476762837),
(805, 1, 'admin', 'rs_1_poster-51', '首页轮播图', 'jpg', 456602, '201610/84fd806750.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1476763193),
(866, 1, 'admin', 'rs_1_news-87', 'tel', 'png', 4468, 'ueditor/image/20161027/1477532734519823.png', 0, 'a:2:{s:6:\\"height\\";i:43;s:5:\\"width\\";i:238;}', 1477532733),
(867, 1, 'admin', 'rs_1_news-87', 'rBACFFKR5mDScmocAABWdHJnshw497', 'png', 22132, 'ueditor/image/20161027/1477533201958403.png', 0, 'a:2:{s:6:\\"height\\";i:275;s:5:\\"width\\";i:440;}', 1477533200),
(868, 1, 'admin', 'rs_1_news-87', '图片2', 'png', 1162016, 'ueditor/image/20161027/1477534462651845.png', 0, 'a:2:{s:6:\\"height\\";i:887;s:5:\\"width\\";i:1705;}', 1477534460),
(880, 1, 'admin', 'rs_1_poster-52', '电子发票查询', 'png', 40806, '201610/df9781e067.png', 0, 'a:2:{s:6:\\"height\\";i:275;s:5:\\"width\\";i:369;}', 1477645330),
(881, 1, 'admin', 'rs_1_poster-52', '电子发票查询', 'png', 40878, '201610/64df26f959.png', 0, 'a:2:{s:6:\\"height\\";i:275;s:5:\\"width\\";i:369;}', 1477645413),
(1048, 1, 'admin', 'rs_1_poster-24', '14c3d18958', 'png', 877578, '201704/f255f09295.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1922;}', 1491282266),
(886, 1, 'admin', 'rs_1_news-103', '微信二维码', 'png', 42468, 'ueditor/image/20161108/1478580147197946.png', 0, 'a:2:{s:6:\\"height\\";i:292;s:5:\\"width\\";i:291;}', 1478580146),
(887, 1, 'admin', 'rs_1_news-103', '1', 'jpg', 925495, 'ueditor/image/20161108/1478580432184089.jpg', 0, 'a:2:{s:6:\\"height\\";i:1080;s:5:\\"width\\";i:1920;}', 1478580431),
(888, 1, 'admin', 'rs_1_news-103', '1', 'png', 111452, '201611/db7807100b.png', 0, 'a:2:{s:6:\\"height\\";i:280;s:5:\\"width\\";i:489;}', 1478581064),
(889, 1, 'admin', 'rs_1_news-103', '2', 'png', 6362, 'ueditor/image/20161108/1478581122666390.png', 0, 'a:2:{s:6:\\"height\\";i:74;s:5:\\"width\\";i:92;}', 1478581121),
(890, 1, 'admin', 'rs_1_poster-47', '1', 'png', 111452, '201611/e2317182e0.png', 0, 'a:2:{s:6:\\"height\\";i:280;s:5:\\"width\\";i:489;}', 1478581355),
(891, 1, 'admin', 'rs_1_news-103', '高意科技（学校宣传资料）1-07', 'jpg', 1790715, 'ueditor/image/20161110/1478749995108758.jpg', 0, 'a:2:{s:6:\\"height\\";i:1949;s:5:\\"width\\";i:3508;}', 1478749993),
(1047, 1, 'admin', 'rs_1_poster-24', '14c3d18958', 'png', 489144, '201704/98265eee80.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1922;}', 1491281762),
(894, 1, 'admin', 'rs_1_poster-22', '2', 'jpg', 34836, '201611/bdff240f59.jpg', 0, 'a:2:{s:6:\\"height\\";i:100;s:5:\\"width\\";i:1200;}', 1479800238),
(936, 1, 'admin', 'rs_1_poster-51', '会计培训', 'jpg', 376883, '201612/3d745b662b.jpg', 0, 'a:2:{s:6:\\"height\\";i:474;s:5:\\"width\\";i:1920;}', 1481619023),
(937, 1, 'admin', 'rs_1_poster-51', '会计培训', 'jpg', 339814, '201612/f867d8a825.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1481619365),
(940, 1, 'admin', 'rs_1_poster-51', '更多', 'jpg', 271288, '201612/ed1b93871c.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1481619606),
(941, 1, 'admin', 'rs_1_poster-10', '未标题-1', 'jpg', 2932756, '201612/8d1946ab11.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1481794321),
(942, 1, 'admin', 'rs_1_poster-10', 'f89a16aa30', 'jpg', 162550, '201612/b0d7dd53cb.jpg', 0, 'a:2:{s:6:\\"height\\";i:151;s:5:\\"width\\";i:1920;}', 1481794383),
(1009, 1, 'admin', 'rs_1_poster-51', '333333', 'png', 453130, '201703/d911f93a71.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489390322),
(1010, 1, 'admin', 'rs_1_poster-51', '333333', 'png', 453048, '201703/113b182994.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489390874),
(1011, 1, 'admin', 'rs_1_poster-51', '333333', 'png', 453048, '201703/6d0ac6c126.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489390954),
(1012, 1, 'admin', 'rs_1_poster-51', '333333', 'png', 740454, '201703/21036e7ece.png', 0, 'a:2:{s:6:\\"height\\";i:555;s:5:\\"width\\";i:2349;}', 1489391087),
(1013, 1, 'admin', 'rs_1_poster-51', '5555', 'png', 295025, '201703/83b854e033.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489391310),
(1014, 1, 'admin', 'rs_1_poster-51', '333333', 'png', 454103, '201703/1df960865c.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489391418),
(1018, 1, 'admin', 'rs_1_poster-3', '44444', 'png', 792340, '201703/9c82472464.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489392484),
(1019, 1, 'admin', 'rs_1_poster-3', '44444', 'png', 782172, '201703/833b0cb531.png', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1489392849),
(1074, 1, 'admin', 'rs_1_shop-51', '联标管理中心', 'png', 1600073, 'ueditor/image/20170426/1493191832641862.png', 0, 'a:2:{s:6:\\"height\\";i:934;s:5:\\"width\\";i:1920;}', 1493191830),
(1075, 1, 'admin', 'rs_1_poster-55', 'banner_home002', 'jpg', 106107, '201705/43dbd14f91.jpg', 0, 'a:2:{s:6:\\"height\\";i:381;s:5:\\"width\\";i:1440;}', 1495418281),
(1076, 1, 'admin', 'rs_1_poster-56', 'banner_home003', 'jpg', 122327, '201705/40d8b07a99.jpg', 0, 'a:2:{s:6:\\"height\\";i:381;s:5:\\"width\\";i:1440;}', 1495418299),
(1077, 1, 'admin', 'rs_1_poster-57', 'banner_home004', 'jpg', 112394, '201705/5984bd0f0a.jpg', 0, 'a:2:{s:6:\\"height\\";i:381;s:5:\\"width\\";i:1440;}', 1495418311),
(1078, 1, 'admin', 'rs_1_poster-55', 'Banner_in_01', 'jpg', 86405, '201706/38a341e580.jpg', 0, 'a:2:{s:6:\\"height\\";i:384;s:5:\\"width\\";i:1920;}', 1496281682),
(1079, 1, 'admin', 'rs_1_poster-3', 'Banner_in_03', 'jpg', 61286, '201706/cf8f7df4bb.jpg', 0, 'a:2:{s:6:\\"height\\";i:281;s:5:\\"width\\";i:1920;}', 1496591328),
(1089, 1, 'admin', 'rs_1_page-4', 'pub_01', 'jpg', 13404, '201706/54011f2afa.jpg', 0, 'a:2:{s:6:\\"height\\";i:168;s:5:\\"width\\";i:242;}', 1496713230),
(1091, 1, 'admin', 'rs_1_poster-5', 'Banner_in_02', 'jpg', 113398, '201706/475245fbc0.jpg', 0, 'a:2:{s:6:\\"height\\";i:382;s:5:\\"width\\";i:1920;}', 1496719100),
(1092, 1, 'admin', 'rs_1_poster-2', 'f56a86f9bc', 'jpg', 155730, '201706/1cac042c16.jpg', 0, 'a:2:{s:6:\\"height\\";i:725;s:5:\\"width\\";i:1920;}', 1496754399),
(1093, 1, 'admin', 'rs_1_poster-5', '红底', 'png', 438538, '201706/ad5c73848c.png', 0, 'a:2:{s:6:\\"height\\";i:722;s:5:\\"width\\";i:1920;}', 1496810834),
(1097, 1, 'admin', 'rs_1_poster-5', 'e1642ddec9db9ad44182ff4ac94942e0', 'jpg', 629463, '201706/73df142bf1.jpg', 0, 'a:2:{s:6:\\"height\\";i:810;s:5:\\"width\\";i:1920;}', 1496811172),
(1095, 1, 'admin', 'rs_1_poster-2', '红底', 'png', 438538, '201706/b7b9420e0a.png', 0, 'a:2:{s:6:\\"height\\";i:722;s:5:\\"width\\";i:1920;}', 1496811057),
(1096, 1, 'admin', 'rs_1_poster-7', '业务1', 'jpg', 388291, '201706/b0d2c67bc3.jpg', 0, 'a:2:{s:6:\\"height\\";i:722;s:5:\\"width\\";i:1920;}', 1496811078),
(1102, 1, 'admin', 'rs_1_poster-7', '1', 'jpg', 111360, '201706/43ecf18710.jpg', 0, 'a:2:{s:6:\\"height\\";i:727;s:5:\\"width\\";i:1554;}', 1497198184),
(1103, 1, 'admin', 'rs_1_poster-7', '2', 'jpg', 97567, '201706/71e42f26a2.jpg', 0, 'a:2:{s:6:\\"height\\";i:661;s:5:\\"width\\";i:1412;}', 1497198260),
(1105, 1, 'admin', 'rs_1_poster-2', 'timg1', 'jpg', 209684, '201706/a2f30ab8c9.jpg', 0, 'a:2:{s:6:\\"height\\";i:900;s:5:\\"width\\";i:1920;}', 1497405375),
(1106, 1, 'admin', 'rs_1_page-5', 'pub_02', 'jpg', 9933, '201706/361de0ffb2.jpg', 0, 'a:2:{s:6:\\"height\\";i:168;s:5:\\"width\\";i:242;}', 1497537813),
(1107, 1, 'admin', 'rs_1_page-6', 'pub_03', 'jpg', 9062, '201706/f2b30bb1fa.jpg', 0, 'a:2:{s:6:\\"height\\";i:168;s:5:\\"width\\";i:242;}', 1497537836),
(1108, 1, 'admin', 'rs_1_page-7', 'pub_04', 'jpg', 23849, '201706/bbaed4b826.jpg', 0, 'a:2:{s:6:\\"height\\";i:168;s:5:\\"width\\";i:242;}', 1497537864),
(1109, 1, 'admin', 'rs_1_page-8', 'pub_05', 'jpg', 16865, '201706/3a06d09ba5.jpg', 0, 'a:2:{s:6:\\"height\\";i:168;s:5:\\"width\\";i:242;}', 1497537884),
(1110, 1, 'admin', 'rs_1_page-9', 'pub_06', 'jpg', 9134, '201706/37b9e854c3.jpg', 0, 'a:2:{s:6:\\"height\\";i:168;s:5:\\"width\\";i:242;}', 1497537904),
(1112, 1, 'admin', 'rs_1_shop-51', 'shop-01', 'jpg', 16046, '201706/1405ac657c.jpg', 0, 'a:2:{s:6:\\"height\\";i:192;s:5:\\"width\\";i:209;}', 1498028706),
(1113, 1, 'admin', 'rs_1_poster-8', 'shopbanner', 'jpg', 208067, '201706/99747a2672.jpg', 0, 'a:2:{s:6:\\"height\\";i:450;s:5:\\"width\\";i:1392;}', 1498031213),
(1114, 1, 'admin', 'rs_1_shop-52', 'shop-02', 'jpg', 15370, '201706/64cf41dd24.jpg', 0, 'a:2:{s:6:\\"height\\";i:188;s:5:\\"width\\";i:213;}', 1498138454),
(1115, 1, 'admin', 'rs_2_poster-9', 'shop-1F', 'jpg', 65761, '201706/5a6a574846.jpg', 0, 'a:2:{s:6:\\"height\\";i:533;s:5:\\"width\\";i:318;}', 1498304537),
(1116, 1, 'admin', 'rs_2_poster-10', 'shop-2F', 'jpg', 74885, '201706/5b75e27c58.jpg', 0, 'a:2:{s:6:\\"height\\";i:532;s:5:\\"width\\";i:318;}', 1498305289),
(1117, 1, 'admin', 'rs_2_poster-11', 'shop-3F', 'jpg', 75837, '201706/71de197e3c.jpg', 0, 'a:2:{s:6:\\"height\\";i:531;s:5:\\"width\\";i:318;}', 1498305317),
(1118, 1, 'admin', 'rs_2_poster-12', 'shop-4F', 'jpg', 63447, '201706/0495d1e440.jpg', 0, 'a:2:{s:6:\\"height\\";i:532;s:5:\\"width\\";i:319;}', 1498305351),
(1119, 1, 'admin', 'rs_2_poster-13', 'shop-05', 'jpg', 44687, '201706/30fdacdcce.jpg', 0, 'a:2:{s:6:\\"height\\";i:263;s:5:\\"width\\";i:442;}', 1498305872),
(1120, 1, 'admin', 'rs_2_poster-14', 'shop-06', 'jpg', 40438, '201706/7a2d2a1f51.jpg', 0, 'a:2:{s:6:\\"height\\";i:264;s:5:\\"width\\";i:434;}', 1498305896),
(1121, 1, 'admin', 'rs_1_poster-9', 'shop-1F', 'jpg', 65761, '201706/59bf30dbee.jpg', 0, 'a:2:{s:6:\\"height\\";i:533;s:5:\\"width\\";i:318;}', 1498306773),
(1122, 1, 'admin', 'rs_1_poster-10', 'shop-2F', 'jpg', 74885, '201706/f9572d8cdd.jpg', 0, 'a:2:{s:6:\\"height\\";i:532;s:5:\\"width\\";i:318;}', 1498306794),
(1123, 1, 'admin', 'rs_1_poster-11', 'shop-3F', 'jpg', 75837, '201706/ec044acd90.jpg', 0, 'a:2:{s:6:\\"height\\";i:531;s:5:\\"width\\";i:318;}', 1498306827),
(1124, 1, 'admin', 'rs_1_poster-12', 'shop-4F', 'jpg', 63447, '201706/5e6f4282d2.jpg', 0, 'a:2:{s:6:\\"height\\";i:532;s:5:\\"width\\";i:319;}', 1498306860),
(1125, 1, 'admin', 'rs_1_poster-13', 'shop-05', 'jpg', 44687, '201706/d556aaa891.jpg', 0, 'a:2:{s:6:\\"height\\";i:263;s:5:\\"width\\";i:442;}', 1498306917),
(1126, 1, 'admin', 'rs_1_poster-14', 'shop-06', 'jpg', 40438, '201706/03b6649da9.jpg', 0, 'a:2:{s:6:\\"height\\";i:264;s:5:\\"width\\";i:434;}', 1498306941),
(1127, 1, 'admin', 'rs_2_shop-1', 'shop-01', 'jpg', 16046, '201706/0c63817e32.jpg', 0, 'a:2:{s:6:\\"height\\";i:192;s:5:\\"width\\";i:209;}', 1498307045),
(1129, 1, 'admin', 'rs_1_poster-9', '1', 'png', 315433, '201706/6e3a465ebb.png', 0, 'a:2:{s:6:\\"height\\";i:526;s:5:\\"width\\";i:314;}', 1498459847),
(1130, 1, 'admin', 'rs_1_poster-8', '微信截图_20170629094718', 'png', 1911163, '201706/d4289674ed.png', 0, 'a:2:{s:6:\\"height\\";i:536;s:5:\\"width\\";i:1897;}', 1498700861),
(1131, 1, 'admin', 'rs_2_poster-8', '微信截图_20170629094718', 'png', 1911163, '201706/7ff231b047.png', 0, 'a:2:{s:6:\\"height\\";i:536;s:5:\\"width\\";i:1897;}', 1498701085);

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_2`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_2` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表2';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_3`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_3` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表3';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_4`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_4` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表4';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_5`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_5` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表5';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_6`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_6` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表6';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_7`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_7` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表7';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_8`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_8` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表8';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_9`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_9` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表9';

-- --------------------------------------------------------

--
-- 表的结构 `rs_attachment_unused`
--

CREATE TABLE IF NOT EXISTS `rs_attachment_unused` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='未使用的附件表';

--
-- 转存表中的数据 `rs_attachment_unused`
--

INSERT INTO `rs_attachment_unused` (`id`, `uid`, `author`, `siteid`, `filename`, `fileext`, `filesize`, `attachment`, `remote`, `attachinfo`, `inputtime`) VALUES
(896, 1, 'admin', 1, '01合照1', 'jpg', 153151, 'ueditor/image/20161130/1480494447950485.jpg', 0, 'a:2:{s:6:\\"height\\";i:533;s:5:\\"width\\";i:800;}', 1480494445),
(924, 1, 'admin', 1, '1', 'jpg', 58766, 'ueditor/image/20161201/1480555525138269.jpg', 0, 'a:2:{s:6:\\"height\\";i:201;s:5:\\"width\\";i:800;}', 1480555524),
(939, 1, 'admin', 1, '更多', 'jpg', 271288, '201612/bbc58575c8.jpg', 0, 'a:2:{s:6:\\"height\\";i:370;s:5:\\"width\\";i:1920;}', 1481619595),
(943, 1, 'admin', 1, 'IMG_0604', 'jpg', 408145, 'ueditor/image/20161219/1482112577176344.jpg', 0, 'a:2:{s:6:\\"height\\";i:571;s:5:\\"width\\";i:800;}', 1482112575),
(944, 1, 'admin', 1, '未标题-1', 'jpg', 164035, 'ueditor/image/20161219/1482112904264129.jpg', 0, 'a:2:{s:6:\\"height\\";i:604;s:5:\\"width\\";i:800;}', 1482112902),
(956, 1, 'admin', 1, 'DSC01587', 'jpg', 412769, 'ueditor/image/20161221/1482305265621723.jpg', 0, 'a:2:{s:6:\\"height\\";i:450;s:5:\\"width\\";i:800;}', 1482305263),
(969, 1, 'admin', 1, 'IMG_1076', 'jpg', 109286, 'ueditor/image/20161229/1482977853103702.jpg', 0, 'a:2:{s:6:\\"height\\";i:600;s:5:\\"width\\";i:800;}', 1482977852),
(959, 1, 'admin', 1, 'DSC01581', 'jpg', 390246, 'ueditor/image/20161221/1482305326885766.jpg', 0, 'a:2:{s:6:\\"height\\";i:450;s:5:\\"width\\";i:800;}', 1482305325),
(985, 1, 'admin', 1, '1 (2)', 'jpg', 96298, 'ueditor/image/20170124/1485239610343866.jpg', 0, 'a:2:{s:6:\\"height\\";i:512;s:5:\\"width\\";i:1024;}', 1485239608),
(1002, 1, 'admin', 1, 'IMG_4263', 'jpg', 366452, 'ueditor/image/20170313/1489383832789504.jpg', 0, 'a:2:{s:6:\\"height\\";i:563;s:5:\\"width\\";i:800;}', 1489383831),
(1003, 1, 'admin', 1, 'QQ图片20170310111733', 'jpg', 387634, 'ueditor/image/20170313/1489383879987364.jpg', 0, 'a:2:{s:6:\\"height\\";i:600;s:5:\\"width\\";i:800;}', 1489383878),
(1004, 1, 'admin', 1, 'QQ图片20170310111708', 'jpg', 370123, 'ueditor/image/20170313/1489383902138502.jpg', 0, 'a:2:{s:6:\\"height\\";i:600;s:5:\\"width\\";i:800;}', 1489383901),
(1080, 1, 'admin', 1, 'blob', 'png', 184224, 'ueditor/image/20170605/1496675358110217.png', 0, 'a:2:{s:6:\\"height\\";i:413;s:5:\\"width\\";i:688;}', 1496675358),
(1081, 1, 'admin', 1, 'blob', 'png', 127769, 'ueditor/image/20170605/1496675413125390.png', 0, 'a:2:{s:6:\\"height\\";i:526;s:5:\\"width\\";i:699;}', 1496675413),
(1082, 1, 'admin', 1, 'blob', 'png', 111344, 'ueditor/image/20170605/1496675434780811.png', 0, 'a:2:{s:6:\\"height\\";i:562;s:5:\\"width\\";i:886;}', 1496675434),
(1083, 1, 'admin', 1, 'blob', 'png', 32151, 'ueditor/image/20170605/1496675613435094.png', 0, 'a:2:{s:6:\\"height\\";i:264;s:5:\\"width\\";i:609;}', 1496675613),
(1084, 1, 'admin', 1, 'blob', 'png', 107890, 'ueditor/image/20170605/1496675824305955.png', 0, 'a:2:{s:6:\\"height\\";i:298;s:5:\\"width\\";i:604;}', 1496675824),
(1085, 1, 'admin', 1, 'blob', 'png', 52029, 'ueditor/image/20170605/1496675990123505.png', 0, 'a:2:{s:6:\\"height\\";i:195;s:5:\\"width\\";i:880;}', 1496675990),
(1086, 1, 'admin', 1, 'blob', 'png', 194809, 'ueditor/image/20170605/1496675996483246.png', 0, 'a:2:{s:6:\\"height\\";i:417;s:5:\\"width\\";i:774;}', 1496675996),
(1087, 1, 'admin', 1, 'blob', 'png', 210780, 'ueditor/image/20170605/1496676002124589.png', 0, 'a:2:{s:6:\\"height\\";i:398;s:5:\\"width\\";i:864;}', 1496676002),
(1088, 1, 'admin', 1, 'blob', 'png', 176527, 'ueditor/image/20170605/1496676219288313.png', 0, 'a:2:{s:6:\\"height\\";i:433;s:5:\\"width\\";i:696;}', 1496676219),
(1128, 1, 'admin', 1, '1', 'png', 743496, '201706/3feee7e7e2.png', 0, 'a:2:{s:6:\\"height\\";i:429;s:5:\\"width\\";i:849;}', 1498448013);

-- --------------------------------------------------------

--
-- 表的结构 `rs_comment`
--

CREATE TABLE IF NOT EXISTS `rs_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '配置信息',
  `field` text COMMENT '自定义字段信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论配置表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `rs_comment`
--

INSERT INTO `rs_comment` (`id`, `name`, `value`, `field`) VALUES
(1, 'comment-module-news', '', ''),
(2, 'comment-module-photo', '', ''),
(3, 'comment-module-special', '', ''),
(4, 'comment-module-shop', 'a:8:{s:3:\\"use\\";s:1:\\"1\\";s:6:\\"verify\\";s:1:\\"0\\";s:3:\\"num\\";s:1:\\"0\\";s:2:\\"my\\";s:1:\\"0\\";s:3:\\"buy\\";s:1:\\"1\\";s:5:\\"reply\\";s:1:\\"1\\";s:8:\\"pagesize\\";s:2:\\"10\\";s:10:\\"permission\\";a:14:{i:0;a:2:{s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"0\\";}i:1;a:2:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";}s:3:\\"3_1\\";a:2:{s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"0\\";}s:3:\\"3_2\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_3\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_4\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_9\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:4:\\"3_10\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_5\\";a:2:{s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"0\\";}s:4:\\"4_11\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_6\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_7\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:4:\\"4_12\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_8\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}}}', ''),
(5, 'comment-module-qiuzhi', 'a:11:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"verify\\";s:1:\\"1\\";s:3:\\"num\\";s:1:\\"1\\";s:2:\\"my\\";s:1:\\"1\\";s:3:\\"buy\\";s:1:\\"0\\";s:5:\\"reply\\";s:1:\\"0\\";s:8:\\"pagesize\\";s:2:\\"10\\";s:10:\\"permission\\";a:11:{i:0;a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}i:1;a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}i:2;a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_1\\";a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_2\\";a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_3\\";a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_4\\";a:4:{s:8:\\"disabled\\";s:1:\\"1\\";s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_5\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_6\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_7\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_8\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}}s:6:\\"format\\";s:0:\\"\\";s:6:\\"review\\";a:5:{s:3:\\"use\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"5\\";s:5:\\"point\\";s:1:\\"0\\";s:6:\\"option\\";a:9:{i:1;a:2:{s:3:\\"use\\";s:1:\\"1\\";s:4:\\"name\\";s:6:\\"总分\\";}i:2;a:2:{s:3:\\"use\\";s:1:\\"1\\";s:4:\\"name\\";s:9:\\"真实性\\";}i:3;a:2:{s:3:\\"use\\";s:1:\\"1\\";s:4:\\"name\\";s:6:\\"实力\\";}i:4;a:1:{s:4:\\"name\\";s:7:\\"选项4\\";}i:5;a:1:{s:4:\\"name\\";s:7:\\"选项5\\";}i:6;a:1:{s:4:\\"name\\";s:7:\\"选项6\\";}i:7;a:1:{s:4:\\"name\\";s:7:\\"选项7\\";}i:8;a:1:{s:4:\\"name\\";s:7:\\"选项8\\";}i:9;a:1:{s:4:\\"name\\";s:7:\\"选项9\\";}}s:5:\\"value\\";a:5:{i:1;a:1:{s:4:\\"name\\";s:10:\\"1星评价\\";}i:2;a:1:{s:4:\\"name\\";s:10:\\"2星评价\\";}i:3;a:1:{s:4:\\"name\\";s:10:\\"3星评价\\";}i:4;a:1:{s:4:\\"name\\";s:10:\\"4星评价\\";}i:5;a:1:{s:4:\\"name\\";s:10:\\"5星评价\\";}}}s:7:\\"fenbiao\\";a:1:{s:3:\\"use\\";s:1:\\"0\\";}}', ''),
(6, 'comment-module-job', '', ''),
(7, 'comment-module-answer', 'a:8:{s:3:\\"use\\";s:1:\\"1\\";s:6:\\"verify\\";s:1:\\"0\\";s:3:\\"num\\";s:1:\\"0\\";s:2:\\"my\\";s:1:\\"0\\";s:3:\\"buy\\";s:1:\\"0\\";s:5:\\"reply\\";s:1:\\"1\\";s:8:\\"pagesize\\";s:2:\\"10\\";s:10:\\"permission\\";a:14:{i:0;a:2:{s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"5\\";}i:1;a:2:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";}s:3:\\"3_1\\";a:2:{s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_2\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_3\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_4\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"3_9\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:4:\\"3_10\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_5\\";a:2:{s:10:\\"experience\\";s:1:\\"0\\";s:5:\\"score\\";s:1:\\"5\\";}s:4:\\"4_11\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_6\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_7\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:4:\\"4_12\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}s:3:\\"4_8\\";a:2:{s:10:\\"experience\\";s:1:\\"5\\";s:5:\\"score\\";s:1:\\"5\\";}}}', ''),
(8, 'comment-module-video', 'a:11:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"verify\\";s:1:\\"0\\";s:3:\\"num\\";s:1:\\"1\\";s:2:\\"my\\";s:1:\\"0\\";s:3:\\"buy\\";s:1:\\"0\\";s:5:\\"reply\\";s:1:\\"0\\";s:8:\\"pagesize\\";s:2:\\"10\\";s:10:\\"permission\\";a:15:{i:0;a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}i:1;a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}i:2;a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_1\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_2\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_3\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_4\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_9\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:4:\\"3_10\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_5\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:4:\\"4_11\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_6\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_7\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:4:\\"4_12\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_8\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}}s:6:\\"format\\";s:0:\\"\\";s:6:\\"review\\";a:5:{s:3:\\"use\\";s:1:\\"0\\";s:5:\\"score\\";s:2:\\"10\\";s:5:\\"point\\";s:1:\\"0\\";s:6:\\"option\\";a:9:{i:1;a:1:{s:4:\\"name\\";s:7:\\"选项1\\";}i:2;a:1:{s:4:\\"name\\";s:7:\\"选项2\\";}i:3;a:1:{s:4:\\"name\\";s:7:\\"选项3\\";}i:4;a:1:{s:4:\\"name\\";s:7:\\"选项4\\";}i:5;a:1:{s:4:\\"name\\";s:7:\\"选项5\\";}i:6;a:1:{s:4:\\"name\\";s:7:\\"选项6\\";}i:7;a:1:{s:4:\\"name\\";s:7:\\"选项7\\";}i:8;a:1:{s:4:\\"name\\";s:7:\\"选项8\\";}i:9;a:1:{s:4:\\"name\\";s:7:\\"选项9\\";}}s:5:\\"value\\";a:5:{i:1;a:1:{s:4:\\"name\\";s:10:\\"1星评价\\";}i:2;a:1:{s:4:\\"name\\";s:10:\\"2星评价\\";}i:3;a:1:{s:4:\\"name\\";s:10:\\"3星评价\\";}i:4;a:1:{s:4:\\"name\\";s:10:\\"4星评价\\";}i:5;a:1:{s:4:\\"name\\";s:10:\\"5星评价\\";}}}s:7:\\"fenbiao\\";a:1:{s:3:\\"use\\";s:1:\\"0\\";}}', ''),
(9, 'comment-extend-video', 'a:11:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"verify\\";s:1:\\"0\\";s:3:\\"num\\";s:1:\\"1\\";s:2:\\"my\\";s:1:\\"0\\";s:3:\\"buy\\";s:1:\\"0\\";s:5:\\"reply\\";s:1:\\"0\\";s:8:\\"pagesize\\";s:2:\\"10\\";s:10:\\"permission\\";a:15:{i:0;a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}i:1;a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}i:2;a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_1\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_2\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_3\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_4\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"3_9\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:4:\\"3_10\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_5\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:4:\\"4_11\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_6\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_7\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:4:\\"4_12\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}s:3:\\"4_8\\";a:3:{s:10:\\"experience\\";s:0:\\"\\";s:5:\\"score\\";s:0:\\"\\";s:4:\\"time\\";s:0:\\"\\";}}s:6:\\"format\\";s:0:\\"\\";s:6:\\"review\\";a:5:{s:3:\\"use\\";s:1:\\"0\\";s:5:\\"score\\";s:2:\\"10\\";s:5:\\"point\\";s:1:\\"0\\";s:6:\\"option\\";a:9:{i:1;a:1:{s:4:\\"name\\";s:7:\\"选项1\\";}i:2;a:1:{s:4:\\"name\\";s:7:\\"选项2\\";}i:3;a:1:{s:4:\\"name\\";s:7:\\"选项3\\";}i:4;a:1:{s:4:\\"name\\";s:7:\\"选项4\\";}i:5;a:1:{s:4:\\"name\\";s:7:\\"选项5\\";}i:6;a:1:{s:4:\\"name\\";s:7:\\"选项6\\";}i:7;a:1:{s:4:\\"name\\";s:7:\\"选项7\\";}i:8;a:1:{s:4:\\"name\\";s:7:\\"选项8\\";}i:9;a:1:{s:4:\\"name\\";s:7:\\"选项9\\";}}s:5:\\"value\\";a:5:{i:1;a:1:{s:4:\\"name\\";s:10:\\"1星评价\\";}i:2;a:1:{s:4:\\"name\\";s:10:\\"2星评价\\";}i:3;a:1:{s:4:\\"name\\";s:10:\\"3星评价\\";}i:4;a:1:{s:4:\\"name\\";s:10:\\"4星评价\\";}i:5;a:1:{s:4:\\"name\\";s:10:\\"5星评价\\";}}}s:7:\\"fenbiao\\";a:1:{s:3:\\"use\\";s:1:\\"0\\";}}', '');

-- --------------------------------------------------------

--
-- 表的结构 `rs_controller`
--

CREATE TABLE IF NOT EXISTS `rs_controller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `app` varchar(100) NOT NULL COMMENT '网站,会员,后台',
  `type` tinyint(1) unsigned NOT NULL COMMENT '前台0会员1后台2',
  `cname` varchar(100) NOT NULL COMMENT '控制器名称',
  `file` varchar(100) NOT NULL COMMENT '文件路径',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `meta_title` varchar(255) NOT NULL COMMENT '网页标题',
  `meta_keywords` varchar(255) NOT NULL COMMENT '网页关键字',
  `meta_description` varchar(255) NOT NULL COMMENT '网页描述',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义控制器表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_cron_queue`
--

CREATE TABLE IF NOT EXISTS `rs_cron_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '值',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `error` varchar(255) NOT NULL COMMENT '错误信息',
  `updatetime` int(10) unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务队列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_downservers`
--

CREATE TABLE IF NOT EXISTS `rs_downservers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '服务器名',
  `server` varchar(255) NOT NULL COMMENT '服务器地址',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载镜像服务器' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_field`
--

CREATE TABLE IF NOT EXISTS `rs_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='字段表' AUTO_INCREMENT=336 ;

--
-- 转存表中的数据 `rs_field`
--

INSERT INTO `rs_field` (`id`, `name`, `fieldname`, `fieldtype`, `relatedid`, `relatedname`, `isedit`, `ismain`, `issystem`, `ismember`, `issearch`, `disabled`, `setting`, `displayorder`) VALUES
(1, '相关附件', 'attachment', 'Files', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:5:{s:5:"width";s:3:"80%";s:4:"size";s:1:"2";s:5:"count";s:2:"10";s:3:"ext";s:31:"jpg,gif,png,ppt,doc,xls,rar,zip";s:10:"uploadpath";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"0";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"0";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0),
(2, '单页内容', 'content', 'Ueditor', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:7:{s:5:"width";s:3:"90%";s:6:"height";s:3:"400";s:4:"mode";s:1:"1";s:4:"tool";s:0:"";s:5:"mode2";s:1:"1";s:5:"tool2";s:0:"";s:5:"value";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"1";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"1";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0),
(3, '主题', 'title', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:3:{s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:3:{s:3:\\"xss\\";i:1;s:8:\\"required\\";i:1;s:8:\\"formattr\\";s:48:\\"onblur=\\"check_title();get_keywords(\\''keywords\\'');\\"\\";}}', 0),
(4, '缩略图', 'thumb', 'File', 1, 'module', 1, 1, 1, 1, 1, 0, 'a:1:{s:6:\\"option\\";a:5:{s:3:\\"ext\\";s:11:\\"jpg,gif,png\\";s:4:\\"size\\";i:10;s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}}', 0),
(5, '关键字', 'keywords', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:3:{s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:8:\\"formattr\\";s:22:\\" data-role=\\"tagsinput\\"\\";}}', 0),
(6, '描述', 'description', 'Textarea', 1, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:4:{s:5:\\"width\\";i:500;s:6:\\"height\\";i:60;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:6:\\"filter\\";s:12:\\"dr_clearhtml\\";}}', 0),
(7, '内容', 'content', 'Ueditor', 1, 'module', 1, 0, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:3:{s:4:\\"mode\\";i:1;s:5:\\"width\\";s:3:\\"90%\\";s:6:\\"height\\";i:400;}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:8:\\"required\\";i:1;}}', 0),
(38, '主题', 'title', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:3:{s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:3:{s:3:\\"xss\\";i:1;s:8:\\"required\\";i:1;s:8:\\"formattr\\";s:48:\\"onblur=\\"check_title();get_keywords(\\''keywords\\'');\\"\\";}}', 0),
(39, '关键字', 'keywords', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:3:{s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:8:\\"formattr\\";s:22:\\" data-role=\\"tagsinput\\"\\";}}', 0),
(40, '商品单价', 'order_price', 'Price', 6, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:1:{s:5:\\"width\\";s:3:\\"200\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0),
(41, '已销售量', 'order_volume', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:7:{s:5:\\"width\\";s:3:\\"200\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:6:\\"unique\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:3:\\"INT\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0),
(42, '库存数量', 'order_quantity', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:7:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:6:\\"unique\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0),
(265, '商品所在地', 'fj_area', 'Linkage', 6, 'module', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:2:{s:7:\\"linkage\\";s:6:\\"fujian\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(44, '缩略图', 'thumb', 'File', 6, 'module', 1, 1, 1, 1, 1, 0, 'a:1:{s:6:\\"option\\";a:5:{s:3:\\"ext\\";s:11:\\"jpg,gif,png\\";s:4:\\"size\\";i:10;s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}}', 0),
(45, '描述', 'description', 'Textarea', 6, 'module', 1, 1, 1, 0, 1, 1, 'a:2:{s:6:\\"option\\";a:4:{s:5:\\"width\\";i:500;s:6:\\"height\\";i:60;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:6:\\"filter\\";s:12:\\"dr_clearhtml\\";}}', 8),
(46, '多图展示', 'duotu', 'Image', 6, 'module', 1, 0, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:4:{s:5:\\"width\\";s:3:\\"80%\\";s:4:\\"size\\";s:1:\\"5\\";s:5:\\"count\\";s:1:\\"5\\";s:10:\\"uploadpath\\";s:0:\\"\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0),
(47, '内容', 'content', 'Ueditor', 6, 'module', 1, 0, 1, 1, 1, 0, 'a:2:{s:6:\\"option\\";a:3:{s:4:\\"mode\\";i:1;s:5:\\"width\\";s:3:\\"90%\\";s:6:\\"height\\";i:400;}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:8:\\"required\\";i:1;}}', 9),
(145, '标题', 'title', 'Text', 12, 'module', 1, 1, 1, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"400\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:8:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:3:\\"xss\\";s:1:\\"1\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:48:\\"onblur=\\"check_title();get_keywords(\\''keywords\\'');\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:3:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";}}', 1),
(146, '缩略图', 'thumb', 'File', 12, 'module', 1, 1, 1, 0, 0, 1, 'a:3:{s:6:\\"option\\";a:3:{s:4:\\"size\\";s:2:\\"10\\";s:3:\\"ext\\";s:11:\\"jpg,gif,png\\";s:10:\\"uploadpath\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(147, '关键字', 'keywords', 'Text', 12, 'module', 1, 1, 1, 0, 1, 1, 'a:2:{s:6:\\"option\\";a:3:{s:5:\\"width\\";i:400;s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:2:{s:3:\\"xss\\";i:1;s:8:\\"formattr\\";s:22:\\" data-role=\\"tagsinput\\"\\";}}', 0),
(148, '问题补充', 'description', 'Textarea', 12, 'module', 1, 1, 1, 0, 0, 1, 'a:4:{s:6:\\"option\\";a:4:{s:5:\\"width\\";s:0:\\"\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:6:\\"height\\";s:0:\\"\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:8:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:3:\\"xss\\";s:1:\\"1\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:12:\\"dr_clearhtml\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"4\\";}}', 0),
(149, '问题补充', 'content', 'Ueditor', 12, 'module', 1, 0, 1, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:14:{s:5:\\"width\\";s:3:\\"90%\\";s:6:\\"height\\";s:3:\\"400\\";s:9:\\"autofloat\\";s:1:\\"0\\";s:10:\\"autoheight\\";s:1:\\"0\\";s:8:\\"autodown\\";s:1:\\"0\\";s:6:\\"divtop\\";s:1:\\"0\\";s:4:\\"page\\";s:1:\\"0\\";s:4:\\"mode\\";s:1:\\"1\\";s:4:\\"tool\\";s:29:\\"\\''bold\\'', \\''italic\\'', \\''underline\\''\\";s:5:\\"mode2\\";s:1:\\"1\\";s:5:\\"tool2\\";s:29:\\"\\''bold\\'', \\''italic\\'', \\''underline\\''\\";s:5:\\"mode3\\";s:1:\\"1\\";s:5:\\"tool3\\";s:29:\\"\\''bold\\'', \\''italic\\'', \\''underline\\''\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:8:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:3:\\"xss\\";s:1:\\"1\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 5),
(172, '认证类型', 'auth_type', 'Radio', 0, 'table-member_auth', 1, 1, 1, 0, 0, 1, 'a:2:{s:6:\\"option\\";a:4:{s:7:\\"options\\";s:17:\\"个人|0\n企业|1\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"TINYINT\\";s:11:\\"fieldlength\\";s:1:\\"1\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:34:\\" onChange=\\"dr_my_auth(this.value)\\"\\";}}', 0),
(173, '认证名称', 'auth_name', 'Text', 0, 'table-member_auth', 1, 1, 1, 0, 0, 1, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:24:\\"会计从业资格证书\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"100\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(174, '证件号码', 'auth_sn', 'Text', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"300\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"100\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 3),
(175, '证件图片', 'auth_image', 'File', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:3:{s:4:"size";s:2:"10";s:3:"ext";s:11:"jpg,gif,png";s:10:"uploadpath";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"1";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"0";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 4),
(176, '手机号码', 'auth_phone', 'Text', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:5:\\"value\\";s:7:\\"{phone}\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"100\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 5),
(232, '手机号码', 'mobile', 'Text', 12, 'module', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:0:\\"\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:16:\\"/^[0-9-]{6,13}$/\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 2),
(193, '相关文章', 'related', 'Related', 1, 'module', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:3:{s:6:\\"module\\";s:4:\\"news\\";s:5:\\"width\\";s:3:\\"90%\\";s:5:\\"limit\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(212, '公司全称', 'company_name', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"50%\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:2:{i:0;s:1:\\"1\\";i:1;s:1:\\"3\\";}}', 2),
(213, '所属行业', 'industry', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"50%\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"3\\";}}', 3),
(214, '企业规模', 'scale', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"50%\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"3\\";}}', 4),
(215, '企业性质', 'nature', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"50%\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"3\\";}}', 5),
(216, '企业详细地址', 'com_address', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"80%\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"3\\";}}', 10),
(217, '公司简称', 'com_name', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"50%\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 1),
(260, '认证证书', 'auth_personal', 'Select', 0, 'table-member_auth', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:4:{s:7:\\"options\\";s:135:\\"会计从业资格证|1\r\n助理/初级会计师证|2\r\n中级会计师证|3\r\n高级会计师证|4\r\n税务师证|5\r\n注册会计师证|10\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"4\\";}}', 2),
(261, '企业性质', 'company_nature', 'Linkage', 0, 'table-member_auth', 1, 1, 0, 1, 0, 0, 'a:4:{s:6:\\"option\\";a:2:{s:7:\\"linkage\\";s:6:\\"nature\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";s:11:\\"show_member\\";a:4:{i:0;s:1:\\"0\\";i:1;s:1:\\"1\\";i:2;s:1:\\"2\\";i:3;s:1:\\"3\\";}}', 1),
(269, '区县镇', 'com_area', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(270, '联系人', 'contact', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(271, '区号', 'areacode', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:3:\\"INT\\";s:11:\\"fieldlength\\";s:1:\\"5\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(272, '电话', 'tel', 'Text', 0, 'member', 1, 1, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(274, '企业全称', 'title', 'Text', 5, 'form-1', 1, 1, 1, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"400\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:8:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:3:\\"xss\\";s:1:\\"1\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(275, '经营地址', 'address', 'Text', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(276, '主营业务', 'business', 'Text', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(332, '合作事项', 'cooperation', 'Checkbox', 5, 'form-1', 1, 0, 0, 0, 0, 0, 'a:3:{s:6:\\"option\\";a:2:{s:7:\\"options\\";s:245:\\"报关报检|报关报检\n物流|物流\n退税|退税\n结算|结算\n融资|融资\n信保|信保\n保理|保理\n分销执行|分销执行\n采购执行|采购执行\n海外仓储|海外仓储\n供应链管理|供应链管理\n跨境电商|跨境电商\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(278, '联系人', 'contact', 'Text', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(279, '手机', 'phone', 'Text', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(280, '区号', 'areacode', 'Text', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(281, '电话', 'phonenumber', 'Text', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(282, '了解渠道', 'channel', 'Select', 5, 'form-1', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:4:{s:7:\\"options\\";s:56:\\"熟人介绍|熟人介绍\r\n网页|网页\r\n广告|广告 \\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(320, '相关附件', 'attachment', 'Files', 2, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:5:{s:5:"width";s:3:"80%";s:4:"size";s:1:"2";s:5:"count";s:2:"10";s:3:"ext";s:31:"jpg,gif,png,ppt,doc,xls,rar,zip";s:10:"uploadpath";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"0";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"0";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0),
(321, '单页内容', 'content', 'Ueditor', 2, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:7:{s:5:"width";s:3:"90%";s:6:"height";s:3:"400";s:4:"mode";s:1:"1";s:4:"tool";s:0:"";s:5:"mode2";s:1:"1";s:5:"tool2";s:0:"";s:5:"value";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"1";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"1";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0),
(322, '企业全称', 'title', 'Text', 5, 'form-2', 1, 1, 1, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"400\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"255\\";}s:8:\\"validate\\";a:8:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:3:\\"xss\\";s:1:\\"1\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(323, '经营地址', 'address', 'Text', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(324, '主营业务', 'business', 'Text', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(333, '合作事项', 'cooperation', 'Checkbox', 5, 'form-2', 1, 0, 0, 0, 0, 0, 'a:3:{s:6:\\"option\\";a:2:{s:7:\\"options\\";s:245:\\"报关报检|报关报检\n物流|物流\n退税|退税\n结算|结算\n融资|融资\n信保|信保\n保理|保理\n分销执行|分销执行\n采购执行|采购执行\n海外仓储|海外仓储\n供应链管理|供应链管理\n跨境电商|跨境电商\\";s:5:\\"value\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(326, '联系人', 'contact', 'Text', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(327, '手机', 'phone', 'Text', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(328, '区号', 'areacode', 'Text', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(329, '电话', 'phonenumber', 'Text', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:10:\\"is_mb_auto\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0),
(330, '了解渠道', 'channel', 'Select', 5, 'form-2', 1, 0, 0, 1, 0, 0, 'a:3:{s:6:\\"option\\";a:4:{s:7:\\"options\\";s:56:\\"熟人介绍|熟人介绍\r\n网页|网页\r\n广告|广告 \\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:0:\\"\\";s:11:\\"fieldlength\\";s:0:\\"\\";}s:8:\\"validate\\";a:7:{s:8:\\"required\\";s:1:\\"0\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}s:8:\\"is_right\\";s:1:\\"0\\";}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_linkage`
--

CREATE TABLE IF NOT EXISTS `rs_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `rs_linkage`
--

INSERT INTO `rs_linkage` (`id`, `name`, `type`, `code`) VALUES
(1, '中国地区', 0, 'address'),
(2, '企业性质', 0, 'nature'),
(3, '福建省', 0, 'fujian'),
(4, '福建省英文', 0, 'fujian-en');

-- --------------------------------------------------------

--
-- 表的结构 `rs_linkage_data_1`
--

CREATE TABLE IF NOT EXISTS `rs_linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前台隐藏',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表' AUTO_INCREMENT=1150 ;

--
-- 转存表中的数据 `rs_linkage_data_1`
--

INSERT INTO `rs_linkage_data_1` (`id`, `site`, `pid`, `pids`, `name`, `cname`, `child`, `childids`, `displayorder`, `hidden`) VALUES
(1, 1, 0, '0', '北京市', 'beijing', 0, '1', 1, 0),
(2, 1, 0, '0', '天津市', 'tianjin', 0, '2', 2, 0),
(3, 1, 0, '0', '河北省', 'hebei', 1, '3,65,66,67,68,69,70,71,72,73,74,75', 3, 0),
(4, 1, 0, '0', '山西省', 'shanxi', 1, '4,248,259,271,277,291,298,305,317,331,346,364', 4, 0),
(5, 1, 0, '0', '辽宁省', 'liaoning', 1, '5,491,505,516,524,532,539,546,554,561,569,577,582,590,598', 5, 0),
(6, 1, 0, '0', '吉林省', 'jilin', 1, '6,605,616,626,633,638,646,653,659,665', 6, 0),
(7, 1, 0, '0', '黑龙江省', 'heilongjiang', 1, '7,674,693,710,720,729,738,748,766,777,782,793,800,811', 7, 0),
(8, 1, 0, '0', '江苏省', 'jiangsu', 1, '8,833,834,835,836,837,838,839,840,841,842,843,844,845', 9, 0),
(9, 1, 0, '0', '浙江省', 'zhejiang', 1, '9,846,847,848,849,850,851,852,853,854,855,856', 10, 0),
(10, 1, 0, '0', '安徽省', 'anhui', 1, '10,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872', 11, 0),
(11, 1, 0, '0', '福建省', 'fujian', 1, '11,873,874,875,876,877,878,879,880,881', 12, 0),
(12, 1, 0, '0', '江西省', 'jiangxi', 1, '12,882,883,884,885,886,887,888,889,890,891,892', 13, 0),
(13, 1, 0, '0', '山东省', 'shandong', 1, '13,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909', 14, 0),
(14, 1, 0, '0', '河南省', 'henan', 1, '14,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926', 15, 0),
(15, 1, 0, '0', '湖北省', 'hubei', 1, '15,927,928,929,930,931,932,933,934,935,936,937,938,939', 16, 0),
(16, 1, 0, '0', '湖南省', 'hunan', 1, '16,940,941,942,943,944,945,946,947,948,949,950,951,952,953', 17, 0),
(17, 1, 0, '0', '广东省', 'guangdong', 1, '17,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,972,973,974,1149', 18, 0),
(18, 1, 0, '0', '海南省', 'hainan', 1, '18,990', 19, 0),
(19, 1, 0, '0', '重庆市', 'zhongqing', 0, '19', 20, 0),
(20, 1, 0, '0', '四川省', 'sichuan', 1, '20,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066', 21, 0),
(21, 1, 0, '0', '贵州省', 'guizhou', 1, '21,1067,1068,1069,1070,1071,1072,1073,1074,1075', 22, 0),
(22, 1, 0, '0', '云南省', 'yunnan', 1, '22,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091', 23, 0),
(23, 1, 0, '0', '陕西省', 'shanxi1', 1, '23,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108', 24, 0),
(24, 1, 0, '0', '甘肃省', 'gansu', 1, '24,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121', 25, 0),
(25, 1, 0, '0', '青海省', 'qinghai', 1, '25,1122,1123,1124,1125,1126,1127,1128,1129', 26, 0),
(26, 1, 0, '0', '宁夏', 'ningxia', 1, '26,1130,1131,1132,1133,1134', 27, 0),
(27, 1, 0, '0', '西藏', 'xicang', 1, '27,1092,1093,1094,1095,1096,1097,1098', 28, 0),
(28, 1, 0, '0', '新疆', 'xinjiang', 1, '28,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148', 29, 0),
(29, 1, 0, '0', '内蒙古', 'neimenggu', 1, '29,378,388,398,402,415,424,433,447,455,467,474,487', 30, 0),
(30, 1, 0, '0', '香港', 'xianggang', 0, '30', 31, 0),
(31, 1, 0, '0', '澳门', 'aomen', 0, '31', 32, 0),
(32, 1, 0, '0', '台湾', 'taiwan', 0, '32', 33, 0),
(65, 1, 3, '0,3', '石家庄市', 'shijiazhuang', 0, '65', 0, 0),
(66, 1, 3, '0,3', '唐山市', 'tangshan', 0, '66', 0, 0),
(67, 1, 3, '0,3', '秦皇岛市', 'qinhuangdao', 0, '67', 0, 0),
(68, 1, 3, '0,3', '邯郸市', 'handan', 0, '68', 0, 0),
(69, 1, 3, '0,3', '邢台市', 'xingtai', 0, '69', 0, 0),
(70, 1, 3, '0,3', '保定市', 'baoding', 0, '70', 0, 0),
(71, 1, 3, '0,3', '张家口市', 'zhangjiakou', 0, '71', 0, 0),
(72, 1, 3, '0,3', '承德市', 'chengde', 0, '72', 0, 0),
(73, 1, 3, '0,3', '沧州市', 'cangzhou', 0, '73', 0, 0),
(74, 1, 3, '0,3', '廊坊市', 'langfang', 0, '74', 0, 0),
(75, 1, 3, '0,3', '衡水市', 'hengshui', 0, '75', 0, 0),
(248, 1, 4, '0,4', '太原市', 'taiyuan', 0, '248', 0, 0),
(259, 1, 4, '0,4', '大同市', 'datong', 0, '259', 0, 0),
(271, 1, 4, '0,4', '阳泉市', 'yangquan', 0, '271', 0, 0),
(277, 1, 4, '0,4', '长治市', 'changzhi', 0, '277', 0, 0),
(291, 1, 4, '0,4', '晋城市', 'jincheng', 0, '291', 0, 0),
(298, 1, 4, '0,4', '朔州市', 'shuozhou', 0, '298', 0, 0),
(305, 1, 4, '0,4', '晋中市', 'jinzhong', 0, '305', 0, 0),
(317, 1, 4, '0,4', '运城市', 'yuncheng', 0, '317', 0, 0),
(331, 1, 4, '0,4', '忻州市', 'xinzhou', 0, '331', 0, 0),
(346, 1, 4, '0,4', '临汾市', 'linfen', 0, '346', 0, 0),
(364, 1, 4, '0,4', '吕梁市', 'luliang', 0, '364', 0, 0),
(378, 1, 29, '0,29', '呼和浩特市', 'huhehaote', 0, '378', 0, 0),
(388, 1, 29, '0,29', '包头市', 'baotou', 0, '388', 0, 0),
(398, 1, 29, '0,29', '乌海市', 'wuhai', 0, '398', 0, 0),
(402, 1, 29, '0,29', '赤峰市', 'chifeng', 0, '402', 0, 0),
(415, 1, 29, '0,29', '通辽市', 'tongliao', 0, '415', 0, 0),
(424, 1, 29, '0,29', '鄂尔多斯市', 'eerduosi', 0, '424', 0, 0),
(433, 1, 29, '0,29', '呼伦贝尔市', 'hulunbeier', 0, '433', 0, 0),
(447, 1, 29, '0,29', '巴彦淖尔市', 'bayannaoer', 0, '447', 0, 0),
(455, 1, 29, '0,29', '乌兰察布市', 'wulanchabu', 0, '455', 0, 0),
(467, 1, 29, '0,29', '兴安盟', 'xinganmeng', 0, '467', 0, 0),
(474, 1, 29, '0,29', '锡林郭勒盟', 'xilinguolemeng', 0, '474', 0, 0),
(487, 1, 29, '0,29', '阿拉善盟', 'alashanmeng', 0, '487', 0, 0),
(491, 1, 5, '0,5', '沈阳市', 'shenyang', 0, '491', 0, 0),
(505, 1, 5, '0,5', '大连市', 'dalian', 0, '505', 0, 0),
(516, 1, 5, '0,5', '鞍山市', 'anshan', 0, '516', 0, 0),
(524, 1, 5, '0,5', '抚顺市', 'fushun', 0, '524', 0, 0),
(532, 1, 5, '0,5', '本溪市', 'benxi', 0, '532', 0, 0),
(539, 1, 5, '0,5', '丹东市', 'dandong', 0, '539', 0, 0),
(546, 1, 5, '0,5', '锦州市', 'jinzhou', 0, '546', 0, 0),
(554, 1, 5, '0,5', '营口市', 'yingkou', 0, '554', 0, 0),
(561, 1, 5, '0,5', '阜新市', 'fuxin', 0, '561', 0, 0),
(569, 1, 5, '0,5', '辽阳市', 'liaoyang', 0, '569', 0, 0),
(577, 1, 5, '0,5', '盘锦市', 'panjin', 0, '577', 0, 0),
(582, 1, 5, '0,5', '铁岭市', 'tieling', 0, '582', 0, 0),
(590, 1, 5, '0,5', '朝阳市', 'chaoyang', 0, '590', 0, 0),
(598, 1, 5, '0,5', '葫芦岛市', 'huludao', 0, '598', 0, 0),
(605, 1, 6, '0,6', '长春市', 'changchun', 0, '605', 0, 0),
(616, 1, 6, '0,6', '吉林市', 'jilin1', 0, '616', 0, 0),
(626, 1, 6, '0,6', '四平市', 'siping', 0, '626', 0, 0),
(633, 1, 6, '0,6', '辽源市', 'liaoyuan', 0, '633', 0, 0),
(638, 1, 6, '0,6', '通化市', 'tonghua', 0, '638', 0, 0),
(646, 1, 6, '0,6', '白山市', 'baishan', 0, '646', 0, 0),
(653, 1, 6, '0,6', '松原市', 'songyuan', 0, '653', 0, 0),
(659, 1, 6, '0,6', '白城市', 'baicheng', 0, '659', 0, 0),
(665, 1, 6, '0,6', '延边自治州', 'yanbianzhou', 0, '665', 0, 0),
(674, 1, 7, '0,7', '哈尔滨市', 'haerbin', 0, '674', 0, 0),
(693, 1, 7, '0,7', '齐齐哈尔市', 'qiqihaer', 0, '693', 0, 0),
(710, 1, 7, '0,7', '鸡西市', 'jixi', 0, '710', 0, 0),
(720, 1, 7, '0,7', '鹤岗市', 'hegang', 0, '720', 0, 0),
(729, 1, 7, '0,7', '双鸭山市', 'shuangyashan', 0, '729', 0, 0),
(738, 1, 7, '0,7', '大庆市', 'daqing', 0, '738', 0, 0),
(748, 1, 7, '0,7', '伊春市', 'yichun', 0, '748', 0, 0),
(766, 1, 7, '0,7', '佳木斯市', 'jiamusi', 0, '766', 0, 0),
(777, 1, 7, '0,7', '七台河市', 'qitaihe', 0, '777', 0, 0),
(782, 1, 7, '0,7', '牡丹江市', 'mudanjiang', 0, '782', 0, 0),
(793, 1, 7, '0,7', '黑河市', 'heihe', 0, '793', 0, 0),
(800, 1, 7, '0,7', '绥化市', 'suihua', 0, '800', 0, 0),
(811, 1, 7, '0,7', '大兴安岭地区', 'daxinganling', 0, '811', 0, 0),
(815, 1, 0, '0', '上海市', 'shanghai', 0, '815', 8, 0),
(833, 1, 8, '0,8', '南京市', 'nanjing', 0, '833', 0, 0),
(834, 1, 8, '0,8', '无锡市', 'wuxi', 0, '834', 0, 0),
(835, 1, 8, '0,8', '徐州市', 'xuzhou', 0, '835', 0, 0),
(836, 1, 8, '0,8', '常州市', 'changzhou', 0, '836', 0, 0),
(837, 1, 8, '0,8', '苏州市', 'suzhou', 0, '837', 0, 0),
(838, 1, 8, '0,8', '南通市', 'nantong', 0, '838', 0, 0),
(839, 1, 8, '0,8', '连云港市', 'lianyungang', 0, '839', 0, 0),
(840, 1, 8, '0,8', '淮安市', 'huaian', 0, '840', 0, 0),
(841, 1, 8, '0,8', '盐城市', 'yancheng', 0, '841', 0, 0),
(842, 1, 8, '0,8', '扬州市', 'yangzhou', 0, '842', 0, 0),
(843, 1, 8, '0,8', '镇江市', 'zhenjiang', 0, '843', 0, 0),
(844, 1, 8, '0,8', '泰州市', 'taizhou', 0, '844', 0, 0),
(845, 1, 8, '0,8', '宿迁市', 'xiuqian', 0, '845', 0, 0),
(846, 1, 9, '0,9', '杭州市', 'hangzhou', 0, '846', 0, 0),
(847, 1, 9, '0,9', '宁波市', 'ningbo', 0, '847', 0, 0),
(848, 1, 9, '0,9', '温州市', 'wenzhou', 0, '848', 0, 0),
(849, 1, 9, '0,9', '嘉兴市', 'jiaxing', 0, '849', 0, 0),
(850, 1, 9, '0,9', '湖州市', 'huzhou', 0, '850', 0, 0),
(851, 1, 9, '0,9', '绍兴市', 'shaoxing', 0, '851', 0, 0),
(852, 1, 9, '0,9', '金华市', 'jinhua', 0, '852', 0, 0),
(853, 1, 9, '0,9', '衢州市', 'quzhou', 0, '853', 0, 0),
(854, 1, 9, '0,9', '舟山市', 'zhoushan', 0, '854', 0, 0),
(855, 1, 9, '0,9', '台州市', 'taizhou1', 0, '855', 0, 0),
(856, 1, 9, '0,9', '丽水市', 'lishui', 0, '856', 0, 0),
(857, 1, 10, '0,10', '合肥市', 'hefei', 0, '857', 0, 0),
(858, 1, 10, '0,10', '芜湖市', 'wuhu', 0, '858', 0, 0),
(859, 1, 10, '0,10', '蚌埠市', 'bangbu', 0, '859', 0, 0),
(860, 1, 10, '0,10', '淮南市', 'huainan', 0, '860', 0, 0),
(861, 1, 10, '0,10', '马鞍山市', 'maanshan', 0, '861', 0, 0),
(862, 1, 10, '0,10', '淮北市', 'huaibei', 0, '862', 0, 0),
(863, 1, 10, '0,10', '铜陵市', 'tongling', 0, '863', 0, 0),
(864, 1, 10, '0,10', '安庆市', 'anqing', 0, '864', 0, 0),
(865, 1, 10, '0,10', '黄山市', 'huangshan', 0, '865', 0, 0),
(866, 1, 10, '0,10', '滁州市', 'chuzhou', 0, '866', 0, 0),
(867, 1, 10, '0,10', '阜阳市', 'fuyang', 0, '867', 0, 0),
(868, 1, 10, '0,10', '宿州市', 'xiuzhou', 0, '868', 0, 0),
(869, 1, 10, '0,10', '六安市', 'liuan', 0, '869', 0, 0),
(870, 1, 10, '0,10', '亳州市', 'bozhou', 0, '870', 0, 0),
(871, 1, 10, '0,10', '池州市', 'shizhou', 0, '871', 0, 0),
(872, 1, 10, '0,10', '宣城市', 'xuancheng', 0, '872', 0, 0),
(873, 1, 11, '0,11', '福州市', 'fuzhou', 0, '873', 0, 0),
(874, 1, 11, '0,11', '厦门市', 'shamen', 0, '874', 0, 0),
(875, 1, 11, '0,11', '莆田市', 'putian', 0, '875', 0, 0),
(876, 1, 11, '0,11', '三明市', 'sanming', 0, '876', 0, 0),
(877, 1, 11, '0,11', '泉州市', 'quanzhou', 0, '877', 0, 0),
(878, 1, 11, '0,11', '漳州市', 'zhangzhou', 0, '878', 0, 0),
(879, 1, 11, '0,11', '南平市', 'nanping', 0, '879', 0, 0),
(880, 1, 11, '0,11', '龙岩市', 'longyan', 0, '880', 0, 0),
(881, 1, 11, '0,11', '宁德市', 'ningde', 0, '881', 0, 0),
(882, 1, 12, '0,12', '南昌市', 'nanchang', 0, '882', 0, 0),
(883, 1, 12, '0,12', '景德镇市', 'jingdezhen', 0, '883', 0, 0),
(884, 1, 12, '0,12', '萍乡市', 'pingxiang', 0, '884', 0, 0),
(885, 1, 12, '0,12', '九江市', 'jiujiang', 0, '885', 0, 0),
(886, 1, 12, '0,12', '新余市', 'xinyu', 0, '886', 0, 0),
(887, 1, 12, '0,12', '鹰潭市', 'yingtan', 0, '887', 0, 0),
(888, 1, 12, '0,12', '赣州市', 'ganzhou', 0, '888', 0, 0),
(889, 1, 12, '0,12', '吉安市', 'jian', 0, '889', 0, 0),
(890, 1, 12, '0,12', '宜春市', 'yichun1', 0, '890', 0, 0),
(891, 1, 12, '0,12', '抚州市', 'fuzhou1', 0, '891', 0, 0),
(892, 1, 12, '0,12', '上饶市', 'shangrao', 0, '892', 0, 0),
(893, 1, 13, '0,13', '济南市', 'jinan', 0, '893', 0, 0),
(894, 1, 13, '0,13', '青岛市', 'qingdao', 0, '894', 0, 0),
(895, 1, 13, '0,13', '淄博市', 'zibo', 0, '895', 0, 0),
(896, 1, 13, '0,13', '枣庄市', 'zaozhuang', 0, '896', 0, 0),
(897, 1, 13, '0,13', '东营市', 'dongying', 0, '897', 0, 0),
(898, 1, 13, '0,13', '烟台市', 'yantai', 0, '898', 0, 0),
(899, 1, 13, '0,13', '潍坊市', 'weifang', 0, '899', 0, 0),
(900, 1, 13, '0,13', '济宁市', 'jining', 0, '900', 0, 0),
(901, 1, 13, '0,13', '泰安市', 'taian', 0, '901', 0, 0),
(902, 1, 13, '0,13', '威海市', 'weihai', 0, '902', 0, 0),
(903, 1, 13, '0,13', '日照市', 'rizhao', 0, '903', 0, 0),
(904, 1, 13, '0,13', '莱芜市', 'laiwu', 0, '904', 0, 0),
(905, 1, 13, '0,13', '临沂市', 'linyi', 0, '905', 0, 0),
(906, 1, 13, '0,13', '德州市', 'dezhou', 0, '906', 0, 0),
(907, 1, 13, '0,13', '聊城市', 'liaocheng', 0, '907', 0, 0),
(908, 1, 13, '0,13', '滨州市', 'binzhou', 0, '908', 0, 0),
(909, 1, 13, '0,13', '菏泽市', 'heze', 0, '909', 0, 0),
(910, 1, 14, '0,14', '郑州市', 'zhengzhou', 0, '910', 0, 0),
(911, 1, 14, '0,14', '开封市', 'kaifeng', 0, '911', 0, 0),
(912, 1, 14, '0,14', '洛阳市', 'luoyang', 0, '912', 0, 0),
(913, 1, 14, '0,14', '平顶山市', 'pingdingshan', 0, '913', 0, 0),
(914, 1, 14, '0,14', '安阳市', 'anyang', 0, '914', 0, 0),
(915, 1, 14, '0,14', '鹤壁市', 'hebi', 0, '915', 0, 0),
(916, 1, 14, '0,14', '新乡市', 'xinxiang', 0, '916', 0, 0),
(917, 1, 14, '0,14', '焦作市', 'jiaozuo', 0, '917', 0, 0),
(918, 1, 14, '0,14', '濮阳市', 'puyang', 0, '918', 0, 0),
(919, 1, 14, '0,14', '许昌市', 'xuchang', 0, '919', 0, 0),
(920, 1, 14, '0,14', '漯河市', 'leihe', 0, '920', 0, 0),
(921, 1, 14, '0,14', '三门峡市', 'sanmenxia', 0, '921', 0, 0),
(922, 1, 14, '0,14', '南阳市', 'nanyang', 0, '922', 0, 0),
(923, 1, 14, '0,14', '商丘市', 'shangqiu', 0, '923', 0, 0),
(924, 1, 14, '0,14', '信阳市', 'xinyang', 0, '924', 0, 0),
(925, 1, 14, '0,14', '周口市', 'zhoukou', 0, '925', 0, 0),
(926, 1, 14, '0,14', '驻马店市', 'zhumadian', 0, '926', 0, 0),
(927, 1, 15, '0,15', '武汉市', 'wuhan', 0, '927', 0, 0),
(928, 1, 15, '0,15', '黄石市', 'huangshi', 0, '928', 0, 0),
(929, 1, 15, '0,15', '十堰市', 'shiyan', 0, '929', 0, 0),
(930, 1, 15, '0,15', '宜昌市', 'yichang', 0, '930', 0, 0),
(931, 1, 15, '0,15', '襄阳市', 'xiangyang', 0, '931', 0, 0),
(932, 1, 15, '0,15', '鄂州市', 'ezhou', 0, '932', 0, 0),
(933, 1, 15, '0,15', '荆门市', 'jingmen', 0, '933', 0, 0),
(934, 1, 15, '0,15', '孝感市', 'xiaogan', 0, '934', 0, 0),
(935, 1, 15, '0,15', '荆州市', 'jingzhou', 0, '935', 0, 0),
(936, 1, 15, '0,15', '黄冈市', 'huanggang', 0, '936', 0, 0),
(937, 1, 15, '0,15', '咸宁市', 'xianning', 0, '937', 0, 0),
(938, 1, 15, '0,15', '随州市', 'suizhou', 0, '938', 0, 0),
(939, 1, 15, '0,15', '恩施自治州', 'enshizhou', 0, '939', 0, 0),
(940, 1, 16, '0,16', '长沙市', 'changsha', 0, '940', 0, 0),
(941, 1, 16, '0,16', '株洲市', 'zhuzhou', 0, '941', 0, 0),
(942, 1, 16, '0,16', '湘潭市', 'xiangtan', 0, '942', 0, 0),
(943, 1, 16, '0,16', '衡阳市', 'hengyang', 0, '943', 0, 0),
(944, 1, 16, '0,16', '邵阳市', 'shaoyang', 0, '944', 0, 0),
(945, 1, 16, '0,16', '岳阳市', 'yueyang', 0, '945', 0, 0),
(946, 1, 16, '0,16', '常德市', 'changde', 0, '946', 0, 0),
(947, 1, 16, '0,16', '张家界市', 'zhangjiajie', 0, '947', 0, 0),
(948, 1, 16, '0,16', '益阳市', 'yiyang', 0, '948', 0, 0),
(949, 1, 16, '0,16', '郴州市', 'chenzhou', 0, '949', 0, 0),
(950, 1, 16, '0,16', '永州市', 'yongzhou', 0, '950', 0, 0),
(951, 1, 16, '0,16', '怀化市', 'huaihua', 0, '951', 0, 0),
(952, 1, 16, '0,16', '娄底市', 'loudi', 0, '952', 0, 0),
(953, 1, 16, '0,16', '湘西自治州', 'xiangxizhou', 0, '953', 0, 0),
(954, 1, 17, '0,17', '广州市', 'guangzhou', 0, '954', 0, 0),
(955, 1, 17, '0,17', '韶关市', 'shaoguan', 0, '955', 0, 0),
(956, 1, 17, '0,17', '深圳市', 'shenchou', 0, '956', 0, 0),
(957, 1, 17, '0,17', '珠海市', 'zhuhai', 0, '957', 0, 0),
(958, 1, 17, '0,17', '汕头市', 'shantou', 0, '958', 0, 0),
(959, 1, 17, '0,17', '佛山市', 'foshan', 0, '959', 0, 0),
(960, 1, 17, '0,17', '江门市', 'jiangmen', 0, '960', 0, 0),
(961, 1, 17, '0,17', '湛江市', 'zhanjiang', 0, '961', 0, 0),
(962, 1, 17, '0,17', '茂名市', 'maoming', 0, '962', 0, 0),
(963, 1, 17, '0,17', '肇庆市', 'zhaoqing', 0, '963', 0, 0),
(964, 1, 17, '0,17', '惠州市', 'huizhou', 0, '964', 0, 0),
(965, 1, 17, '0,17', '梅州市', 'meizhou', 0, '965', 0, 0),
(966, 1, 17, '0,17', '汕尾市', 'shanwei', 0, '966', 0, 0),
(967, 1, 17, '0,17', '河源市', 'heyuan', 0, '967', 0, 0),
(968, 1, 17, '0,17', '阳江市', 'yangjiang', 0, '968', 0, 0),
(969, 1, 17, '0,17', '清远市', 'qingyuan', 0, '969', 0, 0),
(972, 1, 17, '0,17', '潮州市', 'chaozhou', 0, '972', 0, 0),
(973, 1, 17, '0,17', '揭阳市', 'jieyang', 0, '973', 0, 0),
(974, 1, 17, '0,17', '云浮市', 'yunfu', 0, '974', 0, 0),
(975, 1, 0, '0', '广西', 'guangxi', 1, '975,976,977,978,979,980,981,982,983,984,985,986,987,988,989', 18, 0),
(976, 1, 975, '0,975', '南宁市', 'nanning', 0, '976', 0, 0),
(977, 1, 975, '0,975', '柳州市', 'liuzhou', 0, '977', 0, 0),
(978, 1, 975, '0,975', '桂林市', 'guilin', 0, '978', 0, 0),
(979, 1, 975, '0,975', '梧州市', 'wuzhou', 0, '979', 0, 0),
(980, 1, 975, '0,975', '北海市', 'beihai', 0, '980', 0, 0),
(981, 1, 975, '0,975', '防城港市', 'fangchenggang', 0, '981', 0, 0),
(982, 1, 975, '0,975', '钦州市', 'qinzhou', 0, '982', 0, 0),
(983, 1, 975, '0,975', '贵港市', 'guigang', 0, '983', 0, 0),
(984, 1, 975, '0,975', '玉林市', 'yulin', 0, '984', 0, 0),
(985, 1, 975, '0,975', '百色市', 'baise', 0, '985', 0, 0),
(986, 1, 975, '0,975', '贺州市', 'hezhou', 0, '986', 0, 0),
(987, 1, 975, '0,975', '河池市', 'heshi', 0, '987', 0, 0),
(988, 1, 975, '0,975', '来宾市', 'laibin', 0, '988', 0, 0),
(989, 1, 975, '0,975', '崇左市', 'chongzuo', 0, '989', 0, 0),
(990, 1, 18, '0,18', '海口市', 'haikou', 0, '990', 0, 0),
(1046, 1, 20, '0,20', '成都市', 'chengdou', 0, '1046', 0, 0),
(1047, 1, 20, '0,20', '自贡市', 'zigong', 0, '1047', 0, 0),
(1048, 1, 20, '0,20', '攀枝花市', 'panzhihua', 0, '1048', 0, 0),
(1049, 1, 20, '0,20', '泸州市', 'luzhou', 0, '1049', 0, 0),
(1050, 1, 20, '0,20', '德阳市', 'deyang', 0, '1050', 0, 0),
(1051, 1, 20, '0,20', '绵阳市', 'mianyang', 0, '1051', 0, 0),
(1052, 1, 20, '0,20', '广元市', 'guangyuan', 0, '1052', 0, 0),
(1053, 1, 20, '0,20', '遂宁市', 'suining', 0, '1053', 0, 0),
(1054, 1, 20, '0,20', '内江市', 'neijiang', 0, '1054', 0, 0),
(1055, 1, 20, '0,20', '乐山市', 'leshan', 0, '1055', 0, 0),
(1056, 1, 20, '0,20', '南充市', 'nanchong', 0, '1056', 0, 0),
(1057, 1, 20, '0,20', '眉山市', 'meishan', 0, '1057', 0, 0),
(1058, 1, 20, '0,20', '宜宾市', 'yibin', 0, '1058', 0, 0),
(1059, 1, 20, '0,20', '广安市', 'guangan', 0, '1059', 0, 0),
(1060, 1, 20, '0,20', '达州市', 'dazhou', 0, '1060', 0, 0),
(1061, 1, 20, '0,20', '雅安市', 'yaan', 0, '1061', 0, 0),
(1062, 1, 20, '0,20', '巴中市', 'bazhong', 0, '1062', 0, 0),
(1063, 1, 20, '0,20', '资阳市', 'ziyang', 0, '1063', 0, 0),
(1064, 1, 20, '0,20', '阿坝自治州', 'abazhou', 0, '1064', 0, 0),
(1065, 1, 20, '0,20', '甘孜自治州', 'ganzizhou', 0, '1065', 0, 0),
(1066, 1, 20, '0,20', '凉山自治州', 'liangshanzhou', 0, '1066', 0, 0),
(1067, 1, 21, '0,21', '贵阳市', 'guiyang', 0, '1067', 0, 0),
(1068, 1, 21, '0,21', '六盘水市', 'liupanshui', 0, '1068', 0, 0),
(1069, 1, 21, '0,21', '遵义市', 'zunyi', 0, '1069', 0, 0),
(1070, 1, 21, '0,21', '安顺市', 'anshun', 0, '1070', 0, 0),
(1071, 1, 21, '0,21', '毕节市', 'bijie', 0, '1071', 0, 0),
(1072, 1, 21, '0,21', '铜仁市', 'tongren', 0, '1072', 0, 0),
(1073, 1, 21, '0,21', '黔西南自治州', 'qianxinanzhou', 0, '1073', 0, 0),
(1074, 1, 21, '0,21', '黔东南自治州', 'qiandongnanzhou', 0, '1074', 0, 0),
(1075, 1, 21, '0,21', '黔南自治州', 'qiannanzhou', 0, '1075', 0, 0),
(1076, 1, 22, '0,22', '昆明市', 'kunming', 0, '1076', 0, 0),
(1077, 1, 22, '0,22', '曲靖市', 'qujing', 0, '1077', 0, 0),
(1078, 1, 22, '0,22', '玉溪市', 'yuxi', 0, '1078', 0, 0),
(1079, 1, 22, '0,22', '保山市', 'baoshan', 0, '1079', 0, 0),
(1080, 1, 22, '0,22', '昭通市', 'zhaotong', 0, '1080', 0, 0),
(1081, 1, 22, '0,22', '丽江市', 'lijiang', 0, '1081', 0, 0),
(1082, 1, 22, '0,22', '普洱市', 'puer', 0, '1082', 0, 0),
(1083, 1, 22, '0,22', '临沧市', 'lincang', 0, '1083', 0, 0),
(1084, 1, 22, '0,22', '楚雄自治州', 'chuxiongzhou', 0, '1084', 0, 0),
(1085, 1, 22, '0,22', '红河自治州', 'honghezhou', 0, '1085', 0, 0),
(1086, 1, 22, '0,22', '文山自治州', 'wenshanzhou', 0, '1086', 0, 0),
(1087, 1, 22, '0,22', '西双版纳自治州', 'xishuangbannazhou', 0, '1087', 0, 0),
(1088, 1, 22, '0,22', '大理自治州', 'dalizhou', 0, '1088', 0, 0),
(1089, 1, 22, '0,22', '德宏自治州', 'dehongzhou', 0, '1089', 0, 0),
(1090, 1, 22, '0,22', '怒江自治州', 'nujiangzhou', 0, '1090', 0, 0),
(1091, 1, 22, '0,22', '迪庆自治州', 'diqingzhou', 0, '1091', 0, 0),
(1092, 1, 27, '0,27', '拉萨市', 'lasa', 0, '1092', 0, 0),
(1093, 1, 27, '0,27', '昌都地区', 'changdou', 0, '1093', 0, 0),
(1094, 1, 27, '0,27', '山南地区', 'shannan', 0, '1094', 0, 0),
(1095, 1, 27, '0,27', '日喀则地区', 'rikaze', 0, '1095', 0, 0),
(1096, 1, 27, '0,27', '那曲地区', 'naqu', 0, '1096', 0, 0),
(1097, 1, 27, '0,27', '阿里地区', 'ali', 0, '1097', 0, 0),
(1098, 1, 27, '0,27', '林芝地区', 'linzhi', 0, '1098', 0, 0),
(1099, 1, 23, '0,23', '西安市', 'xian', 0, '1099', 0, 0),
(1100, 1, 23, '0,23', '铜川市', 'tongchuan', 0, '1100', 0, 0),
(1101, 1, 23, '0,23', '宝鸡市', 'baoji', 0, '1101', 0, 0),
(1102, 1, 23, '0,23', '咸阳市', 'xianyang', 0, '1102', 0, 0),
(1103, 1, 23, '0,23', '渭南市', 'weinan', 0, '1103', 0, 0),
(1104, 1, 23, '0,23', '延安市', 'yanan', 0, '1104', 0, 0),
(1105, 1, 23, '0,23', '汉中市', 'hanzhong', 0, '1105', 0, 0),
(1106, 1, 23, '0,23', '榆林市', 'yulin1', 0, '1106', 0, 0),
(1107, 1, 23, '0,23', '安康市', 'ankang', 0, '1107', 0, 0),
(1108, 1, 23, '0,23', '商洛市', 'shangluo', 0, '1108', 0, 0),
(1109, 1, 24, '0,24', '兰州市', 'lanzhou', 0, '1109', 0, 0),
(1110, 1, 24, '0,24', '嘉峪关市', 'jiayuguan', 0, '1110', 0, 0),
(1111, 1, 24, '0,24', '白银市', 'baiyin', 0, '1111', 0, 0),
(1112, 1, 24, '0,24', '天水市', 'tianshui', 0, '1112', 0, 0),
(1113, 1, 24, '0,24', '武威市', 'wuwei', 0, '1113', 0, 0),
(1114, 1, 24, '0,24', '张掖市', 'zhangye', 0, '1114', 0, 0),
(1115, 1, 24, '0,24', '平凉市', 'pingliang', 0, '1115', 0, 0),
(1116, 1, 24, '0,24', '酒泉市', 'jiuquan', 0, '1116', 0, 0),
(1117, 1, 24, '0,24', '庆阳市', 'qingyang', 0, '1117', 0, 0),
(1118, 1, 24, '0,24', '定西市', 'dingxi', 0, '1118', 0, 0),
(1119, 1, 24, '0,24', '陇南市', 'longnan', 0, '1119', 0, 0),
(1120, 1, 24, '0,24', '临夏自治州', 'linxiazhou', 0, '1120', 0, 0),
(1121, 1, 24, '0,24', '甘南自治州', 'gannanzhou', 0, '1121', 0, 0),
(1122, 1, 25, '0,25', '西宁市', 'xining', 0, '1122', 0, 0),
(1123, 1, 25, '0,25', '海东地区', 'haidong', 0, '1123', 0, 0),
(1124, 1, 25, '0,25', '海北自治州', 'haibeizhou', 0, '1124', 0, 0),
(1125, 1, 25, '0,25', '黄南自治州', 'huangnanzhou', 0, '1125', 0, 0),
(1126, 1, 25, '0,25', '海南自治州', 'hainanzhou', 0, '1126', 0, 0),
(1127, 1, 25, '0,25', '果洛自治州', 'guoluozhou', 0, '1127', 0, 0),
(1128, 1, 25, '0,25', '玉树自治州', 'yushuzhou', 0, '1128', 0, 0),
(1129, 1, 25, '0,25', '海西自治州', 'haixizhou', 0, '1129', 0, 0),
(1130, 1, 26, '0,26', '银川市', 'yinchuan', 0, '1130', 0, 0),
(1131, 1, 26, '0,26', '石嘴山市', 'shizuishan', 0, '1131', 0, 0),
(1132, 1, 26, '0,26', '吴忠市', 'wuzhong', 0, '1132', 0, 0),
(1133, 1, 26, '0,26', '固原市', 'guyuan', 0, '1133', 0, 0),
(1134, 1, 26, '0,26', '中卫市', 'zhongwei', 0, '1134', 0, 0),
(1135, 1, 28, '0,28', '乌鲁木齐市', 'wulumuqi', 0, '1135', 0, 0),
(1136, 1, 28, '0,28', '克拉玛依市', 'kelamayi', 0, '1136', 0, 0),
(1137, 1, 28, '0,28', '吐鲁番地区', 'tulufan', 0, '1137', 0, 0),
(1138, 1, 28, '0,28', '哈密地区', 'hami', 0, '1138', 0, 0),
(1139, 1, 28, '0,28', '昌吉自治州', 'changjizhou', 0, '1139', 0, 0),
(1140, 1, 28, '0,28', '博尔塔拉自治州', 'boertalazhou', 0, '1140', 0, 0),
(1141, 1, 28, '0,28', '巴音郭楞自治州', 'bayinguolengzhou', 0, '1141', 0, 0),
(1142, 1, 28, '0,28', '阿克苏地区', 'akesu', 0, '1142', 0, 0),
(1143, 1, 28, '0,28', '克孜勒自治州', 'kezilezhou', 0, '1143', 0, 0),
(1144, 1, 28, '0,28', '喀什地区', 'kashi', 0, '1144', 0, 0),
(1145, 1, 28, '0,28', '和田地区', 'hetian', 0, '1145', 0, 0),
(1146, 1, 28, '0,28', '伊犁自治州', 'yilizhou', 0, '1146', 0, 0),
(1147, 1, 28, '0,28', '塔城地区', 'tacheng', 0, '1147', 0, 0),
(1148, 1, 28, '0,28', '阿勒泰地区', 'aletai', 0, '1148', 0, 0),
(1149, 1, 17, '0,17', '东莞市', 'dongguan', 0, '1149', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_linkage_data_2`
--

CREATE TABLE IF NOT EXISTS `rs_linkage_data_2` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` smallint(5) unsigned NOT NULL,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '菜单名称',
  `cname` varchar(255) NOT NULL COMMENT '菜单别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表' AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `rs_linkage_data_2`
--

INSERT INTO `rs_linkage_data_2` (`id`, `site`, `pid`, `pids`, `name`, `cname`, `child`, `hidden`, `childids`, `displayorder`) VALUES
(1, 1, 0, '0', '代理记账注册', 'dailijizhangzhuce', 1, 0, '1,10,11,12,13', 0),
(2, 1, 0, '0', '商标服务', 'shangbiaofuwu', 1, 0, '2,14,15', 0),
(3, 1, 0, '0', '企业管理软件', 'qiyeguanliruanjian', 1, 0, '3,16,17', 0),
(4, 1, 0, '0', '教育培训', 'jiaoyupeixun', 1, 0, '4,27,28', 0),
(5, 1, 0, '0', '广告设计印刷', 'guanggaoshejiyinshua', 1, 0, '5,24,25,26', 0),
(6, 1, 0, '0', '装修设计', 'zhuangxiusheji', 1, 0, '6,22,23', 0),
(7, 1, 0, '0', '家政物业', 'jiazhengwuye', 1, 0, '7,20,21', 0),
(8, 1, 0, '0', '贸易公司', 'maoyigongsi', 1, 0, '8,18,19', 0),
(9, 1, 0, '0', '其他', 'qita', 0, 0, '9', 0),
(10, 1, 1, '0,1', '注册变更', 'zhucebiangeng', 0, 0, '10', 0),
(11, 1, 1, '0,1', '代理记账', 'dailijizhang', 0, 0, '11', 0),
(12, 1, 1, '0,1', '财税顾问', 'caishuiguwen', 0, 0, '12', 0),
(13, 1, 1, '0,1', '资质认证', 'zizhirenzheng', 0, 0, '13', 0),
(14, 1, 2, '0,2', '商标专利申请', 'shangbiaozhuanlishenqing', 0, 0, '14', 0),
(15, 1, 2, '0,2', '版权申请', 'banquanshenqing', 0, 0, '15', 0),
(16, 1, 3, '0,3', 'ERP软件租赁', 'erpruanjianzulin', 0, 0, '16', 0),
(17, 1, 3, '0,3', 'ERP软件实施与咨询', 'erpruanjianshishiyuzixun', 0, 0, '17', 0),
(18, 1, 8, '0,8', '食品贸易', 'shipinmaoyi', 0, 0, '18', 0),
(19, 1, 8, '0,8', '物流运输', 'wuliuyunshu', 0, 0, '19', 0),
(20, 1, 7, '0,7', '物业保洁', 'wuyebaojie', 0, 0, '20', 0),
(21, 1, 7, '0,7', '管道污水处理', 'guandaowushuichuli', 0, 0, '21', 0),
(22, 1, 6, '0,6', '装修设计', 'zhuangxiusheji1', 0, 0, '22', 0),
(23, 1, 6, '0,6', '装修设计与施工', 'zhuangxiushejiyushigong', 0, 0, '23', 0),
(24, 1, 5, '0,5', '广告设计', 'guanggaosheji', 0, 0, '24', 0),
(25, 1, 5, '0,5', '广告代理', 'guanggaodaili', 0, 0, '25', 0),
(26, 1, 5, '0,5', '广告输出与制作', 'guanggaoshuchuyuzhizuo', 0, 0, '26', 0),
(27, 1, 4, '0,4', '会计培训', 'huijipeixun', 0, 0, '27', 0),
(28, 1, 4, '0,4', '企业管理培训', 'qiyeguanlipeixun', 0, 0, '28', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_linkage_data_3`
--

CREATE TABLE IF NOT EXISTS `rs_linkage_data_3` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` smallint(5) unsigned NOT NULL,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '菜单名称',
  `cname` varchar(255) NOT NULL COMMENT '菜单别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表' AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `rs_linkage_data_3`
--

INSERT INTO `rs_linkage_data_3` (`id`, `site`, `pid`, `pids`, `name`, `cname`, `child`, `hidden`, `childids`, `displayorder`) VALUES
(1, 1, 0, '0', '福州市', 'fuzhoushi', 1, 0, '1,2,3,4,5,14', 0),
(2, 1, 1, '0,1', '鼓楼区', 'gulouqu', 0, 0, '2', 0),
(3, 1, 1, '0,1', '台江区', 'taijiangqu', 0, 0, '3', 0),
(4, 1, 1, '0,1', '晋安区', 'jinanqu', 0, 0, '4', 0),
(5, 1, 1, '0,1', '仓山区', 'cangshanqu', 0, 0, '5', 0),
(6, 1, 0, '0', '泉州市', 'quanzhoushi', 1, 0, '6,15,16,17,18', 0),
(7, 1, 0, '0', '厦门市', 'shamenshi', 1, 0, '7,39,40,41,42,43,44', 0),
(8, 1, 0, '0', '莆田市', 'putianshi', 1, 0, '8,45,46,47,48', 0),
(9, 1, 0, '0', '宁德市', 'ningdeshi', 1, 0, '9,53', 0),
(10, 1, 0, '0', '漳州市', 'zhangzhoushi', 1, 0, '10,49,50', 0),
(11, 1, 0, '0', '龙岩市', 'longyanshi', 1, 0, '11,52', 0),
(12, 1, 0, '0', '三明市', 'sanmingshi', 1, 0, '12,25,26', 0),
(13, 1, 0, '0', '南平市', 'nanpingshi', 1, 0, '13,51', 0),
(14, 1, 1, '0,1', '马尾区', 'maweiqu', 0, 0, '14', 0),
(15, 1, 6, '0,6', '鲤城区', 'lichengqu', 0, 0, '15', 0),
(16, 1, 6, '0,6', '丰泽区', 'fengzequ', 0, 0, '16', 0),
(17, 1, 6, '0,6', '洛江区', 'luojiangqu', 0, 0, '17', 0),
(18, 1, 6, '0,6', '泉港区', 'quangangqu', 0, 0, '18', 0),
(50, 1, 10, '0,10', '龙文区', 'longwenqu', 0, 0, '50', 0),
(49, 1, 10, '0,10', '芗城区', 'xiangchengqu', 0, 0, '49', 0),
(25, 1, 12, '0,12', '梅列区', 'meiliequ', 0, 0, '25', 0),
(26, 1, 12, '0,12', '三元区', 'sanyuanqu', 0, 0, '26', 0),
(48, 1, 8, '0,8', '秀屿区', 'xiuyuqu', 0, 0, '48', 0),
(47, 1, 8, '0,8', '荔城区', 'lichengqu1', 0, 0, '47', 0),
(46, 1, 8, '0,8', '涵江区', 'hanjiangqu', 0, 0, '46', 0),
(45, 1, 8, '0,8', '城厢区', 'chengxiangqu', 0, 0, '45', 0),
(44, 1, 7, '0,7', '翔安区', 'xianganqu', 0, 0, '44', 0),
(43, 1, 7, '0,7', '同安区', 'tonganqu', 0, 0, '43', 0),
(42, 1, 7, '0,7', '集美区', 'jimeiqu', 0, 0, '42', 0),
(41, 1, 7, '0,7', '湖里区', 'huliqu', 0, 0, '41', 0),
(40, 1, 7, '0,7', '海沧区', 'haicangqu', 0, 0, '40', 0),
(39, 1, 7, '0,7', '思明区', 'simingqu', 0, 0, '39', 0),
(51, 1, 13, '0,13', '延平区', 'yanpingqu', 0, 0, '51', 0),
(52, 1, 11, '0,11', '新罗区', 'xinluoqu', 0, 0, '52', 0),
(53, 1, 9, '0,9', '蕉城区', 'jiaochengqu', 0, 0, '53', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_linkage_data_4`
--

CREATE TABLE IF NOT EXISTS `rs_linkage_data_4` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` smallint(5) unsigned NOT NULL,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '菜单名称',
  `cname` varchar(255) NOT NULL COMMENT '菜单别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表' AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `rs_linkage_data_4`
--

INSERT INTO `rs_linkage_data_4` (`id`, `site`, `pid`, `pids`, `name`, `cname`, `child`, `hidden`, `childids`, `displayorder`) VALUES
(1, 1, 0, '0', 'fuzhoushi', 'fuzhoushi', 1, 0, '1,2,3,4,5,14', 0),
(2, 1, 1, '0,1', 'gulouqu', 'gulouqu', 0, 0, '2', 0),
(3, 1, 1, '0,1', 'taijiangqu', 'taijiangqu', 0, 0, '3', 0),
(4, 1, 1, '0,1', 'jinanqu', 'jinanqu', 0, 0, '4', 0),
(5, 1, 1, '0,1', 'cangshanqu', 'cangshanqu', 0, 0, '5', 0),
(6, 1, 0, '0', 'quanzhoushi', 'quanzhoushi', 1, 0, '6,15,16,17,18', 0),
(7, 1, 0, '0', 'shamenshi', 'shamenshi', 1, 0, '7,39,40,41,42,43,44', 0),
(8, 1, 0, '0', 'putianshi', 'putianshi', 1, 0, '8,45,46,47,48', 0),
(9, 1, 0, '0', 'ningdeshi', 'ningdeshi', 1, 0, '9,53', 0),
(10, 1, 0, '0', 'zhangzhoushi', 'zhangzhoushi', 1, 0, '10,49,50', 0),
(11, 1, 0, '0', 'longyanshi', 'longyanshi', 1, 0, '11,52', 0),
(12, 1, 0, '0', 'sanmingshi', 'sanmingshi', 1, 0, '12,25,26', 0),
(13, 1, 0, '0', 'nanpingshi', 'nanpingshi', 1, 0, '13,51', 0),
(14, 1, 1, '0,1', 'maweiqu', 'maweiqu', 0, 0, '14', 0),
(15, 1, 6, '0,6', 'lichengqu', 'lichengqu', 0, 0, '15', 0),
(16, 1, 6, '0,6', 'fengzequ', 'fengzequ', 0, 0, '16', 0),
(17, 1, 6, '0,6', 'luojiangqu', 'luojiangqu', 0, 0, '17', 0),
(18, 1, 6, '0,6', 'quangangqu', 'quangangqu', 0, 0, '18', 0),
(50, 1, 10, '0,10', 'longwenqu', 'longwenqu', 0, 0, '50', 0),
(49, 1, 10, '0,10', 'xiangchengqu', 'xiangchengqu', 0, 0, '49', 0),
(25, 1, 12, '0,12', 'meiliequ', 'meiliequ', 0, 0, '25', 0),
(26, 1, 12, '0,12', 'sanyuanqu', 'sanyuanqu', 0, 0, '26', 0),
(48, 1, 8, '0,8', 'xiuyuqu', 'xiuyuqu', 0, 0, '48', 0),
(47, 1, 8, '0,8', 'lichengqu1', 'lichengqu1', 0, 0, '47', 0),
(46, 1, 8, '0,8', 'hanjiangqu', 'hanjiangqu', 0, 0, '46', 0),
(45, 1, 8, '0,8', 'chengxiangqu', 'chengxiangqu', 0, 0, '45', 0),
(44, 1, 7, '0,7', 'xianganqu', 'xianganqu', 0, 0, '44', 0),
(43, 1, 7, '0,7', 'tonganqu', 'tonganqu', 0, 0, '43', 0),
(42, 1, 7, '0,7', 'jimeiqu', 'jimeiqu', 0, 0, '42', 0),
(41, 1, 7, '0,7', 'huliqu', 'huliqu', 0, 0, '41', 0),
(40, 1, 7, '0,7', 'haicangqu', 'haicangqu', 0, 0, '40', 0),
(39, 1, 7, '0,7', 'simingqu', 'simingqu', 0, 0, '39', 0),
(51, 1, 13, '0,13', 'yanpingqu', 'yanpingqu', 0, 0, '51', 0),
(52, 1, 11, '0,11', 'xinluoqu', 'xinluoqu', 0, 0, '52', 0),
(53, 1, 9, '0,9', 'jiaochengqu', 'jiaochengqu', 0, 0, '53', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_mail_queue`
--

CREATE TABLE IF NOT EXISTS `rs_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL COMMENT '邮件地址',
  `subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `message` text NOT NULL COMMENT '邮件内容',
  `status` tinyint(1) unsigned NOT NULL COMMENT '发送状态',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件队列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_mail_smtp`
--

CREATE TABLE IF NOT EXISTS `rs_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member`
--

CREATE TABLE IF NOT EXISTS `rs_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(40) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '金币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `adminid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `levelid` smallint(5) unsigned NOT NULL COMMENT '会员级别',
  `overdue` int(10) unsigned NOT NULL COMMENT '到期时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  `ismobile` tinyint(1) unsigned DEFAULT NULL COMMENT '手机认证标识',
  `displayorder` int(5) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `adminid` (`adminid`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `rs_member`
--

INSERT INTO `rs_member` (`uid`, `email`, `username`, `password`, `salt`, `name`, `phone`, `avatar`, `money`, `freeze`, `spend`, `score`, `experience`, `adminid`, `groupid`, `levelid`, `overdue`, `regip`, `regtime`, `randcode`, `ismobile`, `displayorder`) VALUES
(1, '383272361@qq.com', 'admin', '88909df6de7eb06b18d801e22f06bda2', '34970bf226', '毕俊', '13600805100', '1', 10299.00, 0.00, 0.00, 10356, 100000524, 1, 3, 10, 4294967295, '', 0, 0, 0, 0),
(66, 'admin11@163.com', 'admin11', 'd0c46c5521cdb30616d74342fb30bb62', '704afe0739', '', '13813813888', '', 0.00, 0.00, 0.00, 30, 10, 0, 4, 5, 0, '192.168.1.80', 1496201607, 0, 0, 0),
(67, 'admin13@163.com', 'admin13', '6a736c51b0f5e16a44ec2e28cec5e2ae', '788d986905', '', '13813813889', '', 0.00, 0.00, 0.00, 20, 0, 0, 1, 0, 0, '192.168.1.80', 1496205817, 0, 0, 0),
(68, '123456@qq.com', 'text', 'ff7620bb157497814426d7ae61295902', '087408522c', '', '12345678910', '', 0.00, 0.00, 0.00, 25, 5, 0, 4, 5, 0, '61.154.16.95', 1498786026, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_address`
--

CREATE TABLE IF NOT EXISTS `rs_member_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `city` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `default` tinyint(1) unsigned NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`default`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员收货地址表' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_auth`
--

CREATE TABLE IF NOT EXISTS `rs_member_auth` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `auth_type` tinyint(1) unsigned NOT NULL COMMENT '认证类型，个人，企业',
  `auth_name` varchar(100) NOT NULL COMMENT '认证名称',
  `auth_sn` varchar(100) NOT NULL COMMENT '证件号码',
  `auth_image` varchar(100) NOT NULL COMMENT '证件图片',
  `auth_phone` varchar(50) NOT NULL COMMENT '手机号码',
  `inputip` varchar(50) NOT NULL DEFAULT '' COMMENT '申请IP',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请时间',
  `euid` mediumint(8) unsigned NOT NULL COMMENT '处理人uid',
  `editor` varchar(30) NOT NULL DEFAULT '' COMMENT '处理人账号',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '处理时间',
  `note` text COMMENT '处理备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '处理状态',
  `auth_personal` varchar(255) DEFAULT NULL,
  `company_nature` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `inputtime` (`inputtime`),
  KEY `euid` (`euid`),
  KEY `editor` (`editor`),
  KEY `edittime` (`edittime`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员实名认证管理';

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_data`
--

CREATE TABLE IF NOT EXISTS `rs_member_data` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识',
  `company_name` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `scale` varchar(255) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `com_name` varchar(255) DEFAULT NULL,
  `com_area` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `areacode` int(5) DEFAULT '0',
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=67 ;

--
-- 转存表中的数据 `rs_member_data`
--

INSERT INTO `rs_member_data` (`uid`, `complete`, `is_auth`, `company_name`, `industry`, `scale`, `nature`, `com_address`, `com_name`, `com_area`, `contact`, `areacode`, `tel`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(66, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_group`
--

CREATE TABLE IF NOT EXISTS `rs_member_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '会员组名称',
  `theme` varchar(255) NOT NULL COMMENT '风格目录',
  `template` varchar(50) NOT NULL COMMENT '模板目录',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `unit` tinyint(1) unsigned NOT NULL COMMENT '价格单位:1虚拟卡，2金钱',
  `limit` tinyint(1) unsigned NOT NULL COMMENT '售价限制：1月，2半年，3年',
  `overdue` smallint(5) unsigned NOT NULL COMMENT '过期后变成的组',
  `allowapply` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请',
  `allowspace` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员空间',
  `allowfield` text NOT NULL COMMENT '可用字段，序列化数组格式',
  `spacefield` text NOT NULL COMMENT '空间字段，序列化数组格式',
  `spacedomain` tinyint(1) unsigned DEFAULT NULL COMMENT '是否启用空间域名',
  `spacetemplate` varchar(50) DEFAULT NULL COMMENT '空间默认模板',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  `allowregister` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员注册',
  `allowapply_orther` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请其他组',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员组表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `rs_member_group`
--

INSERT INTO `rs_member_group` (`id`, `name`, `theme`, `template`, `price`, `unit`, `limit`, `overdue`, `allowapply`, `allowspace`, `allowfield`, `spacefield`, `spacedomain`, `spacetemplate`, `displayorder`, `allowregister`, `allowapply_orther`) VALUES
(1, '禁用会员', 'default', 'default', 0.00, 1, 1, 0, 0, 0, '', '', 1, 'default', 0, 0, 0),
(3, '会计会员', 'default', 'default', 0.00, 1, 4, 3, 1, 0, '', '', 0, 'default', 0, 0, 0),
(4, '企业会员', 'default', 'default', 0.00, 2, 4, 4, 1, 0, 'a:7:{i:0;s:9:\\"com_photo\\";i:1;s:8:\\"com_name\\";i:2;s:12:\\"company_name\\";i:3;s:8:\\"industry\\";i:4;s:5:\\"scale\\";i:5;s:6:\\"nature\\";i:6;s:11:\\"com_address\\";}', '', 0, NULL, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_level`
--

CREATE TABLE IF NOT EXISTS `rs_member_level` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '会员级别名称',
  `stars` tinyint(2) NOT NULL COMMENT '星星数量',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值要求',
  `allowupgrade` tinyint(1) NOT NULL COMMENT '允许自动升级',
  PRIMARY KEY (`id`),
  KEY `experience` (`experience`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员级别表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `rs_member_level`
--

INSERT INTO `rs_member_level` (`id`, `groupid`, `name`, `stars`, `experience`, `allowupgrade`) VALUES
(1, 3, '普通', 1, 0, 0),
(2, 3, '铜牌', 5, 200, 0),
(3, 3, '银牌', 10, 500, 0),
(4, 3, '金牌', 20, 1500, 0),
(5, 4, '普通', 1, 0, 0),
(6, 4, '银牌', 10, 500, 0),
(7, 4, '金牌', 20, 1500, 0),
(8, 4, '钻石', 55, 5000, 0),
(9, 3, '蓝钻', 35, 3000, 0),
(10, 3, '金钻', 55, 5000, 0),
(11, 4, '铜牌', 5, 200, 0),
(12, 4, '蓝钻', 35, 3000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_login`
--

CREATE TABLE IF NOT EXISTS `rs_member_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `oauthid` varchar(30) NOT NULL COMMENT '快捷登录方式',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='登录日志记录' AUTO_INCREMENT=506 ;

--
-- 转存表中的数据 `rs_member_login`
--

INSERT INTO `rs_member_login` (`id`, `uid`, `oauthid`, `loginip`, `logintime`, `useragent`) VALUES
(169, 2, '', '120.35.4.185', 1473402647, 'Windows 7 Chrome 45.0.2454.101'),
(503, 1, '', '220.200.1.90', 1505614048, 'Windows 7 Chrome 49.0.2623.75'),
(499, 1, '', '220.200.1.90', 1503232427, 'Windows 7 Chrome 45.0.2454.101'),
(502, 1, '', '220.200.1.90', 1505526339, 'Windows 7 Chrome 49.0.2623.75'),
(496, 1, '', '61.154.16.95', 1498785138, 'Windows 10 Chrome 50.0.2661.102'),
(484, 66, '', '192.168.1.80', 1498030058, 'Windows 7 Chrome 47.0.2526.73'),
(495, 1, '', '61.154.16.95', 1498700770, 'Windows 10 Chrome 50.0.2661.102'),
(491, 66, '', '58.217.245.118', 1498465631, 'Windows 7 Chrome 47.0.2526.73'),
(505, 1, '', '220.200.1.90', 1505723185, 'Windows 7 Chrome 49.0.2623.75'),
(497, 68, '', '61.154.16.95', 1498786192, 'Windows 10 Chrome 50.0.2661.102'),
(501, 1, '', '220.200.1.90', 1505464501, 'Windows 7 Chrome 49.0.2623.75'),
(504, 1, '', '117.25.52.20', 1505721493, 'Windows 10 Chrome 50.0.2661.102'),
(498, 1, '', '220.200.1.90', 1503141360, 'Windows 7 Chrome 45.0.2454.101'),
(500, 1, '', '117.25.52.20', 1505460770, 'Windows 10 Chrome 50.0.2661.102');

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_menu`
--

CREATE TABLE IF NOT EXISTS `rs_member_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `mark` varchar(50) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `target` tinyint(3) unsigned DEFAULT NULL COMMENT '新窗口',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员菜单表' AUTO_INCREMENT=183 ;

--
-- 转存表中的数据 `rs_member_menu`
--

INSERT INTO `rs_member_menu` (`id`, `pid`, `name`, `uri`, `url`, `mark`, `hidden`, `target`, `displayorder`, `icon`) VALUES
(1, 0, '账号', '', '', '', 0, 0, 0, 'icon-user'),
(2, 0, '财务', '', '', '', 0, 0, 0, 'fa fa-rmb'),
(43, 16, '转账服务', 'pay/transfer', '', '', 0, 0, 0, 'fa fa-rmb'),
(5, 1, '基本管理', '', '', '', 0, 0, 0, 'fa fa-cogs'),
(6, 5, '基本资料', 'account/index', '', '', 0, 0, 0, 'fa fa-cog'),
(11, 5, '修改密码', 'account/password', '', '', 0, 0, 0, 'icon-lock'),
(16, 2, '充值付款', '', '', '', 0, 0, 0, 'fa fa-rmb'),
(17, 2, '财务记录', '', '', '', 0, 0, 0, 'fa fa-calendar-o'),
(18, 16, '在线充值', 'pay/add', '', '', 0, 0, 0, 'fa fa-rmb'),
(20, 16, '兑换服务', 'pay/convert', '', '', 0, 0, 0, 'fa fa-exchange'),
(21, 17, '收入记录', 'pay/index', '', '', 0, 0, 0, 'fa fa-calendar-plus-o'),
(22, 17, '消费记录', 'pay/spend', '', '', 0, 0, 0, 'fa fa-calendar-minus-o'),
(24, 17, '金币记录', 'pay/score', '', '', 0, 0, 0, 'fa fa-diamond'),
(45, 5, '上传头像', 'account/avatar', '', '', 0, 0, 0, 'icon-picture'),
(48, 1, '通知提醒', '', '', '', 0, 0, 0, 'fa fa-bell-o'),
(50, 48, '系统提醒', 'notice/index', '', '', 0, 0, 0, 'fa fa-bell'),
(52, 48, '模块提醒', 'notice/module', '', '', 0, 0, 0, 'fa fa-whatsapp'),
(54, 0, '内容', '', '', 'm_mod', 0, 0, 0, 'fa fa-th-large'),
(60, 55, '我收藏的文章', 'news/home/favorite', '', 'module-news', 0, 0, 0, 'fa fa-th-large'),
(63, 54, '订单管理', '', '', 'left-order', 0, 0, 0, 'fa fa-shopping-cart'),
(64, 63, '已购买的商品', 'order/home/index', '', 'module-order', 0, 0, 0, 'fa fa-shopping-cart'),
(66, 54, '商城', '', NULL, 'left-shop', 0, 0, 0, 'fa fa-cart-plus'),
(67, 66, '我收藏的商品', 'shop/home/favorite', '', 'module-shop', 0, 0, 0, 'fa fa-th-large'),
(68, 66, '我评论的商品', 'shop/comment/index', '', 'module-shop', 0, 0, 0, 'fa fa-th-large'),
(96, 54, '在线咨询', '', NULL, 'left-answer', 0, 0, 0, 'fa fa-commenting-o'),
(97, 96, '已通过的提问', 'answer/home/index', '', 'module-answer', 0, 0, 0, 'fa fa-th-large'),
(98, 96, '待审核的提问', 'answer/verify/index', '', 'module-answer', 0, 0, 0, 'fa fa-th-large'),
(99, 96, '被退回的提问', 'answer/back/index', '', 'module-answer', 0, 0, 0, 'fa fa-th-large'),
(103, 96, '我评论的提问', 'answer/comment/index', '', 'module-answer', 0, 0, 0, 'fa fa-th-large'),
(129, 5, '实名认证', 'auth/home/index', '', 'app-auth', 0, 0, 0, 'icon-user'),
(151, 54, '文档管理', '', '', 'left-xwdt', 0, 0, 0, 'fa fa-th-large'),
(152, 151, '已通过的文档', 'xwdt/home/index', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large'),
(153, 151, '待审核的文档', 'xwdt/verify/index', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large'),
(154, 151, '被退回的文档', 'xwdt/back/index', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large'),
(155, 151, '我推荐的文档', 'xwdt/home/flag', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large'),
(156, 151, '我收藏的文档', 'xwdt/home/favorite', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large'),
(157, 151, '我购买的文档', 'xwdt/home/buy', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large'),
(158, 151, '我评论的文档', 'xwdt/comment/index', '', 'module-xwdt', 0, 0, 0, 'fa fa-th-large');

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_new_notice`
--

CREATE TABLE IF NOT EXISTS `rs_member_new_notice` (
  `uid` smallint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新通知提醒表';

--
-- 转存表中的数据 `rs_member_new_notice`
--

INSERT INTO `rs_member_new_notice` (`uid`) VALUES
(2),
(3),
(10),
(15),
(16),
(17),
(18),
(20),
(21),
(22),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(35),
(40),
(41),
(42),
(43),
(45),
(46),
(47),
(48),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(60),
(61),
(62),
(63),
(64),
(65),
(66),
(68);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_0`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_1`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `rs_member_notice_1`
--

INSERT INTO `rs_member_notice_1` (`id`, `type`, `uid`, `isnew`, `content`, `inputtime`) VALUES
(1, 3, 1, 0, '<a href="http://www.topkuaiji.com/index.php?s=member&mod=qiuzhi&c=form_wyqz&m=listc&cid=1">《111》有新的我要求职</a>', 1465290731),
(2, 3, 1, 0, '<a href="http://www.topkuaiji.com/index.php?s=member&mod=qiuzhi&c=form_wyqz&m=listc&cid=1">《发布》有新的我要求职</a>', 1465292071),
(3, 3, 1, 0, '<a href="http://www.topkuaiji.com/index.php?s=member&mod=job&c=form_wyzp&m=listc&cid=1">《招聘 会计出纳人员》有新的我要招聘</a>', 1465353166),
(4, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=qiuzhi&c=show&id=4#comment-2" target="_blank">查看详情</a>', 1465373751),
(5, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=answer&c=show&id=1" target="_blank">查看详情</a>', 1465379825),
(6, 1, 1, 0, '您的会员组等级升级成功', 1466580745),
(7, 1, 1, 0, '您的会员组等级升级成功', 1466580764),
(8, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=video&c=extend&id=2" target="_blank">查看详情</a>', 1466677674),
(9, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=video&c=extend&id=1" target="_blank">查看详情</a>', 1466739066),
(10, 3, 1, 0, '【78888】审核通过', 1470648408),
(11, 3, 1, 0, '【国际贸易“单一窗口”]】审核通过', 1470648408),
(12, 3, 1, 0, '【投资体制改革“四个一”333】审核通过', 1470648408),
(13, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=answer&c=show&id=6" target="_blank">查看详情</a>', 1470724551),
(14, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=answer&c=show&id=6" target="_blank">查看详情</a>', 1470725579),
(15, 2, 1, 0, '您有新的评论，<a href="http://www.topkuaiji.com/index.php?s=answer&c=show&id=6#comment-4" target="_blank">查看详情</a>', 1470726329),
(16, 1, 1, 0, '您的会员组等级升级成功', 1470986787),
(17, 1, 1, 0, '您的会员组等级升级成功', 1470986817),
(18, 1, 1, 0, '您的密码被管理员admin修改了', 1471314428),
(19, 3, 1, 0, '【个体工商户注册需要什么材料】审核通过', 1471851067),
(20, 3, 1, 0, '【财务代理流程是什么？】审核通过', 1471854480),
(21, 1, 1, 0, '恭喜亲，您的会员组续费成功', 1472950085),
(28, 2, 1, 1, '您有新的评论，<a href="http://www.topkuaiji.com/answer-show-31.html" target="_blank">查看详情</a>', 1474939326),
(30, 2, 1, 1, '您有新的评论，<a href="http://www.topkuaiji.com/shop-show-22.html#comment-1" target="_blank">查看详情</a>', 1476084865);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_2`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_3`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_4`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_5`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_6`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_6` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `rs_member_notice_6`
--

INSERT INTO `rs_member_notice_6` (`id`, `type`, `uid`, `isnew`, `content`, `inputtime`) VALUES
(15, 1, 66, 1, '您的密码被管理员admin修改了', 1498030048),
(16, 1, 66, 1, '您的会员组等级升级成功', 1498030050);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_7`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_7` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_8`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_8` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `rs_member_notice_8`
--

INSERT INTO `rs_member_notice_8` (`id`, `type`, `uid`, `isnew`, `content`, `inputtime`) VALUES
(10, 1, 68, 1, '您的会员组等级升级成功', 1498786192);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_notice_9`
--

CREATE TABLE IF NOT EXISTS `rs_member_notice_9` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_oauth`
--

CREATE TABLE IF NOT EXISTS `rs_member_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `expire_at` int(10) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员OAuth2授权表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_online`
--

CREATE TABLE IF NOT EXISTS `rs_member_online` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL COMMENT '在线时间',
  PRIMARY KEY (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员在线情况表' AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `rs_member_online`
--

INSERT INTO `rs_member_online` (`uid`, `time`) VALUES
(1, 1505724536);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_paylog`
--

CREATE TABLE IF NOT EXISTS `rs_member_paylog` (
  `id` bigint(15) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `value` decimal(10,2) NOT NULL COMMENT '价格',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `order` varchar(200) DEFAULT NULL COMMENT '订单号集合',
  `module` varchar(30) NOT NULL COMMENT '应用或模块目录',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `order` (`order`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='支付记录表' AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `rs_member_paylog`
--

INSERT INTO `rs_member_paylog` (`id`, `uid`, `value`, `type`, `status`, `order`, `module`, `note`, `inputtime`) VALUES
(1, 0, 11.00, 'alipay', 0, '3', 'order', '', 1469440255),
(8, 1, 1.00, 'weixin', 0, '', '', '', 1472433199),
(15, 1, 1000.00, 'alipay', 0, '', '', '', 1472810023),
(16, 1, 1000.00, 'alipay', 0, '', '', '', 1472810044),
(17, 1, 1000.00, 'weixin', 0, '', '', '', 1472810058),
(23, 1, 10.00, 'alipay', 0, '', '', '', 1472871929),
(24, 1, 10.00, 'weixin', 0, '', '', '', 1472871942),
(25, 1, 1.00, 'alipay', 0, '', '', '', 1473036305),
(26, 1, 1.00, 'alipay', 0, '', '', '', 1473037064),
(36, 1, 0.01, 'chinabank', 0, '', '', '', 1473728168),
(37, 1, 0.01, 'chinabank', 0, '', '', '', 1473728200),
(38, 1, 0.01, 'chinabank', 0, '', '', '', 1473728220),
(39, 1, 0.01, 'chinabank', 0, '', '', '', 1473728231),
(40, 1, 0.01, 'chinabank', 0, '', '', '', 1473747093),
(50, 1, 300.00, '0', 1, '0', '', 'lang,m-377,<a href="http://www.topkuaiji.com/index.php?s=member&mod=order&c=home&m=info&id=29" target="_blank">RS201610104379310</a>', 1476084644),
(51, 1, 100.00, 'chinabank', 0, '', '', '', 1488249952),
(53, 68, 12.00, 'weixin', 0, '30', 'order', '', 1498786346);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_scorelog`
--

CREATE TABLE IF NOT EXISTS `rs_member_scorelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL COMMENT '积分0,金币1',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='得分日志' AUTO_INCREMENT=681 ;

--
-- 转存表中的数据 `rs_member_scorelog`
--

INSERT INTO `rs_member_scorelog` (`id`, `uid`, `type`, `value`, `mark`, `note`, `inputtime`) VALUES
(1, 1, 0, 5, 'login', 'lang,m-056', 1463645397),
(2, 1, 0, 5, 'login', 'lang,m-056', 1463709329),
(3, 1, 0, 5, 'login', 'lang,m-056', 1464318550),
(4, 1, 0, 5, 'login', 'lang,m-056', 1464601819),
(5, 1, 0, 10, 'complete', 'lang,m-058', 1464601846),
(6, 1, 0, 10, 'avatar', 'lang,m-057', 1464601859),
(77, 1, 0, 5, '', '评论', 1473125756),
(78, 1, 1, 5, '', '评论', 1473125756),
(15, 1, 0, 5, 'login', '每日登陆', 1464837850),
(44, 1, 1, -10, '', '查看联系方式', 1470737190),
(43, 1, 1, -10, '', '查看联系方式', 1470734626),
(42, 1, 1, -10, '', '查看联系方式', 1470734546),
(21, 1, 0, 5, 'login', '每日登陆', 1465173742),
(22, 1, 0, 5, 'login', '每日登陆', 1465264308),
(89, 1, 1, -2, '', '查看联系方式', 1473244038),
(41, 1, 1, -20, '', '购买', 1470477157),
(28, 1, 0, 5, 'login', '每日登陆', 1465353222),
(40, 1, 1, -100, '', '购买', 1470476852),
(86, 1, 1, -2, '', '查看联系方式', 1473228513),
(32, 1, 0, 5, 'login', '每日登陆', 1466126947),
(39, 1, 1, -10, '', '购买', 1470471407),
(34, 1, 0, 5, 'login', '每日登陆', 1466388004),
(36, 1, 0, 5, 'login', '每日登陆', 1466503042),
(37, 1, 0, 5, 'login', '每日登陆', 1466567950),
(45, 1, 1, -10, '', '查看联系方式', 1470737484),
(46, 1, 1, -10, '', '查看联系方式', 1470737547),
(47, 1, 1, -10, '', '查看联系方式', 1470737575),
(48, 1, 1, -10, '', '查看联系方式', 1470737613),
(49, 1, 1, -10, '', '查看联系方式', 1470737822),
(50, 1, 1, -10, '', '查看联系方式', 1470737882),
(51, 1, 1, -10, '', '查看联系方式', 1470737920),
(52, 1, 1, -10, '', '查看联系方式', 1470791000),
(53, 1, 1, -10, '', '查看联系方式', 1470791809),
(54, 1, 1, -10, '', '查看联系方式', 1470792509),
(55, 1, 1, -10, '', '购买', 1471246471),
(58, 1, 1, -10, '', '购买', 1472111070),
(60, 1, 1, -2, '', '查看联系方式', 1472698784),
(131, 1, 0, 5, 'login', '每日登陆', 1474330774),
(132, 1, 1, 5, 'login', '每日登陆', 1474330774),
(143, 1, 0, 5, 'login', '每日登陆', 1474417211),
(144, 1, 1, 5, 'login', '每日登陆', 1474417211),
(145, 1, 0, 5, 'login', '每日登陆', 1474504638),
(146, 1, 1, 5, 'login', '每日登陆', 1474504638),
(147, 1, 0, 5, 'login', '每日登陆', 1474591252),
(148, 1, 1, 5, 'login', '每日登陆', 1474591252),
(211, 1, 0, 5, 'login', '每日登陆', 1474849937),
(212, 1, 1, 5, 'login', '每日登陆', 1474849937),
(213, 1, 0, 5, 'login', '每日登陆', 1474936844),
(214, 1, 1, 5, 'login', '每日登陆', 1474936844),
(231, 1, 1, -2, '', '查看联系方式', 1474941467),
(247, 1, 0, 5, 'login', '每日登陆', 1475109872),
(248, 1, 1, 5, 'login', '每日登陆', 1475109872),
(284, 1, 1, -2, '', '查看联系方式', 1475194461),
(285, 1, 0, 5, 'login', '每日登陆', 1475194550),
(286, 1, 1, 5, 'login', '每日登陆', 1475194550),
(297, 1, 0, 5, 'login', '每日登陆', 1475894052),
(298, 1, 1, 5, 'login', '每日登陆', 1475894052),
(312, 1, 0, 5, 'login', '每日登陆', 1475973807),
(313, 1, 1, 5, 'login', '每日登陆', 1475973807),
(325, 1, 0, 5, 'login', '每日登陆', 1476089052),
(326, 1, 1, 5, 'login', '每日登陆', 1476089052),
(331, 1, 0, 5, 'login', '每日登陆', 1476152324),
(332, 1, 1, 5, 'login', '每日登陆', 1476152324),
(335, 1, 0, 5, 'login', '每日登陆', 1476232991),
(336, 1, 1, 5, 'login', '每日登陆', 1476232991),
(337, 1, 0, 5, 'login', '每日登陆', 1476319744),
(338, 1, 1, 5, 'login', '每日登陆', 1476319744),
(348, 1, 1, -2, '', '查看联系方式', 1476344656),
(353, 1, 0, 5, 'login', '每日登陆', 1476403976),
(354, 1, 1, 5, 'login', '每日登陆', 1476403976),
(357, 1, 0, 5, 'login', '每日登陆', 1476750434),
(358, 1, 1, 5, 'login', '每日登陆', 1476750434),
(368, 1, 0, 5, 'login', '每日登陆', 1476838760),
(369, 1, 1, 5, 'login', '每日登陆', 1476838760),
(376, 1, 0, 5, 'login', '每日登陆', 1476933060),
(377, 1, 1, 5, 'login', '每日登陆', 1476933060),
(378, 1, 0, 5, 'login', '每日登陆', 1477032117),
(379, 1, 1, 5, 'login', '每日登陆', 1477032117),
(382, 1, 0, 5, 'login', '每日登陆', 1477220591),
(383, 1, 1, 5, 'login', '每日登陆', 1477220591),
(386, 1, 0, 5, 'login', '每日登陆', 1477268082),
(387, 1, 1, 5, 'login', '每日登陆', 1477268082),
(399, 1, 1, -2, '', '查看联系方式', 1477355521),
(400, 1, 0, 5, 'login', '每日登陆', 1477362409),
(401, 1, 1, 5, 'login', '每日登陆', 1477362409),
(408, 1, 0, 5, 'login', '每日登陆', 1477466637),
(409, 1, 1, 5, 'login', '每日登陆', 1477466637),
(410, 1, 0, 5, 'login', '每日登陆', 1477532658),
(411, 1, 1, 5, 'login', '每日登陆', 1477532658),
(414, 1, 1, -20, '', '查看联系方式', 1477540105),
(415, 1, 0, 5, 'login', '每日登陆', 1477873915),
(416, 1, 1, 5, 'login', '每日登陆', 1477873915),
(421, 1, 0, 5, 'login', '每日登陆', 1477959363),
(422, 1, 1, 5, 'login', '每日登陆', 1477959363),
(433, 1, 0, 5, 'login', '每日登陆', 1478055814),
(434, 1, 1, 5, 'login', '每日登陆', 1478055814),
(448, 1, 0, 5, 'login', '每日登陆', 1478163770),
(449, 1, 1, 5, 'login', '每日登陆', 1478163770),
(450, 1, 1, -2, '', '查看联系方式', 1478247017),
(451, 1, 0, 5, 'login', '每日登陆', 1478499418),
(452, 1, 1, 5, 'login', '每日登陆', 1478499418),
(455, 1, 0, 5, 'login', '每日登陆', 1478577325),
(456, 1, 1, 5, 'login', '每日登陆', 1478577325),
(464, 1, 0, 5, 'login', '每日登陆', 1478749668),
(465, 1, 1, 5, 'login', '每日登陆', 1478749668),
(468, 1, 0, 5, '', '评论', 1478758184),
(469, 1, 1, 5, '', '评论', 1478758184),
(475, 1, 1, -2, '', '查看联系方式', 1478852432),
(476, 1, 0, 5, 'login', '每日登陆', 1479181547),
(477, 1, 1, 5, 'login', '每日登陆', 1479181547),
(480, 1, 0, 5, '', '评论', 1479193918),
(481, 1, 1, 5, '', '评论', 1479193918),
(482, 1, 0, 5, 'login', '每日登陆', 1479347555),
(483, 1, 1, 5, 'login', '每日登陆', 1479347555),
(484, 1, 0, 5, 'login', '每日登陆', 1479433350),
(485, 1, 1, 5, 'login', '每日登陆', 1479433350),
(488, 1, 0, 5, '', '评论', 1479434103),
(489, 1, 1, 5, '', '评论', 1479434103),
(490, 1, 0, 5, 'login', '每日登陆', 1479951403),
(491, 1, 1, 5, 'login', '每日登陆', 1479951403),
(494, 1, 0, 5, '', '评论', 1479951477),
(495, 1, 1, 5, '', '评论', 1479951477),
(503, 1, 0, 5, 'login', '每日登陆', 1480037608),
(504, 1, 1, 5, 'login', '每日登陆', 1480037608),
(513, 1, 0, 5, 'login', '每日登陆', 1480324558),
(514, 1, 1, 5, 'login', '每日登陆', 1480324558),
(515, 1, 0, 5, 'login', '每日登陆', 1480380206),
(516, 1, 1, 5, 'login', '每日登陆', 1480380206),
(517, 1, 0, 5, 'login', '每日登陆', 1480494217),
(518, 1, 1, 5, 'login', '每日登陆', 1480494217),
(519, 1, 0, 5, 'login', '每日登陆', 1480553631),
(520, 1, 1, 5, 'login', '每日登陆', 1480553631),
(521, 1, 0, 5, 'login', '每日登陆', 1480637918),
(522, 1, 1, 5, 'login', '每日登陆', 1480637918),
(530, 1, 0, 5, 'login', '每日登陆', 1480899865),
(531, 1, 1, 5, 'login', '每日登陆', 1480899865),
(537, 1, 0, 5, 'login', '每日登陆', 1481533948),
(538, 1, 1, 5, 'login', '每日登陆', 1481533948),
(541, 1, 0, 5, 'login', '每日登陆', 1482112378),
(542, 1, 1, 5, 'login', '每日登陆', 1482112378),
(543, 1, 0, 5, 'login', '每日登陆', 1482305061),
(544, 1, 1, 5, 'login', '每日登陆', 1482305061),
(545, 1, 0, 5, 'login', '每日登陆', 1482463466),
(546, 1, 1, 5, 'login', '每日登陆', 1482463466),
(547, 1, 0, 5, 'login', '每日登陆', 1482718934),
(548, 1, 1, 5, 'login', '每日登陆', 1482718934),
(549, 1, 0, 5, 'login', '每日登陆', 1482976533),
(550, 1, 1, 5, 'login', '每日登陆', 1482976533),
(551, 1, 0, 5, 'login', '每日登陆', 1483061684),
(552, 1, 1, 5, 'login', '每日登陆', 1483061684),
(553, 1, 0, 5, 'login', '每日登陆', 1483945549),
(554, 1, 1, 5, 'login', '每日登陆', 1483945549),
(555, 1, 0, 5, 'login', '每日登陆', 1484795730),
(556, 1, 1, 5, 'login', '每日登陆', 1484795730),
(557, 1, 0, 5, 'login', '每日登陆', 1485239530),
(558, 1, 1, 5, 'login', '每日登陆', 1485239530),
(561, 1, 0, 5, 'login', '每日登陆', 1486177208),
(562, 1, 1, 5, 'login', '每日登陆', 1486177208),
(563, 1, 0, 5, 'login', '每日登陆', 1486340699),
(564, 1, 1, 5, 'login', '每日登陆', 1486340699),
(567, 1, 0, 5, 'login', '每日登陆', 1487119051),
(568, 1, 1, 5, 'login', '每日登陆', 1487119051),
(569, 1, 0, 5, 'login', '每日登陆', 1487205954),
(570, 1, 1, 5, 'login', '每日登陆', 1487205954),
(571, 1, 0, 5, 'login', '每日登陆', 1487810735),
(572, 1, 1, 5, 'login', '每日登陆', 1487810735),
(573, 1, 0, 5, 'login', '每日登陆', 1488157633),
(574, 1, 1, 5, 'login', '每日登陆', 1488157633),
(575, 1, 0, 5, 'login', '每日登陆', 1488249854),
(576, 1, 1, 5, 'login', '每日登陆', 1488249854),
(577, 1, 0, 5, 'login', '每日登陆', 1488503528),
(578, 1, 1, 5, 'login', '每日登陆', 1488503528),
(579, 1, 0, 5, 'login', '每日登陆', 1488780710),
(580, 1, 1, 5, 'login', '每日登陆', 1488780710),
(581, 1, 0, 5, 'login', '每日登陆', 1489043316),
(582, 1, 1, 5, 'login', '每日登陆', 1489043316),
(585, 1, 0, 5, '', '评论', 1489043419),
(586, 1, 1, 5, '', '评论', 1489043419),
(587, 1, 0, 5, 'login', '每日登陆', 1489368494),
(588, 1, 1, 5, 'login', '每日登陆', 1489368494),
(594, 1, 0, 5, 'login', '每日登陆', 1490142341),
(595, 1, 1, 5, 'login', '每日登陆', 1490142341),
(596, 1, 0, 5, 'login', '每日登陆', 1490583482),
(597, 1, 1, 5, 'login', '每日登陆', 1490583482),
(598, 1, 0, 5, 'login', '每日登陆', 1491269178),
(599, 1, 1, 5, 'login', '每日登陆', 1491269178),
(600, 1, 0, 5, 'login', '每日登陆', 1491366421),
(601, 1, 1, 5, 'login', '每日登陆', 1491366421),
(602, 1, 0, 5, 'login', '每日登陆', 1492137157),
(603, 1, 1, 5, 'login', '每日登陆', 1492137157),
(604, 1, 0, 5, 'login', '每日登陆', 1493004849),
(605, 1, 1, 5, 'login', '每日登陆', 1493004849),
(606, 1, 0, 5, 'login', '每日登陆', 1493171815),
(607, 1, 1, 5, 'login', '每日登陆', 1493171815),
(608, 1, 0, 5, 'login', '每日登陆', 1495526252),
(609, 1, 1, 5, 'login', '每日登陆', 1495526252),
(651, 1, 1, 5, 'login', '每日登陆', 1497403589),
(650, 1, 0, 5, 'login', '每日登陆', 1497403589),
(616, 1, 0, 5, 'login', '每日登陆', 1495644097),
(617, 1, 1, 5, 'login', '每日登陆', 1495644097),
(618, 1, 0, 5, 'login', '每日登陆', 1495757925),
(619, 1, 1, 5, 'login', '每日登陆', 1495757925),
(620, 1, 0, 5, 'login', '每日登陆', 1495869361),
(621, 1, 1, 5, 'login', '每日登陆', 1495869361),
(622, 66, 1, 10, '', '注册送10金币', 1496201607),
(623, 67, 1, 10, '', '注册送10金币', 1496205817),
(624, 1, 0, 5, 'login', '每日登陆', 1496221389),
(625, 1, 1, 5, 'login', '每日登陆', 1496221389),
(626, 1, 0, 5, 'login', '每日登陆', 1496306189),
(627, 1, 1, 5, 'login', '每日登陆', 1496306189),
(628, 1, 0, 5, 'login', '每日登陆', 1496358573),
(629, 1, 1, 5, 'login', '每日登陆', 1496358573),
(630, 1, 0, 5, 'login', '每日登陆', 1496481229),
(631, 1, 1, 5, 'login', '每日登陆', 1496481229),
(632, 1, 0, 5, 'login', '每日登陆', 1496587133),
(633, 1, 1, 5, 'login', '每日登陆', 1496587133),
(634, 1, 0, 5, 'login', '每日登陆', 1496636975),
(635, 1, 1, 5, 'login', '每日登陆', 1496636975),
(636, 1, 0, 5, 'login', '每日登陆', 1496713216),
(637, 1, 1, 5, 'login', '每日登陆', 1496713216),
(638, 1, 0, 5, 'login', '每日登陆', 1496770472),
(639, 1, 1, 5, 'login', '每日登陆', 1496770472),
(640, 1, 0, 5, 'login', '每日登陆', 1496914643),
(641, 1, 1, 5, 'login', '每日登陆', 1496914643),
(642, 1, 0, 5, 'login', '每日登陆', 1496974605),
(643, 1, 1, 5, 'login', '每日登陆', 1496974605),
(644, 1, 0, 5, 'login', '每日登陆', 1497063705),
(645, 1, 1, 5, 'login', '每日登陆', 1497063705),
(646, 1, 0, 5, 'login', '每日登陆', 1497194110),
(647, 1, 1, 5, 'login', '每日登陆', 1497194110),
(648, 1, 0, 5, 'login', '每日登陆', 1497234445),
(649, 1, 1, 5, 'login', '每日登陆', 1497234445),
(652, 1, 0, 5, 'login', '每日登陆', 1497777935),
(653, 1, 1, 5, 'login', '每日登陆', 1497777935),
(654, 1, 0, 5, 'login', '每日登陆', 1497943669),
(655, 1, 1, 5, 'login', '每日登陆', 1497943669),
(656, 1, 0, 5, 'login', '每日登陆', 1498004561),
(657, 1, 1, 5, 'login', '每日登陆', 1498004561),
(658, 66, 0, 5, 'login', '每日登陆', 1498030059),
(659, 66, 1, 5, 'login', '每日登陆', 1498030059),
(660, 1, 0, 5, 'login', '每日登陆', 1498061442),
(661, 1, 1, 5, 'login', '每日登陆', 1498061442),
(662, 1, 0, 5, 'login', '每日登陆', 1498307020),
(663, 1, 1, 5, 'login', '每日登陆', 1498307020),
(664, 1, 0, 5, 'login', '每日登陆', 1498443480),
(665, 1, 1, 5, 'login', '每日登陆', 1498443480),
(666, 66, 0, 5, 'login', '每日登陆', 1498465631),
(667, 66, 1, 5, 'login', '每日登陆', 1498465631),
(668, 1, 0, 5, 'login', '每日登陆', 1498540088),
(669, 1, 1, 5, 'login', '每日登陆', 1498540088),
(670, 1, 0, 5, 'login', '每日登陆', 1498785558),
(671, 1, 1, 5, 'login', '每日登陆', 1498785558),
(672, 68, 1, 10, '', '注册送10金币', 1498786026),
(673, 68, 0, 5, 'login', '每日登陆', 1498786192),
(674, 68, 1, 5, 'login', '每日登陆', 1498786192),
(675, 1, 0, 5, 'login', '每日登陆', 1505464578),
(676, 1, 1, 5, 'login', '每日登陆', 1505464578),
(677, 1, 0, 5, 'login', '每日登陆', 1505625471),
(678, 1, 1, 5, 'login', '每日登陆', 1505625471),
(679, 1, 0, 5, 'login', '每日登陆', 1505702112),
(680, 1, 1, 5, 'login', '每日登陆', 1505702112);

-- --------------------------------------------------------

--
-- 表的结构 `rs_member_setting`
--

CREATE TABLE IF NOT EXISTS `rs_member_setting` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员属性参数表';

--
-- 转存表中的数据 `rs_member_setting`
--

INSERT INTO `rs_member_setting` (`name`, `value`) VALUES
('member', 'a:18:{s:8:\\"complete\\";s:1:\\"1\\";s:8:\\"pagesize\\";s:2:\\"20\\";s:6:\\"domain\\";a:1:{i:1;s:0:\\"\\";}s:7:\\"urlrule\\";s:1:\\"0\\";s:8:\\"register\\";s:1:\\"1\\";s:8:\\"regfield\\";a:3:{i:0;s:8:\\"username\\";i:1;s:5:\\"phone\\";i:2;s:5:\\"email\\";}s:9:\\"regverify\\";s:1:\\"2\\";s:9:\\"regiptime\\";s:0:\\"\\";s:11:\\"regnamerule\\";s:0:\\"\\";s:11:\\"regnotallow\\";s:0:\\"\\";s:9:\\"logincode\\";s:1:\\"1\\";s:11:\\"loginexpire\\";s:5:\\"86400\\";s:7:\\"ucenter\\";s:1:\\"0\\";s:10:\\"ucentercfg\\";s:0:\\"\\";s:5:\\"field\\";s:0:\\"\\";s:7:\\"mbfield\\";s:0:\\"\\";s:10:\\"mergefield\\";s:173:\\"					</div>\r\n				</div>\r\n<div class=\\"portlet light\\" id=\\"dr_{name}\\">\r\n					<div class=\\"portlet-title mytitle\\">\r\n						{text}\r\n					</div>\r\n<div class=\\"portlet-body\\">\r\n{value}\\";s:12:\\"mbmergefield\\";s:173:\\"					</div>\r\n				</div>\r\n<div class=\\"portlet light\\" id=\\"dr_{name}\\">\r\n					<div class=\\"portlet-title mytitle\\">\r\n						{text}\r\n					</div>\r\n<div class=\\"portlet-body\\">\r\n{value}\\";}'),
('permission', 'a:14:{i:1;a:13:{s:16:\\"login_experience\\";s:1:\\"1\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:10:\\"attachsize\\";s:1:\\"0\\";}i:2;a:14:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"5\\";}s:3:\\"3_1\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"3_2\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"3_3\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"3_4\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"4_5\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"4_6\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"4_7\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"4_8\\";a:7:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:4:\\"3_10\\";a:8:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:7:\\"1000000\\";}s:4:\\"4_11\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:3:\\"3_9\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}s:4:\\"4_12\\";a:7:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"5\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:2:\\"10\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:2:\\"10\\";s:9:\\"is_upload\\";s:1:\\"1\\";}}'),
('pay', 'a:2:{s:3:\\"use\\";a:3:{i:0;s:9:\\"chinabank\\";i:1;s:6:\\"alipay\\";i:2;s:6:\\"weixin\\";}s:5:\\"order\\";a:3:{s:6:\\"alipay\\";s:1:\\"0\\";s:6:\\"weixin\\";s:1:\\"2\\";s:9:\\"chinabank\\";s:1:\\"3\\";}}'),
('space', 'a:14:{s:6:\\"domain\\";s:0:\\"\\";s:5:\\"theme\\";s:4:\\"home\\";s:8:\\"template\\";s:7:\\"default\\";s:7:\\"urlrule\\";s:1:\\"0\\";s:8:\\"category\\";s:1:\\"1\\";s:5:\\"title\\";s:0:\\"\\";s:8:\\"keywords\\";s:0:\\"\\";s:11:\\"description\\";s:0:\\"\\";s:4:\\"flag\\";a:9:{i:1;a:1:{s:4:\\"name\\";s:12:\\"达人空间\\";}i:2;a:1:{s:4:\\"name\\";s:12:\\"推荐空间\\";}i:3;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:4;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:5;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:6;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:7;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:8;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:9;a:1:{s:4:\\"name\\";s:0:\\"\\";}}s:11:\\"spacedomain\\";s:0:\\"\\";s:11:\\"notindomain\\";s:0:\\"\\";s:13:\\"sns_post_time\\";s:0:\\"\\";s:12:\\"sns_post_num\\";s:0:\\"\\";s:4:\\"open\\";i:0;}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_module`
--

CREATE TABLE IF NOT EXISTS `rs_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是扩展模块',
  `sitemap` tinyint(1) unsigned DEFAULT NULL COMMENT '是否生成地图',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模块表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `rs_module`
--

INSERT INTO `rs_module` (`id`, `site`, `dirname`, `share`, `extend`, `sitemap`, `setting`, `disabled`, `displayorder`) VALUES
(1, 'a:2:{i:1;a:9:{s:5:\\"theme\\";s:7:\\"default\\";s:8:\\"template\\";s:7:\\"default\\";s:4:\\"html\\";s:1:\\"0\\";s:7:\\"urlrule\\";s:1:\\"3\\";s:6:\\"domain\\";s:0:\\"\\";s:12:\\"module_title\\";s:0:\\"\\";s:15:\\"module_keywords\\";s:0:\\"\\";s:18:\\"module_description\\";s:0:\\"\\";s:3:\\"use\\";i:1;}i:2;a:5:{s:3:\\"use\\";i:1;s:4:\\"html\\";i:0;s:5:\\"theme\\";s:7:\\"default\\";s:6:\\"domain\\";s:0:\\"\\";s:8:\\"template\\";s:2:\\"en\\";}}', 'news', 0, 0, 1, 'a:6:{s:8:\\"pcatpost\\";s:1:\\"1\\";s:5:\\"order\\";s:33:\\"displayorder DESC,updatetime DESC\\";s:4:\\"flag\\";a:9:{i:1;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:2;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:3;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:4;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:5;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:6;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:7;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:8;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:9;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}}s:6:\\"search\\";a:4:{s:5:\\"close\\";s:1:\\"0\\";s:5:\\"field\\";s:14:\\"title,keywords\\";s:5:\\"total\\";s:3:\\"500\\";s:6:\\"length\\";s:1:\\"1\\";}s:9:\\"syn2field\\";s:0:\\"\\";s:6:\\"config\\";a:0:{}}', 0, 0),
(7, 'a:2:{i:1;a:8:{s:8:\\"template\\";s:7:\\"default\\";s:4:\\"html\\";s:1:\\"0\\";s:7:\\"urlrule\\";s:1:\\"3\\";s:6:\\"domain\\";s:0:\\"\\";s:12:\\"module_title\\";s:0:\\"\\";s:15:\\"module_keywords\\";s:0:\\"\\";s:18:\\"module_description\\";s:0:\\"\\";s:3:\\"use\\";i:1;}i:2;a:9:{s:5:\\"theme\\";s:7:\\"default\\";s:8:\\"template\\";s:7:\\"default\\";s:4:\\"html\\";s:1:\\"0\\";s:7:\\"urlrule\\";s:1:\\"3\\";s:6:\\"domain\\";s:0:\\"\\";s:12:\\"module_title\\";s:0:\\"\\";s:15:\\"module_keywords\\";s:0:\\"\\";s:18:\\"module_description\\";s:0:\\"\\";s:3:\\"use\\";i:1;}}', 'order', 0, 0, 1, 'a:1:{i:1;a:4:{s:6:\\"config\\";a:8:{s:2:\\"sn\\";s:2:\\"RS\\";s:5:\\"otime\\";s:0:\\"\\";s:5:\\"close\\";s:0:\\"\\";s:10:\\"cart_title\\";s:0:\\"\\";s:11:\\"order_title\\";s:0:\\"\\";s:9:\\"buy_title\\";s:0:\\"\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}s:6:\\"module\\";a:8:{s:4:\\"news\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}s:4:\\"shop\\";a:6:{s:3:\\"use\\";s:1:\\"1\\";s:6:\\"volume\\";s:1:\\"1\\";s:8:\\"quantity\\";s:1:\\"1\\";s:8:\\"shipping\\";s:1:\\"1\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"1\\";}s:3:\\"job\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}s:6:\\"qiuzhi\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}s:5:\\"links\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}s:6:\\"answer\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}s:7:\\"account\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}s:5:\\"video\\";a:6:{s:3:\\"use\\";s:1:\\"0\\";s:6:\\"volume\\";s:1:\\"0\\";s:8:\\"quantity\\";s:1:\\"0\\";s:8:\\"shipping\\";s:1:\\"0\\";s:3:\\"pay\\";s:1:\\"0\\";s:8:\\"k_volume\\";s:1:\\"0\\";}}s:10:\\"permission\\";a:1:{s:3:\\"buy\\";a:1:{s:3:\\"use\\";a:2:{i:0;s:1:\\"3\\";i:1;s:1:\\"4\\";}}}s:7:\\"paytype\\";a:3:{i:1;a:2:{s:2:\\"id\\";s:1:\\"1\\";s:4:\\"name\\";s:12:\\"货到付款\\";}i:2;a:3:{s:2:\\"id\\";s:1:\\"2\\";s:4:\\"name\\";s:12:\\"在线支付\\";s:3:\\"use\\";s:1:\\"2\\";}i:3;a:3:{s:2:\\"id\\";s:1:\\"3\\";s:4:\\"name\\";s:12:\\"银行转账\\";s:4:\\"text\\";s:0:\\"\\";}}}}', 0, 0),
(6, 'a:2:{i:1;a:9:{s:5:\\"theme\\";s:7:\\"default\\";s:8:\\"template\\";s:2:\\"cn\\";s:4:\\"html\\";s:1:\\"0\\";s:7:\\"urlrule\\";s:1:\\"3\\";s:6:\\"domain\\";s:0:\\"\\";s:12:\\"module_title\\";s:0:\\"\\";s:15:\\"module_keywords\\";s:0:\\"\\";s:18:\\"module_description\\";s:0:\\"\\";s:3:\\"use\\";i:1;}i:2;a:9:{s:5:\\"theme\\";s:7:\\"default\\";s:8:\\"template\\";s:2:\\"en\\";s:4:\\"html\\";i:0;s:7:\\"urlrule\\";s:1:\\"3\\";s:6:\\"domain\\";s:0:\\"\\";s:12:\\"module_title\\";s:8:\\"A&T Mall\\";s:15:\\"module_keywords\\";s:0:\\"\\";s:18:\\"module_description\\";s:0:\\"\\";s:3:\\"use\\";i:1;}}', 'shop', 0, 0, 1, 'a:5:{s:5:\\"order\\";s:33:\\"displayorder DESC,updatetime DESC\\";s:4:\\"flag\\";a:9:{i:1;a:13:{s:4:\\"name\\";s:12:\\"热门商品\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:2;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:3;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:4;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:5;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:6;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:7;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:8;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:9;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}}s:6:\\"search\\";a:4:{s:5:\\"close\\";s:1:\\"0\\";s:5:\\"field\\";s:14:\\"title,keywords\\";s:5:\\"total\\";s:3:\\"500\\";s:6:\\"length\\";s:1:\\"1\\";}s:9:\\"syn2field\\";s:0:\\"\\";s:6:\\"config\\";a:0:{}}', 0, 0),
(12, 'a:2:{i:1;a:8:{s:8:\\"template\\";s:7:\\"default\\";s:4:\\"html\\";s:1:\\"0\\";s:7:\\"urlrule\\";s:1:\\"3\\";s:6:\\"domain\\";s:0:\\"\\";s:12:\\"module_title\\";s:0:\\"\\";s:15:\\"module_keywords\\";s:0:\\"\\";s:18:\\"module_description\\";s:0:\\"\\";s:3:\\"use\\";i:1;}i:2;a:5:{s:3:\\"use\\";i:1;s:4:\\"html\\";i:0;s:5:\\"theme\\";s:7:\\"default\\";s:6:\\"domain\\";s:0:\\"\\";s:8:\\"template\\";s:2:\\"en\\";}}', 'answer', 0, 0, 1, 'a:6:{s:8:\\"pcatpost\\";s:1:\\"1\\";s:5:\\"order\\";s:33:\\"displayorder DESC,updatetime DESC\\";s:4:\\"flag\\";a:9:{i:1;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:2;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:3;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:4;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:5;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:6;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:7;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:8;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}i:9;a:13:{s:4:\\"name\\";s:0:\\"\\";s:3:\\"3_1\\";s:1:\\"0\\";s:3:\\"3_2\\";s:1:\\"0\\";s:3:\\"3_3\\";s:1:\\"0\\";s:3:\\"3_4\\";s:1:\\"0\\";s:3:\\"3_9\\";s:1:\\"0\\";s:4:\\"3_10\\";s:1:\\"0\\";s:3:\\"4_5\\";s:1:\\"0\\";s:4:\\"4_11\\";s:1:\\"0\\";s:3:\\"4_6\\";s:1:\\"0\\";s:3:\\"4_7\\";s:1:\\"0\\";s:4:\\"4_12\\";s:1:\\"0\\";s:3:\\"4_8\\";s:1:\\"0\\";}}s:6:\\"search\\";a:4:{s:5:\\"close\\";s:1:\\"0\\";s:5:\\"field\\";s:14:\\"title,keywords\\";s:5:\\"total\\";s:3:\\"500\\";s:6:\\"length\\";s:1:\\"1\\";}s:9:\\"syn2field\\";s:0:\\"\\";s:6:\\"config\\";a:0:{}}', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rs_module_form`
--

CREATE TABLE IF NOT EXISTS `rs_module_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL COMMENT '模块目录',
  `name` varchar(50) NOT NULL COMMENT '表单名称',
  `table` varchar(50) NOT NULL COMMENT '表单表名称',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  `permission` text NOT NULL COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '表单配置',
  PRIMARY KEY (`id`),
  KEY `table` (`table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模块表单表' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `rs_site`
--

CREATE TABLE IF NOT EXISTS `rs_site` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='站点表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `rs_site`
--

INSERT INTO `rs_site` (`id`, `name`, `domain`, `setting`) VALUES
(1, '福建省联标国际发展有限公司', 'demo.hf872.com', 'a:16:{s:10:\\"SITE_CLOSE\\";s:1:\\"0\\";s:14:\\"SITE_CLOSE_MSG\\";s:19:\\"网站升级中....\\";s:9:\\"SITE_NAME\\";s:39:\\"福建省联标国际发展有限公司\\";s:16:\\"SITE_TIME_FORMAT\\";s:0:\\"\\";s:13:\\"SITE_LANGUAGE\\";s:5:\\"zh-cn\\";s:10:\\"SITE_THEME\\";s:7:\\"default\\";s:13:\\"SITE_TEMPLATE\\";s:2:\\"cn\\";s:13:\\"SITE_TIMEZONE\\";s:1:\\"8\\";s:12:\\"SITE_SEOJOIN\\";s:1:\\"_\\";s:10:\\"SITE_TITLE\\";s:39:\\"福建省联标国际发展有限公司\\";s:13:\\"SITE_KEYWORDS\\";s:0:\\"\\";s:16:\\"SITE_DESCRIPTION\\";s:0:\\"\\";s:11:\\"SITE_DOMAIN\\";N;s:12:\\"SITE_DOMAINS\\";s:0:\\"\\";s:14:\\"SITE_NAVIGATOR\\";s:9:\\",,,,,,,,,\\";s:18:\\"SITE_IMAGE_CONTENT\\";i:0;}'),
(2, 'A&T INTERNATIONAL', 'en.hf872.com', 'a:16:{s:10:\\"SITE_CLOSE\\";s:1:\\"0\\";s:14:\\"SITE_CLOSE_MSG\\";s:19:\\"网站升级中....\\";s:9:\\"SITE_NAME\\";s:17:\\"A&T INTERNATIONAL\\";s:16:\\"SITE_TIME_FORMAT\\";s:0:\\"\\";s:13:\\"SITE_LANGUAGE\\";s:5:\\"zh-cn\\";s:10:\\"SITE_THEME\\";s:7:\\"default\\";s:13:\\"SITE_TEMPLATE\\";s:2:\\"en\\";s:13:\\"SITE_TIMEZONE\\";s:1:\\"8\\";s:12:\\"SITE_SEOJOIN\\";s:1:\\"_\\";s:10:\\"SITE_TITLE\\";s:0:\\"\\";s:13:\\"SITE_KEYWORDS\\";s:0:\\"\\";s:16:\\"SITE_DESCRIPTION\\";s:0:\\"\\";s:11:\\"SITE_DOMAIN\\";N;s:12:\\"SITE_DOMAINS\\";s:0:\\"\\";s:14:\\"SITE_NAVIGATOR\\";s:9:\\",,,,,,,,,\\";s:18:\\"SITE_IMAGE_CONTENT\\";i:0;}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_urlrule`
--

CREATE TABLE IF NOT EXISTS `rs_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='URL规则表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `rs_urlrule`
--

INSERT INTO `rs_urlrule` (`id`, `type`, `name`, `value`) VALUES
(1, 0, '单页测试规则', 'a:52:{s:4:\\"page\\";s:14:\\"page-{id}.html\\";s:9:\\"page_page\\";s:21:\\"page-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(2, 0, '单页测试规则（用于模块）', 'a:52:{s:4:\\"page\\";s:21:\\"module-page-{id}.html\\";s:9:\\"page_page\\";s:28:\\"module-page-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(3, 1, '独立模块默认规则', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:14:\\"{modname}.html\\";s:4:\\"list\\";s:29:\\"{modname}-list-{dirname}.html\\";s:9:\\"list_page\\";s:36:\\"{modname}-list-{dirname}-{page}.html\\";s:4:\\"show\\";s:24:\\"{modname}-show-{id}.html\\";s:9:\\"show_page\\";s:31:\\"{modname}-show-{id}-{page}.html\\";s:6:\\"extend\\";s:24:\\"{modname}-read-{id}.html\\";s:11:\\"extend_page\\";s:31:\\"{modname}-read-{id}-{page}.html\\";s:3:\\"tag\\";s:24:\\"{modname}-tag-{tag}.html\\";s:8:\\"tag_page\\";s:31:\\"{modname}-tag-{tag}-{page}.html\\";s:6:\\"search\\";s:21:\\"{modname}/search.html\\";s:11:\\"search_page\\";s:29:\\"{modname}/search-{param}.html\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(4, 2, '共享模块测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:24:\\"{modname}-tag-{tag}.html\\";s:14:\\"share_tag_page\\";s:31:\\"{modname}-tag-{tag}-{page}.html\\";s:12:\\"share_search\\";s:21:\\"{modname}/search.html\\";s:17:\\"share_search_page\\";s:29:\\"{modname}/search/{param}.html\\";s:10:\\"share_list\\";s:10:\\"{dirname}/\\";s:15:\\"share_list_page\\";s:26:\\"{dirname}/page/{page}.html\\";s:10:\\"share_show\\";s:24:\\"{dirname}/show/{id}.html\\";s:15:\\"share_show_page\\";s:36:\\"{dirname}/show/{id}/page/{page}.html\\";s:12:\\"share_extend\\";s:24:\\"{dirname}/read/{id}.html\\";s:17:\\"share_extend_page\\";s:36:\\"{dirname}/read/{id}/page/{page}.html\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(5, 3, '共享栏目规则测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:24:\\"html/{dirname}-list.html\\";s:15:\\"share_list_page\\";s:31:\\"html/{dirname}-list-{page}.html\\";s:10:\\"share_show\\";s:29:\\"html/{dirname}-show-{id}.html\\";s:15:\\"share_show_page\\";s:36:\\"html/{dirname}-show-{id}-{page}.html\\";s:12:\\"share_extend\\";s:31:\\"html/{dirname}-extend-{id}.html\\";s:17:\\"share_extend_page\\";s:38:\\"html/{dirname}-extend-{id}-{page}.html\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(6, 4, '站点URL测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:11:\\"search.html\\";s:17:\\"share_search_page\\";s:19:\\"search/{param}.html\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:7:\\"so.html\\";s:14:\\"so_search_page\\";s:15:\\"so-{param}.html\\";s:7:\\"sitemap\\";s:12:\\"sitemap.html\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(7, 5, '空间黄页测试地址', 'a:50:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:7:\\"hy.html\\";s:12:\\"space_search\\";s:14:\\"hy-search.html\\";s:17:\\"space_search_page\\";s:22:\\"hy-search-{param}.html\\";s:5:\\"uhome\\";s:12:\\"u-{uid}.html\\";s:5:\\"ulist\\";s:22:\\"u-{uid}-list-{id}.html\\";s:10:\\"ulist_page\\";s:29:\\"u-{uid}-list-{id}-{page}.html\\";s:5:\\"ushow\\";s:28:\\"u-{uid}-show-{mid}-{id}.html\\";s:10:\\"ushow_page\\";s:35:\\"u-{uid}-show-{mid}-{id}-{page}.html\\";s:8:\\"sns_show\\";s:26:\\"u-{uid}-sns-show-{id}.html\\";s:9:\\"sns_topic\\";s:27:\\"u-{uid}-sns-topic-{id}.html\\";s:14:\\"sns_topic_page\\";s:34:\\"u-{uid}-sns-topic-{id}-{page}.html\\";s:3:\\"sns\\";s:23:\\"u-{uid}-sns-{name}.html\\";s:8:\\"sns_page\\";s:30:\\"u-{uid}-sns-{name}-{page}.html\\";s:12:\\"ulist_domain\\";s:16:\\"u-list-{id}.html\\";s:17:\\"ulist_domain_page\\";s:23:\\"u-list-{id}-{page}.html\\";s:12:\\"ushow_domain\\";s:22:\\"u-show-{mid}-{id}.html\\";s:17:\\"ushow_domain_page\\";s:29:\\"u-show-{mid}-{id}-{page}.html\\";s:15:\\"sns_show_domain\\";s:20:\\"u-sns-show-{id}.html\\";s:16:\\"sns_topic_domain\\";s:21:\\"u-sns-topic-{id}.html\\";s:21:\\"sns_topic_domain_page\\";s:28:\\"u-sns-topic-{id}-{page}.html\\";s:10:\\"sns_domain\\";s:22:\\"u-sns-{name}-{id}.html\\";s:15:\\"sns_domain_page\\";s:29:\\"u-sns-{name}-{id}-{page}.html\\";s:6:\\"member\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}'),
(8, 6, '会员部分测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:11:\\"member.html\\";s:10:\\"member_reg\\";s:13:\\"register.html\\";s:12:\\"member_login\\";s:10:\\"login.html\\";s:7:\\"catjoin\\";s:0:\\"\\";}'),
(9, 0, '关于我们', 'a:52:{s:4:\\"page\\";s:15:\\"about-{id}.html\\";s:9:\\"page_page\\";s:22:\\"about-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:13:\\"register.html\\";s:12:\\"member_login\\";s:10:\\"login.html\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');

-- --------------------------------------------------------

--
-- 表的结构 `rs_var`
--

CREATE TABLE IF NOT EXISTS `rs_var` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(100) NOT NULL COMMENT '变量描述名称',
  `cname` varchar(100) NOT NULL COMMENT '变量名称',
  `type` tinyint(2) NOT NULL COMMENT '变量类型',
  `value` text NOT NULL COMMENT '变量值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义变量表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

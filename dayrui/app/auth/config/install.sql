CREATE TABLE IF NOT EXISTS `{dbprefix}member_auth` (
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
  `note` text DEFAULT NULL COMMENT '处理备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '处理状态',
  PRIMARY KEY (`uid`),
  KEY (`username`),
  KEY (`inputtime`),
  KEY (`euid`),
  KEY (`editor`),
  KEY (`edittime`),
  KEY (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员实名认证管理';

INSERT INTO `{dbprefix}field` VALUES(null, '认证类型', 'auth_type', 'Radio', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\\"option\\";a:4:{s:7:\\"options\\";s:17:\\"个人|0\n企业|1\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"TINYINT\\";s:11:\\"fieldlength\\";s:1:\\"1\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:34:\\" onChange=\\"dr_my_auth(this.value)\\"\\";}}', 0);
INSERT INTO `{dbprefix}field` VALUES(null, '认证名称', 'auth_name', 'Text', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:5:\\"value\\";s:6:\\"{name}\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"100\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0);
INSERT INTO `{dbprefix}field` VALUES(null, '证件号码', 'auth_sn', 'Text', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"300\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:5:\\"value\\";s:0:\\"\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"100\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0);
INSERT INTO `{dbprefix}field` VALUES(null, '证件图片', 'auth_image', 'File', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\"option\";a:3:{s:4:\"size\";s:2:\"10\";s:3:\"ext\";s:11:\"jpg,gif,png\";s:10:\"uploadpath\";s:0:\"\";}s:8:\"validate\";a:9:{s:8:\"required\";s:1:\"1\";s:7:\"pattern\";s:0:\"\";s:9:\"errortips\";s:0:\"\";s:6:\"isedit\";s:1:\"0\";s:3:\"xss\";s:1:\"0\";s:5:\"check\";s:0:\"\";s:6:\"filter\";s:0:\"\";s:4:\"tips\";s:0:\"\";s:8:\"formattr\";s:0:\"\";}}', 0);
INSERT INTO `{dbprefix}field` VALUES(null, '手机号码', 'auth_phone', 'Text', 0, 'table-member_auth', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:\\"option\\";a:5:{s:5:\\"width\\";s:3:\\"200\\";s:5:\\"ispwd\\";s:1:\\"0\\";s:5:\\"value\\";s:7:\\"{phone}\\";s:9:\\"fieldtype\\";s:7:\\"VARCHAR\\";s:11:\\"fieldlength\\";s:3:\\"100\\";}s:8:\\"validate\\";a:9:{s:8:\\"required\\";s:1:\\"1\\";s:7:\\"pattern\\";s:0:\\"\\";s:9:\\"errortips\\";s:0:\\"\\";s:6:\\"isedit\\";s:1:\\"0\\";s:3:\\"xss\\";s:1:\\"0\\";s:5:\\"check\\";s:0:\\"\\";s:6:\\"filter\\";s:0:\\"\\";s:4:\\"tips\\";s:0:\\"\\";s:8:\\"formattr\\";s:0:\\"\\";}}', 0);

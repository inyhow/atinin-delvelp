
CREATE TABLE IF NOT EXISTS `{tablename}` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息表';

CREATE TABLE IF NOT EXISTS `{tablename}_data_0` (
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


CREATE TABLE IF NOT EXISTS `{tablename}_buy` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购买记录表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_0` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_1` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_2` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_3` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_4` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_5` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_6` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_7` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

CREATE TABLE IF NOT EXISTS `{tablename}_cart_8` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';


CREATE TABLE IF NOT EXISTS `{tablename}_data_9` (
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

CREATE TABLE IF NOT EXISTS `{tablename}_goods` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表';

CREATE TABLE IF NOT EXISTS `{tablename}_operate` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单操作记录表';

CREATE TABLE IF NOT EXISTS `{tablename}_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` mediumint(8) unsigned NOT NULL COMMENT '订单id',
  `sn` varchar(255) NOT NULL COMMENT '订单流水号',
  `note` text DEFAULT NULL COMMENT '备注',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='转账受理表';


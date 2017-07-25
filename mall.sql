'CREATE TABLE IF NOT EXISTS `admin_config` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(150) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(2555) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_person` varchar(150) DEFAULT NULL,
  KEY `key` (`key`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `level` int(5) DEFAULT NULL,
  `parent_id` int(15) DEFAULT NULL,
  `url_key` varchar(255) DEFAULT NULL,
  `role_key` varchar(150) DEFAULT NULL COMMENT '权限key，也就是controller的路径，譬如/fecadmin/menu/managere,controller 是MenuController，当前的值为：/fecadmin/menu',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort_order` int(10) NOT NULL DEFAULT '0',
  `can_delete` int(5) DEFAULT '2' COMMENT '是否可以被删除，1代表不可以删除，2代表可以删除',
  KEY `url_key` (`url_key`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

CREATE TABLE IF NOT EXISTS `admin_role` (
  `role_id` int(15) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限名字',
  `role_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;


CREATE TABLE IF NOT EXISTS `admin_role_menu` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `menu_id` int(15) NOT NULL,
  `role_id` int(15) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `role_id` (`role_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=124 ;


CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password_hash` varchar(80) DEFAULT NULL COMMENT '密码',
  `password_reset_token` varchar(60) DEFAULT NULL COMMENT '密码token',
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `person` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `code` varchar(100) DEFAULT NULL,
  `auth_key` varchar(60) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '状态',
  `created_at` int(18) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(18) DEFAULT NULL COMMENT '更新时间',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `access_token` varchar(60) DEFAULT NULL,
  `allowance` int(20) DEFAULT NULL,
  `allowance_updated_at` int(20) DEFAULT NULL,
  `created_at_datetime` datetime DEFAULT NULL,
  `updated_at_datetime` datetime DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL COMMENT '出生日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `access_token` (`access_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


CREATE TABLE IF NOT EXISTS `admin_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `role_id` int(30) NOT NULL,
  KEY `user_id` (`user_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;


CREATE TABLE IF NOT EXISTS `admin_visit_log` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `account` varchar(25) DEFAULT NULL COMMENT '操作账号',
  `person` varchar(25) DEFAULT NULL COMMENT '操作人姓名',
  `created_at` datetime DEFAULT NULL COMMENT '操作时间',
  `menu` varchar(100) DEFAULT NULL COMMENT '菜单',
  `url` text COMMENT 'URL',
  `url_key` varchar(150) DEFAULT NULL COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `password_hash` varchar(80) DEFAULT NULL COMMENT '密码',
  `password_reset_token` varchar(60) DEFAULT NULL COMMENT '密码token',
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `is_subscribed` int(5) NOT NULL DEFAULT '2' COMMENT '1代表订阅，2代表不订阅邮件',
  `auth_key` varchar(60) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '状态',
  `created_at` int(18) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(18) DEFAULT NULL COMMENT '更新时间',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `access_token` varchar(60) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL COMMENT '出生日期',
  `favorite_product_count` int(15) NOT NULL DEFAULT '0' COMMENT '用户收藏的产品的总数',
  `type` varchar(35) DEFAULT 'default' COMMENT '默认为default，如果是第三方登录，譬如google账号登录注册，那么这里的值为google',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  UNIQUE KEY `access_token` (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `customer_address` (
  `address_id` int(15) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) DEFAULT NULL,
  `email` varchar(155) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `fax` varchar(150) DEFAULT NULL,
  `street1` text,
  `street2` varchar(255) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `customer_id` int(20) DEFAULT NULL,
  `created_at` int(20) DEFAULT NULL,
  `updated_at` int(20) DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '2' COMMENT '1代表是默认地址，2代表不是',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `url_rewrite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `custom_url_key` varchar(255) DEFAULT NULL COMMENT '自定义url key',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '原来的url ',
  KEY `custom_url_key` (`custom_url_key`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;




CREATE TABLE IF NOT EXISTS `static_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identify` varchar(100) DEFAULT NULL,
  `title` text,
  `status` int(5) DEFAULT NULL,
  `content` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_user_id` int(20) DEFAULT NULL,
  KEY `identify` (`identify`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ipn_message` (
  `ipn_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(20) DEFAULT NULL COMMENT 'transaction id',
  `payment_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `updated_at` int(15) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ipn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `sales_coupon` (
  `coupon_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` int(15) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(15) DEFAULT NULL COMMENT '更新时间',
  `created_person` int(15) NOT NULL COMMENT '创建人的id',
  `coupon_name` varchar(100) DEFAULT NULL COMMENT '优惠劵名称',
  `coupon_description` varchar(255) DEFAULT NULL COMMENT '优惠劵描述',
  `coupon_code` varchar(100) DEFAULT NULL COMMENT '优惠劵编号',
  `expiration_date` int(15) DEFAULT NULL COMMENT '过期时间',
  `users_per_customer` int(15) DEFAULT '0' COMMENT '优惠劵被每个客户使用的最大次数',
  `times_used` int(15) DEFAULT '0' COMMENT '优惠劵被使用了多少次',
  `type` int(5) DEFAULT NULL COMMENT '优惠劵的类型，1代表按照百分比对产品打折，2代表在总额上减少多少',
  `conditions` int(15) DEFAULT NULL COMMENT '优惠劵使用的条件，如果类型为1，则没有条件，如果类型是2，则购物车中产品总额满足多少的时候进行打折。这里填写的是美元金额',
  `discount` int(15) DEFAULT NULL COMMENT '优惠劵的折扣，如果类型为1，这里填写的是百分比，如果类型是2，这里代表的是在总额上减少的金额，货币为美金',
  PRIMARY KEY (`coupon_id`),
  KEY `coupon_code` (`coupon_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

CREATE TABLE IF NOT EXISTS `sales_coupon_usage` (
`id` int(15) NOT NULL AUTO_INCREMENT,
`coupon_id` int(25) DEFAULT '0' COMMENT '客户id',
`customer_id` int(25) DEFAULT '0' COMMENT '客户id',
`times_used` int(15) DEFAULT '0' COMMENT '使用次数',
PRIMARY KEY (`id`),
KEY `coupon_id` (`coupon_id`),
KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;


CREATE TABLE IF NOT EXISTS `sales_flat_cart` (
`cart_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
`store` varchar(100) DEFAULT NULL COMMENT 'store name',
`created_at` int(15) DEFAULT NULL COMMENT '创建时间',
`updated_at` int(15) DEFAULT NULL COMMENT '更新时间',
`items_count` int(10) DEFAULT '0' COMMENT '购物车中产品的总个数，默认为0个',
`customer_id` int(15) DEFAULT NULL COMMENT '客户id',
`customer_email` varchar(90) DEFAULT NULL COMMENT '客户邮箱',
`customer_firstname` varchar(50) DEFAULT NULL COMMENT '客户名字',
`customer_lastname` varchar(50) DEFAULT NULL COMMENT '客户名字',
`customer_is_guest` int(5) DEFAULT NULL COMMENT '是否是游客，1代表是游客，2代表不是游客',
`remote_ip` varchar(26) DEFAULT NULL COMMENT 'ip地址',
`coupon_code` varchar(20) DEFAULT NULL COMMENT '优惠劵',
`payment_method` varchar(20) DEFAULT NULL COMMENT '支付方式',
`shipping_method` varchar(20) DEFAULT NULL COMMENT '货运方式',
`customer_telephone` varchar(25) DEFAULT NULL COMMENT '客户电话',
`customer_address_id` int(20) DEFAULT NULL COMMENT '客户地址id',
`customer_address_country` varchar(50) DEFAULT NULL COMMENT '客户国家',
`customer_address_state` varchar(50) DEFAULT NULL COMMENT '客户省',
`customer_address_city` varchar(50) DEFAULT NULL COMMENT '客户市',
`customer_address_zip` varchar(20) DEFAULT NULL COMMENT '客户zip',
`customer_address_street1` text COMMENT '客户街道地址1',
`customer_address_street2` text COMMENT '客户街道地址2',
`app_name` varchar(20) DEFAULT NULL COMMENT '属于哪个app',
PRIMARY KEY (`cart_id`),
KEY `customer_id` (`customer_id`),
KEY `customer_email` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `sales_flat_cart_item` (
`item_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
`store` varchar(100) DEFAULT NULL COMMENT 'store name',
`cart_id` int(15) DEFAULT NULL,
`created_at` int(15) DEFAULT NULL COMMENT '创建时间',
`updated_at` int(15) DEFAULT NULL COMMENT '更新时间',
`product_id` varchar(100) DEFAULT NULL COMMENT '产品id',
`qty` int(10) DEFAULT NULL COMMENT '个数',
`custom_option_sku` varchar(50) DEFAULT NULL COMMENT '产品的自定义属性',
PRIMARY KEY (`item_id`),
KEY `quote_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;




CREATE TABLE IF NOT EXISTS `sales_flat_order` (
`order_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
`increment_id` varchar(25) DEFAULT NULL COMMENT '递增个数',
`order_status` text COMMENT '订单状态',
`store` varchar(100) DEFAULT NULL COMMENT 'store name',
`created_at` int(15) DEFAULT NULL COMMENT '创建时间',
`updated_at` int(15) DEFAULT NULL COMMENT '更新时间',
`items_count` int(10) DEFAULT '0' COMMENT '订单中产品的总个数，默认为0个',
`total_weight` decimal(12,4) DEFAULT '0.0000' COMMENT '总重量',
`order_currency_code` varchar(10) DEFAULT NULL COMMENT '当前货币',
`order_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT '当前货币和默认货币的比率',
`grand_total` decimal(12,4) DEFAULT NULL COMMENT '当前订单的总额',
`base_grand_total` decimal(12,4) DEFAULT NULL COMMENT '当前订单的默认货币总额',
`subtotal` decimal(12,4) DEFAULT NULL COMMENT '当前订单的产品总额',
`base_subtotal` decimal(12,4) DEFAULT NULL COMMENT '当前订单的产品默认货币总额',
`subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT '当前订单的去掉的总额',
`base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT '当前订单的去掉的默认货币总额',
`is_changed` int(5) DEFAULT '1' COMMENT '是否change，1代表是，2代表否',
`checkout_method` varchar(20) DEFAULT NULL COMMENT 'guest，register，代表是游客还是登录客户。',
`customer_id` int(15) DEFAULT NULL COMMENT '客户id',
`customer_group` varchar(20) DEFAULT NULL COMMENT '客户组id',
`customer_email` varchar(90) DEFAULT NULL COMMENT '客户邮箱',
`customer_firstname` varchar(50) DEFAULT NULL COMMENT '客户名字',
`customer_lastname` varchar(50) DEFAULT NULL COMMENT '客户名字',
`customer_is_guest` int(5) DEFAULT NULL COMMENT '是否是游客，1代表是游客，2代表不是游客',
`remote_ip` varchar(26) DEFAULT NULL COMMENT 'ip地址',
`coupon_code` varchar(20) DEFAULT NULL COMMENT '优惠劵',
`payment_method` varchar(20) DEFAULT NULL COMMENT '支付方式',
`shipping_method` varchar(20) DEFAULT NULL COMMENT '货运方式',
`shipping_total` decimal(12,4) DEFAULT NULL COMMENT '运费总额',
`base_shipping_total` decimal(12,4) DEFAULT NULL COMMENT '默认货币运费总额',
`customer_telephone` varchar(25) DEFAULT NULL COMMENT '客户电话',
`customer_address_country` varchar(50) DEFAULT NULL COMMENT '客户国家',
`customer_address_state` varchar(50) DEFAULT NULL COMMENT '客户省',
`customer_address_city` varchar(50) DEFAULT NULL COMMENT '客户市',
`customer_address_zip` varchar(20) DEFAULT NULL COMMENT '客户zip',
`customer_address_street1` text COMMENT '客户地址1',
`customer_address_street2` text COMMENT '客户地址2',
`txn_type` varchar(20) DEFAULT NULL COMMENT 'translate类型',
`txn_id` varchar(30) DEFAULT NULL COMMENT 'translate id',
`payer_id` varchar(30) DEFAULT NULL COMMENT '交易号',
`ipn_track_id` varchar(20) DEFAULT NULL,
`receiver_id` varchar(20) DEFAULT NULL,
`verify_sign` varchar(80) DEFAULT NULL,
`charset` varchar(20) DEFAULT NULL,
`payment_fee` decimal(12,4) DEFAULT NULL COMMENT '交易服务费',
`payment_type` varchar(20) DEFAULT NULL COMMENT '交易类型',
`correlation_id` varchar(20) DEFAULT NULL COMMENT '相关id，快捷支付里面的字段',
`base_payment_fee` decimal(12,4) DEFAULT NULL COMMENT '交易费用，基础货币值，通过货币进行的转换',
`protection_eligibility` varchar(20) DEFAULT NULL COMMENT '保护资格，快捷支付里面的字段',
`protection_eligibility_type` varchar(255) DEFAULT NULL COMMENT '保护资格类型，快捷支付里面的字段',
`secure_merchant_account_id` varchar(20) DEFAULT NULL COMMENT '商人账户安全id',
`build` varchar(20) DEFAULT NULL COMMENT 'build',
`paypal_order_datetime` datetime DEFAULT NULL COMMENT '订单创建，Paypal时间',
`theme_type` int(5) DEFAULT NULL COMMENT '1-pc,2-mobile',
`if_is_return_stock` int(5) NOT NULL DEFAULT '2' COMMENT '1,代表订单归还了库存，2代表订单没有归还库存，此状态作用：用来标示pending订单是否释放产品库存',
PRIMARY KEY (`order_id`),
KEY `customer_id` (`customer_id`),
KEY `increment_id` (`increment_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `sales_flat_order_item` (
`item_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
`store` varchar(100) DEFAULT NULL COMMENT 'store name',
`order_id` int(15) DEFAULT NULL COMMENT '产品对应的订单表id',
`created_at` int(16) DEFAULT NULL COMMENT '创建时间',
`updated_at` int(16) DEFAULT NULL COMMENT '更新时间',
`product_id` varchar(100) DEFAULT NULL COMMENT '产品id',
`sku` varchar(100) DEFAULT NULL,
`name` varchar(255) DEFAULT NULL,
`custom_option_sku` varchar(50) DEFAULT NULL COMMENT '自定义属性',
`image` varchar(255) DEFAULT NULL COMMENT '图片',
`weight` decimal(12,4) DEFAULT NULL COMMENT '重量',
`qty` int(10) DEFAULT NULL COMMENT '个数',
`row_weight` decimal(12,4) DEFAULT NULL COMMENT '一个产品重量*个数',
`price` decimal(12,4) DEFAULT NULL COMMENT '产品价格',
`base_price` decimal(12,4) DEFAULT NULL COMMENT '默认货币价格',
`row_total` decimal(12,4) DEFAULT NULL COMMENT '一个产品价格*个数',
`base_row_total` decimal(12,4) DEFAULT NULL COMMENT '一个产品默认货币价格*个数',
`redirect_url` varchar(200) DEFAULT NULL COMMENT '产品url',
PRIMARY KEY (`item_id`),
KEY `order_id` (`order_id`) COMMENT'主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `static_block` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`identify` varchar(100) DEFAULT NULL,
`title` text,
`status` int(5) DEFAULT NULL,
`content` text,
`created_at` int(11) DEFAULT NULL,
`updated_at` int(11) DEFAULT NULL,
`created_user_id` int(20) DEFAULT NULL,
KEY `identify` (`identify`),
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `url_rewrite` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`type` varchar(50) DEFAULT NULL COMMENT '类型',
`custom_url_key` varchar(255) DEFAULT NULL COMMENT '自定义url key',
`origin_url` varchar(255) DEFAULT NULL COMMENT '原来的url ',
KEY `custom_url_key` (`custom_url_key`),
PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;



CREATE TABLE IF NOT EXISTS `product_flat_qty` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`product_id` VARCHAR( 50 ) NOT NULL COMMENT '产品表的id',
`qty` INT( 20 ) NOT NULL COMMENT '产品表的个数',
PRIMARY KEY (`id`)
) ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `product_custom_option_qty` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`product_id` VARCHAR( 50 ) NOT NULL COMMENT '产品id',
`custom_option_sku` VARCHAR( 50 ) NOT NULL COMMENT '产品自定义属性sku',
`qty` INT( 20 ) NOT NULL COMMENT '产品个数。',
PRIMARY KEY (`id`)
) ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `session_storage` (
`id` INT( 20 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`uuid` VARCHAR( 200 ) NULL COMMENT '用户唯一标示',
`key` VARCHAR( 200 ) NULL COMMENT 'session key',
`value` TEXT NULL COMMENT 'session value',
`timeout` INT( 20 ) NULL COMMENT '超时时间，秒',
`updated_at` INT( 20 ) NULL COMMENT '创建时间'
) ENGINE = InnoDB;

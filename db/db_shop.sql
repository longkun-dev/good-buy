DROP DATABASE if exists db_shop;

CREATE DATABASE db_shop;

# 商品信息表
CREATE TABLE `db_shop`.`t_product_info`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `product_id` varchar(32) NOT NULL COMMENT '商品id',
    `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
    `product_desc` varchar(255) NOT NULL DEFAULT ''  COMMENT '商品描述',
    `order` varchar(32) NOT NULL DEFAULT '' COMMENT '商品采购批次',
    `price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '商品售价',
    `on_sale` tinyint(1) NOT NULL DEFAULT 0 COMMENT '在售',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品信息表';


# 商品类别表
CREATE TABLE `db_shop`.`t_product_category`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `category_id` varchar(32) NOT NULL COMMENT '类别id',
    `category_name` varchar(255) NOT NULL COMMENT '类别名称',
    `category_type` varchar(32) NOT NULL COMMENT '大中小区分',
    `category_desc` varchar(255) NOT NULL  COMMENT '类别描述',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`category_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品类别表';


# 商品库存表
CREATE TABLE `db_shop`.`t_product_inventory`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `product_id` varchar(32) NOT NULL COMMENT '商品id',
    `product_name` varchar(255) NOT NULL COMMENT '商品名称',
    `count` int(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
    `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `validation` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有效标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '商品库存表';


# 订单主表
CREATE TABLE `db_shop`.`t_order_master`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `order_id` varchar(32) NOT NULL COMMENT '订单id',
    `date` datetime NOT NULL COMMENT '下单时间',
    `amount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总价',
    `vip_no` varchar(32) NOT NULL DEFAULT '' COMMENT '会员卡号',
    `pay_by` varchar(32) NOT NULL DEFAULT '' COMMENT '支付方式',
    `pay_status` varchar(32) NOT NULL DEFAULT '0' COMMENT '支付状态',
    `order_status` varchar(32) NOT NULL DEFAULT '0' COMMENT '订单状态',
    `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`order_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '订单主表';


# 订单详情表
CREATE TABLE `db_shop`.`t_order_detail`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `detail_id` varchar(32) NOT NULL COMMENT '订单详情id',
    `order_id` varchar(32) NOT NULL COMMENT '主订单id',
    `product_id` varchar(32) NOT NULL COMMENT '商品id',
    `product_name` varchar(255) NOT NULL COMMENT '商品名称',
    `count` int(11) NOT NULL DEFAULT 0 COMMENT '商品数量',
    `remark` varchar(255) NOT NULL COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`detail_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '订单详情表';


# 退换货记录表
CREATE TABLE `db_shop`.`t_after_sale`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `order_id` varchar(32) NOT NULL COMMENT '订单id',
    `date` datetime NOT NULL COMMENT '退换时间',
    `type` varchar(32) NOT NULL DEFAULT '0' COMMENT '退换类别',
    `status` varchar(32) NOT NULL DEFAULT '0' COMMENT '状态',
    `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`order_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '退换货记录表';


# 采购记录表
CREATE TABLE `db_shop`.`t_product_purchase`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `purchase_id` varchar(32) NOT NULL COMMENT '采购记录id',
    `product_id` varchar(32) NOT NULL COMMENT '商品id',
    `product_name` varchar(255) NOT NULL COMMENT '商品名称',
    `count` int(11) NOT NULL DEFAULT 0 COMMENT '采购数量',
    `date` date NOT NULL COMMENT '采购日期',
    `producer` varchar(255) NOT NULL DEFAULT '' COMMENT '生产厂商',
    `price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '采购价格',
    `order` varchar(32) NOT NULL DEFAULT '' COMMENT '采购批次',
    `remark` varchar(255) NOT NULL COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`purchase_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '采购记录表';


# 系统用户表
CREATE TABLE `db_shop`.`t_system_user`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `user_id` varchar(32) NOT NULL COMMENT '系统用户',
    `password` varchar(32) NOT NULL COMMENT '登录密码',
    `role` varchar(32) NOT NULL COMMENT '用户角色',
    `remark` varchar(255) NOT NULL COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统用户表';


# 系统角色表
CREATE TABLE `db_shop`.`t_system_role`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `role_code` varchar(32) NOT NULL COMMENT '角色编码',
    `role_name` varchar(32) NOT NULL COMMENT '角色名称',
    `remark` varchar(255) NOT NULL COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`role_code`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统角色表';


# 会员信息表
CREATE TABLE `db_shop`.`t_vip_info`(
    `id` varchar(32) NOT NULL COMMENT '主键id',
    `vip_no` varchar(32) NOT NULL COMMENT 'vip号码',
    `username` varchar(32) NOT NULL COMMENT '用户名',
    `register_date` date NOT NULL COMMENT '注册日期',
    `level` varchar(32) NOT NULL DEFAULT '0' COMMENT '用户等级',
    `point` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
    `remark` varchar(255) NOT NULL COMMENT '备注',
    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标志',
    `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    UNIQUE KEY(`vip_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '会员信息表';

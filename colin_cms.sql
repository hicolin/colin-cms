/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.5.53 : Database - colin_cms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `colin_login_log` */

DROP TABLE IF EXISTS `colin_login_log`;

CREATE TABLE `colin_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '登陆日志',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(100) DEFAULT NULL COMMENT '位置',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_member` */

DROP TABLE IF EXISTS `colin_member`;

CREATE TABLE `colin_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '前台用户表',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `tel` varchar(15) DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1:启用 2:禁用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_menu` */

DROP TABLE IF EXISTS `colin_menu`;

CREATE TABLE `colin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单表',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示 1:显示 2:隐藏',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_operate_log` */

DROP TABLE IF EXISTS `colin_operate_log`;

CREATE TABLE `colin_operate_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '操作日志表',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `route_name` varchar(100) DEFAULT NULL COMMENT '路由名',
  `route` varchar(100) DEFAULT NULL COMMENT '路由',
  `param` text COMMENT '参数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_role` */

DROP TABLE IF EXISTS `colin_role`;

CREATE TABLE `colin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色表',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `permission` varchar(500) DEFAULT NULL COMMENT '权限',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_route` */

DROP TABLE IF EXISTS `colin_route`;

CREATE TABLE `colin_route` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '路由表',
  `submenu_id` int(11) DEFAULT NULL COMMENT '子菜单id',
  `route_name` varchar(100) DEFAULT NULL COMMENT '路由名',
  `route` varchar(100) DEFAULT NULL COMMENT '路由',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1:启用 2:禁用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_set` */

DROP TABLE IF EXISTS `colin_set`;

CREATE TABLE `colin_set` (
  `id` int(31) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统设置表',
  `key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '键',
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '值',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1:文本 2:图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `colin_submenu` */

DROP TABLE IF EXISTS `colin_submenu`;

CREATE TABLE `colin_submenu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '子菜单表',
  `menu_id` int(11) DEFAULT NULL COMMENT '主菜单id',
  `route_name` varchar(100) DEFAULT NULL COMMENT '路由名',
  `route` varchar(100) DEFAULT NULL COMMENT '路由',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示 1:显示 2:隐藏',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `colin_user` */

DROP TABLE IF EXISTS `colin_user`;

CREATE TABLE `colin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台用户表',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1:启用 2:禁用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

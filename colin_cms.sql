/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.53 : Database - colin_cms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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

/*Data for the table `colin_member` */

insert  into `colin_member`(`id`,`nickname`,`tel`,`password`,`email`,`status`,`create_time`) values (1,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(2,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),(3,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(4,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(5,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),(26,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(27,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(28,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),(29,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(30,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(31,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(32,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(33,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(34,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(35,'张三','17300000000',NULL,'123456@qq.com',2,1521768073),(36,'张三','17300000000',NULL,'123456@qq.com',2,1521768073),(37,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(38,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(39,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(40,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(41,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(42,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(43,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(44,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(45,'Colin','17312341234',NULL,'123456@qq.com',2,1521768073),(56,'李四2','17812341234','$2y$13$FkGSqk0aX2QSsscvQhQm5.XnGK9EkL8vJb3Z1Niez2MStWcQkeAUW','lisi@qq.com',1,1552446687),(57,'TEST','17352902344','$2y$13$s5Na35XAgm3Odq0QzT0uteLFPSWCgJ8PLE95sh1hP/q5JnvhOZWK2','123@qq.com',2,1552446738);

/*Table structure for table `colin_menu` */

DROP TABLE IF EXISTS `colin_menu`;

CREATE TABLE `colin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单表',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示 1:显示 2:隐藏',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `colin_menu` */

insert  into `colin_menu`(`id`,`name`,`icon`,`is_show`,`sort`,`create_time`) values (1,'会员管理','&#xe6b8;',1,10,1521768073),(2,'管理员管理','&#xe726;',1,10,1521768073);

/*Table structure for table `colin_role` */

DROP TABLE IF EXISTS `colin_role`;

CREATE TABLE `colin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色表',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `permission` varchar(500) DEFAULT NULL COMMENT '权限',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `colin_role` */

insert  into `colin_role`(`id`,`name`,`description`,`permission`,`create_time`) values (1,'超级管理员','拥有所有权限',NULL,1521768073),(4,'测试','测试人员权限',NULL,1521768073),(7,'客服','客服权限',NULL,1521768073);

/*Table structure for table `colin_submemu` */

DROP TABLE IF EXISTS `colin_submemu`;

CREATE TABLE `colin_submemu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '子菜单表',
  `menu_id` int(11) DEFAULT NULL COMMENT '主菜单id',
  `route_name` varchar(100) DEFAULT NULL COMMENT '路由名',
  `route` varchar(100) DEFAULT NULL COMMENT '路由',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示 1:显示 2:隐藏',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `colin_submemu` */

insert  into `colin_submemu`(`id`,`menu_id`,`route_name`,`route`,`is_show`,`sort`,`create_time`) values (1,1,'会员列表','member/index',1,10,1521768073),(2,2,'管理员列表','user/index',1,10,1521768073),(3,2,'角色管理','role/index',1,10,1521768073);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `colin_user` */

insert  into `colin_user`(`id`,`role_id`,`name`,`password`,`status`,`create_time`) values (1,1,'admin','$2y$13$Ln878YXekD23XBX8Xexyse3ys8dFBJRJf3CV5hoB3Uz.CDXgmYIn2',1,1521768073),(6,7,'test',NULL,1,1521768073);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

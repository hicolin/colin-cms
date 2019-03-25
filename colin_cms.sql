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
/*Table structure for table `colin_login_log` */

DROP TABLE IF EXISTS `colin_login_log`;

CREATE TABLE `colin_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '登陆日志',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(100) DEFAULT NULL COMMENT '位置',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `colin_login_log` */

insert  into `colin_login_log`(`id`,`user_id`,`ip`,`address`,`create_time`) values (9,1,'127.0.0.1','北京市 北京市',1553440309),(10,6,'127.0.0.1','北京市 北京市',1553440394),(11,1,'127.0.0.1','北京市 北京市',1553440915),(12,1,'127.0.0.1','北京市 北京市',1553440996),(13,1,'127.0.0.1','安徽省 合肥市',1553441073),(14,6,'127.0.0.1','安徽省 合肥市',1553441107);

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `colin_member` */

insert  into `colin_member`(`id`,`nickname`,`tel`,`password`,`email`,`status`,`create_time`) values (1,'Colin','17312341238','$2y$13$r7Tb8JB..LpxahNQEGfrAOwKcVZlXM73OEHn/nOMeZ3Zmn4PDWJwC','12345216@qq.com',1,1521768073),(2,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),(3,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(4,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(5,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),(26,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(27,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(28,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),(29,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(30,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(31,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(32,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(33,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(34,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(35,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(36,'张三','17300000000',NULL,'123456@qq.com',2,1521768073),(37,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(38,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(40,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(41,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),(42,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),(43,'Colin','17312341234',NULL,'123456@qq.com',2,1521768073),(56,'李四2','17812341234','$2y$13$FkGSqk0aX2QSsscvQhQm5.XnGK9EkL8vJb3Z1Niez2MStWcQkeAUW','lisi@qq.com',2,1552446687),(57,'TEST','17352902344','$2y$13$s5Na35XAgm3Odq0QzT0uteLFPSWCgJ8PLE95sh1hP/q5JnvhOZWK2','123@qq.com',2,1552446738);

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

/*Data for the table `colin_menu` */

insert  into `colin_menu`(`id`,`name`,`icon`,`sort`,`is_show`,`create_time`) values (1,'会员管理','&#xe6b8;',20,1,1521768073),(2,'管理员管理','&#xe726;',16,1,1521768073),(3,'日志管理','',10,1,1521768073),(4,'系统设置','&#xe6ae;',10,1,1521768073);

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `colin_operate_log` */

insert  into `colin_operate_log`(`id`,`user_id`,`route_name`,`route`,`param`,`create_time`) values (5,1,'会员添加','member/create','[]',1553523661),(6,1,'会员添加','member/create','{\"nickname\":\"1234545\",\"email\":\"12123232\",\"tel\":\"17352909090\",\"status\":\"1\",\"pwd\":\"123\"}',1553523684),(7,1,'会员编辑','member/update','{\"id\":\"58\"}',1553523693),(8,1,'会员编辑','member/update','{\"id\":\"58\",\"nickname\":\"1234545\",\"email\":\"12123232@qq.com\",\"tel\":\"17352909090\",\"status\":\"1\",\"pwd\":\"\"}',1553523699),(9,1,'子菜单列表','menu/submenu','{\"id\":\"3\"}',1553525219),(10,1,'路由列表','menu/route','{\"id\":\"6\"}',1553525223),(11,1,'路由添加','menu/route-create','{\"submenu_id\":\"6\"}',1553525225),(12,1,'路由添加','menu/route-create','{\"submenu_id\":\"6\"}',1553525274),(13,1,'路由添加','menu/route-create','{\"submenu_id\":\"6\",\"route_name\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\\u67e5\\u770b\\u53c2\\u6570\",\"route\":\"operate-log\\/view\",\"status\":\"1\"}',1553525306),(14,1,'路由列表','menu/route','{\"id\":\"6\"}',1553525308),(15,1,'角色编辑','role/update','{\"id\":\"1\"}',1553525316),(16,1,'角色编辑','role/update','{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"description\":\"\\u62e5\\u6709\\u6240\\u6709\\u6743\\u9650\",\"ids\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"41\",\"42\",\"43\",\"44\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"38\",\"39\",\"40\",\"18\",\"19\",\"20\",\"21\",\"22\"]}',1553525327),(17,1,'操作日志查看参数','operate-log/view','{\"id\":\"16\"}',1553525365),(18,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525837),(19,1,'操作日志查看参数','operate-log/view','{\"id\":\"15\"}',1553525847),(20,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525862),(21,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525867),(22,1,'操作日志查看参数','operate-log/view','{\"id\":\"13\"}',1553525875),(23,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525892),(24,1,'操作日志查看参数','operate-log/view','{\"id\":\"23\"}',1553526068),(25,1,'操作日志查看参数','operate-log/view','{\"id\":\"23\"}',1553526097),(26,1,'操作日志查看参数','operate-log/view','{\"id\":\"25\"}',1553526182),(27,1,'操作日志查看参数','operate-log/view','{\"id\":\"26\"}',1553526221),(28,1,'操作日志查看参数','operate-log/view','{\"id\":\"26\"}',1553526337),(29,1,'操作日志查看参数','operate-log/view','{\"id\":\"28\"}',1553526395),(30,1,'管理员编辑','user/update','{\"id\":\"7\"}',1553526410),(31,1,'操作日志查看参数','operate-log/view','{\"id\":\"28\"}',1553526422),(32,1,'操作日志查看参数','operate-log/view','{\"id\":\"31\"}',1553526455),(33,1,'操作日志查看参数','operate-log/view','{\"id\":\"30\"}',1553526482),(34,1,'会员编辑','member/update','{\"id\":\"58\"}',1553528085),(35,1,'会员编辑','member/update','{\"id\":\"58\",\"nickname\":\"12345451\",\"email\":\"12123232@qq.com\",\"tel\":\"17352909090\",\"status\":\"1\",\"pwd\":\"\"}',1553528091),(36,1,'会员删除','member/del','{\"id\":\"58\"}',1553528100),(37,1,'角色编辑','role/update','{\"id\":\"1\"}',1553528108),(38,1,'角色编辑','role/update','{\"id\":\"15\"}',1553528121),(39,1,'角色编辑','role/update','{\"id\":\"15\",\"name\":\"财务\",\"description\":\"财务权限\",\"ids\":{\"0\":\"1\",\"6\":\"23\",\"7\":\"24\",\"8\":\"25\",\"9\":\"26\",\"10\":\"27\",\"11\":\"28\",\"12\":\"29\",\"13\":\"30\",\"14\":\"31\",\"15\":\"32\",\"16\":\"33\",\"17\":\"34\",\"18\":\"35\",\"19\":\"36\",\"20\":\"37\",\"21\":\"41\",\"25\":\"12\",\"31\":\"38\",\"34\":\"18\"}}',1553528140);

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

/*Data for the table `colin_role` */

insert  into `colin_role`(`id`,`name`,`description`,`permission`,`create_time`) values (1,'超级管理员','拥有所有权限','[1,2,3,4,5,6,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,41,42,43,44,12,13,14,15,16,17,38,39,40,18,19,20,21,22]',1553525327),(4,'测试','测试人员权限','[1,23,12,13,14,38,18,19,20]',1553440441),(7,'客服','客服权限','[1,12,13]',1553336925),(15,'财务','财务权限','[1,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,41,12,38,18]',1553528140);

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `colin_route` */

insert  into `colin_route`(`id`,`submenu_id`,`route_name`,`route`,`status`,`create_time`) values (1,1,'会员列表','member/index',1,1521768073),(2,1,'会员删除','member/del',1,1521768073),(3,1,'会员批量删除','member/batch-del',1,1521768073),(4,1,'会员添加','member/create',1,1521768073),(5,1,'会员编辑','member/update',1,1521768073),(6,1,'会员状态修改','member/change-status',1,1521768073),(12,2,'管理员列表','user/index',1,1553244064),(13,2,'管理员删除','user/del',1,1553244091),(14,2,'管理员批量删除','user/batch-del',1,1553244124),(15,2,'管理员添加','user/create',1,1553244151),(16,2,'管理员编辑','user/update',1,1553244172),(17,2,'管理员状态修改','user/change-status',1,1553244208),(18,3,'角色列表','role/index',1,1553244281),(19,3,'角色删除','role/del',1,1553244307),(20,3,'角色批量删除','role/batch-del',1,1553244335),(21,3,'角色添加','role/create',1,1553244359),(22,3,'角色编辑','role/update',1,1553244392),(23,4,'菜单列表','menu/index',1,1553245834),(24,4,'菜单删除','menu/del',1,1553245871),(25,4,'菜单批量删除','menu/batch-del',1,1553246089),(26,4,' 菜单添加','memu/create',1,1553246123),(27,4,'菜单编辑','menu/update',1,1553246169),(28,4,'子菜单列表','menu/submenu',1,1553246215),(29,4,'子菜单删除','menu/submenu-del',1,1553246313),(30,4,'子菜单批量删除','menu/submenu-batch-del',1,1553246362),(31,4,'子菜单添加','menu/submenu-create',1,1553246414),(32,4,'子菜单更新','menu/submenu-update',1,1553246441),(33,4,'路由列表','menu/route',1,1553246467),(34,4,'路由删除','menu/route-del',1,1553246494),(35,4,'路由批量删除','menu/route-batch-del',1,1553246527),(36,4,'路由添加','menu/route-create',1,1553246558),(37,4,'路由编辑','menu/route-update',1,1553246585),(38,5,'登陆日志列表','login-log/index',1,1553436275),(39,5,'登陆日志删除','login-log/del',1,1553436909),(40,5,'登陆日志批量删除','login-log/batch-del',1,1553436940),(41,6,'操作日志列表','operate-log/index',1,1553521420),(42,6,'操作日志删除','operate-log/del',1,1553521445),(43,6,'操作日志批量删除','operate-log/batch-del',1,1553521474),(44,6,'操作日志查看参数','operate-log/view',1,1553525306);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `colin_submenu` */

insert  into `colin_submenu`(`id`,`menu_id`,`route_name`,`route`,`sort`,`is_show`,`create_time`) values (1,1,'会员管理','member/index',10,1,1521768073),(2,2,'管理员管理','user/index',10,1,1521768073),(3,2,'角色管理','role/index',10,1,1521768073),(4,2,'菜单路由管理','menu/index',10,1,1521768073),(5,3,'登陆日志','login-log/index',10,1,1553436248),(6,3,'操作日志','operate-log/index',10,1,1553521325);

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

/*Data for the table `colin_user` */

insert  into `colin_user`(`id`,`role_id`,`name`,`password`,`status`,`create_time`) values (1,1,'admin','$2y$13$Ln878YXekD23XBX8Xexyse3ys8dFBJRJf3CV5hoB3Uz.CDXgmYIn2',1,1521768073),(6,4,'test','$2y$13$Ln878YXekD23XBX8Xexyse3ys8dFBJRJf3CV5hoB3Uz.CDXgmYIn2',1,1521768073),(7,7,'kefu','$2y$13$ZQWkdDxAeC7V0GxFisl3MOAXPcD3p9IIMeK3uwrG3vzRIeCK2dSui',1,1553323404);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

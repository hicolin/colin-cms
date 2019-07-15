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
  `browser` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `os` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `colin_login_log` */

insert  into `colin_login_log`(`id`,`user_id`,`ip`,`address`,`browser`,`os`,`user_agent`,`create_time`) values
(9,1,'127.0.0.1','北京市 北京市',NULL,NULL,NULL,1553440309),
(10,6,'127.0.0.1','北京市 北京市',NULL,NULL,NULL,1553440394),
(11,1,'127.0.0.1','北京市 北京市',NULL,NULL,NULL,1553440915),
(12,1,'127.0.0.1','北京市 北京市',NULL,NULL,NULL,1553440996),
(13,1,'127.0.0.1','安徽省 合肥市',NULL,NULL,NULL,1553441073),
(14,6,'127.0.0.1','安徽省 合肥市',NULL,NULL,NULL,1553441107),
(15,1,'127.0.0.1','北京市 北京市',NULL,NULL,NULL,1553559638),
(16,1,'127.0.0.1','北京市 北京市',NULL,NULL,NULL,1553590599),
(17,1,'::1','北京市 北京市',NULL,NULL,NULL,1555926498),
(18,1,'::1','北京市 北京市',NULL,NULL,NULL,1557297906),
(19,1,'::1','北京市 北京市','Chrome(74.0.3729.131)','Windows 7',NULL,1557298406),
(20,1,'::1','北京市 北京市','Chrome(74.0.3729.131)','Android5.0',NULL,1557303575),
(21,1,'::1','北京市 北京市','Safari(604.1)','iPhone 11.0',NULL,1557303646),
(22,1,'::1','北京市 北京市','Chrome(74.0.3729.131)','Windows 7','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36',1557309303);

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

insert  into `colin_member`(`id`,`nickname`,`tel`,`password`,`email`,`status`,`create_time`) values
(1,'Colin','17312341238','$2y$13$r7Tb8JB..LpxahNQEGfrAOwKcVZlXM73OEHn/nOMeZ3Zmn4PDWJwC','12345216@qq.com',1,1521768073),
(2,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),
(3,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(4,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(5,'Colin2','17312341235',NULL,'12345678@qq.com',1,1521768273),
(26,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(27,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(28,'Colin2','17312341235',NULL,'12345678@qq.com',2,1521768273),
(29,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(30,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(31,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(32,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(33,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),
(34,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),
(35,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),
(36,'张三','17300000000',NULL,'123456@qq.com',2,1521768073),
(37,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(38,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(40,'Colin','17312341234',NULL,'123456@qq.com',2,1521768073),
(41,'张三','17300000000',NULL,'123456@qq.com',1,1521768073),
(42,'Colin','17312341234',NULL,'123456@qq.com',1,1521768073),
(43,'Colin','17312341234',NULL,'123456@qq.com',2,1521768073),
(56,'李四2','17812341234','$2y$13$FkGSqk0aX2QSsscvQhQm5.XnGK9EkL8vJb3Z1Niez2MStWcQkeAUW','lisi@qq.com',1,1552446687),
(57,'TEST','17352902344','$2y$13$s5Na35XAgm3Odq0QzT0uteLFPSWCgJ8PLE95sh1hP/q5JnvhOZWK2','123@qq.com',2,1552446738),
(58,'medoo','17312341200',NULL,'medoo@qq.com',1,NULL);

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

insert  into `colin_menu`(`id`,`name`,`icon`,`sort`,`is_show`,`create_time`) values
(1,'会员管理','&#xe6b8;',20,1,1521768073),
(2,'管理员管理','&#xe726;',16,1,1521768073),
(3,'日志管理','',10,1,1521768073),
(4,'系统设置','',8,1,1521768073);

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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Data for the table `colin_operate_log` */

insert  into `colin_operate_log`(`id`,`user_id`,`route_name`,`route`,`param`,`create_time`) values
(5,1,'会员添加','member/create','[]',1553523661),
(6,1,'会员添加','member/create','{\"nickname\":\"1234545\",\"email\":\"12123232\",\"tel\":\"17352909090\",\"status\":\"1\",\"pwd\":\"123\"}',1553523684),
(7,1,'会员编辑','member/update','{\"id\":\"58\"}',1553523693),
(8,1,'会员编辑','member/update','{\"id\":\"58\",\"nickname\":\"1234545\",\"email\":\"12123232@qq.com\",\"tel\":\"17352909090\",\"status\":\"1\",\"pwd\":\"\"}',1553523699),
(9,1,'子菜单列表','menu/submenu','{\"id\":\"3\"}',1553525219),
(10,1,'路由列表','menu/route','{\"id\":\"6\"}',1553525223),
(11,1,'路由添加','menu/route-create','{\"submenu_id\":\"6\"}',1553525225),
(12,1,'路由添加','menu/route-create','{\"submenu_id\":\"6\"}',1553525274),
(13,1,'路由添加','menu/route-create','{\"submenu_id\":\"6\",\"route_name\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\\u67e5\\u770b\\u53c2\\u6570\",\"route\":\"operate-log\\/view\",\"status\":\"1\"}',1553525306),
(14,1,'路由列表','menu/route','{\"id\":\"6\"}',1553525308),
(15,1,'角色编辑','role/update','{\"id\":\"1\"}',1553525316),
(16,1,'角色编辑','role/update','{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"description\":\"\\u62e5\\u6709\\u6240\\u6709\\u6743\\u9650\",\"ids\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"41\",\"42\",\"43\",\"44\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"38\",\"39\",\"40\",\"18\",\"19\",\"20\",\"21\",\"22\"]}',1553525327),
(17,1,'操作日志查看参数','operate-log/view','{\"id\":\"16\"}',1553525365),
(18,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525837),
(19,1,'操作日志查看参数','operate-log/view','{\"id\":\"15\"}',1553525847),
(20,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525862),
(21,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525867),
(22,1,'操作日志查看参数','operate-log/view','{\"id\":\"13\"}',1553525875),
(23,1,'操作日志查看参数','operate-log/view','{\"id\":\"17\"}',1553525892),
(24,1,'操作日志查看参数','operate-log/view','{\"id\":\"23\"}',1553526068),
(25,1,'操作日志查看参数','operate-log/view','{\"id\":\"23\"}',1553526097),
(26,1,'操作日志查看参数','operate-log/view','{\"id\":\"25\"}',1553526182),
(27,1,'操作日志查看参数','operate-log/view','{\"id\":\"26\"}',1553526221),
(28,1,'操作日志查看参数','operate-log/view','{\"id\":\"26\"}',1553526337),
(29,1,'操作日志查看参数','operate-log/view','{\"id\":\"28\"}',1553526395),
(30,1,'管理员编辑','user/update','{\"id\":\"7\"}',1553526410),
(31,1,'操作日志查看参数','operate-log/view','{\"id\":\"28\"}',1553526422),
(32,1,'操作日志查看参数','operate-log/view','{\"id\":\"31\"}',1553526455),
(33,1,'操作日志查看参数','operate-log/view','{\"id\":\"30\"}',1553526482),
(34,1,'会员编辑','member/update','{\"id\":\"58\"}',1553528085),
(35,1,'会员编辑','member/update','{\"id\":\"58\",\"nickname\":\"12345451\",\"email\":\"12123232@qq.com\",\"tel\":\"17352909090\",\"status\":\"1\",\"pwd\":\"\"}',1553528091),
(36,1,'会员删除','member/del','{\"id\":\"58\"}',1553528100),
(37,1,'角色编辑','role/update','{\"id\":\"1\"}',1553528108),
(38,1,'角色编辑','role/update','{\"id\":\"15\"}',1553528121),
(39,1,'角色编辑','role/update','{\"id\":\"15\",\"name\":\"财务\",\"description\":\"财务权限\",\"ids\":{\"0\":\"1\",\"6\":\"23\",\"7\":\"24\",\"8\":\"25\",\"9\":\"26\",\"10\":\"27\",\"11\":\"28\",\"12\":\"29\",\"13\":\"30\",\"14\":\"31\",\"15\":\"32\",\"16\":\"33\",\"17\":\"34\",\"18\":\"35\",\"19\":\"36\",\"20\":\"37\",\"21\":\"41\",\"25\":\"12\",\"31\":\"38\",\"34\":\"18\"}}',1553528140),
(40,1,'子菜单添加','menu/submenu-create','{\"menu_id\":\"1\"}',1553559723),
(41,1,'角色编辑','role/update','{\"id\":\"1\"}',1553559843),
(42,1,'会员状态修改','member/change-status','{\"id\":\"56\",\"status\":\"2\"}',1553562837),
(43,1,'会员状态修改','member/change-status','{\"id\":\"40\",\"status\":\"1\"}',1553562840),
(44,1,'会员状态修改','member/change-status','{\"id\":\"28\",\"status\":\"1\"}',1553562872),
(45,1,'会员状态修改','member/change-status','{\"id\":\"28\",\"status\":\"1\"}',1553562873),
(46,1,'会员编辑','member/update','{\"id\":\"28\"}',1553562882),
(47,1,'管理员状态修改','user/change-status','{\"id\":\"6\",\"status\":\"1\"}',1553562913),
(48,1,'管理员编辑','user/update','{\"id\":\"6\"}',1553562915),
(49,1,'管理员状态修改','user/change-status','{\"id\":\"6\",\"status\":\"1\"}',1553562919),
(50,1,'管理员编辑','user/update','{\"id\":\"7\"}',1553563411),
(51,1,'管理员编辑','user/update','{\"id\":\"1\"}',1553595960),
(52,1,'管理员编辑','user/update','{\"id\":\"1\",\"name\":\"admin\",\"role_id\":\"1\",\"status\":\"1\",\"pwd\":\"123456\"}',1553595964),
(53,1,'子菜单添加','menu/submenu-create','{\"menu_id\":\"4\"}',1553599063),
(54,1,'子菜单添加','menu/submenu-create','{\"menu_id\":\"4\"}',1553599079),
(55,1,'子菜单添加','menu/submenu-create','{\"menu_id\":\"4\",\"route_name\":\"系统设置\",\"route\":\"set\\/index\",\"sort\":\"10\",\"is_show\":\"1\"}',1553599092),
(56,1,'路由添加','menu/route-create','{\"submenu_id\":\"7\"}',1553599100),
(57,1,'路由添加','menu/route-create','{\"submenu_id\":\"7\",\"route_name\":\"系统设置查看\",\"route\":\"set\\/index\",\"status\":\"1\"}',1553599121),
(58,1,'角色编辑','role/update','{\"id\":\"1\"}',1553599562),
(59,1,'角色编辑','role/update','{\"id\":\"1\",\"name\":\"超级管理员\",\"description\":\"拥有所有权限\",\"ids\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"45\",\"41\",\"42\",\"43\",\"44\"]}',1553599565),
(60,1,'菜单编辑','menu/update','{\"id\":\"4\"}',1553599619),
(61,1,'菜单编辑','menu/update','{\"id\":\"4\",\"name\":\"系统设置\",\"icon\":\"\",\"sort\":\"12\",\"is_show\":\"1\"}',1553599622),
(62,1,'菜单编辑','menu/update','{\"id\":\"4\"}',1553599628),
(63,1,'菜单编辑','menu/update','{\"id\":\"4\",\"name\":\"系统设置\",\"icon\":\"\",\"sort\":\"8\",\"is_show\":\"1\"}',1553599631),
(64,1,'路由添加','menu/route-create','{\"submenu_id\":\"7\"}',1553603344),
(65,1,'路由添加','menu/route-create','{\"submenu_id\":\"7\",\"route_name\":\"系统网站设置修改\",\"route\":\"set\\/change-text\",\"status\":\"1\"}',1553603409),
(66,1,'路由添加','menu/route-create','{\"submenu_id\":\"7\"}',1553603412),
(67,1,'路由添加','menu/route-create','{\"submenu_id\":\"7\",\"route_name\":\"系统图片设置上传\",\"route\":\"set\\/change-img\",\"status\":\"1\"}',1553603448),
(68,1,'角色编辑','role/update','{\"id\":\"1\"}',1553603455),
(69,1,'角色编辑','role/update','{\"id\":\"1\",\"name\":\"超级管理员\",\"description\":\"拥有所有权限\",\"ids\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"45\",\"46\",\"47\",\"18\",\"19\",\"20\",\"21\",\"22\",\"41\",\"42\",\"43\",\"44\"]}',1553603459),
(70,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值\"}',1553603471),
(71,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值\"}',1553603473),
(72,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值\"}',1553603476),
(73,1,'系统网站设置修改','set/change-text','{\"id\":\"1\",\"val\":\"Colin CMS\"}',1553603482),
(74,1,'系统网站设置修改','set/change-text','{\"id\":\"1\",\"val\":\"Colin CMS2\"}',1553603483),
(75,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值2\"}',1553603485),
(76,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值\"}',1553603487),
(77,1,'系统网站设置修改','set/change-text','{\"id\":\"1\",\"val\":\"Colin CMS\"}',1553603489),
(78,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值\"}',1553603491),
(79,1,'系统网站设置修改','set/change-text','{\"id\":\"1\",\"val\":\"Colin CMS2\"}',1553603493),
(80,1,'系统网站设置修改','set/change-text','{\"id\":\"1\",\"val\":\"Colin CMS\"}',1553603511),
(81,1,'系统图片设置上传','set/change-img','[]',1553604397),
(82,1,'系统图片设置上传','set/change-img','[]',1553604785),
(83,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"D:\\\\softwares\\\\phpStudy\\\\PHPTutorial\\\\WWW\\\\cms\\/uploads\\/image\\/20190326\\/5c9a20b19e059.jpg\"}',1553604785),
(84,1,'系统图片设置上传','set/change-img','[]',1553604861),
(85,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"D:\\\\softwares\\\\phpStudy\\\\PHPTutorial\\\\WWW\\\\cms\\/uploads\\/image\\/20190326\\/5c9a20fdea485.jpg\"}',1553604862),
(86,1,'系统图片设置上传','set/change-img','[]',1553604942),
(87,1,'系统图片设置上传','set/change-img','[]',1553605006),
(88,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"D:\\\\softwares\\\\phpStudy\\\\PHPTutorial\\\\WWW\\\\cms\\/uploads\\/image\\/20190326\\/5c9a218e10d00.png\"}',1553605006),
(89,1,'系统图片设置上传','set/change-img','[]',1553605086),
(90,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"http:\\/\\/dev.xadmin.com\\/uploads\\/image\\/20190326\\/5c9a21de8fab5.png\"}',1553605086),
(91,1,'系统图片设置上传','set/change-img','[]',1553605307),
(92,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"http:\\/\\/dev.xadmin.com\\/uploads\\/image\\/20190326\\/5c9a22bbb1466.png\"}',1553605307),
(93,1,'系统图片设置上传','set/change-img','[]',1553605398),
(94,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"http:\\/\\/dev.xadmin.com\\/uploads\\/image\\/20190326\\/5c9a23165c9a7.jpg\"}',1553605398),
(95,1,'系统图片设置上传','set/change-img','[]',1553605454),
(96,1,'系统图片设置上传','set/change-img','[]',1553605520),
(97,1,'系统图片设置上传','set/change-img','[]',1553605572),
(98,1,'系统图片设置上传','set/change-img','[]',1553605655),
(99,1,'系统图片设置上传','set/change-img','[]',1553605730),
(100,1,'系统图片设置上传','set/change-img','[]',1553605758),
(101,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"uploads\\/image\\/20190326\\/5c9a247ee24cd.jpg\"}',1553605759),
(102,1,'系统图片设置上传','set/change-img','[]',1553605868),
(103,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a24ecb9d77.png\"}',1553605868),
(104,1,'系统图片设置上传','set/change-img','[]',1553605946),
(105,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a253a79fc6.jpg\"}',1553605946),
(106,1,'系统图片设置上传','set/change-img','[]',1553606082),
(107,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a25c27ae89.png\"}',1553606082),
(108,1,'系统图片设置上传','set/change-img','[]',1553606090),
(109,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a25ca36a82.gif\"}',1553606090),
(110,1,'系统图片设置上传','set/change-img','[]',1553606091),
(111,1,'系统图片设置上传','set/change-img','{\"id\":\"4\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a25cb35733.gif\"}',1553606091),
(112,1,'系统图片设置上传','set/change-img','[]',1553606146),
(113,1,'系统图片设置上传','set/change-img','{\"id\":\"4\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a2602dfe7d.png\"}',1553606147),
(114,1,'系统图片设置上传','set/change-img','[]',1553606152),
(115,1,'系统图片设置上传','set/change-img','{\"id\":\"4\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a2608871df.png\"}',1553606152),
(116,1,'系统图片设置上传','set/change-img','[]',1553606153),
(117,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26099450b.png\"}',1553606153),
(118,1,'系统图片设置上传','set/change-img','[]',1553606176),
(119,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a2620c2c82.png\"}',1553606176),
(120,1,'系统图片设置上传','set/change-img','[]',1553606180),
(121,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26249eb3e.jpg\"}',1553606180),
(122,1,'系统图片设置上传','set/change-img','[]',1553606181),
(123,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26259ff00.jpg\"}',1553606181),
(124,1,'系统图片设置上传','set/change-img','[]',1553606319),
(125,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26afd2739.png\"}',1553606319),
(126,1,'系统图片设置上传','set/change-img','[]',1553606323),
(127,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26b354090.gif\"}',1553606323),
(128,1,'系统图片设置上传','set/change-img','[]',1553606326),
(129,1,'系统图片设置上传','set/change-img','{\"id\":\"4\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26b6dd894.png\"}',1553606327),
(130,1,'系统图片设置上传','set/change-img','[]',1553606331),
(131,1,'系统图片设置上传','set/change-img','{\"id\":\"4\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26bb0e131.png\"}',1553606331),
(132,1,'系统图片设置上传','set/change-img','[]',1553606340),
(133,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a26c437f36.png\"}',1553606340),
(134,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值1\"}',1553606385),
(135,1,'系统网站设置修改','set/change-text','{\"id\":\"3\",\"val\":\"测试值\"}',1553606387),
(136,1,'系统图片设置上传','set/change-img','[]',1553606472),
(137,1,'系统图片设置上传','set/change-img','{\"id\":\"2\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a27484e4d9.png\"}',1553606472),
(138,1,'系统图片设置上传','set/change-img','[]',1553606475),
(139,1,'系统图片设置上传','set/change-img','{\"id\":\"4\",\"val\":\"\\/uploads\\/image\\/20190326\\/5c9a274b460b2.png\"}',1553606475),
(140,1,'路由添加','menu/route-create','{\"submenu_id\":\"1\"}',1555930906),
(141,1,'路由添加','menu/route-create','{\"submenu_id\":\"1\"}',1555930913),
(142,1,'路由添加','menu/route-create','{\"submenu_id\":\"1\",\"route_name\":\"member\\/export\",\"route\":\"数据导出\",\"status\":\"1\"}',1555930932),
(143,1,'路由编辑','menu/route-update','{\"id\":\"48\"}',1555930939),
(144,1,'路由编辑','menu/route-update','{\"id\":\"48\",\"route_name\":\"数据导出\",\"route\":\"member\\/export\",\"status\":\"1\"}',1555930949),
(145,1,'角色编辑','role/update','{\"id\":\"1\"}',1555930959),
(146,1,'角色编辑','role/update','{\"id\":\"1\",\"name\":\"超级管理员\",\"description\":\"拥有所有权限\",\"ids\":[\"45\",\"46\",\"47\",\"41\",\"42\",\"43\",\"44\",\"38\",\"39\",\"40\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"18\",\"19\",\"20\",\"21\",\"22\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"48\"],\"submenu_name\":{\"6\":\"on\"}}',1555930964),
(147,1,'数据导出','member/export','[]',1555930971),
(148,1,'数据导出','member/export','[]',1555931009),
(149,1,'数据导出','member/export','[]',1555931072),
(150,1,'数据导出','member/export','[]',1555931104),
(151,1,'数据导出','member/export','[]',1555931185),
(152,1,'数据导出','member/export','[]',1555931218),
(153,1,'数据导出','member/export','{\"search\":{\"nickname\":\"test\",\"tel\":\"\",\"b_time\":\"\",\"e_time\":\"\"}}',1555931276),
(154,1,'数据导出','member/export','{\"search\":{\"nickname\":\"test\",\"tel\":\"\",\"b_time\":\"\",\"e_time\":\"\"}}',1555931338),
(155,1,'数据导出','member/export','[]',1557297926),
(156,1,'路由添加','menu/route-create','{\"submenu_id\":\"5\"}',1557309331),
(157,1,'路由添加','menu/route-create','{\"submenu_id\":\"5\",\"route_name\":\"查看UA\",\"route\":\"login-log\\/view\",\"status\":\"1\"}',1557309365),
(158,1,'管理员编辑','user/update','{\"id\":\"1\"}',1557309377),
(159,1,'角色编辑','role/update','{\"id\":\"1\"}',1557309382),
(160,1,'角色编辑','role/update','{\"id\":\"1\",\"name\":\"超级管理员\",\"description\":\"拥有所有权限\",\"ids\":[\"45\",\"46\",\"47\",\"41\",\"42\",\"43\",\"44\",\"38\",\"39\",\"40\",\"49\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"18\",\"19\",\"20\",\"21\",\"22\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"48\"]}',1557309388);

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

insert  into `colin_role`(`id`,`name`,`description`,`permission`,`create_time`) values
(1,'超级管理员','拥有所有权限','[45,46,47,41,42,43,44,38,39,40,49,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,18,19,20,21,22,12,13,14,15,16,17,1,2,3,4,5,6,48]',1557309388),
(4,'测试','测试人员权限','[1,23,12,13,14,38,18,19,20]',1553440441),
(7,'客服','客服权限','[1,12,13]',1553336925),
(15,'财务','财务权限','[1,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,41,12,38,18]',1553528140);

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `colin_route` */

insert  into `colin_route`(`id`,`submenu_id`,`route_name`,`route`,`status`,`create_time`) values
(1,1,'会员列表','member/index',1,1521768073),
(2,1,'会员删除','member/del',1,1521768073),
(3,1,'会员批量删除','member/batch-del',1,1521768073),
(4,1,'会员添加','member/create',1,1521768073),
(5,1,'会员编辑','member/update',1,1521768073),
(6,1,'会员状态修改','member/change-status',1,1521768073),
(12,2,'管理员列表','user/index',1,1553244064),
(13,2,'管理员删除','user/del',1,1553244091),
(14,2,'管理员批量删除','user/batch-del',1,1553244124),
(15,2,'管理员添加','user/create',1,1553244151),
(16,2,'管理员编辑','user/update',1,1553244172),
(17,2,'管理员状态修改','user/change-status',1,1553244208),
(18,3,'角色列表','role/index',1,1553244281),
(19,3,'角色删除','role/del',1,1553244307),
(20,3,'角色批量删除','role/batch-del',1,1553244335),
(21,3,'角色添加','role/create',1,1553244359),
(22,3,'角色编辑','role/update',1,1553244392),
(23,4,'菜单列表','menu/index',1,1553245834),
(24,4,'菜单删除','menu/del',1,1553245871),
(25,4,'菜单批量删除','menu/batch-del',1,1553246089),
(26,4,' 菜单添加','menu/create',1,1553246123),
(27,4,'菜单编辑','menu/update',1,1553246169),
(28,4,'子菜单列表','menu/submenu',1,1553246215),
(29,4,'子菜单删除','menu/submenu-del',1,1553246313),
(30,4,'子菜单批量删除','menu/submenu-batch-del',1,1553246362),
(31,4,'子菜单添加','menu/submenu-create',1,1553246414),
(32,4,'子菜单更新','menu/submenu-update',1,1553246441),
(33,4,'路由列表','menu/route',1,1553246467),
(34,4,'路由删除','menu/route-del',1,1553246494),
(35,4,'路由批量删除','menu/route-batch-del',1,1553246527),
(36,4,'路由添加','menu/route-create',1,1553246558),
(37,4,'路由编辑','menu/route-update',1,1553246585),
(38,5,'登陆日志列表','login-log/index',1,1553436275),
(39,5,'登陆日志删除','login-log/del',1,1553436909),
(40,5,'登陆日志批量删除','login-log/batch-del',1,1553436940),
(41,6,'操作日志列表','operate-log/index',1,1553521420),
(42,6,'操作日志删除','operate-log/del',1,1553521445),
(43,6,'操作日志批量删除','operate-log/batch-del',1,1553521474),
(44,6,'操作日志查看参数','operate-log/view',1,1553525306),
(45,7,'系统设置查看','set/index',1,1553599121),
(46,7,'系统网站设置修改','set/change-text',1,1553603409),
(47,7,'系统图片设置上传','set/change-img',1,1553603448),
(48,1,'数据导出','member/export',1,1555930932),
(49,5,'查看UA','login-log/view',1,1557309365);

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

/*Data for the table `colin_set` */

insert  into `colin_set`(`id`,`key`,`desc`,`value`,`type`) values
(1,'title','网站标题','Colin CMS',1),
(2,'logo','logo','/uploads/image/20190326/5c9a27484e4d9.png',2),
(3,'test','测试','测试值',1),
(4,'test_img','测试图片','/uploads/image/20190326/5c9a274b460b2.png',2);

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

/*Data for the table `colin_submenu` */

insert  into `colin_submenu`(`id`,`menu_id`,`route_name`,`route`,`sort`,`is_show`,`create_time`) values
(1,1,'会员管理','member/index',10,1,1521768073),
(2,2,'管理员管理','user/index',10,1,1521768073),
(3,2,'角色管理','role/index',10,1,1521768073),
(4,2,'菜单路由管理','menu/index',10,1,1521768073),
(5,3,'登陆日志','login-log/index',10,1,1553436248),
(6,3,'操作日志','operate-log/index',10,1,1553521325),
(7,4,'系统设置','set/index',10,1,1553599092);

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

insert  into `colin_user`(`id`,`role_id`,`name`,`password`,`status`,`create_time`) values
(1,1,'admin','$2y$13$VVceeM3SXJJOIj8p9Pk4Be64mF56ajnArZEpM7557.zfAAgnc5KB.',1,1521768073),
(6,4,'test','$2y$13$Ln878YXekD23XBX8Xexyse3ys8dFBJRJf3CV5hoB3Uz.CDXgmYIn2',2,1521768073),
(7,7,'kefu','$2y$13$ZQWkdDxAeC7V0GxFisl3MOAXPcD3p9IIMeK3uwrG3vzRIeCK2dSui',1,1553323404);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

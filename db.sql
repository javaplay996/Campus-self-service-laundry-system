/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - xiaoyuanxiyiji
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiaoyuanxiyiji` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiaoyuanxiyiji`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/fd-ssmj/upload/1613705295135.jpg'),(2,'picture2','http://localhost:8080/fd-ssmj/upload/1613705301525.jpg'),(3,'picture3','http://localhost:8080/fd-ssmj/upload/1613799912302.JPG'),(4,'picture4','http://localhost:8080/fd-ssmj/upload/1613705325348.jpg'),(5,'picture5','http://localhost:8080/fd-ssmj/upload/1613705332544.jpg'),(6,'homepage','http://localhost:8080/fd-ssmj/upload/1613705342094.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-03-15 11:41:54'),(2,'sex_types','性别',2,'女',NULL,'2021-03-15 11:41:54'),(3,'xyjzt_types','状态',1,'未使用',NULL,'2021-03-15 11:41:54'),(4,'xyjzt_types','状态',2,'使用中',NULL,'2021-03-15 11:41:54'),(5,'xyjzt_types','状态',3,'维修中',NULL,'2021-03-15 11:41:54');

/*Table structure for table `liuyanxinxi` */

DROP TABLE IF EXISTS `liuyanxinxi`;

CREATE TABLE `liuyanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `note` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `yhnote` varchar(11) DEFAULT NULL COMMENT '留言人',
  `note_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间 Search',
  `reply` varchar(255) DEFAULT NULL COMMENT '回复',
  `glreply` varchar(11) DEFAULT NULL COMMENT '回复人',
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanxinxi` */

insert  into `liuyanxinxi`(`id`,`note`,`yhnote`,`note_time`,`reply`,`glreply`,`reply_time`) values (4,'1231111','admin','2021-03-15 15:43:20','只有管理员可以回复','admin','2021-03-15 15:43:20'),(11,'13213212','333','2021-03-15 15:43:47','12313212','admin','2021-03-15 15:43:48');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (5,1,'admin','users','管理员','zhattyc6j307oonmcuf8ufaxq5ksebp9','2021-03-04 11:02:31','2021-03-15 16:43:43'),(6,1,'111','users','用户','6bg8iocj41dl38dltedxddj1uyvqujpm','2021-03-15 13:40:48','2021-03-15 16:20:15'),(7,4,'333','users','用户','oqdebtejtrkcuilcb6p1z5obzljzrq3q','2021-03-15 15:33:25','2021-03-15 16:43:25');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-03-01 00:00:00');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (1,'2021-02-25 17:35:20','日常公告标题','日常公告','公告信息','2021-02-25 17:35:20'),(2,'2021-02-25 17:35:20','紧急公告标题','紧急公告','公告信息','2021-02-25 17:35:20'),(3,'2021-02-25 17:35:20','其他公告标题','其他公告','公告信息','2021-02-25 17:35:20');

/*Table structure for table `xiyiji` */

DROP TABLE IF EXISTS `xiyiji`;

CREATE TABLE `xiyiji` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '洗衣机编号 Search',
  `money` int(11) DEFAULT NULL COMMENT '价格/小时',
  `xyjzt_types` int(11) DEFAULT NULL COMMENT '洗衣机状态',
  `im_photo` varchar(200) DEFAULT NULL COMMENT '洗衣机照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='洗衣机';

/*Data for the table `xiyiji` */

insert  into `xiyiji`(`id`,`name`,`money`,`xyjzt_types`,`im_photo`) values (1,'001',1,1,'http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615788910190.jpg'),(2,'002',2,1,'http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615788904127.jpg'),(3,'003',3,1,'http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615788897820.jpg'),(4,'004',4,1,'http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615793044846.jpg');

/*Table structure for table `yiyuyuexiyiji` */

DROP TABLE IF EXISTS `yiyuyuexiyiji`;

CREATE TABLE `yiyuyuexiyiji` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xyj_types` int(11) DEFAULT NULL COMMENT '洗衣机编号',
  `yh_types` int(11) DEFAULT NULL COMMENT '预约用户',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '预约时间',
  `hour` int(11) DEFAULT NULL COMMENT '使用时间（单位小时）',
  `money` int(11) DEFAULT NULL COMMENT '总价价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='已预约洗衣机';

/*Data for the table `yiyuyuexiyiji` */

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称  Search111',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(4) DEFAULT NULL COMMENT '性别  Search111',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `money` int(255) DEFAULT '0' COMMENT '余额',
  `role` varchar(255) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`name`,`username`,`password`,`img_photo`,`sex_types`,`phone`,`money`,`role`) values (1,'小金','111','111','http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615788930270.jpg',1,'17796312333',0,'用户'),(2,'小札','222','222','http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615788923201.jpg',2,'12312312333',0,'用户'),(4,'333','333','333','http://localhost:8080/xiaoyuanxiyiji/file/download?fileName=1615793002048.jpg',2,'131213',0,'用户');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

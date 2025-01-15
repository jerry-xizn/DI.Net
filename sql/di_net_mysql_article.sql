/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.28 : Database - ruoyi-vue-net
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_title` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `article_author` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `article_content` longtext COLLATE utf8mb4_general_ci COMMENT '内容',
  `article_summary` text COLLATE utf8mb4_general_ci COMMENT '摘要',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

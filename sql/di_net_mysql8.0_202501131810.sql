/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.28 : Database - ruoyi-vue-net
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `net_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '.NET类型',
  `net_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '.NET字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-12-24 09:03:44','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-12-24 09:03:44','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-12-24 09:03:44','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-12-24 09:03:44','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-12-24 09:03:44','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-12-24 09:03:44','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','DI科技',0,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(101,100,'0,100','上海总公司',1,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(102,100,'0,100','厦门分公司',2,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(103,101,'0,100,101','研发部门',1,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(104,101,'0,100,101','市场部门',2,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(105,101,'0,100,101','测试部门',3,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(106,101,'0,100,101','财务部门',4,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(107,101,'0,100,101','运维部门',5,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(108,102,'0,100,102','市场部门',1,'DI','15888888888','di@qq.com','0','0','admin','2024-12-24 09:03:07','',NULL),(109,102,'0,100,102','财务部门',2,'DI','15888888888','v','0','0','admin','2024-12-24 09:03:07','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-12-24 09:03:40','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-12-24 09:03:40','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-12-24 09:03:40','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-12-24 09:03:40','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-12-24 09:03:40','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-12-24 09:03:40','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-12-24 09:03:40','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-12-24 09:03:40','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-12-24 09:03:40','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-12-24 09:03:40','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-12-24 09:03:40','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-12-24 09:03:41','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-12-24 09:03:41','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-12-24 09:03:41','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-12-24 09:03:41','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-12-24 09:03:41','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-12-24 09:03:41','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-12-24 09:03:41','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-12-24 09:03:41','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-12-24 09:03:41','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-12-24 09:03:41','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-12-24 09:03:41','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-12-24 09:03:41','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-12-24 09:03:41','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-12-24 09:03:41','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-12-24 09:03:41','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-12-24 09:03:41','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-12-24 09:03:41','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-12-24 09:03:41','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2024-12-24 09:03:37','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-12-24 09:03:37','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-12-24 09:03:37','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-12-24 09:03:37','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-12-24 09:03:37','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-12-24 09:03:37','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-12-24 09:03:37','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-12-24 09:03:38','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-12-24 09:03:38','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-12-24 09:03:38','',NULL,'登录状态列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统默认（无参）','DEFAULT','diTask.DINoParams','0/10 * * * * ?','3','1','1','admin','2024-12-24 09:03:47','',NULL,''),(2,'系统默认（有参）','DEFAULT','diTask.DIParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-12-24 09:03:47','',NULL,''),(3,'系统默认（多参）','DEFAULT','diTask.DIMultipleParams(\'di\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-12-24 09:03:47','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (100,'admin',NULL,'X.X.X.X','Chrome 131.0.0','Windows','1','验证码错误或已失效','2024-12-24 17:18:25'),(101,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2024-12-24 17:18:28'),(102,'admin',NULL,'X.X.X.X',NULL,NULL,'0','退出成功','2024-12-24 17:23:04'),(103,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2024-12-24 17:23:09'),(104,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2024-12-24 17:23:47'),(105,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 10:25:34'),(106,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2025-01-13 10:35:39'),(107,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 10:35:43'),(108,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2025-01-13 10:36:47'),(109,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 10:36:52'),(110,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 13:50:36'),(111,'admin',NULL,'X.X.X.X',NULL,NULL,'0','退出成功','2025-01-13 14:01:35'),(112,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 14:01:51'),(113,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 16:02:44'),(114,'admin','127.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2025-01-13 16:03:07'),(115,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 17:35:40'),(116,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2025-01-13 17:36:09'),(117,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 17:41:46'),(118,'admin',NULL,'X.X.X.X',NULL,NULL,'0','退出成功','2025-01-13 18:00:52'),(119,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 18:01:54'),(120,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2025-01-13 18:03:20'),(121,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','登录成功','2025-01-13 18:07:35'),(122,'admin','0.0.0.1','X.X.X.X','Chrome 131.0.0','Windows','0','退出成功','2025-01-13 18:08:33');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-12-24 09:03:16','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-12-24 09:03:16','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-12-24 09:03:16','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-12-24 09:03:17','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-12-24 09:03:17','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-12-24 09:03:17','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-12-24 09:03:17','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-12-24 09:03:17','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-12-24 09:03:17','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-12-24 09:03:17','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-12-24 09:03:17','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-12-24 09:03:17','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-12-24 09:03:17','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-12-24 09:03:17','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-12-24 09:03:17','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-12-24 09:03:17','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-12-24 09:03:17','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-12-24 09:03:17','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-12-24 09:03:17','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-12-24 09:03:17','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-12-24 09:03:18','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-12-24 09:03:18','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-12-24 09:03:18','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-12-24 09:03:18','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-12-24 09:03:18','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-12-24 09:03:18','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-12-24 09:03:18','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-12-24 09:03:18','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-12-24 09:03:18','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-12-24 09:03:18','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-12-24 09:03:18','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-12-24 09:03:18','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-12-24 09:03:18','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-12-24 09:03:18','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-12-24 09:03:18','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-12-24 09:03:18','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-12-24 09:03:18','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-12-24 09:03:18','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-12-24 09:03:19','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-12-24 09:03:19','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-12-24 09:03:19','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-12-24 09:03:19','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-12-24 09:03:19','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-12-24 09:03:19','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-12-24 09:03:19','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-12-24 09:03:19','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-12-24 09:03:19','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-12-24 09:03:19','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-12-24 09:03:19','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-12-24 09:03:19','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-12-24 09:03:19','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-12-24 09:03:19','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-12-24 09:03:19','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-12-24 09:03:19','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-12-24 09:03:19','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-12-24 09:03:19','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-12-24 09:03:19','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-12-24 09:03:20','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-12-24 09:03:20','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-12-24 09:03:20','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-12-24 09:03:20','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-12-24 09:03:20','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-12-24 09:03:20','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-12-24 09:03:20','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-12-24 09:03:20','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-12-24 09:03:20','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-12-24 09:03:20','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-12-24 09:03:20','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-12-24 09:03:20','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-12-24 09:03:20','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-12-24 09:03:20','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-12-24 09:03:20','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-12-24 09:03:20','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-12-24 09:03:20','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-12-24 09:03:20','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-12-24 09:03:20','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-12-24 09:03:20','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-12-24 09:03:20','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-12-24 09:03:20','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-12-24 09:03:21','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-12-24 09:03:21','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-12-24 09:03:21','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-12-24 09:03:21','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-12-24 09:03:21','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'温馨提醒：2024-07-01 DI新版本发布啦','2','新版本内容','0','admin','2024-12-24 09:03:51','',NULL,'管理员'),(2,'维护通知：2024-07-01 DI系统凌晨维护','1','维护内容','0','admin','2024-12-24 09:03:51','',NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (100,'用户管理',2,'RuoYi.System.Controllers.SysUserController.Edit','PUT',1,'admin',NULL,'http://localhost:5000/system/user','127.0.0.1','X.X.X.X','{\"user\":{\"userId\":2,\"deptId\":105,\"userName\":\"ry\",\"nickName\":\"\\u82E5\\u4F9D\",\"email\":\"ry@qq.com\",\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"sexDesc\":null,\"avatar\":\"\",\"password\":\"\",\"status\":\"0\",\"statusDesc\":null,\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2024-12-24T09:03:10\",\"dept\":{\"deptId\":105,\"parentId\":101,\"ancestors\":\"0,100,101\",\"deptName\":\"\\u6D4B\\u8BD5\\u90E8\\u95E8\",\"orderNum\":3,\"leader\":\"\\u82E5\\u4F9D\",\"phone\":\"15888888888\",\"email\":\"ry@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"parentName\":null,\"children\":[],\"deptCheckStrictly\":null,\"roleId\":null,\"parentIds\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:07\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":null,\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}},\"deptName\":null,\"deptLeader\":null,\"roles\":[{\"roleId\":2,\"roleName\":\"\\u666E\\u901A\\u89D2\\u8272\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"dataScopeDesc\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"statusDesc\":null,\"delFlag\":\"0\",\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"userId\":null,\"userName\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:14\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"\\u666E\\u901A\\u89D2\\u8272\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}],\"roleIds\":[2],\"postIds\":[1,2,3,4],\"roleId\":null,\"isAllocated\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:10\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"\\u6D4B\\u8BD5\\u5458111\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2024-12-24 17:18:54',1860),(101,'菜单管理',3,'RuoYi.System.Controllers.SysMenuController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/menu/4','127.0.0.1','X.X.X.X','{\"menuId\":4}','{\"msg\":\"\\u83DC\\u5355\\u5DF2\\u5206\\u914D,\\u4E0D\\u5141\\u8BB8\\u5220\\u9664\",\"code\":500}',0,NULL,'2025-01-13 10:26:26',180),(102,'角色管理',2,'RuoYi.System.Controllers.SysRoleController.Edit','PUT',1,'admin',NULL,'http://localhost:5000/system/role','127.0.0.1','X.X.X.X','{\"role\":{\"roleId\":2,\"roleName\":\"\\u666E\\u901A\\u89D2\\u8272\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"dataScopeDesc\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"statusDesc\":null,\"delFlag\":\"0\",\"flag\":false,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"deptIds\":null,\"permissions\":null,\"userId\":null,\"userName\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:14\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"\\u666E\\u901A\\u89D2\\u8272\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"code\":200}',0,NULL,'2025-01-13 10:26:48',491),(103,'菜单管理',3,'RuoYi.System.Controllers.SysMenuController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/menu/4','127.0.0.1','X.X.X.X','{\"menuId\":4}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 10:26:54',230),(104,'岗位管理',1,'RuoYi.System.Controllers.SysPostController.Add','POST',1,'admin',NULL,'http://localhost:5000/system/post','127.0.0.1','X.X.X.X','{\"post\":{\"postId\":null,\"postCode\":\"test111\",\"postCodeLike\":null,\"postName\":\"test111\",\"postNameLike\":null,\"postSort\":10,\"status\":\"0\",\"statusDesc\":null,\"userName\":null,\"userId\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"remark\":\"test111\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":true,\"code\":200}',0,NULL,'2025-01-13 14:09:11',253),(105,'岗位管理',1,'RuoYi.System.Controllers.SysPostController.Add','POST',1,'admin',NULL,'http://localhost:5000/system/post','127.0.0.1','X.X.X.X','{\"post\":{\"postId\":null,\"postCode\":\"test222\",\"postCodeLike\":null,\"postName\":\"test222\",\"postNameLike\":null,\"postSort\":10,\"status\":\"0\",\"statusDesc\":null,\"userName\":null,\"userId\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"remark\":\"test222\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":true,\"code\":200}',0,NULL,'2025-01-13 14:09:26',345),(106,'岗位管理',3,'RuoYi.System.Controllers.SysPostController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/post/5,6','127.0.0.1','X.X.X.X','{\"ids\":[]}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":0,\"code\":200}',0,NULL,'2025-01-13 14:09:45',109),(107,'岗位管理',5,'RuoYi.System.Controllers.SysPostController.Export','POST',1,'admin',NULL,'http://localhost:5000/system/post/export','127.0.0.1','X.X.X.X','{\"dto\":{\"postId\":null,\"postCode\":null,\"postCodeLike\":null,\"postName\":null,\"postNameLike\":null,\"postSort\":null,\"status\":null,\"statusDesc\":null,\"userName\":null,\"userId\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"remark\":null,\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}',NULL,0,NULL,'2025-01-13 14:09:54',397),(108,'岗位管理',3,'RuoYi.System.Controllers.SysPostController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/post/6','127.0.0.1','X.X.X.X','{\"ids\":[6]}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 14:13:29',270),(109,'岗位管理',3,'RuoYi.System.Controllers.SysPostController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/post/5','127.0.0.1','X.X.X.X','{\"ids\":[5]}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 14:13:33',75),(110,'用户管理',2,'DI.System.Controllers.SysUserController.Edit','PUT',1,'admin',NULL,'http://localhost:5000/system/user','127.0.0.1','X.X.X.X','{\"user\":{\"userId\":2,\"deptId\":105,\"userName\":\"ry\",\"nickName\":\"\\u82E5\\u4F9D\",\"email\":\"ry@qq.com\",\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"sexDesc\":null,\"avatar\":\"\",\"password\":\"\",\"status\":\"0\",\"statusDesc\":null,\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2024-12-24T09:03:10\",\"dept\":{\"deptId\":105,\"parentId\":101,\"ancestors\":\"0,100,101\",\"deptName\":\"\\u6D4B\\u8BD5\\u90E8\\u95E8\",\"orderNum\":3,\"leader\":\"\\u82E5\\u4F9D\",\"phone\":\"15888888888\",\"email\":\"ry@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"parentName\":null,\"children\":[],\"deptCheckStrictly\":null,\"roleId\":null,\"parentIds\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:07\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":null,\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}},\"deptName\":null,\"deptLeader\":null,\"roles\":[{\"roleId\":2,\"roleName\":\"\\u666E\\u901A\\u89D2\\u8272\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"dataScopeDesc\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"statusDesc\":null,\"delFlag\":\"0\",\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"userId\":null,\"userName\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:14\",\"updateBy\":\"admin\",\"updateTime\":\"2025-01-13T10:26:47\",\"remark\":\"\\u666E\\u901A\\u89D2\\u8272\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}],\"roleIds\":[2],\"postIds\":[1,2,3,4],\"roleId\":null,\"isAllocated\":null,\"createBy\":\"admin\",\"createTime\":\"2024-12-24T09:03:10\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-24T17:18:54\",\"remark\":\"\\u6D4B\\u8BD5\\u5458222\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 16:02:58',1275),(111,'岗位管理',1,'DI.System.Controllers.SysPostController.Add','POST',1,'admin',NULL,'http://localhost:5000/system/post','0.0.0.1','X.X.X.X','{\"post\":{\"postId\":null,\"postCode\":\"111\",\"postCodeLike\":null,\"postName\":\"111\",\"postNameLike\":null,\"postSort\":0,\"status\":\"0\",\"statusDesc\":null,\"userName\":null,\"userId\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"remark\":\"111\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":true,\"code\":200}',0,NULL,'2025-01-13 17:35:57',319),(112,'岗位管理',3,'DI.System.Controllers.SysPostController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/post/7','0.0.0.1','X.X.X.X','{\"ids\":[7]}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 17:36:01',99),(113,'岗位管理',1,'DI.System.Controllers.SysPostController.Add','POST',1,'admin',NULL,'http://localhost:5000/system/post','0.0.0.1','X.X.X.X','{\"post\":{\"postId\":null,\"postCode\":\"222\",\"postCodeLike\":null,\"postName\":\"222\",\"postNameLike\":null,\"postSort\":0,\"status\":\"0\",\"statusDesc\":null,\"userName\":null,\"userId\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"remark\":\"222\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":true,\"code\":200}',0,NULL,'2025-01-13 18:08:20',235),(114,'岗位管理',2,'DI.System.Controllers.SysPostController.Edit','PUT',1,'admin',NULL,'http://localhost:5000/system/post','0.0.0.1','X.X.X.X','{\"post\":{\"postId\":8,\"postCode\":\"222\",\"postCodeLike\":null,\"postName\":\"555\",\"postNameLike\":null,\"postSort\":0,\"status\":\"0\",\"statusDesc\":null,\"userName\":null,\"userId\":null,\"createBy\":\"admin\",\"createTime\":\"2025-01-13T18:08:20\",\"updateBy\":null,\"updateTime\":null,\"remark\":\"222\",\"params\":{\"beginTime\":null,\"endTime\":null,\"dataScopeSql\":null}}}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 18:08:26',236),(115,'岗位管理',3,'DI.System.Controllers.SysPostController.Remove','DELETE',1,'admin',NULL,'http://localhost:5000/system/post/8','0.0.0.1','X.X.X.X','{\"ids\":[8]}','{\"msg\":\"\\u64CD\\u4F5C\\u6210\\u529F.\",\"data\":1,\"code\":200}',0,NULL,'2025-01-13 18:08:29',86);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','董事长',1,'0','admin','2024-12-24 09:03:12','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-12-24 09:03:12','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-12-24 09:03:12','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-12-24 09:03:12','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-12-24 09:03:14','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-12-24 09:03:14','admin','2025-01-13 10:26:47','普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100),(2,101),(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','Admin','00','di@163.com','15888888888','1','','0192023a7bbd73250516f069df18b500','0','0','0.0.0.1','2025-01-13 18:07:35','admin','2024-12-24 09:03:09','',NULL,'管理员'),(2,105,'di','DI','00','di@qq.com','15666666666','1','','0192023a7bbd73250516f069df18b500','0','0','127.0.0.1','2024-12-24 09:03:10','admin','2024-12-24 09:03:10','admin','2025-01-13 16:02:58','测试员222');

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1),(2,1),(2,2),(2,3),(2,4);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

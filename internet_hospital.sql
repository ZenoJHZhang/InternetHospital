/*
Navicat MySQL Data Transfer

Source Server         : 云服务器
Source Server Version : 50642
Source Host           : 47.100.241.49:3306
Source Database       : internet_hospital

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-12-13 17:29:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号(管理员用户名)',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `type` int(11) DEFAULT '0' COMMENT '管理员类型（0：医生管理员 ；1：用户管理员）',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `role` varchar(255) DEFAULT 'admin' COMMENT '权限',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` varchar(32) NOT NULL COMMENT '医院ID',
  `department_number` varchar(64) DEFAULT NULL COMMENT '科室编号',
  `department_name` varchar(64) DEFAULT NULL COMMENT '科室名称',
  `phone` varchar(255) DEFAULT NULL COMMENT '科室电话',
  `img_id` varchar(255) DEFAULT NULL COMMENT '科室图片id',
  `introduce` text COMMENT '科室介绍',
  `count_of_people` varchar(255) DEFAULT NULL COMMENT '科室人数',
  `morning_is_order` varchar(1) DEFAULT '0' COMMENT '上午是否可挂号1为可以0为不可以',
  `morning_source` int(255) DEFAULT '9999' COMMENT '上午号源数',
  `afternoon_is_order` varchar(1) DEFAULT '0' COMMENT '下午是否可挂号1为可以0为不可以',
  `afternoon_source` int(11) DEFAULT '9999' COMMENT '下午号源数',
  `night_is_order` varchar(1) DEFAULT '0' COMMENT '晚上是否可挂号1为可以0为不可以',
  `night_source` int(255) DEFAULT '9999' COMMENT '晚上号源数',
  `price` varchar(255) DEFAULT NULL COMMENT '科室挂号价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_type` char(1) DEFAULT '0' COMMENT '科室类型1为专家科室0为普通科室',
  `sort` int(11) DEFAULT '0' COMMENT '排序  越大越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for diagnose
-- ----------------------------
DROP TABLE IF EXISTS `diagnose`;
CREATE TABLE `diagnose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL COMMENT '问诊记录id',
  `complain` varchar(1024) DEFAULT NULL COMMENT '主诉',
  `present_history` varchar(1024) DEFAULT NULL COMMENT '现病史',
  `past_history` varchar(1024) DEFAULT NULL COMMENT '既往史',
  `allergic_history` varchar(1024) DEFAULT NULL COMMENT '过敏史',
  `first_diagnose` varchar(1024) DEFAULT NULL COMMENT '初步诊断',
  `advice` varchar(1024) DEFAULT '无' COMMENT '诊断意见',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `dispose` varchar(1024) DEFAULT NULL COMMENT '处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2563 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户表id',
  `hospital_id` int(11) DEFAULT NULL COMMENT '所属医院ID',
  `doctor_number` varchar(255) NOT NULL COMMENT '医生工号',
  `doctor_name` varchar(64) DEFAULT NULL COMMENT '医生真实姓名',
  `doctor_id_card` varchar(255) DEFAULT NULL COMMENT '医生身份证',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号(登录账号)',
  `doctor_title` varchar(64) DEFAULT NULL COMMENT '医生职称（医师-医师）',
  `img_id` varchar(255) DEFAULT NULL COMMENT '医生头像id',
  `goodat` varchar(512) DEFAULT '' COMMENT '擅长',
  `dept_num` varchar(32) DEFAULT NULL COMMENT '医生所属科室数量',
  `sort` int(11) DEFAULT '0' COMMENT '排序  越大越前面',
  `star_level` int(1) DEFAULT '3' COMMENT '医生星级',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_doctor_num` (`doctor_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for doctor_department
-- ----------------------------
DROP TABLE IF EXISTS `doctor_department`;
CREATE TABLE `doctor_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `doctor_sort` int(11) DEFAULT '0' COMMENT '医生在科室下的排序越大越靠前',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '医院名称',
  `address` varchar(512) DEFAULT NULL COMMENT '医院地址',
  `postcode` varchar(64) DEFAULT '' COMMENT '医院邮编',
  `tel` varchar(128) DEFAULT '' COMMENT '医院电话',
  `email` varchar(256) DEFAULT NULL COMMENT '医院邮件',
  `records_code` varchar(256) DEFAULT NULL COMMENT '备案号',
  `producers` varchar(256) DEFAULT NULL COMMENT '制作方',
  `copyright` varchar(256) DEFAULT NULL COMMENT '版权方',
  `fault_tel` varchar(128) DEFAULT NULL COMMENT '故障电话',
  `picture` varchar(255) DEFAULT NULL COMMENT '医院缩略图',
  `logo` varchar(256) DEFAULT NULL COMMENT '医院logo',
  `foot_logo` varchar(256) DEFAULT NULL COMMENT '底部logo',
  `app_code` varchar(256) DEFAULT NULL COMMENT 'app二维码',
  `gzh_code` varchar(256) DEFAULT NULL COMMENT '公众号二维码',
  `fwh_code` varchar(256) DEFAULT NULL COMMENT '服务号二维码',
  `fwc_code` varchar(256) DEFAULT NULL COMMENT '服务窗二维码',
  `domain` varchar(255) DEFAULT NULL COMMENT '医院域',
  `level` varchar(16) DEFAULT NULL COMMENT '医院等级：如三级',
  `grade` varchar(16) DEFAULT NULL COMMENT '医院等级：如甲等',
  `introduction` text COMMENT '医院简介',
  `province` varchar(256) DEFAULT NULL COMMENT '医院所在省份',
  `city` varchar(256) DEFAULT NULL COMMENT '医院所在城市',
  `web_site` varchar(512) DEFAULT NULL COMMENT '网站地址',
  `specialty` varchar(1024) DEFAULT NULL COMMENT '特色科室',
  `traffic` varchar(512) DEFAULT NULL COMMENT '交通路线',
  `app_name` varchar(255) DEFAULT NULL,
  `app_url` varchar(255) DEFAULT NULL,
  `app_download` varchar(255) DEFAULT NULL,
  `is_platform` varchar(32) DEFAULT '0' COMMENT '0不是平台，1是平台',
  `is_order` char(1) DEFAULT '1' COMMENT '能否挂号 0不能  1可以',
  `service_tel` varchar(128) DEFAULT NULL COMMENT '客服电话',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `app_doctor_url` varchar(255) DEFAULT NULL COMMENT '打开app医生端连接前缀',
  `app_doctor_download` varchar(255) DEFAULT NULL COMMENT 'app医生端下载地址',
  `statistics_url` varchar(512) DEFAULT '' COMMENT '站长统计script',
  `union_id` int(11) DEFAULT NULL COMMENT '医联体id',
  `hos_bg_type` varchar(11) DEFAULT NULL COMMENT '医院背景类型选择',
  `ca_project_code` varchar(255) DEFAULT NULL COMMENT 'ca签名项目code',
  `keywords` varchar(512) DEFAULT NULL COMMENT '关键词',
  `description` varchar(1024) DEFAULT NULL COMMENT '简介',
  `project_id` int(11) unsigned DEFAULT NULL COMMENT '项目id 公司产品线项目的id 由用户中心分配',
  `user_app_logo` varchar(255) DEFAULT NULL COMMENT '用户手机端Logo',
  `doc_web_logo` varchar(255) DEFAULT NULL COMMENT '网站管理后台左上角logo',
  `push_id` varchar(255) DEFAULT '' COMMENT '腾讯云推送id',
  `quick_reservation_admin_phone` varchar(32) DEFAULT '' COMMENT '快速问诊管理员电话',
  `hospital_role` varchar(128) DEFAULT '患者' COMMENT '用户中心的角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_uuid` varchar(255) NOT NULL COMMENT '图片uuid',
  `suffix` varchar(255) DEFAULT NULL COMMENT '图片后缀',
  `description` varchar(255) DEFAULT NULL COMMENT '图片描述',
  `type` varchar(255) DEFAULT '0' COMMENT '类型 对应文件夹',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for medical
-- ----------------------------
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '药品名字',
  `unit` varchar(255) DEFAULT NULL COMMENT '药品单位',
  `type` int(11) DEFAULT NULL COMMENT '药品类型',
  `price` decimal(10,0) DEFAULT NULL COMMENT '药品单价',
  `norms` varchar(255) DEFAULT NULL COMMENT '规格',
  `origin` varchar(255) DEFAULT '' COMMENT '产地',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for medical_type
-- ----------------------------
DROP TABLE IF EXISTS `medical_type`;
CREATE TABLE `medical_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '药品类型名',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hospital_id` varchar(10) DEFAULT NULL COMMENT '医院id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `type` varchar(10) DEFAULT NULL COMMENT '通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态',
  `content` varchar(255) DEFAULT NULL COMMENT '通知内容',
  `content_data` varchar(255) DEFAULT NULL COMMENT '通知数据，如排班消息的医生id，医院动态的地址等',
  `status` varchar(10) DEFAULT NULL COMMENT '状态0未查看。1已查看  ',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8088 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `reservation_id` int(11) DEFAULT NULL COMMENT '对应的就诊记录id',
  `status` int(5) DEFAULT NULL COMMENT '订单状态',
  `payment` decimal(10,0) DEFAULT NULL COMMENT '订单金额',
  `end_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '订单状态描述',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id，关联user表',
  `id_card` varchar(255) NOT NULL COMMENT '身份证号',
  `real_name` varchar(255) NOT NULL COMMENT '真实姓名',
  `phone` varchar(255) NOT NULL COMMENT '手机号码',
  `birth` varchar(11) DEFAULT NULL COMMENT '出生日期 19961009',
  `sex` int(11) DEFAULT NULL COMMENT '0 ：女 ；1： 男',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recipe
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL COMMENT '问诊记录id',
  `doctor_id` int(11) DEFAULT NULL COMMENT '开处方的医生id',
  `name` varchar(255) DEFAULT NULL COMMENT '处方名称',
  `price` decimal(10,0) DEFAULT NULL COMMENT '处方总价',
  `status` int(10) DEFAULT '0' COMMENT '0未审核，1已审核，2未通过',
  `audit_doctor_id` int(11) DEFAULT NULL COMMENT '处方审核医生id',
  `reason` varchar(255) DEFAULT NULL COMMENT '处方未通过原因原因',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recipe_detail
-- ----------------------------
DROP TABLE IF EXISTS `recipe_detail`;
CREATE TABLE `recipe_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) DEFAULT NULL COMMENT '对应处方id',
  `medical_id` int(11) DEFAULT NULL COMMENT '对应药品id',
  `name` varchar(255) DEFAULT NULL COMMENT '处方名称',
  `amount` varchar(255) DEFAULT NULL COMMENT '药品数量',
  `dosage` varchar(255) DEFAULT NULL COMMENT '剂量（每次服用量）',
  `dosage_unit` varchar(255) DEFAULT NULL,
  `times` varchar(0) DEFAULT NULL COMMENT '用药频次',
  `day` varchar(255) DEFAULT NULL COMMENT '天数',
  `method` varchar(255) DEFAULT NULL COMMENT '用法',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` varchar(64) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL COMMENT '问诊记录ID',
  `doctor_id` varchar(32) DEFAULT NULL COMMENT '医生id',
  `reason` varchar(128) DEFAULT NULL COMMENT '用户退款原因',
  `state` varchar(256) DEFAULT NULL COMMENT '原因说明',
  `refuse` varchar(256) DEFAULT NULL COMMENT '拒绝',
  `price` varchar(12) DEFAULT NULL COMMENT '申请退款金额',
  `agree_price` varchar(12) DEFAULT NULL COMMENT '同意退款金额',
  `patient_name` varchar(64) DEFAULT NULL COMMENT '患者姓名',
  `phone` varchar(32) DEFAULT NULL,
  `dept_name` varchar(32) DEFAULT NULL COMMENT '科室名称',
  `doctor_name` varchar(32) DEFAULT NULL COMMENT '医生名称',
  `clinic_date` varchar(32) DEFAULT NULL COMMENT '就诊日期',
  `clinic_time` varchar(32) DEFAULT NULL COMMENT '就诊时间',
  `time_type` varchar(1) DEFAULT NULL COMMENT '预约时间 1 上午 2 下午 3 晚上',
  `remark` varchar(256) DEFAULT NULL COMMENT '退款备注',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT '0' COMMENT '退款类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for refund_correlation
-- ----------------------------
DROP TABLE IF EXISTS `refund_correlation`;
CREATE TABLE `refund_correlation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL COMMENT '问诊记录ID',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '退款类型,1.微信。2.支付宝',
  `pay_status` varchar(255) DEFAULT '0' COMMENT '退款状态：1退款中  2退款成功  3退款失败',
  `total_payment` varchar(255) DEFAULT NULL COMMENT '价格',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '支付宝或微信的流水号',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(32) DEFAULT '1' COMMENT '是否删除 0.删除  1.未删除''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL COMMENT '问诊记录id',
  `type` char(10) DEFAULT '1' COMMENT '报告单类型 1 检查单，2检验单',
  `name` varchar(512) DEFAULT NULL COMMENT '项目名称',
  `report_time` varchar(64) DEFAULT '无' COMMENT '检查时间',
  `address` varchar(64) DEFAULT '无' COMMENT '地点',
  `remark` varchar(256) DEFAULT '无' COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `price` varchar(64) DEFAULT NULL COMMENT '费用',
  `time1` varchar(64) DEFAULT NULL COMMENT '预约时间1',
  `time2` varchar(64) DEFAULT NULL COMMENT '预约时间2',
  `time3` varchar(64) DEFAULT NULL COMMENT '预约时间3',
  `status` varchar(10) DEFAULT '0' COMMENT '0表示没有预约处理,1表示预约成功,2表示预约失败',
  `doc_app` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1692 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL COMMENT '权限',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schedule_department
-- ----------------------------
DROP TABLE IF EXISTS `schedule_department`;
CREATE TABLE `schedule_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hospital_id` varchar(64) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL COMMENT '科室ID',
  `morning_has` char(10) DEFAULT '0' COMMENT '上午是否有门诊1有0无',
  `morning_stop` char(10) DEFAULT '0' COMMENT '早上是否停诊 0不停诊 1停诊',
  `afternoon_has` char(10) DEFAULT '0' COMMENT '中午是否有门诊1有0无',
  `afternoon_stop` char(10) DEFAULT '0' COMMENT '下午是否停诊 0不停诊 1停诊',
  `night_has` char(10) DEFAULT '0' COMMENT '晚上是否有门诊1有0无',
  `night_stop` char(10) DEFAULT '0' COMMENT '晚上是否停诊 0不停诊 1停诊',
  `morning_number` int(11) DEFAULT '0' COMMENT '科室上午号源',
  `afternoon_number` int(11) DEFAULT '0' COMMENT '科室下午号源',
  `night_number` int(11) DEFAULT '0' COMMENT '科室晚上号源',
  `morning_total_number` int(11) DEFAULT '0' COMMENT '早上总号源',
  `afternoon_total_number` int(11) DEFAULT '0' COMMENT '下午总号源',
  `night_total_number` int(11) DEFAULT '0' COMMENT '晚上总号源',
  `schedule_time` varchar(255) DEFAULT NULL COMMENT '排班时间(2018-05-06)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `hosID` (`hospital_id`),
  KEY `time` (`schedule_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schedule_doctor
-- ----------------------------
DROP TABLE IF EXISTS `schedule_doctor`;
CREATE TABLE `schedule_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_department_id` int(11) DEFAULT NULL COMMENT '科室排班id',
  `department_id` int(10) DEFAULT NULL COMMENT '科室id',
  `department_name` varchar(255) DEFAULT NULL COMMENT '科室名字',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生id',
  `doctor_morning_has` varchar(255) DEFAULT NULL,
  `doctor_afternoon_has` varchar(255) DEFAULT NULL,
  `doctor_night_has` varchar(255) DEFAULT NULL,
  `schedule_time` varchar(255) DEFAULT NULL COMMENT '排班时间',
  `doctor_morning_number` int(10) DEFAULT NULL,
  `doctor_afternoon_number` int(10) DEFAULT NULL,
  `doctor_night_number` int(10) DEFAULT NULL,
  `doctor_morning_total_number` int(10) DEFAULT NULL,
  `doctor_afternoon_total_number` int(10) DEFAULT NULL,
  `doctor_night_total_number` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for season_time
-- ----------------------------
DROP TABLE IF EXISTS `season_time`;
CREATE TABLE `season_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` varchar(32) DEFAULT NULL COMMENT '医院ID',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `start_date` varchar(16) DEFAULT NULL COMMENT '开始日期',
  `end_date` varchar(16) DEFAULT NULL COMMENT '结束日期',
  `sw_start` varchar(32) DEFAULT NULL COMMENT '早上开始时间',
  `sw_end` varchar(32) DEFAULT NULL COMMENT '早上结束时间',
  `xw_start` varchar(32) DEFAULT NULL COMMENT '下午开始时间',
  `xw_end` varchar(32) DEFAULT NULL COMMENT '下午结束时间',
  `ws_start` varchar(32) DEFAULT NULL COMMENT '晚上开始时间',
  `ws_end` varchar(32) DEFAULT NULL COMMENT '晚上结束时间',
  `yb_start` varchar(32) DEFAULT NULL COMMENT '夜班开始',
  `yb_end` varchar(32) DEFAULT NULL COMMENT '夜班结束',
  `is_delete` varchar(2) DEFAULT '1' COMMENT '1:未删除 0：删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `tmp1` varchar(255) DEFAULT NULL,
  `tmp2` varchar(255) DEFAULT NULL,
  `tmp3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21406 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` varchar(11) NOT NULL COMMENT '手机号（用户登录名）',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sex` int(11) DEFAULT NULL COMMENT '0 ：女 ；1： 男',
  `role_id` int(11) DEFAULT NULL COMMENT '用户权限id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_reservation
-- ----------------------------
DROP TABLE IF EXISTS `user_reservation`;
CREATE TABLE `user_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `patient_id` int(11) DEFAULT NULL COMMENT '就诊人id',
  `patient_name` varchar(32) DEFAULT NULL COMMENT '患者姓名',
  `hospital_id` int(11) DEFAULT NULL COMMENT '医院id',
  `schedule_doctor_id` int(11) DEFAULT NULL COMMENT '排班的医生ID',
  `type` varchar(5) DEFAULT NULL COMMENT ' 预约类型 1普通挂号 2普通预约 3 专家预约 ',
  `doctor_id` varchar(64) DEFAULT NULL COMMENT '医生id',
  `doctor_name` varchar(128) DEFAULT NULL COMMENT '医生姓名',
  `depart_id` int(11) DEFAULT NULL COMMENT '科室id',
  `depart_name` varchar(128) DEFAULT NULL COMMENT '科室名称',
  `reg_no` varchar(11) DEFAULT NULL COMMENT '就诊序号(对应医生就诊序号)',
  `clinic_time` varchar(128) DEFAULT NULL COMMENT '就诊时间,根据令时得出（12:00-18:00）',
  `clinic_date` varchar(128) DEFAULT NULL COMMENT '就诊日期',
  `time_interval` varchar(255) DEFAULT NULL COMMENT '预约时间段 上午  下午 晚上',
  `start_time` datetime DEFAULT NULL COMMENT '问诊开始时间',
  `finish_time` datetime DEFAULT NULL COMMENT '问诊结束时间',
  `status` char(2) DEFAULT '1' COMMENT '问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）',
  `condition_desc` text CHARACTER SET utf8mb4 COMMENT '病情描述',
  `erro_msg` varchar(256) DEFAULT NULL COMMENT '取号返回的错误信息（预约/挂号）',
  `user_reservation_img_id` varchar(64) DEFAULT NULL COMMENT '就诊记录图片id',
  `is_click` varchar(255) DEFAULT '0' COMMENT '是否被点击查看0未被，1已被点击',
  `is_evaluate` varchar(255) DEFAULT '0' COMMENT '是否评价，0未评价，1已评价',
  `clinic_pay_status` varchar(255) DEFAULT '0' COMMENT '挂号费支付状态',
  `recipe_pay_status` varchar(255) DEFAULT '0' COMMENT '处方支付状态 0未支付 1已支付',
  `clinic_price` decimal(10,0) DEFAULT NULL COMMENT '挂号费',
  `recipe_number` int(10) DEFAULT NULL COMMENT '问诊包含的处方单数量',
  `recipe_price` decimal(10,0) DEFAULT NULL COMMENT '处方费（所有处方的总费用）',
  `total_price` varchar(255) DEFAULT NULL COMMENT '总费用(挂号处方)',
  `is_audit` varchar(255) DEFAULT '0' COMMENT '处方是否审核  0未审核，1已审核',
  `audit_status` varchar(255) DEFAULT '1' COMMENT '处方审核状态 1不通过 2已通过',
  `is_read` varchar(255) DEFAULT '0' COMMENT '是否可以编辑处方 1可以 0不可以',
  `reason` varchar(512) DEFAULT NULL COMMENT '处方审核不通过的原因',
  `reason_skip` varchar(255) DEFAULT NULL COMMENT '医生设置过号的原因',
  `is_return_visit` varchar(2) DEFAULT '0' COMMENT '是否为复诊患者,0不是1是',
  `call_number_time` datetime DEFAULT NULL COMMENT '叫号时间',
  `repulse` varchar(10) DEFAULT '0' COMMENT '1拒绝退款，0未拒绝',
  `cancel_reason` varchar(512) DEFAULT NULL COMMENT '取消就诊原因',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `first_waitroom` varchar(10) DEFAULT '1' COMMENT '是否第一次进入候诊间 0不是 1是',
  `clinic_type` varchar(255) DEFAULT NULL COMMENT '诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_hospital_id` (`hospital_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_reservation_img
-- ----------------------------
DROP TABLE IF EXISTS `user_reservation_img`;
CREATE TABLE `user_reservation_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_reservation_id` int(11) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_reservation_status
-- ----------------------------
DROP TABLE IF EXISTS `user_reservation_status`;
CREATE TABLE `user_reservation_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

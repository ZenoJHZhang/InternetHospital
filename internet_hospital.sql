/*
Navicat MySQL Data Transfer

Source Server         : 云服务器
Source Server Version : 50642
Source Host           : 47.100.241.49:3306
Source Database       : internet_hospital

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-01-02 14:57:00
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
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '666', '普通科室', '13877777777', '1', null, '1', '1', '9999', '1', '9999', '1', '9999', '0.00', '2018-11-20 10:30:14', '2018-11-20 10:30:17', '0', '0');
INSERT INTO `department` VALUES ('2', '777', '普通科室2', '13877777771', '1', null, '1', '1', '9999', '1', '9999', '1', '9999', '0.00', '2018-11-21 11:25:30', '2018-11-21 11:25:32', '0', '0');
INSERT INTO `department` VALUES ('3', '888', '专家科室', '13877777772', '1', null, '1', '1', '9999', '1', '9999', '1', '9999', '0.00', '2018-11-26 09:18:03', '2018-11-26 09:18:05', '1', '0');
INSERT INTO `department` VALUES ('4', '999', '专家科室2', '13877777773', '1', null, '0', '1', '9999', '1', '9999', '1', '9999', '0.00', '2018-11-26 15:44:02', '2018-11-26 15:44:04', '1', '0');

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
-- Records of diagnose
-- ----------------------------
INSERT INTO `diagnose` VALUES ('195', '2414', '主诉', '现病史', '既往史', null, '埃博拉病毒病鞍背脑膜瘤ABPA(变态反应性支气管肺曲霉菌', '诊断意见', '2016-09-13 09:29:41', null, null);
INSERT INTO `diagnose` VALUES ('196', '2439', '滴滴滴的', '发发发', '饱不抱', null, '饱不抱', '饱不抱', '2016-09-29 19:19:25', null, null);
INSERT INTO `diagnose` VALUES ('197', '2447', '每天早上起来胸口中间的骨头疼，持续一周多', '每天早上起来胸口中间的骨头疼，持续一周多', '', null, '肌肉急性拉伤', '肌肉急性拉伤所致，服用三七片，维生素C片，丹参片', '2016-10-12 09:41:33', null, null);
INSERT INTO `diagnose` VALUES ('198', '2448', 'ddd', 'd', 'd', null, 'ddd', 'd', '2016-10-12 13:03:05', null, null);
INSERT INTO `diagnose` VALUES ('199', '2449', '喉咙疼痛1周，胸痛伴发热1天。', '患者1周前无明显诱因下出现喉咙疼痛，当时无发热，无咳嗽咳痰，无胸闷气急，无畏寒寒战，无头晕头痛，当时未重视，未治疗，自感疼痛逐渐好转，1天前，患者出现明显吸气时胸部疼痛，深吸气明显加重，疼痛有逐渐加重趋势，伴畏寒发热，体温最高38.3℃，无寒战抽搐，无呼吸困难，今由家人陪同下来我院，门诊拟“发热原因待查：肺炎”收治入院。', '患者既往有哮喘病史，近期无再发。', null, '1、发热原因待查：肺炎首先考虑 肺结核可能；2、胸膜炎可能。', '肺炎（双侧） 有局限支扩感染可能（慢性）。', '2016-10-12 13:09:41', null, null);
INSERT INTO `diagnose` VALUES ('200', '2451', '11', '11', '11', null, '11', '11', '2016-10-12 16:18:42', null, null);
INSERT INTO `diagnose` VALUES ('201', '2463', '视物不清3天', '测试', '', null, '测试', '', '2016-10-14 15:03:46', null, null);
INSERT INTO `diagnose` VALUES ('202', '2465', '双眼发痒1周', '双眼发痒1周', '', null, '结膜炎', '', '2016-10-14 15:36:23', null, null);
INSERT INTO `diagnose` VALUES ('203', '2475', 'd', 'dd', 'd', null, 'd', 'd', '2016-10-15 19:23:50', null, null);
INSERT INTO `diagnose` VALUES ('204', '2476', 'ff', 'fff', 'f', null, 'f', 'ff', '2016-10-15 19:45:52', null, null);
INSERT INTO `diagnose` VALUES ('205', '2477', 'eq2e', 'q2eqeq2', '', null, '鞍鼻', '', '2016-10-15 19:54:36', null, null);
INSERT INTO `diagnose` VALUES ('206', '2478', 'wwa', 'adadawda', '', null, '癌病恐怖', '', '2016-10-15 19:55:51', null, null);
INSERT INTO `diagnose` VALUES ('207', '2483', '11', '11', '', null, '鞍背脑膜瘤', '', '2016-10-17 09:50:09', null, null);
INSERT INTO `diagnose` VALUES ('208', '2499', '头痛', '头痛', '', null, '艾迪生病', '', '2016-10-18 09:50:16', null, null);
INSERT INTO `diagnose` VALUES ('209', '2500', '头疼', '无精打采', '', null, '安定中毒', '', '2016-10-18 10:05:19', null, null);
INSERT INTO `diagnose` VALUES ('210', '2534', 'd', 'ddd', '', null, '埃博拉病毒病(Ebola)(其他病毒性出血热)', '', '2016-10-24 20:54:07', null, null);
INSERT INTO `diagnose` VALUES ('211', '2537', '头疼、头晕', '失眠多梦', '', null, '安定意外中毒', '', '2016-10-25 10:40:48', null, null);
INSERT INTO `diagnose` VALUES ('212', '2536', '呜呜呜呜呜呜呜呜呜呜呜呜', '的顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶大', '', null, '爱伯斯坦氏异常[埃布施泰因异常]', '', '2016-10-25 10:59:28', null, null);
INSERT INTO `diagnose` VALUES ('213', '2541', 'XSCZX', 'DAF ', '', null, '澳大利亚脑炎', '我潇洒', '2016-10-25 14:30:09', null, null);
INSERT INTO `diagnose` VALUES ('214', '2548', '眼红', '眼红眼红眼红', '眼红', null, '埃博拉病毒病(Ebola)(其他病毒性出血热)', '及时到医院就诊', '2016-10-26 10:57:58', null, null);
INSERT INTO `diagnose` VALUES ('215', '2549', '呵呵哈哈哈', '方式是是是试试事实上事实上', '请问', null, '癌病', '我不开药', '2016-10-26 11:07:17', null, null);
INSERT INTO `diagnose` VALUES ('216', '2553', '药不能停药不能停', '药不能停药不能停药不能停药不能停', '药不能停', null, '癌,间变的,NOS', '药不能停', '2016-10-26 14:58:58', null, null);
INSERT INTO `diagnose` VALUES ('217', '2551', '无', '无', '无', null, '哈哈哈哈', '无', '2016-10-26 15:30:12', null, null);
INSERT INTO `diagnose` VALUES ('218', '2551', '无', '无', '无', null, '哈哈哈哈', '无', '2016-10-26 15:31:53', null, null);
INSERT INTO `diagnose` VALUES ('219', '2554', '名字', '无', '无', null, '脑子秀逗', '无', '2016-10-26 15:41:21', null, null);
INSERT INTO `diagnose` VALUES ('220', '2557', '53去', ' saFe', ' ', null, '肺炎', '3我', '2016-10-26 15:59:30', null, null);
INSERT INTO `diagnose` VALUES ('221', '2562', '经常胃疼，轻微发热', '暂无', '暂无', null, '感冒', '多喝热水', '2016-11-02 09:23:15', null, null);
INSERT INTO `diagnose` VALUES ('222', '2576', '啊', '啊', '1', null, '1', '1', '2016-11-03 10:32:22', null, null);
INSERT INTO `diagnose` VALUES ('223', '2589', '头痛3天', '感冒', '无', null, '感冒', '流行性感冒3天', '2016-11-07 15:57:31', null, null);
INSERT INTO `diagnose` VALUES ('224', '2590', '头痛3天', '头痛3天', '无', null, '流行性感冒', '流行性感冒', '2016-11-07 17:11:47', null, null);
INSERT INTO `diagnose` VALUES ('225', '2591', '头痛3天', '头痛3天', '无', null, '流行性感冒', '多喝水', '2016-11-08 11:05:59', null, null);
INSERT INTO `diagnose` VALUES ('226', '2593', '医院医院也要也要一月又一月一月又一月一月又一月', '个灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌个', '', null, '爱伯斯坦氏异常[埃布施泰因异常]', '', '2016-11-09 14:41:53', null, null);
INSERT INTO `diagnose` VALUES ('227', '2595', 'ada', 'adwawd', '', null, '鞍鼻', '', '2016-11-16 19:31:43', null, null);
INSERT INTO `diagnose` VALUES ('228', '2596', '我我我我我我我我我我我我我我我我无', '的订单顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶多多多多多多多', '', null, '发发发方法反反复复凤飞飞反复反复反复反复飞飞方法反反复复凤飞飞反复反复反复反复', '迟迟吃吃迟迟吃吃擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦错错错错错错错错错错错错错错错错错错错错错错错错错错错错错', '2016-11-17 14:17:21', null, null);
INSERT INTO `diagnose` VALUES ('229', '2682', '发发发飞飞方法反反复复凤飞飞反复反复反复反复', '草草草迟迟吃吃擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦', '', null, '不不不不不不不不不不不不不不不不不不不不不不不不不不不不不', '', '2016-12-01 16:39:58', null, null);
INSERT INTO `diagnose` VALUES ('230', '2689', 's', 'adasdasd', '', null, '鞍背脑膜瘤', '', '2016-12-01 20:31:09', null, null);
INSERT INTO `diagnose` VALUES ('231', '2680', '的顶顶顶顶顶顶顶顶顶大大大多多', '方法反反复复凤飞飞反复反复反复反复', '', null, '癌病恐怖', '', '2016-12-02 11:33:54', null, null);
INSERT INTO `diagnose` VALUES ('232', '2712', '测试', '测试', '', null, '癌', '', '2016-12-06 16:09:02', null, null);
INSERT INTO `diagnose` VALUES ('233', '2714', 'ce', 'ceshi', '', null, '癌', '', '2016-12-07 09:35:22', null, null);
INSERT INTO `diagnose` VALUES ('234', '2725', '无', '无', '无', null, '无', null, '2016-12-12 21:18:30', null, null);
INSERT INTO `diagnose` VALUES ('235', '2725', '无', '无', '无', null, '无', null, '2016-12-12 21:48:47', null, null);
INSERT INTO `diagnose` VALUES ('236', '2748', '无', '无', '无', null, '结膜炎', null, '2016-12-14 11:10:59', null, null);
INSERT INTO `diagnose` VALUES ('237', '2748', '无', '无', '无', null, '结膜炎', '无', '2016-12-14 11:27:03', null, null);
INSERT INTO `diagnose` VALUES ('238', '2748', '无', '无', '无', null, '结膜炎', null, '2016-12-14 11:39:07', null, null);
INSERT INTO `diagnose` VALUES ('239', '2748', '无', '无', '无', null, '结膜炎', null, '2016-12-14 11:50:18', null, null);
INSERT INTO `diagnose` VALUES ('240', '2748', '无', '无', '无', null, '结膜炎', '无', '2016-12-14 11:51:57', null, null);
INSERT INTO `diagnose` VALUES ('241', '2748', '无', '无', '无', null, '结膜炎', '无', '2016-12-14 13:08:37', null, null);
INSERT INTO `diagnose` VALUES ('242', '2750', '无', '无', '无', null, '无', '无', '2016-12-14 13:40:24', null, null);
INSERT INTO `diagnose` VALUES ('243', '2749', '无', '无', '无', null, '无', '无', '2016-12-14 13:41:02', null, null);
INSERT INTO `diagnose` VALUES ('244', '2749', '无', '无', '无', null, '无', '无', '2016-12-14 13:41:23', null, null);
INSERT INTO `diagnose` VALUES ('245', '2748', '无', '无', '无', null, '结膜炎', '无', '2016-12-14 13:42:21', null, null);
INSERT INTO `diagnose` VALUES ('246', '2749', '无', '无', '无', null, '无', '无', '2016-12-14 14:03:15', null, null);
INSERT INTO `diagnose` VALUES ('247', '2750', '无', '无', '无', null, '无', '无', '2016-12-14 14:03:23', null, null);
INSERT INTO `diagnose` VALUES ('248', '2748', '无', '无', '无', null, '结膜炎', '无', '2016-12-15 10:13:17', null, null);
INSERT INTO `diagnose` VALUES ('249', '2770', '无', '无', '无', null, '咳嗽', '无', '2016-12-15 10:14:18', null, null);
INSERT INTO `diagnose` VALUES ('250', '2770', '无', '无', '无', null, '咳嗽', '无', '2016-12-15 10:14:38', null, null);
INSERT INTO `diagnose` VALUES ('251', '2777', '无', '无', '无', null, '无', '无', '2016-12-15 18:29:56', null, null);
INSERT INTO `diagnose` VALUES ('252', '2777', '无', '无', '无', null, '无', '无', '2016-12-15 18:30:12', null, null);
INSERT INTO `diagnose` VALUES ('253', '2777', '无', '无', '无', null, '无', '无', '2016-12-15 18:31:06', null, null);
INSERT INTO `diagnose` VALUES ('254', '2777', '无', '无', '无', null, '无', '无', '2016-12-15 18:31:28', null, null);
INSERT INTO `diagnose` VALUES ('255', '2781', '无', '无', '无', null, '咳嗽', '无', '2016-12-16 10:29:45', null, null);
INSERT INTO `diagnose` VALUES ('256', '2781', '无', '无', '无', null, '咳嗽', '无', '2016-12-16 10:30:18', null, null);
INSERT INTO `diagnose` VALUES ('257', '2781', '无', '无', '无', null, '咳嗽', '无', '2016-12-16 15:52:34', null, null);
INSERT INTO `diagnose` VALUES ('258', '2781', '无', '无', '无', null, '咳嗽', '无', '2016-12-16 17:58:42', null, null);
INSERT INTO `diagnose` VALUES ('259', '2800', '无', '无', '无', null, '咳嗽', '无', '2016-12-16 19:03:58', null, null);
INSERT INTO `diagnose` VALUES ('260', '2800', '无', '无', '无', null, '咳嗽', '无', '2016-12-16 19:04:13', null, null);
INSERT INTO `diagnose` VALUES ('261', '2805', '无', '无', '无', null, '高血压病', '无', '2016-12-16 23:54:20', null, null);
INSERT INTO `diagnose` VALUES ('262', '2805', '无', '无', '无', null, '高血压病', '无', '2016-12-16 23:56:24', null, null);
INSERT INTO `diagnose` VALUES ('263', '2810', '无', '无', '无', null, '无', '无', '2016-12-17 08:14:47', null, null);
INSERT INTO `diagnose` VALUES ('264', '2811', '无', '无', '无', null, '高血压病', '无', '2016-12-17 08:25:13', null, null);
INSERT INTO `diagnose` VALUES ('265', '2811', '无', '无', '无', null, '高血压病', '无', '2016-12-17 08:25:16', null, null);
INSERT INTO `diagnose` VALUES ('266', '2811', '无', '无', '无', null, '高血压病', '无', '2016-12-17 08:25:27', null, null);
INSERT INTO `diagnose` VALUES ('267', '2827', '无', '无', '无', null, '头痛', '无', '2016-12-17 11:31:43', null, null);
INSERT INTO `diagnose` VALUES ('268', '2827', '无', '无', '无', null, '头痛,高血压病', '无', '2016-12-17 11:32:51', null, null);
INSERT INTO `diagnose` VALUES ('269', '2827', '无', '无', '无', null, '头痛,高血压病', '无', '2016-12-17 11:33:43', null, null);
INSERT INTO `diagnose` VALUES ('270', '2844', 'ff', 'fffffff', '', null, '癌病恐怖', '', '2016-12-19 17:54:52', null, null);
INSERT INTO `diagnose` VALUES ('271', '2855', '哇哇哇哇哇哇哇哇无', '的顶顶顶顶顶顶顶顶顶大大大多', '', null, 'ABO血型不合', '', '2016-12-20 14:08:20', null, null);
INSERT INTO `diagnose` VALUES ('272', '2882', 'ddddddddd的顶顶顶顶顶顶顶顶顶大大大多', '吃吃吃擦擦迟迟吃吃才踩踩踩踩踩踩从', '', null, '癌病恐怖', '', '2016-12-23 14:02:45', null, null);
INSERT INTO `diagnose` VALUES ('273', '2873', '11', '11', '', null, 'ABO血型不合', '', '2016-12-23 14:11:34', null, null);
INSERT INTO `diagnose` VALUES ('274', '2886', 'dd', 'dd', '', null, '鞍鼻', '', '2016-12-23 15:31:21', null, null);
INSERT INTO `diagnose` VALUES ('275', '2889', '水水水水水水水水', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '', null, '爱伯斯坦氏异常[埃布施泰因异常]', '', '2016-12-23 16:02:08', null, null);
INSERT INTO `diagnose` VALUES ('276', '2896', '11', '11', '', null, 'ABO血型不配合性反应', '', '2016-12-26 14:30:17', null, null);
INSERT INTO `diagnose` VALUES ('277', '2899', '测试', '测试', '', null, '安定中毒', '', '2016-12-26 14:36:24', null, null);
INSERT INTO `diagnose` VALUES ('278', '2901', '测试', '11', '', null, '阿尔茨海默病伴晚期发病', '', '2016-12-26 14:53:08', null, null);
INSERT INTO `diagnose` VALUES ('279', '2920', '11', '11', '', null, '奥迪括约肌痉挛', '', '2016-12-27 10:58:05', null, null);
INSERT INTO `diagnose` VALUES ('280', '2925', '测试', '测试', '', null, '阿尔茨海默病', '', '2016-12-27 13:17:37', null, null);
INSERT INTO `diagnose` VALUES ('281', '2921', '11', '11', '', null, '艾迪生病危象', '', '2016-12-27 13:23:40', null, null);
INSERT INTO `diagnose` VALUES ('282', '2932', '11', '11', '', null, 'ABPA(变态反应性支气管肺曲霉菌', '', '2016-12-28 15:52:16', null, null);
INSERT INTO `diagnose` VALUES ('283', '2929', '测试', '测试', '', null, '埃布斯坦异常', '', '2016-12-28 15:54:05', null, null);
INSERT INTO `diagnose` VALUES ('284', '2937', '11', '11', '', null, '艾迪生病危象', '', '2016-12-28 16:13:52', null, null);
INSERT INTO `diagnose` VALUES ('285', '2940', '测试', '测试', '', null, '安定中毒', '', '2016-12-29 09:37:10', null, null);
INSERT INTO `diagnose` VALUES ('286', '2942', '测试', '测试', '', null, '艾迪生病', '', '2016-12-29 15:28:16', null, null);
INSERT INTO `diagnose` VALUES ('287', '2946', '感冒 发烧 ', '经常咳嗽，并伴有流鼻涕现象', '', null, '氨茶碱药物反应', '多喝热水', '2016-12-29 17:03:27', null, null);
INSERT INTO `diagnose` VALUES ('288', '2943', '11', '11', '', null, '奥迪括约肌狭窄', '', '2016-12-29 17:04:22', null, null);
INSERT INTO `diagnose` VALUES ('289', '2948', '11', '11', '', null, '艾迪生病危象', '', '2016-12-29 17:05:10', null, null);
INSERT INTO `diagnose` VALUES ('290', '2944', '11', '11', '', null, 'ABO血型不配合性反应', '', '2016-12-30 16:51:15', null, null);
INSERT INTO `diagnose` VALUES ('291', '2945', '测试', '测试', '', null, '奥迪括约肌痉挛', '', '2016-12-30 16:52:14', null, null);
INSERT INTO `diagnose` VALUES ('292', '2951', '测试', '测试', '', null, '艾迪生病危象', '', '2016-12-30 16:53:06', null, null);
INSERT INTO `diagnose` VALUES ('293', '2967', '1', '2', '3', null, '鞍部脑膜瘤', '', '2017-01-03 19:30:25', null, null);
INSERT INTO `diagnose` VALUES ('294', '2973', '111', '111', '', null, '鞍鼻', '', '2017-01-04 09:35:53', null, null);
INSERT INTO `diagnose` VALUES ('295', '2972', '飞洒', '飞洒发', '萨芬萨芬', null, '癌病鞍鼻鞍部脑膜瘤', '上帝发誓', '2017-01-04 10:05:56', null, null);
INSERT INTO `diagnose` VALUES ('296', '2976', '测试', '测试', '', null, '安定中毒', '', '2017-01-04 10:06:46', null, null);
INSERT INTO `diagnose` VALUES ('297', '2977', 'fdsadf', 'ssd', '', null, '鞍鼻', '', '2017-01-04 10:38:40', null, null);
INSERT INTO `diagnose` VALUES ('298', '3016', '发生法', '飞洒地方士大夫', '', null, '埃博拉病毒病(Ebola)(其他病毒性出血热)', '', '2017-01-05 10:29:19', null, null);
INSERT INTO `diagnose` VALUES ('299', '3018', '的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '草草草擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦车错错', '', null, 'ABO血型不合', '', '2017-01-05 10:35:31', null, null);
INSERT INTO `diagnose` VALUES ('300', '3023', '胜多负少是', '发的我方违反', '', null, '鞍鼻', '', '2017-01-05 12:03:06', null, null);
INSERT INTO `diagnose` VALUES ('301', '2750', '无', '无', '无', null, '无', '无', '2017-01-05 16:36:29', null, null);
INSERT INTO `diagnose` VALUES ('302', '2749', '无', '无', '无', null, '无', '无', '2017-01-05 16:37:10', null, null);
INSERT INTO `diagnose` VALUES ('303', '2749', '无', '无', '无', null, '无', '无', '2017-01-05 16:37:11', null, null);
INSERT INTO `diagnose` VALUES ('304', '2749', '无', '无', '无', null, '无', '无', '2017-01-05 16:37:13', null, null);
INSERT INTO `diagnose` VALUES ('305', '2749', '无', '无', '无', null, '无', '无', '2017-01-05 16:37:40', null, null);
INSERT INTO `diagnose` VALUES ('306', '3031', 'h', 'h', '', null, '氨茶碱药物反应', '', '2017-01-06 15:32:32', null, null);
INSERT INTO `diagnose` VALUES ('307', '3035', '浦江测试', '浦江测试', '', null, '奥迪括约肌痉挛', '', '2017-01-07 15:46:27', null, null);
INSERT INTO `diagnose` VALUES ('308', '3041', '发放', '幅度萨芬萨芬萨芬', '', null, '埃博拉病毒病(Ebola)(其他病毒性出血热)', '', '2017-01-07 16:29:32', null, null);
INSERT INTO `diagnose` VALUES ('309', '3042', '产品测试', '产品测试', '', null, 'ABO血型不配合性反应', '', '2017-01-07 17:15:29', null, null);
INSERT INTO `diagnose` VALUES ('310', '3045', 'a', 'sa', '', null, '鞍背脑膜瘤', '', '2017-01-07 17:16:39', null, null);
INSERT INTO `diagnose` VALUES ('311', '3046', '产品测试', '产品测试', '产品测试产品测试', null, '鞍背脑膜瘤', '', '2017-01-07 17:24:50', null, null);
INSERT INTO `diagnose` VALUES ('312', '3063', '飞洒发', '飞洒飞洒发', '', null, '爱伯斯坦氏异常[埃布施泰因异常]', '', '2017-01-10 09:33:52', null, null);
INSERT INTO `diagnose` VALUES ('313', '3065', '5166', '46846465', '', null, '癌病', '', '2017-01-10 16:00:30', null, null);
INSERT INTO `diagnose` VALUES ('314', '3066', '11', '11', '', null, '艾迪生病危象', '', '2017-01-10 16:24:49', null, null);
INSERT INTO `diagnose` VALUES ('315', '3068', '测试', '测试', '', null, '安定中毒', '', '2017-01-10 16:37:32', null, null);
INSERT INTO `diagnose` VALUES ('316', '3094', '下午测试', '候诊间', '', null, '埃博拉病毒病(Ebola)(其他病毒性出血热)', '', '2017-01-11 13:57:33', null, null);
INSERT INTO `diagnose` VALUES ('317', '3096', '太卡几块了', '玻璃胶', '考虑咯啦咯考虑兔兔', null, '考虑咯啦咯考虑兔兔', '考虑咯啦咯考虑兔兔', '2017-01-11 14:01:15', null, null);
INSERT INTO `diagnose` VALUES ('318', '3098', '扣扣', '可可怜啦咯啦', 'KKK哦就', null, '快乐哦咯', 'JBL度JJ', '2017-01-11 14:03:54', null, null);
INSERT INTO `diagnose` VALUES ('319', '2800', '无', '无', '无', null, '咳嗽', '无', '2017-01-11 14:59:28', null, null);
INSERT INTO `diagnose` VALUES ('320', '2805', '无', '无', '无', null, '单心房,高血压病', '无', '2017-01-11 14:59:35', null, null);
INSERT INTO `diagnose` VALUES ('321', '2811', '无', '无', '无', null, '高血压病', '无', '2017-01-11 14:59:43', null, null);
INSERT INTO `diagnose` VALUES ('322', '3101', '术后康复', '腿骨骨折', '', null, '术后免疫治疗', '', '2017-01-11 16:06:46', null, null);
INSERT INTO `diagnose` VALUES ('323', '3102', '无', '无', '无', null, '萝莉控', '无', '2017-01-11 17:01:35', null, null);
INSERT INTO `diagnose` VALUES ('324', '3106', '无', '无', '无', null, '头疼脑热', '多喝热水', '2017-01-12 09:14:31', null, null);
INSERT INTO `diagnose` VALUES ('325', '3109', '无', '无', '无', null, '头疼脑热', '无', '2017-01-12 09:19:55', null, null);
INSERT INTO `diagnose` VALUES ('326', '3113', '浦江测试1', '浦江测试1', '', null, '艾迪生病危象', '', '2017-01-12 09:57:09', null, null);
INSERT INTO `diagnose` VALUES ('327', '3114', '111', '1111', '11', null, '奥迪括约肌痉挛埃博拉病毒病同胞竞争障碍', '', '2017-01-12 10:13:30', null, null);
INSERT INTO `diagnose` VALUES ('328', '3139', '无', '无', '无', null, 'Tt', 'Ggyff', '2017-01-12 13:49:12', null, null);
INSERT INTO `diagnose` VALUES ('329', '3146', '疯疯癫癫', '疯疯癫癫', '幅度达到', null, '埃博拉病毒病埃博拉病毒病', '疯疯癫癫', '2017-01-12 15:07:59', null, null);
INSERT INTO `diagnose` VALUES ('330', '3150', 'fdsadf', 'fsadfsafd', '', null, '癌病恐怖', '', '2017-01-12 15:46:43', null, null);
INSERT INTO `diagnose` VALUES ('331', '3150', 'fdsadf', 'fsadfsafd', '', null, '癌病恐怖', '', '2017-01-12 15:46:43', null, null);
INSERT INTO `diagnose` VALUES ('332', '3160', '测试', '测试', '', null, '测试', '', '2017-01-16 11:58:15', null, null);
INSERT INTO `diagnose` VALUES ('333', '3161', '测试3', '测试3', '', null, '测试3', '', '2017-01-16 14:20:21', null, null);
INSERT INTO `diagnose` VALUES ('334', '3169', '破文件大酒店', '打我的娃', '', null, '癌病', '', '2017-01-16 17:37:57', null, null);
INSERT INTO `diagnose` VALUES ('335', '3175', '飞洒发', '发士大夫', '', null, '癌病恐怖', '', '2017-01-17 09:42:45', null, null);
INSERT INTO `diagnose` VALUES ('336', '3171', '测试', '测试', '', null, '测试', '', '2017-01-17 09:53:37', null, null);
INSERT INTO `diagnose` VALUES ('337', '3167', '测试', '测', '', null, '测试', '', '2017-01-17 09:58:55', null, null);
INSERT INTO `diagnose` VALUES ('338', '3176', '发士大夫', '幅度萨芬', '', null, '癌病恐怖', '', '2017-01-17 10:17:45', null, null);
INSERT INTO `diagnose` VALUES ('339', '3182', '心动过速', '心动过速', '', null, '心动过速', '心动过速', '2017-01-20 10:13:00', null, null);
INSERT INTO `diagnose` VALUES ('340', '3183', '测试', '测试', '', null, '咨询', '', '2017-01-20 10:16:37', null, null);
INSERT INTO `diagnose` VALUES ('341', '3183', '测试', '测试', '', null, '咨询', '', '2017-01-20 10:16:38', null, null);
INSERT INTO `diagnose` VALUES ('342', '3183', '测试', '测试', '', null, '咨询', '', '2017-01-20 10:20:57', null, null);
INSERT INTO `diagnose` VALUES ('343', '3184', '心动过速', '心动过速', '', null, '心动过速', '心动过速', '2017-01-20 10:22:29', null, null);
INSERT INTO `diagnose` VALUES ('344', '3185', '心律失常', '心律失常', '', null, '心律失常', '心律失常', '2017-01-20 10:39:30', null, null);
INSERT INTO `diagnose` VALUES ('345', '3188', '飞洒发', '阿斯弗', 'f发士大夫', null, '发生发大水范德萨分', '发的发顺丰', '2017-01-20 20:07:57', null, null);
INSERT INTO `diagnose` VALUES ('346', '3192', '去去去去去去去去去去去去去', '的的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '', null, '鞍背脑膜瘤', '', '2017-01-21 10:22:59', null, null);
INSERT INTO `diagnose` VALUES ('347', '3199', '干活vbbgvvv', '好吧拜拜v', '风风光光呵呵', null, 'vvvvvv', 'hvvb罗找我', '2017-01-21 16:17:45', null, null);
INSERT INTO `diagnose` VALUES ('348', '3210', '垃圾桶没有头绪他', '咯哦涂抹我', '咯给龙年', null, '急急急急急急急', '急急急急急急急急急', '2017-01-21 17:50:38', null, null);
INSERT INTO `diagnose` VALUES ('349', '3212', '无', '无', '无', null, '1', '无', '2017-01-21 18:33:53', null, null);
INSERT INTO `diagnose` VALUES ('350', '3215', '同时也是这样认为', '就是快去快去', '寂静哦哦', null, '婆婆且行且珍惜', '进入状态同学', '2017-01-21 18:54:28', null, null);
INSERT INTO `diagnose` VALUES ('351', '3223', '产品测试', '产品测试产品测试产品测试', '产品测试产品测试', null, '艾迪生病', '', '2017-01-22 11:00:21', null, null);
INSERT INTO `diagnose` VALUES ('352', '3264', '测试', '测试', '', null, '测试', '测试', '2017-02-05 14:03:17', null, null);
INSERT INTO `diagnose` VALUES ('353', '3281', '测试', '测试', '', null, '测试', '测试', '2017-02-06 16:52:36', null, null);
INSERT INTO `diagnose` VALUES ('354', '3265', '无', '患者一周-前在本院宫外孕保守治疗，好转后出院，现无腹痛，无明显阴道出血。', '无', null, '异常阴道出血', '无', '2017-02-07 14:44:40', null, null);
INSERT INTO `diagnose` VALUES ('355', '3266', '无', '患者3月前因胚胎停止发育很人流，术后未复查HCG到正常，现感觉小腹有坠涨。月经已经恢复正常', '无', null, '早期人工流产', '无', '2017-02-07 14:58:06', null, null);
INSERT INTO `diagnose` VALUES ('356', '3275', '病史如上', '病史如上，复查', '无', null, '尺骨骨折', '无', '2017-02-07 15:18:26', null, null);
INSERT INTO `diagnose` VALUES ('357', '3268', '无', '无', '无', null, '肝移植状态', '无', '2017-02-07 15:35:29', null, null);
INSERT INTO `diagnose` VALUES ('358', '3253', '无', '无', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-07 15:41:26', null, null);
INSERT INTO `diagnose` VALUES ('359', '3257', '产后咨询新生儿黄疸', '患者产后4天，咨询新生儿黄疸，因原先第一个新生儿原有高胆红素血症，故就诊。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-07 15:57:45', null, null);
INSERT INTO `diagnose` VALUES ('360', '3258', '无', '妊高症术后6天诉无头痛、无头昏，无视物模糊，阴道恶露量少。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-07 16:03:31', null, null);
INSERT INTO `diagnose` VALUES ('361', '3261', '产后会阴切口不适', '患者平产后诉会阴切口不适，诉能坐立，压之有不适，无疼痛，无异常液体流出，乳汁分泌适量，故就诊。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-07 16:17:01', null, null);
INSERT INTO `diagnose` VALUES ('362', '3287', '11', '11', '', null, 'ABO血型不合', '11', '2017-02-07 16:17:21', null, null);
INSERT INTO `diagnose` VALUES ('363', '3285', '11', '11', '11', null, '艾迪生病', '11', '2017-02-07 16:27:23', null, null);
INSERT INTO `diagnose` VALUES ('364', '3277', '产后5天', '妊高症产后5天，目前未监测血压，无头痛，无视物模糊，阴道恶露少，会阴切口无疼痛感，故就诊。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-07 16:28:59', null, null);
INSERT INTO `diagnose` VALUES ('365', '3279', '产后咨询', '平产后恶露少，乳汁分泌足，故就诊。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-07 16:34:52', null, null);
INSERT INTO `diagnose` VALUES ('366', '3289', '拉肚子', '拉肚子', '', null, '胃炎', '', '2017-02-07 17:17:50', null, null);
INSERT INTO `diagnose` VALUES ('367', '3296', '测试', '测试', '', null, '测试', '测试', '2017-02-09 16:46:28', null, null);
INSERT INTO `diagnose` VALUES ('368', '3298', '双眼干涩，视疲劳半年', '双眼干涩伴视物模糊，偶有酸胀，间歇性发作，无明显分泌物', '无', null, '双眼干眼症，双眼屈光不正', '1.验光\n2.眼压\n3.干眼检测\n4.注意用眼卫生', '2017-02-10 10:19:02', null, null);
INSERT INTO `diagnose` VALUES ('369', '3270', '无', '无', '无', null, '无', '无', '2017-02-10 14:30:37', null, null);
INSERT INTO `diagnose` VALUES ('370', '3313', '去', '我', '', null, '我', '', '2017-02-13 11:31:31', null, null);
INSERT INTO `diagnose` VALUES ('371', '3315', '一样的花儿', '一样的小花', '疯疯癫癫', null, 'ABO血型不合埃布斯坦异常', '我结束了沉默，我创造了未来', '2017-02-13 14:40:37', null, null);
INSERT INTO `diagnose` VALUES ('372', '3317', '头痛', '头1天', '', null, '头痛', '打针', '2017-02-13 14:55:48', null, null);
INSERT INTO `diagnose` VALUES ('373', '3320', '测试', '测试', '', null, '奥迪括约肌痉挛', '测试', '2017-02-13 15:33:27', null, null);
INSERT INTO `diagnose` VALUES ('374', '3331', '偷懒', '哦lol图咯', '无', null, '劳伦斯－穆恩（－巴尔得）－别德尔综合征', '太卡几块了', '2017-02-13 21:56:25', null, null);
INSERT INTO `diagnose` VALUES ('375', '3331', '偷懒', '哦lol图咯', '无', null, '劳伦斯－穆恩（－巴尔得）－别德尔综合征', '太卡几块了', '2017-02-13 21:56:33', null, null);
INSERT INTO `diagnose` VALUES ('376', '3331', '偷懒', '哦lol图咯', '无', null, '劳伦斯－穆恩（－巴尔得）－别德尔综合征', '太卡几块了', '2017-02-13 21:56:40', null, null);
INSERT INTO `diagnose` VALUES ('377', '3325', '我婆婆说我', '无', '无', null, '横结肠良性肿瘤', '无', '2017-02-13 21:56:51', null, null);
INSERT INTO `diagnose` VALUES ('378', '2531', '饿了来了', 'KKK了了', '来了嗯哦哦', null, '阿拉恶魔与考虑咯啦咯考虑兔兔', '无', '2017-02-13 21:57:07', null, null);
INSERT INTO `diagnose` VALUES ('379', '2531', '记录贴', '无', '无', null, '吐了考虑', '无', '2017-02-13 21:58:07', null, null);
INSERT INTO `diagnose` VALUES ('380', '3332', '无', '无', '无', null, '稽留流产伴萎缩卵', '无', '2017-02-13 22:04:39', null, null);
INSERT INTO `diagnose` VALUES ('381', '3332', '无', '无', '无', null, '可可怜啦咯啦', '无', '2017-02-13 22:04:57', null, null);
INSERT INTO `diagnose` VALUES ('382', '2531', '无', '无', '无', null, '肩结缔组织良性肿瘤', '无', '2017-02-13 22:05:09', null, null);
INSERT INTO `diagnose` VALUES ('383', '3333', '无', '无', '无', null, '\"氯霉素族有害效应	\"', '无', '2017-02-13 22:05:35', null, null);
INSERT INTO `diagnose` VALUES ('384', '3335', '1', '1', '1', null, '1', '1', '2017-02-13 22:08:01', null, null);
INSERT INTO `diagnose` VALUES ('385', '3335', '1', '1', '1', null, '1', '1', '2017-02-13 22:08:21', null, null);
INSERT INTO `diagnose` VALUES ('386', '3336', '1', '1', '1', null, '1', '1', '2017-02-13 22:09:22', null, null);
INSERT INTO `diagnose` VALUES ('387', '3339', '无', '无', '无', null, '泌尿生殖道异物', '无', '2017-02-13 22:23:55', null, null);
INSERT INTO `diagnose` VALUES ('388', '3339', '无', '无', '无', null, '泌尿生殖道异物', '无', '2017-02-13 22:25:26', null, null);
INSERT INTO `diagnose` VALUES ('389', '3334', '无', '无', '无', null, '可可怜啦咯啦', '无', '2017-02-13 22:47:01', null, null);
INSERT INTO `diagnose` VALUES ('390', '3349', 'fdsafdsaf', 'fsdafdsdaf', 'fsafdsaf', null, 'safdsaf', 'fsadfasf', '2017-02-13 23:00:38', null, null);
INSERT INTO `diagnose` VALUES ('391', '3352', 'w', 'w', 'w', null, '过敏性咳嗽', '刚刚好', '2017-02-14 09:17:03', null, null);
INSERT INTO `diagnose` VALUES ('392', '3355', 'a', 'a', 'a', null, '阿斯匹林三联征', '啊', '2017-02-14 10:03:44', null, null);
INSERT INTO `diagnose` VALUES ('393', '3360', 'a', 'a', 'a', null, '阿斯匹林三联征', 'a', '2017-02-14 10:05:37', null, null);
INSERT INTO `diagnose` VALUES ('394', '3361', '1', '1', '1', null, '1', '1', '2017-02-14 10:40:52', null, null);
INSERT INTO `diagnose` VALUES ('395', '3362', 'a', 'a', 'aa', null, '阿斯匹林三联征', 'a', '2017-02-14 12:23:52', null, null);
INSERT INTO `diagnose` VALUES ('396', '3369', '测试', '测试', '', null, 'ABO血型不配合性反应', '测试', '2017-02-14 14:22:21', null, null);
INSERT INTO `diagnose` VALUES ('397', '3373', '无', '无', '无', null, '无', '无', '2017-02-14 14:52:58', null, null);
INSERT INTO `diagnose` VALUES ('398', '3373', '', '无', '无', null, '无', '无', '2017-02-14 14:52:59', null, null);
INSERT INTO `diagnose` VALUES ('399', '3375', '无', '无', '无', null, '脑外伤神经症性反应', '无', '2017-02-14 17:02:19', null, null);
INSERT INTO `diagnose` VALUES ('400', '3365', '。。。', '脑子不好', '哦明', null, '多发性大腿损伤', '多喝热水', '2017-02-14 17:04:45', null, null);
INSERT INTO `diagnose` VALUES ('401', '3366', '。。。。', '。。。。', '。。。', null, '女性前列腺病', '？？', '2017-02-14 17:10:41', null, null);
INSERT INTO `diagnose` VALUES ('402', '3279', '产后咨询', '平产后恶露少，乳汁分泌足，故就诊。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-15 16:19:19', null, null);
INSERT INTO `diagnose` VALUES ('403', '3422', '册', '册', '', null, 'ABO血型不合', '错误', '2017-02-17 11:08:40', null, null);
INSERT INTO `diagnose` VALUES ('404', '3397', '无', '无', '无', null, '无', '无', '2017-02-17 13:53:41', null, null);
INSERT INTO `diagnose` VALUES ('405', '3426', '无', '无', '无', null, '无', '无', '2017-02-17 15:17:04', null, null);
INSERT INTO `diagnose` VALUES ('406', '3426', '无', '无', '无', null, '高血压1级', '无', '2017-02-17 15:22:46', null, null);
INSERT INTO `diagnose` VALUES ('407', '3426', '无', '无', '无', null, '高血压1级', '无', '2017-02-17 15:33:30', null, null);
INSERT INTO `diagnose` VALUES ('408', '3426', '无', '无', '无', null, '高血压1级', '无', '2017-02-17 15:37:04', null, null);
INSERT INTO `diagnose` VALUES ('409', '3436', '无', '无', '无', null, '高血压1级', '无', '2017-02-17 15:46:16', null, null);
INSERT INTO `diagnose` VALUES ('410', '3386', '产后51天咨询', '患者在孕期曾有三次尿检提示尿蛋白阳性，后产后复查阴性，今日诉恶露偶有，无阴道分泌物有异味，故就诊。', '无', null, '产后即刻医疗照顾和检查', '无', '2017-02-17 15:48:19', null, null);
INSERT INTO `diagnose` VALUES ('411', '3423', '1', '1', '', null, '鞍背脑膜瘤', '1', '2017-02-17 15:54:27', null, null);
INSERT INTO `diagnose` VALUES ('412', '3390', '无', '患者1月前无明显诱因下出现左下腹痛。腹痛不明显，固定。白带不多。月经规则。2.15阴超无明显异常。', '无', null, '腹痛', '无', '2017-02-17 16:47:10', null, null);
INSERT INTO `diagnose` VALUES ('413', '3395', '无', '无', '无', null, '支气管炎', '无', '2017-02-17 16:50:33', null, null);
INSERT INTO `diagnose` VALUES ('414', '3395', '无', '无', '无', null, '支气管炎', '无', '2017-02-17 16:50:33', null, null);
INSERT INTO `diagnose` VALUES ('415', '3396', '无', '无', '无', null, '泌尿道感染', '无', '2017-02-17 17:02:32', null, null);
INSERT INTO `diagnose` VALUES ('416', '3396', '无', '无', '无', null, '泌尿道感染', '无', '2017-02-17 17:02:33', null, null);
INSERT INTO `diagnose` VALUES ('417', '3401', '无', '2天前无明显诱因下出现大腿根部疼痛。无白带异常。近期无外伤史。自觉有缓解。', '无', null, '腹痛', '无', '2017-02-17 17:08:01', null, null);
INSERT INTO `diagnose` VALUES ('418', '3436', '无', '无', '无', null, '高血压1级', '无', '2017-02-18 14:05:38', null, null);
INSERT INTO `diagnose` VALUES ('419', '3464', '无', '病史同前，怀疑帕金森病半年，不规则服用美多芭、安坦，心得安等效果不佳。', '无', null, '帕金森病', '无', '2017-02-21 10:34:32', null, null);
INSERT INTO `diagnose` VALUES ('420', '3464', '无', '病史同前，怀疑帕金森病半年，不规则服用美多芭、安坦，心得安等效果不佳。', '无', null, '帕金森病', '无', '2017-02-21 10:34:32', null, null);
INSERT INTO `diagnose` VALUES ('421', '3464', '无', '病史同前，怀疑帕金森病半年，不规则服用美多芭、安坦，心得安等效果不佳。', '无', null, '帕金森病', '无', '2017-02-22 11:49:43', null, null);
INSERT INTO `diagnose` VALUES ('422', '3460', '无', '无', '无', null, '无', '无', '2017-02-22 11:51:06', null, null);
INSERT INTO `diagnose` VALUES ('423', '3460', '无', '无', '无', null, '无', '无', '2017-02-22 11:51:11', null, null);
INSERT INTO `diagnose` VALUES ('424', '3460', '无', '无', '无', null, '无', '无', '2017-02-22 11:51:22', null, null);
INSERT INTO `diagnose` VALUES ('425', '3460', '头痛 2天', '患者2天前无明显诱因下出现头痛，针刺样痛，头痛主要位于右侧，阵发性，无呕吐、发热、肢体活动障碍、神志不清，未诊治。', '平素健康何种疾病，治疗情况,否认肝炎、结核史,否认高血压、冠心病史,否认糖尿病史、脑血管病史、肾病史、肺部疾病史,否认手术史、外伤史,否认食物、药物过敏史。', null, '头痛', '无', '2017-02-22 12:27:31', null, null);
INSERT INTO `diagnose` VALUES ('426', '3466', '最近一段时间感冒反反复复', '感冒发烧', '无', null, '癌病恐怖氨茶硷中毒爱德华兹综合征', '打点滴', '2017-02-22 14:55:25', null, null);
INSERT INTO `diagnose` VALUES ('427', '3467', '11', '11', '', null, '11', '', '2017-02-23 10:48:58', null, null);
INSERT INTO `diagnose` VALUES ('428', '3474', 'aaaaaaa啊啊啊啊啊啊啊啊啊', '擦吃吃吃擦擦迟迟吃吃才踩踩踩踩踩踩从', '', null, '埃博拉病毒病', '不不不不不不不不不不不不不不不不不不不不不不不不不', '2017-02-23 17:05:32', null, null);
INSERT INTO `diagnose` VALUES ('429', '3474', 'aaaaaaa啊啊啊啊啊啊啊啊啊', '擦吃吃吃擦擦迟迟吃吃才踩踩踩踩踩踩从', '', null, '埃博拉病毒病', '不不不不不不不不不不不不不不不不不不不不不不不不不', '2017-02-23 17:06:43', null, null);
INSERT INTO `diagnose` VALUES ('430', '3475', '131', '1231', '', null, 'ABO血型不配合性反应', '12312123', '2017-02-23 17:14:17', null, null);
INSERT INTO `diagnose` VALUES ('431', '3475', '131', '1231', '', null, 'ABO血型不配合性反应', '12312123', '2017-02-23 17:14:52', null, null);
INSERT INTO `diagnose` VALUES ('432', '3475', '131', '1231', '', null, 'ABO血型不配合性反应', '12312123', '2017-02-23 17:17:47', null, null);
INSERT INTO `diagnose` VALUES ('433', '3475', '131', '1231', '', null, 'ABO血型不配合性反应', '12312123', '2017-02-23 17:18:01', null, null);
INSERT INTO `diagnose` VALUES ('434', '3482', '12', '321', '', null, 'ABO血型不合', '123', '2017-02-23 17:21:12', null, null);
INSERT INTO `diagnose` VALUES ('435', '3485', '水水水水水水水水所所所', '的的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '', null, '鞍鼻', '擦擦擦吃吃吃擦擦迟迟吃吃才踩踩踩踩踩踩从', '2017-02-23 17:29:01', null, null);
INSERT INTO `diagnose` VALUES ('436', '3484', '1312313', '1121e12e12eq', '', null, 'ABO血型不配合性反应', 'qeq2eqeq2eq', '2017-02-23 18:30:59', null, null);
INSERT INTO `diagnose` VALUES ('437', '3498', '水水水水水水水水所所所所', '才踩踩踩踩踩踩从擦擦擦擦擦擦擦擦擦擦擦擦擦车错', '', null, '埃博拉病毒病', '不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不不', '2017-02-23 18:32:51', null, null);
INSERT INTO `diagnose` VALUES ('438', '3472', '达瓦大丰收村', '的WA分V而非F  ', '', null, 'ABO血型不配合性反应', 'aDAWDAA', '2017-02-23 18:52:22', null, null);
INSERT INTO `diagnose` VALUES ('439', '3500', '在学校', '嘻嘻嘻擦', '', null, '癌病恐怖', '才知道出的事', '2017-02-23 19:04:46', null, null);
INSERT INTO `diagnose` VALUES ('440', '3501', '无', '无', '无', null, 'Lost 套装', '无', '2017-02-23 19:11:32', null, null);
INSERT INTO `diagnose` VALUES ('441', '3503', '我我我', '我们', '哦哦哦', null, '无抑制神经病性膀胱', '默默', '2017-02-23 19:51:06', null, null);
INSERT INTO `diagnose` VALUES ('442', '3508', '无', '无', '无', null, '无', '无', '2017-02-24 10:38:42', null, null);
INSERT INTO `diagnose` VALUES ('443', '3508', '无', '无', '无', null, '无', '无', '2017-02-24 10:41:42', null, null);
INSERT INTO `diagnose` VALUES ('444', '3513', 'dawdadawd', 'adawdadaw', '', null, 'ABO血型不合', 'adawdawd', '2017-02-24 17:52:41', null, null);
INSERT INTO `diagnose` VALUES ('445', '3516', '无', '无', '无', null, '分离性抽搐', '无', '2017-02-24 17:55:16', null, null);
INSERT INTO `diagnose` VALUES ('446', '3523', '的顶顶顶顶顶大多', '擦迟迟吃吃才踩踩踩踩踩踩从', '', null, '癌病恐怖', '不不不不不不不不不不吧不', '2017-02-24 18:19:41', null, null);
INSERT INTO `diagnose` VALUES ('447', '3524', 'fsdaf ', 'fdsadf', '', null, '埃博拉病毒病', 'fdsafd', '2017-02-24 18:35:43', null, null);
INSERT INTO `diagnose` VALUES ('448', '3526', '声嘶1年', ' 患者1年无明显诱因情况下出现声嘶，伴有咳痰无畏寒，发热，咽痛等症状。未在外院就诊,也未做特殊处理，主要症状缓解不明显，为进求一步诊治来我院就诊。', '否认肝炎、结核、疟疾等传染病病史,否认高血压病、糖尿病、冠心病、脑血管意外、肾病、肺部疾病等重大疾病病史，否认药物过敏史。', null, '声带息肉,慢性咽炎', '无', '2017-02-27 10:41:55', null, null);
INSERT INTO `diagnose` VALUES ('449', '3529', '发士大夫', '飞洒地方', '', null, '癌病恐怖', '飞洒范德萨分', '2017-02-27 11:40:40', null, null);
INSERT INTO `diagnose` VALUES ('450', '3530', '发士大夫', '飞洒发热轧', '', null, '癌病恐怖', '干啥个嘎傻瓜', '2017-02-27 11:45:44', null, null);
INSERT INTO `diagnose` VALUES ('451', '3531', '发烧感冒', '头疼流鼻涕', '', null, 'ABO血型不合', '吃退烧药', '2017-02-27 14:01:09', null, null);
INSERT INTO `diagnose` VALUES ('452', '3534', '无', '无', '无', null, '慢性外阴炎', '无', '2017-02-28 14:24:45', null, null);
INSERT INTO `diagnose` VALUES ('453', '3536', 'q', 'q', '', null, '亚氨基二苯乙烯类中毒', 'q', '2017-02-28 14:47:20', null, null);
INSERT INTO `diagnose` VALUES ('454', '3538', '无', '无', '无', null, '被动性肾充血', '无', '2017-02-28 14:55:28', null, null);
INSERT INTO `diagnose` VALUES ('455', '3544', '无', ' 患者1年未怀孕，平时月经周期45天，当地血糖空腹7.4 餐后12.43 胰岛素23-208，体重80公斤，身高165,24岁后开始体重增长明显，平时无高血压病史 当地超声曾发现多囊小卵泡。今为复诊来我院就诊。', '无', null, '月经不规则', '无', '2017-03-02 10:23:54', null, null);
INSERT INTO `diagnose` VALUES ('456', '3544', '无', ' 患者1年未怀孕，平时月经周期45天，当地血糖空腹7.4 餐后12.43 胰岛素23-208，体重80公斤，身高165,24岁后开始体重增长明显，平时无高血压病史 当地超声曾发现多囊小卵泡。今为复诊来我院就诊。', '无', null, '月经不规则', '无', '2017-03-02 10:24:14', null, null);
INSERT INTO `diagnose` VALUES ('457', '3544', '无', ' 患者1年未怀孕，平时月经周期45天，当地血糖空腹7.4 餐后12.43 胰岛素23-208，体重80公斤，身高165,24岁后开始体重增长明显，平时无高血压病史 当地超声曾发现多囊小卵泡。今为复诊来我院就诊。', '无', null, '月经不规则', '无', '2017-03-02 10:24:55', null, null);
INSERT INTO `diagnose` VALUES ('458', '3544', '无', ' 患者1年未怀孕，平时月经周期45天，当地血糖空腹7.4 餐后12.43 胰岛素23-208，体重80公斤，身高165,24岁后开始体重增长明显，平时无高血压病史 当地超声曾发现多囊小卵泡。今为复诊来我院就诊。', '无', null, '月经不规则', '无', '2017-03-02 10:26:15', null, null);
INSERT INTO `diagnose` VALUES ('459', '3545', '无', '无', '无', null, '无', '无', '2017-03-02 17:50:04', null, null);
INSERT INTO `diagnose` VALUES ('460', '3545', '无', '无', '无', null, '无', '无', '2017-03-02 17:50:12', null, null);
INSERT INTO `diagnose` VALUES ('461', '3545', '无', '无', '无', null, '无', '无', '2017-03-02 17:55:53', null, null);
INSERT INTO `diagnose` VALUES ('462', '3545', '无', '无', '无', null, '无', '无', '2017-03-02 17:57:50', null, null);
INSERT INTO `diagnose` VALUES ('463', '3545', '无', '无', '无', null, '无', '无', '2017-03-02 18:32:46', null, null);
INSERT INTO `diagnose` VALUES ('464', '3554', '无', '无', '无', null, '无', '无', '2017-03-02 18:35:07', null, null);
INSERT INTO `diagnose` VALUES ('465', '3553', '无', '无', '无', null, '无', '无', '2017-03-02 18:35:37', null, null);
INSERT INTO `diagnose` VALUES ('466', '3553', '无', '无', '无', null, '无', '无', '2017-03-02 18:36:24', null, null);
INSERT INTO `diagnose` VALUES ('467', '3545', '无', '无', '无', null, '无', '无', '2017-03-02 18:52:11', null, null);
INSERT INTO `diagnose` VALUES ('468', '3557', '11', '11', '', null, 'ABO血型不配合性反应', '', '2017-03-03 11:50:42', null, null);
INSERT INTO `diagnose` VALUES ('469', '3558', '11', '11', '', null, 'ABO血型不配合性反应', '11', '2017-03-03 12:04:23', null, null);
INSERT INTO `diagnose` VALUES ('470', '3540', '无', '无', '无', null, '高血压病', '无', '2017-03-03 14:36:09', null, null);
INSERT INTO `diagnose` VALUES ('471', '3540', '无', '无', '无', null, '高血压病', '无', '2017-03-03 14:36:10', null, null);
INSERT INTO `diagnose` VALUES ('472', '3540', '无', '无', '无', null, '高血压病', '无', '2017-03-03 14:36:28', null, null);
INSERT INTO `diagnose` VALUES ('473', '3541', '发热后头痛1周余', '患儿1周余前有发热，体温最高39.0℃，无咳嗽，在当地医院输液治疗2天，体温恢复正常，随后出现夜间阵发性前额部刺痛，持续几分钟至1小时，日间活动如常，无呕吐，无视物模糊，无头晕，无抽搐、昏迷，至我院门诊就诊，查血常规及脑电图无明显异常，无特殊处理，近1周来头痛无发作。', '无', null, '头痛', '无', '2017-03-06 09:51:44', null, null);
INSERT INTO `diagnose` VALUES ('474', '3564', '腹痛1年', ' 患者1年前在家中无明显诱因下出现腹痛，位于右下腹，阵发性钝痛，可缓解，不剧，无放射性，与改变体位无关，无畏寒发热，无反酸嗳气，无恶心呕吐，无畏寒发热，无腹泻，无粘液血便，无肛门排气排便停止，无头痛头晕，无胸闷气促。1周来症状基本同前，今来院就诊。\n    发病以来神志精神良好，睡眠、饮食良好，大小便无明显异常。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,无高血压、冠心病、糖尿病史等。', null, '腹痛', '无', '2017-03-06 14:12:24', null, null);
INSERT INTO `diagnose` VALUES ('475', '3564', '腹痛1年', ' 患者1年前在家中无明显诱因下出现腹痛，位于右下腹，阵发性钝痛，可缓解，不剧，无放射性，与改变体位无关，无畏寒发热，无反酸嗳气，无恶心呕吐，无畏寒发热，无腹泻，无粘液血便，无肛门排气排便停止，无头痛头晕，无胸闷气促。1周来症状基本同前，今来院就诊。\n    发病以来神志精神良好，睡眠、饮食良好，大小便无明显异常。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,无高血压、冠心病、糖尿病史等。', null, '腹痛', '无', '2017-03-06 14:12:42', null, null);
INSERT INTO `diagnose` VALUES ('476', '3564', '腹痛1年', ' 患者1年前在家中无明显诱因下出现腹痛，位于右下腹，阵发性钝痛，可缓解，不剧，无放射性，与改变体位无关，无畏寒发热，无反酸嗳气，无恶心呕吐，无畏寒发热，无腹泻，无粘液血便，无肛门排气排便停止，无头痛头晕，无胸闷气促。1周来症状基本同前，今来院就诊。\n    发病以来神志精神良好，睡眠、饮食良好，大小便无明显异常。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,无高血压、冠心病、糖尿病史等。', null, '腹痛', '无', '2017-03-06 14:13:14', null, null);
INSERT INTO `diagnose` VALUES ('477', '3574', '11', '11', '', null, 'ABO血型不配合性反应', '11', '2017-03-07 10:46:13', null, null);
INSERT INTO `diagnose` VALUES ('478', '3563', '无', '病史同前，患者化验回复，服用二甲双胍后出现明显腹泻，停药缓解，目前拒绝服药。', '无', null, '月经不规则', '无', '2017-03-09 10:37:45', null, null);
INSERT INTO `diagnose` VALUES ('479', '3563', '无', '病史同前，患者化验回复，服用二甲双胍后出现明显腹泻，停药缓解，目前拒绝服药。', '无', null, '月经不规则', '无', '2017-03-09 10:39:21', null, null);
INSERT INTO `diagnose` VALUES ('480', '3569', '无', '无', '无', null, '肝病', '无', '2017-03-09 14:38:44', null, null);
INSERT INTO `diagnose` VALUES ('481', '3569', '无', '无', '无', null, '肝病', '无', '2017-03-09 14:39:02', null, null);
INSERT INTO `diagnose` VALUES ('482', '3569', '无', '病史同前，患者先后口服阿德福韦酯，替诺福韦，替比夫定抗病毒治疗，自觉无不适，今复查。', '无', null, '肝病', '无', '2017-03-09 14:40:47', null, null);
INSERT INTO `diagnose` VALUES ('483', '3562', '无', '患者甲亢病史，平时以甲巯咪唑片1片 tid美托洛尔缓释片治疗，目前自觉明显好转。今为常规复诊来我院。', '无', null, '甲状腺机能亢进症', '无', '2017-03-09 14:58:01', null, null);
INSERT INTO `diagnose` VALUES ('484', '3570', '无', '患者系统性红斑狼疮病史，化验回复。', '无', null, '系统性红斑狼疮', '无', '2017-03-09 15:05:23', null, null);
INSERT INTO `diagnose` VALUES ('485', '3578', '无', '产后19天，恶露未净，量不多，无不适', '无', null, '常规产后随诊', '无', '2017-03-09 15:33:49', null, null);
INSERT INTO `diagnose` VALUES ('486', '3582', '达瓦啊分', '分数', '', null, '癌病恐怖', '达瓦达瓦大', '2017-03-09 19:09:14', null, null);
INSERT INTO `diagnose` VALUES ('487', '3583', '积极啦', 'ba c', '哮喘,高尿酸血症,病毒性肝炎,血吸虫病,颈部手术', null, '痛快淋漓', '健康路', '2017-03-09 19:14:54', null, null);
INSERT INTO `diagnose` VALUES ('488', '3588', '耳流脓4日', ' 患者4日前于无明显诱因情况下出现流脓,哭闹，。无发热。曾在外院就诊,予     药物治疗，主要症状缓解不明显，为进求一步诊治来我院就诊。', '否认肝炎、结核、疟疾等传染病病史,否认高血压病、糖尿病、冠心病、脑血管意外、肾病、肺部疾病等重大疾病病史，否认药物过敏史。', null, '中耳炎', '无', '2017-03-13 11:17:52', null, null);
INSERT INTO `diagnose` VALUES ('489', '3584', '无', '甲状腺彩超提示：  两侧甲状腺欠均质、两侧颈部多枚淋巴结显示、颈前皮下淋巴结显示 。甲状腺功能提示：总甲状腺素 72.7  ng/ml；促甲状腺素 2.14  μIU/ml；反三碘甲腺原氨酸 0.76  ng/ml；抗甲状腺过氧化物酶抗体 204.79 ↑ IU/ml；抗甲状腺球蛋白抗体 161.21 ↑ IU/ml；总三碘甲状腺原氨酸 1.13  ng/ml；游离三碘甲状腺原氨酸 3.6  pg/ml；游离甲状腺素 0.8  ng/dl；', '无', null, '淋巴细胞性甲状腺肿', '无', '2017-03-13 11:32:01', null, null);
INSERT INTO `diagnose` VALUES ('490', '3584', '无', '甲状腺彩超提示：  两侧甲状腺欠均质、两侧颈部多枚淋巴结显示、颈前皮下淋巴结显示 。甲状腺功能提示：总甲状腺素 72.7  ng/ml；促甲状腺素 2.14  μIU/ml；反三碘甲腺原氨酸 0.76  ng/ml；抗甲状腺过氧化物酶抗体 204.79 ↑ IU/ml；抗甲状腺球蛋白抗体 161.21 ↑ IU/ml；总三碘甲状腺原氨酸 1.13  ng/ml；游离三碘甲状腺原氨酸 3.6  pg/ml；游离甲状腺素 0.8  ng/dl；', '无', null, '淋巴细胞性甲状腺肿', '无', '2017-03-13 11:32:02', null, null);
INSERT INTO `diagnose` VALUES ('491', '3594', '无', '上腹痛1月', '无', null, '慢性胃炎', '无', '2017-03-15 16:41:21', null, null);
INSERT INTO `diagnose` VALUES ('492', '3594', '无', '上腹痛1月', '无', null, '慢性胃炎', '无', '2017-03-15 16:41:22', null, null);
INSERT INTO `diagnose` VALUES ('493', '3611', 'adada', 'dawdawd', '', null, 'ABO血型不合', 'adawda', '2017-03-15 17:35:36', null, null);
INSERT INTO `diagnose` VALUES ('494', '3612', 'awdawd', 'adawdad', '', null, 'ABPA(变态反应性支气管肺曲霉菌', 'awdadw', '2017-03-15 17:44:43', null, null);
INSERT INTO `diagnose` VALUES ('495', '3613', 'dawda', 'wdawda', '', null, '鞍背脑膜瘤', 'dwadw', '2017-03-15 17:52:42', null, null);
INSERT INTO `diagnose` VALUES ('496', '3614', 'sdasdasda', 'adssdada', '', null, 'ABO血型不配合性反应', 'sdasdasda', '2017-03-15 18:01:35', null, null);
INSERT INTO `diagnose` VALUES ('497', '3615', 'jhjh', 'jhjh', '', null, 'ABO血型不合', 'hjhjjh', '2017-03-15 18:05:37', null, null);
INSERT INTO `diagnose` VALUES ('498', '3616', 'awdadwa', 'dawda', '', null, 'ABO血型不合', 'wdawa', '2017-03-15 18:08:17', null, null);
INSERT INTO `diagnose` VALUES ('499', '3589', '无', 'B超未见胚芽', '无', null, '妊娠相关情况', '无', '2017-03-16 10:11:55', null, null);
INSERT INTO `diagnose` VALUES ('500', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 19:51:24', null, null);
INSERT INTO `diagnose` VALUES ('501', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 19:51:39', null, null);
INSERT INTO `diagnose` VALUES ('502', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 19:51:59', null, null);
INSERT INTO `diagnose` VALUES ('503', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 20:06:31', null, null);
INSERT INTO `diagnose` VALUES ('504', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 20:06:47', null, null);
INSERT INTO `diagnose` VALUES ('505', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 20:16:31', null, null);
INSERT INTO `diagnose` VALUES ('506', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 20:18:11', null, null);
INSERT INTO `diagnose` VALUES ('507', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 20:18:23', null, null);
INSERT INTO `diagnose` VALUES ('508', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 20:18:57', null, null);
INSERT INTO `diagnose` VALUES ('509', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 20:21:07', null, null);
INSERT INTO `diagnose` VALUES ('510', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 20:21:16', null, null);
INSERT INTO `diagnose` VALUES ('511', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 20:34:01', null, null);
INSERT INTO `diagnose` VALUES ('512', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 20:34:04', null, null);
INSERT INTO `diagnose` VALUES ('513', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 20:37:13', null, null);
INSERT INTO `diagnose` VALUES ('514', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 20:51:00', null, null);
INSERT INTO `diagnose` VALUES ('515', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 20:51:53', null, null);
INSERT INTO `diagnose` VALUES ('516', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 20:53:00', null, null);
INSERT INTO `diagnose` VALUES ('517', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 21:05:24', null, null);
INSERT INTO `diagnose` VALUES ('518', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 21:05:51', null, null);
INSERT INTO `diagnose` VALUES ('519', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 21:06:43', null, null);
INSERT INTO `diagnose` VALUES ('520', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 21:08:03', null, null);
INSERT INTO `diagnose` VALUES ('521', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 21:09:12', null, null);
INSERT INTO `diagnose` VALUES ('522', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 21:09:24', null, null);
INSERT INTO `diagnose` VALUES ('523', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 21:10:50', null, null);
INSERT INTO `diagnose` VALUES ('524', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 21:10:51', null, null);
INSERT INTO `diagnose` VALUES ('525', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 21:10:52', null, null);
INSERT INTO `diagnose` VALUES ('526', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 21:11:04', null, null);
INSERT INTO `diagnose` VALUES ('527', '3619', '无', '无', '无', null, '无', '无', '2017-03-16 21:12:26', null, null);
INSERT INTO `diagnose` VALUES ('528', '3617', '无', '无', '无', null, '无', '无', '2017-03-16 21:12:34', null, null);
INSERT INTO `diagnose` VALUES ('529', '3620', '无', '无', '无', null, '无', '无', '2017-03-16 21:12:44', null, null);
INSERT INTO `diagnose` VALUES ('530', '3618', '无', '无', '无', null, '无', '无', '2017-03-16 21:13:04', null, null);
INSERT INTO `diagnose` VALUES ('531', '3621', '反复咳嗽20天', '患者20天前出现咳嗽，不剧，有喉头痰鸣，无明显昼夜差别，无发热，伴流涕。，曾用“头孢、阿奇霉素、青霉素”，有好转', '无', null, '支气管炎', '无', '2017-03-21 09:33:45', null, null);
INSERT INTO `diagnose` VALUES ('532', '3628', '无', '患儿3天前出现鼻子塞，无发热，无咳嗽，无咽痛，无呕吐、腹泻，无皮疹。', '无', null, '急性咽炎', '无', '2017-03-21 09:40:37', null, null);
INSERT INTO `diagnose` VALUES ('533', '3633', '呕吐13天。', '患儿于13天天前无诱因下发现反复呛奶、呕吐，吐出胃内容物，无胆汁及咖啡样物，非喷射性，吃奶后明显，日吐1-2次，呛奶后口唇一过性发绀，无发热，无腹胀，无腹泻，无少吃、少哭及少动，无尖叫及抽搐，未治疗。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,,,否认肺炎、先天性心脏病病史，否认手术史、外伤史、输血史,否认食物、药物过敏史，已接种乙肝疫苗。', null, '新生儿呕吐', '无', '2017-03-22 14:07:48', null, null);
INSERT INTO `diagnose` VALUES ('534', '3633', '呕吐13天。', '患儿于13天天前无诱因下发现反复呛奶、呕吐，吐出胃内容物，无胆汁及咖啡样物，非喷射性，吃奶后明显，日吐1-2次，呛奶后口唇一过性发绀，无发热，无腹胀，无腹泻，无少吃、少哭及少动，无尖叫及抽搐，未治疗。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,,,否认肺炎、先天性心脏病病史，否认手术史、外伤史、输血史,否认食物、药物过敏史，已接种乙肝疫苗。', null, '新生儿呕吐', '无', '2017-03-22 14:07:49', null, null);
INSERT INTO `diagnose` VALUES ('535', '3637', 'sasa', 'sasa', '', null, 'ABO血型不合', 'sasasa', '2017-03-23 17:35:21', null, null);
INSERT INTO `diagnose` VALUES ('536', '3637', 'sasa', 'sasa', '', null, 'ABO血型不合', 'sasasa', '2017-03-23 17:35:51', null, null);
INSERT INTO `diagnose` VALUES ('537', '3638', 'fdfd', 'fdfdfd', '', null, '鞍背脑膜瘤', 'fdfdfd', '2017-03-23 17:37:33', null, null);
INSERT INTO `diagnose` VALUES ('538', '2800', '', '无', '无', null, '咳嗽', '无', '2017-03-27 09:44:20', null, null);
INSERT INTO `diagnose` VALUES ('539', '2805', '无', '无', '无', null, '单心房,高血压病', '无', '2017-03-27 09:44:22', null, null);
INSERT INTO `diagnose` VALUES ('540', '2805', '无', '无', '无', null, '单心房,高血压病', '无', '2017-03-27 09:44:22', null, null);
INSERT INTO `diagnose` VALUES ('541', '2811', '无', '无', '无', null, '高血压病', '无', '2017-03-27 09:44:22', null, null);
INSERT INTO `diagnose` VALUES ('542', '2805', '无', '无', '无', null, '单心房,高血压病', '无', '2017-03-27 09:44:22', null, null);
INSERT INTO `diagnose` VALUES ('543', '2800', '无', '无', '无', null, '咳嗽', '无', '2017-03-27 09:44:23', null, null);
INSERT INTO `diagnose` VALUES ('544', '2811', '无', '无', '无', null, '高血压病', '无', '2017-03-27 09:44:40', null, null);
INSERT INTO `diagnose` VALUES ('545', '3643', 'test', 'testsss', 'test', null, '发热待查咳嗽近视', 'test', '2017-03-27 13:29:17', null, null);
INSERT INTO `diagnose` VALUES ('546', '3647', 'sdsdds', 'sdsdds', '', null, '鞍背脑膜瘤', 'sdsd', '2017-03-27 13:36:37', null, null);
INSERT INTO `diagnose` VALUES ('547', '3650', '1', '1', '', null, '癌病恐怖', '', '2017-03-27 15:47:15', null, null);
INSERT INTO `diagnose` VALUES ('548', '3652', 'gm', 'gm', '', null, '感冒', 'gm', '2017-03-27 15:56:01', null, null);
INSERT INTO `diagnose` VALUES ('549', '3651', '2', '2', '', null, '鞍鼻', '2', '2017-03-27 16:06:17', null, null);
INSERT INTO `diagnose` VALUES ('550', '3653', '1', '1', '', null, '埃博拉病毒病', '1', '2017-03-28 11:34:34', null, null);
INSERT INTO `diagnose` VALUES ('551', '3654', '1', '1', '', null, '鞍鼻', '', '2017-03-28 11:45:45', null, null);
INSERT INTO `diagnose` VALUES ('552', '3655', '1', '1', '', null, '癌', '', '2017-03-28 11:49:18', null, null);
INSERT INTO `diagnose` VALUES ('553', '3657', '1', '1', '', null, '鞍鼻', '1', '2017-03-28 13:28:42', null, null);
INSERT INTO `diagnose` VALUES ('554', '3658', '1', '1', '', null, '鞍鼻', '1', '2017-03-28 14:07:26', null, null);
INSERT INTO `diagnose` VALUES ('555', '3659', '1', '1', '', null, '鞍鼻', '1', '2017-03-28 15:47:51', null, null);
INSERT INTO `diagnose` VALUES ('556', '3642', '无', '无', '无', null, '妊娠未确认', '无', '2017-03-28 16:03:27', null, null);
INSERT INTO `diagnose` VALUES ('557', '3663', 'sd', 'sdsdsd', '', null, 'ABPA(变态反应性支气管肺曲霉菌', 'sdsd', '2017-03-29 17:22:29', null, null);
INSERT INTO `diagnose` VALUES ('558', '3666', '1', '1', '', null, '鞍鼻', '1', '2017-03-29 17:42:58', null, null);
INSERT INTO `diagnose` VALUES ('559', '3667', '2', '2', '', null, '癌', '', '2017-03-29 17:44:30', null, null);
INSERT INTO `diagnose` VALUES ('560', '3662', '无', '患者孕期甲状腺功能减退症病史，停药数月 近期查甲状腺功能正常。', '无', null, '甲状腺机能减退症', '无', '2017-03-30 10:26:19', null, null);
INSERT INTO `diagnose` VALUES ('561', '3662', '无', '患者孕期甲状腺功能减退症病史，停药数月 近期查甲状腺功能正常。', '无', null, '甲状腺机能减退症', '无', '2017-03-30 10:27:11', null, null);
INSERT INTO `diagnose` VALUES ('562', '3668', '测试', '测试', '', null, '阿尔茨海默病伴晚期发病', '测试', '2017-03-30 13:21:14', null, null);
INSERT INTO `diagnose` VALUES ('563', '3661', '无', '无', '无', null, '月经不规则', '无', '2017-03-30 16:26:20', null, null);
INSERT INTO `diagnose` VALUES ('564', '3675', '测', '测试', '', null, '埃博拉病毒病', '测试', '2017-03-30 17:18:07', null, null);
INSERT INTO `diagnose` VALUES ('565', '3679', '测试', '测试', '', null, '白内障', '测试', '2017-03-31 16:51:51', null, null);
INSERT INTO `diagnose` VALUES ('566', '3681', '已经让更多人', '爱国色粉色', '', null, 'ABO血型不合', '案范围广泛', '2017-03-31 17:15:19', null, null);
INSERT INTO `diagnose` VALUES ('567', '3620', '无', '无', '无', null, '无', '无', '2017-03-31 18:31:20', null, null);
INSERT INTO `diagnose` VALUES ('568', '3620', '无', '无', '无', null, '无', '无', '2017-03-31 19:07:08', null, null);
INSERT INTO `diagnose` VALUES ('569', '3686', '无', '无', '无', null, '无', '无', '2017-03-31 20:51:52', null, null);
INSERT INTO `diagnose` VALUES ('570', '3686', '无', '无', '无', null, '无', '无', '2017-03-31 20:53:03', null, null);
INSERT INTO `diagnose` VALUES ('571', '3688', '主诉', '现病史', '既往史', null, '咨询结果', '咨询意见', '2017-04-01 11:04:08', null, null);
INSERT INTO `diagnose` VALUES ('572', '3699', '1', '2', '3', null, '4', '5', '2017-04-01 14:11:13', null, null);
INSERT INTO `diagnose` VALUES ('573', '3713', '1', '1', '1', null, '1', '1', '2017-04-05 16:03:43', null, null);
INSERT INTO `diagnose` VALUES ('574', '3584', '无', '甲状腺彩超提示：  两侧甲状腺欠均质、两侧颈部多枚淋巴结显示、颈前皮下淋巴结显示 。甲状腺功能提示：总甲状腺素 72.7  ng/ml；促甲状腺素 2.14  μIU/ml；反三碘甲腺原氨酸 0.76  ng/ml；抗甲状腺过氧化物酶抗体 204.79 ↑ IU/ml；抗甲状腺球蛋白抗体 161.21 ↑ IU/ml；总三碘甲状腺原氨酸 1.13  ng/ml；游离三碘甲状腺原氨酸 3.6  pg/ml；游离甲状腺素 0.8  ng/dl；', '无', null, '淋巴细胞性甲状腺肿', '无', '2017-04-10 16:16:18', null, null);
INSERT INTO `diagnose` VALUES ('575', '3731', '测试', '测试', '', null, '白内障', '测试', '2017-04-11 14:05:41', null, null);
INSERT INTO `diagnose` VALUES ('576', '3746', '11', '11', '', null, '艾迪生病', '11', '2017-04-13 13:34:07', null, null);
INSERT INTO `diagnose` VALUES ('577', '3749', '双眼干1年', '双眼干1年，2月前在我院行双眼泪道栓塞术。', '', null, '干眼症', '海露眼水4支 ou qid', '2017-04-14 09:25:17', null, null);
INSERT INTO `diagnose` VALUES ('578', '3756', '无', '无', '无', null, '无', '无', '2017-04-19 17:00:19', null, null);
INSERT INTO `diagnose` VALUES ('579', '3777', '测试主诉', '测试现病史', '测试既往史', null, '测试咨询结果', '测试咨询意见', '2017-04-26 13:13:57', null, null);
INSERT INTO `diagnose` VALUES ('580', '3765', '无', '无', '无', null, '健康查体', '无', '2017-04-26 14:06:02', null, null);
INSERT INTO `diagnose` VALUES ('581', '3773', '先心复诊要求复查心超', '患儿原有先心病史，要求复查心超，患儿无发热，无咳嗽，无气促、发绀，无呕吐、腹泻，无抽搐、惊厥。', '无', null, '房间隔缺损', '无', '2017-04-26 14:15:46', null, null);
INSERT INTO `diagnose` VALUES ('582', '3773', '先心复诊要求复查心超', '患儿原有先心病史，要求复查心超，患儿无发热，无咳嗽，无气促、发绀，无呕吐、腹泻，无抽搐、惊厥。', '无', null, '房间隔缺损', '无', '2017-04-26 14:15:47', null, null);
INSERT INTO `diagnose` VALUES ('583', '3773', '先心复诊要求复查心超', '患儿原有先心病史，要求复查心超，患儿无发热，无咳嗽，无气促、发绀，无呕吐、腹泻，无抽搐、惊厥。', '无', null, '房间隔缺损', '无', '2017-04-26 14:15:47', null, null);
INSERT INTO `diagnose` VALUES ('584', '3373', '无', '无', '无', null, '无', '无', '2017-04-26 14:47:24', null, null);
INSERT INTO `diagnose` VALUES ('585', '3373', '无', '无', '无', null, '无', '无', '2017-04-26 14:49:28', null, null);
INSERT INTO `diagnose` VALUES ('586', '3786', '咳嗽流鼻涕感冒三天，无头痛咳嗽', '咳嗽流鼻涕感冒三天，无头痛咳嗽', '无', null, '流行性感冒', '多喝水、多休息', '2017-04-27 10:41:06', null, null);
INSERT INTO `diagnose` VALUES ('587', '3774', '无', '产后5月，常有下腹痛，不剧', '无', null, '常规产后随诊', '无', '2017-04-27 16:29:13', null, null);
INSERT INTO `diagnose` VALUES ('588', '3628', '无', '患儿3天前出现鼻子塞，无发热，无咳嗽，无咽痛，无呕吐、腹泻，无皮疹。', '无', null, '急性咽炎', '无', '2017-04-28 16:13:22', null, null);
INSERT INTO `diagnose` VALUES ('589', '3802', '主诉测试0502', '现病史测试0502', '既往史测试0502', null, '结果测试0502', '意见测试0502', '2017-05-02 10:31:08', null, null);
INSERT INTO `diagnose` VALUES ('590', '3798', '腹泻3天', '患儿3天前口服酸奶后腹泻，解黄色水样便，不含粘液脓血，日解3次 ，每次量多少不等，无呕吐，无发热，无哭吵不安，无腹胀，无皮疹。奶粉喂养。每天都有给益生菌无好转。', '无', null, '胃肠功能紊乱', '无', '2017-05-03 14:14:56', null, null);
INSERT INTO `diagnose` VALUES ('591', '3825', '1', '1', '', '', '鞍鼻', '', '2017-05-04 16:38:57', null, '1');
INSERT INTO `diagnose` VALUES ('592', '3830', '下擦擦', ' 啊答是', '', '', '鞍背脑膜瘤', '', '2017-05-08 10:23:06', null, ' 阿达传达室');
INSERT INTO `diagnose` VALUES ('593', '3837', ' 是送到', '  是是 ', '', '', 'ABO血型不配合性反应', '成双成对是', '2017-05-09 10:51:16', null, ' 是是');
INSERT INTO `diagnose` VALUES ('594', '3829', '无', '无', '', null, '健康查体,消化不良', '无', '2017-05-09 15:09:44', null, null);
INSERT INTO `diagnose` VALUES ('595', '3827', '无', '3月前平产，产后有刮宫术。术后复查有宫腔下段见范围约18×6mm低回声区。白带不多。', '无', null, '无', '无', '2017-05-09 15:18:16', null, null);
INSERT INTO `diagnose` VALUES ('596', '3828', '无', '患者体检发现卵巢囊肿。定期复查有增多趋势。', '无', null, '卵巢囊肿', '无', '2017-05-09 15:25:09', null, null);
INSERT INTO `diagnose` VALUES ('597', '3876', '皮疹4天', '患儿未明原因皮疹4天，面部、背部明显，无发热，无咳嗽，无呕吐、腹泻，无抽搐、惊厥，未治疗。', '无', null, '湿疹', '无', '2017-05-24 14:38:02', null, null);
INSERT INTO `diagnose` VALUES ('598', '3877', '11', '11', '', '', '11', '', '2017-05-24 20:31:42', null, '');
INSERT INTO `diagnose` VALUES ('599', '3877', '11', '11', '', '', '11', '', '2017-05-24 20:31:45', null, '');
INSERT INTO `diagnose` VALUES ('600', '3877', '11', '11', '', '', '11', '', '2017-05-24 20:31:54', null, '');
INSERT INTO `diagnose` VALUES ('601', '3877', '11', '11', '', '', '11', '', '2017-05-24 20:33:38', null, '');
INSERT INTO `diagnose` VALUES ('602', '3878', '头痛，发热', '无', '', '', '感冒', '', '2017-05-25 09:06:07', null, '保持睡眠。按时吃药');
INSERT INTO `diagnose` VALUES ('603', '3878', '头痛，发热', '无', '', '', '感冒', '', '2017-05-25 09:06:29', null, '保持睡眠。按时吃药');
INSERT INTO `diagnose` VALUES ('604', '3878', '头痛，发热', '无', '', '', '感冒', '', '2017-05-25 09:08:50', null, '保持睡眠。按时吃药');
INSERT INTO `diagnose` VALUES ('605', '3879', 'ttt', 'tyytyt', '', '', 'ABPA(变态反应性支气管肺曲霉菌', '', '2017-05-25 09:12:47', null, 'ytytyt');
INSERT INTO `diagnose` VALUES ('606', '3878', '头痛，发热', '无', '', '', '感冒', '', '2017-05-25 09:13:26', null, '保持睡眠。按时吃药');
INSERT INTO `diagnose` VALUES ('607', '3879', 'ttt', 'tyytyt', '', '', 'ABPA(变态反应性支气管肺曲霉菌', '', '2017-05-25 09:15:48', null, 'ytytyt');
INSERT INTO `diagnose` VALUES ('608', '3879', 'ttt', 'tyytyt', '', '', 'ABPA(变态反应性支气管肺曲霉菌', '', '2017-05-25 09:16:00', null, 'ytytyt');
INSERT INTO `diagnose` VALUES ('609', '3878', '头痛，发热', '无', '', '', '感冒', '', '2017-05-25 09:20:12', null, '保持睡眠。按时吃药');
INSERT INTO `diagnose` VALUES ('610', '3879', 'ttt', 'tyytyt', '', '', 'ABPA(变态反应性支气管肺曲霉菌', '', '2017-05-25 09:21:10', null, 'ytytyt');
INSERT INTO `diagnose` VALUES ('611', '3879', 'ttt', 'tyytyt', '', '', 'ABPA(变态反应性支气管肺曲霉菌', '', '2017-05-25 09:25:04', null, 'ytytyt');
INSERT INTO `diagnose` VALUES ('612', '3881', '感冒，发热', '暂无', '', '', '感冒', '', '2017-05-25 09:44:11', null, '准时吃药');
INSERT INTO `diagnose` VALUES ('613', '3882', '撒', '安抚', '', '', '癌', '', '2017-05-25 10:00:42', null, '啊');
INSERT INTO `diagnose` VALUES ('614', '3883', '头痛，感冒', '暂无', '', '', '腺癌', '', '2017-05-25 10:38:38', null, '多喝热水');
INSERT INTO `diagnose` VALUES ('615', '3886', '刚刚', '个g', '', '', '鞍鼻', '', '2017-05-25 11:12:23', null, ' g');
INSERT INTO `diagnose` VALUES ('616', '3888', '按时上学', '安徽省', '', '', '埃博拉病毒病', '', '2017-05-25 14:46:47', null, '撒');
INSERT INTO `diagnose` VALUES ('617', '3869', '无', '腹部切口疼痛', '无', null, '腹痛', '无', '2017-05-25 16:50:01', null, null);
INSERT INTO `diagnose` VALUES ('618', '3869', '无', '腹部切口疼痛', '无', null, '腹痛', '无', '2017-05-25 16:50:02', null, null);
INSERT INTO `diagnose` VALUES ('619', '3873', '无', '无', '无', null, '妊娠相关情况', '无', '2017-05-25 16:57:48', null, null);
INSERT INTO `diagnose` VALUES ('620', '3873', '无', '无', '无', null, '妊娠相关情况', '无', '2017-05-25 16:57:49', null, null);
INSERT INTO `diagnose` VALUES ('621', '3554', '无', '无', '无', null, '无', '无', '2017-05-26 17:53:44', null, null);
INSERT INTO `diagnose` VALUES ('622', '3953', '无', '无', '无', null, '无', '无', '2017-06-01 10:49:48', null, null);
INSERT INTO `diagnose` VALUES ('623', '3956', ' 大城市是是', ' 是是', '', '', '鞍鼻', '', '2017-06-01 11:19:16', null, ' 是送到');
INSERT INTO `diagnose` VALUES ('624', '3954', '无', '无', '无', null, '无', '无', '2017-06-01 14:33:12', null, null);
INSERT INTO `diagnose` VALUES ('625', '3965', '  体检待查', '  患者无不适主诉，要求体检。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,否认高血压、冠心病史,否认糖尿病史、脑血管病史、肾病史、肺部疾病史,否认手术史、外伤史、输血史,否认食物、药物过敏史,预防接种史不详。', null, '心悸', '无', '2017-06-02 14:26:40', null, null);
INSERT INTO `diagnose` VALUES ('626', '3965', '  体检待查', '  患者无不适主诉，要求体检。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,否认高血压、冠心病史,否认糖尿病史、脑血管病史、肾病史、肺部疾病史,否认手术史、外伤史、输血史,否认食物、药物过敏史,预防接种史不详。', null, '心悸', '无', '2017-06-03 08:23:38', null, null);
INSERT INTO `diagnose` VALUES ('627', '3971', '无', '无', '无', null, '咽痛', '无', '2017-06-05 15:25:55', null, null);
INSERT INTO `diagnose` VALUES ('628', '3983', 'yu', 'yuyu', '', '', 'ABO血型不合', '', '2017-06-05 17:49:26', null, 'yuyu');
INSERT INTO `diagnose` VALUES ('629', '4000', '  发现背部肿块1月余', '患者1月余前洗澡时发现背部一肿块，大小约荔枝大小，质软，边界清晰，可移动，无红肿破溃，无发热，无波动感，当时未重视，未诊治，现为进一步治疗来我院就诊。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,否认高血压、冠心病史,否认糖尿病史、脑血管病史、肾病史、肺部疾病史,否认手术史、外伤史、输血史,否认食物、药物过敏史,预防接种史不详。', null, '皮肤肿物', '无', '2017-06-06 10:04:18', null, null);
INSERT INTO `diagnose` VALUES ('630', '4014', '无', '患者宫腔三维提示宫腔粘连。咨询。', '无', null, '子宫粘连', '无', '2017-06-13 16:55:54', null, null);
INSERT INTO `diagnose` VALUES ('631', '3950', 'iKON哦', '掏', '无', null, '太空', '托你哦哦', '2017-06-14 09:30:50', null, null);
INSERT INTO `diagnose` VALUES ('632', '4031', '主诉', '现病史', '既往史', null, '诊断', '诊疗意见', '2017-06-14 15:31:02', null, null);
INSERT INTO `diagnose` VALUES ('633', '4031', '主', '现病史', '无', null, '诊断', '无', '2017-06-14 15:35:53', null, null);
INSERT INTO `diagnose` VALUES ('634', '4032', '主诉', '现 bigs', '无', null, '诊断', '诊断意见', '2017-06-14 15:39:38', null, null);
INSERT INTO `diagnose` VALUES ('635', '4025', '主诉', '馅饼死', '无', null, '诊断', '诊疗意见', '2017-06-14 16:04:18', null, null);
INSERT INTO `diagnose` VALUES ('636', '4034', '主诉', '馅饼是', '无', null, '诊断', '诊疗意见', '2017-06-14 16:26:40', null, null);
INSERT INTO `diagnose` VALUES ('637', '4037', '主诉', '先并使', '无', null, '诊断', '诊断意见', '2017-06-14 16:38:15', null, null);
INSERT INTO `diagnose` VALUES ('638', '4038', '主诉', '先比', '无', null, '诊断', '诊疗已经', '2017-06-14 17:03:03', null, null);
INSERT INTO `diagnose` VALUES ('639', '4039', '主诉', '先', '协', null, '诊断', '这么累', '2017-06-14 17:06:37', null, null);
INSERT INTO `diagnose` VALUES ('640', '4040', '呃呃呃', '呃呃呃', '无热热热', null, '反反复复', '反反复复', '2017-06-14 17:08:12', null, null);
INSERT INTO `diagnose` VALUES ('641', '4041', '主诉', '馅饼岁', '无', null, '诊断', '诊疗意见', '2017-06-14 17:12:24', null, null);
INSERT INTO `diagnose` VALUES ('642', '4043', '搜索', '得到', '无得到', null, '得到得到', '得到', '2017-06-14 17:21:22', null, null);
INSERT INTO `diagnose` VALUES ('643', '4044', '你你你你', '哈哈哈哈好', '无不不不不', null, '不不不不', '八佰伴', '2017-06-14 17:26:23', null, null);
INSERT INTO `diagnose` VALUES ('644', '4045', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-06-15 10:38:50', null, null);
INSERT INTO `diagnose` VALUES ('645', '4049', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-06-15 10:55:42', null, null);
INSERT INTO `diagnose` VALUES ('646', '4051', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-06-15 11:16:44', null, null);
INSERT INTO `diagnose` VALUES ('647', '4054', '1', '1', '无', null, '1', '1', '2017-06-15 11:22:30', null, null);
INSERT INTO `diagnose` VALUES ('648', '4055', '主诉', '现病史', '无', null, '诊断', '无', '2017-06-15 11:41:56', null, null);
INSERT INTO `diagnose` VALUES ('649', '4057', '无', '无咯血，无咯黄痰，无发热畏寒，无胸部外伤史，无特殊药物治疗史，症状未见明显加重。辅助检查：现为进一步诊治来院。', '无', null, '皮肤肿物', '无', '2017-06-15 15:57:26', null, null);
INSERT INTO `diagnose` VALUES ('650', '4061', 'qqq', 'qqq', '无', null, 'qqq', 'qqq', '2017-06-15 17:12:15', null, null);
INSERT INTO `diagnose` VALUES ('651', '4062', '111', '111', '无', null, '111', '111', '2017-06-15 17:13:29', null, null);
INSERT INTO `diagnose` VALUES ('652', '4064', '主诉', '宪兵', '既往所', null, '诊断', '意见', '2017-06-15 17:21:17', null, null);
INSERT INTO `diagnose` VALUES ('653', '4065', '主诉', '现病史', '既往史', null, '诊断', '诊疗意见', '2017-06-15 17:42:30', null, null);
INSERT INTO `diagnose` VALUES ('654', '4066', '1', '宪兵', '无', null, '阻断', '1', '2017-06-15 17:47:27', null, null);
INSERT INTO `diagnose` VALUES ('655', '4068', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-06-15 19:10:13', null, null);
INSERT INTO `diagnose` VALUES ('656', '4071', '主诉', '馅饼岁', '既往史', null, '诊断', '意见', '2017-06-15 19:17:38', null, null);
INSERT INTO `diagnose` VALUES ('657', '4070', '主诉', '现病岁', '无1', null, '诊断', '意见', '2017-06-15 19:46:11', null, null);
INSERT INTO `diagnose` VALUES ('658', '4079', '主诉', '馅饼岁', '无', null, '诊断', '诊疗意见', '2017-06-16 15:33:30', null, null);
INSERT INTO `diagnose` VALUES ('659', '4086', '无', '无', '无', null, '无', '无', '2017-06-19 15:07:36', null, null);
INSERT INTO `diagnose` VALUES ('660', '4093', '无', '病史同前，停药观察中。', '无', null, '甲状腺机能亢进症', '无', '2017-06-22 08:33:06', null, null);
INSERT INTO `diagnose` VALUES ('661', '4096', '双膝关节怕冷1年', ' 1年前无明显诱因下逐渐出现双膝关节怕冷，无多关节肿痛，无发热，无皮疹，无雷诺现象，无反复口腔溃疡，无腰臀部疼痛，一直未重视未诊治，既往有RF升高病史，具体不详。今为求诊治来我院就诊。', '无', null, '关节炎', '无', '2017-06-22 08:51:01', null, null);
INSERT INTO `diagnose` VALUES ('662', '4097', '无', '患者半月前在我院行宫腔镜宫腔粘连手术，术后恢复好。咨询能否外出', '无', null, '子宫内膜炎', '无', '2017-06-27 14:43:18', null, null);
INSERT INTO `diagnose` VALUES ('663', '4137', '头晕', '头晕', '', '', '头晕待查', '', '2017-06-28 09:35:47', null, '发烧头晕，多喝水，及时来医院检查');
INSERT INTO `diagnose` VALUES ('664', '4142', 'ewr', 'ewr', '', '', '虱病', '', '2017-06-28 09:40:13', null, 'ewr');
INSERT INTO `diagnose` VALUES ('665', '4149', '咳嗽一周', '发烧', '', '', '感冒', '', '2017-06-28 10:48:11', null, '注意休息 多喝水');
INSERT INTO `diagnose` VALUES ('666', '4150', '1111', '1111', '11', '1111', '安定中毒', '', '2017-06-28 10:56:44', null, '111');
INSERT INTO `diagnose` VALUES ('667', '4145', '咳嗽一周', '咳嗽一周', '', '', '感冒', '', '2017-06-28 10:57:12', null, '注意休息');
INSERT INTO `diagnose` VALUES ('668', '4152', '感冒一星期', '感冒一星期', '无', '无', '感冒', '', '2017-06-28 14:35:52', null, '多喝水');
INSERT INTO `diagnose` VALUES ('669', '4153', '损伤', '损伤', '', '', '损伤个人史', '', '2017-06-28 17:22:30', null, '损伤');
INSERT INTO `diagnose` VALUES ('670', '4154', '我突然一体机', '他弄', '', '', 'ABO血型不合埃博拉病毒病', '', '2017-06-28 17:45:03', null, '是否');
INSERT INTO `diagnose` VALUES ('671', '4157', 'dADADas', 'dAWdad', '无', null, 'dawdadw', 'awdadw', '2017-06-28 18:48:51', null, null);
INSERT INTO `diagnose` VALUES ('672', '4159', '发烧', '发烧', '', '', '感冒', '', '2017-06-29 10:37:47', null, '发烧');
INSERT INTO `diagnose` VALUES ('673', '4155', '无', '，无反酸，无便血，无胸痛，无咳嗽。', '无', null, '肠功能紊乱', '无', '2017-06-29 10:52:46', null, null);
INSERT INTO `diagnose` VALUES ('674', '4169', '打脑壳的很啊', '灰常卜开申', '', '', '埃博拉病毒病鞍背脑膜瘤鞍鼻', '费用', '2017-06-30 11:48:27', null, '黑红');
INSERT INTO `diagnose` VALUES ('675', '4185', '无', '无', '无', null, '无', '无', '2017-07-03 09:27:29', null, null);
INSERT INTO `diagnose` VALUES ('676', '4174', '隐匿阴茎术后雄激素偏低，雌激素偏高', '患儿2017.5在省儿童医院行隐匿阴茎手术，术后发现双氢睾酮偏低，雌二醇偏高。\n过 去 史：平素健康，否认食物、药物过敏史，按当地预防接种。', '无', null, '健康查体', '无', '2017-07-03 09:50:06', null, null);
INSERT INTO `diagnose` VALUES ('677', '4158', '体检', '患儿现6个月龄，看体检结果。近1周大便次数偏多，日解3、4次。\n过 去 史：平素健康，BW3.3kg，混合喂养，否认食物、药物过敏史，按当地预防接种。', '无', null, '健康查体', '无', '2017-07-03 09:55:34', null, null);
INSERT INTO `diagnose` VALUES ('678', '4176', '要求检查康查体', '患儿家属要求健康查体\n过 去 史：平素健康，否认食物、药物过敏史，按当地预防接种。', '无', null, '健康查体', '无', '2017-07-03 10:05:57', null, null);
INSERT INTO `diagnose` VALUES ('679', '4177', '无', '患者6.21因疱疹性咽峡炎、支气管炎在我科住院治疗，好转出院，回家雾化治疗3天，现无咳嗽，有阵发性鼻鸣音，无张口呼吸，吃奶可，睡眠可。', '无', null, '支气管炎,疱疹性咽峡炎', '无', '2017-07-03 10:11:51', null, null);
INSERT INTO `diagnose` VALUES ('680', '4191', '123', '213', '', '', '胃癌化疗后', '', '2017-07-03 15:31:38', null, '213');
INSERT INTO `diagnose` VALUES ('681', '4175', '无', '患者原查TCT： 鳞状上皮内低度病变(LSIL)  ，HPV16等阳性 ，（宫颈）粘膜慢性炎伴“挖空”样细胞\n\n（宫颈管）少量破碎的颈管粘膜组织', '无', null, '宫颈炎性疾病', '无', '2017-07-04 14:37:32', null, null);
INSERT INTO `diagnose` VALUES ('682', '4180', '无', '有多囊卵巢综合症10年，达英多次治疗。2016-5生育，2017-5-2转经，10天干净，已经停止哺乳。', '无', null, '月经不规则', '无', '2017-07-04 14:45:46', null, null);
INSERT INTO `diagnose` VALUES ('683', '4182', '无', '2017-2因自述阴道流液炔诺酮治疗。治疗后诉月经量多。后更改药物后有好转。后又出现经量增多。lpm7.1.\n2016-5（宫颈管）破碎宫内膜及颈管粘膜组织，（宫腔）子宫内膜不规则增生', '无', null, '月经过多和频繁伴有规则周期', '无', '2017-07-04 14:59:10', null, null);
INSERT INTO `diagnose` VALUES ('684', '4184', '无', '1月前体检发现宫颈hpv33阳性。 tct nilm。 2016-12宫颈活检慢性炎。', '无', null, '宫颈炎性疾病', '无', '2017-07-04 15:07:06', null, null);
INSERT INTO `diagnose` VALUES ('685', '4213', '头疼', '头疼', '', '', '头疼', '', '2017-07-05 14:16:22', null, '休息');
INSERT INTO `diagnose` VALUES ('686', '4199', '无', '病史同前，患者现口服中药及其他药物治疗，自觉无不适，今当地医院复查ALT正常，AST异常ALP 异常。', '无', null, '肝病', '无', '2017-07-05 14:39:42', null, null);
INSERT INTO `diagnose` VALUES ('687', '4199', '无', '病史同前，患者现口服中药及其他药物治疗，自觉无不适，今当地医院复查ALT正常，AST异常ALP 异常。', '无', null, '肝病', '无', '2017-07-05 14:39:43', null, null);
INSERT INTO `diagnose` VALUES ('688', '4201', '无', '无', '无', null, '肝病', '无', '2017-07-05 14:56:52', null, null);
INSERT INTO `diagnose` VALUES ('689', '4221', '无', '无', '无', null, '流产', '无', '2017-07-06 08:26:44', null, null);
INSERT INTO `diagnose` VALUES ('690', '4221', '无', '无', '无', null, '流产', '无', '2017-07-06 08:26:45', null, null);
INSERT INTO `diagnose` VALUES ('691', '4220', '无', '无', '无', null, '皮肤裂伤', '无', '2017-07-06 08:35:46', null, null);
INSERT INTO `diagnose` VALUES ('692', '4225', '房间隔缺损、左肾肾盂分离', '房间隔缺损、左肾肾盂分离复查', '无', null, '房间隔缺损', '无', '2017-07-06 12:04:23', null, null);
INSERT INTO `diagnose` VALUES ('693', '4233', '无', '44天前患者孕25周时行引产术，经过顺利，无不适。7月1日恢复月经，7.6月经干净，要求预约阴超检查。', '无', null, '人工流产后随诊检查', '无', '2017-07-06 19:26:17', null, null);
INSERT INTO `diagnose` VALUES ('694', '4231', 'qw', 'qwe', '', 'qe', '埃博拉病毒病', '', '2017-07-07 10:52:36', null, 'qwe');
INSERT INTO `diagnose` VALUES ('695', '4240', '22', '222', '', '', '埃博拉病毒病', '', '2017-07-07 14:37:26', null, '2');
INSERT INTO `diagnose` VALUES ('696', '4252', '流涕1周。', '患儿1周前在无明显诱因下出现流涕，无发热，无咳嗽，自行口服小儿氨酚黄那敏颗粒治疗无好转，今晨起有少许咳嗽。', '平素健康，感冒时有喘息，否认异物吸入史何种疾病，治疗情况,否认肝炎、结核、疟疾史，否认肺炎、先天性心脏病病史，否认手术史、外伤史、输血史,否认食物、药物过敏史，按当地预防接种。', null, '急性咽炎', '无', '2017-07-10 09:42:27', null, null);
INSERT INTO `diagnose` VALUES ('697', '4275', '无', '无', '无', null, '脊柱侧弯', '无', '2017-07-12 10:40:55', null, null);
INSERT INTO `diagnose` VALUES ('698', '4218', '无', '乳房胀痛半年，来院就诊，互联网病人', '无', null, '乳腺腺病', '无', '2017-07-12 10:41:06', null, null);
INSERT INTO `diagnose` VALUES ('699', '4282', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-07-14 11:02:46', null, null);
INSERT INTO `diagnose` VALUES ('700', '4284', '1', '1', '1', '1', 'ABO血型不合', '', '2017-07-14 14:09:08', null, '1');
INSERT INTO `diagnose` VALUES ('701', '4245', '无', '无', '无', null, '高血压病,颈动脉硬化', '无', '2017-07-14 14:37:07', null, null);
INSERT INTO `diagnose` VALUES ('702', '4296', '主诉', '现病史', '哮喘,高脂血症', null, '诊断', '诊疗意见', '2017-07-17 11:45:03', null, null);
INSERT INTO `diagnose` VALUES ('703', '2781', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:26', null, null);
INSERT INTO `diagnose` VALUES ('704', '2781', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:27', null, null);
INSERT INTO `diagnose` VALUES ('705', '2781', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:27', null, null);
INSERT INTO `diagnose` VALUES ('706', '2781', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:32', null, null);
INSERT INTO `diagnose` VALUES ('707', '2770', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:39', null, null);
INSERT INTO `diagnose` VALUES ('708', '2781', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:43', null, null);
INSERT INTO `diagnose` VALUES ('709', '2770', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:43', null, null);
INSERT INTO `diagnose` VALUES ('710', '2800', '无', '无', '无', null, '咳嗽', '无', '2017-07-18 10:56:43', null, null);
INSERT INTO `diagnose` VALUES ('711', '2811', '无', '无', '无', null, '高血压病', '无', '2017-07-18 16:40:50', null, null);
INSERT INTO `diagnose` VALUES ('712', '4311', '无', '无', '无', null, '无', '无', '2017-07-19 08:30:48', null, null);
INSERT INTO `diagnose` VALUES ('713', '4310', '双下肢碾压伤后4月复查', ' 双下肢碾压伤后4月复查', '否认肝炎、结核等传染病病史,否认高血压病病史、糖尿病病史、心脏病病史、脑血管病病史、肺部疾病病史、肾病病史等重大疾病病史，否认药物过敏史。', null, '皮肤裂伤', '无', '2017-07-19 10:51:56', null, null);
INSERT INTO `diagnose` VALUES ('714', '4303', '先心复诊要求复查心超', '患儿原有先心病史，复查心超，患儿无发热，无咳嗽，无气促、发绀，无呕吐、腹泻，无抽搐、惊厥。', '无', null, '三尖瓣疾病', '无', '2017-07-19 14:20:18', null, null);
INSERT INTO `diagnose` VALUES ('715', '4326', '眼部疲劳', '眼睛酸痛一周', '无', null, '眼部疲劳', '眼部疲劳', '2017-07-19 18:18:48', null, null);
INSERT INTO `diagnose` VALUES ('716', '4294', '无', '服用桂枝茯苓丸有效。', '无', null, '腹痛', '无', '2017-07-20 14:20:25', null, null);
INSERT INTO `diagnose` VALUES ('717', '4294', '无', '服用桂枝茯苓丸有效。', '无', null, '腹痛', '无', '2017-07-20 14:21:19', null, null);
INSERT INTO `diagnose` VALUES ('718', '4294', '无', '服用桂枝茯苓丸有效。', '无', null, '腹痛', '无', '2017-07-20 14:24:43', null, null);
INSERT INTO `diagnose` VALUES ('719', '4331', '主诉', '先并使', '既往所', null, '诊断', '诊疗意见', '2017-07-20 15:07:30', null, null);
INSERT INTO `diagnose` VALUES ('720', '4331', '无', '无', '无', null, '无', '无', '2017-07-20 15:08:20', null, null);
INSERT INTO `diagnose` VALUES ('721', '4331', '无', '无', '无', null, '无', '无', '2017-07-20 15:08:20', null, null);
INSERT INTO `diagnose` VALUES ('722', '4331', '无', '无', '无', null, '无', '无', '2017-07-20 15:08:20', null, null);
INSERT INTO `diagnose` VALUES ('723', '4329', '眼睛疼痛', '眼睛疼', '无', null, '多休息', '多休息', '2017-07-20 16:17:35', null, null);
INSERT INTO `diagnose` VALUES ('724', '4331', '无', '无', '无', null, '无', '无', '2017-07-21 13:50:47', null, null);
INSERT INTO `diagnose` VALUES ('725', '4331', '无', '无', '无', null, '无', '无', '2017-07-21 13:50:48', null, null);
INSERT INTO `diagnose` VALUES ('726', '4331', '无', '无', '无', null, '无', '无', '2017-07-21 13:50:48', null, null);
INSERT INTO `diagnose` VALUES ('727', '4331', '无', '无', '无', null, '无', '无', '2017-07-21 13:50:49', null, null);
INSERT INTO `diagnose` VALUES ('728', '4331', '无', '无', '无', null, '无', '无', '2017-07-21 13:50:50', null, null);
INSERT INTO `diagnose` VALUES ('729', '4331', '无', '无', '无', null, '无', '无', '2017-07-21 13:50:50', null, null);
INSERT INTO `diagnose` VALUES ('730', '4357', '主诉', '馅饼岁', '哮喘,高脂血症', null, '撞到别人或意外被别人碰撞', '诊疗意见', '2017-07-21 15:28:49', null, null);
INSERT INTO `diagnose` VALUES ('731', '4358', '主诉', '馅饼岁', '哮喘,心脏病', null, '撞到别人或意外被别人碰撞', '这。老', '2017-07-21 15:30:02', null, null);
INSERT INTO `diagnose` VALUES ('732', '4361', '无', '无', '无', null, '头痛', '无', '2017-07-21 16:23:32', null, null);
INSERT INTO `diagnose` VALUES ('733', '4362', '主诉', '馅饼岁', '哮喘,高脂血症', null, '撞到别人或意外被别人碰撞', '诊疗已经', '2017-07-21 17:54:46', null, null);
INSERT INTO `diagnose` VALUES ('734', '4370', '主诉', '现病史', '哮喘,高脂血症', null, '撞到别人或意外被别人碰撞', '诊疗意见', '2017-07-24 09:28:36', null, null);
INSERT INTO `diagnose` VALUES ('735', '4317', '身材偏矮小      2007.4.7   10岁3个月\n父：162cm ，母：152cm，遗传身高：163.5cm', '患儿身高较同年龄正常儿童偏矮小，年生长速度不详', '无', null, '身材矮小症', '无', '2017-07-24 09:43:27', null, null);
INSERT INTO `diagnose` VALUES ('736', '4365', '发现外阴黄色分泌物5天', '患儿家属5天前发现其外阴有黄色分泌物，无哭闹不安，无发热，伴有臭味，至临海市第一人民医院做分泌物培养提示肺炎克雷伯菌，予头孢克肟颗粒口服治疗3天，分泌物有减少，臭味消失。\n过 去 史：平素健康，否认食物、药物过敏史，按当地预防接种。', '无', null, '急性外阴炎', '无', '2017-07-24 09:53:57', null, null);
INSERT INTO `diagnose` VALUES ('737', '4378', '主诉', '馅饼岁', '哮喘,心脏病', null, '撞到别人或意外被别人碰撞', '诊疗意见', '2017-07-24 13:52:32', null, null);
INSERT INTO `diagnose` VALUES ('738', '4385', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-07-25 11:34:52', null, null);
INSERT INTO `diagnose` VALUES ('739', '4308', '无', '患者半年前无明显诱因下出现白带异常，量多有异味。', '无', null, '慢性阴道炎', '无', '2017-07-25 14:55:03', null, null);
INSERT INTO `diagnose` VALUES ('740', '4394', '主诉', '现病史', '哮喘', null, '诊断', '无', '2017-07-25 16:43:09', null, null);
INSERT INTO `diagnose` VALUES ('741', '4396', '主诉', '现病史', '哮喘', null, '诊断', '无', '2017-07-25 16:43:48', null, null);
INSERT INTO `diagnose` VALUES ('742', '4407', '主诉', '现病史', '哮喘', null, '1', '无', '2017-07-25 16:44:24', null, null);
INSERT INTO `diagnose` VALUES ('743', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:44:38', null, null);
INSERT INTO `diagnose` VALUES ('744', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:44:38', null, null);
INSERT INTO `diagnose` VALUES ('745', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:44:38', null, null);
INSERT INTO `diagnose` VALUES ('746', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:44:43', null, null);
INSERT INTO `diagnose` VALUES ('747', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:44:43', null, null);
INSERT INTO `diagnose` VALUES ('748', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:44:43', null, null);
INSERT INTO `diagnose` VALUES ('749', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:41', null, null);
INSERT INTO `diagnose` VALUES ('750', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:42', null, null);
INSERT INTO `diagnose` VALUES ('751', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:42', null, null);
INSERT INTO `diagnose` VALUES ('752', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:43', null, null);
INSERT INTO `diagnose` VALUES ('753', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:44', null, null);
INSERT INTO `diagnose` VALUES ('754', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:44', null, null);
INSERT INTO `diagnose` VALUES ('755', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:44', null, null);
INSERT INTO `diagnose` VALUES ('756', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:45', null, null);
INSERT INTO `diagnose` VALUES ('757', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:46', null, null);
INSERT INTO `diagnose` VALUES ('758', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:46', null, null);
INSERT INTO `diagnose` VALUES ('759', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:47', null, null);
INSERT INTO `diagnose` VALUES ('760', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:47', null, null);
INSERT INTO `diagnose` VALUES ('761', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:47', null, null);
INSERT INTO `diagnose` VALUES ('762', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:48', null, null);
INSERT INTO `diagnose` VALUES ('763', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:49', null, null);
INSERT INTO `diagnose` VALUES ('764', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:49', null, null);
INSERT INTO `diagnose` VALUES ('765', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:50', null, null);
INSERT INTO `diagnose` VALUES ('766', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:50', null, null);
INSERT INTO `diagnose` VALUES ('767', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:50', null, null);
INSERT INTO `diagnose` VALUES ('768', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:45:50', null, null);
INSERT INTO `diagnose` VALUES ('769', '4331', '无', '无', '无', null, '无', '无', '2017-07-25 16:47:38', null, null);
INSERT INTO `diagnose` VALUES ('770', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:48:48', null, null);
INSERT INTO `diagnose` VALUES ('771', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:48:48', null, null);
INSERT INTO `diagnose` VALUES ('772', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:48:48', null, null);
INSERT INTO `diagnose` VALUES ('773', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:48:48', null, null);
INSERT INTO `diagnose` VALUES ('774', '4331', '无', '无', '无', null, '无', '无', '2017-07-25 16:48:48', null, null);
INSERT INTO `diagnose` VALUES ('775', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 16:49:00', null, null);
INSERT INTO `diagnose` VALUES ('776', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 16:49:00', null, null);
INSERT INTO `diagnose` VALUES ('777', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 16:49:00', null, null);
INSERT INTO `diagnose` VALUES ('778', '4331', '无', '无', '无', null, '无', '无', '2017-07-25 16:49:00', null, null);
INSERT INTO `diagnose` VALUES ('779', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 16:49:00', null, null);
INSERT INTO `diagnose` VALUES ('780', '4392', '999', '999', '哮喘', null, '999', '无', '2017-07-25 16:52:49', null, null);
INSERT INTO `diagnose` VALUES ('781', '4407', '8', '8', '哮喘', null, '8', '无', '2017-07-25 17:00:09', null, null);
INSERT INTO `diagnose` VALUES ('782', '4396', '', '无', '无', null, '无', '无', '2017-07-25 17:02:22', null, null);
INSERT INTO `diagnose` VALUES ('783', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:02:22', null, null);
INSERT INTO `diagnose` VALUES ('784', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:02:23', null, null);
INSERT INTO `diagnose` VALUES ('785', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:02:23', null, null);
INSERT INTO `diagnose` VALUES ('786', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:02:23', null, null);
INSERT INTO `diagnose` VALUES ('787', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:17', null, null);
INSERT INTO `diagnose` VALUES ('788', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:17', null, null);
INSERT INTO `diagnose` VALUES ('789', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:18', null, null);
INSERT INTO `diagnose` VALUES ('790', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:18', null, null);
INSERT INTO `diagnose` VALUES ('791', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:18', null, null);
INSERT INTO `diagnose` VALUES ('792', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:18', null, null);
INSERT INTO `diagnose` VALUES ('793', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:19', null, null);
INSERT INTO `diagnose` VALUES ('794', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:19', null, null);
INSERT INTO `diagnose` VALUES ('795', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:20', null, null);
INSERT INTO `diagnose` VALUES ('796', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:20', null, null);
INSERT INTO `diagnose` VALUES ('797', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:20', null, null);
INSERT INTO `diagnose` VALUES ('798', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:20', null, null);
INSERT INTO `diagnose` VALUES ('799', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:21', null, null);
INSERT INTO `diagnose` VALUES ('800', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:21', null, null);
INSERT INTO `diagnose` VALUES ('801', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:21', null, null);
INSERT INTO `diagnose` VALUES ('802', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:31', null, null);
INSERT INTO `diagnose` VALUES ('803', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:32', null, null);
INSERT INTO `diagnose` VALUES ('804', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:32', null, null);
INSERT INTO `diagnose` VALUES ('805', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:32', null, null);
INSERT INTO `diagnose` VALUES ('806', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:33', null, null);
INSERT INTO `diagnose` VALUES ('807', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:34', null, null);
INSERT INTO `diagnose` VALUES ('808', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:34', null, null);
INSERT INTO `diagnose` VALUES ('809', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:34', null, null);
INSERT INTO `diagnose` VALUES ('810', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:35', null, null);
INSERT INTO `diagnose` VALUES ('811', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:35', null, null);
INSERT INTO `diagnose` VALUES ('812', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:37', null, null);
INSERT INTO `diagnose` VALUES ('813', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:37', null, null);
INSERT INTO `diagnose` VALUES ('814', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:37', null, null);
INSERT INTO `diagnose` VALUES ('815', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:38', null, null);
INSERT INTO `diagnose` VALUES ('816', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:38', null, null);
INSERT INTO `diagnose` VALUES ('817', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:38', null, null);
INSERT INTO `diagnose` VALUES ('818', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:39', null, null);
INSERT INTO `diagnose` VALUES ('819', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:39', null, null);
INSERT INTO `diagnose` VALUES ('820', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:39', null, null);
INSERT INTO `diagnose` VALUES ('821', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:39', null, null);
INSERT INTO `diagnose` VALUES ('822', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:58', null, null);
INSERT INTO `diagnose` VALUES ('823', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:58', null, null);
INSERT INTO `diagnose` VALUES ('824', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:59', null, null);
INSERT INTO `diagnose` VALUES ('825', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:59', null, null);
INSERT INTO `diagnose` VALUES ('826', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:03:59', null, null);
INSERT INTO `diagnose` VALUES ('827', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:00', null, null);
INSERT INTO `diagnose` VALUES ('828', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:01', null, null);
INSERT INTO `diagnose` VALUES ('829', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:01', null, null);
INSERT INTO `diagnose` VALUES ('830', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:02', null, null);
INSERT INTO `diagnose` VALUES ('831', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:02', null, null);
INSERT INTO `diagnose` VALUES ('832', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:03', null, null);
INSERT INTO `diagnose` VALUES ('833', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:03', null, null);
INSERT INTO `diagnose` VALUES ('834', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:04', null, null);
INSERT INTO `diagnose` VALUES ('835', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:04', null, null);
INSERT INTO `diagnose` VALUES ('836', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:04', null, null);
INSERT INTO `diagnose` VALUES ('837', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:22', null, null);
INSERT INTO `diagnose` VALUES ('838', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:22', null, null);
INSERT INTO `diagnose` VALUES ('839', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:23', null, null);
INSERT INTO `diagnose` VALUES ('840', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:23', null, null);
INSERT INTO `diagnose` VALUES ('841', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:23', null, null);
INSERT INTO `diagnose` VALUES ('842', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:38', null, null);
INSERT INTO `diagnose` VALUES ('843', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:38', null, null);
INSERT INTO `diagnose` VALUES ('844', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:38', null, null);
INSERT INTO `diagnose` VALUES ('845', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:38', null, null);
INSERT INTO `diagnose` VALUES ('846', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:39', null, null);
INSERT INTO `diagnose` VALUES ('847', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:39', null, null);
INSERT INTO `diagnose` VALUES ('848', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:40', null, null);
INSERT INTO `diagnose` VALUES ('849', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:40', null, null);
INSERT INTO `diagnose` VALUES ('850', '4394', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:40', null, null);
INSERT INTO `diagnose` VALUES ('851', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:40', null, null);
INSERT INTO `diagnose` VALUES ('852', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:46', null, null);
INSERT INTO `diagnose` VALUES ('853', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:47', null, null);
INSERT INTO `diagnose` VALUES ('854', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:48', null, null);
INSERT INTO `diagnose` VALUES ('855', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:04:49', null, null);
INSERT INTO `diagnose` VALUES ('856', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:51', null, null);
INSERT INTO `diagnose` VALUES ('857', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:51', null, null);
INSERT INTO `diagnose` VALUES ('858', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:51', null, null);
INSERT INTO `diagnose` VALUES ('859', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:51', null, null);
INSERT INTO `diagnose` VALUES ('860', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:55', null, null);
INSERT INTO `diagnose` VALUES ('861', '4392', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:55', null, null);
INSERT INTO `diagnose` VALUES ('862', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:55', null, null);
INSERT INTO `diagnose` VALUES ('863', '4385', '无', '无', '无', null, '无', '无', '2017-07-25 17:05:56', null, null);
INSERT INTO `diagnose` VALUES ('864', '4409', '1', '1', '哮喘', null, '1', '无', '2017-07-25 17:09:44', null, null);
INSERT INTO `diagnose` VALUES ('865', '4410', '1', '1', '哮喘', null, '1', '无', '2017-07-25 17:09:59', null, null);
INSERT INTO `diagnose` VALUES ('866', '4411', '1', '1', '哮喘', null, '诊', '无', '2017-07-25 17:10:26', null, null);
INSERT INTO `diagnose` VALUES ('867', '4410', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:30', null, null);
INSERT INTO `diagnose` VALUES ('868', '4411', '', '无', '无', null, '无', '无', '2017-07-25 17:13:30', null, null);
INSERT INTO `diagnose` VALUES ('869', '4409', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:30', null, null);
INSERT INTO `diagnose` VALUES ('870', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:30', null, null);
INSERT INTO `diagnose` VALUES ('871', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:31', null, null);
INSERT INTO `diagnose` VALUES ('872', '4411', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:39', null, null);
INSERT INTO `diagnose` VALUES ('873', '4410', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:39', null, null);
INSERT INTO `diagnose` VALUES ('874', '4409', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:40', null, null);
INSERT INTO `diagnose` VALUES ('875', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:40', null, null);
INSERT INTO `diagnose` VALUES ('876', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:40', null, null);
INSERT INTO `diagnose` VALUES ('877', '4411', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:50', null, null);
INSERT INTO `diagnose` VALUES ('878', '4410', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:51', null, null);
INSERT INTO `diagnose` VALUES ('879', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:51', null, null);
INSERT INTO `diagnose` VALUES ('880', '4409', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:51', null, null);
INSERT INTO `diagnose` VALUES ('881', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:51', null, null);
INSERT INTO `diagnose` VALUES ('882', '4411', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:58', null, null);
INSERT INTO `diagnose` VALUES ('883', '4409', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:59', null, null);
INSERT INTO `diagnose` VALUES ('884', '4407', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:59', null, null);
INSERT INTO `diagnose` VALUES ('885', '4410', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:59', null, null);
INSERT INTO `diagnose` VALUES ('886', '4396', '无', '无', '无', null, '无', '无', '2017-07-25 17:13:59', null, null);
INSERT INTO `diagnose` VALUES ('887', '4411', '无', '无', '无', null, '无', '无', '2017-07-25 17:14:00', null, null);
INSERT INTO `diagnose` VALUES ('888', '4410', '无', '无', '无', null, '无', '无', '2017-07-25 17:14:01', null, null);
INSERT INTO `diagnose` VALUES ('889', '4409', '无', '无', '无', null, '无', '无', '2017-07-25 17:14:01', null, null);
INSERT INTO `diagnose` VALUES ('890', '4412', '主诉', '现病史', '哮喘', null, '1', '无', '2017-07-25 17:22:58', null, null);
INSERT INTO `diagnose` VALUES ('891', '4412', '无', '无', '无', null, '无', '无', '2017-07-25 17:23:19', null, null);
INSERT INTO `diagnose` VALUES ('892', '4412', '无', '无', '无', null, '无', '无', '2017-07-25 17:23:20', null, null);
INSERT INTO `diagnose` VALUES ('893', '4412', '无', '无', '无', null, '无', '无', '2017-07-25 17:23:21', null, null);
INSERT INTO `diagnose` VALUES ('894', '4412', '无', '无', '无', null, '无', '无', '2017-07-25 17:23:22', null, null);
INSERT INTO `diagnose` VALUES ('895', '4413', '无', '无', '无', null, '下肢静脉回流障碍', '无', '2017-07-25 17:23:37', null, null);
INSERT INTO `diagnose` VALUES ('896', '4418', '无', '1月前出现胃部不适，无恶心呕吐，无发热畏寒。', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '胃溃疡', '无', '2017-07-25 19:53:57', null, null);
INSERT INTO `diagnose` VALUES ('897', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:00:28', null, null);
INSERT INTO `diagnose` VALUES ('898', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:00:29', null, null);
INSERT INTO `diagnose` VALUES ('899', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:00:31', null, null);
INSERT INTO `diagnose` VALUES ('900', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:00:33', null, null);
INSERT INTO `diagnose` VALUES ('901', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:00:34', null, null);
INSERT INTO `diagnose` VALUES ('902', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:00:40', null, null);
INSERT INTO `diagnose` VALUES ('903', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:01:26', null, null);
INSERT INTO `diagnose` VALUES ('904', '4385', '无', '无', '无', null, '无', '无', '2017-07-26 10:01:26', null, null);
INSERT INTO `diagnose` VALUES ('905', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:01:27', null, null);
INSERT INTO `diagnose` VALUES ('906', '4385', '无', '无', '无', null, '无', '无', '2017-07-26 10:01:28', null, null);
INSERT INTO `diagnose` VALUES ('907', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:06:48', null, null);
INSERT INTO `diagnose` VALUES ('908', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:07', null, null);
INSERT INTO `diagnose` VALUES ('909', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:09', null, null);
INSERT INTO `diagnose` VALUES ('910', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:11', null, null);
INSERT INTO `diagnose` VALUES ('911', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:14', null, null);
INSERT INTO `diagnose` VALUES ('912', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:15', null, null);
INSERT INTO `diagnose` VALUES ('913', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:16', null, null);
INSERT INTO `diagnose` VALUES ('914', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:17', null, null);
INSERT INTO `diagnose` VALUES ('915', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:08:17', null, null);
INSERT INTO `diagnose` VALUES ('916', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 10:10:20', null, null);
INSERT INTO `diagnose` VALUES ('917', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:10:25', null, null);
INSERT INTO `diagnose` VALUES ('918', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 10:10:26', null, null);
INSERT INTO `diagnose` VALUES ('919', '4422', '主诉', '现病史', '高脂血症,心脏病,糖尿病,癫痫,病毒性肝炎,颈部手术,背部手术,刀刺伤', null, '哈哈', '无', '2017-07-26 10:27:55', null, null);
INSERT INTO `diagnose` VALUES ('920', '4422', '无', '无', '无', null, '无', '无', '2017-07-26 10:28:15', null, null);
INSERT INTO `diagnose` VALUES ('921', '4422', '全球', '轻轻', '高脂血症,心脏病,糖尿病,癫痫,病毒性肝炎,颈部手术,背部手术,刀刺伤', null, '悄悄', '亲戚', '2017-07-26 10:28:30', null, null);
INSERT INTO `diagnose` VALUES ('922', '4422', '无', '无', '无', null, '无', '无', '2017-07-26 10:28:38', null, null);
INSERT INTO `diagnose` VALUES ('923', '4422', '无', '无', '无', null, '无', '无', '2017-07-26 10:28:38', null, null);
INSERT INTO `diagnose` VALUES ('924', '4422', '无', '无', '无', null, '无', '无', '2017-07-26 10:36:25', null, null);
INSERT INTO `diagnose` VALUES ('925', '4425', '来咯弄', '来咯弄', '无', null, '\"氯霉素族有害效应	\"', '咯哦哦', '2017-07-26 10:57:03', null, null);
INSERT INTO `diagnose` VALUES ('926', '4331', '无', '无', '无', null, '无', '无', '2017-07-26 14:16:11', null, null);
INSERT INTO `diagnose` VALUES ('927', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 14:16:13', null, null);
INSERT INTO `diagnose` VALUES ('928', '4331', '无', '无', '无', null, '无', '无', '2017-07-26 14:16:36', null, null);
INSERT INTO `diagnose` VALUES ('929', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 14:16:36', null, null);
INSERT INTO `diagnose` VALUES ('930', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 14:40:39', null, null);
INSERT INTO `diagnose` VALUES ('931', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 14:40:42', null, null);
INSERT INTO `diagnose` VALUES ('932', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 14:41:01', null, null);
INSERT INTO `diagnose` VALUES ('933', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 14:41:05', null, null);
INSERT INTO `diagnose` VALUES ('934', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 14:41:06', null, null);
INSERT INTO `diagnose` VALUES ('935', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 14:41:22', null, null);
INSERT INTO `diagnose` VALUES ('936', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 14:41:25', null, null);
INSERT INTO `diagnose` VALUES ('937', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 14:41:31', null, null);
INSERT INTO `diagnose` VALUES ('938', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:05', null, null);
INSERT INTO `diagnose` VALUES ('939', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:25', null, null);
INSERT INTO `diagnose` VALUES ('940', '4331', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:36', null, null);
INSERT INTO `diagnose` VALUES ('941', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:36', null, null);
INSERT INTO `diagnose` VALUES ('942', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:36', null, null);
INSERT INTO `diagnose` VALUES ('943', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:37', null, null);
INSERT INTO `diagnose` VALUES ('944', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:38', null, null);
INSERT INTO `diagnose` VALUES ('945', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:38', null, null);
INSERT INTO `diagnose` VALUES ('946', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:39', null, null);
INSERT INTO `diagnose` VALUES ('947', '4409', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:50', null, null);
INSERT INTO `diagnose` VALUES ('948', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:50', null, null);
INSERT INTO `diagnose` VALUES ('949', '4331', '无', '无', '无', null, '无', '无', '2017-07-26 15:01:50', null, null);
INSERT INTO `diagnose` VALUES ('950', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 15:03:52', null, null);
INSERT INTO `diagnose` VALUES ('951', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:05:16', null, null);
INSERT INTO `diagnose` VALUES ('952', '4385', '无', '无', '无', null, '无', '无', '2017-07-26 15:05:41', null, null);
INSERT INTO `diagnose` VALUES ('953', '4396', '无', '无', '无', null, '无', '无', '2017-07-26 15:05:41', null, null);
INSERT INTO `diagnose` VALUES ('954', '4410', '无', '无', '无', null, '无', '无', '2017-07-26 15:05:41', null, null);
INSERT INTO `diagnose` VALUES ('955', '4412', '', '无', '无', null, '无', '无', '2017-07-26 15:28:46', null, null);
INSERT INTO `diagnose` VALUES ('956', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 15:28:47', null, null);
INSERT INTO `diagnose` VALUES ('957', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 15:28:48', null, null);
INSERT INTO `diagnose` VALUES ('958', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 15:28:57', null, null);
INSERT INTO `diagnose` VALUES ('959', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 15:29:13', null, null);
INSERT INTO `diagnose` VALUES ('960', '4392', '无', '无', '无', null, '无', '无', '2017-07-26 15:29:30', null, null);
INSERT INTO `diagnose` VALUES ('961', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 15:29:50', null, null);
INSERT INTO `diagnose` VALUES ('962', '4392', '无', '无', '无', null, '无', '无', '2017-07-26 15:29:50', null, null);
INSERT INTO `diagnose` VALUES ('963', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 15:29:51', null, null);
INSERT INTO `diagnose` VALUES ('964', '4392', '无', '无', '无', null, '无', '无', '2017-07-26 15:29:51', null, null);
INSERT INTO `diagnose` VALUES ('965', '4407', '', '无', '无', null, '无', '无', '2017-07-26 15:55:54', null, null);
INSERT INTO `diagnose` VALUES ('966', '4392', '无', '无', '无', null, '无', '无', '2017-07-26 15:57:40', null, null);
INSERT INTO `diagnose` VALUES ('967', '4368', '无', '2017年05月19日腔镜辅助甲状腺右侧腺叶+峡部切除+右侧中央区淋巴结清扫术,术后常规病理：（右侧+峡部）甲状腺微小乳头状癌，侵犯被膜伴“右中央区”淋巴结癌转移（2/3枚），服用优甲乐2片治疗', '无', null, '甲状腺恶性肿瘤', '无', '2017-07-26 15:59:39', null, null);
INSERT INTO `diagnose` VALUES ('968', '4399', '无', '无', '无', null, '无', '无', '2017-07-26 16:00:36', null, null);
INSERT INTO `diagnose` VALUES ('969', '4406', '乳腺癌术后复诊', '乳腺癌术后复诊，查胸部CT提示：右乳癌术后，余胸部HRCT扫描未见明显异常。附：肝实质密度减低，左侧甲状腺肿大。', '无', null, '乳腺恶性肿瘤', '无', '2017-07-26 16:05:55', null, null);
INSERT INTO `diagnose` VALUES ('970', '4412', '无', '无', '无', null, '无', '无', '2017-07-26 16:25:01', null, null);
INSERT INTO `diagnose` VALUES ('971', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 09:17:49', null, null);
INSERT INTO `diagnose` VALUES ('972', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 09:17:51', null, null);
INSERT INTO `diagnose` VALUES ('973', '4412', '无', '无', '无', null, '无', '无', '2017-07-27 13:53:32', null, null);
INSERT INTO `diagnose` VALUES ('974', '4385', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:31', null, null);
INSERT INTO `diagnose` VALUES ('975', '4385', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:33', null, null);
INSERT INTO `diagnose` VALUES ('976', '4385', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:37', null, null);
INSERT INTO `diagnose` VALUES ('977', '4385', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:42', null, null);
INSERT INTO `diagnose` VALUES ('978', '4394', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:45', null, null);
INSERT INTO `diagnose` VALUES ('979', '4394', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:46', null, null);
INSERT INTO `diagnose` VALUES ('980', '4394', '无', '无', '无', null, '无', '无', '2017-07-27 15:30:52', null, null);
INSERT INTO `diagnose` VALUES ('981', '4394', '无', '无', '无', null, '无', '无', '2017-07-27 15:31:13', null, null);
INSERT INTO `diagnose` VALUES ('982', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 15:37:27', null, null);
INSERT INTO `diagnose` VALUES ('983', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 15:37:28', null, null);
INSERT INTO `diagnose` VALUES ('984', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 15:37:32', null, null);
INSERT INTO `diagnose` VALUES ('985', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 15:37:35', null, null);
INSERT INTO `diagnose` VALUES ('986', '4412', '无', '无', '无', null, '无', '无', '2017-07-27 15:37:45', null, null);
INSERT INTO `diagnose` VALUES ('987', '4392', '无', '无', '无', null, '无', '无', '2017-07-27 15:37:45', null, null);
INSERT INTO `diagnose` VALUES ('988', '4472', '把健健康康vhjjkdbndj痕迹哦那你发火', '并积极健康比你们多大的打击宝贝你的秘密很纠结', '哮喘', null, '黄金季节', '不仅仅是可靠爸爸和姐姐你都不会很纠结白白净净的男女宝宝比较积极', '2017-07-27 15:43:01', null, null);
INSERT INTO `diagnose` VALUES ('989', '4474', '', ' 发现双乳结节1天，为进一步诊治来我院就诊。', '无', null, '乳房肿块', '无', '2017-07-27 17:31:14', null, null);
INSERT INTO `diagnose` VALUES ('990', '4474', '发现双乳结节1天', ' 发现双乳结节1天，为进一步诊治来我院就诊。', '无', null, '乳房肿块', '无', '2017-07-27 17:31:15', null, null);
INSERT INTO `diagnose` VALUES ('991', '4476', '主诉', '现病史', '哮喘', null, '1', '无', '2017-07-27 17:56:36', null, null);
INSERT INTO `diagnose` VALUES ('992', '4476', '', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 17:57:06', null, null);
INSERT INTO `diagnose` VALUES ('993', '4396', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 17:57:10', null, null);
INSERT INTO `diagnose` VALUES ('994', '4409', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 17:57:17', null, null);
INSERT INTO `diagnose` VALUES ('995', '4409', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 18:57:36', null, null);
INSERT INTO `diagnose` VALUES ('996', '4407', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 18:57:36', null, null);
INSERT INTO `diagnose` VALUES ('997', '4407', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 18:57:39', null, null);
INSERT INTO `diagnose` VALUES ('998', '4396', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 19:06:36', null, null);
INSERT INTO `diagnose` VALUES ('999', '4472', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 19:06:44', null, null);
INSERT INTO `diagnose` VALUES ('1000', '4487', '住宿', '啊', '哮喘', null, '啊', '啊', '2017-07-27 19:18:48', null, null);
INSERT INTO `diagnose` VALUES ('1001', '4410', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 19:51:18', null, null);
INSERT INTO `diagnose` VALUES ('1002', '4412', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 19:52:45', null, null);
INSERT INTO `diagnose` VALUES ('1003', '4412', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 19:52:46', null, null);
INSERT INTO `diagnose` VALUES ('1004', '4412', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 19:52:50', null, null);
INSERT INTO `diagnose` VALUES ('1005', '4490', '1', '小虫', '哮喘', null, '1', '啊', '2017-07-27 19:55:53', null, null);
INSERT INTO `diagnose` VALUES ('1006', '4476', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', '提取患者电子病历内容时发生错误, 错误信息无法创建到服务器的传输通道,请检查网络设置', null, '无', '无', '2017-07-27 20:14:53', null, null);
INSERT INTO `diagnose` VALUES ('1007', '4498', '了点', '额额额', '哮喘', null, '咯哦', '好，哦哦', '2017-07-28 09:22:29', null, null);
INSERT INTO `diagnose` VALUES ('1008', '4411', '无', '无', '无', null, '无', '无', '2017-07-28 14:08:38', null, null);
INSERT INTO `diagnose` VALUES ('1009', '4411', '无', '无', '无', null, '无', '无', '2017-07-28 14:08:40', null, null);
INSERT INTO `diagnose` VALUES ('1010', '4498', '无', '无', '无', null, '无', '无', '2017-07-28 14:34:05', null, null);
INSERT INTO `diagnose` VALUES ('1011', '4498', '无', '无', '无', null, '无', '无', '2017-07-28 14:34:08', null, null);
INSERT INTO `diagnose` VALUES ('1012', '4498', '无', '无', '无', null, '无', '无', '2017-07-28 14:34:10', null, null);
INSERT INTO `diagnose` VALUES ('1013', '4498', '无', '无', '无', null, '无', '无', '2017-07-28 14:34:24', null, null);
INSERT INTO `diagnose` VALUES ('1014', '4476', '无', '无', '无', null, '无', '无', '2017-07-28 16:07:05', null, null);
INSERT INTO `diagnose` VALUES ('1015', '4476', '无', '无', '无', null, '无', '无', '2017-07-28 16:07:10', null, null);
INSERT INTO `diagnose` VALUES ('1016', '4504', '住宿', '病史', '哮喘', null, '诊断', '诊疗', '2017-07-28 16:31:26', null, null);
INSERT INTO `diagnose` VALUES ('1017', '4490', '无', '无', '无', null, '无', '无', '2017-07-28 16:31:45', null, null);
INSERT INTO `diagnose` VALUES ('1018', '4516', '注入', '啊', '哮喘', null, '1', '1', '2017-07-28 16:46:14', null, null);
INSERT INTO `diagnose` VALUES ('1019', '4517', '注入', '小兵', '哮喘', null, '诊断', '无', '2017-07-28 17:19:51', null, null);
INSERT INTO `diagnose` VALUES ('1020', '4516', '无', '无', '无', null, '无', '无', '2017-07-28 17:20:14', null, null);
INSERT INTO `diagnose` VALUES ('1021', '4517', '无', '无', '无', null, '无', '无', '2017-07-28 17:20:21', null, null);
INSERT INTO `diagnose` VALUES ('1022', '4516', '无', '无', '无', null, '无', '无', '2017-07-28 17:20:21', null, null);
INSERT INTO `diagnose` VALUES ('1023', '4517', '无', '无', '无', null, '无', '无', '2017-07-28 17:20:22', null, null);
INSERT INTO `diagnose` VALUES ('1024', '4516', '无', '无', '无', null, '无', '无', '2017-07-28 17:20:22', null, null);
INSERT INTO `diagnose` VALUES ('1025', '4521', '1', '1', '哮喘', null, '1', '1', '2017-07-28 18:16:49', null, null);
INSERT INTO `diagnose` VALUES ('1026', '4521', '', '无', '无', null, '无', '无', '2017-07-28 18:18:08', null, null);
INSERT INTO `diagnose` VALUES ('1027', '4396', '无', '无', '无', null, '无', '无', '2017-07-31 09:22:29', null, null);
INSERT INTO `diagnose` VALUES ('1028', '4396', '无', '无', '无', null, '无', '无', '2017-07-31 09:22:29', null, null);
INSERT INTO `diagnose` VALUES ('1029', '4396', '无', '无', '无', null, '无', '无', '2017-07-31 09:22:31', null, null);
INSERT INTO `diagnose` VALUES ('1030', '4396', '无', '无', '无', null, '无', '无', '2017-07-31 09:22:33', null, null);
INSERT INTO `diagnose` VALUES ('1031', '4445', '身材偏矮小      2007.4.7   10岁3个月\n父：162cm ，母：152cm，遗传身高：163.5cm', '患儿身高较同年龄正常儿童偏矮小，年生长速度不详', '无', null, '身材矮小症', '无', '2017-07-31 09:35:12', null, null);
INSERT INTO `diagnose` VALUES ('1032', '4512', '咽痛不适2年。', '前开始有咽痛不适，较重，吞咽时咽痛加重，进食稍差，无畏寒、发热，咳嗽不明显，未做特殊处理。', '何种疾病，治疗情况否认肝炎、结核等传染病病史,否认高血压病病史、糖尿病病史、心脏病病史、脑血管病病史、肺部疾病病史、肾病病史等重大疾病病史，否认药物过敏史。', null, '慢性扁桃体炎', '无', '2017-07-31 16:24:15', null, null);
INSERT INTO `diagnose` VALUES ('1033', '4521', '无', '无', '无', null, '无', '无', '2017-07-31 16:56:23', null, null);
INSERT INTO `diagnose` VALUES ('1034', '4521', '无', '无', '无', null, '无', '无', '2017-07-31 16:56:25', null, null);
INSERT INTO `diagnose` VALUES ('1035', '4517', '无', '无', '无', null, '无', '无', '2017-08-01 06:38:03', null, null);
INSERT INTO `diagnose` VALUES ('1036', '4517', '无', '无', '无', null, '无', '无', '2017-08-01 06:38:04', null, null);
INSERT INTO `diagnose` VALUES ('1037', '4525', '无', '患者1年前体检发现子宫肌瘤3cm，7.31复查肌瘤4cm左右，月经不改变。\n外院2016-6 tct， hpv无异常', '无', null, '慢性阴道炎', '无', '2017-08-01 16:38:25', null, null);
INSERT INTO `diagnose` VALUES ('1038', '4549', '你你搜红米', 'X5破很墨迹', '糖尿病,皮肤软组织损伤', null, '图破坏墨迹', '无', '2017-08-02 17:37:21', null, null);
INSERT INTO `diagnose` VALUES ('1039', '4574', '换着用考虑他摸我预录取lz咯噢耶要我剧透下一组咯噢噢噢哦哦', '哦死猪呼呼呼呼', '脑卒中,血吸虫病', null, '估计和你计较', '退休', '2017-08-03 10:03:24', null, null);
INSERT INTO `diagnose` VALUES ('1040', '4579', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:13:43', null, null);
INSERT INTO `diagnose` VALUES ('1041', '4579', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:14:03', null, null);
INSERT INTO `diagnose` VALUES ('1042', '4579', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:14:07', null, null);
INSERT INTO `diagnose` VALUES ('1043', '4579', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:14:34', null, null);
INSERT INTO `diagnose` VALUES ('1044', '4579', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:16:10', null, null);
INSERT INTO `diagnose` VALUES ('1045', '4581', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:56:16', null, null);
INSERT INTO `diagnose` VALUES ('1046', '4581', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:56:39', null, null);
INSERT INTO `diagnose` VALUES ('1047', '4581', '主诉', '现病史', '哮喘', null, '诊断', '诊疗意见', '2017-08-03 17:56:58', null, null);
INSERT INTO `diagnose` VALUES ('1048', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 10:57:40', null, null);
INSERT INTO `diagnose` VALUES ('1049', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 10:59:03', null, null);
INSERT INTO `diagnose` VALUES ('1050', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 10:59:23', null, null);
INSERT INTO `diagnose` VALUES ('1051', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 11:09:14', null, null);
INSERT INTO `diagnose` VALUES ('1052', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 11:12:17', null, null);
INSERT INTO `diagnose` VALUES ('1053', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 13:15:27', null, null);
INSERT INTO `diagnose` VALUES ('1054', '4579', '无', '无', '无', null, '头痛', '无', '2017-08-06 13:47:02', null, null);
INSERT INTO `diagnose` VALUES ('1055', '4597', '了额来PK撒开了恶露负的了图谋女女', 'has咯吐的SQL乐途feel', '血吸虫病', null, 'PK图吐了', 'to兔兔老K', '2017-08-07 10:22:00', null, null);
INSERT INTO `diagnose` VALUES ('1056', '4599', '关键时刻', '加Q你HK', '无', null, '角化棘皮瘤', '无', '2017-08-07 10:58:48', null, null);
INSERT INTO `diagnose` VALUES ('1057', '4606', '主诉', '现病史', '哮喘', null, '诊断1', '诊疗意见', '2017-08-07 11:33:28', null, null);
INSERT INTO `diagnose` VALUES ('1058', '4612', '主诉', '现病史', '哮喘', null, '诊断1', '诊疗意见', '2017-08-07 15:49:56', null, null);
INSERT INTO `diagnose` VALUES ('1059', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:22:59', null, null);
INSERT INTO `diagnose` VALUES ('1060', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:23:17', null, null);
INSERT INTO `diagnose` VALUES ('1061', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:23:18', null, null);
INSERT INTO `diagnose` VALUES ('1062', '4645', '1', '1', '哮喘', null, '1', '1', '2017-08-07 17:25:33', null, null);
INSERT INTO `diagnose` VALUES ('1063', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:25:45', null, null);
INSERT INTO `diagnose` VALUES ('1064', '4646', '1', '1', '哮喘', null, '1', '1', '2017-08-07 17:28:50', null, null);
INSERT INTO `diagnose` VALUES ('1065', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:30:23', null, null);
INSERT INTO `diagnose` VALUES ('1066', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:19', null, null);
INSERT INTO `diagnose` VALUES ('1067', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:19', null, null);
INSERT INTO `diagnose` VALUES ('1068', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:23', null, null);
INSERT INTO `diagnose` VALUES ('1069', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:23', null, null);
INSERT INTO `diagnose` VALUES ('1070', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:26', null, null);
INSERT INTO `diagnose` VALUES ('1071', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:27', null, null);
INSERT INTO `diagnose` VALUES ('1072', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:29', null, null);
INSERT INTO `diagnose` VALUES ('1073', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:31', null, null);
INSERT INTO `diagnose` VALUES ('1074', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:33', null, null);
INSERT INTO `diagnose` VALUES ('1075', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:34', null, null);
INSERT INTO `diagnose` VALUES ('1076', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:35', null, null);
INSERT INTO `diagnose` VALUES ('1077', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:35', null, null);
INSERT INTO `diagnose` VALUES ('1078', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:38', null, null);
INSERT INTO `diagnose` VALUES ('1079', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:40', null, null);
INSERT INTO `diagnose` VALUES ('1080', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:41', null, null);
INSERT INTO `diagnose` VALUES ('1081', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:41', null, null);
INSERT INTO `diagnose` VALUES ('1082', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:42', null, null);
INSERT INTO `diagnose` VALUES ('1083', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:43', null, null);
INSERT INTO `diagnose` VALUES ('1084', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:51', null, null);
INSERT INTO `diagnose` VALUES ('1085', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:36:51', null, null);
INSERT INTO `diagnose` VALUES ('1086', '4647', '0', '0', '哮喘', null, '0', '0', '2017-08-07 17:38:57', null, null);
INSERT INTO `diagnose` VALUES ('1087', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:39:14', null, null);
INSERT INTO `diagnose` VALUES ('1088', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:39:14', null, null);
INSERT INTO `diagnose` VALUES ('1089', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:39:16', null, null);
INSERT INTO `diagnose` VALUES ('1090', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:39:17', null, null);
INSERT INTO `diagnose` VALUES ('1091', '4612', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:40:00', null, null);
INSERT INTO `diagnose` VALUES ('1092', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-08-07 17:40:00', null, null);
INSERT INTO `diagnose` VALUES ('1093', '4646', '无', '无', '无', null, '腹痛', '无', '2017-08-07 17:40:14', null, null);
INSERT INTO `diagnose` VALUES ('1094', '4649', '好几回一样', '干活结婚', '糖尿病,皮肤软组织损伤', null, '烟草戒断状态', '很多事', '2017-08-08 16:14:22', null, null);
INSERT INTO `diagnose` VALUES ('1095', '4657', '已经', '犯桃花', '', '', 'ABO血型不配合性反应,,', '', '2017-08-09 17:12:15', null, '偶记');
INSERT INTO `diagnose` VALUES ('1096', '4670', '头痛', '食物中毒', '阳光城', '一剪梅', '鞍背脑膜瘤,,', '', '2017-08-11 13:55:42', null, '食物中毒');
INSERT INTO `diagnose` VALUES ('1097', '4662', '', '年前， 患者无明显诱因四肢 躯干丘疹。为进一步诊治就诊\n过 去 史：平素健康何种疾病，治疗情况,否认肝炎史,否认高血压史,否认糖尿病史,否认药物过敏史,预防接种史不详。', '无', null, '皮肤血管瘤', '无', '2017-08-14 16:53:39', null, null);
INSERT INTO `diagnose` VALUES ('1098', '4684', '345', '345', '435', '345', '埃博拉病毒病丁胺卡那中毒非阿片样镇痛药、解热药和抗风湿药中毒', '', '2017-08-15 09:46:37', null, '35');
INSERT INTO `diagnose` VALUES ('1099', '4685', 'ret', 'ret', 'erte', 'ert', '埃博拉病毒病CA199升高', '', '2017-08-15 09:50:29', null, 'ert');
INSERT INTO `diagnose` VALUES ('1100', '4687', '好的好的好大的哈哈', '许多好多个', '无', null, '膝挫伤', '喜欢喜欢都好好的', '2017-08-15 10:04:01', null, null);
INSERT INTO `diagnose` VALUES ('1101', '4675', '无', '患者妊娠约2月，在我院产科查甲状腺功能示TSH：2.06 μIU/ml、FT4: 、FT3:正常，无怕冷、乏力、纳差。否认既往甲状腺病史。', '无', null, '甲状腺功能异常', '无', '2017-08-15 10:12:13', null, null);
INSERT INTO `diagnose` VALUES ('1102', '4675', '无', '患者妊娠约2月，在我院产科查甲状腺功能示TSH：2.06 μIU/ml、FT4: 、FT3:正常，无怕冷、乏力、纳差。否认既往甲状腺病史。', '无', null, '甲状腺功能异常', '无', '2017-08-15 10:12:14', null, null);
INSERT INTO `diagnose` VALUES ('1103', '4692', '1', '1', '', '', '鞍鼻', '', '2017-08-15 15:12:48', null, '1');
INSERT INTO `diagnose` VALUES ('1104', '4696', '主诉', '现病史', '无', null, '撞到别人或意外被别人碰撞', '1', '2017-08-15 15:30:31', null, null);
INSERT INTO `diagnose` VALUES ('1105', '4697', '主诉', '现病史', '无', null, '女性前列腺病', '无', '2017-08-15 15:32:23', null, null);
INSERT INTO `diagnose` VALUES ('1106', '4710', '萨芬的', '安抚', '', '', '鞍背脑膜瘤阿尔茨海默病阿尔茨海默病', '', '2017-08-16 09:52:51', null, '安抚');
INSERT INTO `diagnose` VALUES ('1107', '4713', '生日歌', '个', '', '', '艾迪生病危象鞍鼻阿尔茨海默病', '', '2017-08-16 10:06:17', null, '仍');
INSERT INTO `diagnose` VALUES ('1108', '4718', '测试测试测试测试测试测试', '测试测试测试测试测试测试', '测试测试测试测试测试测试', '测试测试测试测试测试测试', '磺胺类药过敏个人史', '', '2017-08-16 10:30:06', null, '测试测试测试测试测试测试');
INSERT INTO `diagnose` VALUES ('1109', '4716', '早上起来头痛', '浑身无力，提不起精神', '', '', '特指脑血管疾病,,', '', '2017-08-16 10:36:18', null, '中暑。');
INSERT INTO `diagnose` VALUES ('1110', '4722', '主诉', '现病史', '哮喘', null, '撞到别人或意外被别人碰撞', '无', '2017-08-16 11:25:19', null, null);
INSERT INTO `diagnose` VALUES ('1111', '4723', '主诉', '现病史', '无', null, '撞到别人或意外被别人碰撞', '无', '2017-08-16 11:31:31', null, null);
INSERT INTO `diagnose` VALUES ('1112', '4724', '1', '1', '无', null, '1', '无', '2017-08-16 11:39:08', null, null);
INSERT INTO `diagnose` VALUES ('1113', '4725', '1', '馅饼岁', '无', null, '1', '无', '2017-08-16 11:42:09', null, null);
INSERT INTO `diagnose` VALUES ('1114', '4730', '123', '123', '', '', 'ABO血型不配合性反应', '', '2017-08-16 13:54:40', null, '123');
INSERT INTO `diagnose` VALUES ('1115', '4732', '你休假喜欢的记得当年小超级从哪', '得不到的就不想那些大姐大年纪大打击', '无', null, '创伤性胫后动脉血栓形成', '无', '2017-08-16 14:07:17', null, null);
INSERT INTO `diagnose` VALUES ('1116', '4733', '11', '11', '', '', '感冒', '', '2017-08-16 14:44:20', null, '11');
INSERT INTO `diagnose` VALUES ('1117', '4721', '11', '11', '', '', 'ABO血型不合,,', '', '2017-08-16 17:43:12', null, '11');
INSERT INTO `diagnose` VALUES ('1118', '4740', '11', '11', '', '', '埃博拉病毒病,,', '', '2017-08-17 10:00:57', null, '11');
INSERT INTO `diagnose` VALUES ('1119', '4747', '主', '哇塞', '哮喘', null, '撞到别人或意外被别人碰撞', '无', '2017-08-17 16:26:11', null, null);
INSERT INTO `diagnose` VALUES ('1120', '4748', '主诉', '现病史', '无', null, '撞到别人或意外被别人碰撞', '无', '2017-08-17 16:41:02', null, null);
INSERT INTO `diagnose` VALUES ('1121', '4669', '咨询下颌后牙阻生疼痛情况。', '阻生齿经常引起牙龈发炎。', '无', null, '阻生齿', '无', '2017-08-18 17:07:03', null, null);
INSERT INTO `diagnose` VALUES ('1122', '4776', '测试', '测试', '', '', '咨询,,', '111', '2017-08-21 17:30:22', null, '测试');
INSERT INTO `diagnose` VALUES ('1123', '4786', '咳嗽三天', '无用药', '', '', '上呼吸道感染,,', '', '2017-08-21 18:01:07', null, '随访');
INSERT INTO `diagnose` VALUES ('1124', '4791', '风湿感冒严重', '流行感冒', '', '', '感冒,,', '', '2017-08-21 21:19:29', null, '打点滴');
INSERT INTO `diagnose` VALUES ('1125', '4797', 'AXA', ' 按时是', '', '', '鞍鼻,,', '萨达', '2017-08-22 09:29:18', null, ' 试试');
INSERT INTO `diagnose` VALUES ('1126', '4764', '无', '患者于1月前在我院行腹腔镜下双侧卵巢瘤剔除术+子宫内膜异位灶电灼术+盆腔粘连松解术，术后恢复好，无异常阴道流血、流液，无腹痛，腹胀，术后病理示：（左侧卵巢瘤）符合子宫内膜异位囊肿，（右侧卵巢瘤）符合子宫内膜异位囊肿。7.29注射gnrh，lmp8.17。', '无', null, '手术后恢复期', '无', '2017-08-22 14:54:00', null, null);
INSERT INTO `diagnose` VALUES ('1127', '4764', '无', '患者于1月前在我院行腹腔镜下双侧卵巢瘤剔除术+子宫内膜异位灶电灼术+盆腔粘连松解术，术后恢复好，无异常阴道流血、流液，无腹痛，腹胀，术后病理示：（左侧卵巢瘤）符合子宫内膜异位囊肿，（右侧卵巢瘤）符合子宫内膜异位囊肿。7.29注射gnrh，lmp8.17。', '无', null, '手术后恢复期', '无', '2017-08-22 14:54:00', null, null);
INSERT INTO `diagnose` VALUES ('1128', '4805', 'Jzhzdjxjjsjssjnsnsjssjsjdjxhxjjzdjdjdisjdjdndjdkdkdifo', 'Ft try day ff u. You fu by f fund u fig u fun y fu f guy f', '无', null, '会聚性共同性斜视', 'Hhhbj', '2017-08-22 15:46:14', null, null);
INSERT INTO `diagnose` VALUES ('1129', '4805', 'Jzhzdjxjjsjssjnsnsjssjsjdjxhxjjzdjdjdisjdjdndjdkdkdifo', 'Ft try day ff u. You fu by f fund u fig u fun y fu f guy f', '无', null, '会聚性共同性斜视', 'Hhhbj', '2017-08-22 15:58:33', null, null);
INSERT INTO `diagnose` VALUES ('1130', '4808', 'po po in', 'song g nin', '无', null, '致幻剂急性中毒', '无', '2017-08-22 16:20:52', null, null);
INSERT INTO `diagnose` VALUES ('1131', '4806', 'v准备都好都好对不对', '挺好好好干该喝喝该喝喝该喝喝唱个歌发个呼呼呵呵哈哈哈给他唱歌古古怪怪', '无', null, '钙化性膀胱炎', 'vhhhy', '2017-08-22 16:27:05', null, null);
INSERT INTO `diagnose` VALUES ('1132', '4803', '咳嗽一周', '咳嗽一周', '', '', '咨询,,', '', '2017-08-22 17:18:17', null, '多休息，多喝水');
INSERT INTO `diagnose` VALUES ('1133', '4814', 'test', 'test', '', '', '安定剂意外中毒,,', 'test', '2017-08-22 18:57:36', null, 'test');
INSERT INTO `diagnose` VALUES ('1134', '4815', '123', '213', '213', '123', 'SAPHO综合征非阿片样镇痛药、解热药和抗风湿药故意自毒及暴露于该类药物高氨基酸尿症', '', '2017-08-23 09:18:05', null, '123');
INSERT INTO `diagnose` VALUES ('1135', '4807', '测试', '测试', '', '', '白内障', '', '2017-08-23 10:43:28', null, '测试');
INSERT INTO `diagnose` VALUES ('1136', '4822', '潇洒', '大索道', '', '', '癌病恐怖,,', '', '2017-08-23 11:24:15', null, '爱仕达');
INSERT INTO `diagnose` VALUES ('1137', '4818', '大大', '差差多少', '', '', 'ABO血型不配合性反应,,', '差洒水擦拭', '2017-08-23 11:32:52', null, '擦擦是');
INSERT INTO `diagnose` VALUES ('1138', '4812', '123', '213', '213', '213', '埃博拉病毒病', '', '2017-08-23 11:48:50', null, '123');
INSERT INTO `diagnose` VALUES ('1139', '4827', '大大大', '阿达', '', '', '疱疹样皮炎,,', '', '2017-08-23 13:47:16', null, '阿达');
INSERT INTO `diagnose` VALUES ('1140', '4828', '11', '11', '', '', '阿哥拉沙门菌肠炎,,', '', '2017-08-23 16:15:18', null, '11');
INSERT INTO `diagnose` VALUES ('1141', '4833', 'asdfa', 'dfasdf', '', '', '鞍鼻,,', '', '2017-08-23 18:54:50', null, 'asdf');
INSERT INTO `diagnose` VALUES ('1142', '4834', '12321', '3213', '213', '213', '非阿片样镇痛药、解热药和抗风湿药故意自毒及暴露于该类药物肝癌喉癌放化疗后', '', '2017-08-24 09:11:50', null, '1233');
INSERT INTO `diagnose` VALUES ('1143', '4835', 's', 's', '无', null, '肾肥大', '无', '2017-08-24 10:30:27', null, null);
INSERT INTO `diagnose` VALUES ('1144', '4839', '兔兔', '，考虑', '无', null, 'u DJ了', '无', '2017-08-24 11:23:38', null, null);
INSERT INTO `diagnose` VALUES ('1145', '4841', '111', '11', '', '', '咨询,,', '', '2017-08-24 11:36:31', null, '1');
INSERT INTO `diagnose` VALUES ('1146', '4826', '快乐啊', '啦啦', '无', null, '滤泡性膀胱炎', '无', '2017-08-24 11:50:37', null, null);
INSERT INTO `diagnose` VALUES ('1147', '4842', '我啦啦啦啦啦啊啊啊', '啦啊，同俄啦啦啦啦啦', '无', null, '癌病恐怖', '拖拉机', '2017-08-24 11:52:24', null, null);
INSERT INTO `diagnose` VALUES ('1148', '4835', 's', 's', '无', null, '肾肥大', '无', '2017-08-24 11:53:38', null, null);
INSERT INTO `diagnose` VALUES ('1149', '4842', '我啦啦啦啦啦啊啊啊', '啦啊，同俄啦啦啦啦啦', '无', null, '癌病恐怖', '拖拉机', '2017-08-24 13:46:07', null, null);
INSERT INTO `diagnose` VALUES ('1150', '4843', 'xccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 'xccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 'xcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccxccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 'xccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', '唇部肿物VSD术后不安和激动', 'zxcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2017-08-24 13:54:54', null, 'xccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc');
INSERT INTO `diagnose` VALUES ('1151', '4836', '121233', '12313', '', '', '埃博拉病毒病', '', '2017-08-24 17:02:27', null, '12313');
INSERT INTO `diagnose` VALUES ('1152', '4851', '123', '123', '231', '213', '澳大利亚脑炎VSD术后精氨基琥珀酸尿症', '', '2017-08-25 09:47:44', null, '213');
INSERT INTO `diagnose` VALUES ('1153', '4856', '11', '11', '', '', '奥尔波特综合征,,', '', '2017-08-28 10:41:57', null, '11');
INSERT INTO `diagnose` VALUES ('1154', '4863', '65', '5656', '', '', '鞍背脑膜瘤', '', '2017-08-29 15:16:49', null, '5656');
INSERT INTO `diagnose` VALUES ('1155', '4858', ' 测试', ' 测试', '', '', '埃博拉病毒病,,', '', '2017-08-29 16:00:39', null, '测试');
INSERT INTO `diagnose` VALUES ('1156', '4868', '测试', '测试', '无', null, '让人', '无', '2017-08-30 16:15:39', null, null);
INSERT INTO `diagnose` VALUES ('1157', '4868', '无', '无', '无', null, '头痛', '无', '2017-08-30 16:33:26', null, null);
INSERT INTO `diagnose` VALUES ('1158', '4869', 'ces', 'ces', '', '', '鞍背脑膜瘤,,', '', '2017-08-30 17:24:13', null, 'ces ');
INSERT INTO `diagnose` VALUES ('1159', '4871', '头疼', '头疼', '', '', '头痛', '', '2017-08-30 18:54:12', null, '头疼');
INSERT INTO `diagnose` VALUES ('1160', '4870', '推荐', '刚刚', '', '', '单胎,,', '', '2017-08-30 19:41:29', null, '建议');
INSERT INTO `diagnose` VALUES ('1161', '4879', '体检', '患儿2月龄，每次吃奶100ml左右，1.5小时左右吃一次，腹部咕咕声明显，吃奶后仍有哭闹。体重增长情况不详。\n过 去 史：平素健康，否认食物、药物过敏史，按当地预防接种。', '无', null, '健康查体', '无', '2017-09-04 09:45:05', null, null);
INSERT INTO `diagnose` VALUES ('1162', '4879', '体检', '患儿2月龄，每次吃奶100ml左右，1.5小时左右吃一次，腹部咕咕声明显，吃奶后仍有哭闹。体重增长情况不详。\n过 去 史：平素健康，否认食物、药物过敏史，按当地预防接种。', '无', null, '健康查体', '无', '2017-09-04 09:45:05', null, null);
INSERT INTO `diagnose` VALUES ('1163', '4883', '测试', '测试', '', '', '白内障,,', '', '2017-09-04 17:01:14', null, '测试');
INSERT INTO `diagnose` VALUES ('1164', '2781', '无', '无', '无', null, '咳嗽', '无', '2017-09-04 17:30:01', null, null);
INSERT INTO `diagnose` VALUES ('1165', '4886', 'ces ', 'ca', '', '', '白内障,,', '', '2017-09-05 10:43:24', null, 'cw');
INSERT INTO `diagnose` VALUES ('1166', '4887', 'wq', 'wu', '', '', '阿尔茨海默病伴晚期发病,,', '', '2017-09-05 11:20:49', null, '休息');
INSERT INTO `diagnose` VALUES ('1167', '4882', '无', '用药后复查', '无', null, '妊娠相关情况', '无', '2017-09-05 14:03:51', null, null);
INSERT INTO `diagnose` VALUES ('1168', '4899', 'Zhus', 'Xianbings', '哮喘', null, '过敏性鼻炎', '无', '2017-09-05 18:34:28', null, null);
INSERT INTO `diagnose` VALUES ('1169', '4899', 'Zhus', 'Xianbings', '哮喘', null, '过敏性鼻炎', '无', '2017-09-05 18:34:41', null, null);
INSERT INTO `diagnose` VALUES ('1170', '4899', 'Zhus', 'Xianbings', '哮喘', null, '过敏性鼻炎', '无', '2017-09-05 18:34:45', null, null);
INSERT INTO `diagnose` VALUES ('1171', '4908', 'edstgwertg', 'wrt', 'wretrwetr', 'eter', '鞍鼻非阿片样镇痛药、解热药和抗风湿药中毒及暴露于该类药物，意图不确定磺胺类药过敏个人史', '', '2017-09-06 09:35:44', null, 'tertret');
INSERT INTO `diagnose` VALUES ('1172', '4950', '头痛一周', '头痛，闪电样头痛，无畏光，无恶心、呕吐，四肢活动无受限', '既往常年头痛', '无', '头痛,,', '', '2017-09-08 08:54:53', null, '检查、检验后进一步处理');
INSERT INTO `diagnose` VALUES ('1173', '4959', '头痛', '冠心病', '', '', '冠心病心律失常型,,', '低钠饮食。', '2017-09-08 15:14:04', null, '低钠饮食');
INSERT INTO `diagnose` VALUES ('1174', '4975', '腹痛1天', '下腹痛1天，无恶心/呕吐', '无殊', '', '腹痛,,', '', '2017-09-11 15:22:34', null, '建议至医院检查');
INSERT INTO `diagnose` VALUES ('1175', '4982', '外伤至右膝部疼痛出血2小时', '2小时前自行摔倒后至右膝关节疼痛出血，其余主诉无不是。查体：又膝关节疼痛，活动受限，腹部软，全腹部无压痛及反跳痛。', '无', '无', '外伤证,,', '保持伤口清洁，碘伏外涂', '2017-09-12 11:47:02', null, '清洁伤口，碘伏外涂。');
INSERT INTO `diagnose` VALUES ('1176', '4967', '左足甲沟红斑水疱4天', '4天前下雨天行走后左足拇指甲沟红斑水疱，戳破后渗出，局部瘙痒疼痛不明显。无发热畏寒等其他不适。\n哺乳中', '无', null, '甲沟炎', '无', '2017-09-12 15:50:42', null, null);
INSERT INTO `diagnose` VALUES ('1177', '4979', '10天', '患儿大便性状改变10天，隔2天解青色色水样便，日解1次，不含粘液脓血，每次量不多，无呕吐，无发热，体温最高 ℃。混合喂养，吃奶尚可。', '无', null, '婴儿肠炎', '无', '2017-09-12 16:33:59', null, null);
INSERT INTO `diagnose` VALUES ('1178', '4996', '1', '1', '', '', '11β-羟化酶缺陷症,,', '', '2017-09-13 09:30:23', null, '怕；');
INSERT INTO `diagnose` VALUES ('1179', '4996', '1', '1', '', '', '11β-羟化酶缺陷症,,', '', '2017-09-13 09:31:11', null, '怕；');
INSERT INTO `diagnose` VALUES ('1180', '4996', '1', '1', '', '', '11β-羟化酶缺陷症,,', '', '2017-09-13 09:31:24', null, '怕；');
INSERT INTO `diagnose` VALUES ('1181', '4999', '奶胀一天', '地方', '', '', '乳房病类,,', '挤乳', '2017-09-13 09:49:52', null, '地方');
INSERT INTO `diagnose` VALUES ('1182', '5000', '产后一周出血增多半天', '于2017-9-6平产分娩，今天上午突然阴道出血增多', '无', '无', '产后病类,,', '来院复查', '2017-09-13 10:04:54', null, '来医院复查B超');
INSERT INTO `diagnose` VALUES ('1183', '4994', '头痛流涕3天', '患者于3天前无明显诱因下出现头痛流涕', '无', '无', '急性上呼吸道感染,,', '', '2017-09-13 10:16:35', null, '建议查血常规');
INSERT INTO `diagnose` VALUES ('1184', '4994', '头痛流涕3天', '患者于3天前无明显诱因下出现头痛流涕', '无', '无', '急性上呼吸道感染,,', '', '2017-09-13 10:17:11', null, '建议查血常规');
INSERT INTO `diagnose` VALUES ('1185', '5001', '产后三天有阴道出血', '平产后三天阴道出血量同月经，色红', '', '', '产后病类,,', '保持会阴部清洁，必要时复查', '2017-09-13 11:01:07', null, '保持清洁卫生，如一周阴道出血还是鲜红来院复查');
INSERT INTO `diagnose` VALUES ('1186', '5001', '产后三天有阴道出血', '平产后三天阴道出血量同月经，色红', '', '', '产后病类,,', '保持会阴部清洁，必要时复查', '2017-09-13 11:01:57', null, '保持清洁卫生，如一周阴道出血还是鲜红来院复查');
INSERT INTO `diagnose` VALUES ('1187', '5012', 'PICC管回血3小时', '3小时前无明显诱因下发现PICC管回血，无手臂肿胀', '', '', '出血,,', '', '2017-09-13 15:14:50', null, '建议来医院PICC维护');
INSERT INTO `diagnose` VALUES ('1188', '5014', '咨询', '咨询PIICC', '', '', '咨询,,', '', '2017-09-13 15:30:25', null, '咨询');
INSERT INTO `diagnose` VALUES ('1189', '5016', 'PICC穿刺点出血1小时', '1小时无明显诱因下出现穿刺点出血，量少', '', '无', '咨询,,', '', '2017-09-13 16:14:17', null, '建议现在来院进行PICC维护');
INSERT INTO `diagnose` VALUES ('1190', '5009', '恶心呕吐2天', '患者于昨起出现恶心呕吐，呕吐为胃内容物，有反酸，感腹胀，无腹痛，无发热，无咽痛，无胸闷气急', '平素月经正常', '无', '胃炎,,', '1药物治疗\n2避免辛辣，酒食物\n3一周内复诊', '2017-09-13 16:17:44', null, '1药物治疗\n2避免辛辣，酒饮食\n3一周内复诊');
INSERT INTO `diagnose` VALUES ('1191', '5009', '恶心呕吐2天', '患者于昨起出现恶心呕吐，呕吐为胃内容物，有反酸，感腹胀，无腹痛，无发热，无咽痛，无胸闷气急', '平素月经正常', '无', '胃炎,,', '1药物治疗\n2避免辛辣，酒食物\n3一周内复诊', '2017-09-13 16:18:41', null, '1药物治疗\n2避免辛辣，酒饮食\n3一周内复诊');
INSERT INTO `diagnose` VALUES ('1192', '5015', '咨询', '咨询', '', '', '咨询,,', '', '2017-09-13 16:19:35', null, '建议来医院复查');
INSERT INTO `diagnose` VALUES ('1193', '5009', '恶心呕吐2天', '患者于昨起出现恶心呕吐，呕吐为胃内容物，有反酸，感腹胀，无腹痛，无发热，无咽痛，无胸闷气急', '平素月经正常', '无', '胃炎,,', '1药物治疗\n2避免辛辣，酒食物\n3一周内复诊', '2017-09-13 16:37:39', null, '1药物治疗\n2避免辛辣，酒饮食\n3一周内复诊');
INSERT INTO `diagnose` VALUES ('1194', '5009', '恶心呕吐2天', '患者于昨起出现恶心呕吐，呕吐为胃内容物，有反酸，感腹胀，无腹痛，无发热，无咽痛，无胸闷气急', '平素月经正常', '无', '胃炎,,', '1药物治疗\n2避免辛辣，酒食物\n3一周内复诊', '2017-09-13 16:41:05', null, '1药物治疗\n2避免辛辣，酒饮食\n3一周内复诊');
INSERT INTO `diagnose` VALUES ('1195', '5029', '测试', '测试', '无', null, '测试', '测试', '2017-09-15 11:34:20', null, null);
INSERT INTO `diagnose` VALUES ('1196', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 11:34:41', null, null);
INSERT INTO `diagnose` VALUES ('1197', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 14:10:26', null, null);
INSERT INTO `diagnose` VALUES ('1198', '4647', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-09-15 14:10:26', null, null);
INSERT INTO `diagnose` VALUES ('1199', '5029', '无', '无', '无', null, '腹痛', '无', '2017-09-15 14:10:27', null, null);
INSERT INTO `diagnose` VALUES ('1200', '4647', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-09-15 14:10:27', null, null);
INSERT INTO `diagnose` VALUES ('1201', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 14:10:27', null, null);
INSERT INTO `diagnose` VALUES ('1202', '5029', '无', '无', '无', null, '腹痛', '无', '2017-09-15 14:10:36', null, null);
INSERT INTO `diagnose` VALUES ('1203', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 14:10:36', null, null);
INSERT INTO `diagnose` VALUES ('1204', '5029', '无', '无', '无', null, '腹痛', '无', '2017-09-15 14:13:55', null, null);
INSERT INTO `diagnose` VALUES ('1205', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 14:13:55', null, null);
INSERT INTO `diagnose` VALUES ('1206', '5029', '无', '无', '无', null, '腹痛', '无', '2017-09-15 14:13:57', null, null);
INSERT INTO `diagnose` VALUES ('1207', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 14:13:58', null, null);
INSERT INTO `diagnose` VALUES ('1208', '4647', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-09-15 14:13:58', null, null);
INSERT INTO `diagnose` VALUES ('1209', '5036', '', '无', '无', null, '咳嗽', '无', '2017-09-15 14:18:44', null, null);
INSERT INTO `diagnose` VALUES ('1210', '5029', '无', '无', '无', null, '腹痛', '无', '2017-09-15 14:18:58', null, null);
INSERT INTO `diagnose` VALUES ('1211', '4647', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-09-15 14:18:58', null, null);
INSERT INTO `diagnose` VALUES ('1212', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-15 14:18:58', null, null);
INSERT INTO `diagnose` VALUES ('1213', '5048', 'ghg', 'yhhhh', 'ggg', 'ggg', '11β-羟化酶缺陷症,,', '', '2017-09-18 10:25:06', null, 'ggg');
INSERT INTO `diagnose` VALUES ('1214', '5051', '牙龈 肿痛2天', '患者2天前出现牙龈肿痛，无发热，对酸冷刺激无影响，无咳嗽，大便尚可', '', '', '牙周病,,', '1建议抗生素治疗\n2避免辣，烧烤等刺激食物\n3必要时上专科（口腔科）门诊进一步诊治', '2017-09-18 11:06:56', null, '1建议抗生素治疗\n2避免辣刺激食物\n3必要时上专科（口腔科）进一步诊治');
INSERT INTO `diagnose` VALUES ('1215', '5053', '的', '的', '', '', '11β-羟化酶缺陷症,,', '', '2017-09-18 11:12:52', null, '的');
INSERT INTO `diagnose` VALUES ('1216', '5051', '牙龈 肿痛2天', '患者2天前出现牙龈红肿疼痛，无发热，对酸冷刺激无影响，无咳嗽，大便尚可', '', '', '牙周病,,', '1建议抗生素治疗\n2避免辣，烧烤等刺激食物\n3必要时上专科（口腔科）门诊进一步诊治', '2017-09-18 11:12:56', null, '1建议抗生素治疗\n2避免辣刺激食物\n3必要时上专科（口腔科）进一步诊治');
INSERT INTO `diagnose` VALUES ('1217', '5052', '孕前咨询', '平时月经规则，吴不适主诉，孕前咨询', '无殊', '', '妇科检查,,', '', '2017-09-18 11:13:00', null, '建议至医院进行孕前相关检查，孕前3个月服用叶酸片预防神经管畸形');
INSERT INTO `diagnose` VALUES ('1218', '5056', '上火', '上火', '', '无', '火盛伤阴证,,', '', '2017-09-19 09:57:58', null, '多喝水，多吃些偏凉性的食物，可以用金银花等中药泡水喝。情况比较严重的可\n以服用一清胶囊，珍黄丸等药物以减轻症状。');
INSERT INTO `diagnose` VALUES ('1219', '5060', '停经36+周', '停经36+周，来院产检', '无殊', '无', '单胎,,', '', '2017-09-19 15:19:42', null, '复诊');
INSERT INTO `diagnose` VALUES ('1220', '5073', '停经33+周', '停经33+周，来院产检', '无殊', '', '单胎,,', '', '2017-09-19 16:32:10', null, '复查');
INSERT INTO `diagnose` VALUES ('1221', '5075', '停经足月产检', '停经36周，无不适', '无', '无', '单胎,,', '', '2017-09-20 09:24:15', null, 'B超检查');
INSERT INTO `diagnose` VALUES ('1222', '5074', 'aa', 'ff', '', '', '癌,,', '', '2017-09-20 09:52:20', null, 'jj');
INSERT INTO `diagnose` VALUES ('1223', '5081', '停经32周', '停经32周，咨询', '', '', '单胎,,', '', '2017-09-21 08:58:15', null, '随诊');
INSERT INTO `diagnose` VALUES ('1224', '5085', '备孕咨询', '备孕咨询', '', '', '单胎,,', '', '2017-09-21 14:30:20', null, '孕前夫妻双方检查');
INSERT INTO `diagnose` VALUES ('1225', '5076', '', '孕26周', '无', null, '妊娠相关情况', '无', '2017-09-21 16:53:09', null, null);
INSERT INTO `diagnose` VALUES ('1226', '5089', '停经35天，阴道流血3天', '末次月经2017-8-8', '', '', '先兆流产,,', '', '2017-09-22 08:59:05', null, '保胎治疗');
INSERT INTO `diagnose` VALUES ('1227', '5091', '下腹痛1小时', '今晨8时出现下腹痛', '', '', '腹痛,,', '', '2017-09-22 09:28:16', null, '检查');
INSERT INTO `diagnose` VALUES ('1228', '5095', '产后9天，阴道流血增多半天', '2017-9-13平产分娩，阴道流血未止，增多半天', '', '', '产后病类,,', '', '2017-09-22 14:29:41', null, '检查');
INSERT INTO `diagnose` VALUES ('1229', '5097', '大腿久坐后疼痛厉害。', '大腿疼痛。', '', '', '肌肉劳损,,', '', '2017-09-22 16:47:36', null, '针灸');
INSERT INTO `diagnose` VALUES ('1230', '5100', '久坐后腿疼。', '肌肉劳损，', '', '', '破伤风疫苗有害效应,损伤,', '', '2017-09-22 17:19:25', null, '针灸');
INSERT INTO `diagnose` VALUES ('1231', '5106', '剖宫产术后5天。', '产妇5天前在某医院行剖宫产术，现要求咨询产后护理相关注意事项。', '', '', '产后病类,,', '', '2017-09-25 08:45:52', null, '1、健康指导和宣教，科学坐月子。\n2、告知不适随诊。');
INSERT INTO `diagnose` VALUES ('1232', '5107', '产后50多天，乳胀1天', '产妇于50多天前平产分娩，产后恢复好，昨天开始有奶涨，局部硬块，无畏寒发热等不适。', '', '', '乳腺炎,,', '', '2017-09-25 09:28:01', null, '1、健康指导和宣教，勤吸吮和多吸吮\n2、手法挤奶和吸奶器使用\n3、局部热敷\n4、乳腺B超，门诊随诊');
INSERT INTO `diagnose` VALUES ('1233', '5105', '两侧乳房肿大半年    2011.2.4   6岁7个月\nBW：kg，父：cm，母：cm，遗传身高：cm', ' 患儿半年前无明显诱因下出现两侧乳房肿大，伴硬块，无触痛，身高增加不明显，无误服避孕药史。8.19在浙江省儿童医院诊断中枢性性早熟，于9.6予亮丙瑞林针皮下注射治疗1次，乳房肿块有缩小，近期家属发现患儿手臂汗毛比较粗长。', '无', null, '性早熟', '无', '2017-09-25 09:39:30', null, null);
INSERT INTO `diagnose` VALUES ('1234', '5110', '剖宫产术后3年，疤痕处痒', '患者3年前行剖宫产术，现下腹部疤痕处痒。', '', '', '剖宫产后伤口感染,,', '门诊随诊', '2017-09-25 10:16:53', null, '1、健康指导，保持局部皮肤清洁，注意手卫生\n2、不适门诊随诊');
INSERT INTO `diagnose` VALUES ('1235', '5109', '产后一周，奶涨发烧1天', '产妇产后一周，现奶涨发烧1天，体温38°，无畏寒发热，无咳嗽咳痰等不适。', '', '', '乳腺炎,,', '1、健康指导，勤吸吮\n2、适时挤奶，保持乳汁通常\n3、门诊随诊\n', '2017-09-25 10:35:08', null, '1、健康指导和宣教\n2、勤吸吮，手法挤奶，吸奶器使用\n3、门诊随诊');
INSERT INTO `diagnose` VALUES ('1236', '5108', '产后一周，奶涨2天', '一周前人民医院剖宫产术，现奶涨2天，体温38°，无畏寒发热，无咳嗽咳痰等。', '', '', '乳腺炎,,', '', '2017-09-25 10:52:47', null, '1、健康指导和宣教。\n2、勤吸吮，停奶粉。物理降温。\n3、手法挤奶和吸奶器使用。\n4、少食汤水。\n5、门诊随诊。');
INSERT INTO `diagnose` VALUES ('1237', '5114', '小腿疼痛', '腿疼', '', '', '肌肉劳损,,', '', '2017-09-25 14:31:47', null, '针灸');
INSERT INTO `diagnose` VALUES ('1238', '5101', '反复咳嗽经治疗3个月复诊。', '患儿曾有“急性支气管肺炎”在省儿童医院住院治疗1周左右好转出院，查尘螨可疑阳性，出院后一直有反复咳嗽伴喘息，每次发作需雾化3-4天能好转，但数天后又出现咳嗽，有喘息、喉头痰鸣，以晨起及夜间为著，无发热，无气促，无发绀，无异物吸入史，无呕吐、腹泻，无皮疹。否认哮喘家族史，否认结核患者接触史。父亲过敏体质，有过敏性鼻炎，酒精过敏。2017年6月7号开始用辅舒酮吸入，现咳嗽喘息好转。', '无', null, '哮喘性支气管炎', '无', '2017-09-25 15:29:40', null, null);
INSERT INTO `diagnose` VALUES ('1239', '5116', '饭后感觉不适应。', '消化系统问题', '', '', '消化不良,,', '', '2017-09-25 16:00:03', null, '多运动');
INSERT INTO `diagnose` VALUES ('1240', '5116', '饭后感觉不适应。', '消化系统问题', '', '', '消化不良,,', '', '2017-09-25 16:02:36', null, '多运动');
INSERT INTO `diagnose` VALUES ('1241', '5117', '牙龈发炎', '牙龈肿胀', '', '', '牙痈病,,', '', '2017-09-25 17:00:39', null, '消炎');
INSERT INTO `diagnose` VALUES ('1242', '5079', '反复面部粉刺丘疹3月', '3月前面部反复出现粉刺丘疹，无明显自觉症状，反复发作，当地治疗效果不佳。为进一步诊治就诊。', '平素健康何种疾病，治疗情况,否认肝炎史,否认高血压史,否认糖尿病史,否认药物过敏史,预防接种史不详。', null, '痤疮', '无', '2017-09-25 17:15:26', null, null);
INSERT INTO `diagnose` VALUES ('1243', '5125', '牙齿疼痛1天', '患者1天前出现牙痛不适，症状逐渐加重。', '无', '无', '牙痛,,', '', '2017-09-26 08:25:35', null, '建议来医院牙科检查一下。甲硝唑片最好在饭后半小时服用，而且在服用期间和中断服用三天不能饮酒，预防不良反应的发生。');
INSERT INTO `diagnose` VALUES ('1244', '5133', '咨询', '咨询', '', '', '咨询,,', '', '2017-09-26 10:50:28', null, '已回答');
INSERT INTO `diagnose` VALUES ('1245', '5135', '咨询', '咨询', '', '', '咨询,,', '', '2017-09-26 14:21:44', null, '已回答');
INSERT INTO `diagnose` VALUES ('1246', '5149', '咨询', '咨询', '', '', '咨询,,', '', '2017-09-26 14:31:57', null, '已回答完毕');
INSERT INTO `diagnose` VALUES ('1247', '5112', '无', '左下肢动、静脉瘘术后1月', '无', null, '下肢动静脉瘘,多处挫伤', '无', '2017-09-26 14:34:14', null, null);
INSERT INTO `diagnose` VALUES ('1248', '5199', '头痛，喉咙痛，流涕，但不多。', '头痛，喉咙痛，流涕，但不多。', '', '', '上呼吸道疾病,,', '多喝开水，多休息,清淡饮食。', '2017-09-27 08:35:09', null, '予以泰诺，芙朴感冒颗粒来解表。建议多喝开水，多休息，清淡饮食。');
INSERT INTO `diagnose` VALUES ('1249', '5200', '痛风多年', '现在痛风没发作，一直在服药', '', '', '痛风病,,', '合理饮食，禁酒，低盐。', '2017-09-27 09:03:42', null, '饮食控制，禁酒，戒烟。发病时，纠正服用药物的方法。');
INSERT INTO `diagnose` VALUES ('1250', '5212', '高血压', '高血压，消化道疾病', '', '', '高血压病,消化性溃疡,', '对症治疗，用玄宁，坎地沙坦控制血压。奥美拉唑，克拉霉素，阿莫灵，果胶铋抗幽门螺旋杆菌治疗。', '2017-09-27 10:53:29', null, '对症治疗，定期复查。');
INSERT INTO `diagnose` VALUES ('1251', '5087', '无', '病史同前，患者现改口服恩替卡韦抗病毒治疗，自觉无不适，今复查s14000。', '无', null, '慢性肝炎', '无', '2017-09-27 14:28:35', null, null);
INSERT INTO `diagnose` VALUES ('1252', '5124', '无', '病史同前，慢性肝炎,妊娠患者现口服替比夫定抗病毒治疗，自觉无不适，今复查肝功能正常，HBVDNA没有检查，怀孕。。', '无', null, '慢性肝炎,妊娠相关情况', '无', '2017-09-27 14:43:28', null, null);
INSERT INTO `diagnose` VALUES ('1253', '5223', '高血压，糖尿病', '高血压，糖尿病都控制较为稳定。偶有头晕，恶心。', '', '', '高血压病,糖尿病,', '低盐，低糖饮食，且少量多餐，适当运动。尊医嘱服用药物，定期测血糖及糖化血红蛋白，防止病变，若有不适及时就诊。', '2017-09-27 14:50:57', null, '给予合理用药建议，低盐，低糖饮食，且少量多餐，适当运动。尊医嘱服用药物，定期测血糖及糖化血红蛋白，防止病变，若有不适及时就诊。');
INSERT INTO `diagnose` VALUES ('1254', '5237', '奶奶患有心脏病，高血压及糖尿病。', '患者十年前患有心脏病，高血压及糖尿病', '', '', '2型糖尿病,高血压病,', '低盐，低糖饮食，禁酒，且少量多餐，适当运动。遵医嘱服用药物，建议药物使用最佳时间。定期测血糖及糖化血红蛋白，血压，防止病变，若有不适及时就诊。', '2017-09-27 15:21:13', null, '低盐，低糖饮食，禁酒，且少量多餐，适当运动。遵医嘱服用药物，建议药物使用最佳时间。定期测血糖及糖化血红蛋白，血压，防止病变，若有不适及时就诊。');
INSERT INTO `diagnose` VALUES ('1255', '5255', '吃饭后很久都不饿', '消化不良', '', '', '消化不良,消化道异物,', '', '2017-09-27 15:53:25', null, '多做有氧运动，');
INSERT INTO `diagnose` VALUES ('1256', '5256', '饭后许久不饿', '消化系统紊乱', '', '', '消化不良,,', '', '2017-09-27 15:56:13', null, '开药');
INSERT INTO `diagnose` VALUES ('1257', '5275', '产后三天注意事项', '产妇9月25日平产分娩，现母乳喂养充足，恶露量少于月经量，每天更换四次卫生巾，饮食规律，新手儿脐部干燥，无红肿，面色稍黄。人', '', '', '产后病类', '', '2017-09-28 08:19:11', null, '关注新生儿黄疸，产妇如有不适门诊随诊。');
INSERT INTO `diagnose` VALUES ('1258', '5276', '乳胀一天', '产妇产后三天，双侧乳房肿，皮肤无红，体温正常。', '', '', '产后病类,,', '患者是产妇家属', '2017-09-28 08:51:21', null, '勤吸吮，及时挤乳');
INSERT INTO `diagnose` VALUES ('1259', '5276', '乳胀一天', '产妇产后三天，双侧乳房肿，皮肤无红，体温正常。', '', '', '产后病类,,', '患者是产妇家属', '2017-09-28 08:51:32', null, '勤吸吮，及时挤乳');
INSERT INTO `diagnose` VALUES ('1260', '5277', '产后一年，肥胖，哈哈', '患者产后一年，断奶后身体肥胖', '', '', '产后病类,,', '', '2017-09-28 09:00:33', null, '加强运动，饮食控制');
INSERT INTO `diagnose` VALUES ('1261', '5278', '产后乳胀半天', '产妇产后四天，乳胀半天，皮肤无红肿。', '', '', '产后病类,,', '', '2017-09-28 09:06:00', null, '勤吸吮，及时挤乳。');
INSERT INTO `diagnose` VALUES ('1262', '5279', '月经淋漓不尽十天', '患者9月18日月经来潮，量如前，至今淋漓不尽。', '', '', '子宫不规则出血,,', '', '2017-09-28 09:12:14', null, '门诊B超、血检查。');
INSERT INTO `diagnose` VALUES ('1263', '5282', '测试0928', '测试0928', '', '', '消化不良,,', '', '2017-09-28 10:22:32', null, '通过测试');
INSERT INTO `diagnose` VALUES ('1264', '5284', 'ceshi 0928', 'ceshi 0928', '', '', '消化不良,,', '', '2017-09-28 10:23:58', null, '通过测试');
INSERT INTO `diagnose` VALUES ('1265', '5280', '新生儿吐奶半天', '新生儿出生2天，今上午开始吃奶后即有呕吐，约2次', '', '', '新生儿病类,,', '', '2017-09-28 10:28:35', null, '如呕吐频繁来院就诊。');
INSERT INTO `diagnose` VALUES ('1266', '5283', '测试', '财务', '', '', '胃炎,,', '', '2017-09-28 10:30:45', null, '额');
INSERT INTO `diagnose` VALUES ('1267', '5285', 'ddd', 'ddd', '', '', '11β-羟化酶缺陷症,,', '', '2017-09-28 10:44:58', null, 'ddd');
INSERT INTO `diagnose` VALUES ('1268', '5288', '测试主诉 ', '测试主诉', '', '', '头痛,,', '', '2017-09-28 14:40:34', null, '通过测试');
INSERT INTO `diagnose` VALUES ('1269', '5287', '测试', '测试', '', '', '胃炎,,', '', '2017-09-28 14:44:23', null, '测试');
INSERT INTO `diagnose` VALUES ('1270', '5289', '产后恶露淋漓不尽', '剖宫产术后第10天，有有点出血。', '', '', '产后恶露不绝病,,', '', '2017-09-29 08:24:06', null, '无特殊处理。');
INSERT INTO `diagnose` VALUES ('1271', '5301', '剖宫产术后第3天腹胀', '剖宫产术后腹胀', '', '', '产后腹痛病,,', '', '2017-09-29 08:29:52', null, '建议活动，开塞露处理。');
INSERT INTO `diagnose` VALUES ('1272', '5292', '停经足月', '停经40周产前检查', '', '', '单胎,,', '', '2017-09-29 08:37:46', null, '产科门诊就诊');
INSERT INTO `diagnose` VALUES ('1273', '5292', '停经足月', '停经40周产前检查', '', '', '单胎,,', '', '2017-09-29 08:38:18', null, '产科门诊就诊');
INSERT INTO `diagnose` VALUES ('1274', '5292', '停经足月', '停经40周产前检查', '', '', '单胎,,', '', '2017-09-29 08:39:49', null, '产科门诊就诊');
INSERT INTO `diagnose` VALUES ('1275', '5291', '停经70天，阴道出血1天', '停经70天，阴道出血1天', '', '', '先兆流产,,', '', '2017-09-29 08:46:05', null, '建议产科门诊检查。');
INSERT INTO `diagnose` VALUES ('1276', '5296', '白带量多1天', '白带量多', '', '', '阴道异常产妇医疗,,', '', '2017-09-29 08:55:00', null, '门诊随诊');
INSERT INTO `diagnose` VALUES ('1277', '5295', '停经30周产前检查', '停经30周，产前检查', '', '', '单胎,,', '', '2017-09-29 08:58:53', null, '产科门诊随诊。');
INSERT INTO `diagnose` VALUES ('1278', '5298', '产后', '产后', '无', null, '产后即时出血', '无', '2017-09-29 09:56:47', null, null);
INSERT INTO `diagnose` VALUES ('1279', '5298', '产后', '产后', '无', null, '产后即时出血', '无', '2017-09-29 09:56:56', null, null);
INSERT INTO `diagnose` VALUES ('1280', '5294', '不孕', '不孕5年', '无', null, '产后伤口血肿', '无', '2017-09-29 10:00:56', null, null);
INSERT INTO `diagnose` VALUES ('1281', '5294', '不孕', '不孕5年', '无', null, '产后伤口血肿', '无', '2017-09-29 10:01:14', null, null);
INSERT INTO `diagnose` VALUES ('1282', '5294', '不孕', '不孕5年', '无', null, '输精管结核', '无', '2017-09-29 10:01:43', null, null);
INSERT INTO `diagnose` VALUES ('1283', '5290', '阴道炎复查', '阴道炎复查', '无', null, '念珠菌性阴道炎', '无', '2017-09-29 13:26:31', null, null);
INSERT INTO `diagnose` VALUES ('1284', '5307', '1', '1', '无', null, '1', '无', '2017-09-29 14:15:59', null, null);
INSERT INTO `diagnose` VALUES ('1285', '5307', '无', '无', '无', null, '头痛', '无', '2017-09-29 14:19:03', null, null);
INSERT INTO `diagnose` VALUES ('1286', '5029', '无', '无', '无', null, '腹痛', '无', '2017-09-29 14:21:07', null, null);
INSERT INTO `diagnose` VALUES ('1287', '5036', '无', '无', '无', null, '咳嗽', '无', '2017-09-29 14:21:07', null, null);
INSERT INTO `diagnose` VALUES ('1288', '4646', '无', '无', '无', null, '腹痛', '无', '2017-09-29 14:21:07', null, null);
INSERT INTO `diagnose` VALUES ('1289', '5307', '无', '无', '无', null, '头痛', '无', '2017-09-29 14:21:08', null, null);
INSERT INTO `diagnose` VALUES ('1290', '4647', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-09-29 14:21:08', null, null);
INSERT INTO `diagnose` VALUES ('1291', '4868', '无', '无', '无', null, '头痛', '无', '2017-09-29 14:21:08', null, null);
INSERT INTO `diagnose` VALUES ('1292', '4645', '主诉测试', '现病史测试', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '头痛', '无', '2017-09-29 14:21:09', null, null);
INSERT INTO `diagnose` VALUES ('1293', '5308', '哒哒哒', '哒哒哒', '', '', '白内障,,', '', '2017-09-29 15:24:37', null, '哒哒哒');
INSERT INTO `diagnose` VALUES ('1294', '5322', '积食', '积食', '', '', '消化不良,,', '', '2017-09-30 14:40:35', null, '吃点西药');
INSERT INTO `diagnose` VALUES ('1295', '5353', '', '患儿3天前无诱因下出现腹泻，为黄色糊状，日解3-7次，无呕吐，无发热。口服凉茶及合生元益生菌治疗无好转。精神好，胃纳可，睡眠安。', '半个月前有腹泻史，服药后好转，按当地预防接种。', null, '肠炎', '无', '2017-10-09 09:40:41', null, null);
INSERT INTO `diagnose` VALUES ('1296', '5356', '停经2月，下腹部不适', '停经2月，无阴道流血，感下腹部不适，无明显疼痛', '无殊', '', '先兆流产,,', '', '2017-10-09 09:44:19', null, '地屈孕酮片口服');
INSERT INTO `diagnose` VALUES ('1297', '5357', '产后40天，血性恶露未干净', '平产后40天，阴道流血少量，未干净，无腹痛，暗褐色', '', '', '产后恶露不绝病,,', '', '2017-10-09 10:08:47', null, 'B超检查排除胎盘残留');
INSERT INTO `diagnose` VALUES ('1298', '5363', '潮热烦躁多汗1月', '其母亲近1月出现潮热烦躁多汗，性情改变', '', '', '更年期忧郁症,,', '', '2017-10-09 10:13:49', null, '性激素全套检查');
INSERT INTO `diagnose` VALUES ('1299', '5366', '剖宫产术后1月，下腹疼痛2天', '1月前剖宫产，经过顺利，血性恶露干净7天，2天前下腹隐痛不适', '', '', '产后腹痛病,,', '', '2017-10-09 10:41:56', null, 'B超检查');
INSERT INTO `diagnose` VALUES ('1300', '5367', '停经2月，产检咨询', '无腹痛，无阴道流血，咨询产检时间', '', '', '单胎,,', '', '2017-10-09 10:55:28', null, '停经3个月产检，建立保健册');
INSERT INTO `diagnose` VALUES ('1301', '5369', '剖宫产术后2年，反复下腹隐痛1月', '2年前因“疤痕子宫”剖宫产术，手术经过顺利。近1月疲劳后感下腹隐痛，反复出现，时好时剧，无发热，白带稍多', '', '', '腹痛,,', '', '2017-10-09 11:04:22', null, 'B超检查，妇科检查');
INSERT INTO `diagnose` VALUES ('1302', '5370', '腹痛2天', '腹痛2天', '', '', '腹痛,,', '', '2017-10-09 11:08:37', null, 'B超检查');
INSERT INTO `diagnose` VALUES ('1303', '5368', '停经27周，下腹下坠感1天余', '昨日久坐站立后出现下腹下坠感，无腹痛，无腹部硬感，无阴道流血流液，自觉胎动较多', '', '', '单胎', '', '2017-10-09 11:21:17', null, '多休息，明日来院产检，空腹检查');
INSERT INTO `diagnose` VALUES ('1304', '5351', '头晕 3月', '患者3月前无明显诱因下出现头晕，阵发性，无呕吐、耳鸣、耳聋、肢体活动障碍、发热，未诊治,症状持续存在。', '平素健康何种疾病，治疗情况,否认高血压、冠心病史,否认糖尿病史、脑血管病史、肾病史、肺部疾病史,否认食物、药物过敏史。有类风湿关节炎史', null, '椎基底动脉综合征', '无', '2017-10-09 16:40:54', null, null);
INSERT INTO `diagnose` VALUES ('1305', '5404', '产后一周，咳嗽咳痰', '产后一周，咳嗽咳痰', '', '', '产后病类,,', '', '2017-10-10 08:52:43', null, '线下门诊');
INSERT INTO `diagnose` VALUES ('1306', '5407', '产后一周，出汗多', '产后一周，出汗多', '', '', '产后汗病,,', '', '2017-10-10 09:00:39', null, '多喝水，勤换衣裤，保持清洁');
INSERT INTO `diagnose` VALUES ('1307', '5407', '产后一周，出汗多', '产后一周，出汗多', '', '', '产后汗病,,', '', '2017-10-10 09:03:07', null, '多喝水，勤换衣裤，保持清洁');
INSERT INTO `diagnose` VALUES ('1308', '5409', '产后20天，恶露不尽', '产后20天，恶露不尽', '', '', '产后病类,,', '', '2017-10-10 09:09:10', null, '必要时来医院B超检查');
INSERT INTO `diagnose` VALUES ('1309', '5411', '产后22天腹痛一天', '产后22天腹痛一天', '', '', '产后病类,,', '', '2017-10-10 09:44:25', null, '转线下门诊');
INSERT INTO `diagnose` VALUES ('1310', '5406', '产后一周，咳嗽咳痰3天', '患者产后1周，近3天有咳嗽咳痰。', '体健', '无', '产后病类,急性上呼吸道感染,', '', '2017-10-10 09:56:08', null, '开药');
INSERT INTO `diagnose` VALUES ('1311', '5413', '停经34周，自觉有宫缩', '孕妇已34周，近日自觉有宫缩，无腹痛。', '', '', '单胎,,', '', '2017-10-10 11:12:13', null, '建议产科门诊就诊，胎心监护，及时产检，自记胎动。');
INSERT INTO `diagnose` VALUES ('1312', '5414', '感冒，饭后腹部不适', '感冒，饭后腹部不适', '', '', '消化不良,感冒病,', '', '2017-10-10 13:34:31', null, '吃药');
INSERT INTO `diagnose` VALUES ('1313', '5433', '新生儿20天，脐带未脱落', '新生儿20天，脐带未脱落', '', '', '脐带过短新生儿,,', '', '2017-10-10 13:57:00', null, '来院处理');
INSERT INTO `diagnose` VALUES ('1314', '5434', '产后1周，恶露量多2天', '产后1周，阴道流恶露量多于月经量，色红，无异味。', '', '', '产后病类,,', '', '2017-10-10 14:09:12', null, '促进子宫收缩');
INSERT INTO `diagnose` VALUES ('1315', '5435', '产后10天，奶涨', '产后10天，奶涨', '', '', '产后病类,,', '', '2017-10-10 14:22:20', null, '勤吸吮，热敷');
INSERT INTO `diagnose` VALUES ('1316', '5445', '头痛一礼拜', '暂无', '', '', '鞍背脑膜瘤,,', '', '2017-10-10 17:39:16', null, '暂无');
INSERT INTO `diagnose` VALUES ('1317', '5445', '头痛一礼拜', '暂无', '', '', '鞍背脑膜瘤,,', '', '2017-10-10 17:39:28', null, '暂无');
INSERT INTO `diagnose` VALUES ('1318', '5445', '头痛一礼拜', '暂无', '', '', '鞍背脑膜瘤,,', '', '2017-10-10 17:39:36', null, '暂无');
INSERT INTO `diagnose` VALUES ('1319', '5452', 'PICC咨询', 'PICC护理咨询', '', '', '咨询,,', '', '2017-10-11 09:42:35', null, '维护咨询');
INSERT INTO `diagnose` VALUES ('1320', '5452', 'PICC咨询', 'PICC护理咨询', '', '', '咨询,,', '', '2017-10-11 09:43:18', null, '维护咨询');
INSERT INTO `diagnose` VALUES ('1321', '5451', '产后10天，咨询如何科学做月子和母乳喂养', '产妇10天前平产，现要求咨询科学坐月子和母乳喂养相关知识', '', '', '咨询,,', '', '2017-10-11 09:52:26', null, '健康指导和宣教');
INSERT INTO `diagnose` VALUES ('1322', '5450', '母乳喂养咨询', '产后八天母乳喂养咨询', '', '', '咨询,,', '', '2017-10-11 09:57:58', null, '提倡母乳喂养');
INSERT INTO `diagnose` VALUES ('1323', '5455', '产后15天，母乳不够吃', '产妇15天前平产，现乳汁不够', '', '', '咨询,,', '', '2017-10-11 10:08:20', null, '针对性专业的指导');
INSERT INTO `diagnose` VALUES ('1324', '5453', '产后八天，咨询母乳喂养期间，能否吃青霉素消炎药', '产后八天，有感冒，无咳嗽，发热', '', '', '咨询,,', '', '2017-10-11 10:30:27', null, '健康指导');
INSERT INTO `diagnose` VALUES ('1325', '5457', 'PICC卷边要怎么出来', '发现PICC薄膜卷边', '', '', '咨询,,', '', '2017-10-11 10:42:36', null, '及时到医院就诊，星期一，星期二，星期三上午换药室，平时时间到急诊科处理');
INSERT INTO `diagnose` VALUES ('1326', '5457', 'PICC卷边要怎么出来', '发现PICC薄膜卷边', '', '', '咨询,,', '', '2017-10-11 10:44:09', null, '及时到医院就诊，星期一，星期二，星期三上午换药室，平时时间到急诊科处理');
INSERT INTO `diagnose` VALUES ('1327', '5456', '孕4月，咨询保健', '怀孕4月，口淡，不爱喝开水', '', '', '咨询,,', '', '2017-10-11 13:50:04', null, '建议门诊查相关血化验');
INSERT INTO `diagnose` VALUES ('1328', '5469', '饭后肚子痛', '饭后肚子痛', '', '', '消化不良,,', '', '2017-10-11 16:16:48', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1329', '5470', '发热感冒，咽喉发炎', '发热感冒，咽喉发炎；智齿引起的面部浮肿。', '', '', '发热,,', '', '2017-10-11 17:06:47', null, '药物质量，拍片。');
INSERT INTO `diagnose` VALUES ('1330', '5479', '要求孕前咨询。', '平时月经规则,5-6/30天，末次月经：2017.10.01，要求孕前检查。', '无殊', '无殊', '遗传咨询,,', '', '2017-10-13 09:35:05', null, '1.建议线下化验检查。');
INSERT INTO `diagnose` VALUES ('1331', '5480', '新生儿出生24天，脐部流脓。', '新生儿于24天前本院行剖宫产分娩，现24天，脐部有流脓，无红肿。', '', '', '新生儿病类', '', '2017-10-13 09:47:50', null, '1.加强脐部护理；2.碘伏消毒2次/日。');
INSERT INTO `diagnose` VALUES ('1332', '5478', '左足拇指疼痛4天', '患者于4天前突出现左足拇指疼痛红肿，无发热，无明显活动受限，无头晕，无恶心呕吐', '既往有痛风，高血压史', '无过敏史', '痛风,高血压1级,', '1避免酒，少吃含嘌呤高的食物，如海产品，豆腐等，多饮开水（建议一般喝3000ml水，其中苏打水500ml)，平素清淡饮食，适当运动\n2药物治疗\n3一周内复诊', '2017-10-13 10:05:20', null, '1多饮开水（一般一天饮水3000ml,其中苏打水500ml) \n2建议化验尿酸，血常规\n2药物治疗\n3平时清淡饮食，避免酒，少吃嘌呤高的食物，如海产品，豆腐等\n4一周内复诊');
INSERT INTO `diagnose` VALUES ('1333', '5481', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无殊', '妇科检查,,', '', '2017-10-13 10:20:44', null, '建议孕前3个月服用叶酸片预防胎儿神经管畸形');
INSERT INTO `diagnose` VALUES ('1334', '5481', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无殊', '妇科检查', '', '2017-10-13 10:20:45', null, '建议孕前3个月服用叶酸片预防胎儿神经管畸形');
INSERT INTO `diagnose` VALUES ('1335', '5485', '阿莫西林的用法及注意事项', '因为“咳嗽”服用阿莫西林。', '', '', '咨询,,', '', '2017-10-13 10:54:58', null, '建议：一天三次，每次0.5g，用药前必须做皮试，如果出现皮疹或其它不良反应，及时来医院就诊。');
INSERT INTO `diagnose` VALUES ('1336', '5482', '下腹痛1天', '1天前感下腹痛，无阴道出血，无恶心呕吐，无发热，无腹泻', '无殊', '无', '腹痛,,', '', '2017-10-13 10:58:22', null, '建议至医院行B超检查');
INSERT INTO `diagnose` VALUES ('1337', '5487', '停经43天，下腹痛1天。', '月经规则，末次月经：2017.08.30，自测尿HCG阳性，昨始出现下腹痛，无阴道流血。', '', '', '先兆流产,,', '线下就诊', '2017-10-13 11:09:21', null, '建议来院查B超，线下就诊。');
INSERT INTO `diagnose` VALUES ('1338', '5487', '停经43天，下腹痛1天。', '月经规则，末次月经：2017.08.30，自测尿HCG阳性，昨始出现下腹痛，无阴道流血。', '', '', '先兆流产,,', '线下就诊', '2017-10-13 11:09:38', null, '建议来院查B超，线下就诊。');
INSERT INTO `diagnose` VALUES ('1339', '5484', '下腹痛一天', '患者于今早开始突出现下腹脐周疼痛，呈持续性痛，无恶心呕吐，有腹泻，呈水样，一天4，5次，无里急后重，无发热', '既往体健', '无', '腹泻,,', '', '2017-10-13 11:16:29', null, '1建议查血常规，大便常规。多饮开水，清淡饮食\n2药物治疗（如药物服后无好转，立即赴医院就诊）\n3一周内复诊');
INSERT INTO `diagnose` VALUES ('1340', '5489', '孕前检查咨询', '怀孕1+月，无恶心呕吐，无腹痛腹胀，无阴道流血流液', '', '', '妊娠病类,,', '线下就诊检查', '2017-10-13 11:16:46', null, '线下就诊检查，孕期首次检查。');
INSERT INTO `diagnose` VALUES ('1341', '5483', '停经40天，孕期咨询', '无腹痛，无阴道流血', '无殊', '无', '附带妊娠状态,,', '', '2017-10-13 11:18:10', null, '建议1周复查子宫附件B超');
INSERT INTO `diagnose` VALUES ('1342', '5483', '停经40天，孕期咨询', '无腹痛，无阴道流血', '无殊', '无', '附带妊娠状态,,', '', '2017-10-13 13:53:16', null, '建议1周复查子宫附件B超');
INSERT INTO `diagnose` VALUES ('1343', '5488', '进食后上腹胀痛5天', '患者于5天前开始出现中上腹部不适，感胀痛，无反酸，无恶心呕吐，无发热，无胸闷气急，有腹泻，为蛋花水样，3--4次/天，无里急后重,小便无殊', '', '', '胃肠炎,,', '', '2017-10-13 13:59:50', null, '1多喝开水，进段时间吃清淡易消化食物\n2建议化验血常规，大便常规，腹部B超\n3可以服用助消化止泻药物（如药物服后无好转或有不适，建议立即赴医院进一步诊治）\n4一周内复诊');
INSERT INTO `diagnose` VALUES ('1344', '5492', '孕前咨询', '现无腹痛，无发热，孕前咨询', '无殊', '无', '妇科检查,,', '', '2017-10-13 14:09:19', null, '建议孕前全面检查，孕前3个月服用叶酸片');
INSERT INTO `diagnose` VALUES ('1345', '5493', '停经2月，要求产前检查。', '平时月经规则，末次月经：2018.13，经量及性质同前。停经40+天有恶心呕吐，不剧，能进食。昨自测尿HCG 阳性。要求产前检查。', '无殊', '无', '职业健康查体,,', '', '2017-10-13 14:27:18', null, '1.注意休息及营养；2.保持环境舒适；3.建议来院线下首次孕前检查；4.腹痛或阴道流血等不适随诊。');
INSERT INTO `diagnose` VALUES ('1346', '5493', '停经2月，要求产前检查。', '平时月经规则，末次月经：2018.13，经量及性质同前。停经40+天有恶心呕吐，不剧，能进食。昨自测尿HCG 阳性。要求产前检查。', '无殊', '无', '职业健康查体,,', '', '2017-10-13 14:27:37', null, '1.注意休息及营养；2.保持环境舒适；3.建议来院线下首次孕前检查；4.腹痛或阴道流血等不适随诊。');
INSERT INTO `diagnose` VALUES ('1347', '5493', '停经2月，要求产前检查。', '平时月经规则，末次月经：2018.13，经量及性质同前。停经40+天有恶心呕吐，不剧，能进食。昨自测尿HCG 阳性。要求产前检查。', '无殊', '无', '职业健康查体,,', '', '2017-10-13 14:28:19', null, '1.注意休息及营养；2.保持环境舒适；3.建议来院线下首次孕前检查；4.腹痛或阴道流血等不适随诊。');
INSERT INTO `diagnose` VALUES ('1348', '5493', '停经2月，要求产前检查。', '平时月经规则，末次月经：2018.13，经量及性质同前。停经40+天有恶心呕吐，不剧，能进食。昨自测尿HCG 阳性。要求产前检查。', '无殊', '无', '职业健康查体,,', '', '2017-10-13 14:28:27', null, '1.注意休息及营养；2.保持环境舒适；3.建议来院线下首次孕前检查；4.腹痛或阴道流血等不适随诊。');
INSERT INTO `diagnose` VALUES ('1349', '5496', '停经50天，鼻塞流涕2天', '平素月经规则，LMP：2017.8.23，鼻塞流涕2天，无发热，无咳嗽咳痰，无腹痛，无阴道流血', '无殊', '无', '急性上呼吸道感染,附带妊娠状态,', '', '2017-10-13 14:28:35', null, '建议多饮开水，多休息，若有发热及时到医院就诊。');
INSERT INTO `diagnose` VALUES ('1350', '5497', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无', '妇科检查', '', '2017-10-13 14:48:35', null, '建议孕前全面检查，孕前3个月服用叶酸片');
INSERT INTO `diagnose` VALUES ('1351', '5490', '哺乳期用什么消炎药？', '患者在哺乳期，咨询用药。', '', '', '咨询,,', '', '2017-10-13 14:53:05', null, '建议最好去医院检查一下，不能麻木吃消炎药。');
INSERT INTO `diagnose` VALUES ('1352', '5498', '咳嗽5天', '患者5天前因受寒出现咳嗽，咳痰，痰为白色泡沫样，无发热，无鼻塞流涕，无咽痛，无胸闷气急，无腹痛腹泻', '', '', '咳嗽,,', '', '2017-10-13 15:00:11', null, '1多喝开水，注意保暖\n2建议血常规，肺cT检查\n3建议服用止咳化痰药\n4一周内复诊\n\n3建议血常规，肺CT');
INSERT INTO `diagnose` VALUES ('1353', '5499', '流涕伴咽痛2天', '患者于2天前因受寒后出现流清涕，咽痛。无发热，无咳嗽，无胸闷气急，无腹痛腹泻', '', '', '上呼吸道疾病,,', '', '2017-10-13 15:30:01', null, '1建议抗病毒药物治疗\n2多喝开水，注意保暖\n3一周内复诊');
INSERT INTO `diagnose` VALUES ('1354', '5504', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无', '妇科检查,,', '', '2017-10-13 16:07:51', null, '建议至医院全面检查，包括抽血化验，B超，宫颈癌筛查，孕前3个月需要服用叶酸片');
INSERT INTO `diagnose` VALUES ('1355', '5503', '乳胀伴发热2天。', '产后24天，哺乳期，近2天出现奶涨，伴发热，体温38.5℃，今测体温38℃。', '', '', '乳腺脓肿,,', '1.建议来院检查；2.暂停止哺乳；3.排空乳房', '2017-10-13 16:09:42', null, '1.建议来院下线就诊，排空乳房，暂停止哺乳。');
INSERT INTO `diagnose` VALUES ('1356', '5506', '测试', '测试', '', '', '肌肉劳损扳机指', '', '2017-10-13 16:12:48', null, '测试');
INSERT INTO `diagnose` VALUES ('1357', '5505', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无', '妇科检查,,', '', '2017-10-13 16:14:57', null, '建议至医院全面检查，包括血常规，肝肾功能，甲状腺功能等，B超，宫颈癌筛查，孕前3个月需服用叶酸片');
INSERT INTO `diagnose` VALUES ('1358', '5516', '213', '231', '', '', '安定中毒', '', '2017-10-16 09:29:21', null, '213');
INSERT INTO `diagnose` VALUES ('1359', '5525', '测试', '测试', '', '', '胸壁凹陷', '', '2017-10-16 10:24:25', null, '测试');
INSERT INTO `diagnose` VALUES ('1360', '5511', '无', '无', '无', null, '月经不规则', '无', '2017-10-16 11:38:53', null, null);
INSERT INTO `diagnose` VALUES ('1361', '5509', '无', '无', '无', null, '偏头痛', '无', '2017-10-16 11:51:19', null, null);
INSERT INTO `diagnose` VALUES ('1362', '5526', '312', '1234', '', '', '鞍背脑膜瘤123', '', '2017-10-16 15:18:38', null, '324');
INSERT INTO `diagnose` VALUES ('1363', '5544', '测试', '测试', '', '', '1型糖尿病', '', '2017-10-16 17:11:28', null, '测试');
INSERT INTO `diagnose` VALUES ('1364', '5546', '造口粘膜分离1周', '患者1周前出现造口周围粘膜分离，感疼痛不适，评分3分。', '', '', '糖尿病伴并发症,,', '', '2017-10-17 08:45:25', null, '建议线下医院处理');
INSERT INTO `diagnose` VALUES ('1365', '5552', '伤口疼痛1周', '患者1周前出现伤口疼痛，伴脓性液渗出2小时', '', '', '糖尿病伴并发症,,', '', '2017-10-17 10:30:49', null, '线下医院就诊');
INSERT INTO `diagnose` VALUES ('1366', '5551', '伤口疼痛1天', '主诉伤口疼痛1天，周围红肿', '', '', '手术后切口感染,,', '', '2017-10-17 10:37:33', null, '线下医院就诊');
INSERT INTO `diagnose` VALUES ('1367', '5554', '下腹痛1天', '右下腹疼痛1天，伴恶心呕吐2小时', '', '', '阑尾炎,,', '', '2017-10-17 10:45:57', null, '线下医院就诊');
INSERT INTO `diagnose` VALUES ('1368', '5556', '右足疼痛3天', '右足疼痛3天', '', '', '糖尿病伴并发症,,', '', '2017-10-17 13:12:08', null, '线下医院就诊');
INSERT INTO `diagnose` VALUES ('1369', '5558', '伤口疼痛3天', '伤口疼痛3天', '', '', '糖尿病伴并发症,,', '', '2017-10-17 13:23:45', null, '线下医院就诊');
INSERT INTO `diagnose` VALUES ('1370', '5559', '停经39+周', '停经39+周，要求住院剖宫产', '初胎剖宫产分娩', '', '单胎,,', '', '2017-10-17 15:54:43', null, '明日住院待产');
INSERT INTO `diagnose` VALUES ('1371', '5566', '111', '111', '无', null, '哈哈', '哈哈', '2017-10-17 21:51:38', null, null);
INSERT INTO `diagnose` VALUES ('1372', '5574', '停经2月，咨询产检时间', '末次月经2017.8.18，无腹痛，无阴道流血，B超提示活胎。咨询何时建立保健册，下次产检时间', '无殊', '无', '单胎,,', '', '2017-10-18 10:03:42', null, '3月当地卫生院建立保健册并产检，不适随诊');
INSERT INTO `diagnose` VALUES ('1373', '5575', '平产后2月，母乳喂养咨询', '母乳过多，小孩子容易呛奶', '', '', '产后即刻医疗照顾和检查,,', '', '2017-10-18 10:12:12', null, '食指及中指轻夹紧乳晕，减缓流速');
INSERT INTO `diagnose` VALUES ('1374', '5577', '停经4个月，下腹隐痛不适2天', '昨日开始下腹隐隐疼痛，牵拉感，无腹部硬感，无阴道流血，胎动未觉', '', '', '腹痛,,', '', '2017-10-18 10:26:43', null, '建议医院门诊查体，是否存在宫缩');
INSERT INTO `diagnose` VALUES ('1375', '5579', '停经60余天，阴道流血2天。', '前天晚阴道少了流血，鲜红色，无腹痛，无肉样组织排出', '剖宫产手术史', '无', '先兆流产,,', '', '2017-10-18 14:32:39', null, '医院复查B超');
INSERT INTO `diagnose` VALUES ('1376', '5580', '绝经后5年，阴道少许流血1天', '5年前绝经，无不适，昨日开始有少量鲜红色阴道流血，下腹隐痛不适。无进行性消瘦病史。', '无', '无', '绝经后出血,,', '', '2017-10-18 14:37:06', null, 'B超检查');
INSERT INTO `diagnose` VALUES ('1377', '5583', '常规产后随诊', '常规产后随诊', '', '', '常规产后随诊,,', '', '2017-10-18 15:46:22', null, '咨询正常');
INSERT INTO `diagnose` VALUES ('1378', '5591', '1', '1', '', '', '癌病恐怖,,', '', '2017-10-18 19:55:27', null, '1');
INSERT INTO `diagnose` VALUES ('1379', '5591', '1', '1', '', '', '癌病恐怖,,', '', '2017-10-18 19:55:38', null, '1');
INSERT INTO `diagnose` VALUES ('1380', '5591', '1', '1', '', '', '癌病恐怖', '', '2017-10-18 19:55:42', null, '1');
INSERT INTO `diagnose` VALUES ('1381', '5593', '1', '1', '', '', '鞍鼻', '', '2017-10-18 20:08:46', null, '1');
INSERT INTO `diagnose` VALUES ('1382', '5597', '近两天吸吮时间过长', '昨天开始宝宝整天几乎都在吸吮', '', '', '乳汁过少,,', '', '2017-10-19 08:59:57', null, '加强汤汁饮食，注意休息，催乳');
INSERT INTO `diagnose` VALUES ('1383', '5598', '奶涨一天', '今晨开始乳房胀痛，哈哈', '', '', '乳汁过少,,', '', '2017-10-19 09:11:31', null, '挤一挤');
INSERT INTO `diagnose` VALUES ('1384', '5599', '自觉不消化一天', '昨天晚饭后感上腹不适', '', '', '胃炎,,', '', '2017-10-19 09:17:51', null, '助消化药服用，清淡饮食。');
INSERT INTO `diagnose` VALUES ('1385', '5600', '奶涨半天', '今天开始感双侧乳房肿胀', '', '', '乳房病类,,', '', '2017-10-19 10:14:51', null, '挤乳');
INSERT INTO `diagnose` VALUES ('1386', '5601', '鼻塞半天', '今晨有鼻塞', '', '', '感冒病,,', '', '2017-10-19 10:20:02', null, '多喝水，注意保暖');
INSERT INTO `diagnose` VALUES ('1387', '5607', '1', '1', '', '', '埃博拉病毒病', '', '2017-10-19 17:07:02', null, '1');
INSERT INTO `diagnose` VALUES ('1388', '5602', '1', '1', '', '', '鞍鼻,,', '', '2017-10-19 17:58:25', null, '1');
INSERT INTO `diagnose` VALUES ('1389', '5605', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-10-19 18:32:49', null, null);
INSERT INTO `diagnose` VALUES ('1390', '5606', '1', '1', '无', null, '1', '无', '2017-10-19 20:09:07', null, null);
INSERT INTO `diagnose` VALUES ('1391', '5620', '孕早期失眠能否吃中药', '停经30+天，失眠，能否吃中药。', '', '', '上呼吸道疾病,,', '线下就诊检查', '2017-10-20 09:44:27', null, '注意休息，调整心态');
INSERT INTO `diagnose` VALUES ('1392', '5621', '产后第三天注意事项。', '平产产后第三天，会阴裂伤II°，注意事项。', '', '', '产后病类,,', '', '2017-10-20 10:00:36', null, '1.保持会阴清洁，不适随诊。\n2.保持泌乳通畅，排空乳房。\n3.保持房间空气通风，注意保暖。，');
INSERT INTO `diagnose` VALUES ('1393', '5621', '产后第三天注意事项。', '平产产后第三天，会阴裂伤II°，注意事项。', '', '', '产后病类,,', '', '2017-10-20 10:37:24', null, '1.保持会阴清洁，不适随诊。\n2.保持泌乳通畅，排空乳房。\n3.保持房间空气通风，注意保暖。，');
INSERT INTO `diagnose` VALUES ('1394', '5630', '剖宫产术后20天，咨询如何做月子，脐部异味如何处理。', '术后20天，脐部异味，无畏寒发热等不适。', '', '', '咨询,,', '', '2017-10-23 09:26:09', null, '健康指导，不适产科门诊随诊。');
INSERT INTO `diagnose` VALUES ('1395', '5631', '宝宝一天拉4-5次大便，是否正常？', '宝宝处于纯母乳喂养阶段，一天4-5次大便，黄色，水样。', '', '', '咨询,,', '', '2017-10-23 10:04:59', null, '健康指导。继续母乳喂养');
INSERT INTO `diagnose` VALUES ('1396', '5632', '孕4月，面部痒伴脱皮。', '孕4月，现面部痒伴脱皮。无皮疹。', '', '', '咨询,,', '', '2017-10-23 10:50:16', null, '健康指导，多饮水，适时抹点植物护肤品。');
INSERT INTO `diagnose` VALUES ('1397', '5633', '产后四天，奶涨', '产后四天，奶涨，无畏寒发热，无咳嗽咳痰。', '', '', '咨询,,', '', '2017-10-23 11:12:04', null, '按需哺乳，手法挤奶。\n');
INSERT INTO `diagnose` VALUES ('1398', '5633', '产后四天，奶涨', '产后四天，奶涨，无畏寒发热，无咳嗽咳痰。', '', '', '咨询,,', '', '2017-10-23 11:12:04', null, '按需哺乳，手法挤奶。\n');
INSERT INTO `diagnose` VALUES ('1399', '5624', '面部红斑丘疹脱屑 4 天', '患儿面部反复起红斑丘疹、脱屑，时有瘙痒，当地外涂药物治疗后无好转，今至我院就诊\n过 去 史：平素健康何种疾病，治疗情况,否认肝炎史,否认高血压史,否认糖尿病史,否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', '无', null, '婴儿湿疹', '无', '2017-10-23 16:24:02', null, null);
INSERT INTO `diagnose` VALUES ('1400', '5639', '孕前咨询', '妊娠前咨询', '无殊', '无殊', '健康查体,,', '', '2017-10-24 08:38:59', null, '建议产前完善血常规、生化等检查');
INSERT INTO `diagnose` VALUES ('1401', '5640', '停经2月', '停经2月，自测尿HCG阴性', '', '', '月经不规则,,', '', '2017-10-24 09:45:49', null, '建议完善B超复查');
INSERT INTO `diagnose` VALUES ('1402', '5641', '停经37周，自觉胎动增多1天', '自觉胎动增多1天，无腹痛，无阴道流血', '无殊', '无殊', '单胎,,', '', '2017-10-24 09:52:05', null, '建议至医院行胎心监护检查');
INSERT INTO `diagnose` VALUES ('1403', '5642', '关于分娩方式利弊的咨询', '产妇目前孕25+周，对自然分娩存在恐惧，咨询分娩方式选择以及利弊', '无殊', '无殊', '单胎,,', '', '2017-10-24 10:13:35', null, '建议定期产检，认识顺产优势，可考虑镇痛分娩');
INSERT INTO `diagnose` VALUES ('1404', '5644', '无不适主诉，孕前咨询', '妻子准备怀孕，孕前咨询，无不适主诉', '无殊', '无殊', '健康查体,,', '', '2017-10-24 10:15:55', null, '建议夫妻双方至医院行全面检查，包括血常规，肝功能，乙肝三系等项目，孕前三个月开始服用叶酸片预防胎儿神经管畸形。');
INSERT INTO `diagnose` VALUES ('1405', '5645', '剖宫产术后7天，切口有疼痛，咨询', '10.18本院行剖宫产术，现出院2天，偶有切口疼痛，无明显液体流出', '无殊', '无殊', '产褥期并发症,,', '', '2017-10-24 10:19:41', null, '继续予抗菌敷贴外用，保持切口清洁');
INSERT INTO `diagnose` VALUES ('1406', '5646', '产后三个月，下腹痛1天', '平产后三个月，感下腹痛1天，无发热，无尿频尿急尿痛', '无殊', '无殊', '腹痛,,', '', '2017-10-24 10:21:59', null, '建议至医院行B超及妇科检查，以排除有无盆腔炎可能。');
INSERT INTO `diagnose` VALUES ('1407', '5647', '停经2+月，劳累后偶有腹胀不适', '停经2+月，首次妊娠，劳累后偶有腹胀不适，无腹痛，休息可缓解，无阴道出血。', '无', '无', '单胎,,', '', '2017-10-24 10:26:29', null, '定期复查，注意休息，忌重体力活');
INSERT INTO `diagnose` VALUES ('1408', '5650', '孕前咨询', '既往有小三阳病史，之前曾正规治疗，拟妊娠，咨询。', '小三阳3年', '无', '健康查体,,', '', '2017-10-24 14:13:11', null, '1.完善肝功能检查；2.HBV DNA 检查');
INSERT INTO `diagnose` VALUES ('1409', '5648', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无殊', '妇科检查,,', '', '2017-10-24 14:38:56', null, '建议孕前全面检查，包括抽血化验，宫颈癌筛查等，孕前3个月需服用叶酸预防胎儿神经管畸形');
INSERT INTO `diagnose` VALUES ('1410', '5657', '产后42天复查', '产后42天，恶露已尽。', '无殊', '无', '常规产后随诊,,', '', '2017-10-24 15:50:07', null, '盆底康复治疗');
INSERT INTO `diagnose` VALUES ('1411', '5662', '产后泌乳少随诊', '产后70天，乳量减少数天，勤吸吮后乳量有增多。新生儿肠胀气比较明显。', '无殊', '无', '产后即刻医疗照顾和检查,,', '', '2017-10-25 10:26:12', null, '新生儿口服益生菌，吸允后竖抱新生儿拍后背把气拍出来，再放下');
INSERT INTO `diagnose` VALUES ('1412', '5660', '其女儿剖宫产后10天，便意感明显', '10天前剖宫产，有便意感，但大便解不出，便意感不是持续性存在', '', '', '产后大便难病,,', '', '2017-10-25 10:29:33', null, '可以适当应用开塞露，需养成晨起排便习惯，饮食调整，不能依赖开塞露');
INSERT INTO `diagnose` VALUES ('1413', '5663', '停经4+月，下腹疼痛好转', '7天前注意腹痛，休息后腹部不适明显好转，有感觉胎动', '', '', '产后腹痛病,,', '', '2017-10-25 10:46:36', null, '定期产科门诊产检');
INSERT INTO `diagnose` VALUES ('1414', '5661', '产后15天，乳汁明显不足', '其女儿剖宫产术后15天，一直乳汁量少，间隔1小时就想哺乳，孩子哭闹，无乳胀及乳块形成，无发热等其他不适', '无殊', '无', '产后即刻医疗照顾和检查,,', '', '2017-10-25 10:50:48', null, '勤吸允，母乳后如果奶量实在不足，孩子哭闹明显，可少量添加奶粉。');
INSERT INTO `diagnose` VALUES ('1415', '5664', '停经35周，如何监测胎动', '目前停经35周，感胎动与平时不一样，稍微减少，但每小时胎动在3-5次之间', '无殊', '无', '正常妊娠监督,,', '', '2017-10-25 11:03:59', null, '早中晚各数胎动1小时，三个小时胎动相加，乘以4，总数12小时胎动大于30次小于50次为正常。如果按小时，每小时胎动3-5次为正常，连续动为一次胎动。如果胎动有异常及时就诊');
INSERT INTO `diagnose` VALUES ('1416', '5666', '1', '1', '', '', 'ABO血型不合,,', '', '2017-10-25 17:39:35', null, '1');
INSERT INTO `diagnose` VALUES ('1417', '5667', '1', '1', '', '', '鞍鼻,,', '', '2017-10-25 17:43:24', null, '1');
INSERT INTO `diagnose` VALUES ('1418', '5668', '是', '啊算法', '', '', '鞍鼻,,', '', '2017-10-25 17:50:47', null, ' 发射点发 ');
INSERT INTO `diagnose` VALUES ('1419', '5669', '阿瑟东', '啊手动阀', '', '', '鞍鼻,,', '', '2017-10-25 18:12:58', null, '啊手动阀');
INSERT INTO `diagnose` VALUES ('1420', '5670', '1', '1', '', '', '癌病恐怖,,', '', '2017-10-25 20:08:54', null, '1');
INSERT INTO `diagnose` VALUES ('1421', '5672', '123', '123', '', '', '埃博拉病毒病,,', '', '2017-10-26 11:38:16', null, '123');
INSERT INTO `diagnose` VALUES ('1422', '5676', '阴道出血多三天', '三天前开始阴道出血增多伴血块', '', '', '产后病类,,', '', '2017-10-27 09:50:51', null, '门诊B超检查');
INSERT INTO `diagnose` VALUES ('1423', '5678', '喂奶困难', '新生儿衔接困难', '', '', '喂养困难和照管不当,,', '', '2017-10-27 10:12:45', null, '指导正确技巧');
INSERT INTO `diagnose` VALUES ('1424', '5679', '乳胀半天', '乳胀', '', '', '乳房病类,,', '', '2017-10-27 10:16:09', null, '挤乳');
INSERT INTO `diagnose` VALUES ('1425', '5680', '鼻塞', '鼻塞', '', '', '上呼吸道疾病,,', '', '2017-10-27 10:17:39', null, '多喝水');
INSERT INTO `diagnose` VALUES ('1426', '5680', '鼻塞', '鼻塞', '', '', '上呼吸道疾病,,', '', '2017-10-27 10:17:52', null, '多喝水');
INSERT INTO `diagnose` VALUES ('1427', '5677', '停经36周，自觉胎动增多1天。', '停经36周，自觉胎动减少1天。', '', '', '单胎,,', '自计胎动，一周来院检查，不适随诊。', '2017-10-27 10:18:23', null, '自计胎动，不适随诊。');
INSERT INTO `diagnose` VALUES ('1428', '5677', '停经36周，自觉胎动增多1天。', '停经36周，自觉胎动减少1天。', '', '', '单胎,,', '自计胎动，一周来院检查，不适随诊。', '2017-10-27 10:19:46', null, '自计胎动，不适随诊。');
INSERT INTO `diagnose` VALUES ('1429', '5681', '鼻塞半天', '鼻塞', '', '', '上呼吸道疾病,,', '', '2017-10-27 10:22:50', null, '喝水');
INSERT INTO `diagnose` VALUES ('1430', '5682', '月经过多', '月经过多', '', '', '内分泌、营养和代谢疾病并发于妊娠、分娩和产褥期,,', '', '2017-10-27 13:20:44', null, 'B超就诊');
INSERT INTO `diagnose` VALUES ('1431', '5684', '停经5+月，要求孕期检查。', '末次月经：2017.05.20，停经5+月，要求产前检查。', '无殊', '无殊', '妊娠病类,,', '', '2017-10-27 13:44:13', null, '1.空腹线下检查（OGTT）,自计胎动，膳食均衡，不适随诊。');
INSERT INTO `diagnose` VALUES ('1432', '5685', '月经不规则3月', '平时月经规则，周期30天，经量中等，经期30-32天，近3月出现月经周期20-40天，月经量时多时少，经期10-15天，末次月经：2017.10.15，至今未净。', '', '', '月经不规则,,', '', '2017-10-27 13:50:52', null, '1.子宫附件B超；2.性激素全套检查；3.线下行妇科检查。');
INSERT INTO `diagnose` VALUES ('1433', '5683', '孕前咨询。', '平时月经规则，周期30天，经期5-6天，经量中等，末次月经：2017.10.24，准备怀孕，咨询孕前检查。1-0-1-1，平产，人工流产一次，经过顺利。', '', '', '健康查体,,', '', '2017-10-27 13:57:18', null, '1.血常规/血凝/血生化全套/小便常规/孕产妇初筛/血型/宫颈癌筛查及阴道分泌物检查。必要时微量元素及TORCH检查，心电图等。');
INSERT INTO `diagnose` VALUES ('1434', '5688', '月经少数月。', '平时月经规则，周期30天，经量中等，无痛经。近数月月经量减少，约原来的一半。', '', '', '月经不规则,,', '', '2017-10-27 14:33:16', null, '1.性激素检查（月经2-3天）。维生素E胶囊1盒1#口服1次/日3.线下就诊。');
INSERT INTO `diagnose` VALUES ('1435', '5691', '停经11+2周，胸闷心慌数天', '近日有时饭后有胸闷心慌，一过性', '', '', '正常妊娠监督,,', '', '2017-10-30 10:12:48', null, '若频发发作，来院心电图检查');
INSERT INTO `diagnose` VALUES ('1436', '5694', '停经29+周，进食后腹部不适半天。', '昨晚饭（牛肉萝卜饺子）后下腹不适，无阴道流血，无腹部硬感，大便为稀便，次数无增加', '', '', '正常妊娠监督,,', '', '2017-10-30 10:29:10', null, '饮食注意调整，胃肠不好需少吃生冷食物及刺激性食物，如若大便次数增加，伴腹痛及时就医');
INSERT INTO `diagnose` VALUES ('1437', '5693', '产后45天，胸部有硬块', '今日乳腺有硬块，伴疼痛，无发热', '', '', '产后病类,,', '勤吸吮，哺乳前可热敷乳房，宝宝吸允时顺着腺管方向按摩', '2017-10-30 10:41:03', null, '热敷乳房，勤吸吮，吸允时顺着腺管方向按摩');
INSERT INTO `diagnose` VALUES ('1438', '5692', '产后2月，乳汁外溢', '有时乳汁会自行溢出', '', '', '产后乳汁自出病,,', '', '2017-10-30 11:20:12', null, '无需特殊处理，多休息，注意保持乳房清洁');
INSERT INTO `diagnose` VALUES ('1439', '5695', '停经4个月，阴道流血', '流血同月经量，无腹痛', '', '', '产后即时出血,,', '', '2017-10-30 11:33:41', null, '观察出血量，可能是月经来潮');
INSERT INTO `diagnose` VALUES ('1440', '5696', '停经35周，B超发现胎儿双顶径偏小一天', '昨日B超检查双顶径偏小，股骨长径6.3，宫高34，腹围106', '无', null, '正常妊娠监督', 'B超复查头围，腹围等指标综合评估是否存在小头畸形，胎儿生长受限情况，可以氨基酸营养治疗后评估疗效', '2017-10-30 15:29:01', null, null);
INSERT INTO `diagnose` VALUES ('1441', '5665', '下肢红斑、丘疹伴痒 1 周', ' 1周前无明显诱因局部出现红斑、丘疹，瘙痒明显，反复发作，无糜烂渗出。为进一步诊治就诊\n过 去 史：平素健康何种疾病，治疗情况,否认肝炎史,否认高血压史,否认糖尿病史,否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', '无', null, '皮炎', '无', '2017-10-30 16:34:20', null, null);
INSERT INTO `diagnose` VALUES ('1442', '5665', '下肢红斑、丘疹伴痒 1 周', ' 1周前无明显诱因局部出现红斑、丘疹，瘙痒明显，反复发作，无糜烂渗出。为进一步诊治就诊\n过 去 史：平素健康何种疾病，治疗情况,否认肝炎史,否认高血压史,否认糖尿病史,否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', '无', null, '皮炎', '无', '2017-10-30 16:34:21', null, null);
INSERT INTO `diagnose` VALUES ('1443', '5698', '孕20+周，何时四维B超，如何保健', '孕20+周，咨询何时四维B超\n', '', '', '咨询,,', '', '2017-10-31 09:53:01', null, '自数胎动，22-26周S四维B超');
INSERT INTO `diagnose` VALUES ('1444', '5699', '哺乳期间左侧奶涨', '哺乳期间左侧奶涨，无畏寒发热，无咳嗽咳痰。', '', '', '咨询,,', '', '2017-10-31 10:03:31', null, '勤吸吮，挤奶');
INSERT INTO `diagnose` VALUES ('1445', '5700', '剖宫产术后三月，咨询母乳喂养时间', '剖宫产术后三月，咨询母乳喂养时间', '', '', '咨询,,', '', '2017-10-31 10:14:40', null, '纯母乳喂养持续6月，母乳喂养可以持续到2周岁甚至更长\n');
INSERT INTO `diagnose` VALUES ('1446', '5702', '11', '11', '', '', '艾迪生病危象,,', '', '2017-10-31 14:03:54', null, '111');
INSERT INTO `diagnose` VALUES ('1447', '5701', '产后18天，哺乳期乳腺有刺痛感', '产后18天，双乳有刺痛感，无畏寒发热。', '', '', '咨询,,', '', '2017-10-31 14:38:09', null, '排空双乳，挤奶');
INSERT INTO `diagnose` VALUES ('1448', '5697', '面部红斑丘疹脱屑 1 月(互联网)', '患儿面部反复起红斑丘疹、脱屑，时有瘙痒，当地艾洛松涂药物治疗后好转，但反复发作。今至我院就诊\n过 去 史：平素健康何种疾病，治疗情况,否认肝炎史,否认高血压史,否认糖尿病史,否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史。', '无', null, '婴儿湿疹', '无', '2017-10-31 16:03:16', null, null);
INSERT INTO `diagnose` VALUES ('1449', '5707', '新生儿13天，面色黄疸未消退', '新生儿10.18分娩，剖宫产分娩；黄疸未消退，昨日浦江二院测TCB13，胃纳睡眠佳', '无殊', '无殊', '新生儿ABO溶血性黄疸,,', '', '2017-11-01 10:21:55', null, '隔日复查TCB');
INSERT INTO `diagnose` VALUES ('1450', '5710', '123', '213', '', '', '埃博拉病毒病', '', '2017-11-01 10:28:03', null, '213');
INSERT INTO `diagnose` VALUES ('1451', '5712', '备孕阶段，偶有月经中期分泌物偏多四月', '备孕阶段，偶有月经中期分泌物偏多4月，色清亮，无臭味，无瘙痒不适', '无殊', '无殊', '健康查体,,', '', '2017-11-01 10:40:14', null, '考虑排卵期正常改变');
INSERT INTO `diagnose` VALUES ('1452', '5713', '产后3月，同房后腹痛1天', '产后3月，同房后腹痛1天，无不规则阴道出血，无腹泻不适', '无殊', '无殊', '盆腔炎性肿物,,', '', '2017-11-01 10:54:50', null, '建议来院妇科检查后明确');
INSERT INTO `diagnose` VALUES ('1453', '5714', '停经25+周，腹部瘙痒4天', '停经25+周，腹部瘙痒4天，伴有皮疹。检查甘胆酸正常。', '无殊', '无殊', '皮疹,,', '', '2017-11-01 11:25:33', null, '炉甘石洗剂外用');
INSERT INTO `diagnose` VALUES ('1454', '5719', '停经43天', '停经43天，无不适。测尿HCG阴性。', '无殊', '无殊', '月经不规则,,', '', '2017-11-01 15:16:21', null, '建议完善B超，血HCG检查');
INSERT INTO `diagnose` VALUES ('1455', '5723', '备孕咨询', '拟怀孕，咨询', '否认疾病史', '无', '健康查体,,', '', '2017-11-02 08:40:18', null, '健康指导');
INSERT INTO `diagnose` VALUES ('1456', '5724', '备孕咨询', '拟怀孕，健康咨询', '既往体健', '无', '健康查体,,', '', '2017-11-02 10:12:51', null, '健康指导');
INSERT INTO `diagnose` VALUES ('1457', '4445', '身材偏矮小      2007.4.7   10岁3个月\n父：162cm ，母：152cm，遗传身高：163.5cm', '患儿身高较同年龄正常儿童偏矮小，年生长速度不详', '无', null, '身材矮小症', '无', '2017-11-02 11:14:22', null, null);
INSERT INTO `diagnose` VALUES ('1458', '5725', '健康咨询', '现年46岁，健康咨询', '既往体健', '无', '健康查体,,', '', '2017-11-02 13:42:43', null, '健康指导');
INSERT INTO `diagnose` VALUES ('1459', '5726', '白带豆渣样5天。', '平时月经规则，末次月经：2017.10.27，经净3天，近5天月经豆渣样，量多，伴外用阴道瘙痒。', '', '', '急性阴道炎,,', '线下医院', '2017-11-03 10:09:00', null, '线下医院就诊，白带常规检查，药物治疗。');
INSERT INTO `diagnose` VALUES ('1460', '5727', '停经41天。', '平时月经规则，末次月经：2017.09.23，停经41天，无腹痛腹胀，无恶心呕吐，', '', '', '月经不规则,,', '线下检查', '2017-11-03 10:30:44', null, '1.查尿HCG,子宫附件B超3.有情况随时就诊。');
INSERT INTO `diagnose` VALUES ('1461', '5728', '月经不尽20天。', '月经不规则5月，月经不尽10天，量多，含血凝块', '', '', '月经不规则,月经不规则,', '', '2017-11-03 10:56:49', null, '注意休息及保暖');
INSERT INTO `diagnose` VALUES ('1462', '5730', '月经期延长半月。', '月经不尽半月余。', '', '', '子宫内膜炎,,', '', '2017-11-03 11:02:44', null, '1.线下就诊');
INSERT INTO `diagnose` VALUES ('1463', '5731', '月经不规则', '月经不规则', '', '', '妊娠病类,,', '', '2017-11-03 11:08:44', null, '1.线下就诊');
INSERT INTO `diagnose` VALUES ('1464', '5732', 'crd', 'vrd', '', '', '白内障,,', '', '2017-11-03 15:22:24', null, 'gvbdx');
INSERT INTO `diagnose` VALUES ('1465', '5703', '口腔肿物切除术后3天咨询。', '患者3天前在本科行口腔肿物切除手术，术后恢复良好，现复查。', '无', null, '口腔肿物', '无', '2017-11-03 16:50:17', null, null);
INSERT INTO `diagnose` VALUES ('1466', '5741', '偶感喉咙干燥，无力', '偶感喉咙干燥，有无力感。', '房室传导阻滞', '', '房室传导阻滞,秋燥病,', '', '2017-11-06 14:33:00', null, '可以尝试炖雪梨冰糖喝，黄芪生脉饮口服。建议一周内进一步来医院检查。');
INSERT INTO `diagnose` VALUES ('1467', '5740', '经期阴道流血量多7天', '末次月经2017-10-15，经期阴道流血量多于月经量', '', '', '月经过多病,,', '', '2017-11-06 14:43:01', null, '建议B超检查');
INSERT INTO `diagnose` VALUES ('1468', '5742', '有点咳嗽，流涕，头晕', '有点咳嗽，流涕，头晕等上呼吸道感染的临床表现', '', '', '上呼吸道疾病,,', '', '2017-11-06 14:56:54', null, '多饮水，多休息。阿莫灵TID05g口服。');
INSERT INTO `diagnose` VALUES ('1469', '5738', '无', '患儿腹泻，一般次数，呼吸佳，体重增长好，考虑生理性腹泻可能性大。', '无', null, '胃肠炎', '无', '2017-11-07 08:56:19', null, null);
INSERT INTO `diagnose` VALUES ('1470', '5746', '感冒', '感冒头疼', '', '', '1型糖尿病性神经源性膀胱,,', '', '2017-11-07 14:47:41', null, '感冒');
INSERT INTO `diagnose` VALUES ('1471', '5748', '产后42天复查', '剖宫产产后42天，恶露已净', '无殊', '无', '常规产后随诊,,', '', '2017-11-07 16:01:28', null, '2周后复查');
INSERT INTO `diagnose` VALUES ('1472', '5750', '测试', '测试', '', '', '17α-羟化酶缺陷症,,', '', '2017-11-07 16:21:21', null, '测试');
INSERT INTO `diagnose` VALUES ('1473', '5751', '月经第一天，痛经明显。', '月经第一天，痛经明显，月经量中，无发热', '既往有痛经病史', '无', '痛经病,,', '', '2017-11-08 09:08:51', null, '注意休息，如果疼痛明显可以服用布洛芬类止痛药物。');
INSERT INTO `diagnose` VALUES ('1474', '5752', '停经2月，阴道流血1天。', '平素月经规则，末次月经2017.9.8日，阴道流血1天，无腹痛，无发热', '生育：0-0-0-0', '无', '先兆流产,,', '', '2017-11-08 09:15:14', null, '建议至医院行子宫附件B超检查，若为宫内孕，胚胎存活，可以予黄体酮针肌注保胎治疗，卧床休息。');
INSERT INTO `diagnose` VALUES ('1475', '5753', '白带量多3天，伴外阴瘙痒', '平素月经规则，LMP2017.10.28，近3天白带量多，黄色，伴外阴瘙痒', '无殊', '无', '急性阴道炎,,', '', '2017-11-08 09:24:28', null, '首先考虑为阴道炎，建议至阴道行白带常规检查。');
INSERT INTO `diagnose` VALUES ('1476', '5754', '孕前咨询', '无不适主诉，准备怀孕，孕前咨询', '无殊', '无', '咨询,,', '', '2017-11-08 09:28:44', null, '建议夫妻双方至医院进行一次全面的体检，女方在孕前3个月需服用叶酸片预防胎儿神经管畸形。');
INSERT INTO `diagnose` VALUES ('1477', '5755', '孕前咨询', '无不适主诉，孕前咨询', '无殊', '无', '咨询,,', '', '2017-11-08 09:34:37', null, '建议夫妻双方至医院进行一次全面的体检，女方在孕前3个月需服用叶酸片预防胎儿神经管畸形。');
INSERT INTO `diagnose` VALUES ('1478', '5766', '伤口肿痛2天', '2天前出现右足红肿，疼痛，无流脓', '', '', '糖尿病伴并发症,,', '', '2017-11-09 09:24:18', null, '建议线下门诊就诊');
INSERT INTO `diagnose` VALUES ('1479', '5766', '伤口肿痛2天', '2天前出现右足红肿，疼痛，无流脓', '', '', '糖尿病伴并发症,,', '', '2017-11-09 09:25:03', null, '建议线下门诊就诊');
INSERT INTO `diagnose` VALUES ('1480', '5767', '右足疼痛2天', '2天前出现右足红肿，疼痛', '', '', '糖尿病伴并发症,,', '', '2017-11-09 09:31:37', null, '建议线下医院就诊');
INSERT INTO `diagnose` VALUES ('1481', '5769', '疼痛', '疼痛', '', '', '糖尿病伴并发症,,', '', '2017-11-09 10:11:27', null, '建议线下医院就诊');
INSERT INTO `diagnose` VALUES ('1482', '5770', '头痛三天', '头痛三天', '', '', '头痛,,', '', '2017-11-09 11:13:15', null, '建议去内科会诊');
INSERT INTO `diagnose` VALUES ('1483', '5771', '胸闷', '胸闷', '', '', '冠状动脉粥样硬化性心脏病,,', '', '2017-11-09 11:32:43', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1484', '5761', '停经16+周，下腹隐痛2天。', '平素月经规则，末次月经：2017.6.25，近2天出现下腹隐痛，无阴道流血流液。', '', '', '妊娠病类,,', '', '2017-11-09 14:22:32', null, '1.线下检查。');
INSERT INTO `diagnose` VALUES ('1485', '5774', '备孕', '平素月经规则，周期30天，经期4-5天，经量中等，无痛经。末次月经：2017.10.25，生育史1-0-2-1，顺产', '', '', '健康查体,,', '', '2017-11-09 14:27:18', null, '1.来院检查血常规，血凝，血生化，甲功全套小便常规及心电图等。检查宫颈癌筛查等。');
INSERT INTO `diagnose` VALUES ('1486', '5773', '右足疼痛2天', '2天前出现右足红肿，疼痛', '', '', '糖尿病伴并发症,,', '', '2017-11-09 14:43:49', null, '建议线下医院就诊。');
INSERT INTO `diagnose` VALUES ('1487', '5763', '要求备孕', '平素月经规则，周期30天，经期4-5天，经量中等，无痛经。末次月经：2017.11.01，现月经尽3天。', '', '', '妊娠病类,,', '线下检查', '2017-11-09 14:47:46', null, '1.来院检查血常规。血凝，血生化，甲功全套及宫颈癌筛查，阴道分泌物检查及心电图，小便检查等。');
INSERT INTO `diagnose` VALUES ('1488', '5772', '右足疼痛2天', '2天前右足出现红肿，疼痛不适', '', '', '糖尿病伴并发症,,', '', '2017-11-09 14:58:23', null, '建议线下医院就诊。');
INSERT INTO `diagnose` VALUES ('1489', '5764', '月经量减少6月。', '平素月经规则，周期32-35天，经量中等，经期7-8天，无痛经。近6月出现', '', '', '月经不规则,,', '注意休息，调整生活规律，检查性激素全套（月经第3天），排除器质性疾病后调经治疗。', '2017-11-09 15:00:25', null, '1.线下检查');
INSERT INTO `diagnose` VALUES ('1490', '5762', '反复下身痒5天。', '近5天出现下身痒，白带豆渣样，量多。', '', '', '急性阴道炎,,', '', '2017-11-09 15:15:54', null, '1.凯尼丁1盒 1#1次立即');
INSERT INTO `diagnose` VALUES ('1491', '5765', '备孕', '孕前检查', '', '', '健康查体,,', '', '2017-11-09 15:17:06', null, '1.线下检查');
INSERT INTO `diagnose` VALUES ('1492', '5775', '孕前检查', '要求孕前检查', '', '', '健康查体,,', '', '2017-11-09 15:27:17', null, '1.线下检查');
INSERT INTO `diagnose` VALUES ('1493', '5776', '胃胀', '饭后胃胀', '', '', '消化不良,,', '', '2017-11-09 16:05:53', null, '消化不良吃西药');
INSERT INTO `diagnose` VALUES ('1494', '5749', '无', '病史同前，目前产后6月 一直未服药，当地查甲状腺功能 未见异常  。今为常规复诊来我院。', '无', null, '甲状腺机能亢进症', '无', '2017-11-09 16:13:33', null, null);
INSERT INTO `diagnose` VALUES ('1495', '5749', '无', '病史同前，目前产后6月 一直未服药，当地查甲状腺功能 未见异常  。今为常规复诊来我院。', '无', null, '甲状腺机能亢进症', '无', '2017-11-09 16:13:34', null, null);
INSERT INTO `diagnose` VALUES ('1496', '5756', '无', '病史同前，目前以“羟氯喹”3片/天治疗，无关节肿痛，无发热，无皮疹，无胸闷等，目前确诊早孕，今来我院复诊。', '无', null, '类风湿性关节炎', '无', '2017-11-09 16:18:21', null, null);
INSERT INTO `diagnose` VALUES ('1497', '5778', '流涕2天', '两天前出现流清涕症状，现在加重', '', '', '感冒病,,', '', '2017-11-10 14:02:05', null, '可以先服用板蓝根冲剂，每日三次，每次两包，冲服，注意保暖，保证充足睡眠，合理饮食，如症状无好转，可来医院门诊就医。');
INSERT INTO `diagnose` VALUES ('1498', '5779', '泰诺能一次吃两颗吗', '泰诺能一次吃两颗吗', '', '', '咨询,,', '', '2017-11-10 14:07:28', null, '成人以及12岁以上儿童每次服用1片，一天不超过4次。');
INSERT INTO `diagnose` VALUES ('1499', '5780', '服用头孢丙烯后出现皮疹', '服用投保丙烯后出现皮疹', '', '', '咨询,,', '', '2017-11-10 14:09:28', null, '暂停服用该药物，及时到医院门诊就诊');
INSERT INTO `diagnose` VALUES ('1500', '5788', '胸闷1天', '胸闷1天\n', '', '', '心悸,,', '', '2017-11-14 11:18:55', null, '建议来院检查');
INSERT INTO `diagnose` VALUES ('1501', '5789', '心悸5天', '心悸5天，无胸痛，无发热。', '', '无', '冠状动脉肌桥,,', '', '2017-11-14 13:23:02', null, '来院做心电图');
INSERT INTO `diagnose` VALUES ('1502', '5790', '头晕2天', '头晕2天', '', '无', '高血压1级,,', '', '2017-11-14 13:44:48', null, '开药');
INSERT INTO `diagnose` VALUES ('1503', '5791', '睡眠差1周', '睡眠差1周', '', '', '睡眠障碍,,', '', '2017-11-14 14:02:09', null, '开药');
INSERT INTO `diagnose` VALUES ('1504', '5792', '心悸2天', '心悸2天，无胸闷气急，无胸痛', '以往无高血压史', '', '心悸,,', '', '2017-11-14 14:19:55', null, '开药');
INSERT INTO `diagnose` VALUES ('1505', '5793', '上腹部不适2天', '上腹部不适2天', '', '', '胃炎,,', '', '2017-11-14 14:30:14', null, '开药');
INSERT INTO `diagnose` VALUES ('1506', '5796', '眩晕3天', '眩晕3天', '', '', '眩晕综合征,,', '', '2017-11-14 14:38:31', null, '开药');
INSERT INTO `diagnose` VALUES ('1507', '5787', '孕38+周产检', '停经38+周，来院产检', '剖宫产1次', '', '单胎,,', '', '2017-11-14 14:51:12', null, '明日住院');
INSERT INTO `diagnose` VALUES ('1508', '5799', '头晕1天', '头晕1天', '', '', '高血压1级,,', '', '2017-11-14 15:14:25', null, '开药');
INSERT INTO `diagnose` VALUES ('1509', '5802', '右下腹痛一天', '未诉其他不适', '无', '无', '阑尾炎,,', '', '2017-11-15 09:32:40', null, '建议住院');
INSERT INTO `diagnose` VALUES ('1510', '5804', '甲状腺癌术后复查', '甲状腺癌术后两年，未诉特殊不适', '诉有糖尿病史', '', '甲状腺疾患,,', '', '2017-11-15 10:37:22', null, '继续优甲乐2片每日口服，定期复查');
INSERT INTO `diagnose` VALUES ('1511', '5800', '无', '有PCOS史，已分娩一胎', '无', null, '月经不规则', '无', '2017-11-16 16:37:45', null, null);
INSERT INTO `diagnose` VALUES ('1512', '5800', '无', '有PCOS史，已分娩一胎', '无', null, '月经不规则', '无', '2017-11-16 16:37:46', null, null);
INSERT INTO `diagnose` VALUES ('1513', '5807', '饭后3小时腹胀', '饭后3小时腹胀', '', '', '消化不良,,', '', '2017-11-17 10:51:36', null, '吃消食片');
INSERT INTO `diagnose` VALUES ('1514', '5816', '头疼', '头疼', '', '', '1型糖尿病性视网膜病变,,', '', '2017-11-17 15:39:47', null, '头疼');
INSERT INTO `diagnose` VALUES ('1515', '5815', '且我让他们', 'wretch', '', '', '17α-羟化酶缺陷症,,', '', '2017-11-17 17:33:07', null, '文化土壤及');
INSERT INTO `diagnose` VALUES ('1516', '5821', '测试', '测试', '', '', '17α-羟化酶缺陷症,,', '', '2017-11-19 17:20:38', null, '测试');
INSERT INTO `diagnose` VALUES ('1517', '5822', '饭后腹胀', '饭后腹胀', '', '', '消化不良,,', '', '2017-11-20 09:20:10', null, '吃药');
INSERT INTO `diagnose` VALUES ('1518', '5826', '问问', '问问', '', '', '17α-羟化酶缺陷症,,', '', '2017-11-20 13:41:31', null, '问问');
INSERT INTO `diagnose` VALUES ('1519', '5833', '饭后腹胀', '饭后腹胀', '', '', '消化不良,,', '', '2017-11-21 09:33:20', null, '吃药');
INSERT INTO `diagnose` VALUES ('1520', '5835', '停经28周', '停经28周', '无殊', '', '单胎,,', '', '2017-11-21 13:34:49', null, '复诊');
INSERT INTO `diagnose` VALUES ('1521', '5837', '反复腹痛数月', '运动后腹痛明显', '无', '', '腹痛,,', '', '2017-11-21 13:56:25', null, '建议进一步检查');
INSERT INTO `diagnose` VALUES ('1522', '5840', '心悸胸闷3天', '心悸胸闷3天', '', '', '心律失常,,', '', '2017-11-21 15:58:57', null, '开药');
INSERT INTO `diagnose` VALUES ('1523', '5842', '心悸', '心悸3天', '', '', '心悸,,', '', '2017-11-21 16:12:53', null, '开药');
INSERT INTO `diagnose` VALUES ('1524', '5836', '停经27周', '停经27周', '', '', '单胎,,', '', '2017-11-21 16:18:39', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1525', '5839', '头昏2天', '头昏2天', '', '', '高血压病,,', '', '2017-11-21 16:25:56', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1526', '5843', '上腹部不适3天', '上腹部不适3天', '', '', '胃炎,,', '', '2017-11-21 16:33:44', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1527', '5838', '为何热', '个', '', '', '1型糖尿病性酮症,,', '', '2017-11-21 16:50:30', null, '问过');
INSERT INTO `diagnose` VALUES ('1528', '5852', '发现PICC回血1小时', '1小时之前在洗衣服的时候，发现管道回血，无上肢麻木，肿胀感', '肺CA两个月', '无', '咨询,,', '', '2017-11-22 09:52:20', null, '建议来医院进一步就诊');
INSERT INTO `diagnose` VALUES ('1529', '5852', '发现PICC回血1小时', '1小时之前在洗衣服的时候，发现管道回血，无上肢麻木，肿胀感', '肺CA两个月', '无', '咨询,,', '', '2017-11-22 09:52:40', null, '建议来医院进一步就诊');
INSERT INTO `diagnose` VALUES ('1530', '5858', '消化不良', '消化不良', '', '', '消化不良,,', '', '2017-11-22 11:14:21', null, '消化不良');
INSERT INTO `diagnose` VALUES ('1531', '5865', '头痛', '头痛一周', '无特殊', '无', '头痛,,', '', '2017-11-23 09:44:20', null, '建议休息、随诊');
INSERT INTO `diagnose` VALUES ('1532', '5869', '发现肝功能异常2月', '2月少时诵诗书所所少时诵诗书是是是', '', '', '慢性乙型丁型病毒性肝炎,,', '', '2017-11-23 13:35:42', null, '门诊随访，定期检查');
INSERT INTO `diagnose` VALUES ('1533', '5863', '反反复复', '咯咯咯咯咯刚刚', '', '', '肺炎,,', '', '2017-11-23 13:58:52', null, '对对对');
INSERT INTO `diagnose` VALUES ('1534', '5870', '刚刚', '刚刚', '', '', '肺非典型分枝杆菌病,,', '', '2017-11-23 14:06:43', null, '随访');
INSERT INTO `diagnose` VALUES ('1535', '5893', '反复咽痛数年', '既往是教师，说话较多，出现咽痛，休息后好转，但症状时有反复', '心脏病', '头孢类', '慢性咽炎,心脏病,', '', '2017-11-28 08:36:00', null, '建议多休息，多喝水，少讲话，可以吃点石斛及麦冬等养阴清咽等保健品和药物');
INSERT INTO `diagnose` VALUES ('1536', '5895', '反复口干口苦数月', '近几月反复口干口苦', '无殊', '无', '肝经郁热证,,', '', '2017-11-28 08:41:49', null, '建议调节情绪，可以于逍遥丸帮助疏肝清热治疗');
INSERT INTO `diagnose` VALUES ('1537', '5889', '嘴唇肿痛3天', '无明显诱因出现嘴唇肿痛', '', '', '热毒蕴肤证,,', '', '2017-11-28 08:58:18', null, '建议予金银花莲子心等泡水口服');
INSERT INTO `diagnose` VALUES ('1538', '5891', '甲状腺功能异常产后', '妊娠期间甲状腺功能异常，产后100天需要复查吗', '', '', '产后病类,,', '', '2017-11-28 09:10:20', null, '建议到医院做甲状腺功能及B超检查');
INSERT INTO `diagnose` VALUES ('1539', '5894', '时有鼻塞流涕打喷嚏数月', '遇寒加重', '', '', '变应性鼻炎,,', '', '2017-11-28 09:35:25', null, '注意保暖，有症状可用布地奈德鼻喷剂喷鼻或鼻渊通窍颗粒口服');
INSERT INTO `diagnose` VALUES ('1540', '5890', '反复口炎数月', '经常口腔溃疡', '', '', '心火上炎证,,', '', '2017-11-28 09:49:11', null, '建议多吃维生素c和B族维生素，少吃辛辣食品，必要时可以吃新鲜石斛或西洋参');
INSERT INTO `diagnose` VALUES ('1541', '5892', '睡眠障碍数月', '睡晚了容易失眠，睡眠不好易出现肝功能异常', '', '', '睡眠障碍,,', '', '2017-11-28 10:01:41', null, '建议放松心情，调节情绪，早睡早起，适当锻炼，定期查肝功能');
INSERT INTO `diagnose` VALUES ('1542', '5896', '矮小儿童如何锻炼', '朋友孩子偏矮小', '', '', '咨询,,', '', '2017-11-28 10:05:49', null, '建议跳绳，摸高，投篮等纵向运动，建议保证睡眠，合理营养');
INSERT INTO `diagnose` VALUES ('1543', '5902', '头昏2天', '头昏2天', '', '', '高血压1级,,', '', '2017-11-28 15:27:00', null, '来院复诊');
INSERT INTO `diagnose` VALUES ('1544', '5901', '停经28+周', '停经28+周，来院检查空腹血糖', '有肝胆酸增高史', '', '单胎,,', '', '2017-11-28 16:10:31', null, '门诊定期复查');
INSERT INTO `diagnose` VALUES ('1545', '5897', '停经27+周', '停经27+周，来院检查', '无殊', '', '单胎,,', '', '2017-11-28 16:28:08', null, '控制饮食（低糖饮食），一周后复查餐后2小时血糖。');
INSERT INTO `diagnose` VALUES ('1546', '5906', '胸闷', '胸闷', '', '', '不安腿综合征,1型糖尿病性酮症,1型糖尿病伴神经并发症', '诊断建议数据', '2017-11-30 09:12:05', null, '房间通风，');
INSERT INTO `diagnose` VALUES ('1547', '5905', '散热体会', 'Warwick', '', '', '1型糖尿病伴多并发症,,', '', '2017-11-30 14:52:18', null, '然后');
INSERT INTO `diagnose` VALUES ('1548', '5907', '点击退款股', '摄影人头', '', '', '1型糖尿病伴昏迷,,', '', '2017-11-30 15:10:50', null, '额');
INSERT INTO `diagnose` VALUES ('1549', '5909', '湿热一如', '人挤人', '', '', '暴风客热病,,', '', '2017-11-30 15:19:29', null, '恶㐇');
INSERT INTO `diagnose` VALUES ('1550', '5913', '然后', '问过我', '', '', '阿片样物质伴有谵妄的戒断状态,1型病伴有生长发育障碍,1型糖尿病', '诊断检验', '2017-12-01 08:59:48', null, '处理不知道');
INSERT INTO `diagnose` VALUES ('1551', '5910', '然后今天一天', '尔和统一', '', '', '鞍上区恶性肿瘤,,', '', '2017-12-01 09:43:17', null, '维护');
INSERT INTO `diagnose` VALUES ('1552', '5914', 'WAE', 'RHE', '', '', '1型糖尿病性酮症,,', '', '2017-12-01 09:49:04', null, 'REH');
INSERT INTO `diagnose` VALUES ('1553', '5912', '然后', '破OK', '', '', '鼻部皮肤恶性肿瘤,,', '', '2017-12-01 09:57:02', null, '还 ');
INSERT INTO `diagnose` VALUES ('1554', '5916', '哦', '有空了', '', '', '病毒感染,,', '', '2017-12-01 10:01:39', null, '一排');
INSERT INTO `diagnose` VALUES ('1555', '5917', '5太费劲', '浩特', '', '', '奥尔波特综合征,,', '', '2017-12-01 10:38:51', null, '浩特');
INSERT INTO `diagnose` VALUES ('1556', '5919', '十多个', '大锅饭', '', '', '阿片样物质残留性和迟发性精神病性障碍,,', '', '2017-12-01 11:10:07', null, '过你和他');
INSERT INTO `diagnose` VALUES ('1557', '5920', '附件一块', '伏特加', '', '', '氨基糖甙类有害效应,,', '', '2017-12-01 11:46:17', null, '提货人');
INSERT INTO `diagnose` VALUES ('1558', '5921', '统计口蹄疫', '4页好', '', '', '氨茶硷中毒,,', '', '2017-12-01 12:48:38', null, '54元人家');
INSERT INTO `diagnose` VALUES ('1559', '5922', '恶心一月', '自述恶心、胃脘部不适，四肢活动无受限，无黑便、腹泻', '', '', '慢性胃肠炎,,', '', '2017-12-01 13:35:31', null, '药物治疗');
INSERT INTO `diagnose` VALUES ('1560', '5931', '上腹部不适2天', '上腹部不适2天', '', '', '胃炎,,', '', '2017-12-05 15:19:20', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1561', '5926', '停经38+周', '停经38周，胎头未入盆', '无', '', '单胎,,', '', '2017-12-05 15:22:32', null, '门诊复诊');
INSERT INTO `diagnose` VALUES ('1562', '5932', '睡眠差3天', '睡眠差3天', '', '', '睡眠障碍,,', '', '2017-12-05 15:36:35', null, '开药');
INSERT INTO `diagnose` VALUES ('1563', '5929', '停经33+周', '平素月经规则，末次月经：2016.4.2', '无殊', '', '单胎,,', '', '2017-12-05 15:37:43', null, '下周复查');
INSERT INTO `diagnose` VALUES ('1564', '5927', '停经45天', '停经45天，发现甲状腺功能减退，在服优甲乐治疗，效果不明显。', '无殊', '', '确认妊娠,,', '', '2017-12-05 15:47:00', null, '内分泌科治疗，门诊复诊。');
INSERT INTO `diagnose` VALUES ('1565', '5934', '上腹部不适2天', '上腹部不适2天', '', '', '胃炎,,', '', '2017-12-05 15:57:01', null, '开药');
INSERT INTO `diagnose` VALUES ('1566', '5935', '心悸2天', '心悸2天', '', '', '心悸,,', '', '2017-12-05 16:04:54', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1567', '5933', '停经28+周', '停经28+周，发现餐后2小时血糖升高1周余', '无殊', '', '单胎,,', '', '2017-12-05 16:05:58', null, '内分泌科就诊，门诊定期复查，糖尿病饮食。');
INSERT INTO `diagnose` VALUES ('1568', '5928', '月经不尽1周余', '月经不尽1周，B超提示宫腔不均质回声', '无殊', '', '子宫不规则出血,,', '', '2017-12-05 16:23:36', null, '建议手术治疗');
INSERT INTO `diagnose` VALUES ('1569', '5925', '停经33+周', '要求产检', '无殊', '', '单胎,,', '', '2017-12-05 16:28:15', null, '门诊复查');
INSERT INTO `diagnose` VALUES ('1570', '5943', '饭后3小时腹胀', '饭后3小时腹胀', '', '', '消化不良,,', '', '2017-12-07 09:27:13', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1571', '5948', '腹泻乏力2周左右', '有不良饮食史', '胆囊切除术史', '', '腹泻,消化不良,', '', '2017-12-12 09:01:32', null, '建议清淡饮食数天，观察');
INSERT INTO `diagnose` VALUES ('1572', '5947', '头晕乏力10天', '伴有鼻塞咽痒，同时有头晕，无发热', '', '', '急性上呼吸道感染,,', '', '2017-12-12 09:16:11', null, '建议多喝开水，注意休息，芙朴冲剂2包，bid口服，观察');
INSERT INTO `diagnose` VALUES ('1573', '5950', '血糖时常偏高数月', '平时血糖偏高，饮食控制后有所下降', '有胆囊切除手术病史', '', '血糖过多,,', '', '2017-12-12 09:27:21', null, '建议控制饮食，少吃甜食，定量饮食，注意锻炼运动，如果通过运动和饮食控制，仍血糖控制不良，建议药物治疗，不严重期间可以中药治疗。');
INSERT INTO `diagnose` VALUES ('1574', '5952', ' 反复咽痛有痰，睡眠不好数月', '晨起有痰', '', '', '慢性咽炎,睡眠障碍,', '', '2017-12-12 09:40:06', null, '建议不吃辛辣油炸食品，建议参麦地黄丸9gBID口服，胖大海，每天3个泡服');
INSERT INTO `diagnose` VALUES ('1575', '5949', '咳嗽2-3月', '患者感冒后一直咳嗽，受凉后更加明显', '', '', '咳嗽,支气管炎？,', '', '2017-12-12 10:15:39', null, '建议胸部CT检查');
INSERT INTO `diagnose` VALUES ('1576', '5956', '腰痛反复一年', '腰痛反复一年', '无', '', '腰椎间盘变性,,', '', '2017-12-12 13:33:53', null, '1、健康宣教，2、西乐葆片口服1片/2次/天');
INSERT INTO `diagnose` VALUES ('1577', '5957', '腰痛1周', '腰痛1周', '', '', '腰椎间盘变性,,', '', '2017-12-12 13:47:23', null, '健康宣教');
INSERT INTO `diagnose` VALUES ('1578', '5946', '肩关节痛1周', '肩关节痛1周', '', '', '颈椎关节强硬,,', '', '2017-12-12 13:59:33', null, '健康宣教');
INSERT INTO `diagnose` VALUES ('1579', '5958', '颈椎痛1年', '颈椎痛1年', '', '', '神经根型颈椎病,,', '', '2017-12-12 14:25:08', null, '健康宣教');
INSERT INTO `diagnose` VALUES ('1580', '5959', '膝关节疼痛1周', '膝关节疼痛1周', '', '', '关节病,,', '', '2017-12-12 14:30:53', null, '理疗，健康宣教');
INSERT INTO `diagnose` VALUES ('1581', '5955', '停经38+周', '停经38周，B超提示胎儿为孕35周孕龄', '无殊', '', '单胎,,', '', '2017-12-12 16:08:12', null, '下周二门诊复查，注意胎动');
INSERT INTO `diagnose` VALUES ('1582', '5953', '停经36周', '停经36周，要求检查', '无殊', '', '单胎,,', '', '2017-12-12 16:20:33', null, '下周二来院检查');
INSERT INTO `diagnose` VALUES ('1583', '5966', '上腹部不适3天', '上腹部不适3天', '', '', '胃炎,,', '', '2017-12-13 08:54:38', null, '开药');
INSERT INTO `diagnose` VALUES ('1584', '5972', '腹痛1周', '腹痛，下腹为主，呈阵发性', '', '', '腹痛,,', '', '2017-12-13 10:05:57', null, '建议行泌尿系B超');
INSERT INTO `diagnose` VALUES ('1585', '5961', '发现血压偏高2月', '发现血压偏高2月', '', '', '高血压1级,,', '', '2017-12-13 10:07:51', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1586', '5973', '腹痛1周', '腹痛，大便稀，不成形', '', '', '腹痛,,', '', '2017-12-13 10:09:15', null, '建议肠镜检查');
INSERT INTO `diagnose` VALUES ('1587', '5968', '心悸1周', '心悸1周', '', '', '心悸,,', '', '2017-12-13 10:13:55', null, '来院检查 ');
INSERT INTO `diagnose` VALUES ('1588', '5965', '上腹部不适2天', '上腹部不适2天', '', '', '胃炎,,', '', '2017-12-13 10:18:08', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1589', '5963', '产后3月，孩子大便次数多', '平产后3月，孩子大便每日2次，稀便，进食好，精神状态好，体重增长也好，没有颗粒状物质', '无殊', '无殊', '产后即刻医疗照顾和检查,,', '', '2017-12-13 10:18:16', null, '可以继续观察，或者吃点益生菌，调节肠道菌群，如果胃口差，体重增长不明显等不适症状，需要及时就医。');
INSERT INTO `diagnose` VALUES ('1590', '5964', '心悸2天', '心悸2天', '', '', '心悸,,', '', '2017-12-13 10:20:11', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1591', '5967', '剖宫产术后年余', '剖宫产术后1年余，腹部疤痕处仍有时候会隐痛不适，无腹痛，无异常阴道流血，疤痕处无红肿', '无殊', '无殊', '产后即刻医疗照顾和检查,,', '', '2017-12-13 10:35:54', null, '视频看切口无红肿，可以来院B超检查，继续观察');
INSERT INTO `diagnose` VALUES ('1592', '5977', '心悸一周', '一周前患者因劳累，出现心慌。无胸闷气促，无恶心呕吐。', '无', '无', '心悸,,', '', '2017-12-14 13:22:02', null, '到医院检查心电图、动态心电图');
INSERT INTO `diagnose` VALUES ('1593', '5969', '胸闷气促1周', '1周前出现胸闷气促。无胸痛', '无', '无', '心律失常,冠心病,', '', '2017-12-14 13:28:45', null, '建议来院检查心电图、肌钙蛋白、凝血。');
INSERT INTO `diagnose` VALUES ('1594', '5978', '咳嗽3天', '患者于3天前因受凉后出现咳嗽，有流清涕，无咳痰，无发热，无胸闷气促，无恶心呕吐', '既往体健', '无', '咳嗽,,', '', '2017-12-15 08:58:29', null, '1建议抗病毒治疗\n2可以服用止咳糖浆\n3多喝开水\n4如服药后无好转，建议来院予血常规，肺CT检查等\n5一周内复诊');
INSERT INTO `diagnose` VALUES ('1595', '5979', '出现导管回血15分钟', '15分钟前在晒衣服的时候发现导管回血，手臂无肿胀，敷贴无卷边', '', '无', '咨询,,', '及时来医院就诊，星期一，三，五上午门诊换药室处理，其余时间段急诊处理。', '2017-12-15 09:06:07', null, '及时来医院就诊，星期一，三，五上午门诊换药室处理，其余时间段急诊处理。');
INSERT INTO `diagnose` VALUES ('1596', '5980', '发现PICC管处皮疹2小时', '2小时前无明显诱因下出现皮疹，局部发痒，局部无肿胀', '', '无', '咨询,,', '', '2017-12-15 09:58:02', null, '建议来医院进一步处理。');
INSERT INTO `diagnose` VALUES ('1597', '5981', '乏力2天', '无明显诱因下出现全身乏力，无头痛头昏，无胸闷气急，诉喉部不适', '', '', '咨询,,', '建议普内科就诊', '2017-12-15 10:12:24', null, '建议普内科进一步就诊');
INSERT INTO `diagnose` VALUES ('1598', '5984', '左下腹疼痛半小时', '患者于半小时前突出现左下腹疼痛，呈持续性，感恶心，无腹泻，无胸闷气促，无发热', '既往有输尿管结石史', '无', '输尿管结石,,', '', '2017-12-15 10:22:27', null, '1建议来院做个B超，血常规等相关检查，去专科门诊就诊\n2一周内复诊\n3多喝开水，多运动');
INSERT INTO `diagnose` VALUES ('1599', '5986', '发现导管出皮疹1小时', '1小时前无明显诱因下导管周围皮疹，局部发痒', '', '', '咨询,,', '', '2017-12-15 10:24:23', null, '建议局部用尤卓尔');
INSERT INTO `diagnose` VALUES ('1600', '5988', '右上肢局部红肿1天', '1天前无明显诱因下出现右上肢PICC穿刺处皮肤红肿，无疼痛，无分泌物流出', '', '无', '咨询,,', '', '2017-12-15 10:35:14', null, '建议维护的时候局部穿刺处用碘伏湿敷。');
INSERT INTO `diagnose` VALUES ('1601', '5985', '全身乏力3天', '患者3天前因劳累后感全身乏力，无头晕头痛，无恶心呕吐，无胸闷气促，无腹痛腹泻，胃纳欠佳，大小便无殊', '', '', '不适和疲劳,,', '', '2017-12-15 10:38:36', null, '1注意休息，劳逸结合\n2建议来院做相应检查\n');
INSERT INTO `diagnose` VALUES ('1602', '5990', '左上肢PICC穿刺处局部红肿1天', '1天前无明显诱因下出现左上肢PICC穿刺处局部红肿，无疼痛，穿刺处无明显的分泌物流出。', '', '无', '咨询,,', '', '2017-12-15 10:44:29', null, '建议维护的时候局部穿刺处用碘伏湿敷。');
INSERT INTO `diagnose` VALUES ('1603', '5987', '头晕2天', '患者2天前出现头晕，无恶心呕吐，无发热，无胸闷气促，无腹痛腹泻，在家测血压185/92mmHg,平素在服缬沙坦80mg,一天一次。但近几日未服药，胃纳可', '有高血压，痛风史', '', '高血压3级,,', '', '2017-12-15 10:47:08', null, '1按时规律服降压药\n2清淡饮食\n3平素常测血压，一周内复诊');
INSERT INTO `diagnose` VALUES ('1604', '5989', '全身乏力一天', '患者于一天前因劳累后感全身乏力，无头晕头痛，无恶心呕吐，无胸闷气急\n，平素月经正常', '', '', '咨询,,', '', '2017-12-15 10:50:40', null, '1注意休息，劳逸结合');
INSERT INTO `diagnose` VALUES ('1605', '6009', '头疼', '头疼', '', '', '头痛,,', '', '2017-12-18 14:40:08', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1606', '6015', 'ces', '测试', '', '', '白内障,,', '', '2017-12-18 15:33:55', null, '测试');
INSERT INTO `diagnose` VALUES ('1607', '6013', 'ces ', 'ce ', '', '', '白内障,,', '', '2017-12-18 16:33:27', null, 'ces ');
INSERT INTO `diagnose` VALUES ('1608', '6019', '记性不好3月', '近三个月出现记性不好', '无殊', '无殊', '健忘病,,', '', '2017-12-19 09:32:26', null, '建议脑电图检查');
INSERT INTO `diagnose` VALUES ('1609', '6018', '白带量多3天。', '近3天出现白带量多，有异味，伴有外阴瘙痒。', '无殊', '无殊', '急性阴道炎,,', '', '2017-12-19 09:40:36', null, '建议检查白带常规。');
INSERT INTO `diagnose` VALUES ('1610', '6021', '准备怀孕，咨询孕前需要做哪些检查', '无不适主诉，准备怀孕，咨询孕前需要做哪些检查', '无殊', '无殊', '妇科检查,,', '', '2017-12-19 09:51:50', null, '建议至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH等。');
INSERT INTO `diagnose` VALUES ('1611', '6022', '阴道分泌物有异味4天。', '4天前感觉阴道分泌物有异味，伴有豆渣样分泌物，感外阴瘙痒', '无殊', '无殊', '急性阴道炎,,', '', '2017-12-19 09:56:36', null, '保持外阴清洁，穿棉质短裤，建议至医院化验白带常规。');
INSERT INTO `diagnose` VALUES ('1612', '6024', '胸闷心悸7天', '7天前出现胸闷心悸', '无殊', '无殊', '心悸,,', '', '2017-12-19 10:13:38', null, '建议至医院检查心电图，心脏B超。');
INSERT INTO `diagnose` VALUES ('1613', '6023', '准备怀孕，咨询孕前需要做哪些检查', '准备怀孕，咨询孕前需要做哪些检查', '无殊', '无殊', '与不合意工作有关,,', '', '2017-12-19 10:16:17', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1614', '6025', '测试', '测试', '', '', '湿疹,,', '', '2017-12-19 10:17:30', null, '测试');
INSERT INTO `diagnose` VALUES ('1615', '6026', '测试', '测试', '', '', '肾性矮小症,,', '', '2017-12-19 11:02:34', null, '测试');
INSERT INTO `diagnose` VALUES ('1616', '6028', '剖宫产术后33天，随访腹部切口愈合情况。', '剖宫产术后33天，随访腹部切口愈合情况。', '无殊', '无殊', '妇科检查,,', '', '2017-12-19 15:10:39', null, '腹部切口对合平整，小酒窝存在，暂无特殊处理。');
INSERT INTO `diagnose` VALUES ('1617', '6031', '上腹部不适1天', '上腹部不适1天', '', '', '胃炎,,', '', '2017-12-19 15:27:05', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1618', '6034', '发热', '发热2天', '无数', '无数', '发热,,', '', '2017-12-19 15:29:44', null, '物理降温');
INSERT INTO `diagnose` VALUES ('1619', '6030', '心悸1天', '心悸1天', '', '', '心悸,,', '', '2017-12-19 15:35:09', null, '开药');
INSERT INTO `diagnose` VALUES ('1620', '6036', '上腹部不适2天', '上腹部不适2天', '', '', '胃炎,,', '', '2017-12-19 15:53:55', null, '来院检查');
INSERT INTO `diagnose` VALUES ('1621', '6041', '测试', '测试', '', '', 'ABO血型不合,,', '', '2017-12-20 17:12:52', null, '测试');
INSERT INTO `diagnose` VALUES ('1622', '6092', '停经66天，下腹不适半月。', '平素月经规则，末次月经：2017.10.19，自测尿HCG阳性，近半月出现下腹不适，无阴道流血流液。', '', '', '确认妊娠,,', '', '2017-12-25 09:46:58', null, '注意休息，不适随诊');
INSERT INTO `diagnose` VALUES ('1623', '6094', '剖宫产后半月下腹不适。', '患者于半月前因瘢痕子宫本院行剖宫产术，手术经过顺利，术后恢复可，5天出院。现出现下腹隐痛不适，伴阴道恶露比平素月经多，无异味，暗红色。无发热畏寒。', '', '', '产后腹痛病,,', '', '2017-12-25 10:03:03', null, '子宫复旧不良，建议线下就诊。');
INSERT INTO `diagnose` VALUES ('1624', '6097', '产后12月未转经。', '12月前因瘢痕子宫行剖宫产，手术经过顺利，术后恢复好，术后母乳喂养至2月前。至今未转经。', '', '', '月经不规则,,', '', '2017-12-25 13:57:48', null, '月经不规则，建议线下查血HCG。');
INSERT INTO `diagnose` VALUES ('1625', '6103', '停经38周，睡眠障碍2天。', '平素月经规则，停经38周，孕期经过顺利，近2天出现睡眠障碍，伴两大腿跟部疼痛，不能平躺及侧躺。', '', '', '单胎,睡眠障碍,', '', '2017-12-25 14:21:48', null, '1.注意休息；调节心态，自计胎动，不适随诊。');
INSERT INTO `diagnose` VALUES ('1626', '6104', '二胎咨询。', '平素月经不规则，周期30-45天，经量中等，暗红色，无痛经。现35岁，想生育二胎，第一台顺产。孕前需检查哪些内容。', '', '', '咨询,,', '', '2017-12-25 14:27:45', null, '1.注意休息及营养；2.线下化验检查如血常规/血凝/血生化/甲功全套/肿瘤全套/大小便/微量元素检查/TORCH及心电图/宫颈癌筛查/阴道分泌物检查等。');
INSERT INTO `diagnose` VALUES ('1627', '6110', '既往甲状腺手术，目前甲状腺功能减退', '目前甲状腺功能减退，来院配药', '既往甲状腺药物治疗史', '无明显过敏史', '甲状腺功能异常,,', '建议定期复查甲状腺功能', '2017-12-26 10:01:05', null, '药物治疗');
INSERT INTO `diagnose` VALUES ('1628', '6112', '既往甲状腺病史', '无明显不适，来院配药', '甲状腺病史', '无', '甲状腺功能异常,,', '定期复查甲状腺功能', '2017-12-26 10:55:45', null, '药物治疗');
INSERT INTO `diagnose` VALUES ('1629', '6090', '  头痛咽痛3天', '近3天头痛伴有咽痛，无发热', '', '', '急性上呼吸道感染,,', '', '2017-12-26 11:00:11', null, '建议多休息，多喝开水，如果无缓解，建议中药治疗');
INSERT INTO `diagnose` VALUES ('1630', '6095', '面部痤疮反复数月', '面部痤疮反复数月', '', '', '痤疮,,', '注意面部清洁，少吃辛辣食品，注意保持大便通畅，保证睡眠充足', '2017-12-26 11:09:00', null, '注意饮食，少吃油腻和辛辣食品，注意面包情节，大便保持通畅，如果这样的情况下还是较多，建议吃药，中药，甚至联合西药治疗');
INSERT INTO `diagnose` VALUES ('1631', '6115', '停经2+月', '月经不规则2年', '无殊', '', '多囊卵巢综合征,,', '', '2017-12-26 15:00:11', null, '门诊配药');
INSERT INTO `diagnose` VALUES ('1632', '6111', '停经34+周', '停经34+周，来院检查', '无殊', '', '单胎,,', '', '2017-12-26 15:07:47', null, '下周二门诊复查');
INSERT INTO `diagnose` VALUES ('1633', '6114', 'test', 'test', '无', null, '诊断', '诊疗意见', '2017-12-26 19:44:41', null, null);
INSERT INTO `diagnose` VALUES ('1634', '6118', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-12-26 19:53:58', null, null);
INSERT INTO `diagnose` VALUES ('1635', '6118', '主诉', '现病史', '无', null, '诊断', '诊疗意见', '2017-12-26 19:54:06', null, null);
INSERT INTO `diagnose` VALUES ('1636', '6130', '1', '1', '', '', '莱－奥二氏综合征,,', '', '2017-12-27 18:06:55', null, '1');
INSERT INTO `diagnose` VALUES ('1637', '6136', '飞飞飞', '反反复复付', '额鹅鹅鹅', '人他天天', '特让他让他', '吾问无为谓 ', '2017-12-27 18:12:54', null, '恩恩额');
INSERT INTO `diagnose` VALUES ('1638', '6132', '877878', '8778', '暂无', '暂无', '特指兴奋剂戒断状态,可卡因特指精神和行为障碍,', '暂无', '2017-12-27 18:18:26', null, '788778');
INSERT INTO `diagnose` VALUES ('1639', '6132', '877878', '8778', '暂无', '暂无', '特指兴奋剂戒断状态,可卡因特指精神和行为障碍,', '暂无', '2017-12-27 18:18:56', null, '788778');
INSERT INTO `diagnose` VALUES ('1640', '6139', '晚上', '喂为', '为为', '为为问人为we', 'ABO血型不合,,', '', '2017-12-27 18:19:58', null, '人为为为');
INSERT INTO `diagnose` VALUES ('1641', '6132', '5656', '565656', '暂无', '暂无', '特指兴奋剂急性中毒,特指兴奋剂戒断状态,', '暂无', '2017-12-27 18:21:32', null, '鬼火鬼火鬼火');
INSERT INTO `diagnose` VALUES ('1642', '6132', '7878', '78877887', '暂无', '暂无', '可卡因特指精神和行为障碍,,', '暂无', '2017-12-27 18:22:31', null, '7878');
INSERT INTO `diagnose` VALUES ('1643', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '肾憩室,可卡因遗忘综合征,', '暂无', '2017-12-27 18:29:59', null, 'ddd');
INSERT INTO `diagnose` VALUES ('1644', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '肾憩室,可卡因遗忘综合征,', '暂无', '2017-12-27 18:30:23', null, 'ddd');
INSERT INTO `diagnose` VALUES ('1645', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '肾憩室,可卡因遗忘综合征,', '暂无', '2017-12-27 18:30:32', null, 'ddd');
INSERT INTO `diagnose` VALUES ('1646', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '肾憩室,可卡因遗忘综合征,', '暂无', '2017-12-27 18:31:13', null, 'ddd');
INSERT INTO `diagnose` VALUES ('1647', '6137', '123123123', '123123123123', '暂无', '暂无', '可卡因特指精神和行为障碍,可卡因遗忘综合征,', '暂无', '2017-12-27 18:32:16', null, '123123123123123123');
INSERT INTO `diagnose` VALUES ('1648', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '可卡因特指精神和行为障碍,,', '暂无', '2017-12-27 18:33:27', null, 'dfd ');
INSERT INTO `diagnose` VALUES ('1649', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '可卡因特指精神和行为障碍,,', '暂无', '2017-12-27 18:33:47', null, 'dfd ');
INSERT INTO `diagnose` VALUES ('1650', '6143', '1', '1', '', '', '鞍鼻,,', '', '2017-12-27 19:08:51', null, '1');
INSERT INTO `diagnose` VALUES ('1651', '6146', '喝水', '多休息', '', '', '鞍鼻诊断性皮肤和致敏试验合到', '', '2017-12-27 19:15:40', null, '注意保暖');
INSERT INTO `diagnose` VALUES ('1652', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '可卡因遗忘综合征,,', '暂无', '2017-12-27 19:23:11', null, 'sfasdf');
INSERT INTO `diagnose` VALUES ('1653', '6147', '感冒', '感冒', '', '', '感冒,,', '', '2017-12-27 19:23:29', null, '感冒药治疗');
INSERT INTO `diagnose` VALUES ('1654', '6138', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '可卡因遗忘综合征,人格解体-现实解体综合征,', '暂无', '2017-12-27 19:25:01', null, '333');
INSERT INTO `diagnose` VALUES ('1655', '6140', '测试', '测试', '', '', 'ABO血型不配合性反应,,', '', '2017-12-27 19:32:38', null, '测试');
INSERT INTO `diagnose` VALUES ('1656', '6129', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '1', '1', '连续性内斜视,可卡因伴有谵妄的戒断状态,可卡因特指精神和行为障碍', '暂无', '2017-12-27 20:24:36', null, '1');
INSERT INTO `diagnose` VALUES ('1657', '6141', null, null, null, null, null, '1', '2017-12-27 20:25:24', null, null);
INSERT INTO `diagnose` VALUES ('1658', '6152', '恶趣味', '问清楚', '请求', '打算', '埃博拉病毒病埃博拉病毒病埃布斯坦异常', '带我去', '2017-12-27 20:37:50', null, '大青蛙');
INSERT INTO `diagnose` VALUES ('1659', '6155', '哇哇的\n啊的骄傲i巨大 啊就打的', '达娃大都偏就嗲及的啊啊', '既往史', '过敏史', '可卡因伴有谵妄的戒断状态,可卡因遗忘综合征,', '暂无', '2017-12-27 20:45:37', null, '处理意见');
INSERT INTO `diagnose` VALUES ('1660', '6155', '哇哇的\n啊的骄傲i巨大 啊就打的', '达娃大都偏就嗲及的啊啊', '既往史', '过敏史', '可卡因伴有谵妄的戒断状态,可卡因遗忘综合征,', '暂无', '2017-12-27 20:45:37', null, '处理意见');
INSERT INTO `diagnose` VALUES ('1661', '6162', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '多发性小腿骨折,,额先露', '暂无', '2017-12-27 21:42:01', null, 'df');
INSERT INTO `diagnose` VALUES ('1662', '6165', 'io', 'ioioioioio', '', '', 'ABO血型不合,,', '', '2017-12-28 10:20:58', null, 'ioioio');
INSERT INTO `diagnose` VALUES ('1663', '6179', '胸痛1周', '1周前出现胸闷胸痛', '无', '无', '高血压1级,,', '注意低盐低脂饮食', '2017-12-28 13:07:39', null, '定期检测血压');
INSERT INTO `diagnose` VALUES ('1664', '6180', '腹泻1天', '1天前出现腹泻，黄色稀便。', '无', '无', '急性非感染性胃肠炎,,', '注意饮食', '2017-12-28 13:14:30', null, '注意饮食，服药');
INSERT INTO `diagnose` VALUES ('1665', '6186', '右膝疼痛1周', '右膝关节疼痛一周，无外伤史，无寒热，行走尚正常。', '无心肺肝脾等大器官疾病史，无手术外伤史', '无', '滑膜炎,,', '', '2017-12-28 14:50:17', null, '禁剧烈活动');
INSERT INTO `diagnose` VALUES ('1666', '6192', '1', '1', '', '', '鞍鼻,,', '', '2017-12-28 15:14:01', null, '1');
INSERT INTO `diagnose` VALUES ('1667', '6191', '1', '馅饼岁', '无', null, '1', '邱', '2017-12-28 15:28:51', null, null);
INSERT INTO `diagnose` VALUES ('1668', '6125', '咳嗽鼻塞流涕1月', '1月前出现咳嗽咳痰鼻塞流涕，黄绿色，无发热，无胸痛胸闷，大小便无殊', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '慢性鼻炎', '无', '2017-12-28 16:34:10', null, null);
INSERT INTO `diagnose` VALUES ('1669', '6125', '咳嗽鼻塞流涕1月', '1月前出现咳嗽咳痰鼻塞流涕，黄绿色，无发热，无胸痛胸闷，大小便无殊', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '慢性鼻炎', '无', '2017-12-28 16:34:11', null, null);
INSERT INTO `diagnose` VALUES ('1670', '6210', '夜间睡眠不佳1年，既往甲状腺病史', '夜间睡眠质量差，睡眠体验不佳，既往甲状腺病史，长期药物治疗。肢体活动无受限。', '甲状腺手术史', '无', '甲状腺功能异常,睡眠障碍,', '药物治疗，改善休息环境', '2017-12-29 08:29:14', null, '药物治疗，调整睡眠环境');
INSERT INTO `diagnose` VALUES ('1671', '6124', '腰背部疼痛不适2月余', '2月余前无诱因下出现腰背部疼痛，不剧烈，无放射，平路行走可。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,否认高血压、冠心病史,否认糖尿病史、脑血管病史、肾病史、肺部疾病史,否认手术史、外伤史、输血史,否认食物、药物过敏史,预防接种史不详。', null, '腰痛', '无', '2017-12-29 10:59:37', null, null);
INSERT INTO `diagnose` VALUES ('1672', '6117', '腮腺肿瘤术后12月复查。', '患者12月前在本院行腮腺肿瘤切除手术，术后恢复良好，否认有疼痛不适，今来我院复查。', '无', null, '腮腺肿瘤', '无', '2017-12-29 16:25:05', null, null);
INSERT INTO `diagnose` VALUES ('1673', '6231', '准备怀孕，孕前咨询。', '无不适主诉，准备怀孕，孕前咨询。', '无殊', '无殊', '与不合意工作有关,,', '', '2018-01-02 09:09:38', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1674', '6230', '月经不规则2月', '近2月工作压力较大，出现月经不规则，周期40-50天，经期5-6天', '无殊', '无殊', '月经不规则,,', '', '2018-01-02 09:18:40', null, '建议精神压力不要太大，饮食规律，如果后期月经规则则不需要特殊处理，如果后期月经仍不规律，需要至医院检查，必要时需使用药物治疗。');
INSERT INTO `diagnose` VALUES ('1675', '6226', '无', '患者咳嗽较前好转，偶有喉头痰鸣、喘息，无明显昼夜差别，无发热', '无', null, '支气管炎', '无', '2018-01-02 09:24:24', null, null);
INSERT INTO `diagnose` VALUES ('1676', '6232', '准备怀孕，孕前咨询', '无不适主诉，准备怀孕，孕前咨询', '无殊', '无殊', '妇科检查,,', '', '2018-01-02 09:27:19', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1677', '6227', '腹泻4天', '患儿4天前腹泻，解黄色水样便，不含粘液脓血，日解4次 ，每次量多少不等，无呕吐，无发热，今腹泻好转。无哭吵不安，无腹胀，无皮疹。', '无', null, '支气管炎', '无', '2018-01-02 09:29:26', null, null);
INSERT INTO `diagnose` VALUES ('1678', '6233', '准备怀孕，孕前咨询。', '无不适主诉，孕前咨询。', '无殊', '无殊', '妇科检查,,', '', '2018-01-02 09:42:44', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1679', '6234', '准备怀孕，孕前咨询。', '无不适主诉，孕前咨询。', '无殊', '无殊', '与不合意工作有关,,', '', '2018-01-02 09:51:15', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1680', '6239', '头痛', '发烧', '', '', '感冒病,,', '', '2018-01-02 14:05:39', null, '喝水');
INSERT INTO `diagnose` VALUES ('1681', '6240', '发烧', '头痛', '', '', '感冒病,,', '', '2018-01-02 14:20:48', null, '多喝水');
INSERT INTO `diagnose` VALUES ('1682', '6241', '咨询', '咨询使用肝素的注意事项', '', '', '咨询,,', '', '2018-01-02 14:49:31', null, '说明书');
INSERT INTO `diagnose` VALUES ('1683', '6242', '为朋友咨询孕前需要做哪些准备', '无不适主诉，为朋友咨询孕前需要做哪些准备', '无殊', '无殊', '咨询,,', '', '2018-01-02 14:51:37', null, '建议备孕夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1684', '6245', 'adawdawdawdadawdaw', '达娃大都偏就嗲及的啊啊', '暂无', '暂无', '可卡因伴有谵妄的戒断状态,可卡因伴有谵妄的戒断状态,可卡因伴有谵妄的戒断状态', '暂无', '2018-01-02 15:41:44', null, '1');
INSERT INTO `diagnose` VALUES ('1685', '6235', '停经32+周，来院检查', '停经32+周，发现餐后血糖高半月', '无殊', '', '单胎,,', '', '2018-01-02 16:15:19', null, '2周后复查');
INSERT INTO `diagnose` VALUES ('1686', '6248', '头疼', '没有', '', '', 'ABO血型不合,,', '', '2018-01-03 10:43:34', null, '未处理');
INSERT INTO `diagnose` VALUES ('1687', '6246', '肝豆状核变性复诊', '患儿无发热，无咳嗽，无呕吐、腹泻，无抽搐、惊厥。目前补锌明天45mg，肝功能正常。', '无', null, '肝豆状核变性', '无', '2018-01-03 13:52:02', null, null);
INSERT INTO `diagnose` VALUES ('1688', '6252', '头疼', '无', '1', '1', '安定故意自毒,ABO血型不配合性反应,', '', '2018-01-03 16:47:41', null, '1');
INSERT INTO `diagnose` VALUES ('1689', '6279', '测试', '测试', '', '', '鞍鼻', '', '2018-01-06 17:34:18', null, '测试');
INSERT INTO `diagnose` VALUES ('1690', '6275', '双眼眼红,频繁眨眼2  月', ' 患者于  2月前无明显诱因下出现双眼眼红，频繁眨眼，无眼胀眼痛，无畏光流泪，无视力下降等，当时未重视，滴用多种滴眼液无明显好转，现因双眼眼红不能自行缓解，今就诊于我院。', '平素健康何种疾病，治疗情况,否认肝炎、结核、疟疾史,否认高血压、冠心病、糖尿病史,,否认手术史、外伤史、输血史,否认食物、药物过敏史,预防接种史不详。', null, '结膜炎', '无', '2018-01-13 09:14:32', null, null);
INSERT INTO `diagnose` VALUES ('1691', '6308', '白带量多3天，伴外阴瘙痒', '近3天出现白带量多，伴外阴瘙痒，无阴道流血', '无殊', '无殊', '急性阴道炎,,', '', '2018-01-15 08:42:20', null, '建议至医院检查白带常规。');
INSERT INTO `diagnose` VALUES ('1692', '6309', '白带有异味7天。', '平素月经规则，末次月经2018.12.25，7天前出现白带有异味，伴外阴瘙痒', '无殊', '无殊', '急性阴道炎,,', '', '2018-01-15 08:49:40', null, '建议保持外阴清洁，穿宽松棉质短裤，建议至医院检查白带常规。');
INSERT INTO `diagnose` VALUES ('1693', '6310', '准备怀孕，孕前咨询。', '无不适主诉，准备怀孕，孕前咨询。', '无殊', '无殊', '咨询,,', '', '2018-01-15 08:55:06', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1694', '6311', '孕前咨询', '无不适主诉，准备怀孕，孕前咨询。', '无殊', '无殊', '咨询,,', '', '2018-01-15 09:10:00', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1695', '6312', '孕前咨询', '无不适主诉，准备怀孕，孕前咨询。', '无殊', '无殊', '咨询,,', '', '2018-01-15 09:40:54', null, '建议夫妻双方至医院进行一次全面的体格检查，包括血常规，肝肾功能，乙肝三系，梅毒，艾滋病，尿常规，白带常规，宫颈癌筛查，子宫附件B超，TORCH，精液常规检查等。');
INSERT INTO `diagnose` VALUES ('1696', '6303', '无', '患者半月前在我院住院检查诊为冠心病、心衰，住院治疗后症状好转出院。目前在家咳嗽咳痰数声，无明显无胸闷气促，无肢体浮肿等症状，今为复查就诊。', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '心功能不全,冠状动脉粥样硬化性心脏病', '无', '2018-01-15 14:08:50', null, null);
INSERT INTO `diagnose` VALUES ('1697', '6303', '无', '患者半月前在我院住院检查诊为冠心病、心衰，住院治疗后症状好转出院。目前在家咳嗽咳痰数声，无明显无胸闷气促，无肢体浮肿等症状，今为复查就诊。', '平素健康，否认有传染病史，否认高血压史，否认有冠心病史，否认有重大疾病病史，否认有长期用药史，否认手术史，否认外伤史，否认输血史，否认食物、药物过敏史，预防接种史不详。', null, '心功能不全,冠状动脉粥样硬化性心脏病', '无', '2018-01-15 14:08:51', null, null);
INSERT INTO `diagnose` VALUES ('1698', '6304', '无', '无', '无', null, '腰痛', '无', '2018-01-16 08:55:44', null, null);
INSERT INTO `diagnose` VALUES ('1699', '6325', '产后10余天，左侧乳房疼痛', '近几天左侧乳房疼痛。', '无殊', '无', '急性乳腺炎,,', '', '2018-01-16 15:29:34', null, '来院产后康复治疗');
INSERT INTO `diagnose` VALUES ('1700', '6331', '111', '111', '', '', '肺炎,,', '', '2018-01-17 10:17:21', null, '111');
INSERT INTO `diagnose` VALUES ('1701', '6323', '无', '患者咳嗽2周，服药后好转，后又加重，有喉头痰鸣、喘息，无明显昼夜差别，无发热，头孢克洛口服咳嗽减轻，吃奶差。', '无', null, '支气管炎,消化不良', '无', '2018-01-17 14:02:38', null, null);
INSERT INTO `diagnose` VALUES ('1702', '6323', '无', '患者咳嗽2周，服药后好转，后又加重，有喉头痰鸣、喘息，无明显昼夜差别，无发热，头孢克洛口服咳嗽减轻，吃奶差。', '无', null, '支气管炎,消化不良', '无', '2018-01-17 14:02:38', null, null);
INSERT INTO `diagnose` VALUES ('1703', '6313', '无', '病史同前，患者目前以二甲双胍片1.0 qn、沙格列汀片5mg qd治疗，平时未监测血糖，无口干、多饮、多尿、视物模糊等症状，今来我院就诊。', '无', null, '糖尿病', '无', '2018-01-17 14:19:33', null, null);
INSERT INTO `diagnose` VALUES ('1704', '6339', '轻微脑震荡', '无', '', '', '17α-羟化酶缺陷症,11β-羟化酶缺陷症,', '', '2018-01-18 17:10:35', null, '休息');
INSERT INTO `diagnose` VALUES ('1705', '6342', '产后19天，乳房疼痛', '产后19天，乳房疼痛有好转', '无殊', '', '急性乳腺炎,,', '', '2018-01-19 10:01:00', null, '保持乳汁通畅');
INSERT INTO `diagnose` VALUES ('1706', '6343', '产后39天', '产后39天，婴儿脐部凸出', '无', '', '常规产后随诊,,', '', '2018-01-19 10:12:33', null, '局部加压包扎');
INSERT INTO `diagnose` VALUES ('1707', '6353', '产后42天复查', '产后42天，恶露未尽', '', '', '常规产后随诊,,', '', '2018-01-23 16:01:38', null, '门诊配药，1周复查');
INSERT INTO `diagnose` VALUES ('1708', '6364', '头痛', '头痛', '', '', 'ABO血型不配合性反应,,', '', '2018-01-23 18:58:25', null, '睡觉');
INSERT INTO `diagnose` VALUES ('1709', '6370', '头痛', '头痛', '', '', '1型糖尿病伴并发症,,', '', '2018-01-23 19:19:01', null, '睡觉');
INSERT INTO `diagnose` VALUES ('1710', '6373', '头痛', '头痛', '', '', '1型病伴有生长发育障碍', '', '2018-01-23 19:51:34', null, '睡觉');
INSERT INTO `diagnose` VALUES ('1711', '6375', 'a\'w\'da\'w', '啊达瓦伟大', '', '', '埃博拉病毒病,,', '', '2018-01-23 20:15:41', null, '阿瓦达');
INSERT INTO `diagnose` VALUES ('1712', '6377', '啊达瓦伟大', '阿瓦达da\'w', '', '', '埃博拉病毒病,,', '', '2018-01-23 20:25:15', null, ' 阿瓦达');
INSERT INTO `diagnose` VALUES ('1713', '6383', '头疼', '头疼', '无', null, '头痛', '无', '2018-01-24 13:41:45', null, null);
INSERT INTO `diagnose` VALUES ('1714', '6427', '孕前咨询', '孕前是否需要全面检查身体，查什么项目', '无殊', '无', '健康查体,,', '', '2018-01-29 10:56:44', null, '需要针对性检查，项目：三大常规，肝肾功能，乙肝，梅毒，HIV，TORCH，妇科检查，子宫附件B超');
INSERT INTO `diagnose` VALUES ('1715', '6428', '产后5月，有时溢乳', '哺乳时另一侧溢乳', '无殊', '无', '产后溢乳,,', ' ', '2018-01-29 11:21:30', null, '无需特殊处理，注意休息，属正常现象');
INSERT INTO `diagnose` VALUES ('1716', '6432', '眼部有异物感', '沙眼', '', '', '眼底动脉供血不足', '', '2018-01-30 11:58:12', null, '眼药水');
INSERT INTO `diagnose` VALUES ('1717', '6431', '眼镜痒', '\n门诊病历\n主诉:*\n\n眼角膜炎\n', '', '', '阿尔茨海默病伴晚期发病,,', '', '2018-01-30 13:10:58', null, '少揉眼，消炎');
INSERT INTO `diagnose` VALUES ('1718', '6433', '停经35+5周', '停经35+5周', '餐后2小时血糖高', '', '单胎,,', '', '2018-01-30 15:55:16', null, '1周后门诊复查');
INSERT INTO `diagnose` VALUES ('1719', '6439', '头痛3天', '头痛3天', '', '', '头痛,,', '', '2018-01-31 11:26:49', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1720', '6445', '医生主诉部分测试', '医生先病史部分测试', '医生疾病史部分测试', '医生过敏史测试', '安定故意自毒,癌病恐怖,癌病恐怖', '', '2018-01-31 19:26:04', null, '医生处理测试');
INSERT INTO `diagnose` VALUES ('1721', '6452', '诊断开药时主诉', '诊断开药时现病史', '诊断开药时既往史', '诊断开药时过敏史', '癌病恐怖,,', '', '2018-02-01 16:26:54', null, '诊断开药时处理');
INSERT INTO `diagnose` VALUES ('1722', '6458', '1', '1', '', '', '鞍鼻,,', '', '2018-02-01 17:19:40', null, '1');
INSERT INTO `diagnose` VALUES ('1723', '6481', '胃脘部不适10余天', '目前自觉胃脘部不适，与进餐无关，四肢活动无受限。无恶心、呕吐。', '', '', '胃炎,肝功能异常,', '进一步检查', '2018-02-02 15:21:41', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1724', '6482', '头痛3天', '头痛3天', '', '', '头痛,,', '', '2018-02-02 16:48:02', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1725', '6484', '胃部不适一月', '胃脘部疼痛，无恶心、呕吐，无黑便', '', '', '胃炎,,', '进一步检查', '2018-02-02 17:06:06', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1726', '6489', '头痛', '头痛一周，无恶心、呕吐、四肢活动正常', '', '', '头痛,,', '进一步观察', '2018-02-05 10:33:32', null, '进一步观察');
INSERT INTO `diagnose` VALUES ('1727', '6490', '头痛', '头痛一周，无恶心、呕吐，四肢活动无受限', '', '', '头痛,,', '进一步观察', '2018-02-05 10:36:56', null, '进一步观察');
INSERT INTO `diagnose` VALUES ('1728', '6491', '头痛', '头痛一周，无恶心、呕吐，四肢活动无受限', '', '', '头痛,,', '观察', '2018-02-05 10:41:23', null, '观察');
INSERT INTO `diagnose` VALUES ('1729', '6498', '头痛', '头痛一周，无恶心、呕吐，四肢活动无受限', '', '', '头痛,,', '观察', '2018-02-05 10:44:59', null, '观察');
INSERT INTO `diagnose` VALUES ('1730', '6493', '眩晕一周', '眩晕一周，无恶心、呕吐，四肢活动无受限', '', '', '头晕和眩晕,,', '观察', '2018-02-05 10:47:43', null, '观察');
INSERT INTO `diagnose` VALUES ('1731', '6494', '咳嗽一天', '咳嗽一天，暂无发热，咳痰不多，无明显呼吸困难', '', '', '急性上呼吸道感染,,', '抗病毒治疗', '2018-02-05 10:50:42', null, '抗病毒治疗');
INSERT INTO `diagnose` VALUES ('1732', '6495', '头痛1天', '头痛一天，无恶心、呕吐，四肢活动无受限', '', '', '头痛,,', '观察', '2018-02-05 10:55:00', null, '观察');
INSERT INTO `diagnose` VALUES ('1733', '6497', '发热、头痛一周', '发热，体温38.5℃，伴有头痛，有咳嗽、无咳痰', '', '', '急性上呼吸道感染,,', '抗病毒治疗', '2018-02-05 11:01:00', null, '抗病毒治疗');
INSERT INTO `diagnose` VALUES ('1734', '6496', '头痛3天', '头痛一周，无恶心、呕吐，四肢活动无受限', '', '', '头痛,,', '观察', '2018-02-05 11:13:26', null, '观察');
INSERT INTO `diagnose` VALUES ('1735', '6492', '头晕1天', '视物旋转，有恶心、无呕吐', '', '', '眩晕综合征,,', '抗眩晕治疗', '2018-02-05 11:21:53', null, '抗眩晕治疗');
INSERT INTO `diagnose` VALUES ('1736', '6500', '轻度头晕1天', '无视物旋转，无恶心、呕吐，四肢活动无受限。', '', '', '头晕和眩晕,,', '观察', '2018-02-05 11:28:02', null, '观察，注意休息');
INSERT INTO `diagnose` VALUES ('1737', '6503', '无', '无', '', '', '感冒,,', '无', '2018-02-06 10:04:30', null, '无');
INSERT INTO `diagnose` VALUES ('1738', '6502', '咽部痛鼻塞数天', '咽部痛鼻塞数天', '', '', '急性上呼吸道感染,,', '中药治疗', '2018-02-06 10:11:12', null, '中药治疗');
INSERT INTO `diagnose` VALUES ('1739', '6505', '23', 'wfg', '', '', '风寒化热证,,', '', '2018-02-06 10:26:40', null, 'weg');
INSERT INTO `diagnose` VALUES ('1740', '6506', '鼻塞流涕喉咙痛2天', '鼻塞流涕喉咙痛2天', '', '', '急性上呼吸道感染,,', '', '2018-02-06 10:48:56', null, '中药5天');
INSERT INTO `diagnose` VALUES ('1741', '6511', '白带偏多数月', '白带偏多', '无', null, '慢性阴道炎', '无', '2018-02-06 13:28:54', null, null);
INSERT INTO `diagnose` VALUES ('1742', '6507', '停经35+周，来院产检', '停经35+周，胎动良', '', '', '单胎,,', '', '2018-02-06 15:41:45', null, '明日复查');
INSERT INTO `diagnose` VALUES ('1743', '6513', '眼红', '右眼红', '无', null, '结膜出血', '忌辛辣，忌烟酒。一般出血两到三周会消退', '2018-02-08 09:06:58', null, null);
INSERT INTO `diagnose` VALUES ('1744', '6520', '1', '1', '', '', '鞍鼻,,', '', '2018-02-08 11:53:40', null, '1');
INSERT INTO `diagnose` VALUES ('1745', '6514', '抢抢抢抢抢群群', '11', '1111111111', '11111111', '鞍鼻,癌病恐怖,鞍背脑膜瘤', '', '2018-02-08 13:22:33', null, '11111111');
INSERT INTO `diagnose` VALUES ('1746', '6537', 'gas的架飞机', '感受到分公司', '', '', 'ABO血型不合,,', '', '2018-02-08 14:14:18', null, '感受到分公司的个省份的');
INSERT INTO `diagnose` VALUES ('1747', '6552', '1', '1', '', '', '癌,,', '', '2018-02-08 15:26:23', null, '1');
INSERT INTO `diagnose` VALUES ('1748', '6572', '偏头疼', '偶发偏头疼1年', '', '', '头部肌肉损伤,,', '', '2018-02-08 16:20:37', null, '多休息多喝水');
INSERT INTO `diagnose` VALUES ('1749', '6573', '胃胀3天', '胃胀3天', '', '', '消化不良,,', '', '2018-02-08 16:42:27', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1750', '6570', '1', '1', '', '', '鞍鼻,,', '', '2018-02-08 17:33:59', null, '1');
INSERT INTO `diagnose` VALUES ('1751', '6580', '没救了', '青光眼', '无', null, '特指兴奋剂急性中毒', '无', '2018-02-08 18:43:27', null, null);
INSERT INTO `diagnose` VALUES ('1752', '6581', '测试', '测试', '哮喘', null, '创伤性胫后动脉血栓形成', '测试', '2018-02-08 18:44:53', null, null);
INSERT INTO `diagnose` VALUES ('1753', '6574', '1', '1', '', '', '鞍鼻,,', '', '2018-02-08 19:06:59', null, '1');
INSERT INTO `diagnose` VALUES ('1754', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:38:43', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1755', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:38:45', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1756', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:38:47', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1757', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:38:48', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1758', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:38:51', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1759', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:39:00', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1760', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:39:01', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1761', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:39:06', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1762', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:40:01', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1763', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:40:07', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1764', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:40:10', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1765', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:40:13', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1766', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:40:30', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1767', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:43:37', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1768', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:44:11', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1769', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:44:20', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1770', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:49:21', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1771', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:49:25', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1772', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:49:53', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1773', '6587', '血糖升高1周', '一周前发现血糖升高', '', '', '胃炎,糖耐量异常,', '', '2018-02-09 09:49:57', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1784', '6597', '主诉', '馅饼事', '哮喘,高脂血症,高尿酸血症,高血压', null, '撞到别人或意外被别人碰撞', '真理已经', '2018-02-09 10:32:06', null, null);
INSERT INTO `diagnose` VALUES ('1785', '6592', '胃痛1天', '胃痛，无恶心、呕吐，无黑便', '', '', '胃炎,,', '进一步检查', '2018-02-09 10:34:58', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1787', '6599', '头痛3天', '头痛3天', '', '', '头痛,,', '', '2018-02-09 11:08:17', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1788', '6589', '11111', '1111111111', '1111111', '11111111', '埃博拉病毒病,,', '', '2018-02-09 13:16:43', null, '11111111');
INSERT INTO `diagnose` VALUES ('1789', '6621', '头痛2天。', '患儿昨天始出现头痛，有鼻塞，流浓涕，无发热。', '有鼻窦炎', '无', '急性鼻窦炎,,', '', '2018-02-09 14:10:39', null, '治疗');
INSERT INTO `diagnose` VALUES ('1790', '6627', '眼睛模糊，为用眼疲劳所致，应隔段时间远眺一会', '眼睛疲劳所致', '眼睛轻度近视', null, '眼睛疲劳', '无', '2018-02-09 15:56:26', null, null);
INSERT INTO `diagnose` VALUES ('1791', '6628', '眼睛疲劳', '眼睛近视加深', '眼睛轻度近视', null, '眼上直肌麻痹', '建议不要长时间盯着屏幕', '2018-02-09 16:00:08', null, null);
INSERT INTO `diagnose` VALUES ('1792', '6630', '腹泻3天', '患者3天前出现腹泻，呈黄色糊状便，日解4-5次，无粘液脓血便，无发热，无呕吐，腹痛。', '体健', '无', '急性非感染性胃肠炎,,', '', '2018-02-09 16:36:52', null, '开药');
INSERT INTO `diagnose` VALUES ('1793', '6625', '发力怕冷鼻塞数天', '无咳嗽，无发热', '', '', '急性上呼吸道感染,,', '', '2018-02-09 16:39:56', null, '建议多休息，多饮水，如果症状加重，建议进一步诊治。');
INSERT INTO `diagnose` VALUES ('1794', '6620', '停经34周，宫缩频繁1天', '今天起活动后宫缩频繁，但少于10分钟2次，不痛。', '', '', '单胎,,', '', '2018-02-09 16:43:05', null, '注意胎动，如多于10分钟2次宫缩来院就诊。');
INSERT INTO `diagnose` VALUES ('1795', '6609', '高血压', '高血压，脂肪肝', '', '', '高血压1级,脂肪肝,', '建议低钠、低脂饮食。', '2018-02-09 16:47:53', null, '建议低钠、低脂饮食');
INSERT INTO `diagnose` VALUES ('1796', '6626', '产后4年，经期下腹隐痛', '产后4年来，经期下腹隐痛，B超提示盆腔积液', '', '', '女性盆腔炎性疾病,,', '', '2018-02-09 16:50:11', null, '经期抗炎治疗');
INSERT INTO `diagnose` VALUES ('1797', '6633', '眼睛主诉', '视觉疲劳', '骨折', null, '眼睛疲劳', '眼睛', '2018-02-09 17:39:05', null, null);
INSERT INTO `diagnose` VALUES ('1798', '6664', '胃痛1天', '胃痛1天', '', '', '胃痛,,', '', '2018-02-12 08:44:52', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1799', '6665', '血小板增多半年', '目前血小板增多症，目前羟基脲控制尚可', '血小板增多症', '', '血小板增多,,', '药物控制', '2018-02-12 09:57:14', null, '药物控制');
INSERT INTO `diagnose` VALUES ('1800', '6668', '无', '无', '无', '', '感冒,,', '', '2018-02-25 12:02:51', null, '无');
INSERT INTO `diagnose` VALUES ('1801', '6676', '头晕7天', '7天前出现头晕，无恶心呕吐', '高血压病', '无', '头晕和眩晕,高血压病,', '控制饮食、低盐低脂饮食，适当锻炼', '2018-02-27 13:26:51', null, '开药、锻炼');
INSERT INTO `diagnose` VALUES ('1802', '6676', '头晕7天', '7天前出现头晕，无恶心呕吐', '高血压病', '无', '头晕和眩晕,高血压病,', '控制饮食、低盐低脂饮食，适当锻炼', '2018-02-27 13:26:54', null, '开药、锻炼');
INSERT INTO `diagnose` VALUES ('1803', '6675', '停经37+1周', '停经37+1周，来院检查', '无殊', '', '单胎,,', '', '2018-02-27 15:47:49', null, '下周二复查');
INSERT INTO `diagnose` VALUES ('1804', '6679', '咳嗽', '咳嗽5-6天，开始时痰液清，现咳嗽加剧、痰液偏黄', '', '', '呼吸道疾病,,', '建议服用化痰、止咳口服药，来医院进一步就诊，检查肺部是否有异。', '2018-02-28 10:59:34', null, '建议服用化痰、止咳口服液，进一步来医院就诊。');
INSERT INTO `diagnose` VALUES ('1805', '6679', '咳嗽', '咳嗽5-6天，开始时痰液清，现咳嗽加剧、痰液偏黄', '', '', '呼吸道疾病,,', '建议服用化痰、止咳口服药，来医院进一步就诊，检查肺部是否有异。', '2018-02-28 10:59:36', null, '建议服用化痰、止咳口服液，进一步来医院就诊。');
INSERT INTO `diagnose` VALUES ('1806', '6682', '测试', '测试', '无', null, '特指兴奋剂遗忘综合征', '无', '2018-02-28 14:16:24', null, null);
INSERT INTO `diagnose` VALUES ('1807', '6683', '测试', '无', '无', null, '感冒', '无', '2018-02-28 14:43:33', null, null);
INSERT INTO `diagnose` VALUES ('1808', '6686', '测试', '测试', '哮喘,高脂血症', null, '感冒', '无', '2018-03-01 14:32:51', null, null);
INSERT INTO `diagnose` VALUES ('1809', '6687', 'sdsd', 'sdad', '', '', 'ED', 'sss', '2018-03-01 14:50:57', null, 'sda');
INSERT INTO `diagnose` VALUES ('1810', '6690', '测试', '测试', '', '', '感冒,,', '测试 ', '2018-03-01 14:56:58', null, '测试');
INSERT INTO `diagnose` VALUES ('1811', '6695', 'sadsadsadas', 'sadsadsa', 'asdsa', 'dasdsad', '奥迪括约肌狭窄,,', '', '2018-03-01 15:28:59', null, 'asdsa');
INSERT INTO `diagnose` VALUES ('1812', '6697', 'dfds', 'fdsfdsf', 'dsfds', 'fdsf', '鞍鼻,,', '', '2018-03-02 09:50:43', null, 'dsfdsf');
INSERT INTO `diagnose` VALUES ('1813', '6696', '测试', '感冒', '无', null, '特指兴奋剂戒断状态', '无', '2018-03-02 09:52:25', null, null);
INSERT INTO `diagnose` VALUES ('1814', '6702', '11', '11', '', '', 'ABO血型不合,,', '', '2018-03-05 14:06:06', null, '11');
INSERT INTO `diagnose` VALUES ('1815', '6704', '咽喉痛3天', '自觉咽喉疼痛，无声音嘶哑，无发热，无咳嗽、咳痰', '无明显异常', '无明显异常', '咽峡炎,,', '药物治疗', '2018-03-06 13:43:02', null, '药物治疗');
INSERT INTO `diagnose` VALUES ('1816', '6705', '停经38+周', '要求看化验单', '无殊', '', '单胎,,', '', '2018-03-06 15:30:56', null, '下周复诊');
INSERT INTO `diagnose` VALUES ('1817', '6708', '11111', '111111111', '1111111', '1111111', '埃博拉病毒病,,', '', '2018-03-07 16:00:37', null, '111111');
INSERT INTO `diagnose` VALUES ('1818', '6709', '咽喉痛3天', '自觉咽喉疼痛，无声音嘶哑，无发热，无咳嗽、咳痰', '无', '无', '咽峡炎,,', '', '2018-03-08 11:03:23', null, '药物治疗');
INSERT INTO `diagnose` VALUES ('1819', '6709', '咽喉痛3天', '自觉咽喉疼痛，无声音嘶哑，无发热，无咳嗽、咳痰', '无', '无', '咽峡炎,,', '', '2018-03-08 11:03:24', null, '药物治疗');
INSERT INTO `diagnose` VALUES ('1820', '6710', '的', 'GG', '哮喘,肺结核,颈部手术', null, '哈哈哈', '无', '2018-03-09 14:10:30', null, null);
INSERT INTO `diagnose` VALUES ('1821', '6711', '胸闷心慌数日', '无咳嗽，咳痰', '体健', '无', '累及循环和呼吸系统特指症状和体征,,', '', '2018-03-12 09:09:57', null, '检查，服药');
INSERT INTO `diagnose` VALUES ('1822', '6712', '冠心病支架植入术后10月', '偶有胸闷心慌感', '冠心病史数年', '无', '冠心病,,', '复诊', '2018-03-12 09:57:25', null, '继续服药，复查心电图，动态心电图，血常规，凝血全套，血生化');
INSERT INTO `diagnose` VALUES ('1823', '6717', '近期早晚量血压过高，怀孕4个月。', '患者妊娠4月余，近期出现头晕，乏力。血压过高。收缩压150~170mmhg左右。', '', '', '高血压病,,', '', '2018-03-13 09:08:19', null, '给予贝那普利5mg,口服，每日一次；双克12.5mg,口服，每日一次。');
INSERT INTO `diagnose` VALUES ('1824', '6718', '高血压药物咨询', '高血压2年。', '', '', '高血压1级,,', '', '2018-03-13 09:13:11', null, '检查');
INSERT INTO `diagnose` VALUES ('1825', '6718', '高血压药物咨询', '高血压2年。', '', '', '高血压1级,,', '', '2018-03-13 09:13:11', null, '检查');
INSERT INTO `diagnose` VALUES ('1826', '6719', '胸闷3天', '胸闷3天', '', '', '心悸,,', '', '2018-03-13 09:45:05', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1827', '6719', '胸闷3天', '胸闷3天', '', '', '心悸,,', '', '2018-03-13 09:45:06', null, '线下检查');
INSERT INTO `diagnose` VALUES ('1828', '6724', '自觉胸闷3天', '自觉胸闷、心悸，无恶心、呕吐，无明显胸痛', '无明显异常', '', '心律失常,,', '心电图检查', '2018-03-13 10:41:40', null, '心电图检查');
INSERT INTO `diagnose` VALUES ('1829', '6729', '冠脉支架术后10月', '既往冠心病，冠脉支架术后，目前无明显胸闷胸痛，一般运动耐力尚可', '冠心病，高血压', '', '冠心病,冠状动脉介入治疗后随诊检查,', '门诊随访', '2018-03-13 11:10:06', null, '随诊');
INSERT INTO `diagnose` VALUES ('1830', '6720', '停经54天', '末次月经：2018.1.19', 'ws', '', '确认妊娠,,', '', '2018-03-13 15:57:21', null, '1月后复查');
INSERT INTO `diagnose` VALUES ('1831', '6736', '看看', '看看', '哮喘,肺结核,颈部手术', null, '可卡因伴有谵妄的戒断状态', '北京', '2018-03-15 10:15:14', null, null);
INSERT INTO `diagnose` VALUES ('1832', '6735', '停经3+月，孕期咨询。', '平时月经规则，末次月经：2017.12.04，性质同前。现无腹痛腹胀，无阴道流血流液，3.13本月B超：宫内孕单活胎 双顶径2.5cm。孕酮41.3,偏低，是否需保胎。', '无殊', '无殊', '健康查体,,', '', '2018-03-16 09:52:49', null, '1.注意休息及营养；2.建议建卡；3.定期产前检查；4.建议NT检查；5.暂无需特殊处理。');
INSERT INTO `diagnose` VALUES ('1833', '6738', '乱语，精神行为异常半年', '患者目前药物治疗后，症状好转，目前四肢活动无受限。', '既往痴呆病史', '', '痴呆,精神障碍,', '药物治疗，定期复诊', '2018-03-16 11:05:06', null, '药物治疗，定期复诊，暂定药物减量方案');
INSERT INTO `diagnose` VALUES ('1834', '6739', '胃部不适一月', '胃脘部疼痛，无恶心、呕吐，无黑便', '', '', '胃炎,,', '', '2018-03-19 10:12:04', null, '进一步检查');
INSERT INTO `diagnose` VALUES ('1835', '6740', '胸闷气急1年', '胸闷气急1年，活动后加重，当地医院医生肺部听诊有哮鸣音。心无杂音。', '高血压史10年，吸烟史40年，每天1包，', '', '高血压病,冠心病,支气管炎', '', '2018-03-20 10:15:34', null, '心超、胸部CT、必要时冠脉介入等检查与治疗');
INSERT INTO `diagnose` VALUES ('1836', '6740', '胸闷气急1年', '胸闷气急1年，活动后加重，当地医院医生肺部听诊有哮鸣音。心无杂音。', '高血压史10年，吸烟史40年，每天1包，', '', '高血压病,冠心病,支气管炎', '', '2018-03-20 10:15:36', null, '心超、胸部CT、必要时冠脉介入等检查与治疗');
INSERT INTO `diagnose` VALUES ('1837', '6755', '测试', '测试', '', '', '1型糖尿病伴并发症,,', '', '2018-03-23 09:37:12', null, '测试');
INSERT INTO `diagnose` VALUES ('1838', '6769', '试试', '试试', '', '', '安定剂意外中毒,,', '', '2018-03-24 19:51:56', null, '试试');
INSERT INTO `diagnose` VALUES ('1839', '6767', '啊啊', '啊啊', '', '', '安定剂意外中毒,,', '', '2018-03-24 20:16:30', null, '啊啊');
INSERT INTO `diagnose` VALUES ('1840', '6762', '号患', '全球', '', '', '氨茶硷意外中毒,,', '', '2018-03-24 20:24:50', null, '全球');
INSERT INTO `diagnose` VALUES ('1841', '6780', '1', '1', '', '', '鞍鼻,,', '', '2018-03-25 14:00:50', null, '1');
INSERT INTO `diagnose` VALUES ('1842', '6783', '无', '无', '', '', '感冒,,', '', '2018-03-25 14:01:06', null, '无');
INSERT INTO `diagnose` VALUES ('1843', '6784', '1', '1', '', '', '鞍鼻,,', '', '2018-03-25 14:07:02', null, '1');
INSERT INTO `diagnose` VALUES ('1844', '6786', '无', '无', '', '', '感冒,,', '', '2018-03-25 14:22:11', null, '无');
INSERT INTO `diagnose` VALUES ('1845', '6792', '1', '1', '', '', '鞍鼻,,', '', '2018-03-25 15:01:35', null, '1');
INSERT INTO `diagnose` VALUES ('1846', '6796', '无', '无', '', '', '感冒,,', '', '2018-03-25 15:30:03', null, '无');
INSERT INTO `diagnose` VALUES ('1847', '6797', '1', '1', '哮喘,高脂血症,高尿酸血症,高血压', null, '1', '无', '2018-03-25 16:13:51', null, null);
INSERT INTO `diagnose` VALUES ('1848', '6806', '1', '1', '', '', '鞍鼻,,', '', '2018-03-25 16:15:11', null, '1');
INSERT INTO `diagnose` VALUES ('1849', '6808', '1', '1', '', '', '癌,,', '', '2018-03-25 16:23:20', null, '1');
INSERT INTO `diagnose` VALUES ('1850', '6813', '1', '1', '', '', '鞍鼻,,', '', '2018-03-25 16:49:44', null, '1');
INSERT INTO `diagnose` VALUES ('1851', '6809', '啊啊啊啊', '我现在兔兔', '无', null, '他我在真转我', '无', '2018-03-25 18:27:03', null, null);
INSERT INTO `diagnose` VALUES ('1852', '6821', '啦卡通', '偷渡独特', '无', null, '木头哦偷渡', '无', '2018-03-25 18:29:41', null, null);
INSERT INTO `diagnose` VALUES ('1853', '6802', '个咯啦咯啦', '突突突拒绝', '无', null, '门楼水库', '无', '2018-03-25 18:58:48', null, null);
INSERT INTO `diagnose` VALUES ('1854', '6826', '噢噢噢哦哦', '啦咯啦咯啦咯', '无', null, '咯哦哟下午', '无', '2018-03-25 19:00:01', null, null);
INSERT INTO `diagnose` VALUES ('1855', '6804', '主诉', '现病史', '哮喘,高脂血症,高尿酸血症,高血压', null, '战壕热', '诊疗意见', '2018-03-25 19:22:41', null, null);
INSERT INTO `diagnose` VALUES ('1856', '6842', '无', '无', '', '', '感冒,,', '', '2018-03-26 09:43:12', null, '无');
INSERT INTO `diagnose` VALUES ('1857', '6845', '无', '无', '', '', '感冒,,', '', '2018-03-26 11:23:32', null, '无');
INSERT INTO `diagnose` VALUES ('1858', '6856', '无', '无', '', '', '感冒,,', '', '2018-03-27 11:42:08', null, '无');
INSERT INTO `diagnose` VALUES ('1859', '6861', '无', '无', '', '', '感冒,,', '', '2018-03-27 12:31:14', null, '无');
INSERT INTO `diagnose` VALUES ('1860', '6862', '无', '无', '', '', '感冒,,', '', '2018-03-27 12:43:06', null, '无');
INSERT INTO `diagnose` VALUES ('1861', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 11:55:14', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1862', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 11:55:41', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1863', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 12:00:39', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1864', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 13:17:45', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1865', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 13:20:00', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1866', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 13:31:43', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1867', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 13:33:26', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1868', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 13:57:07', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1869', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 14:26:28', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1870', '6900', '是第三方', 'a\'w\'da\'w\'da\'w\'da\'w\'D\'da\'w A AdAWdawdawdAWdawdaw', '', '', '发热,感冒,', '', '2018-04-09 14:45:43', null, 'awdadawdawdAdawdawdadwad');
INSERT INTO `diagnose` VALUES ('1871', '6905', '1', '1', '', '', '鞍鼻,,', '', '2018-04-09 16:21:42', null, '1');
INSERT INTO `diagnose` VALUES ('1872', '6908', '1', '1', '', '', '鞍鼻,,', '', '2018-04-09 17:25:43', null, '1');
INSERT INTO `diagnose` VALUES ('1873', '6908', '1', '1', '', '', '鞍鼻,,', '', '2018-04-09 17:25:48', null, '1');
INSERT INTO `diagnose` VALUES ('1874', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 09:48:01', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1875', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 09:49:38', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1876', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 09:51:47', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1877', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 09:57:31', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1878', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 10:01:12', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1879', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 10:14:43', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1880', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 10:15:33', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1881', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 10:16:26', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1882', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 10:20:15', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1883', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 11:22:42', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1884', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 11:31:58', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1885', '6911', 'iu啊回答还u的哈段啊打基地啊啊搭建啊巨大大将军啊我啊阿娇大家都', '啊我店铺i啊的啊大家打大当家啊就打觉得阿达啊大家啊我的啊我觉得 adware达娃大的阿文打完就打我教大家大大文档', '', '', '埃波拉病毒病,,', '', '2018-04-10 13:08:46', null, '对外u很大哇啊我就打完就dawdle阿文【搭建啊我到家啊大大 的叫阿呆阿文');
INSERT INTO `diagnose` VALUES ('1886', '6909', '1', '1', '', '', '埃波拉病毒病,,', '', '2018-04-10 13:30:18', null, '1');
INSERT INTO `diagnose` VALUES ('1887', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 15:40:12', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1888', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 15:41:46', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1889', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 15:43:21', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1890', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 15:54:51', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1891', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:05:06', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1892', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:06:46', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1893', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:10:14', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1894', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:15:23', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1895', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:27:55', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1896', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:52:09', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1897', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 16:52:40', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1898', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:00:34', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1899', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:02:29', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1900', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:03:48', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1901', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:18:46', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1902', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:19:07', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1903', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:24:40', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1904', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:26:46', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1905', '6912', '我哦阿姐都怕我觉得哎的叫阿呆阿瓦达啊就打就多久啊大家都阿瓦', '啊都i家啊我i打家啊我大家都【啊我觉得怕纪委阿文打【的阿娇', '', '', 'ABO血型不合的孕产妇治疗,,', '', '2018-04-10 17:27:04', null, '啊都哈无敌回调哈的拍哈的阿达啊哈皮好你的');
INSERT INTO `diagnose` VALUES ('1906', '6910', 'opijsoijnfsf', 'fawdadadaw', '', '', '鞍部脑膜瘤,,', '', '2018-04-10 17:31:50', null, 'awdawdawdwa');
INSERT INTO `diagnose` VALUES ('1907', '6913', 'adad', 'awdawd', '', '', '鞍部脑膜瘤', '', '2018-04-11 10:57:25', null, 'awda');
INSERT INTO `diagnose` VALUES ('1908', '6914', 'dawdaw', 'dwadaw', 'wdwadaw', 'dwad', '埃波拉病毒病', '', '2018-04-11 13:15:52', null, 'awdawda');
INSERT INTO `diagnose` VALUES ('1909', '6915', 'awda', 'wdawaw', '', '', '鞍部脑膜瘤', '', '2018-04-11 13:23:24', null, 'daw');
INSERT INTO `diagnose` VALUES ('1910', '6916', '1', '11', '', '', '鞍鼻,,', '', '2018-04-11 14:54:14', null, '1');
INSERT INTO `diagnose` VALUES ('1911', '6917', '啊达瓦达瓦', '达娃大', '', '', '鞍部脑膜瘤,,', '', '2018-04-12 09:33:07', null, 'dawdle阿瓦达');
INSERT INTO `diagnose` VALUES ('1912', '6917', '啊达瓦达瓦', '达娃大', '', '', '鞍部脑膜瘤,,', '', '2018-04-12 09:34:48', null, 'dawdle阿瓦达');
INSERT INTO `diagnose` VALUES ('1913', '6917', '啊达瓦达瓦', '达娃大', '', '', '鞍部脑膜瘤,,', '', '2018-04-12 09:36:36', null, 'dawdle阿瓦达');
INSERT INTO `diagnose` VALUES ('1914', '6938', '啊啊', '是是', '', '', '虫扰魄门证', '', '2018-04-12 15:43:13', null, '的的');
INSERT INTO `diagnose` VALUES ('1915', '6937', '测试1', '地槽', '', '', '结膜炎', '', '2018-04-12 15:43:45', null, '撒发');
INSERT INTO `diagnose` VALUES ('1916', '6939', '达瓦达瓦', '啊达瓦达瓦打', '', '', '虫结证', '', '2018-04-12 15:59:15', null, '阿瓦达啊阿文');
INSERT INTO `diagnose` VALUES ('1917', '7001', 'ui啊还丢啊很短你阿瓦达 阿达我就都i', '啊达瓦伟大我ui啊还丢啊很短你阿瓦达 阿达我就都i', '', '', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-04-16 10:52:10', null, 'ui啊还丢啊很短你阿瓦达 阿达我就都i');
INSERT INTO `diagnose` VALUES ('1918', '7002', '16161', '554654', '', '', '虫积化疳证,,', '', '2018-04-16 16:13:48', null, '44654654');
INSERT INTO `diagnose` VALUES ('1919', '7040', '结膜炎', '山洞里附近', '', '', '结膜炎,,', '', '2018-04-17 16:10:07', null, '第三方');
INSERT INTO `diagnose` VALUES ('1920', '7049', '士大夫', '的咖啡机 ', '', '', '鞍鼻,鞍鼻,', '', '2018-04-19 13:38:52', null, '大发');
INSERT INTO `diagnose` VALUES ('1921', '7057', 'adwdawd', 'dawdawd', '无', null, '阿米巴性肠炎', 'adawdaw', '2018-04-19 16:57:28', null, null);
INSERT INTO `diagnose` VALUES ('1922', '7057', 'awdawd', 'awdawdwa', '无', null, '阿哥拉沙门氏菌肠炎', 'adwadawd', '2018-04-19 16:58:55', null, null);
INSERT INTO `diagnose` VALUES ('1923', '7057', 'adwdawd', 'awdawdawd', '无', null, '阿米巴性结肠炎', 'adwawdawd', '2018-04-19 17:02:05', null, null);
INSERT INTO `diagnose` VALUES ('1924', '7049', '1', '1', '无', null, '阿米巴性肉芽肿(阿米巴瘤)', 'adwad', '2018-04-19 17:08:32', null, null);
INSERT INTO `diagnose` VALUES ('1925', '7049', '士大夫', '的咖啡机 ', '', '', '鞍鼻,鞍鼻,', '', '2018-04-19 17:25:39', null, '大发');
INSERT INTO `diagnose` VALUES ('1926', '7058', '我', '我', '无', null, '阿哥拉沙门氏菌肠炎', '喝的 demo', '2018-04-20 09:24:13', null, null);
INSERT INTO `diagnose` VALUES ('1927', '7058', '我', '我', '无', null, '阿哥拉沙门氏菌肠炎', '喝的 demo', '2018-04-20 09:25:58', null, null);
INSERT INTO `diagnose` VALUES ('1928', '7058', '我', '我', '无', null, '阿哥拉沙门氏菌肠炎', '我的', '2018-04-20 10:00:58', null, null);
INSERT INTO `diagnose` VALUES ('1929', '7058', '好', '啊', '无', null, '阿哥拉沙门氏菌肠炎', '这种', '2018-04-20 10:04:35', null, null);
INSERT INTO `diagnose` VALUES ('1930', '7058', 'a', 'A', '无', null, '鼠伤寒沙门氏菌感染', 'SSS', '2018-04-20 10:07:37', null, null);
INSERT INTO `diagnose` VALUES ('1931', '7058', 'a', 'A', '无', null, '阿哥拉沙门氏菌肠炎', 'S', '2018-04-20 10:14:04', null, null);
INSERT INTO `diagnose` VALUES ('1932', '7058', '1', '1', '无', null, '其他沙门氏菌感染', '111', '2018-04-20 10:21:10', null, null);
INSERT INTO `diagnose` VALUES ('1933', '7058', '1', '1', '无', null, '其他沙门氏菌感染', '111', '2018-04-20 10:21:31', null, null);
INSERT INTO `diagnose` VALUES ('1934', '7058', '1', '1', '无', null, '其他沙门氏菌感染', '111', '2018-04-20 10:23:12', null, null);
INSERT INTO `diagnose` VALUES ('1935', '7058', 'Hdhh', 'The', '无', null, 'You', 'The new', '2018-04-20 11:13:12', null, null);
INSERT INTO `diagnose` VALUES ('1936', '7058', 'Hdhh', 'The', '无', null, 'You', 'The new', '2018-04-20 11:13:43', null, null);
INSERT INTO `diagnose` VALUES ('1937', '7058', 'Hdhh', 'The', '无', null, 'You', 'The new', '2018-04-20 11:13:54', null, null);
INSERT INTO `diagnose` VALUES ('1938', '7058', 'Hdhh', 'The', '无', null, 'You', 'The new', '2018-04-20 11:14:24', null, null);
INSERT INTO `diagnose` VALUES ('1939', '7058', 'Hdhh', 'The', '无', null, 'You', 'The new', '2018-04-20 11:15:43', null, null);
INSERT INTO `diagnose` VALUES ('1940', '7058', 'Hdhh', 'The', '无', null, 'You', 'The new', '2018-04-20 11:17:17', null, null);
INSERT INTO `diagnose` VALUES ('1941', '7058', 'Jrrhh', 'You got', '无', null, 'The app', '无', '2018-04-20 11:35:28', null, null);
INSERT INTO `diagnose` VALUES ('1942', '7058', 'You', 'You', '无', null, 'The', '无', '2018-04-20 11:38:55', null, null);
INSERT INTO `diagnose` VALUES ('1943', '7058', 'The', 'The', '无', null, 'The', '无', '2018-04-20 11:51:36', null, null);
INSERT INTO `diagnose` VALUES ('1944', '7058', 'The', 'You', '无', null, 'You', '无', '2018-04-20 12:00:02', null, null);
INSERT INTO `diagnose` VALUES ('1945', '7058', '嗯', '你', '无', null, '不能容忍你', '无', '2018-04-20 13:12:57', null, null);
INSERT INTO `diagnose` VALUES ('1946', '7058', '1', '1', '无', null, '阿哥拉沙门氏菌肠炎', '111', '2018-04-20 13:46:36', null, null);
INSERT INTO `diagnose` VALUES ('1947', '7058', '在', '这', '无', null, '粘附性大肠杆菌肠炎', '无', '2018-04-20 13:58:48', null, null);
INSERT INTO `diagnose` VALUES ('1948', '7058', '嗯', '嗯', '无', null, '粘附性大肠杆菌肠炎', '无', '2018-04-20 14:02:14', null, null);
INSERT INTO `diagnose` VALUES ('1949', '7058', '嗯', '嗯', '无', null, '粘附性大肠杆菌肠炎', '无', '2018-04-20 14:03:18', null, null);
INSERT INTO `diagnose` VALUES ('1950', '7058', '我', '我', '无', null, '丙型副伤寒', '本周六', '2018-04-20 14:08:47', null, null);
INSERT INTO `diagnose` VALUES ('1951', '7058', '我', '我', '无', null, '丙型副伤寒', '本周六', '2018-04-20 14:12:31', null, null);
INSERT INTO `diagnose` VALUES ('1952', '7058', '我', '我', '无', null, '呼吸道结核病，经细菌学和组织学证实', 'uu uu', '2018-04-20 14:14:12', null, null);
INSERT INTO `diagnose` VALUES ('1953', '7058', 'q', 'q', '无', null, '未特指的副伤寒', 'q', '2018-04-20 14:19:05', null, null);
INSERT INTO `diagnose` VALUES ('1954', '7058', 'q', 'q', '无', null, '其他沙门氏菌感染', 'q', '2018-04-20 14:21:42', null, null);
INSERT INTO `diagnose` VALUES ('1955', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:32:43', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1956', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:33:16', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1957', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:38:01', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1958', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:38:28', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1959', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:49:29', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1960', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:53:14', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1961', '7064', 'a\'da\'d', 'a\'da\'da\'da\'da', '', '', '鞍鼻,,', '', '2018-04-21 15:53:15', null, 'a\'w\'da\'d\'wa');
INSERT INTO `diagnose` VALUES ('1962', '7065', '主食', '现病史', '无', null, '中毒性痢疾', '我', '2018-04-21 16:05:46', null, null);
INSERT INTO `diagnose` VALUES ('1963', '7068', '11', '11', '无', null, '饥饿效应', '11', '2018-04-23 15:50:57', null, null);
INSERT INTO `diagnose` VALUES ('1964', '7102', '123123', '12312542345235', '', '', '虫寄皮下证,虫结证,', '', '2018-04-26 10:40:37', null, '63456734572457');
INSERT INTO `diagnose` VALUES ('1965', '7113', '厄', '啊', '哮喘,肺结核,颅脑手术', null, '啊啊', '无', '2018-04-27 13:23:25', null, null);
INSERT INTO `diagnose` VALUES ('1966', '7142', '方式', '人太热', '', '', '虫侵于脑证,,', '', '2018-04-28 15:57:35', null, '三个飞are有');
INSERT INTO `diagnose` VALUES ('1967', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-04 15:30:46', null, null);
INSERT INTO `diagnose` VALUES ('1968', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-04 15:45:47', null, null);
INSERT INTO `diagnose` VALUES ('1969', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-04 15:53:31', null, null);
INSERT INTO `diagnose` VALUES ('1970', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-04 17:29:41', null, null);
INSERT INTO `diagnose` VALUES ('1971', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-04 17:32:20', null, null);
INSERT INTO `diagnose` VALUES ('1972', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-07 09:19:28', null, null);
INSERT INTO `diagnose` VALUES ('1973', '7162', '无', '无', '无', null, '头痛', '无', '2018-05-07 11:22:45', null, null);
INSERT INTO `diagnose` VALUES ('1974', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-09 10:00:10', null, null);
INSERT INTO `diagnose` VALUES ('1975', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-09 10:02:36', null, null);
INSERT INTO `diagnose` VALUES ('1976', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-09 10:11:48', null, null);
INSERT INTO `diagnose` VALUES ('1977', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-09 10:12:16', null, null);
INSERT INTO `diagnose` VALUES ('1978', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:02:56', null, null);
INSERT INTO `diagnose` VALUES ('1979', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:00', null, null);
INSERT INTO `diagnose` VALUES ('1980', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:08', null, null);
INSERT INTO `diagnose` VALUES ('1981', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:08', null, null);
INSERT INTO `diagnose` VALUES ('1982', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:08', null, null);
INSERT INTO `diagnose` VALUES ('1983', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:08', null, null);
INSERT INTO `diagnose` VALUES ('1984', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:08', null, null);
INSERT INTO `diagnose` VALUES ('1985', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:08', null, null);
INSERT INTO `diagnose` VALUES ('1986', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:03:09', null, null);
INSERT INTO `diagnose` VALUES ('1987', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 09:06:06', null, null);
INSERT INTO `diagnose` VALUES ('1988', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 15:00:14', null, null);
INSERT INTO `diagnose` VALUES ('1989', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:26:41', null, null);
INSERT INTO `diagnose` VALUES ('1990', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:26:48', null, null);
INSERT INTO `diagnose` VALUES ('1991', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:26:52', null, null);
INSERT INTO `diagnose` VALUES ('1992', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:26:53', null, null);
INSERT INTO `diagnose` VALUES ('1993', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:26:53', null, null);
INSERT INTO `diagnose` VALUES ('1994', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:40:42', null, null);
INSERT INTO `diagnose` VALUES ('1995', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 16:40:48', null, null);
INSERT INTO `diagnose` VALUES ('1996', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 17:04:29', null, null);
INSERT INTO `diagnose` VALUES ('1997', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 18:57:42', null, null);
INSERT INTO `diagnose` VALUES ('1998', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-10 18:57:45', null, null);
INSERT INTO `diagnose` VALUES ('1999', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-10 18:58:07', null, null);
INSERT INTO `diagnose` VALUES ('2000', '7231', '快乐旅途', '痛苦了', '无', null, 'b', '来咯涂涂乐', '2018-05-11 11:52:10', null, null);
INSERT INTO `diagnose` VALUES ('2001', '7211', '1', '1', '', '', '鞍鼻,,', '', '2018-05-11 20:23:47', null, '1');
INSERT INTO `diagnose` VALUES ('2002', '7211', '1', '1', '', '', '鞍鼻,,', '', '2018-05-11 20:24:17', null, '1');
INSERT INTO `diagnose` VALUES ('2003', '7211', '1', '1', '', '', '鞍鼻,,', '', '2018-05-11 20:24:32', null, '1');
INSERT INTO `diagnose` VALUES ('2004', '7238', 'f', 'f', '', '', '鞍鼻,,', '', '2018-05-11 21:12:32', null, 'f');
INSERT INTO `diagnose` VALUES ('2005', '7238', 'f', 'f', '', '', '鞍鼻,,', '', '2018-05-11 21:15:45', null, 'f');
INSERT INTO `diagnose` VALUES ('2006', '7238', 'f', 'f', '', '', '鞍鼻,,', '', '2018-05-11 21:16:26', null, 'f');
INSERT INTO `diagnose` VALUES ('2007', '7238', 'f', 'f', '', '', '鞍鼻,,', '', '2018-05-11 21:16:55', null, 'f');
INSERT INTO `diagnose` VALUES ('2008', '7238', 'f', 'f', '', '', '鞍鼻,,', '', '2018-05-11 21:53:07', null, 'f');
INSERT INTO `diagnose` VALUES ('2009', '7240', 'd\'wa\'d', '啊达瓦伟大', '', '', '鞍鼻,,', '', '2018-05-13 09:49:53', null, '啊德瓦达');
INSERT INTO `diagnose` VALUES ('2010', '7240', '伴郎', 'back', '无', null, '困了困了', '来吃鸡了', '2018-05-13 13:36:30', null, null);
INSERT INTO `diagnose` VALUES ('2011', '7240', 'd\'wa\'d', '啊达瓦伟大', '', '', '鞍鼻,,', '', '2018-05-13 13:37:32', null, '啊德瓦达');
INSERT INTO `diagnose` VALUES ('2012', '7241', '哦哦哦', '困了困了', '无', null, '霉样真菌病', '16699', '2018-05-13 13:45:10', null, null);
INSERT INTO `diagnose` VALUES ('2013', '7242', '啦啦啦', '啦啦啦', '无', null, '肝门淋巴结核', '无', '2018-05-13 14:43:54', null, null);
INSERT INTO `diagnose` VALUES ('2014', '7243', '看看', '把', '无', null, '肝门淋巴结核', '无', '2018-05-13 15:01:51', null, null);
INSERT INTO `diagnose` VALUES ('2015', '7246', '123', '11', '无', null, '123', '123', '2018-05-14 10:21:41', null, null);
INSERT INTO `diagnose` VALUES ('2016', '7246', '伟奇', '伟奇', '无', null, '水痘肺炎', '是', '2018-05-14 10:22:36', null, null);
INSERT INTO `diagnose` VALUES ('2017', '7246', '伟奇', '伟奇', '无', null, '水痘肺炎', '是', '2018-05-14 10:22:44', null, null);
INSERT INTO `diagnose` VALUES ('2018', '7248', '切', '请问', '无', null, '去污剂刺激性接触性皮炎', '切', '2018-05-14 10:25:26', null, null);
INSERT INTO `diagnose` VALUES ('2019', '7246', '肚子疼', '无', '', '', '氨气意外中毒,氨气意外中毒,氨气意外中毒', '', '2018-05-14 14:33:50', null, '回家休息两天');
INSERT INTO `diagnose` VALUES ('2020', '7246', '肚子疼', '无', '', '', '氨气意外中毒,氨气意外中毒,氨气意外中毒', '', '2018-05-14 14:33:51', null, '回家休息两天');
INSERT INTO `diagnose` VALUES ('2021', '7246', '肚子疼', '无', '', '', '氨气意外中毒,氨气意外中毒,氨气意外中毒', '', '2018-05-14 15:17:37', null, '回家休息两天');
INSERT INTO `diagnose` VALUES ('2022', '7259', '额去热', ' 确认去去', '', '', '虫积化疳证,,额顶叶恶性肿瘤', '', '2018-05-14 15:37:05', null, '请问去');
INSERT INTO `diagnose` VALUES ('2023', '7246', '肚子疼', '无', '', '', '氨气意外中毒氨气意外中毒氨气意外中毒', '', '2018-05-14 15:37:27', null, '回家休息两天');
INSERT INTO `diagnose` VALUES ('2024', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:15', null, '1');
INSERT INTO `diagnose` VALUES ('2025', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:37', null, '1');
INSERT INTO `diagnose` VALUES ('2026', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:37', null, '1');
INSERT INTO `diagnose` VALUES ('2027', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:37', null, '1');
INSERT INTO `diagnose` VALUES ('2028', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:37', null, '1');
INSERT INTO `diagnose` VALUES ('2029', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:37', null, '1');
INSERT INTO `diagnose` VALUES ('2030', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:37', null, '1');
INSERT INTO `diagnose` VALUES ('2031', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2032', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2033', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2034', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2035', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2036', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2037', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2038', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2039', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2040', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2041', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2042', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2043', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:11:38', null, '1');
INSERT INTO `diagnose` VALUES ('2044', '7260', '1', '1', '', '', '大腿挤压伤,,', '', '2018-05-14 16:15:50', null, '1');
INSERT INTO `diagnose` VALUES ('2045', '7261', '1', '1', '', '', '鞍鼻,,', '', '2018-05-14 17:03:59', null, '1');
INSERT INTO `diagnose` VALUES ('2046', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-14 17:10:00', null, null);
INSERT INTO `diagnose` VALUES ('2047', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-14 17:26:05', null, null);
INSERT INTO `diagnose` VALUES ('2048', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-14 17:26:08', null, null);
INSERT INTO `diagnose` VALUES ('2049', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-14 17:26:11', null, null);
INSERT INTO `diagnose` VALUES ('2050', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-14 17:26:28', null, null);
INSERT INTO `diagnose` VALUES ('2051', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-14 17:27:48', null, null);
INSERT INTO `diagnose` VALUES ('2052', '7262', '1', '1', '', '', '鞍鼻,,', '', '2018-05-14 19:52:35', null, '1');
INSERT INTO `diagnose` VALUES ('2053', '7275', '住宿', '馅饼岁', '哮喘,心脏病,肺结核,颅脑手术', null, '诊断1', '无', '2018-05-15 11:01:28', null, null);
INSERT INTO `diagnose` VALUES ('2054', '7275', '住宿', '馅饼岁', '哮喘,心脏病,肺结核,颅脑手术', null, '诊断1', '无', '2018-05-15 11:01:38', null, null);
INSERT INTO `diagnose` VALUES ('2055', '7275', '住宿', '馅饼岁', '哮喘,心脏病,肺结核,颅脑手术', null, '诊断1', '无', '2018-05-15 11:01:43', null, null);
INSERT INTO `diagnose` VALUES ('2056', '7275', '住宿', '馅饼岁', '哮喘,心脏病,肺结核,颅脑手术', null, '诊断1', '无', '2018-05-15 11:02:30', null, null);
INSERT INTO `diagnose` VALUES ('2057', '7276', '12', '12', '', '', '感冒,,', '', '2018-05-15 11:34:27', null, '12');
INSERT INTO `diagnose` VALUES ('2058', '7276', '12', '12', '', '', '感冒,,', '', '2018-05-15 11:34:50', null, '12');
INSERT INTO `diagnose` VALUES ('2059', '7276', '12', '12', '', '', '感冒,,', '', '2018-05-15 11:39:54', null, '12');
INSERT INTO `diagnose` VALUES ('2060', '7280', '3514646q126', '123142413131 ', '', '', '虫扰魄门证,,', '', '2018-05-15 14:14:42', null, '154243512351');
INSERT INTO `diagnose` VALUES ('2061', '7276', '12', '12', '', '', '感冒,,', '', '2018-05-15 14:43:36', null, '12');
INSERT INTO `diagnose` VALUES ('2062', '7276', '4', '1', '无', null, '1', '无', '2018-05-15 15:19:47', null, null);
INSERT INTO `diagnose` VALUES ('2063', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 16:03:37', null, null);
INSERT INTO `diagnose` VALUES ('2064', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 16:03:44', null, null);
INSERT INTO `diagnose` VALUES ('2065', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 16:53:43', null, null);
INSERT INTO `diagnose` VALUES ('2066', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 16:53:54', null, null);
INSERT INTO `diagnose` VALUES ('2067', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 16:54:06', null, null);
INSERT INTO `diagnose` VALUES ('2068', '7299', '无', '无', '无', null, '头痛', '无', '2018-05-15 17:20:20', null, null);
INSERT INTO `diagnose` VALUES ('2069', '7276', '12', '12', '', '', '感冒,,', '', '2018-05-15 19:16:42', null, '12');
INSERT INTO `diagnose` VALUES ('2070', '7276', '12', '12', '', '', '感冒,,', '', '2018-05-15 19:18:18', null, '12');
INSERT INTO `diagnose` VALUES ('2071', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 19:53:16', null, null);
INSERT INTO `diagnose` VALUES ('2072', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 20:40:33', null, null);
INSERT INTO `diagnose` VALUES ('2073', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 20:40:40', null, null);
INSERT INTO `diagnose` VALUES ('2074', '7276', '1', '1', '无', null, '1', '无', '2018-05-15 20:40:44', null, null);
INSERT INTO `diagnose` VALUES ('2075', '7288', '哦你哦', '明年', '无', null, '曼氏血吸虫病', '没事', '2018-05-16 10:16:54', null, null);
INSERT INTO `diagnose` VALUES ('2076', '7288', '哦你哦', '明年', '无', null, '曼氏血吸虫病', '没事', '2018-05-16 10:17:12', null, null);
INSERT INTO `diagnose` VALUES ('2077', '7288', '1', '1', '无', null, '1个', '无', '2018-05-16 10:17:30', null, null);
INSERT INTO `diagnose` VALUES ('2078', '7299', '无', '无', '无', null, '头痛', '无', '2018-05-16 10:17:22', null, null);
INSERT INTO `diagnose` VALUES ('2079', '7288', '1', '1', '无', null, '1个', '无', '2018-05-16 10:18:02', null, null);
INSERT INTO `diagnose` VALUES ('2080', '7253', '无', '无', '无', null, '头痛', '无', '2018-05-16 10:18:56', null, null);
INSERT INTO `diagnose` VALUES ('2081', '7190', '无', '无', '无', null, '头痛', '无', '2018-05-16 10:20:28', null, null);
INSERT INTO `diagnose` VALUES ('2082', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-16 10:20:48', null, null);
INSERT INTO `diagnose` VALUES ('2083', '7288', '1', '1', '无', null, '1个', '无', '2018-05-16 10:30:43', null, null);
INSERT INTO `diagnose` VALUES ('2084', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:32:45', null, null);
INSERT INTO `diagnose` VALUES ('2085', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:33:01', null, null);
INSERT INTO `diagnose` VALUES ('2086', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:34:23', null, null);
INSERT INTO `diagnose` VALUES ('2087', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:40:55', null, null);
INSERT INTO `diagnose` VALUES ('2088', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:44:45', null, null);
INSERT INTO `diagnose` VALUES ('2089', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:45:13', null, null);
INSERT INTO `diagnose` VALUES ('2090', '7288', '1', '1', '无', null, '1', '无', '2018-05-16 10:47:21', null, null);
INSERT INTO `diagnose` VALUES ('2091', '7288', '55', '888', '无', null, '55', '无', '2018-05-16 11:41:53', null, null);
INSERT INTO `diagnose` VALUES ('2092', '7288', 'Bay', '\'ll', '无', null, '25', '55', '2018-05-16 11:45:26', null, null);
INSERT INTO `diagnose` VALUES ('2093', '7288', '住宿', '现病史', '无', null, '志贺菌病[Shigellosis]', '诊疗研究', '2018-05-16 11:52:33', null, null);
INSERT INTO `diagnose` VALUES ('2094', '7288', '住宿', '现病史', '无', null, '志贺菌病[Shigellosis]', '诊疗研究', '2018-05-16 11:55:00', null, null);
INSERT INTO `diagnose` VALUES ('2095', '7288', '主诉', '现病史', '无', null, '志贺菌病[Shigellosis]', '诊疗研究', '2018-05-16 13:53:41', null, null);
INSERT INTO `diagnose` VALUES ('2096', '7317', '9979', 'Why', '哮喘,心脏病,肺结核,颅脑手术', null, '99', '797', '2018-05-16 14:19:44', null, null);
INSERT INTO `diagnose` VALUES ('2097', '7317', '799', 'Why', '哮喘,心脏病,肺结核,颅脑手术', null, '499', '8', '2018-05-16 14:22:30', null, null);
INSERT INTO `diagnose` VALUES ('2098', '7317', '799', 'Why', '哮喘,心脏病,肺结核,颅脑手术', null, '499', '8', '2018-05-16 14:23:27', null, null);
INSERT INTO `diagnose` VALUES ('2099', '7317', '799', 'Why', '哮喘,心脏病,肺结核,颅脑手术', null, '499', '8', '2018-05-16 14:23:43', null, null);
INSERT INTO `diagnose` VALUES ('2100', '7317', '799', 'Why', '哮喘,心脏病,肺结核,颅脑手术', null, '499', '8', '2018-05-16 14:24:07', null, null);
INSERT INTO `diagnose` VALUES ('2101', '7317', '主诉', '现病史', '哮喘,心脏病,肺结核,颅脑手术', null, '志贺菌病[Shigellosis]', '哈哈', '2018-05-16 15:20:12', null, null);
INSERT INTO `diagnose` VALUES ('2102', '7318', '我是主诉', '我是现病史', '', '', '毒盛酿脓证,,', '', '2018-05-16 15:22:36', null, '我是处理');
INSERT INTO `diagnose` VALUES ('2103', '7318', '我是主诉', '我是现病史', '', '', '毒盛酿脓证,,', '', '2018-05-16 15:22:40', null, '我是处理');
INSERT INTO `diagnose` VALUES ('2104', '7317', '主', '现', '哮喘,心脏病,肺结核,颅脑手术', null, '中毒性痢疾', '主', '2018-05-16 15:23:08', null, null);
INSERT INTO `diagnose` VALUES ('2105', '7321', '464646468468798764', '65464684949', '', '', '毒盛肉腐证,,', '546546846841', '2018-05-16 15:30:14', null, '我是处理知道不');
INSERT INTO `diagnose` VALUES ('2106', '7319', '主', '现病史', '哮喘,心脏病,肺结核,颅脑手术', null, '志贺菌病[Shigellosis]', '主', '2018-05-16 15:35:25', null, null);
INSERT INTO `diagnose` VALUES ('2107', '7322', '我是主诉啊啊啊', '我是现病史啊啊啊', '', '', '虫寄皮下证,,', '', '2018-05-16 15:42:02', null, '我是处理啊啊啊');
INSERT INTO `diagnose` VALUES ('2108', '7323', '1', '1', '无', null, '1', '无', '2018-05-16 16:11:18', null, null);
INSERT INTO `diagnose` VALUES ('2109', '7323', '1', '1', '无', null, '1', '无', '2018-05-16 16:15:05', null, null);
INSERT INTO `diagnose` VALUES ('2110', '7323', '1', '1', '无', null, '1', '无', '2018-05-16 16:21:49', null, null);
INSERT INTO `diagnose` VALUES ('2111', '7323', '8968', '95', '无', null, '97', '7', '2018-05-16 16:35:48', null, null);
INSERT INTO `diagnose` VALUES ('2112', '7323', 'K', 'T', '无', null, '空洞型肺结核', 'J', '2018-05-16 16:39:29', null, null);
INSERT INTO `diagnose` VALUES ('2113', '7323', 'K', 'T', '无', null, '空洞型肺结核', 'J', '2018-05-16 16:39:44', null, null);
INSERT INTO `diagnose` VALUES ('2114', '7323', 'K', 'T', '无', null, '空洞型肺结核', 'J', '2018-05-16 16:40:36', null, null);
INSERT INTO `diagnose` VALUES ('2115', '7325', '1', '1', '', '', '鞍鼻,,', '', '2018-05-16 16:56:32', null, '1');
INSERT INTO `diagnose` VALUES ('2116', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:03:20', null, null);
INSERT INTO `diagnose` VALUES ('2117', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:15:55', null, null);
INSERT INTO `diagnose` VALUES ('2118', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:16:35', null, null);
INSERT INTO `diagnose` VALUES ('2119', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:16:51', null, null);
INSERT INTO `diagnose` VALUES ('2120', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:16:56', null, null);
INSERT INTO `diagnose` VALUES ('2121', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:21:01', null, null);
INSERT INTO `diagnose` VALUES ('2122', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 17:23:27', null, null);
INSERT INTO `diagnose` VALUES ('2123', '7326', '1', '2', '无', null, '2', '无', '2018-05-16 17:39:00', null, null);
INSERT INTO `diagnose` VALUES ('2124', '7326', '3', '3', '无', null, '2', '无', '2018-05-16 17:40:42', null, null);
INSERT INTO `diagnose` VALUES ('2125', '7326', '2', '#', '无', null, '\'', '\'%', '2018-05-16 17:47:25', null, null);
INSERT INTO `diagnose` VALUES ('2126', '7326', '2', '3', '无', null, '33', '无', '2018-05-16 17:49:27', null, null);
INSERT INTO `diagnose` VALUES ('2127', '7326', '4', '5', '无', null, '4', '无', '2018-05-16 17:54:49', null, null);
INSERT INTO `diagnose` VALUES ('2128', '7326', '4', '5', '无', null, '4', '无', '2018-05-16 17:54:57', null, null);
INSERT INTO `diagnose` VALUES ('2129', '7326', '4', '5', '无', null, '4', '无', '2018-05-16 17:58:24', null, null);
INSERT INTO `diagnose` VALUES ('2130', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 18:05:38', null, null);
INSERT INTO `diagnose` VALUES ('2131', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 18:06:04', null, null);
INSERT INTO `diagnose` VALUES ('2132', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 18:06:13', null, null);
INSERT INTO `diagnose` VALUES ('2133', '7326', '1', '1', '无', null, '1', '无', '2018-05-16 18:06:34', null, null);
INSERT INTO `diagnose` VALUES ('2134', '7326', '3', '3', '无', null, '#', '无', '2018-05-16 18:13:25', null, null);
INSERT INTO `diagnose` VALUES ('2135', '7326', '1', '2', '无', null, '3', '无', '2018-05-16 18:24:47', null, null);
INSERT INTO `diagnose` VALUES ('2136', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-17 09:48:10', null, null);
INSERT INTO `diagnose` VALUES ('2137', '7189', '无', '无', '无', null, '头痛', '无', '2018-05-17 10:04:39', null, null);
INSERT INTO `diagnose` VALUES ('2138', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 10:30:06', null, null);
INSERT INTO `diagnose` VALUES ('2139', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 10:30:19', null, null);
INSERT INTO `diagnose` VALUES ('2140', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 10:35:23', null, null);
INSERT INTO `diagnose` VALUES ('2141', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 10:35:30', null, null);
INSERT INTO `diagnose` VALUES ('2142', '7328', '请问请问', '是对方', '', '', '虫结证,,', '123', '2018-05-17 10:47:22', null, '飞啊啊飞');
INSERT INTO `diagnose` VALUES ('2143', '7329', '飞师傅撒', '额风格是好', '', '', '虫寄皮下证,,', '', '2018-05-17 10:51:33', null, '熬过   DF DF ');
INSERT INTO `diagnose` VALUES ('2144', '7330', '35f6a1g651654个6', 'a4f51eg6546g4651 ', '', '', '毒蕴溃烂证,,', '', '2018-05-17 10:53:42', null, '5a65g6a4g6a1f5464');
INSERT INTO `diagnose` VALUES ('2145', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 10:59:46', null, null);
INSERT INTO `diagnose` VALUES ('2146', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 11:08:01', null, null);
INSERT INTO `diagnose` VALUES ('2147', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 11:15:04', null, null);
INSERT INTO `diagnose` VALUES ('2148', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 11:33:47', null, null);
INSERT INTO `diagnose` VALUES ('2149', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 11:38:42', null, null);
INSERT INTO `diagnose` VALUES ('2150', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 11:41:03', null, null);
INSERT INTO `diagnose` VALUES ('2151', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 11:42:34', null, null);
INSERT INTO `diagnose` VALUES ('2152', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:17:47', null, null);
INSERT INTO `diagnose` VALUES ('2153', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:44:16', null, null);
INSERT INTO `diagnose` VALUES ('2154', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:44:25', null, null);
INSERT INTO `diagnose` VALUES ('2155', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:47:23', null, null);
INSERT INTO `diagnose` VALUES ('2156', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:51:42', null, null);
INSERT INTO `diagnose` VALUES ('2157', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:55:24', null, null);
INSERT INTO `diagnose` VALUES ('2158', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 15:56:21', null, null);
INSERT INTO `diagnose` VALUES ('2159', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 16:18:52', null, null);
INSERT INTO `diagnose` VALUES ('2160', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 16:36:43', null, null);
INSERT INTO `diagnose` VALUES ('2161', '7327', '1', '1', '无', null, '1', '无', '2018-05-17 17:06:51', null, null);
INSERT INTO `diagnose` VALUES ('2162', '7346', '2', '6', '无', null, '1', '无', '2018-05-18 17:25:09', null, null);
INSERT INTO `diagnose` VALUES ('2163', '7346', '2', '6', '无', null, '1', '无', '2018-05-18 17:25:19', null, null);
INSERT INTO `diagnose` VALUES ('2164', '7346', '2', '6', '无', null, '1', '无', '2018-05-18 17:25:23', null, null);
INSERT INTO `diagnose` VALUES ('2165', '7349', '1', '1', '无', null, '1', '1', '2018-05-21 10:04:25', null, null);
INSERT INTO `diagnose` VALUES ('2166', '7349', '1', '1', '无', null, '1', '1', '2018-05-21 10:04:34', null, null);
INSERT INTO `diagnose` VALUES ('2167', '7349', '1', '1', '无', null, '1', '1', '2018-05-21 10:06:15', null, null);
INSERT INTO `diagnose` VALUES ('2168', '7349', '1', '1', '无', null, '1', '1', '2018-05-21 10:06:21', null, null);
INSERT INTO `diagnose` VALUES ('2169', '7349', '1', '1', '无', null, '1', '无', '2018-05-21 10:08:43', null, null);
INSERT INTO `diagnose` VALUES ('2170', '7349', '.', '@', '无', null, '3', '无', '2018-05-21 10:28:29', null, null);
INSERT INTO `diagnose` VALUES ('2171', '7350', '1', '1', '无', null, '1', '无', '2018-05-21 11:10:50', null, null);
INSERT INTO `diagnose` VALUES ('2172', '7350', '2', '2', '无', null, '2', '无', '2018-05-21 11:31:43', null, null);
INSERT INTO `diagnose` VALUES ('2173', '7350', '2', '2', '无', null, '2', '无', '2018-05-21 11:36:39', null, null);
INSERT INTO `diagnose` VALUES ('2174', '7350', '1', '2', '无', null, '2', '无', '2018-05-21 11:45:52', null, null);
INSERT INTO `diagnose` VALUES ('2175', '7351', '1', '4', '无', null, '7', '无', '2018-05-21 13:58:41', null, null);
INSERT INTO `diagnose` VALUES ('2176', '7351', '3', '3', '无', null, '3', '3', '2018-05-21 14:11:22', null, null);
INSERT INTO `diagnose` VALUES ('2177', '7351', '.', 'gig', '无', null, '585', '无', '2018-05-21 14:17:46', null, null);
INSERT INTO `diagnose` VALUES ('2178', '7351', '2', '2', '无', null, '2', '无', '2018-05-21 14:27:36', null, null);
INSERT INTO `diagnose` VALUES ('2179', '7351', '2', '2', '无', null, '2', '无', '2018-05-21 14:27:43', null, null);
INSERT INTO `diagnose` VALUES ('2180', '7351', '2', '2', '无', null, '2', '无', '2018-05-21 14:28:56', null, null);
INSERT INTO `diagnose` VALUES ('2181', '7351', '2', '2', '无', null, '2', '无', '2018-05-21 14:34:42', null, null);
INSERT INTO `diagnose` VALUES ('2182', '7351', '2', '2', '无', null, '2', '无', '2018-05-21 14:34:51', null, null);
INSERT INTO `diagnose` VALUES ('2183', '7359', '2', '2', '无', null, '2', '无', '2018-05-21 15:27:47', null, null);
INSERT INTO `diagnose` VALUES ('2184', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 15:38:20', null, null);
INSERT INTO `diagnose` VALUES ('2185', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 15:38:32', null, null);
INSERT INTO `diagnose` VALUES ('2186', '7359', '感冒', '无', '无', null, '干酪性鼻窦炎', '无', '2018-05-21 15:44:07', null, null);
INSERT INTO `diagnose` VALUES ('2187', '7359', '感冒', '无', '无', null, '干酪性鼻窦炎', '无', '2018-05-21 15:44:49', null, null);
INSERT INTO `diagnose` VALUES ('2188', '7359', '2', '2', '无', null, '2', '无', '2018-05-21 15:49:39', null, null);
INSERT INTO `diagnose` VALUES ('2189', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 15:58:00', null, null);
INSERT INTO `diagnose` VALUES ('2190', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 16:00:58', null, null);
INSERT INTO `diagnose` VALUES ('2191', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 16:05:15', null, null);
INSERT INTO `diagnose` VALUES ('2192', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 16:05:23', null, null);
INSERT INTO `diagnose` VALUES ('2193', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 16:30:26', null, null);
INSERT INTO `diagnose` VALUES ('2194', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 16:31:18', null, null);
INSERT INTO `diagnose` VALUES ('2195', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 16:49:00', null, null);
INSERT INTO `diagnose` VALUES ('2196', '7359', '1', '1', '无', null, '1', '无', '2018-05-21 17:09:11', null, null);
INSERT INTO `diagnose` VALUES ('2197', '7360', '感冒', '感冒', '无', null, '感冒', '无', '2018-05-21 17:11:19', null, null);
INSERT INTO `diagnose` VALUES ('2198', '7360', '感冒', '感冒', '无', null, '感冒', '无', '2018-05-21 17:16:28', null, null);
INSERT INTO `diagnose` VALUES ('2199', '7360', '感冒', '感冒', '无', null, '感冒', '无', '2018-05-21 17:23:39', null, null);
INSERT INTO `diagnose` VALUES ('2200', '7360', '主诉', '现病史', '无', null, '志贺菌病[Shigellosis]', '无', '2018-05-21 17:36:34', null, null);
INSERT INTO `diagnose` VALUES ('2201', '7365', '鹏飞气温', '王芙蓉区偶尔范围', '', '', '囊虫侵脑证,虫侵于脑证,', '阿斯顿发企鹅无法全额付', '2018-05-22 10:16:19', null, '违反倾盆分歧无法');
INSERT INTO `diagnose` VALUES ('2202', '7371', '诶如果无人敢', '温柔且肥胖纹', '个人头给他人', '已退回如图黄', '毒证,,', '', '2018-05-22 11:32:10', null, '个人外国人');
INSERT INTO `diagnose` VALUES ('2203', '7366', '啦啦啦哈哈哈', '你你你我我我', '', '', '虫侵于脑证,虫结证,', '', '2018-05-22 13:58:37', null, '什么什么什么');
INSERT INTO `diagnose` VALUES ('2204', '7374', '主诉', '现病史', '哮喘,心脏病,肺结核,颅脑手术', null, '志贺菌病[Shigellosis]', '无', '2018-05-23 09:21:09', null, null);
INSERT INTO `diagnose` VALUES ('2205', '7410', '1', '1', '高尿酸血症,脑卒中', null, '1', '1', '2018-05-28 18:18:30', null, null);
INSERT INTO `diagnose` VALUES ('2206', '7410', '1', '1', '高尿酸血症,脑卒中', null, '1', '1', '2018-05-28 18:18:42', null, null);
INSERT INTO `diagnose` VALUES ('2207', '7410', '1', '1', '高尿酸血症,脑卒中', null, '1', '无', '2018-05-28 18:24:17', null, null);
INSERT INTO `diagnose` VALUES ('2208', '7410', '1', '1', '高尿酸血症,脑卒中', null, '1', '无', '2018-05-28 18:26:08', null, null);
INSERT INTO `diagnose` VALUES ('2209', '7410', '1', '1', '高尿酸血症,脑卒中', null, '1', '无', '2018-05-28 18:29:36', null, null);
INSERT INTO `diagnose` VALUES ('2210', '7410', '1', '1', '高尿酸血症,脑卒中', null, '1', '无', '2018-05-28 18:29:47', null, null);
INSERT INTO `diagnose` VALUES ('2211', '7418', '123', '1232345', '', '', '11－羟化酶缺陷                    ', '', '2018-05-29 11:15:52', null, '4575468');
INSERT INTO `diagnose` VALUES ('2212', '7420', '123', '请问', '', '', '17－羟化酶缺陷                    ', '', '2018-05-29 14:17:04', null, '绕弯儿');
INSERT INTO `diagnose` VALUES ('2213', '7415', '医院', '让我', '高尿酸血症,脑卒中', null, '热重于风证', '无', '2018-05-29 16:58:53', null, null);
INSERT INTO `diagnose` VALUES ('2214', '7415', '医院', '让我', '高尿酸血症,脑卒中', null, '热重于风证', '无', '2018-05-29 17:01:07', null, null);
INSERT INTO `diagnose` VALUES ('2215', '7423', '测试弹框', '弹两次', '无', null, '城市狂犬病', '无', '2018-05-29 19:46:57', null, null);
INSERT INTO `diagnose` VALUES ('2216', '7423', '测试弹框', '弹两次', '无', null, '城市狂犬病', '无', '2018-05-29 19:47:16', null, null);
INSERT INTO `diagnose` VALUES ('2217', '7423', '测试弹框', '玉', '无', null, '由于霍乱型霍乱弧菌引起的霍乱', '无', '2018-05-29 19:49:26', null, null);
INSERT INTO `diagnose` VALUES ('2218', '7423', '测试弹框', '无', '无', null, '空洞型肺结核', '无', '2018-05-29 19:56:00', null, null);
INSERT INTO `diagnose` VALUES ('2219', '7423', '测试', '玉', '无', null, '阿哥拉沙门氏菌肠炎', '无', '2018-05-29 19:58:29', null, null);
INSERT INTO `diagnose` VALUES ('2220', '7427', '1', '1', '', '', '17α-羟化酶缺陷症                 ', '', '2018-05-30 10:50:20', null, '1');
INSERT INTO `diagnose` VALUES ('2221', '7417', '人与人', '已', '哮喘,高脂血症,高尿酸血症,高血压,心脏病,糖尿病,脑卒中,肾炎,癫痫', null, '呼吸道结核病，经细菌学和组织学证实', '无', '2018-05-30 11:05:39', null, null);
INSERT INTO `diagnose` VALUES ('2222', '7428', '快乐', '快乐', '哮喘,心脏病,肺结核,颅脑手术', null, '奥罗普什病毒性疾病(Oropouche)', '无', '2018-05-30 11:10:30', null, null);
INSERT INTO `diagnose` VALUES ('2223', '7437', '阿斯顿发额发', '而过范围广', '既往史？？', '！！过敏史', '17－羟化酶缺陷                    18-三体综合症                     ', '', '2018-05-31 15:40:48', null, '热让他和认同和任务');
INSERT INTO `diagnose` VALUES ('2224', '7438', '微官网', '二爷人也容易挺容易', '', '', '1型糖尿病性缺血性心肌病           ', '', '2018-05-31 15:58:27', null, '人天原集团人已经');
INSERT INTO `diagnose` VALUES ('2225', '7442', '111111', '1111111111', '111111111', '11111111111111', '1型糖尿病伴并发症,,', '', '2018-06-01 14:14:47', null, '11111111111');
INSERT INTO `diagnose` VALUES ('2226', '7443', '11111', '1111111111', '11111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-01 14:27:42', null, '111111');
INSERT INTO `diagnose` VALUES ('2227', '7443', '11111', '1111111111', '11111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-01 14:27:43', null, '111111');
INSERT INTO `diagnose` VALUES ('2228', '7443', '11111', '1111111111', '11111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-01 14:27:43', null, '111111');
INSERT INTO `diagnose` VALUES ('2229', '7443', '11111', '1111111111', '11111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-01 14:27:43', null, '111111');
INSERT INTO `diagnose` VALUES ('2230', '7444', '1111111111111', '11111111111', '111111111', '111111111', '1型糖尿病性周围神经病,,', '', '2018-06-01 14:42:40', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2231', '7444', '1111111111111', '11111111111', '111111111', '111111111', '1型糖尿病性周围神经病,,', '', '2018-06-01 14:56:02', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2232', '7446', '1111111', '11111111111', '11111111', '111111111', '1型糖尿病性酮症酸中毒,,', '', '2018-06-01 14:59:32', null, '11111111111');
INSERT INTO `diagnose` VALUES ('2233', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:48:23', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2234', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:49:23', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2235', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:52:43', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2236', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:54:44', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2237', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:54:46', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2238', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:55:05', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2239', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 11:59:49', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2240', '7457', 'awdawd', 'awdawda', 'adwd', 'awdwdawd', '鞍鼻,,', '', '2018-06-04 14:06:49', null, 'dadaadwawdawda');
INSERT INTO `diagnose` VALUES ('2241', '7461', 'adawdawdwa', 'dawdawdaw', 'wdawdawda', 'dawda', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-04 14:12:39', null, 'dwdawda');
INSERT INTO `diagnose` VALUES ('2242', '7461', 'adawdawdwa', 'dawdawdaw', 'wdawdawda', 'dawda', '埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-04 14:18:19', null, 'dwdawda');
INSERT INTO `diagnose` VALUES ('2243', '7462', 'dawdwa', 'dawdwada', '', '', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-04 14:25:18', null, 'dawdawda');
INSERT INTO `diagnose` VALUES ('2244', '7462', 'dawdwa', 'dawdwada', '', '', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-04 14:39:58', null, 'dawdawda');
INSERT INTO `diagnose` VALUES ('2245', '7463', 'awdawdawd', 'dawdawdaw', '', '', '埃波拉病毒病,,', '', '2018-06-04 14:45:21', null, 'awdawdawda');
INSERT INTO `diagnose` VALUES ('2246', '7463', 'awdawdawd', 'dawdawdaw', '', '', '埃波拉病毒病', '', '2018-06-04 14:45:56', null, 'awdawdawda');
INSERT INTO `diagnose` VALUES ('2247', '7464', '测试数据', '测试数据', '测试数据', '测试数据', '1型糖尿病伴神经并发症,,', '', '2018-06-04 14:55:30', null, '测试数据');
INSERT INTO `diagnose` VALUES ('2248', '7464', '测试数据', '测试数据', '测试数据', '测试数据', '1型糖尿病伴神经并发症', '', '2018-06-04 14:58:40', null, '测试数据');
INSERT INTO `diagnose` VALUES ('2249', '7465', '1111111111111', '1111111111', '1111111111', '111111111', '1型糖尿病性酮症酸中毒,,', '', '2018-06-04 15:04:47', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2250', '7468', '111111', '111111111', '11111111', '1111111', '1型糖尿病伴昏迷,,', '', '2018-06-04 15:08:53', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2251', '7468', '111111', '111111111', '11111111', '1111111', '1型糖尿病伴昏迷,,', '', '2018-06-04 15:32:20', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2252', '7470', '111111', '111111111', '1111111', '11111111', '1型糖尿病伴昏迷,,', '', '2018-06-04 15:33:10', null, '11111111');
INSERT INTO `diagnose` VALUES ('2253', '7471', '123', '2345', '', '', '17α-羟化酶缺陷症                 ,,', '', '2018-06-04 16:15:24', null, '34567');
INSERT INTO `diagnose` VALUES ('2254', '7473', '11111', '111111111', '1111111', '11111111', '1型糖尿病性乳酸酸中毒,,', '', '2018-06-04 16:39:39', null, '111111111');
INSERT INTO `diagnose` VALUES ('2255', '7476', '111111111', '1111111111', '111111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-04 17:12:55', null, '111111111');
INSERT INTO `diagnose` VALUES ('2256', '7477', '1111', '111111111', '111111111', '11111111111111111', '1型糖尿病性足病,,', '', '2018-06-04 17:48:50', null, '11111111111');
INSERT INTO `diagnose` VALUES ('2257', '7478', '111111', '111111111', '11111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-04 17:55:58', null, '11111111');
INSERT INTO `diagnose` VALUES ('2258', '7460', '111', '111', '', '', '鞍鼻,,', '111', '2018-06-05 09:20:04', null, '111');
INSERT INTO `diagnose` VALUES ('2259', '7484', '111111', '111111111', '1111111', '1111111111', '1型糖尿病性肾病,,', '', '2018-06-05 11:52:47', null, '11111111');
INSERT INTO `diagnose` VALUES ('2260', '7485', '111111111', '11111111111111111', '111111111', '111111111', '1型糖尿病性视网膜病变,,', '', '2018-06-05 13:54:55', null, '111111111');
INSERT INTO `diagnose` VALUES ('2261', '7486', '111111111', '111111111', '111111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-05 14:03:37', null, '11111111');
INSERT INTO `diagnose` VALUES ('2262', '7486', '111111111', '111111111', '111111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-05 14:15:48', null, '11111111');
INSERT INTO `diagnose` VALUES ('2263', '7486', '111111111', '111111111', '111111111', '111111111', '1型糖尿病性酮症,,', '', '2018-06-05 14:17:16', null, '11111111');
INSERT INTO `diagnose` VALUES ('2264', '7488', '1111', '111111111', '11111111', '1111111111111', '1型糖尿病伴神经并发症,,', '', '2018-06-05 14:34:25', null, '111111111111111111');
INSERT INTO `diagnose` VALUES ('2265', '7487', '但是无法饿啊', '上发起我发起未排', '', '', '47XXX染色体异常                   ', '', '2018-06-05 14:36:30', null, '服务器饿哦反文旁忍过去');
INSERT INTO `diagnose` VALUES ('2266', '7489', '1111111', '111111111', '11111111', '1111111111', '1型糖尿病性视网膜病变,,', '', '2018-06-05 14:50:45', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2267', '7490', '11111', '111111111', '111111111', '11111111', '1型糖尿病性酮症酸中毒,,', '', '2018-06-05 15:23:41', null, '111111111');
INSERT INTO `diagnose` VALUES ('2268', '7491', '1111111111', '111111111', '111111111', '111111111111', '1型糖尿病性视网膜病变,,', '', '2018-06-05 16:00:51', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2269', '7492', '111111', '111111111', '111111111111111', '11111111111111', '1型糖尿病伴神经并发症,,', '', '2018-06-05 16:50:22', null, '111111');
INSERT INTO `diagnose` VALUES ('2270', '7493', '头疼', '发烧', '无', null, '多喝热水', '无', '2018-06-06 13:48:45', null, null);
INSERT INTO `diagnose` VALUES ('2271', '7493', '头疼', '感冒', '无', null, '多喝热水', '无', '2018-06-06 13:53:32', null, null);
INSERT INTO `diagnose` VALUES ('2272', '7499', '呃哦哦IQ额高峰期工位机而格外高', '未付清违禁品如果', '', '', '1型糖尿病伴并发症,,', '', '2018-06-06 14:40:55', null, '发euro高危儿感情牌文峰区而过');
INSERT INTO `diagnose` VALUES ('2273', '7501', '少时诵诗书所所所所所所所', '啛啛喳喳错错错错错错错错错错', '啛啛喳喳错错错错错错错错', '啛啛喳喳错错错错错', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-06 15:53:39', null, '啛啛喳喳错错错错错错');
INSERT INTO `diagnose` VALUES ('2274', '7501', '少时诵诗书所所所所所所所', '啛啛喳喳错错错错错错错错错错', '啛啛喳喳错错错错错错错错', '啛啛喳喳错错错错错', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-06 15:54:21', null, '啛啛喳喳错错错错错错');
INSERT INTO `diagnose` VALUES ('2275', '7501', '少时诵诗书所所所所所所所', '啛啛喳喳错错错错错错错错错错', '啛啛喳喳错错错错错错错错', '啛啛喳喳错错错错错', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-06 15:54:21', null, '啛啛喳喳错错错错错错');
INSERT INTO `diagnose` VALUES ('2276', '7501', '少时诵诗书所所所所所所所', '啛啛喳喳错错错错错错错错错错', '啛啛喳喳错错错错错错错错', '啛啛喳喳错错错错错', '埃博拉病毒病(Ebola)(其他病毒性出,,', '', '2018-06-06 16:02:05', null, '啛啛喳喳错错错错错错');
INSERT INTO `diagnose` VALUES ('2277', '7497', '告诉对方', '个第三方', '告诉对方', '告诉对方', ',,', '', '2018-06-06 19:03:07', null, '告诉对方感受到分公司的');
INSERT INTO `diagnose` VALUES ('2278', '7504', '我是主诉', '我是现病史', '', '', '埃波拉病毒病,鞍鼻', '', '2018-06-06 19:49:16', null, '我是处理');
INSERT INTO `diagnose` VALUES ('2279', '7515', '2222', '2222', '', '', '埃波拉病毒病,埃波拉病毒病,埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-07 14:06:44', null, '333');
INSERT INTO `diagnose` VALUES ('2280', '7515', '2222', '2222', '', '', '埃波拉病毒病,埃波拉病毒病,埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-07 14:06:44', null, '333');
INSERT INTO `diagnose` VALUES ('2281', '7516', '对的', '对的', '', '', '埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-07 14:52:44', null, '对的');
INSERT INTO `diagnose` VALUES ('2282', '7516', '对的', '对的', '', '', '埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-07 14:52:44', null, '对的');
INSERT INTO `diagnose` VALUES ('2283', '7516', '对的', '对的', '', '', '埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-07 14:53:37', null, '对的');
INSERT INTO `diagnose` VALUES ('2284', '7524', '1', '1', '', '', '鞍鼻', '', '2018-06-07 15:03:57', null, '1');
INSERT INTO `diagnose` VALUES ('2285', '7524', '1', '1', '', '', '鞍鼻', '', '2018-06-07 15:04:55', null, '1');
INSERT INTO `diagnose` VALUES ('2286', '7525', '333', '333', '', '', '氨茶硷意外中毒,鞍部脑膜瘤,埃博拉病毒病(Ebola)(其他病毒性出', '3333', '2018-06-07 15:30:34', null, '333');
INSERT INTO `diagnose` VALUES ('2287', '7525', '333', '333', '', '', '氨茶硷意外中毒,鞍部脑膜瘤,埃博拉病毒病(Ebola)(其他病毒性出', '3333', '2018-06-07 15:42:21', null, '333');
INSERT INTO `diagnose` VALUES ('2288', '7532', '主诉主诉', '现病史现病史', '', '', '癌,埃波拉病毒病,鞍部脑膜瘤', '诊断建议', '2018-06-08 14:47:49', null, '处理处理厂');
INSERT INTO `diagnose` VALUES ('2289', '7566', 'a\'w\'da\'w\'d', 'a\'da\'w\'da\'w', '', '', '埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-08 17:23:17', null, 'a\'da\'w\'da\'w\'d');
INSERT INTO `diagnose` VALUES ('2290', '7568', '1', '1', '高尿酸血症,脑卒中', null, '1', '无', '2018-06-09 09:52:56', null, null);
INSERT INTO `diagnose` VALUES ('2291', '7568', '1', '1', '高尿酸血症,脑卒中', null, '3', '无', '2018-06-09 09:54:52', null, null);
INSERT INTO `diagnose` VALUES ('2292', '7568', '1', '2', '高尿酸血症,脑卒中', null, '3', '无', '2018-06-09 10:04:29', null, null);
INSERT INTO `diagnose` VALUES ('2293', '7570', '1', '1', '高尿酸血症,脑卒中', null, '3', '无', '2018-06-09 10:12:07', null, null);
INSERT INTO `diagnose` VALUES ('2294', '7579', '1', '1', '', '', '鞍鼻', '', '2018-06-09 11:06:45', null, '1');
INSERT INTO `diagnose` VALUES ('2295', '7587', 'dawd', 'da\'w\'da\'w\'da', 'a\'w\'da', 'w\'da\'w\'da', '鞍部脑膜瘤', '', '2018-06-09 16:43:31', null, 'dawd');
INSERT INTO `diagnose` VALUES ('2296', '7587', 'dawd', 'da\'w\'da\'w\'da', 'a\'w\'da', 'w\'da\'w\'da', '鞍部脑膜瘤', '', '2018-06-09 16:45:03', null, 'dawd');
INSERT INTO `diagnose` VALUES ('2297', '7579', '住宿', '现病史', '哮喘,心脏病,肺结核,颅脑手术', null, '中毒性痢疾', '真的', '2018-06-09 16:52:58', null, null);
INSERT INTO `diagnose` VALUES ('2298', '7592', 'a\'w\'da\'d', 'a\'w\'da\'w\'d', 'da\'w\'da', 'a\'w\'da\'w', '鞍鼻', '', '2018-06-09 16:53:38', null, 'dawd');
INSERT INTO `diagnose` VALUES ('2299', '7592', 'a\'w\'da\'d', 'a\'w\'da\'w\'d', 'da\'w\'da', 'a\'w\'da\'w', '鞍鼻', '', '2018-06-09 16:54:11', null, 'dawd');
INSERT INTO `diagnose` VALUES ('2300', '7592', 'a\'w\'da\'d', 'a\'w\'da\'w\'d', 'da\'w\'da', 'a\'w\'da\'w', '鞍鼻', '', '2018-06-09 16:54:51', null, 'dawd');
INSERT INTO `diagnose` VALUES ('2301', '7596', '2', '52', '', '', '埃博拉病毒病(Ebola)(其他病毒性出', '', '2018-06-09 17:11:47', null, '2');
INSERT INTO `diagnose` VALUES ('2302', '7629', '11', '1111', '11', '1', '鞍鼻', '', '2018-06-13 11:02:07', null, '11');
INSERT INTO `diagnose` VALUES ('2303', '7629', '11', '1111', '11', '1', '鞍鼻', '', '2018-06-13 11:06:10', null, '11');
INSERT INTO `diagnose` VALUES ('2304', '7629', '11', '1111', '11', '1', '鞍鼻', '', '2018-06-13 11:21:16', null, '11');
INSERT INTO `diagnose` VALUES ('2305', '7608', '阿达伟大', '阿瓦达伟大', '  问问', '啊d', '鞍鼻', '', '2018-06-13 11:46:25', null, ' 阿瓦达');
INSERT INTO `diagnose` VALUES ('2306', '7632', '啊啊啊', '阿达伟大', 'a\'da\'w', '啊定位', '鞍鼻', '', '2018-06-13 14:48:22', null, ' 阿瓦达');
INSERT INTO `diagnose` VALUES ('2307', '7680', '去', '兔兔', '哮喘,心脏病,肺结核,颅脑手术', null, '轮状病毒性肠炎', '图', '2018-06-14 16:15:04', null, null);
INSERT INTO `diagnose` VALUES ('2308', '7680', '去', '兔兔', '哮喘,心脏病,肺结核,颅脑手术', null, '轮状病毒性肠炎', '图', '2018-06-14 16:21:52', null, null);
INSERT INTO `diagnose` VALUES ('2309', '7681', '人与人', '还以为', '哮喘,心脏病,肺结核,颅脑手术', null, '其他特指的沙门氏菌感染', '去', '2018-06-14 16:30:02', null, null);
INSERT INTO `diagnose` VALUES ('2310', '7695', '主诉', '现病史', '既往史', '', 'ABO血型不配合性反应', '', '2018-06-15 12:39:28', null, '处理结果');
INSERT INTO `diagnose` VALUES ('2311', '7695', '主诉', '现病史', '既往史', '', 'ABO血型不配合性反应', '', '2018-06-15 12:41:34', null, '处理结果');
INSERT INTO `diagnose` VALUES ('2312', '7695', '主诉', '现病史', '既往史', '', 'ABO血型不配合性反应', '', '2018-06-15 13:03:58', null, '处理结果');
INSERT INTO `diagnose` VALUES ('2313', '7696', '12', '12', '', '', '癌', '', '2018-06-15 13:12:52', null, '12');
INSERT INTO `diagnose` VALUES ('2314', '7696', '12', '12', '', '', '癌', '', '2018-06-15 13:14:28', null, '12');
INSERT INTO `diagnose` VALUES ('2315', '7695', '主诉', '现病史', '既往史', '', 'ABO血型不配合性反应', '', '2018-06-15 13:15:35', null, '处理结果');
INSERT INTO `diagnose` VALUES ('2316', '7697', '主诉1', '现病史1', '', '', '奥斯科格综合征', '', '2018-06-15 13:28:24', null, '处理1');
INSERT INTO `diagnose` VALUES ('2317', '7698', '主诉', '现病史', '', '', '感冒', '', '2018-06-15 13:44:20', null, '处理');
INSERT INTO `diagnose` VALUES ('2318', '7700', '主诉', '现病史', '', '', '感冒', '', '2018-06-15 15:54:08', null, '处理111');
INSERT INTO `diagnose` VALUES ('2319', '7719', '11', '11', '', '', '毒滞肌肤证,,', '', '2018-06-19 15:52:57', null, '11');
INSERT INTO `diagnose` VALUES ('2320', '7745', '12332123', '123123123123', '', '', '1型糖尿病性周围循环并发症         ,,', '', '2018-06-21 13:50:57', null, '123123123123');
INSERT INTO `diagnose` VALUES ('2321', '7747', '啊啊士大夫', '曲儿乌尔过', '', '', '1型糖尿病伴昏迷                   ,,', '', '2018-06-21 14:08:01', null, '阿道夫啊如果');
INSERT INTO `diagnose` VALUES ('2322', '7748', '1245213451', '14512345', '', '', 'Ⅰ度子宫脱垂                      ', '', '2018-06-21 14:30:15', null, '25672472');
INSERT INTO `diagnose` VALUES ('2323', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:23', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2324', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:24', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2325', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:25', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2326', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:26', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2327', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:29', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2328', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:34', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2329', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:39', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2330', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:41', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2331', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:44', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2332', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:41:48', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2333', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:42:54', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2334', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:42:56', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2335', '7764', 'sdghgjh', 'zdbf', '', '', '虫侵于脑证,,', '', '2018-06-25 14:42:57', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2336', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:14', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2337', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:23', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2338', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:26', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2339', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:35', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2340', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:37', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2341', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:41', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2342', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:48', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2343', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:49', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2344', '7764', 'sdghgjh', 'zdbf', '', '', '虫积化疳证,,', '', '2018-06-25 14:44:51', null, '秩序册不那么，');
INSERT INTO `diagnose` VALUES ('2345', '7775', '大红大客户', '打断开连接了', '', '', '感冒', '刚好符合规范化', '2018-06-26 10:12:45', null, '水电费');
INSERT INTO `diagnose` VALUES ('2346', '7775', '大红大客户', '打断开连接了', '', '', '感冒', '刚好符合规范化', '2018-06-26 10:16:13', null, '水电费');
INSERT INTO `diagnose` VALUES ('2347', '7775', '大红大客户', '打断开连接了', '', '', '感冒', '刚好符合规范化', '2018-06-26 10:18:21', null, '水电费');
INSERT INTO `diagnose` VALUES ('2348', '7775', '大红大客户', '打断开连接了', '', '', '感冒', '刚好符合规范化', '2018-06-26 10:20:02', null, '水电费');
INSERT INTO `diagnose` VALUES ('2349', '7775', '大红大客户', '打断开连接了', '', '', '感冒', '刚好符合规范化', '2018-06-26 10:21:41', null, '水电费');
INSERT INTO `diagnose` VALUES ('2350', '7776', '但是非生产', '发生多次发生的', '', '', '感冒', '的冯绍峰', '2018-06-26 10:25:06', null, '色放身上的发生');
INSERT INTO `diagnose` VALUES ('2351', '7776', '但是非生产', '发生多次发生的', '', '', '感冒', '的冯绍峰', '2018-06-26 10:25:49', null, '色放身上的发生');
INSERT INTO `diagnose` VALUES ('2352', '7776', '但是非生产', '发生多次发生的', '', '', '感冒', '的冯绍峰', '2018-06-26 10:27:10', null, '色放身上的发生');
INSERT INTO `diagnose` VALUES ('2353', '7777', '为', '为', '', '', '胃肠道出血', '', '2018-06-26 10:44:20', null, '我');
INSERT INTO `diagnose` VALUES ('2354', '7777', '为', '为', '', '', '胃肠道出血', '', '2018-06-26 10:47:34', null, '我');
INSERT INTO `diagnose` VALUES ('2355', '7777', '为', '为', '', '', '胃肠道出血', '', '2018-06-26 10:47:51', null, '我');
INSERT INTO `diagnose` VALUES ('2356', '7779', '大大的', '的速度', '', '', '胃肠出血，未特指', '', '2018-06-26 11:04:47', null, '第三代');
INSERT INTO `diagnose` VALUES ('2357', '7783', '主诉', '现病史', '', '', '感冒', '', '2018-06-27 11:17:05', null, '处理');
INSERT INTO `diagnose` VALUES ('2358', '7785', '发烧，耳痛2周', '中耳炎', '', '', '中耳炎,感冒', '服药休息', '2018-06-27 15:04:31', null, '服药');
INSERT INTO `diagnose` VALUES ('2359', '7825', '11', '11', '', '', '囊虫侵脑证,,', '', '2018-07-04 10:02:49', null, '11');
INSERT INTO `diagnose` VALUES ('2360', '7825', '11', '11', '', '', '囊虫侵脑证,,', '', '2018-07-04 10:02:53', null, '11');
INSERT INTO `diagnose` VALUES ('2361', '7850', '1', '撒啊', '1', '1', '鞍鼻,埃波拉病毒病,鞍部脑膜瘤', '手术', '2018-07-06 09:44:24', null, '手术');
INSERT INTO `diagnose` VALUES ('2362', '7875', '11', '11', '无', null, '会聚性共同性斜视', '无', '2018-07-09 13:50:28', null, null);
INSERT INTO `diagnose` VALUES ('2363', '7875', '11', '11', '无', null, '会聚性共同性斜视', '无', '2018-07-09 13:51:01', null, null);
INSERT INTO `diagnose` VALUES ('2364', '7886', '啦啦啦', '啦啦啦', '脑卒中', null, '啦啦啦', '无', '2018-07-10 09:36:36', null, null);
INSERT INTO `diagnose` VALUES ('2365', '7991', '123', '123', '', '', '埃博拉病毒病,,', '', '2018-07-20 17:27:15', null, '123123');
INSERT INTO `diagnose` VALUES ('2366', '7991', '123', '123', '', '', '埃博拉病毒病,,', '', '2018-07-20 17:27:19', null, '123123');
INSERT INTO `diagnose` VALUES ('2367', '8000', '123', '123', '', '', '鞍鼻,,', '', '2018-07-23 19:43:31', null, '123');
INSERT INTO `diagnose` VALUES ('2368', '8002', '11111111111111', '1111111111', '111111111', '111111111111', '埃布斯坦异常,,', '', '2018-07-24 15:24:30', null, '11111111111111');
INSERT INTO `diagnose` VALUES ('2369', '8003', '11111111111', '1111', '111111111', '1111111111', 'ABO血型不合,,', '', '2018-07-25 09:36:34', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2370', '8010', '111111111', '1111111111', '11111111', '11111111', 'ABO血型不合,,', '', '2018-07-25 11:06:38', null, '11111111');
INSERT INTO `diagnose` VALUES ('2371', '8012', '1', '1', '', '', '癌病恐怖,,', '', '2018-07-25 11:09:52', null, '1');
INSERT INTO `diagnose` VALUES ('2372', '8016', '1', '1', '', '', '鞍鼻,,', '', '2018-07-25 13:48:39', null, '1');
INSERT INTO `diagnose` VALUES ('2373', '10002', '1', '1', '', '', '埃博拉病毒病,,', '', '2018-07-25 16:34:58', null, '1');
INSERT INTO `diagnose` VALUES ('2374', '10003', '2', '2', '', '', 'ABO血型不合,,', '', '2018-07-25 16:49:46', null, '2');
INSERT INTO `diagnose` VALUES ('2375', '10004', '1', '1', '', '', 'ABO血型不合,,', '', '2018-07-25 16:53:23', null, '1');
INSERT INTO `diagnose` VALUES ('2376', '10006', '1', '1', '', '', '癌病恐怖,,', '', '2018-07-26 09:35:57', null, '1');
INSERT INTO `diagnose` VALUES ('2377', '8014', '心脏疼', '好转', '无', null, '。。。', '好转', '2018-07-26 09:36:54', null, null);
INSERT INTO `diagnose` VALUES ('2378', '8014', '心脏疼', '好转', '无', null, '。。。', '好转', '2018-07-26 09:37:02', null, null);
INSERT INTO `diagnose` VALUES ('2379', '10007', '2', '2', '', '', '癌病恐怖,,', '', '2018-07-26 09:48:00', null, '2');
INSERT INTO `diagnose` VALUES ('2380', '10016', '1', '1', '', '', '鞍鼻,,', '', '2018-07-26 13:42:59', null, '1');
INSERT INTO `diagnose` VALUES ('2381', '10018', '1', '1', '', '', '鞍鼻,,', '', '2018-07-26 14:24:36', null, '1');
INSERT INTO `diagnose` VALUES ('2382', '10019', '123123', '12312312', '', '', '癌病恐怖,,', '', '2018-07-26 20:10:02', null, '1231231');
INSERT INTO `diagnose` VALUES ('2383', '10024', '大城市的', '发送', '', '', '感冒', '', '2018-07-30 10:02:50', null, '房地产v');
INSERT INTO `diagnose` VALUES ('2384', '10031', '11111111111111', '1111111111', '111111111111', '11111111', '肝硬化', '', '2018-07-30 14:58:53', null, '111111111');
INSERT INTO `diagnose` VALUES ('2385', '10034', '1111111', '111111111', '1111111', '1111111', '高血压病', '', '2018-07-30 15:49:43', null, '11111111');
INSERT INTO `diagnose` VALUES ('2386', '10036', '三大城市的', '的生产者下', '', '', '头昏、头晕', '', '2018-07-30 16:10:21', null, '第三层市中心');
INSERT INTO `diagnose` VALUES ('2387', '10038', '地方', '但是', '', '', '慢性胃炎', '', '2018-07-30 16:38:21', null, ' 的');
INSERT INTO `diagnose` VALUES ('2388', '10044', '11111111', '111111111', '111111111', '1111111', '1型糖尿病伴昏迷,,', '', '2018-07-31 09:30:18', null, '111111111');
INSERT INTO `diagnose` VALUES ('2389', '10045', '主诉', '现病史', '哮喘,心脏病,肺结核,颅脑手术', null, '中毒性休克综合征', '无', '2018-07-31 09:48:58', null, null);
INSERT INTO `diagnose` VALUES ('2390', '10045', '主诉', '现病史', '哮喘,心脏病,肺结核,颅脑手术', null, '中毒性休克综合征', '无', '2018-07-31 09:50:33', null, null);
INSERT INTO `diagnose` VALUES ('2391', '10027', '的', '发', '', '', '氨茶碱意外中毒', '', '2018-07-31 16:12:55', null, '发');
INSERT INTO `diagnose` VALUES ('2392', '10027', '的', '发', '', '', '埃波拉病毒病', '', '2018-07-31 16:14:18', null, '发');
INSERT INTO `diagnose` VALUES ('2393', '10053', '1111111', '11111111', '11111111', '11111111', '1型糖尿病,,', '', '2018-08-01 09:37:13', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2394', '10057', '1421543', '3142154', '', '', 'ABO血型不合,,', '', '2018-08-01 10:40:07', null, '41541254');
INSERT INTO `diagnose` VALUES ('2395', '10057', '1421543', '3142154', '', '', 'ABO血型不合,,', '', '2018-08-01 10:40:08', null, '41541254');
INSERT INTO `diagnose` VALUES ('2396', '10065', '123123', '123123', '', '', '癌病恐怖,,', '', '2018-08-06 10:07:37', null, '123123');
INSERT INTO `diagnose` VALUES ('2397', '10097', '11111111', '11111111', '11111111', '11111111', '1型糖尿病性酮症,,', '', '2018-08-08 15:56:24', null, '11111111');
INSERT INTO `diagnose` VALUES ('2398', '10097', '11111111', '11111111', '11111111', '11111111', '1型糖尿病性酮症,,', '', '2018-08-08 15:56:38', null, '11111111');
INSERT INTO `diagnose` VALUES ('2399', '10097', '11111111', '11111111', '11111111', '11111111', '1型糖尿病性酮症,,', '', '2018-08-08 15:56:39', null, '11111111');
INSERT INTO `diagnose` VALUES ('2400', '10098', '好好好', '就解决', '', '', '1型病伴有生长发育障碍,,', '', '2018-08-08 16:07:19', null, '快快快');
INSERT INTO `diagnose` VALUES ('2401', '10098', '好好好', '就解决', '', '', '1型病伴有生长发育障碍,,', '', '2018-08-08 16:12:16', null, '快快快');
INSERT INTO `diagnose` VALUES ('2402', '10099', '1111111', '11111111', '11111111', '1111111', '1型糖尿病伴昏迷,,', '', '2018-08-08 16:18:58', null, '111111111');
INSERT INTO `diagnose` VALUES ('2403', '10100', '1111111', '11111111111', '111111111111111', '11111111', '1型糖尿病,,', '', '2018-08-08 16:25:41', null, '1111111');
INSERT INTO `diagnose` VALUES ('2404', '10101', '1111111', '11111111', '11111111', '1111111', '1型糖尿病伴多并发症,,', '', '2018-08-08 16:28:25', null, '11111111');
INSERT INTO `diagnose` VALUES ('2405', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 14:06:05', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2406', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 14:36:47', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2407', '10121', null, null, null, null, '暂无诊断信息', '无', '2018-08-09 14:56:03', null, null);
INSERT INTO `diagnose` VALUES ('2408', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:12:45', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2409', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:17:11', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2410', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:20:03', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2411', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:21:19', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2412', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:28:23', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2413', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:31:51', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2414', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:52:48', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2415', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:53:24', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2416', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:58:49', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2417', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 15:59:36', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2418', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 16:01:04', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2419', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 16:02:54', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2420', '10123', null, null, null, null, '暂无诊断信息', '无', '2018-08-09 16:05:55', null, null);
INSERT INTO `diagnose` VALUES ('2421', '10117', '111111', '111111111', '11111111', '111111111', '埃布斯坦异常,,', '', '2018-08-09 16:52:29', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2422', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:00:37', null, '11111111');
INSERT INTO `diagnose` VALUES ('2423', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:02:19', null, '11111111');
INSERT INTO `diagnose` VALUES ('2424', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:03:31', null, '11111111');
INSERT INTO `diagnose` VALUES ('2425', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:04:45', null, '11111111');
INSERT INTO `diagnose` VALUES ('2426', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:09:19', null, '11111111');
INSERT INTO `diagnose` VALUES ('2427', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:28:50', null, '11111111');
INSERT INTO `diagnose` VALUES ('2428', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:33:20', null, '11111111');
INSERT INTO `diagnose` VALUES ('2429', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:35:04', null, '11111111');
INSERT INTO `diagnose` VALUES ('2430', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:46:08', null, '11111111');
INSERT INTO `diagnose` VALUES ('2431', '10130', '1111111', '1111111111', '111111111', '111111111', 'ABO血型不合,,', '', '2018-08-09 17:53:59', null, '11111111');
INSERT INTO `diagnose` VALUES ('2432', '10121', null, null, null, null, '暂无诊断信息', '无', '2018-08-10 15:12:56', null, null);
INSERT INTO `diagnose` VALUES ('2433', '10169', null, null, null, null, '暂无诊断信息', '无', '2018-08-10 15:20:34', null, null);
INSERT INTO `diagnose` VALUES ('2434', '10227', '12', '3123', '', '', '鞍鼻,,', '', '2018-08-13 09:50:20', null, '123');
INSERT INTO `diagnose` VALUES ('2435', '10339', '123', '123', '', '', '癌病恐怖,,', '', '2018-08-15 11:24:46', null, '123123');
INSERT INTO `diagnose` VALUES ('2436', '10362', '测试', '测试', '', '', '埃布斯坦异常,,', '', '2018-08-16 11:56:18', null, '测试');
INSERT INTO `diagnose` VALUES ('2437', '10362', '测试', '测试', '', '', '埃布斯坦异常,,', '', '2018-08-16 11:56:22', null, '测试');
INSERT INTO `diagnose` VALUES ('2438', '10392', '三分热', '水电费', '', '', '病毒性胃肠炎,,', '', '2018-08-16 15:04:55', null, '的');
INSERT INTO `diagnose` VALUES ('2439', '10395', '1231232321', '12312', '', '', 'ABO血型不合,,', '', '2018-08-16 15:43:55', null, '我确定');
INSERT INTO `diagnose` VALUES ('2440', '10397', '测试一下', '11111111', '', '', '阿洪病,,', '', '2018-08-16 16:18:25', null, '111111');
INSERT INTO `diagnose` VALUES ('2441', '10401', 'wrdwd', 'dasdsadasdas', '', '', '癌,癌病恐怖,', '', '2018-08-17 09:26:16', null, 'qwedasdsadsa');
INSERT INTO `diagnose` VALUES ('2442', '10401', 'wrdwd', 'dasdsadasdas', '', '', '癌,癌病恐怖,', '', '2018-08-17 09:31:09', null, 'qwedasdsadsa');
INSERT INTO `diagnose` VALUES ('2443', '10402', '111111', '1111111111', '11111111', '1111111', 'ABO血型不配合性反应,,', '', '2018-08-17 10:47:22', null, '111111111');
INSERT INTO `diagnose` VALUES ('2444', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:12', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2445', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:21', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2446', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:21', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2447', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:22', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2448', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:22', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2449', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:23', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2450', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:26', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2451', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:28', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2452', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:29', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2453', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:29', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2454', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:30', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2455', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:30', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2456', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:33', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2457', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:56', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2458', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:12:57', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2459', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:03', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2460', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:04', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2461', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:04', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2462', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:09', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2463', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:10', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2464', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:11', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2465', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:11', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2466', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:16', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2467', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:17', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2468', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:18', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2469', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:18', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2470', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:19', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2471', '10403', '11111', '1111111111111111', '1111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 11:13:25', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2472', '10404', '323232', '3232323', '', '', '癌,,', '', '2018-08-17 11:42:00', null, '32322');
INSERT INTO `diagnose` VALUES ('2473', '10405', '11111111111111111', '11111', '111111111111', '1111111111', '癌,,', '', '2018-08-17 11:48:02', null, '111111111111');
INSERT INTO `diagnose` VALUES ('2474', '10406', '11111111111', '1111111111111', '111111111111', '111111111', '氨基酸代谢紊乱,,', '', '2018-08-17 13:34:41', null, '11111111111111');
INSERT INTO `diagnose` VALUES ('2475', '10407', 'ewew', 'wewe', '', '', '鞍鼻,,', '', '2018-08-17 13:44:57', null, '32e3245');
INSERT INTO `diagnose` VALUES ('2476', '10407', 'ewew', 'wewe', '', '', '鞍鼻,,', '', '2018-08-17 13:46:46', null, '32e3245');
INSERT INTO `diagnose` VALUES ('2477', '10408', '3232323', '232323232', '', '', '癌,,', '', '2018-08-17 13:49:56', null, 'sdsadsds');
INSERT INTO `diagnose` VALUES ('2478', '10408', '3232323', '232323232', '', '', '癌,,', '', '2018-08-17 13:58:37', null, 'sdsadsds');
INSERT INTO `diagnose` VALUES ('2479', '10408', '3232323', '232323232', '', '', '癌,,', '', '2018-08-17 14:05:03', null, 'sdsadsds');
INSERT INTO `diagnose` VALUES ('2480', '10408', '3232323', '232323232', '', '', '癌,,', '', '2018-08-17 14:07:34', null, 'sdsadsds');
INSERT INTO `diagnose` VALUES ('2481', '10409', '1', '11111111111111', '11111111111', '1111111111', 'ABO血型不配合性反应,,', '', '2018-08-17 14:15:17', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2482', '10409', '1', '11111111111111', '11111111111', '1111111111', 'ABO血型不配合性反应,,', '', '2018-08-17 14:15:55', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2483', '10409', '1', '11111111111111', '11111111111', '1111111111', 'ABO血型不配合性反应,,', '', '2018-08-17 14:15:57', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2484', '10409', '1', '11111111111111', '11111111111', '1111111111', 'ABO血型不配合性反应,,', '', '2018-08-17 14:16:19', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2485', '10409', '1', '11111111111111', '11111111111', '1111111111', 'ABO血型不配合性反应,,', '', '2018-08-17 14:16:19', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2486', '10409', '1', '11111111111111', '11111111111', '1111111111', 'ABO血型不配合性反应,,', '', '2018-08-17 14:16:56', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2487', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:20:48', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2488', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:30:27', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2489', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:12', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2490', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:37', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2491', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:38', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2492', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:38', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2493', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:38', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2494', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:38', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2495', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:38', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2496', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:41', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2497', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:42', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2498', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:43', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2499', '10410', 'sadasdsa', 'dsadsad', '', '', '癌,,', '', '2018-08-17 14:31:43', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2500', '10411', 'sdasdsa', 'dasdsads', '', '', '癌,,', '', '2018-08-17 14:36:52', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2501', '10411', 'sdasdsa', 'dasdsads', '', '', '癌,,', '', '2018-08-17 14:39:40', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2502', '10411', 'sdasdsa', 'dasdsads', '', '', '癌,,', '', '2018-08-17 14:40:05', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2503', '10411', 'sdasdsa', 'dasdsads', '', '', '癌,,', '', '2018-08-17 14:40:32', null, 'dsdsds');
INSERT INTO `diagnose` VALUES ('2504', '10412', '323124', '32432131', '', '', '癌,,', '', '2018-08-17 14:47:48', null, '32131232');
INSERT INTO `diagnose` VALUES ('2505', '10412', '323124', '32432131', '', '', '癌,,', '', '2018-08-17 14:51:18', null, '32131232');
INSERT INTO `diagnose` VALUES ('2506', '10413', '111111111111111', '11111111111', '11111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 14:55:22', null, '1111111111111111111');
INSERT INTO `diagnose` VALUES ('2507', '10413', '111111111111111', '11111111111', '11111111111111', '11111111111111', '癌病恐怖,,', '', '2018-08-17 14:57:13', null, '1111111111111111111');
INSERT INTO `diagnose` VALUES ('2508', '10414', '1111111111111', '1111111111111111', '', '1111111111111111', '阿洪病,,', '', '2018-08-17 15:00:36', null, '111111111111111');
INSERT INTO `diagnose` VALUES ('2509', '10415', '1111', '111111111111', '1111111111', '111111111', '埃博拉病毒病,,', '', '2018-08-17 15:06:11', null, '111111111');
INSERT INTO `diagnose` VALUES ('2510', '10417', '11111111111', '1', '1111111111', '11111111', '癌病恐怖,,', '', '2018-08-17 15:16:56', null, '111111111');
INSERT INTO `diagnose` VALUES ('2511', '10418', 'asfsdf', 'sdfdsf', '', '', '癌,,', '', '2018-08-17 15:35:20', null, 'afsdfdsf');
INSERT INTO `diagnose` VALUES ('2512', '10418', 'asfsdf', 'sdfdsf', '', '', '癌,,', '', '2018-08-17 15:40:19', null, 'afsdfdsf');
INSERT INTO `diagnose` VALUES ('2513', '10419', 'dsadasd', 'asddsad', '', '', 'ABO血型不合,,', '', '2018-08-17 15:44:56', null, 'dsdasds');
INSERT INTO `diagnose` VALUES ('2514', '10419', 'dsadasd', 'asddsad', '', '', 'ABO血型不合,,', '', '2018-08-17 15:56:01', null, 'dsdasds');
INSERT INTO `diagnose` VALUES ('2515', '10419', 'dsadasd', 'asddsad', '', '', 'ABO血型不合,,', '', '2018-08-17 15:56:48', null, 'dsdasds');
INSERT INTO `diagnose` VALUES ('2516', '10420', '11111', '111111111', '11111111111', '11111111', '阿尔茨海默病,外伤后阳痿,', '', '2018-08-17 16:02:34', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2517', '10420', '11111', '111111111', '11111111111', '11111111', '阿尔茨海默病,外伤后阳痿,', '', '2018-08-17 16:06:24', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2518', '10420', '11111', '111111111', '11111111111', '11111111', '阿尔茨海默病,外伤后阳痿,', '', '2018-08-17 16:06:52', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2519', '10420', '11111', '111111111', '11111111111', '11111111', '阿尔茨海默病,外伤后阳痿,', '', '2018-08-17 16:11:07', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2520', '10421', '导师是收到', '撒大苏打似的', '', '', '癌病恐怖,,', '', '2018-08-17 16:21:49', null, '收到是是d');
INSERT INTO `diagnose` VALUES ('2521', '10422', '我是主诉', '受伤性', '', '', '外伤后阳痿,,', '', '2018-08-17 16:37:08', null, '应急包扎注射药物');
INSERT INTO `diagnose` VALUES ('2522', '10423', 'adasfddsf', 'dsafsdafdsfds', '', '', '氨基酸代谢紊乱,,', '', '2018-08-17 17:00:43', null, 'fsdafsdfdsfsd');
INSERT INTO `diagnose` VALUES ('2523', '10423', 'adasfddsf', 'dsafsdafdsfds', '', '', '氨基酸代谢紊乱,,', '', '2018-08-17 17:00:47', null, 'fsdafsdfdsfsd');
INSERT INTO `diagnose` VALUES ('2524', '10424', '1111111111111111111111', '111111111111', '11111111', '1111111', '外伤后阳痿,,', '', '2018-08-17 17:01:55', null, '1111111111111111');
INSERT INTO `diagnose` VALUES ('2525', '10425', '1111', '111111111111', '11111111', '111111111', '外伤后阳痿,,', '', '2018-08-17 17:13:11', null, '11111111');
INSERT INTO `diagnose` VALUES ('2526', '10426', 'sadasdas', 'fddsfdsf', '', '', '癌，表现出胸腺样成分,,', '', '2018-08-17 17:18:25', null, 'dfsdfsdf');
INSERT INTO `diagnose` VALUES ('2527', '10427', 'dsfdsfdsf', 'dsafasdf', '', '', 'ABO血型不合,,', '', '2018-08-17 17:22:41', null, 'dsafdsf');
INSERT INTO `diagnose` VALUES ('2528', '10428', '1', '1111', '111111111', '11111111', '癌,,', '', '2018-08-17 17:47:33', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2529', '10433', '1111', '1111111111111', '11111111', '11111111', '食欲抑制剂中毒,,', '', '2018-08-20 10:21:44', null, '1111111111');
INSERT INTO `diagnose` VALUES ('2530', '10439', '23のの而非', '饿热风太过于', '', '', '鞍鼻,,', '', '2018-08-20 10:38:55', null, '热负荷');
INSERT INTO `diagnose` VALUES ('2531', '10441', '11111', '1111111111', '11111111', '1111111', '癌,,', '', '2018-08-20 10:50:55', null, '11111111111');
INSERT INTO `diagnose` VALUES ('2532', '10446', '1111', '111111111111', '11111111', '111111111', '癌病恐怖,,', '', '2018-08-20 11:43:11', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2533', '10446', '1111', '111111111111', '11111111', '111111111', '癌病恐怖,,', '', '2018-08-20 11:47:09', null, '1111111111111');
INSERT INTO `diagnose` VALUES ('2534', '10449', 'DFSDF', 'DSFDSFSDFDS', '', '', '感染性多器官功能障碍综合征(MODS),,', '', '2018-08-20 13:41:36', null, 'FSDFSDFSD');
INSERT INTO `diagnose` VALUES ('2535', '10450', '111111111', '111111111', '111111111', '111111', '足舟状骨骨折,,', '', '2018-08-20 13:46:39', null, '11111111111');
INSERT INTO `diagnose` VALUES ('2536', '10453', '112233', '1打包的', '', '', 'ABO血型不合,,', '', '2018-08-20 13:55:43', null, '111');
INSERT INTO `diagnose` VALUES ('2537', '10456', '1', '1111111', '11111111', '1111111', '癌，表现出胸腺样成分,,', '', '2018-08-20 14:11:29', null, '11111');
INSERT INTO `diagnose` VALUES ('2538', '10461', '测试', '而非', '', '', '埃布斯坦异常,,', '', '2018-08-20 14:42:15', null, '111');
INSERT INTO `diagnose` VALUES ('2539', '10459', '大苏打阿斯顿撒', '我去热情污染撒发生', '', '', '鞍鼻,,', '', '2018-08-20 14:52:52', null, '的撒大苏打撒');
INSERT INTO `diagnose` VALUES ('2540', '10464', '没啥', '没啥', '', '', '鞍鼻,鞍鼻,鞍部脑膜瘤', '', '2018-08-20 16:18:13', null, '笑一笑');
INSERT INTO `diagnose` VALUES ('2541', '10464', '没啥', '没啥', '', '', '鞍鼻,鞍鼻,鞍部脑膜瘤', '', '2018-08-20 16:18:23', null, '笑一笑');
INSERT INTO `diagnose` VALUES ('2542', '10464', '没啥', '没啥', '', '', '鞍鼻,鞍鼻,鞍部脑膜瘤', '', '2018-08-20 16:25:04', null, '笑一笑');
INSERT INTO `diagnose` VALUES ('2543', '10481', '请问偶就', '多拍hip', '', '', '感受性语言障碍,,', '', '2018-08-21 13:53:48', null, '对的');
INSERT INTO `diagnose` VALUES ('2544', '10482', '123', '1231', '', '', '癌病恐怖,,', '', '2018-08-21 14:11:09', null, '4124');
INSERT INTO `diagnose` VALUES ('2545', '10486', '11111111', '11111111111111', '11111111', '111111111', '鞍鼻,,', '', '2018-08-21 14:33:08', null, '111111111');
INSERT INTO `diagnose` VALUES ('2546', '10487', 'x\'c\'da\'sx\'c\'da\'s\'f', '宣传大使发生的阿斯顿a\'s', '', '', '埃博拉病毒病,,', '', '2018-08-21 14:37:34', null, 'sadasda');
INSERT INTO `diagnose` VALUES ('2547', '10472', '不舒服', '非常不不不对和谁聊呢', '', '', 'ABO血型不合的孕产妇治疗,ABO血型不配合性反应,艾勃斯坦畸形', '', '2018-08-21 14:42:55', null, '自己玩去吧');
INSERT INTO `diagnose` VALUES ('2548', '10472', '不舒服', '非常不不不对和谁聊呢', '', '', 'ABO血型不合的孕产妇治疗,ABO血型不配合性反应,艾勃斯坦畸形', '', '2018-08-21 14:43:01', null, '自己玩去吧');
INSERT INTO `diagnose` VALUES ('2549', '10491', '111', '11111111', '11111111', '1111111', '口面运动障碍,,', '', '2018-08-21 14:57:48', null, '111111111');
INSERT INTO `diagnose` VALUES ('2550', '10492', 'dsd', 'sdsd', '', '', '阿洪病,,', '', '2018-08-21 15:17:02', null, 'sdsd');
INSERT INTO `diagnose` VALUES ('2551', '10494', '111111111', '11111111', '111111111', '11111111', '癌病恐怖,,', '', '2018-08-21 16:35:23', null, '111111111');
INSERT INTO `diagnose` VALUES ('2552', '10494', '111111111', '11111111', '111111111', '11111111', '癌病恐怖,,', '', '2018-08-21 16:35:23', null, '111111111');
INSERT INTO `diagnose` VALUES ('2553', '10523', '111111', '2222222', '', '', '氨基酸代谢紊乱,,', '', '2018-08-22 09:25:10', null, '3333333');
INSERT INTO `diagnose` VALUES ('2554', '10524', '2未发放日', '而无法融入方', '', '', '埃博拉病毒病,,', '', '2018-08-22 10:29:42', null, '二锅头');
INSERT INTO `diagnose` VALUES ('2555', '10525', '112312321', '111111111', '1111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '11111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '癌,,', '', '2018-08-22 11:35:15', null, 'aaaaa');
INSERT INTO `diagnose` VALUES ('2556', '10526', '123', '123', '', '', '鞍鼻,,', '', '2018-08-22 13:36:33', null, '123');
INSERT INTO `diagnose` VALUES ('2557', '10527', '请问企鹅吧', '请问', '', '', '埃博拉病毒病,,', '', '2018-08-22 13:37:27', null, '请问');
INSERT INTO `diagnose` VALUES ('2558', '10528', '其二而', '1防风网', '', '', '氨基比林中毒,,', '', '2018-08-22 13:44:08', null, '2111');
INSERT INTO `diagnose` VALUES ('2559', '10529', 'dsds', 'sdsds', '', '', 'ABO血型不合,,', '', '2018-08-22 14:00:08', null, 'dssds');
INSERT INTO `diagnose` VALUES ('2560', '10531', '12222', '微软', '', '', '埃布斯坦异常,,', '', '2018-08-22 15:01:43', null, '水电费');
INSERT INTO `diagnose` VALUES ('2561', '10530', 'dsads', 'adasds', '', '', '癌病恐怖,,', '', '2018-08-22 15:02:09', null, 'sdsdsds');
INSERT INTO `diagnose` VALUES ('2562', '10534', '主诉11111', '现病史11111', '', '', '鞍鼻,,', '', '2018-08-23 10:06:54', null, '11111');

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
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '4', '1', '1', '普通医生1', '1234567890x', '13877777771', '医师-医师', '2', '吃饭', '1', '0', '3', '2018-11-20 10:52:48', '2018-11-20 10:52:46');
INSERT INTO `doctor` VALUES ('2', '5', '1', '2', '普通医生2', '12345678901', '13877777772', '医师-医师', '2', '骨科', '2', '0', '3', '2018-11-21 10:42:58', '2018-11-21 10:43:00');
INSERT INTO `doctor` VALUES ('3', '6', '1', '3', '专家1', '12345678902', '13877777773', '医师-主任医师', '2', '划水', '3', '0', '3', '2018-11-26 09:19:24', '2018-11-26 09:19:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor_department
-- ----------------------------
INSERT INTO `doctor_department` VALUES ('1', '1', '1', '0', '2018-11-20 10:54:07', '2018-11-20 10:54:10');
INSERT INTO `doctor_department` VALUES ('2', '2', '2', '0', '2018-12-14 17:18:49', '2018-12-14 17:18:52');
INSERT INTO `doctor_department` VALUES ('3', '3', '3', '0', '2018-12-14 17:19:10', '2018-12-14 17:19:12');
INSERT INTO `doctor_department` VALUES ('4', '2', '1', '0', '2018-12-24 14:11:32', '2018-12-24 14:11:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', 'ff74c676-984e-4c7c-972f-28b94a3be1bb', 'png', '诊室默认图片', 'department', null, null);
INSERT INTO `img` VALUES ('2', 'd2944b83-34ff-4d9d-be1e-4c342447879e', 'png', '医生默认图片', 'doctor', '2018-11-26 13:59:25', '2018-11-26 13:59:28');
INSERT INTO `img` VALUES ('3', '29482a15-ce92-4908-b22d-d505f2c707f1', 'jpg', '首页轮播图', 'index', '2018-12-06 10:09:35', '2018-12-06 10:09:37');
INSERT INTO `img` VALUES ('4', '00f22e4c-a0b6-454c-8514-e66a17c00c94', 'jpg', '首页轮播图', 'index', '2018-12-06 10:10:49', '2018-12-06 10:10:51');
INSERT INTO `img` VALUES ('5', '72d4f11d-44bc-4b1f-9bc0-4c80a68b3e49', 'jpg', '首页轮播图', 'index', '2018-12-06 10:11:18', '2018-12-06 10:11:21');
INSERT INTO `img` VALUES ('10', 'df1774de-0d1c-46cf-91b9-f2f9a546fc42', 'png', '网络诊室轮播图', 'netTreatmentRoom', '2018-12-07 16:00:17', '2018-12-07 16:00:19');
INSERT INTO `img` VALUES ('11', 'b7ae24dc-e0bb-4ffc-b66d-653af18dd6f2', 'png', '网络诊室轮播图', 'netTreatmentRoom', '2018-12-07 16:00:21', '2018-12-07 16:00:26');
INSERT INTO `img` VALUES ('19', '9e16bc55-ae51-4dff-b813-2c56dbcb364f', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 13:14:19', '2018-12-14 13:14:19');
INSERT INTO `img` VALUES ('20', 'a7e819d3-5820-4881-9082-f6e3fe15a93a', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 13:38:16', '2018-12-14 13:38:16');
INSERT INTO `img` VALUES ('21', '16c27965-5686-4dc3-b999-8a5877c88231', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 13:59:26', '2018-12-14 13:59:26');
INSERT INTO `img` VALUES ('22', '1d8e812b-f925-44dd-b307-726b4d25d222', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:00:36', '2018-12-14 14:00:36');
INSERT INTO `img` VALUES ('23', '0d9b6e48-f003-4c9c-9f0a-e4284188df9a', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:01:03', '2018-12-14 14:01:03');
INSERT INTO `img` VALUES ('24', 'b80c5f99-53e8-4f35-81fa-2c41d4838c40', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:04:38', '2018-12-14 14:04:38');
INSERT INTO `img` VALUES ('25', 'c0762899-8d45-4eb7-8a75-99b888d2c2f8', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:14:42', '2018-12-14 14:14:42');
INSERT INTO `img` VALUES ('26', 'c2b0aa63-9808-47ce-920d-7f58522f354b', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:16:48', '2018-12-14 14:16:48');
INSERT INTO `img` VALUES ('27', '1e977248-bc20-490e-8144-f5bc9aa3d6cd', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:17:04', '2018-12-14 14:17:04');
INSERT INTO `img` VALUES ('28', 'ba33abb3-ab86-42f4-a427-2b87e0b1678d', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:29:17', '2018-12-14 14:29:17');
INSERT INTO `img` VALUES ('29', '88660be6-6449-4fca-934e-43c52d6f13b2', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:29:41', '2018-12-14 14:29:41');
INSERT INTO `img` VALUES ('30', '39f0fee2-76ad-43b0-9a35-19847eae034f', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:30:20', '2018-12-14 14:30:20');
INSERT INTO `img` VALUES ('31', '7dcf1794-a693-46c3-9261-ca7ab5ffa96d', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:30:54', '2018-12-14 14:30:54');
INSERT INTO `img` VALUES ('32', 'a048ef22-7d81-4d28-a8ff-dd46fe573608', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:31:48', '2018-12-14 14:31:48');
INSERT INTO `img` VALUES ('33', 'd1c803d6-4d52-4b13-b692-55a0cc2a93de', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:31:51', '2018-12-14 14:31:51');
INSERT INTO `img` VALUES ('34', '724c599d-2599-4729-84f7-6178047b1588', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:32:04', '2018-12-14 14:32:04');
INSERT INTO `img` VALUES ('35', 'f034a474-a79e-4d61-b168-2365665e0e47', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:32:06', '2018-12-14 14:32:06');
INSERT INTO `img` VALUES ('40', 'cd12e09e-8acd-42e2-aa54-4a01f334e103', 'png', '就诊信息图片描述', 'userReservation', '2018-12-14 14:37:13', '2018-12-14 14:37:13');
INSERT INTO `img` VALUES ('42', '5620cff5-f7b3-4175-b1ff-cb419e692609', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:28:20', '2018-12-17 09:28:20');
INSERT INTO `img` VALUES ('43', '52819011-9840-47b2-810b-48f1c2202626', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:31:47', '2018-12-17 09:31:47');
INSERT INTO `img` VALUES ('44', 'ad33978b-0347-40c5-8ba3-73adb3559cd6', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:33:09', '2018-12-17 09:33:09');
INSERT INTO `img` VALUES ('45', '46ec3052-eef5-4746-a1b2-709c957f088d', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:33:27', '2018-12-17 09:33:27');
INSERT INTO `img` VALUES ('46', 'd0c0898c-690f-40e7-a821-1494d8efde44', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:34:27', '2018-12-17 09:34:27');
INSERT INTO `img` VALUES ('47', 'd2deea81-a5b2-48a0-9db0-c98521c6b02b', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:34:48', '2018-12-17 09:34:48');
INSERT INTO `img` VALUES ('48', '31d23d68-63ce-4abe-8a6b-1935c271ab50', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:35:45', '2018-12-17 09:35:45');
INSERT INTO `img` VALUES ('49', 'bc26027b-82be-448e-ba3f-3fc4ff946acf', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:36:24', '2018-12-17 09:36:24');
INSERT INTO `img` VALUES ('50', '21fe2fa8-46e4-4093-88af-57658d822e12', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:48:04', '2018-12-17 09:48:04');
INSERT INTO `img` VALUES ('51', 'e9981c55-1931-402b-ae76-78c6cafe4904', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:48:36', '2018-12-17 09:48:36');
INSERT INTO `img` VALUES ('52', 'ee535555-bf3e-4fef-bc9b-c8a1b4fbe36e', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:55:45', '2018-12-17 09:55:45');
INSERT INTO `img` VALUES ('53', '06a0b3ba-ec1e-4bb1-871d-0a2e25e825a3', 'png', '就诊信息图片描述', 'userReservation', '2018-12-17 09:56:00', '2018-12-17 09:56:00');
INSERT INTO `img` VALUES ('56', '5e3056d6-d38a-4615-a745-adffde0d6024', 'png', '就诊信息图片描述', 'userReservation', '2018-12-18 13:13:19', '2018-12-18 13:13:19');
INSERT INTO `img` VALUES ('58', 'db4eaca0-8826-4341-95ae-03ce86a952f4', 'png', '就诊信息图片描述', 'userReservation', '2018-12-18 15:13:41', '2018-12-18 15:13:41');
INSERT INTO `img` VALUES ('59', 'ec279981-601b-4faa-ae9b-78fd017e2db0', 'png', '就诊信息图片描述', 'userReservation', '2018-12-19 09:43:41', '2018-12-19 09:43:41');
INSERT INTO `img` VALUES ('60', '570d0e89-d3c4-4b81-b953-e2e65e9dc235', 'png', '就诊信息图片描述', 'userReservation', '2018-12-19 09:52:55', '2018-12-19 09:52:55');
INSERT INTO `img` VALUES ('61', '50abaf8c-d474-4e9c-8bf7-aa7a435d8808', 'png', '就诊信息图片描述', 'userReservation', '2018-12-20 09:20:03', '2018-12-20 09:20:03');
INSERT INTO `img` VALUES ('62', 'd2b7be7f-65d5-4160-b9e2-fcae93f02072', 'png', '就诊信息图片描述', 'userReservation', '2018-12-20 09:20:19', '2018-12-20 09:20:19');
INSERT INTO `img` VALUES ('63', 'a89722ac-a554-4e0b-b6bb-96e10c5fd7a6', 'jpg', '就诊信息图片描述', 'userReservation', '2018-12-20 09:39:30', '2018-12-20 09:39:30');
INSERT INTO `img` VALUES ('64', '4f0d0e40-d7d2-4bcd-9f16-4cf9ba30a3dc', 'jpg', '就诊信息图片描述', 'userReservation', '2018-12-20 09:39:32', '2018-12-20 09:39:32');
INSERT INTO `img` VALUES ('65', 'b8093194-a0ae-418a-995c-1bfb663eeb2e', 'png', '就诊信息图片描述', 'userReservation', '2018-12-20 09:39:39', '2018-12-20 09:39:39');
INSERT INTO `img` VALUES ('66', '4480fa4b-1881-4d29-86e2-030eb8ffad61', 'jpg', '就诊信息图片描述', 'userReservation', '2018-12-20 09:45:05', '2018-12-20 09:45:05');

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
-- Records of medical
-- ----------------------------

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
-- Records of medical_type
-- ----------------------------

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) DEFAULT NULL COMMENT '用户id',
  `type` varchar(10) DEFAULT NULL COMMENT '通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态',
  `content` varchar(255) DEFAULT NULL COMMENT '通知内容',
  `content_data` varchar(255) DEFAULT NULL COMMENT '通知数据，如排班消息的医生id，医院动态的地址等',
  `status` varchar(10) DEFAULT NULL COMMENT '状态0未查看。1已查看  ',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8088 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notify
-- ----------------------------

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
-- Records of order
-- ----------------------------

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
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES ('1', '未付款', '2018-11-19 16:55:09', '2018-11-19 16:55:12');
INSERT INTO `order_status` VALUES ('2', '已付款', '2018-11-19 16:55:21', '2018-11-19 16:55:17');
INSERT INTO `order_status` VALUES ('3', '申请退款中', '2018-11-19 16:55:26', '2018-11-19 16:55:23');
INSERT INTO `order_status` VALUES ('4', '已退款', '2018-11-19 16:55:31', '2018-11-19 16:55:29');
INSERT INTO `order_status` VALUES ('5', '拒绝退款', '2018-11-19 16:55:34', '2018-11-19 16:55:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('18', '9', '330124197511302447', '小红', '15748521452', '19751130', '0', '2018-12-14 16:41:09', '2018-12-14 16:41:09');

-- ----------------------------
-- Table structure for recipe
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of recipe
-- ----------------------------

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
-- Records of recipe_detail
-- ----------------------------

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of refund
-- ----------------------------

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
-- Records of refund_correlation
-- ----------------------------

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
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('301', '2414', '1', '心电图检查,心脏,动态血压(心电图检查)', '无', '无', '无', '2016-09-13 09:29:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('302', '2414', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2016-09-13 09:29:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('303', '2447', '1', '胸片', '无', '无', '无', '2016-10-12 09:41:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('304', '2447', '2', '血常规', '无', '无', '无', '2016-10-12 09:41:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('305', '2447', '1', '胸片', '无', '无', '无', '2016-10-12 09:44:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('306', '2447', '2', '血常规', '无', '无', '无', '2016-10-12 09:44:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('307', '2449', '1', '胸部CT', '无', '无', '无', '2016-10-12 13:09:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('308', '2449', '2', '血常规', '无', '无', '无', '2016-10-12 13:09:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('309', '2451', '1', '胸部CT', '无', '无', '无', '2016-10-12 16:18:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('310', '2451', '2', '血常规', '无', '无', '无', '2016-10-12 16:18:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('311', '2478', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC)', '无', '无', '无', '2016-10-15 19:55:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('312', '2483', '1', '心电图检查,心脏,动态心电图(心电图检查)', '无', '无', '无', '2016-10-17 09:50:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('313', '2483', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2016-10-17 09:50:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('314', '2499', '1', '心电图检查,心脏,动态血压(心电图检查)', '无', '无', '无', '2016-10-18 09:50:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('315', '2499', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2016-10-18 09:50:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('316', '2500', '1', 'CT检查,胸部,肺动脉CTA(CT检查)', '无', '无', '无', '2016-10-18 10:05:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('317', '2500', '2', '尿糖定量测定（门诊）（餐后1小时）', '无', '无', '无', '2016-10-18 10:05:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('318', '2537', '1', '心电图检查,心脏,动态血压(心电图检查)', '无', '无', '无', '2016-10-25 10:40:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('319', '2537', '2', '血小板计数', '无', '无', '无', '2016-10-25 10:40:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('320', '2536', '1', '超声检查,心脏,术中经食管超声心动图(超声检查)', '无', '无', '无', '2016-10-25 10:59:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('321', '2536', '1', 'MRI检查,颈部,MR喉部平扫+弥散（3.0T）(MRI检查)', '无', '无', '无', '2016-10-25 10:59:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('322', '2536', '2', '嗜酸细胞计数', '无', '无', '无', '2016-10-25 10:59:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('323', '2541', '1', '传染科超声检查,浅表,颈部淋巴结(传染科超声检查)', '无', '无', '无', '2016-10-25 14:30:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('324', '2541', '2', '异白镜检', '无', '无', '无', '2016-10-25 14:30:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('325', '2548', '1', '磁共振扫描(MRI),胸腔,普通透视', '无', '无', '无', '2016-10-26 10:57:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('326', '2548', '2', '血红蛋白', '无', '无', '无', '2016-10-26 10:57:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('327', '2549', '1', 'X线摄影,肝胆胰脾肾,普通透视', '无', '无', '无', '2016-10-26 11:07:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('328', '2549', '2', '血红蛋白', '无', '无', '无', '2016-10-26 11:07:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('329', '2548', '1', '磁共振扫描(MRI),胸腔,普通透视', '无', '无', '无', '2016-10-26 11:46:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('330', '2548', '2', '血红蛋白', '无', '无', '无', '2016-10-26 11:46:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('331', '2553', '1', '院外影像学会诊,肝胆胰脾肾,普通透视', '无', '无', '无', '2016-10-26 14:58:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('332', '2553', '2', '网织红计数', '无', '无', '无', '2016-10-26 14:58:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('333', '2554', '1', '脑部', '无', '无', '备注:无', '2016-10-26 15:41:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('334', '2562', '1', '脑部ct', '无', '无', '备注:无', '2016-11-02 09:23:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('335', '2576', '1', '1', '2016-11-03', '确实', '备注:刚刚', '2016-11-03 10:32:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('336', '2591', '1', '脑部CT', '2016-11-08', '门诊6楼', '备注:无', '2016-11-08 11:05:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('337', '2591', '2', '血常规', '2016-11-08', '门诊2楼', '备注:无', '2016-11-08 11:05:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('338', '2593', '1', 'X线造影,前列腺精囊腺尿道（TAS),床旁透视与术中透视', '无', '无', '无', '2016-11-09 14:41:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('339', '2593', '2', '嗜酸细胞计数', '无', '无', '无', '2016-11-09 14:41:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('340', '2595', '2', '网织红计数', '无', '无', '无', '2016-11-16 19:31:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('341', '2596', '1', 'B超', '无', '无', '无', '2016-11-17 14:17:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('342', '2596', '2', '尿检', '无', '无', '233', '2016-11-17 14:17:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('343', '2682', '1', 'B超', '无', '无', '啦啦啦啦啦啦啦', '2016-12-01 16:39:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('344', '2682', '2', '验血', '无', '无', '嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯', '2016-12-01 16:39:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('345', '2680', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2016-12-02 11:33:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('346', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 11:10:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('347', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 11:27:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('348', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 11:39:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('349', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 11:50:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('350', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 11:51:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('351', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 13:08:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('352', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-14 13:42:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('353', '2748', '2', '门诊尿常规(含比重)', '无', '无', '无', '2016-12-15 10:13:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('354', '2770', '2', '糖尿病自身抗体系列', '无', '无', '无', '2016-12-15 10:14:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('355', '2770', '2', '糖尿病自身抗体系列', '无', '无', '无', '2016-12-15 10:14:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('356', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2016-12-16 10:29:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('357', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2016-12-16 10:29:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('358', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2016-12-16 10:30:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('359', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2016-12-16 10:30:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('360', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2016-12-16 15:52:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('361', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2016-12-16 15:52:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('362', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2016-12-16 17:58:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('363', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2016-12-16 17:58:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('364', '2800', '2', '门诊血常规[五分类]', '无', '无', '无', '2016-12-16 19:03:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('365', '2800', '2', '门诊血常规[五分类]', '无', '无', '无', '2016-12-16 19:04:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('366', '2805', '2', '尿α1微量球蛋白测定', '无', '无', '无', '2016-12-16 23:54:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('367', '2805', '2', '尿α1微量球蛋白测定', '无', '无', '无', '2016-12-16 23:56:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('368', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2016-12-17 08:25:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('369', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2016-12-17 08:25:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('370', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2016-12-17 08:25:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('371', '2844', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2016-12-19 17:54:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('372', '2855', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2016-12-20 14:08:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('373', '2873', '1', '超声检查,肌骨,腕关节+脏器灰阶立体成像(超声检查)', '无', '无', '无', '2016-12-23 14:11:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('374', '2873', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）', '无', '无', '无', '2016-12-23 14:11:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('375', '2889', '1', 'CT检查,颈部,CT舌部平扫(CT检查)', '无', '无', '无', '2016-12-23 16:02:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('376', '2889', '2', '血细胞簇分化抗原CD3检测 (传研所)', '无', '无', '无', '2016-12-23 16:02:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('377', '2896', '1', 'CT检查,胸部,CT肺部HR平扫(CT检查)', '无', '无', '无', '2016-12-26 14:30:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('378', '2896', '2', '肿瘤细胞化疗药物敏感试验(多柔比星+多西他赛)(1/4PPC)', '无', '无', '无', '2016-12-26 14:30:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('379', '2899', '1', '心内科无创检查,心脏,平板运动试验(心内科无创检查)', '无', '无', '无', '2016-12-26 14:36:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('380', '2899', '2', '尿糖定量测定（门诊）（餐后2小时）', '无', '无', '无', '2016-12-26 14:36:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('381', '2901', '1', 'TCD,头部,颅内段血管彩色多普勒超声（单眼）(TCD)', '无', '无', '无', '2016-12-26 14:53:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('382', '2901', '2', '病理癌基因蛋白检测（Ki-67）', '无', '无', '无', '2016-12-26 14:53:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('383', '2920', '1', 'X线摄影,下肢,左髋关节正位(X线摄影)', '2016-12-28 13:20', '无', '无', '2016-12-27 10:58:05', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('384', '2920', '2', '脱氧核糖核酸(DNA)测序（IDH1/IDH2）（血）', '2016-12-29 17:35', '无', '无', '2016-12-27 10:58:05', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('385', '2896', '1', 'CT检查,胸部,CT肺部HR平扫(CT检查)', '无', '无', '无', '2016-12-27 11:02:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('386', '2896', '2', '肿瘤细胞化疗药物敏感试验(多柔比星+多西他赛)(1/4PPC)', '无', '无', '无', '2016-12-27 11:02:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('387', '2873', '1', '超声检查,肌骨,腕关节+脏器灰阶立体成像(超声检查)', '无', '无', '无', '2016-12-27 11:29:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('388', '2873', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）', '无', '无', '无', '2016-12-27 11:29:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('389', '2925', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2016-12-27 13:17:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('390', '2925', '2', '钠测定（急诊）（急诊中心）', '无', '无', '无', '2016-12-27 13:17:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('391', '2921', '1', '个体化用药基因检测,全身,DNA测序（ERCC1、ACTB(个体化用药基因检测)', '无', '无', '无', '2016-12-27 13:23:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('392', '2921', '2', '一般细菌培养及鉴定＋药敏（坏死物）（门诊）', '无', '无', '无', '2016-12-27 13:23:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('393', '2932', '1', '消化内科检查,全身,食管测压(消化内科检查)', '无', '无', '无', '2016-12-28 15:52:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('394', '2932', '2', '凝血功能常规检查', '无', '无', '无', '2016-12-28 15:52:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('395', '2929', '1', 'MRI检查,腹部,双肾动静脉MRA(MRI检查)', '无', '无', '无', '2016-12-28 15:54:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('396', '2929', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2016-12-28 15:54:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('397', '2937', '1', '口腔科检查,口腔,牙周常规检查1支利多卡因(口腔科检查)', '无', '无', '无', '2016-12-28 16:13:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('398', '2937', '2', '脱氧核糖核酸(DNA)测序（IDH1/IDH2）（血）', '无', '无', '无', '2016-12-28 16:13:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('399', '2925', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2016-12-28 16:15:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('400', '2925', '2', '钠测定（急诊）（急诊中心）', '无', '无', '无', '2016-12-28 16:15:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('401', '2940', '1', '心内科超声检查,血管,一侧肢体动脉(心内科超声检查)', '无', '无', '无', '2016-12-29 09:37:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('402', '2940', '2', '血清胰岛素测定（餐后1.5小时）', '无', '无', '无', '2016-12-29 09:37:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('403', '2942', '1', 'TCD,头部,颅内段血管彩色多普勒超声（双眼）(TCD)', '无', '无', '无', '2016-12-29 15:28:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('404', '2942', '2', '血清胰岛素测定（餐后1.5小时）', '无', '无', '无', '2016-12-29 15:28:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('405', '2940', '1', '心内科超声检查,血管,一侧肢体动脉(心内科超声检查)', '无', '无', '无', '2016-12-29 16:21:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('406', '2940', '2', '血清胰岛素测定（餐后1.5小时）', '无', '无', '无', '2016-12-29 16:21:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('407', '2937', '1', '口腔科检查,口腔,牙周常规检查1支利多卡因(口腔科检查)', '无', '无', '无', '2016-12-29 16:21:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('408', '2937', '2', '脱氧核糖核酸(DNA)测序（IDH1/IDH2）（血）', '无', '无', '无', '2016-12-29 16:21:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('409', '2932', '1', '消化内科检查,全身,食管测压(消化内科检查)', '无', '无', '无', '2016-12-29 16:21:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('410', '2932', '2', '凝血功能常规检查', '无', '无', '无', '2016-12-29 16:21:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('411', '2929', '1', 'MRI检查,腹部,双肾动静脉MRA(MRI检查)', '无', '无', '无', '2016-12-29 16:21:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('412', '2929', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2016-12-29 16:21:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('413', '2946', '1', '心电图检查,心脏,动态心电图(心电图检查)', '无', '无', '无', '2016-12-29 17:03:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('414', '2946', '2', '幽门螺旋杆菌抗原', '无', '无', '无', '2016-12-29 17:03:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('415', '2943', '1', '消化内科检查,全身,食管测压(消化内科检查)', '无', '无', '无', '2016-12-29 17:04:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('416', '2943', '2', '凝血功能常规检查', '无', '无', '无', '2016-12-29 17:04:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('417', '2948', '1', 'PET检查,腹部,腹部PET检查(PET检查)', '无', '无', '无', '2016-12-29 17:05:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('418', '2948', '2', '凝血功能常规检查', '无', '无', '无', '2016-12-29 17:05:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('419', '2944', '1', '肌电图,全身,体感诱发电位(肌电图)', '无', '无', '无', '2016-12-30 16:51:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('420', '2944', '2', '肿瘤细胞化疗药物敏感试验(多柔比星+多西他赛)(1/2PPC)', '无', '无', '无', '2016-12-30 16:51:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('421', '2945', '1', '个体化用药基因检测,全身,DNA测序（MDR1 C3435(个体化用药基因检测)', '无', '无', '无', '2016-12-30 16:52:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('422', '2945', '2', '血细胞簇分化抗原CD3检测 (传研所)', '无', '无', '无', '2016-12-30 16:52:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('423', '2951', '1', '口腔科检查,口腔,牙周常规检查3支利多卡因(口腔科检查)', '无', '无', '无', '2016-12-30 16:53:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('424', '2951', '2', '血栓弹力图试验（TEG）（肝素酶）', '无', '无', '无', '2016-12-30 16:53:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('425', '2976', '1', '肠镜检查,肠,经内镜结肠治疗(肠镜检查)', '无', '无', '无', '2017-01-04 10:06:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('426', '2976', '2', '尿糖定量测定（门诊）（餐后2小时）', '无', '无', '无', '2017-01-04 10:06:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('427', '2977', '1', 'MRI检查,腹部,双肾动静脉MRA(MRI检查)', '无', '无', '无', '2017-01-04 10:38:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('428', '2977', '1', 'MRI检查,盆腔,盆腔（骨盆）平扫+增强（3.0T(MRI检查)', '无', '无', '无', '2017-01-04 10:38:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('429', '2977', '2', '血小板计数', '无', '无', '无', '2017-01-04 10:38:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('430', '2977', '2', '血细胞分类或血常规(机器法:15分类)', '无', '无', '无', '2017-01-04 10:38:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('431', '3016', '1', '心电图检查,心脏,动态心电图(心电图检查)', '无', '无', '无', '2017-01-05 10:29:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('432', '3016', '2', '抗组织细胞抗体测定', '无', '无', '无', '2017-01-05 10:29:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('433', '3018', '1', 'CT检查,腹部,腹主动脉CTA(CT检查)', '无', '无', '无', '2017-01-05 10:35:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('434', '3018', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2017-01-05 10:35:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('435', '3031', '1', 'MRI检查,胸部,下腔静脉MRA(MRI检查)', '无', '无', '无', '2017-01-06 15:32:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('436', '3031', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2017-01-06 15:32:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('437', '3035', '1', 'X线造影,妇科,子宫输卵管造影(X线造影)', '无', '无', '无', '2017-01-07 15:46:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('438', '3035', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC)', '无', '无', '无', '2017-01-07 15:46:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('439', '3041', '2', '网织红计数', '无', '无', '无', '2017-01-07 16:29:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('440', '3063', '1', '肠镜检查,肠,经内镜肠道球囊扩张术(肠镜检查)', '无', '无', '无', '2017-01-10 09:33:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('441', '3063', '2', '尿糖定量测定（门诊）（餐后2小时）', '无', '无', '无', '2017-01-10 09:33:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('442', '3065', '2', '白细胞人工分类', '无', '无', '无', '2017-01-10 16:00:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('443', '2943', '1', '消化内科检查,全身,食管测压(消化内科检查)', '无', '无', '无', '2017-01-11 10:35:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('444', '2943', '2', '凝血功能常规检查', '无', '无', '无', '2017-01-11 10:35:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('445', '2940', '1', '心内科超声检查,血管,一侧肢体动脉(心内科超声检查)', '无', '无', '无', '2017-01-11 10:38:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('446', '2940', '2', '血清胰岛素测定（餐后1.5小时）', '无', '无', '无', '2017-01-11 10:38:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('447', '2940', '1', '心内科超声检查,血管,一侧肢体动脉(心内科超声检查)', '无', '无', '无', '2017-01-11 10:41:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('448', '2940', '2', '血清胰岛素测定（餐后1.5小时）', '无', '无', '无', '2017-01-11 10:41:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('449', '3094', '1', 'CT检查,腹部,胸腹主动脉CTA(CT检查)', '无', '无', '无', '2017-01-11 13:57:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('450', '3094', '2', '血小板计数', '无', '无', '无', '2017-01-11 13:57:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('451', '3094', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2017-01-11 13:57:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('452', '3096', '1', '可可怜啦咯啦', '2017-01-11', '可可怜啦咯啦', '备注:无', '2017-01-11 14:01:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('453', '2800', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-01-11 14:59:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('454', '2805', '2', '尿α1微量球蛋白测定', '无', '无', '无', '2017-01-11 14:59:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('455', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2017-01-11 14:59:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('456', '3102', '1', '看', '无', '无', '备注:无', '2017-01-11 17:01:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('457', '3106', '1', 'CT', '无', '无', '备注:无', '2017-01-12 09:14:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('458', '3109', '1', 'CT', '2017-01-13 10:23', '无', '备注:无', '2017-01-12 09:19:55', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('459', '3109', '2', '血液透析', '无', '无', '备注:无', '2017-01-12 09:19:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('460', '3113', '1', '个体化用药基因检测,全身,DNA测序（CYP2D6 CYP(个体化用药基因检测)', '无', '无', '无', '2017-01-12 09:57:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('461', '3113', '2', '精子DNA碎片测定（特需）', '无', '无', '无', '2017-01-12 09:57:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('462', '3114', '1', 'CT检查,颈部,颈部静脉CTA(CT检查)', '无', '无', '无', '2017-01-12 10:13:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('463', '3114', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）', '无', '无', '无', '2017-01-12 10:13:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('464', '3139', '1', 'Ffg', '无', '无', '备注:无', '2017-01-12 13:49:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('465', '3146', '1', '超声检查,浅表,甲状腺＋颈部淋巴结(超声检查)', '无', '无', '无', '2017-01-12 15:07:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('466', '3146', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2017-01-12 15:07:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('467', '3150', '1', 'X线摄影,腹部,结肠运行时间测定120小时(X线摄影)', '无', '无', '无', '2017-01-12 15:46:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('468', '3150', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2017-01-12 15:46:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('469', '3160', '1', '超敏C', '无', '无', '无', '2017-01-16 11:58:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('470', '3160', '2', '胸片', '无', '无', '无', '2017-01-16 11:58:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('471', '3161', '1', '血常规', '无', '无', '无', '2017-01-16 14:20:21', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('472', '3161', '2', '胸部CT', '无', '无', '无', '2017-01-16 14:20:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('473', '3169', '1', 'X线摄影,胸部,胸部右侧位(X线摄影)', '无', '无', '无', '2017-01-16 17:37:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('474', '3169', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC)', '无', '无', '无', '2017-01-16 17:37:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('475', '3175', '1', 'MRI检查,胸部,MR心脏平扫（3.0T）(MRI检查)', '无', '无', '无', '2017-01-17 09:42:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('476', '3175', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2017-01-17 09:42:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('477', '3171', '1', '血常规', '无', '无', '无', '2017-01-17 09:53:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('478', '3171', '2', '双肾B超', '无', '无', '无', '2017-01-17 09:53:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('479', '3167', '1', 'CT', '无', '无', '无', '2017-01-17 09:58:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('480', '3167', '2', '大便常规', '无', '无', '无', '2017-01-17 09:58:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('481', '3176', '1', 'MRI检查,胸部,MR胸锁关节平扫（3.0T）(MRI检查)', '无', '无', '无', '2017-01-17 10:17:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('482', '3176', '2', '病理癌基因蛋白检测（C-erbB-2）', '无', '无', '无', '2017-01-17 10:17:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('483', '3182', '1', '心电图检查,心脏,食管内心电图(心电图检查)', '无', '无', '无', '2017-01-20 10:13:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('484', '3182', '1', '心电图检查,心脏,食管内心电图(心电图检查)', '无', '无', '无', '2017-01-20 10:13:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('485', '3184', '1', '心电图检查,心脏,动态血压(心电图检查)', '无', '无', '无', '2017-01-20 10:22:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('486', '3184', '1', '心电图检查,心脏,动态血压(心电图检查)', '无', '无', '无', '2017-01-20 10:22:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('487', '3188', '1', '根深蒂固山豆根', '无', '无', '无', '2017-01-20 20:07:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('488', '3188', '2', '啊是大公司的风格', '无', '无', '无', '2017-01-20 20:07:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('489', '3192', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2017-01-21 10:22:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('490', '3192', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2017-01-21 10:22:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('491', '3192', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2017-01-21 10:52:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('492', '3192', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2017-01-21 10:52:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('493', '3199', '2', '去了急急急急急急咯了几口', '2017-01-28 11:15', '家俊俊龙年', '备注:无', '2017-01-21 16:17:45', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('494', '3199', '2', '啊撸我默默', '2017-01-21', '考虑考虑啦', '备注:无', '2017-01-21 16:17:45', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('495', '3210', '1', '路听您外婆婆婆', '2017-01-21', '突破婆婆也', '备注:无', '2017-01-21 17:50:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('496', '3210', '2', '里江苏区听上去', '2017-01-22', '天去所有者权益', '备注:无', '2017-01-21 17:50:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('497', '3215', '1', '民俗突突突天晚上再送婆婆', '2017-01-22', '诺普信', '备注:无', '2017-01-21 18:54:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('498', '3215', '2', '记录删了呜呜呜', '2017-01-22', '就是所有者权益', '备注:无', '2017-01-21 18:54:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('499', '3223', '1', '肠镜检查,肠,超声肠镜检查(肠镜检查)', '无', '无', '无', '2017-01-22 11:00:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('500', '3223', '2', '肿瘤细胞化疗药物敏感试验(多柔比星+多西他赛)(1/4PPC)', '无', '无', '无', '2017-01-22 11:00:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('501', '3223', '1', '肠镜检查,肠,超声肠镜检查(肠镜检查)', '无', '无', '无', '2017-01-22 11:31:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('502', '3223', '2', '肿瘤细胞化疗药物敏感试验(多柔比星+多西他赛)(1/4PPC)', '无', '无', '无', '2017-01-22 11:31:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('503', '3264', '1', 'CT', '无', '无', '无', '2017-02-05 14:03:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('504', '3266', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '无', '无', '无', '2017-02-07 14:58:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('505', '3275', '1', 'X线普通检查,X线检查--X线普通检查', '无', '无', '无', '2017-02-07 15:18:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('506', '3285', '1', 'CT检查,四肢,CT股骨颈平扫+增强(CT检查)', '无', '无', '无', '2017-02-07 16:27:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('507', '3285', '2', '立克次体血清学试验', '无', '无', '无', '2017-02-07 16:27:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('508', '3315', '1', 'MRI检查,腹部,MRCP（1.5T）(MRI检查)', '无', '无', '无', '2017-02-13 14:40:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('509', '3315', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2017-02-13 14:40:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('510', '3315', '1', 'MRI检查,腹部,MRCP（1.5T）(MRI检查)', '2017-03-14 09:19', '无', '无', '2017-02-13 14:47:27', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('511', '3315', '2', 'DNA测序（脱氧核糖核酸测序）(遗传)', '无', '无', '无', '2017-02-13 14:47:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('512', '3320', '1', '消化内科检查,全身,食管测压(消化内科检查)', '无', '无', '无', '2017-02-13 15:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('513', '3320', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC)', '无', '无', '无', '2017-02-13 15:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('514', '3331', '1', '可可怜啦咯啦', '2017-02-14', '拒绝', '备注:可可怜啦咯啦', '2017-02-13 21:56:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('515', '3325', '2', 'B超', '2017-02-14', '无', '备注:无', '2017-02-13 21:56:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('516', '3355', '1', '啊', '2017-02-15', 'a', '备注:a', '2017-02-14 10:03:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('517', '3360', '1', 'Aaaa', '2017-02-15', 'AAAA', '备注:xxzz', '2017-02-14 10:05:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('518', '3361', '1', '1', '2017-02-15', '1', '备注:1', '2017-02-14 10:40:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('519', '3369', '1', '传染科超声检查,浅表,腹股沟淋巴结(传染科超声检查)', '无', '无', '无', '2017-02-14 14:22:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('520', '3369', '2', '钠测定（急诊）（急诊中心）', '无', '无', '无', '2017-02-14 14:22:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('521', '3365', '1', '你说', '2017-02-19', '莫慌', '备注:哈哈哈', '2017-02-14 17:04:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('522', '3422', '1', '核医学,全身,甲状腺静态显像+半衰期测定(核医学)', '无', '无', '无', '2017-02-17 11:08:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('523', '3422', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2017-02-17 11:08:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('524', '3426', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:22:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('525', '3426', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:33:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('526', '3426', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2017-02-17 15:33:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('527', '3426', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:33:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('528', '3426', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:37:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('529', '3426', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2017-02-17 15:37:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('530', '3426', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:37:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('531', '3436', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:46:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('532', '3436', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2017-02-17 15:46:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('533', '3436', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-17 15:46:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('534', '3396', '2', '血常规[五分类]+C反应蛋白[儿科]', '无', '无', '无', '2017-02-17 17:02:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('535', '3396', '2', '血常规[五分类]+C反应蛋白[儿科]', '无', '无', '无', '2017-02-17 17:02:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('536', '3436', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-18 14:05:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('537', '3436', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '无', '无', '无', '2017-02-18 14:05:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('538', '3436', '1', '常规心电图检查,心电图检查--常规心电图检查', '无', '无', '无', '2017-02-18 14:05:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('539', '3460', '1', 'CT检查,放射科检查--CT检查', '无', '无', '无', '2017-02-22 12:27:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('540', '3474', '1', '超声检查,肌骨,肘关节+脏器灰阶立体成像(超声检查)', '无', '无', '无', '2017-02-23 17:05:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('541', '3474', '2', '病理癌基因蛋白检测（C-erbB-2）,白带,1', '无', '无', '无', '2017-02-23 17:05:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('542', '3146', '1', '超声检查,浅表,甲状腺＋颈部淋巴结(超声检查)', '2017-02-24 18:39', '无', '无', '2017-02-23 17:05:42', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('543', '3146', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),痰,1', '无', '无', '无', '2017-02-23 17:05:42', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('544', '3176', '1', 'MRI检查,胸部,MR胸锁关节平扫（3.0T）(MRI检查)', '无', '无', '无', '2017-02-23 17:05:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('545', '3176', '2', '病理癌基因蛋白检测（C-erbB-2）,,1', '无', '无', '无', '2017-02-23 17:05:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('546', '3474', '1', '超声检查,肌骨,肘关节+脏器灰阶立体成像(超声检查)', '无', '无', '无', '2017-02-23 17:06:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('547', '3474', '2', '病理癌基因蛋白检测（C-erbB-2）,白带,1', '无', '无', '无', '2017-02-23 17:06:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('548', '3475', '1', '传染科超声检查,浅表,甲状腺＋颈部淋巴结(传染科超声检查)', '无', '无', '无', '2017-02-23 17:14:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('549', '3475', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),脓液,1', '无', '无', '无', '2017-02-23 17:14:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('550', '3475', '1', '传染科超声检查,浅表,甲状腺＋颈部淋巴结(传染科超声检查)', '无', '无', '无', '2017-02-23 17:14:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('551', '3475', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),脓液,1', '无', '无', '无', '2017-02-23 17:14:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('552', '3475', '1', '传染科超声检查,浅表,甲状腺＋颈部淋巴结(传染科超声检查)', '无', '无', '无', '2017-02-23 17:17:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('553', '3475', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),脓液,1', '无', '无', '无', '2017-02-23 17:17:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('554', '3475', '1', '传染科超声检查,浅表,甲状腺＋颈部淋巴结(传染科超声检查)', '无', '无', '无', '2017-02-23 17:18:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('555', '3475', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),脓液,1', '无', '无', '无', '2017-02-23 17:18:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('556', '3482', '1', 'X线摄影,脊柱,颈椎侧位(X线摄影)', '无', '无', '无', '2017-02-23 17:21:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('557', '3482', '2', '病理癌基因蛋白检测（C-erbB-2）,痰,1', '无', '无', '无', '2017-02-23 17:21:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('558', '3485', '1', '超声检查,心脏,介入治疗的超声心动图监视加收(1(超声检查)', '无', '无', '无', '2017-02-23 17:29:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('559', '3485', '2', '病理癌基因蛋白检测（C-erbB-2）,脓液,1', '2017-05-16 14:37', '无', '无', '2017-02-23 17:29:01', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('560', '3498', '2', '病理癌基因蛋白检测（C-erbB-2）,分泌物,1', '无', '无', '无', '2017-02-23 18:32:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('561', '3501', '1', 'LOL快乐', '2017-02-24', '啦啦啦噜', '备注:无', '2017-02-23 19:11:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('562', '3516', '1', '还好蒋娴蒋娴蒋娴家', '2017-02-25', '蒋娴蒋娴蒋娴', '备注:无', '2017-02-24 17:55:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('563', '3524', '1', 'MRI检查,脊柱,胸椎平扫+增强（1.5T）(MRI检查)', '无', '无', '无', '2017-02-24 18:35:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('564', '3524', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-02-24 18:35:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('565', '3530', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-02-27 11:45:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('566', '3536', '1', 'CT检查,颈部,CT喉部平扫(CT检查)', '无', '无', '无', '2017-02-28 14:47:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('567', '3536', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,血,1', '无', '无', '无', '2017-02-28 14:47:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('568', '3583', '1', 'gggg,hh,h h', '2017-05-15 14:36', '无', null, '2017-03-09 19:14:54', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('569', '3637', '2', '病理癌基因蛋白检测（C-erbB-2）,脓液,1', '无', '无', '无', '2017-03-23 17:35:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('570', '3637', '2', '病理癌基因蛋白检测（C-erbB-2）,脓液,1', '无', '无', '无', '2017-03-23 17:35:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('571', '3638', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),脓液,1', '无', '无', '无', '2017-03-23 17:37:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('572', '2800', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-03-27 09:43:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('573', '2805', '2', '尿α1微量球蛋白测定', '无', '无', '无', '2017-03-27 09:44:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('574', '2805', '2', '尿α1微量球蛋白测定', '无', '无', '无', '2017-03-27 09:44:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('575', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2017-03-27 09:44:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('576', '2805', '2', '尿α1微量球蛋白测定', '无', '无', '无', '2017-03-27 09:44:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('577', '2800', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-03-27 09:44:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('578', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2017-03-27 09:44:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('579', '3643', '1', 'CT检查,头部,CT眼眶平扫＋三维重建(CT检查)', '无', '无', '无', '2017-03-27 13:29:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('580', '3643', '2', '血常规+异淋（五分类）（门诊）,血液,1', '无', '无', '无', '2017-03-27 13:29:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('581', '3647', '1', '心电图检查,心脏,食道电生理(心电图检查)', '无', '无', '无', '2017-03-27 13:36:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('582', '3647', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),脓液,1', '无', '无', '无', '2017-03-27 13:36:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('583', '3650', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2017-03-27 15:47:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('584', '3650', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-03-27 15:47:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('585', '3650', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2017-03-27 15:47:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('586', '3650', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-03-27 15:47:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('587', '3651', '1', 'X线造影,胆系,T管造影(X线造影)', '无', '无', '无', '2017-03-27 16:06:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('588', '3651', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-03-27 16:06:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('589', '3653', '1', 'X线造影,局部血管造影,右侧下肢静脉造影(X线造影)', '无', '无', '无', '2017-03-28 11:34:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('590', '3653', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),拭子,1', '无', '无', '无', '2017-03-28 11:34:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('591', '3654', '1', '核医学,全身,甲状旁腺显像(核医学)', '无', '无', '无', '2017-03-28 11:45:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('592', '3654', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),痰,1', '无', '无', '无', '2017-03-28 11:45:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('593', '3654', '1', '核医学,全身,甲状旁腺显像(核医学)', '无', '无', '无', '2017-03-28 11:46:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('594', '3654', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),痰,1', '无', '无', '无', '2017-03-28 11:46:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('595', '3655', '1', 'X线造影,胆系,经皮经肝胆道造影(PTC)(X线造影)', '无', '无', '无', '2017-03-28 11:49:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('596', '3655', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-03-28 11:49:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('597', '3655', '1', 'X线造影,胆系,经皮经肝胆道造影(PTC)(X线造影)', '无', '无', '无', '2017-03-28 11:49:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('598', '3655', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-03-28 11:49:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('599', '3657', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2017-03-28 13:28:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('600', '3657', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),咽拭子,1', '无', '无', '无', '2017-03-28 13:28:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('601', '3658', '1', 'CT检查,胸部,肺动脉CTA(CT检查)', '无', '无', '无', '2017-03-28 14:07:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('602', '3658', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),拭子,1', '无', '无', '无', '2017-03-28 14:07:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('603', '3659', '1', 'X线造影,胆系,PTC(X线造影)', '无', '无', '无', '2017-03-28 15:47:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('604', '3659', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-03-28 15:47:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('605', '3642', '2', '血清人绒毛膜促性腺激素测定', '无', '无', '无', '2017-03-28 16:03:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('606', '3666', '1', 'CT检查,胸部,肺动脉CTA(CT检查)', '无', '无', '无', '2017-03-29 17:42:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('607', '3666', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-03-29 17:42:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('608', '3667', '1', 'CT检查,颈部,CT喉部平扫(CT检查)', '无', '无', '无', '2017-03-29 17:44:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('609', '3667', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),痰,1', '无', '无', '无', '2017-03-29 17:44:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('610', '3667', '1', 'CT检查,颈部,CT喉部平扫(CT检查)', '无', '无', '无', '2017-03-29 17:44:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('611', '3667', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),痰,1', '无', '无', '无', '2017-03-29 17:44:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('612', '3679', '1', 'X线摄影,头部,头颅正位(X线摄影)', '无', '无', '无', '2017-03-31 16:51:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('613', '3679', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,精液,1', '无', '无', '无', '2017-03-31 16:51:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('614', '3679', '2', '副流感病毒III型RNA检测（痰）,拭子,1', '无', '无', '无', '2017-03-31 16:51:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('615', '3731', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-04-11 14:05:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('616', '3731', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-04-11 14:05:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('617', '3773', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-04-26 14:15:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('618', '3773', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-04-26 14:15:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('619', '3773', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-04-26 14:15:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('620', '3774', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '2017/5/4 9:00:00', '恩泽1号', '无', '2017-04-27 16:29:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('621', '3825', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2017-05-04 16:49:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('622', '3825', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),血,1', '无', '无', '无', '2017-05-04 16:49:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('623', '3830', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,血,1', '2017-06-22 21:46', '无', '无', '2017-05-08 10:23:06', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('624', '3827', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '2017/5/10 15:30:00', '恩泽1号', '无', '2017-05-09 15:18:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('625', '3878', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-05-25 09:06:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('626', '3878', '2', '流感病毒A型、B型RNA检测（痰）,痰,1', '无', '无', '无', '2017-05-25 09:06:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('627', '3878', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-05-25 09:06:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('628', '3878', '2', '流感病毒A型、B型RNA检测（痰）,痰,1', '无', '无', '无', '2017-05-25 09:06:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('629', '3878', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-05-25 09:08:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('630', '3878', '2', '流感病毒A型、B型RNA检测（痰）,痰,1', '无', '无', '无', '2017-05-25 09:08:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('631', '3878', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-05-25 09:13:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('632', '3878', '2', '流感病毒A型、B型RNA检测（痰）,痰,1', '无', '无', '无', '2017-05-25 09:13:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('633', '3878', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-05-25 09:13:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('634', '3878', '2', '流感病毒A型、B型RNA检测（痰）,痰,1', '无', '无', '无', '2017-05-25 09:13:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('635', '3878', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '2017-06-27 10:27', '无', '无', '2017-05-25 09:20:12', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('636', '3878', '2', '流感病毒A型、B型RNA检测（痰）,痰,1', '2017-08-20 15:13', '无', '无', '2017-05-25 09:20:12', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('637', '3881', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2017-05-25 09:44:11', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('638', '3881', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),咽拭子,1', '2017-08-21 15:22', '无', '无', '2017-05-25 09:44:11', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('639', '3882', '1', 'CT检查,头部,脑动脉CTA(CT检查)', '无', '无', '无', '2017-05-25 10:00:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('640', '3882', '2', '病理癌基因蛋白检测（C-erbB-2）,血,1', '无', '无', '无', '2017-05-25 10:00:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('641', '3883', '1', 'CT检查,头部,CT鼻窦平扫（鼻部）＋三维重建(CT检查)', '无', '无', '无', '2017-05-25 10:38:38', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('642', '3883', '2', '血清胰岛素测定（餐后1.5小时）,痰,1', '无', '无', '无', '2017-05-25 10:38:38', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('643', '3886', '1', 'X线造影,消化道,食道造影(X线造影)', '无', '无', '无', '2017-05-25 11:12:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('644', '3888', '1', 'CT检查,头部,CT上颌骨平扫＋三维重建(CT检查)', '无', '无', '无', '2017-05-25 14:46:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('645', '3888', '2', 'CEA+CA199＋CA125,拭子,1', '无', '无', '无', '2017-05-25 14:46:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('646', '3869', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '2017/6/1 9:30:00', '恩泽1号', '无', '2017-05-25 16:50:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('647', '3869', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2017/6/1 9:30:00', '恩泽7号', '无', '2017-05-25 16:50:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('648', '3869', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '2017/6/1 9:30:00', '恩泽1号', '无', '2017-05-25 16:50:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('649', '3869', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2017/6/1 9:30:00', '恩泽7号', '无', '2017-05-25 16:50:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('650', '3965', '1', '常规心电图检查,心电图检查--常规心电图检查', '', '', '无', '2017-06-02 14:26:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('651', '3965', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-06-02 14:26:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('652', '3965', '1', '常规心电图检查,心电图检查--常规心电图检查', '2017/6/3 11:30:00', '心电图', '无', '2017-06-03 08:23:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('653', '3965', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-06-03 08:23:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('654', '3950', '1', '哦你领,6名,6名', '无', '无', null, '2017-06-14 09:30:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('655', '4031', '1', '检查项目,无,无', '无', '无', null, '2017-06-14 15:31:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('656', '4031', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-06-14 15:31:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('657', '4031', '2', '检验名称,样本类型,单日次数', '无', '无', null, '2017-06-14 15:31:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('658', '4034', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-06-14 16:26:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('659', '4045', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-06-15 10:38:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('660', '4045', '2', '检验名称,样本类型,单日次数', '无', '无', null, '2017-06-15 10:38:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('661', '4051', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-06-15 11:16:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('662', '4064', '1', '精彩每次,部位,项目', '无', '无', null, '2017-06-15 17:21:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('663', '4064', '2', '名词,类型,单日次数', '无', '无', null, '2017-06-15 17:21:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('664', '4065', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-06-15 17:42:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('665', '4065', '2', '检验名称,样本类型,单日次数', '无', '无', null, '2017-06-15 17:42:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('666', '4068', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-06-15 19:10:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('667', '4070', '1', '检查,部位,项目', '无', '无', null, '2017-06-15 19:46:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('668', '4079', '1', '名称,部位,项目', '无', '无', null, '2017-06-16 15:33:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('669', '4096', '2', '免疫系列C', '无', '无', '无', '2017-06-22 08:51:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('670', '4137', '1', 'CT检查,颈部,CT喉部平扫(CT检查)', '无', '无', '无', '2017-06-28 09:35:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('671', '4137', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),咽拭子,1', '无', '无', '无', '2017-06-28 09:35:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('672', '4137', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),,1', '无', '无', '无', '2017-06-28 09:35:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('673', '4142', '1', '肺功能检查,肺,弥散+通气(肺功能检查)', '无', '无', '无', '2017-06-28 09:40:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('674', '4142', '2', '妇科脱落细胞学检查与诊断,咽拭子,1', '无', '无', '无', '2017-06-28 09:40:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('675', '4142', '1', '肺功能检查,肺,弥散+通气(肺功能检查)', '无', '无', '无', '2017-06-28 09:40:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('676', '4142', '2', '妇科脱落细胞学检查与诊断,咽拭子,1', '无', '无', '无', '2017-06-28 09:40:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('677', '4149', '1', 'CT检查,胸部,CT胸部平扫+增强(CT检查)', '无', '无', '无', '2017-06-28 10:48:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('678', '4149', '2', '血常规（五分类）（门诊）,血液,1', '无', '无', '无', '2017-06-28 10:48:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('679', '4145', '1', 'CT检查,胸部,CT胸部平扫+增强(CT检查)', '无', '无', '无', '2017-06-28 10:57:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('680', '4145', '2', '血常规（五分类）（门诊）,血液,1', '无', '无', '无', '2017-06-28 10:57:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('681', '4152', '1', 'PET检查,腹部,腹部PET检查(PET检查)', '无', '无', '无', '2017-06-28 14:35:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('682', '4152', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),,1', '无', '无', '无', '2017-06-28 14:35:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('683', '4153', '1', 'CT检查,脊柱,CT胸椎椎体平扫+增强(CT检查)', '无', '无', '无', '2017-06-28 17:22:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('684', '4153', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),血,1', '无', '无', '无', '2017-06-28 17:22:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('685', '4159', '1', '心电图检查,心脏,常规心电图(心电图检查)', '无', '无', '无', '2017-06-29 10:37:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('686', '4159', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-06-29 10:37:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('687', '4169', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),分泌物,1', '无', '无', '无', '2017-06-30 11:48:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('688', '4191', '1', '睡眠呼吸监测,肺,睡眠呼吸监测(CPAP治疗)(睡眠呼吸监测)', '无', '无', '无', '2017-07-03 15:31:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('689', '4191', '2', '（ELISA）结核感染T细胞检测,血,1', '无', '无', '无', '2017-07-03 15:31:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('690', '4191', '1', '睡眠呼吸监测,肺,睡眠呼吸监测(CPAP治疗)(睡眠呼吸监测)', '无', '无', '无', '2017-07-03 15:31:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('691', '4191', '2', '（ELISA）结核感染T细胞检测,血,1', '无', '无', '无', '2017-07-03 15:31:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('692', '4221', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '2017/7/6 15:12:00', '恩泽1号', '无', '2017-07-06 08:26:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('693', '4221', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '2017/7/6 15:12:00', '恩泽1号', '无', '2017-07-06 08:26:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('694', '4225', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2017/7/10 9:30:00', '恩泽7号', '无', '2017-07-06 12:04:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('695', '4233', '1', '胎儿及妇科腔内超声检查,超声检查申请单', '', '', '无', '2017-07-06 19:26:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('696', '4231', '1', 'X线造影,泌尿系,逆行尿路造影(X线造影)', '无', '无', '无', '2017-07-07 10:52:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('697', '4231', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),血,1', '无', '无', '无', '2017-07-07 10:52:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('698', '4240', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),咽拭子,1', '无', '无', '无', '2017-07-07 14:37:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('699', '4275', '1', 'X线普通检查,X线检查--X线普通检查', '2017/7/21 10:00:00', '4号DR机房', '无', '2017-07-12 10:40:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('700', '4218', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2017/7/16 14:00:00', '门诊2号', '无', '2017-07-12 10:41:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('701', '4284', '1', 'CT检查,腹部,CT下腹部平扫+增强(CT检查)', '无', '无', '无', '2017-07-14 14:09:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('702', '4284', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),咽拭子,1', '无', '无', '无', '2017-07-14 14:09:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('703', '4284', '1', 'CT检查,腹部,CT下腹部平扫+增强(CT检查)', '无', '无', '无', '2017-07-14 14:15:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('704', '4284', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),咽拭子,1', '无', '无', '无', '2017-07-14 14:15:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('705', '4296', '1', '检查名称,检查buw,检查项目', '无', '无', null, '2017-07-17 11:45:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('706', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-07-18 10:56:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('707', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-18 10:56:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('708', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-07-18 10:56:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('709', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-18 10:56:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('710', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-07-18 10:56:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('711', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-18 10:56:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('712', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-07-18 10:56:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('713', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-18 10:56:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('714', '2770', '2', '糖尿病自身抗体系列', '无', '无', '无', '2017-07-18 10:56:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('715', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-07-18 10:56:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('716', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-18 10:56:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('717', '2770', '2', '糖尿病自身抗体系列', '无', '无', '无', '2017-07-18 10:56:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('718', '2800', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-18 10:56:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('719', '2811', '2', '血小板抑制率检测[AA+ADP激活]', '无', '无', '无', '2017-07-18 16:40:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('720', '4310', '1', 'X线普通检查,X线检查--X线普通检查', '2017/7/24 8:32:00', '4号DR机房', '无', '2017-07-19 10:51:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('721', '4310', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2017/7/24 10:00:00', '恩泽7号', '无', '2017-07-19 10:51:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('722', '4310', '1', 'MR检查(3.0T),放射科检查--MR检查(3.0T)', '2017/7/24 9:15:00', 'MR3号机房', '无', '2017-07-19 10:51:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('723', '4310', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-07-19 10:51:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('724', '4310', '2', '生化全套B', '无', '无', '无', '2017-07-19 10:51:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('725', '4326', '1', 'CT,眼部,无', '无', '无', null, '2017-07-19 18:18:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('726', '4357', '1', '检查名词,检测部位,检测项目', '无', '无', null, '2017-07-21 15:28:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('727', '4362', '1', '检测米不过从,检测部位,检测项目', '无', '无', null, '2017-07-21 17:54:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('728', '4370', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-07-24 09:28:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('729', '4317', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-07-24 09:43:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('730', '4378', '1', '精彩名词,精彩部位,精彩项目', '无', '无', null, '2017-07-24 13:52:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('731', '4385', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-07-25 11:34:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('732', '4412', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-07-25 17:22:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('733', '4413', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-07-25 17:23:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('734', '4422', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-07-26 10:27:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('735', '4472', '1', '老王,腹部,都查一遍', '无', '无', null, '2017-07-27 15:43:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('736', '4476', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-07-27 17:56:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('737', '4490', '1', '2,2,2', '无', '无', null, '2017-07-27 19:55:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('738', '4498', '2', '咯哦,了点,喝了', '无', '无', null, '2017-07-28 09:22:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('739', '4504', '1', '名称,部位,项目', '无', '无', null, '2017-07-28 16:31:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('740', '4517', '1', '名称,部位,项目', '无', '无', null, '2017-07-28 17:19:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('741', '4549', '1', '力量,急急急,急急急哈', '2017-08-17 10:44', '无', null, '2017-08-02 17:37:21', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('742', '4574', '1', '好自为之,给你们,给你们', '无', '无', null, '2017-08-03 10:03:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('743', '4579', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-08-03 17:13:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('744', '4579', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-08-03 17:14:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('745', '4579', '1', '名称,部位,项目', '无', '无', null, '2017-08-03 17:14:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('746', '4579', '1', '名称,部位,项目', '无', '无', null, '2017-08-03 17:16:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('747', '4581', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-08-03 17:56:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('748', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 10:57:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('749', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 10:57:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('750', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 10:59:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('751', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 10:59:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('752', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 10:59:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('753', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 10:59:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('754', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 11:09:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('755', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 11:09:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('756', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 11:12:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('757', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 11:12:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('758', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 13:15:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('759', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 13:15:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('760', '4579', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-08-06 13:47:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('761', '4579', '2', '肌酐测定', '无', '无', '无', '2017-08-06 13:47:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('762', '4597', '1', '扣扣,啦啦,看看咯', '2017-08-17 10:43', '无', null, '2017-08-07 10:22:00', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('763', '4606', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-08-07 11:33:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('764', '4612', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-08-07 15:49:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('765', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:22:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('766', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:23:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('767', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:23:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('768', '4645', '1', '1,1,1', '无', '无', null, '2017-08-07 17:25:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('769', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:25:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('770', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:25:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('771', '4646', '1', '1,1,1', '无', '无', null, '2017-08-07 17:28:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('772', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:30:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('773', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('774', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('775', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('776', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('777', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('778', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('779', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('780', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('781', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('782', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('783', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('784', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('785', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('786', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('787', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('788', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('789', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('790', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('791', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('792', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:36:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('793', '4647', '1', '1,1,1', '无', '无', null, '2017-08-07 17:38:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('794', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('795', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('796', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('797', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('798', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('799', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('800', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('801', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('802', '4612', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-08-07 17:39:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('803', '4670', '1', 'CT检查,头部,CT视神经平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-11 13:55:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('804', '4670', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-08-11 13:55:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('805', '4684', '1', 'CT检查,头部,CT眼眶平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-15 09:46:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('806', '4684', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-15 09:46:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('807', '4684', '1', 'CT检查,头部,CT眼眶平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-15 09:47:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('808', '4684', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-15 09:47:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('809', '4685', '1', 'CT检查,头部,脑动脉CTA(CT检查)', '无', '无', '无', '2017-08-15 09:50:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('810', '4685', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,脓液,1', '无', '无', '无', '2017-08-15 09:50:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('811', '4685', '1', 'CT检查,头部,脑动脉CTA(CT检查)', '无', '无', '无', '2017-08-15 09:50:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('812', '4685', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,脓液,1', '无', '无', '无', '2017-08-15 09:50:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('813', '4687', '1', 'bhgg,fffg,hgfft', '无', '无', null, '2017-08-15 10:04:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('814', '4692', '1', 'X线造影,胆系,PTC(X线造影)', '无', '无', '无', '2017-08-15 15:12:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('815', '4692', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-15 15:12:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('816', '4692', '1', 'X线造影,胆系,PTC(X线造影)', '无', '无', '无', '2017-08-15 15:13:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('817', '4692', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-15 15:13:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('818', '4696', '1', '检查名称,检查部位,检查项目', '无', '无', null, '2017-08-15 15:30:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('819', '4710', '1', 'MRI检查,头颅,MR头颅局部 3D-TOF+FI(MRI检查)', '无', '无', '无', '2017-08-16 09:52:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('820', '4710', '2', '病理癌基因蛋白检测（C-erbB-2）,痰,1', '无', '无', '无', '2017-08-16 09:52:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('821', '4710', '1', 'MRI检查,头颅,MR头颅局部 3D-TOF+FI(MRI检查)', '无', '无', '无', '2017-08-16 09:53:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('822', '4710', '2', '病理癌基因蛋白检测（C-erbB-2）,痰,1', '无', '无', '无', '2017-08-16 09:53:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('823', '4713', '1', '超声检查,腹部,脏器灰阶立体成像(超声检查)', '无', '无', '无', '2017-08-16 10:06:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('824', '4713', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),痰,1', '无', '无', '无', '2017-08-16 10:06:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('825', '4713', '1', '超声检查,腹部,脏器灰阶立体成像(超声检查)', '无', '无', '无', '2017-08-16 10:06:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('826', '4713', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),痰,1', '无', '无', '无', '2017-08-16 10:06:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('827', '4718', '1', 'CT检查,头部,CT视神经平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-16 10:30:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('828', '4718', '2', '荧光染色体原位杂交检查（IGH/FGFR3, t(4;14)(p16;q32)）,咽拭子,1', '无', '无', '无', '2017-08-16 10:30:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('829', '4718', '1', 'CT检查,头部,CT视神经平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-16 10:36:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('830', '4718', '2', '荧光染色体原位杂交检查（IGH/FGFR3, t(4;14)(p16;q32)）,咽拭子,1', '无', '无', '无', '2017-08-16 10:36:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('831', '4716', '1', 'CT检查,脊柱,CT骶髂关节平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-16 10:36:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('832', '4716', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-08-16 10:36:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('833', '4730', '1', 'X线造影,局部血管造影,左侧下肢静脉造影(X线造影)', '无', '无', '无', '2017-08-16 13:54:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('834', '4730', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-08-16 13:54:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('835', '4730', '1', 'X线造影,局部血管造影,左侧下肢静脉造影(X线造影)', '无', '无', '无', '2017-08-16 13:54:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('836', '4730', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-08-16 13:54:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('837', '4730', '1', 'X线造影,局部血管造影,左侧下肢静脉造影(X线造影)', '2017-08-15 18:05', '无', '无', '2017-08-16 13:55:55', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('838', '4730', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),咽拭子,1', '无', '无', '无', '2017-08-16 13:55:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('839', '4732', '1', '你,那就,呼呼', '无', '无', null, '2017-08-16 14:07:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('840', '4740', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),拭子,1', '无', '无', '无', '2017-08-17 10:00:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('841', '4776', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,血,1', '无', '无', '无', '2017-08-21 17:30:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('842', '4786', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-08-21 18:01:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('843', '4786', '2', '尿常规+比重(门诊),尿,1', '无', '无', '无', '2017-08-21 18:01:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('844', '4791', '2', 'C肽兴奋试验,痰,1', '无', '无', '无', '2017-08-21 21:19:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('845', '4797', '1', 'X线造影,胆系,T管造影(X线造影)', '无', '无', '无', '2017-08-22 09:29:19', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('846', '4805', '1', 'Hhjg,Hh,Njj', '无', '无', null, '2017-08-22 15:46:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('847', '4805', '2', 'Bjh,Gui,Vjj', '无', '无', null, '2017-08-22 15:46:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('848', '4805', '1', 'Hhjg,Hh,Njj', '无', '无', null, '2017-08-22 15:58:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('849', '4805', '2', 'Bjh,Gui,Vjj', '无', '无', null, '2017-08-22 15:58:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('850', '4808', '1', 'ce,ce,ice', '无', '无', null, '2017-08-22 16:20:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('851', '4806', '1', 'huu,yuu,gui', '无', '无', null, '2017-08-22 16:27:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('852', '4803', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,血,1', '无', '无', '无', '2017-08-22 17:18:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('853', '4815', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2017-08-23 09:18:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('854', '4815', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-23 09:18:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('855', '4815', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2017-08-23 09:18:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('856', '4815', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-23 09:18:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('857', '4822', '1', 'CT检查,头部,CT鼻窦平扫（鼻部）＋三维重建(CT检查)', '无', '无', '无', '2017-08-23 11:24:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('858', '4822', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),血,1', '无', '无', '无', '2017-08-23 11:24:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('859', '4818', '1', 'X线造影,胆系,T管造影(X线造影)', '无', '无', '无', '2017-08-23 11:32:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('860', '4812', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-08-23 11:48:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('861', '4812', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-23 11:48:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('862', '4812', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-08-23 11:49:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('863', '4812', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-23 11:49:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('864', '4827', '1', 'X线造影,消化道,食道造影(X线造影)', '无', '无', '无', '2017-08-23 13:47:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('865', '4827', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,血,1', '无', '无', '无', '2017-08-23 13:47:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('866', '4828', '1', 'X线造影,胆系,PTC(X线造影)', '无', '无', '无', '2017-08-23 16:15:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('867', '4828', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,咽拭子,1', '无', '无', '无', '2017-08-23 16:15:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('868', '4833', '1', 'CT检查,腹部,腹主动脉CTA(CT检查)', '无', '无', '无', '2017-08-23 18:54:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('869', '4833', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),拭子,1', '无', '无', '无', '2017-08-23 18:54:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('870', '4834', '1', 'MRI检查,腹部,下腔静脉MRA(MRI检查)', '无', '无', '无', '2017-08-24 09:12:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('871', '4834', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,痰,1', '无', '无', '无', '2017-08-24 09:12:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('872', '4835', '1', 'w,w,w', '无', '无', null, '2017-08-24 10:30:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('873', '4841', '1', 'CT检查,颈部,CT甲状腺平扫+增强(CT检查)', '无', '无', '无', '2017-08-24 11:36:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('874', '4841', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,血,1', '无', '无', '无', '2017-08-24 11:36:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('875', '4842', '1', 'ce,l l,l l', '无', '无', null, '2017-08-24 11:52:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('876', '4842', '2', 'l l,t l,t l', '无', '无', null, '2017-08-24 11:52:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('877', '4835', '1', 'w,w,w', '无', '无', null, '2017-08-24 11:53:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('878', '4842', '1', 'ce,l l,l l', '无', '无', null, '2017-08-24 13:46:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('879', '4842', '2', 'l l,t l,t l', '无', '无', null, '2017-08-24 13:46:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('880', '4843', '1', '个体化用药基因检测,全身,DNA测序（CYP2C8 R13(个体化用药基因检测)', '无', '无', '无', '2017-08-24 13:54:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('881', '4843', '2', '血清胰岛素测定（餐后1.5小时）,拭子,1', '无', '无', '无', '2017-08-24 13:54:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('882', '4843', '1', '个体化用药基因检测,全身,DNA测序（CYP2C8 R13(个体化用药基因检测)', '无', '无', '无', '2017-08-24 13:56:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('883', '4843', '2', '血清胰岛素测定（餐后1.5小时）,拭子,1', '无', '无', '无', '2017-08-24 13:56:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('884', '4851', '1', 'CT检查,颈部,CT甲状腺平扫(CT检查)', '无', '无', '无', '2017-08-25 09:48:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('885', '4851', '1', 'CT检查,脊柱,CT胸椎椎体平扫＋三维重建(CT检查)', '无', '无', '无', '2017-08-25 09:48:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('886', '4851', '2', '病理癌基因蛋白检测（C-erbB-2）,拭子,1', '无', '无', '无', '2017-08-25 09:48:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('887', '4851', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),痰,1', '无', '无', '无', '2017-08-25 09:48:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('888', '4868', '1', '灰灰,不会,回家', '无', '无', null, '2017-08-30 16:15:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('889', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:23:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('890', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:23:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('891', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:23:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('892', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:25:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('893', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:25:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('894', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:25:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('895', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:25:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('896', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:25:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('897', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:25:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('898', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:26:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('899', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:26:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('900', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:26:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('901', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('902', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('903', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('904', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:27:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('905', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:27:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('906', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:27:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('907', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:28:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('908', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:28:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('909', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:28:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('910', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:29:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('911', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:29:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('912', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:29:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('913', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:29:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('914', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:29:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('915', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:29:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('916', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:29:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('917', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:29:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('918', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:29:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('919', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:30:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('920', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:30:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('921', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:30:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('922', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:31:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('923', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:31:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('924', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:31:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('925', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-08-30 16:33:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('926', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-08-30 16:33:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('927', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-08-30 16:33:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('928', '4869', '1', 'CT检查,颈部,CT颈部平扫+增强(CT检查)', '无', '无', '无', '2017-08-30 17:24:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('929', '4869', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),血,1', '无', '无', '无', '2017-08-30 17:24:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('930', '4871', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-08-30 18:54:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('931', '4871', '1', 'X线造影,胆系,PTC(X线造影)', '无', '无', '无', '2017-08-30 18:55:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('932', '4871', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-08-30 18:55:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('933', '4870', '1', '超声检查,妇产科,宫颈（彩超）(超声检查)', '无', '无', '无', '2017-08-30 19:41:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('934', '4870', '2', '凝血功能常规检查,,1', '无', '无', '无', '2017-08-30 19:41:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('935', '2781', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-04 17:30:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('936', '2781', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-04 17:30:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('937', '4886', '1', 'CT检查,头部,脑动脉CTA(CT检查)', '无', '无', '无', '2017-09-05 10:43:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('938', '4886', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-09-05 10:43:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('939', '4887', '1', 'CT检查,四肢,右下肢动脉彩色多普勒超声(超声检查)', '无', '无', '无', '2017-09-05 11:20:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('940', '4908', '1', 'X线造影,局部血管造影,右侧下肢静脉造影(X线造影)', '无', '无', '无', '2017-09-06 09:35:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('941', '4908', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-09-06 09:35:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('942', '4908', '1', 'X线造影,局部血管造影,右侧下肢静脉造影(X线造影)', '无', '无', '无', '2017-09-06 09:37:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('943', '4908', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-09-06 09:37:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('944', '4908', '1', 'X线造影,局部血管造影,右侧下肢静脉造影(X线造影)', '2017-09-28 14:46', '无', '无', '2017-09-06 09:38:10', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('945', '4908', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '2017-09-30 14:53', '无', '无', '2017-09-06 09:38:10', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('946', '4950', '1', 'CT检查,头部,CT头颅平扫(CT检查)', '无', '无', '无', '2017-09-08 08:54:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('947', '4950', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-09-08 08:54:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('948', '4982', '1', 'CT检查,四肢,CT锁骨平扫＋三维重建(CT检查)', '无', '无', '无', '2017-09-12 11:47:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('949', '4982', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),血,1', '无', '无', '无', '2017-09-12 11:47:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('950', '4994', '2', '血常规（五分类）（门诊）,,1', '无', '无', '无', '2017-09-13 10:16:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('951', '4994', '2', '血常规（五分类）（门诊）,,1', '无', '无', '无', '2017-09-13 10:17:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('952', '5029', '1', '测试,测试,测试', '无', '无', '无', '2017-09-15 11:34:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('953', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 11:34:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('954', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 11:34:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('955', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 11:34:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('956', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 14:10:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('957', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 14:10:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('958', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 14:10:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('959', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-15 14:10:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('960', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 14:10:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('961', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 14:10:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('962', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-15 14:10:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('963', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 14:10:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('964', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 14:10:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('965', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 14:10:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('966', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 14:10:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('967', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 14:13:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('968', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 14:13:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('969', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 14:13:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('970', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 14:13:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('971', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 14:13:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('972', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 14:13:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('973', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-15 14:13:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('974', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-15 14:18:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('975', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-15 14:18:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('976', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-15 14:18:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('977', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-15 14:18:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('978', '5075', '1', '超声检查,妇产科,胎盘（彩超）(超声检查)', '无', '无', '无', '2017-09-20 09:24:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('979', '5075', '1', '超声检查,妇产科,羊水（彩超）(超声检查)', '无', '无', '无', '2017-09-20 09:24:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('980', '5074', '1', 'CT检查,腹部,CT上腹部平扫+增强(CT检查)', '无', '无', '无', '2017-09-20 09:52:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('981', '5074', '2', '血常规（五分类）（门诊）,血,1', '无', '无', '无', '2017-09-20 09:52:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('982', '5074', '2', '肝功能常规检查,尿,1', '无', '无', '无', '2017-09-20 09:52:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('983', '5076', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-21 16:53:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('984', '5089', '1', '超声检查,妇产科,胎心（彩超）(超声检查)', '2018-01-23 13:34', '无', '无', '2017-09-22 08:59:05', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('985', '5089', '2', '血红蛋白测定(Hb)(急诊中心),血,1', '无', '无', '无', '2017-09-22 08:59:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('986', '5091', '1', '超声检查,妇产科,盆底彩超(超声检查)', '无', '无', '无', '2017-09-22 09:28:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('987', '5095', '1', '超声检查,妇产科,盆底彩超(超声检查)', '无', '无', '无', '2017-09-22 14:29:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('988', '5095', '2', '血红蛋白测定(Hb)(急诊中心),血,1', '无', '无', '无', '2017-09-22 14:29:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('989', '5097', '1', 'CT检查,四肢,CT肱骨上段（包肩关节）平扫＋三(CT检查)', '无', '无', '无', '2017-09-22 16:47:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('990', '5097', '2', '血小板计数,血,1', '无', '无', '无', '2017-09-22 16:47:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('991', '5100', '1', 'CT检查,四肢,CT足平扫(CT检查)', '无', '无', '无', '2017-09-22 17:19:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('992', '5100', '2', '血小板计数,血液,1', '无', '无', '无', '2017-09-22 17:19:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('993', '5114', '1', 'CT检查,四肢,CT锁骨平扫+增强(CT检查)', '无', '无', '无', '2017-09-25 14:31:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('994', '5114', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),血,1', '无', '无', '无', '2017-09-25 14:31:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('995', '5116', '1', 'CT检查,胸部,CT胸部平扫+增强(CT检查)', '无', '无', '无', '2017-09-25 16:00:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('996', '5116', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,血,1', '无', '无', '无', '2017-09-25 16:00:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('997', '5116', '1', 'CT检查,胸部,CT胸部平扫+增强(CT检查)', '无', '无', '无', '2017-09-25 16:02:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('998', '5116', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,血,1', '无', '无', '无', '2017-09-25 16:02:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('999', '5117', '1', '心内科超声检查,心脏,超声心动图(心内科超声检查)', '2018-01-04 12:30', '无', '无', '2017-09-25 17:00:39', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1000', '5117', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),血,1', '无', '无', '无', '2017-09-25 17:00:39', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1001', '5112', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2017/9/28 10:48:00', '恩泽7号', '无', '2017-09-26 14:34:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1002', '5112', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2017-09-26 14:34:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1003', '5307', '1', '常规心电图检查,心电图检查--常规心电图检查', '', '', '无', '2017-09-29 14:19:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1004', '5307', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-09-29 14:19:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1005', '5307', '1', '常规心电图检查,心电图检查--常规心电图检查', '', '', '无', '2017-09-29 14:21:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1006', '4868', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '', '', '无', '2017-09-29 14:21:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1007', '4868', '1', 'X线普通检查,X线检查--X线普通检查', '', '', '无', '2017-09-29 14:21:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1008', '5307', '2', '门诊尿常规(含比重)', '无', '无', '无', '2017-09-29 14:21:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1009', '4868', '2', '尿液流式有形成份定量+尿化学', '无', '无', '无', '2017-09-29 14:21:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1010', '4647', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-29 14:21:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1011', '4645', '2', '门诊血常规[五分类]', '无', '无', '无', '2017-09-29 14:21:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1012', '5308', '1', 'X线摄影,胸部,胸部正位(X线摄影)', '无', '无', '无', '2017-09-29 15:24:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1013', '5308', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,引流液,1', '无', '无', '无', '2017-09-29 15:24:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1014', '5322', '1', 'DR,卧位腹部平片,数字化摄影(DR)(卧位腹部平片)', '无', '无', '无', '2017-09-30 14:40:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1015', '5322', '1', '心电,常规心电图,常规心电图检查(常规心电图)', '无', '无', '无', '2017-09-30 14:40:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1016', '5322', '1', '功能性检查,肺通气功能检查,腹水', '无', '无', '无', '2017-09-30 14:40:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1017', '5322', '2', '胃蛋白酶原I+II(胃蛋白酶原I),其他,1', '无', '无', '无', '2017-09-30 14:40:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1018', '5357', '1', 'US,妇产科,盆底彩超', '无', '无', '无', '2017-10-09 10:08:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1019', '5414', '1', '功能性检查,腹部,腹水', '无', '无', '无', '2017-10-10 13:34:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1020', '5414', '2', '血型鉴定(卡式配血加收),血,1', '无', '无', '无', '2017-10-10 13:34:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1021', '5445', '1', 'CT检查,头部,CT眼眶平扫', '无', '无', '无', '2017-10-10 17:39:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1022', '5445', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-10-10 17:39:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1023', '5445', '1', 'CT检查,头部,CT眼眶平扫', '无', '无', '无', '2017-10-10 17:39:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1024', '5445', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-10-10 17:39:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1025', '5445', '1', 'CT检查,头部,CT眼眶平扫', '无', '无', '无', '2017-10-10 17:39:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1026', '5445', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-10-10 17:39:36', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1027', '5469', '1', '功能性检查,腹部,腹水', '无', '无', '无', '2017-10-11 16:16:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1028', '5469', '2', '生化全套(血清总蛋白测定TP),血,1', '无', '无', '无', '2017-10-11 16:16:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1029', '5470', '1', 'DR,左骶髂关节正斜位,数字化摄影(DR)(左骶髂关节正斜位)', '无', '无', '无', '2017-10-11 17:06:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1030', '5478', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-10-13 10:05:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1031', '5478', '2', '生化全套(血清尿酸测定UA),血,1', '无', '无', '无', '2017-10-13 10:05:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1032', '5484', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-10-13 11:16:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1033', '5484', '2', '大便常规+隐血(粪便检查),大便,1', '无', '无', '无', '2017-10-13 11:16:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1034', '5488', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-10-13 13:59:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1035', '5488', '2', '大便常规+隐血(粪便检查),,1', '无', '无', '无', '2017-10-13 13:59:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1036', '5506', '1', '功能性检查,肺通气功能+支气管,最大通气量检查加收(肺通气功能+支气管)', '无', '无', '无', '2017-10-13 16:12:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1037', '5506', '1', 'DR,胸椎正侧位 ,数字化摄影(DR)(胸椎正侧位 )', '无', '无', '无', '2017-10-13 16:18:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1038', '5506', '1', 'DR,胸椎正侧位 ,数字化摄影(DR)(胸椎正侧位 )', '无', '无', '无', '2017-10-13 17:45:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1039', '5506', '1', 'DR,胸椎正侧位 ,数字化摄影(DR)(胸椎正侧位 )', '无', '无', '无', '2017-10-13 17:47:32', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1040', '5516', '1', 'CT检查,头部,CT头颅外伤', '无', '无', '无', '2017-10-16 09:29:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1041', '5516', '2', '钠测定（急诊）（急诊中心）,引流液,1', '无', '无', '无', '2017-10-16 09:29:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1042', '5516', '1', 'CT检查,头部,CT头颅外伤', '无', '无', '无', '2017-10-16 09:29:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1043', '5516', '2', '钠测定（急诊）（急诊中心）,引流液,1', '无', '无', '无', '2017-10-16 09:29:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1044', '5525', '1', 'DR,胸椎正侧位 ,数字化摄影(DR)(胸椎正侧位 )', '无', '无', '无', '2017-10-16 10:24:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1045', '5525', '2', '肝功能(肺结核免费)(肝功能常规检查（肺结核）免费),血,1', '无', '无', '无', '2017-10-16 10:24:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1046', '5525', '1', 'DR,胸椎正侧位 ,数字化摄影(DR)(胸椎正侧位 )', '无', '无', '无', '2017-10-16 11:44:42', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1047', '5525', '2', '肝功能(肺结核免费)(肝功能常规检查（肺结核）免费),血,1', '无', '无', '无', '2017-10-16 11:44:42', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1048', '5526', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,分泌物,1', '无', '无', '无', '2017-10-16 15:18:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1049', '5526', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,分泌物,1', '无', '无', '无', '2017-10-16 15:19:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1050', '5526', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,分泌物,1', '无', '无', '无', '2017-10-16 15:19:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1051', '5544', '2', '高血压三项卧位(血浆肾素活性测定),血,1', '无', '无', '无', '2017-10-16 17:11:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1052', '5544', '2', '高血压三项卧位(血浆肾素活性测定),血,1', '无', '无', '无', '2017-10-16 17:15:50', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1053', '5591', '1', 'CT检查,胸部,CT胸部平扫', '无', '无', '无', '2017-10-18 19:55:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1054', '5591', '2', '病理癌基因蛋白检测（C-erbB-2）,血,1', '无', '无', '无', '2017-10-18 19:55:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1055', '5591', '1', 'CT检查,胸部,CT胸部平扫', '无', '无', '无', '2017-10-18 19:55:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1056', '5591', '2', '病理癌基因蛋白检测（C-erbB-2）,血,1', '无', '无', '无', '2017-10-18 19:55:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1057', '5591', '1', 'CT检查,胸部,CT胸部平扫', '无', '无', '无', '2017-10-18 19:55:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1058', '5591', '2', '病理癌基因蛋白检测（C-erbB-2）,血,1', '无', '无', '无', '2017-10-18 19:55:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1059', '5591', '1', 'CT检查,胸部,CT胸部平扫', '无', '无', '无', '2017-10-18 19:55:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1060', '5591', '2', '病理癌基因蛋白检测（C-erbB-2）,血,1', '无', '无', '无', '2017-10-18 19:55:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1061', '5591', '1', 'CT检查,胸部,CT胸部平扫', '无', '无', '无', '2017-10-18 19:55:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1062', '5591', '2', '病理癌基因蛋白检测（C-erbB-2）,血,1', '无', '无', '无', '2017-10-18 19:55:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1063', '5593', '1', 'CT检查,胸部,CT气道重建', '无', '无', '无', '2017-10-18 20:08:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1064', '5593', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),分泌物,1', '无', '无', '无', '2017-10-18 20:08:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1065', '5593', '1', 'CT检查,胸部,CT气道重建', '无', '无', '无', '2017-10-18 20:09:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1066', '5593', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),分泌物,1', '无', '无', '无', '2017-10-18 20:09:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1067', '5607', '1', 'CT检查,颈部,CT甲状腺平扫', '无', '无', '无', '2017-10-19 17:07:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1068', '5607', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-10-19 17:07:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1069', '5607', '1', 'CT检查,颈部,CT甲状腺平扫', '无', '无', '无', '2017-10-19 17:07:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1070', '5607', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,骨髓,1', '无', '无', '无', '2017-10-19 17:07:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1071', '5602', '1', 'CT检查,颈部,CT舌部平扫', '2017-10-25 09:50', '无', '无', '2017-10-19 17:58:25', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1072', '5602', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),分泌物,1', '无', '无', '无', '2017-10-19 17:58:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1073', '5605', '1', '检查名称,检查部位,检查项目', '无', '无', '无', '2017-10-19 18:32:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1074', '5666', '1', 'X线造影,胆系,ERCP', '无', '无', '无', '2017-10-25 17:39:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1075', '5666', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,引流液,1', '无', '无', '无', '2017-10-25 17:39:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1076', '5667', '1', 'X线造影,胆系,ERCP', '无', '无', '无', '2017-10-25 17:43:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1077', '5667', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-10-25 17:43:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1078', '5668', '1', 'X线造影,小造影,瘘（窦）道造影', '无', '无', '无', '2017-10-25 17:50:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1079', '5668', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),血,1', '无', '无', '无', '2017-10-25 17:50:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1080', '5669', '1', 'CT检查,胸部,CT气道重建', '无', '无', '无', '2017-10-25 18:12:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1081', '5669', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),分泌物,1', '无', '无', '无', '2017-10-25 18:12:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1082', '5670', '1', 'X线摄影,胸部,胸部正位', '无', '无', '无', '2017-10-25 20:08:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1083', '5670', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,精液,1', '无', '无', '无', '2017-10-25 20:08:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1084', '5702', '1', 'MRI检查,胸部,MR纵膈平扫（3.0T）', '无', '无', '无', '2017-10-31 14:03:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1085', '5702', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),血,1', '无', '无', '无', '2017-10-31 14:03:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1086', '5710', '1', 'CT检查,头部,CT头颅外伤', '无', '无', '无', '2017-11-01 10:28:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1087', '5710', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-11-01 10:28:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1088', '5710', '1', 'CT检查,头部,CT头颅外伤', '无', '无', '无', '2017-11-01 10:28:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1089', '5710', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-11-01 10:28:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1090', '5746', '1', '功能性检查,肺通气功能+支气管,肺通气功能检查(肺通气功能+支气管)', '无', '无', '无', '2017-11-07 14:47:41', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1091', '5746', '2', '抗核抗体全套(抗核糖体抗体测定),血,1', '无', '无', '无', '2017-11-07 14:47:41', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1092', '5750', '2', '皮质醇16时(血浆皮质醇测定),血,1', '无', '无', '无', '2017-11-07 16:21:22', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1093', '5775', '1', 'US,甲状腺及颈部淋巴结,浅表器官彩色多普勒超声检查(甲状腺及颈部淋巴结)', '无', '无', '无', '2017-11-09 15:27:17', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1094', '5775', '2', '生化全套(血清总蛋白测定TP),血,1', '无', '无', '无', '2017-11-09 15:27:17', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1095', '5776', '1', '心电,常规心电图,常规心电图检查(常规心电图)', '无', '无', '无', '2017-11-09 16:05:53', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1096', '5776', '2', '生化全套(血清总蛋白测定TP),血,1', '无', '无', '无', '2017-11-09 16:05:53', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1097', '5789', '1', '心电,常规心电图,常规心电图检查(常规心电图)', '无', '无', '无', '2017-11-14 13:23:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1098', '5807', '1', 'US,胸部,彩色多普勒超声( 肿瘤  )(胸部)', '2017-11-17 14:40', '无', '无', '2017-11-17 10:51:36', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1099', '5807', '2', '生化全套(血清总蛋白测定TP),血,1', '2017-11-17 14:37', '无', '无', '2017-11-17 10:51:36', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1100', '5816', '1', '心电,动态血压,24小时动态血压监测(动态血压)', '无', '无', '无', '2017-11-17 15:39:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1101', '5816', '2', '抗中性粒细胞胞浆抗体4项(抗中性粒细胞胞浆抗体测定(PANCA)),血,1', '无', '无', '无', '2017-11-17 15:39:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1102', '5815', '1', 'MR,右手增强,磁共振扫描(右手增强)', '无', '无', '无', '2017-11-17 17:33:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1103', '5815', '2', '高血压三项卧位(血管紧张素Ⅰ测定),其他,1', '无', '无', '无', '2017-11-17 17:33:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1104', '5821', '2', '高血压三项卧位(血浆肾素活性测定),血,1', '无', '无', '无', '2017-11-19 17:20:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1105', '5822', '1', 'US,腹腔积液,彩色多普勒超声常规检查(腹腔积液)', '无', '无', '无', '2017-11-20 09:20:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1106', '5822', '2', '生化全套(血清总蛋白测定TP),血,1', '无', '无', '无', '2017-11-20 09:20:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1107', '5826', '1', 'ES,结肠镜检查,结肠镜检查（胃肠镜）(结肠镜检查)', '2017-12-25 16:40', '无', '无', '2017-11-20 13:41:31', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1108', '5826', '2', '醛固酮立位(醛固酮测定),血,1', '2017-12-25 16:42', '无', '无', '2017-11-20 13:41:31', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1109', '5833', '1', 'US,腹腔积液,彩色多普勒超声( 肿瘤  )(腹腔积液)', '无', '无', '无', '2017-11-21 09:33:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1110', '5833', '2', '生化全套(血清总蛋白测定TP),血,1', '无', '无', '无', '2017-11-21 09:33:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1111', '5858', '1', 'US,腹腔积液,彩色多普勒超声( 肿瘤  )(腹腔积液)', '无', '无', '无', '2017-11-22 11:14:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1112', '5858', '2', '生化筛查(血清白蛋白测定ALB),血,1', '无', '无', '无', '2017-11-22 11:14:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1113', '5906', '1', 'DR,右腕关节正位,数字化摄影(DR)(右腕关节正位)', '无', '无', '无', '2017-11-30 09:12:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1114', '5906', '2', '雌二醇(雌二醇测定),血,1', '无', '无', '无', '2017-11-30 09:12:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1115', '5905', '2', '血沉(红细胞沉降率测定(ESR)),血液,1', '无', '无', '无', '2017-11-30 14:52:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1116', '5907', '1', '脑电,肌炎,肌电针(肌炎)', '无', '无', '无', '2017-11-30 15:10:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1117', '5907', '2', '抗中性粒细胞胞浆抗体4项(抗中性粒细胞胞浆抗体测定(MPO-A)),血,1', '无', '无', '无', '2017-11-30 15:10:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1118', '5909', '1', '功能性检查,肺通气功能检查,细菌过滤器(肺通气功能检查)', '无', '无', '无', '2017-11-30 15:19:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1119', '5909', '2', '糖类抗原测定CA-50(糖类抗原测定(CA-50)),大便,1', '无', '无', '无', '2017-11-30 15:19:29', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1120', '5913', '1', '功能性检查,肺通气功能检查,最大通气量检查加收(肺通气功能检查)', '无', '无', '无', '2017-12-01 08:59:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1121', '5913', '2', '丙肝RNA测定低拷贝(丙肝RNA测定（低拷贝内标定量）),其他,1', '无', '无', '无', '2017-12-01 08:59:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1122', '5910', '1', '心电,常规心电图,常规心电图检查(常规心电图)', '无', '无', '无', '2017-12-01 09:43:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1123', '5910', '2', '胰岛素测定(餐后半小时)(血清胰岛素测定（餐后半小时）),其他,1', '无', '无', '无', '2017-12-01 09:43:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1124', '5914', '1', '功能性检查,肺通气功能+支气管,流速容量曲线(V—V曲线)(肺通气功能+支气管)', '无', '无', '无', '2017-12-01 09:49:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1125', '5914', '2', '抗中性粒细胞胞浆抗体4项(抗中性粒细胞胞浆抗体测定(PANCA)),大便,1', '无', '无', '无', '2017-12-01 09:49:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1126', '5912', '1', '脑电,动态脑电图,动态脑电图(包脑电视频监测、脑)(动态脑电图)', '无', '无', '无', '2017-12-01 09:57:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1127', '5912', '2', '淋巴细胞亚群测定(各类血细胞簇分化抗原(CD3)检测),甲屑,1', '无', '无', '无', '2017-12-01 09:57:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1128', '5916', '1', '功能性检查,肺弥散功能,肺弥散功能检查(一口气法)(肺弥散功能)', '无', '无', '无', '2017-12-01 10:01:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1129', '5916', '2', 'D二聚体(DD)(血浆D-二聚体测定      ),分泌物,1', '无', '无', '无', '2017-12-01 10:01:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1130', '5917', '1', 'ES,胃镜检查,胃十二指肠镜检查(胃镜检查)', '无', '无', '无', '2017-12-01 10:38:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1131', '5917', '2', '抗中性粒细胞胞浆抗体4项(抗中性粒细胞胞浆抗体测定(PANCA)),血,1', '无', '无', '无', '2017-12-01 10:38:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1132', '5919', '2', '结核杆菌基因芯片菌种鉴定及耐药基因检测(化学药物用药指导的基因检测),血,1', '无', '无', '无', '2017-12-01 11:10:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1133', '5920', '1', 'US,双眼,彩色多普勒超声( 肿瘤  )(双眼)', '无', '无', '无', '2017-12-01 11:46:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1134', '5920', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-01 11:46:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1135', '5921', '1', '功能性检查,肺通气功能检查,肺通气功能检查(肺通气功能检查)', '2018-01-27 17:15', '无', '苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊苏打水啊啊但是阿呆阿呆啊地方复方法哈哈哈哈发呆啊苏打水啊啊但是阿呆阿呆啊任溶溶鹅', '2017-12-01 12:48:38', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1136', '5921', '2', '糖类抗原测定CA72－4(糖类抗原测定(CA72－4)),血,1', '无', '无', '无', '2017-12-01 12:48:38', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1137', '5922', '1', 'ES,胃镜检查,胃十二指肠镜检查(胃镜检查)', '无', '无', '无', '2017-12-01 13:35:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1138', '5922', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-01 13:35:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1139', '5943', '1', 'ES,胃镜检查,胃十二指肠镜检查(胃镜检查)', '2017-12-26 09:40', '无', '无', '2017-12-07 09:27:13', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1140', '5943', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-07 09:27:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1141', '5972', '1', 'US,泌尿系（男）,彩色多普勒超声常规检查(泌尿系（男）)', '无', '无', '无', '2017-12-13 10:05:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1142', '5973', '1', 'ES,结肠镜检查（无痛）,计算机图文报告（胃肠镜）(结肠镜检查（无痛）)', '无', '无', '无', '2017-12-13 10:09:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1143', '5977', '1', '心电,动态心电图,24小时动态心电图(动态心电图)', '无', '无', '无', '2017-12-14 13:22:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1144', '5977', '2', '血常规五分类(小儿)(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-14 13:22:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1145', '5969', '1', '心电,18导联心电图,常规心电图检查(18导联心电图)', '无', '无', '无', '2017-12-14 13:28:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1146', '5969', '2', '凝血酶全套(血浆凝血酶原时间测定(PT)),血,1', '无', '无', '无', '2017-12-14 13:28:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1147', '6009', '2', '抗核抗体体检(抗核抗体测定(ANA)),血,1', '无', '无', '无', '2017-12-18 14:40:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1148', '6015', '1', 'CT检查,头部,CT头颅外伤', '无', '无', '无', '2017-12-18 15:33:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1149', '6015', '2', '精子果糖测定（特需）,精液,1', '无', '无', '无', '2017-12-18 15:33:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1150', '6013', '1', 'X线造影,妇科,双侧子宫输卵管造影', '无', '无', '无', '2017-12-18 16:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1151', '6013', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),白带,1', '无', '无', '无', '2017-12-18 16:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1152', '6019', '1', '脑电,脑电图,脑地形图(脑电图)', '无', '无', '无', '2017-12-19 09:32:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1153', '6019', '1', '脑电,脑电图,特殊脑电图(脑电图)', '无', '无', '无', '2017-12-19 09:32:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1154', '6024', '1', '心电,常规心电图,常规心电图检查(常规心电图)', '2017-12-26 09:25', '无', '无', '2017-12-19 10:13:38', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1155', '6024', '1', 'DR,胸部正斜位,数字化摄影(DR)(胸部正斜位)', '无', '无', '无', '2017-12-19 10:13:38', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1156', '6024', '1', 'US,产科,彩色多普勒超声( 肿瘤  )(产科)', '无', '无', '无', '2017-12-19 10:13:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1157', '6024', '2', '血常规(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-19 10:13:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1158', '6034', '1', 'CT检查,胸部,CT胸部平扫', '无', '无', '无', '2017-12-19 15:29:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1159', '6034', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,引流液,1', '无', '无', '无', '2017-12-19 15:29:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1160', '6041', '1', '超声检查,腹部,后腹膜', '无', '无', '无', '2017-12-20 17:12:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1161', '6041', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),,1', '无', '无', '无', '2017-12-20 17:12:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1162', '6092', '2', '血常规(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-25 09:46:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1163', '6118', '1', '心电图检查,心,心', '无', '无', '无', '2017-12-26 19:53:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1164', '6118', '1', '心电图检查,心,心', '无', '无', '无', '2017-12-26 19:54:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1165', '6130', '1', 'X线造影,泌尿系,肾盂静脉造影', '无', '无', '无', '2017-12-27 18:06:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1166', '6130', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-12-27 18:06:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1167', '6132', '2', '病理癌基因蛋白检测（C-erbB-2）,引流液,1', '无', '无', '无', '2017-12-27 18:18:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1168', '6132', '1', 'X线摄影,头部,头颅左侧位', '无', '无', '无', '2017-12-27 18:18:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1169', '6132', '2', '病理癌基因蛋白检测（C-erbB-2）,引流液,1', '无', '无', '无', '2017-12-27 18:18:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1170', '6132', '1', 'X线摄影,头部,头颅左侧位', '无', '无', '无', '2017-12-27 18:18:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1171', '6139', '1', '传染科超声检查,腹部,肝胆脾胰', '无', '无', '无', '2017-12-27 18:19:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1172', '6139', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),白带,1', '无', '无', '无', '2017-12-27 18:19:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1173', '6132', '2', '病理癌基因蛋白检测（C-erbB-2）,引流液,1', '无', '无', '无', '2017-12-27 18:21:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1174', '6132', '1', 'X线摄影,头部,头颅左侧位', '无', '无', '无', '2017-12-27 18:21:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1175', '6132', '2', '病理癌基因蛋白检测（C-erbB-2）,引流液,1', '无', '无', '无', '2017-12-27 18:22:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1176', '6132', '1', 'X线摄影,头部,头颅左侧位', '无', '无', '无', '2017-12-27 18:22:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1177', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 18:30:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1178', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 18:30:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1179', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 18:30:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1180', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 18:30:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1181', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 18:30:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1182', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 18:30:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1183', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 18:31:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1184', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 18:31:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1185', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 18:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1186', '6138', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),白带,1', '无', '无', '无', '2017-12-27 18:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1187', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 18:33:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1188', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 18:33:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1189', '6138', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),白带,1', '无', '无', '无', '2017-12-27 18:33:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1190', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 18:33:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1191', '6143', '1', 'X线造影,消化道,食道造影', '无', '无', '无', '2017-12-27 19:08:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1192', '6143', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2017-12-27 19:08:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1193', '6146', '1', 'CT检查,腹部,CT中腹部平扫', '无', '无', '无', '2017-12-27 19:15:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1194', '6146', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),分泌物,1', '无', '无', '无', '2017-12-27 19:15:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1195', '6146', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),分泌物,1', '无', '无', '无', '2017-12-27 19:15:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1196', '6146', '2', '血栓弹力图试验（TEG）（肝素酶）,分泌物,1', '无', '无', '无', '2017-12-27 19:15:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1197', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 19:23:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1198', '6138', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),白带,1', '无', '无', '无', '2017-12-27 19:23:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1199', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 19:23:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1200', '6138', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,白带,1', '无', '无', '无', '2017-12-27 19:25:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1201', '6138', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),白带,1', '无', '无', '无', '2017-12-27 19:25:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1202', '6138', '1', 'MRI检查,腹部,肾脏平扫+弥散（3.0T）', '无', '无', '无', '2017-12-27 19:25:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1203', '6140', '1', 'MRI检查,颈部,MR颈部软组织平扫（3.0T）', '无', '无', '无', '2017-12-27 19:32:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1204', '6140', '1', 'X线造影,胆系,T管造影', '无', '无', '无', '2017-12-27 19:32:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1205', '6140', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,分泌物,1', '无', '无', '无', '2017-12-27 19:32:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1206', '6140', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),引流液,1', '无', '无', '无', '2017-12-27 19:32:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1207', '6146', '1', '传染科超声检查,腹部,肝胆胰', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1208', '6146', '1', '传染科超声检查,腹部,肝胆胰', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1209', '6146', '1', 'X线造影,消化道,胃造影/上消化道造影', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1210', '6146', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),分泌物,1', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1211', '6146', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),分泌物,1', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1212', '6146', '2', '血栓弹力图试验（TEG）（肝素酶）,分泌物,1', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1213', '6146', '2', '钠测定（急诊）（急诊中心）,分泌物,1', '无', '无', '无', '2017-12-27 19:39:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1214', '6129', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,精液,1', '无', '无', '无', '2017-12-27 20:24:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1215', '6129', '1', 'X线造影,胆系,ERCP', '无', '无', '无', '2017-12-27 20:24:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1216', '6155', '2', '乙肝DNA测定（国家重点实验室）,血,1', '无', '无', '无', '2017-12-27 20:45:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1217', '6155', '1', '脑电图,头部,动态脑电图(小于24小时)', '无', '无', '无', '2017-12-27 20:45:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1218', '6155', '2', '乙肝DNA测定（国家重点实验室）,血,1', '无', '无', '无', '2017-12-27 20:45:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1219', '6155', '1', '脑电图,头部,动态脑电图(小于24小时)', '无', '无', '无', '2017-12-27 20:45:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1220', '6162', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）', '无', '无', '无', '2017-12-27 21:42:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1221', '6162', '1', 'MRI检查,盆腔,直肠肿块平扫+弥散（3.0T)', '无', '无', '无', '2017-12-27 21:42:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1222', '6162', '1', '超声检查,肌骨,腕关节+脏器灰阶立体成像', '无', '无', '无', '2017-12-27 21:42:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1223', '6165', '1', 'X线造影,泌尿系,逆行尿路造影', '无', '无', '无', '2017-12-28 10:20:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1224', '6165', '2', '病理癌基因蛋白检测（C-erbB-2）,刷片,1', '无', '无', '无', '2017-12-28 10:20:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1225', '6179', '2', '血常规(血液细胞自动化分析（血常规5）),血,1', '无', '无', '无', '2017-12-28 13:07:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1226', '6179', '2', '高血压三项立位(血浆肾素活性测定),血,1', '无', '无', '无', '2017-12-28 13:07:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1227', '6180', '2', '大便常规+隐血(粪便检查),大便,1', '无', '无', '无', '2017-12-28 13:14:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1228', '6186', '1', 'MRI检查,关节,右侧膝关节平扫+增强（1.5T）', '无', '无', '无', '2017-12-28 14:50:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1229', '6186', '2', '血常规（五分类）（门诊）,血液,1', '无', '无', '无', '2017-12-28 14:50:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1230', '6192', '1', 'X线造影,泌尿系,肾盂静脉造影', '无', '无', '无', '2017-12-28 15:14:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1231', '6192', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),引流液,1', '无', '无', '无', '2017-12-28 15:14:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1232', '6245', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,精液,1', '无', '无', '无', '2018-01-02 15:41:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1233', '6245', '1', 'X线造影,胆系,ERCP', '无', '无', '无', '2018-01-02 15:41:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1234', '6248', '1', 'CT检查,胸部,CT气道重建', '无', '无', '无', '2018-01-03 10:43:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1235', '6248', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-01-03 10:43:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1236', '6252', '1', 'MRI检查,腹部,肠系膜上动脉MRA', '无', '无', '无', '2018-01-03 16:47:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1237', '6252', '2', '精子果糖测定（特需）,血,1', '无', '无', '无', '2018-01-03 16:47:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1238', '6279', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,分泌物,1', '无', '无', '无', '2018-01-06 17:34:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1239', '6279', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,分泌物,1', '无', '无', '无', '2018-01-06 17:36:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1240', '6303', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2018/1/16 10:06:00', '门诊2号', '无', '2018-01-15 14:08:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1241', '6303', '1', '心脏、血管、腹部、浅表超声检查,超声检查申请单', '2018/1/16 10:06:00', '门诊2号', '无', '2018-01-15 14:08:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1242', '6331', '1', 'CT,胸部平扫,CT平扫', '无', '无', '无', '2018-01-17 10:17:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1243', '6331', '2', '血常规,血,1', '无', '无', '无', '2018-01-17 10:17:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1244', '6313', '2', '葡萄糖测定', '无', '无', '无', '2018-01-17 14:19:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1245', '6313', '2', '血脂常规检查', '无', '无', '无', '2018-01-17 14:19:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1246', '6313', '2', '肝功能Ⅰ', '无', '无', '无', '2018-01-17 14:19:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1247', '6313', '2', '血清肌酸激酶测定', '无', '无', '无', '2018-01-17 14:19:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1248', '6313', '2', '葡萄糖测定[指测]', '无', '无', '无', '2018-01-17 14:19:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1249', '6313', '2', '一次性采血器[末梢26G]苏州', '无', '无', '无', '2018-01-17 14:19:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1250', '6339', '1', 'CT,头颅平扫,CT平扫', '无', '无', '无', '2018-01-18 17:10:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1251', '6339', '2', '载脂蛋白E,引流液,1', '无', '无', '无', '2018-01-18 17:10:35', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1252', '6364', '1', 'X线造影,局部血管造影,左侧下肢静脉造影', '无', '无', '无', '2018-01-23 18:58:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1253', '6364', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,引流液,1', '无', '无', '无', '2018-01-23 18:58:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1254', '6370', '1', 'ES,呼气实验,胃镜', '无', '无', '无', '2018-01-23 19:19:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1255', '6370', '2', '抗酸杆菌-毛刷,引流液,1', '无', '无', '无', '2018-01-23 19:19:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1256', '6373', '1', 'DR,左膝关节正侧位,DR四肢', '无', '无', '无', '2018-01-23 19:51:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1257', '6373', '2', '维生素谱质谱法,分泌物,1', '无', '无', '无', '2018-01-23 19:51:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1258', '6373', '1', 'DR,左膝关节正侧位,DR四肢', '无', '无', '无', '2018-01-23 20:04:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1259', '6373', '2', '维生素谱质谱法,分泌物,1', '无', '无', '无', '2018-01-23 20:04:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1260', '6375', '1', 'X线摄影,头部,头颅正位', '无', '无', '无', '2018-01-23 20:15:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1261', '6375', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),分泌物,1', '无', '无', '无', '2018-01-23 20:15:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1262', '6377', '1', 'X线摄影,头部,头颅正位', '无', '无', '无', '2018-01-23 20:25:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1263', '6377', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-01-23 20:25:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1264', '6383', '1', 'CT,头部平扫,CT平扫', '2018-01-29 14:30', '无', '就是都i个', '2018-01-24 13:41:45', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1265', '6383', '2', '血常规,血,1', '无', '无', '无', '2018-01-24 13:41:45', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1266', '6445', '1', 'MRI检查,头颅,MR头颅平扫（1.5T）', '无', '无', '无', '2018-01-31 19:26:04', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1267', '6445', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,血,1', '2018-01-24 19:32', '无', '无', '2018-01-31 19:26:04', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1268', '6452', '1', 'CT检查,颈部,CT喉部平扫', '2018-02-01 16:42', '无', '无', '2018-02-01 16:26:54', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1269', '6452', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),血,1', '无', '无', '无', '2018-02-01 16:26:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1270', '6458', '1', 'X线造影,小造影,瘘（窦）道造影', '无', '无', '无', '2018-02-01 17:19:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1271', '6458', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),引流液,1', '无', '无', '无', '2018-02-01 17:19:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1272', '6481', '1', '心电,常规心电图,心电图', '2018-02-02 15:55', '无', '无', '2018-02-02 15:21:41', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1273', '6481', '1', 'ES,胃镜检查,胃镜', '2018-02-03 08:40', '无', '无', '2018-02-02 15:21:41', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1274', '6481', '1', 'US,肝胆胰脾,B超腹部.浅表.血管', '2018-02-03 09:10', '无', '无', '2018-02-02 15:21:41', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1275', '6481', '2', '血常规,,1', '2018-02-03 08:10', '无', '无', '2018-02-02 15:21:41', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1276', '6481', '2', '生化全套,,1', '2018-02-03 08:10', '无', '无', '2018-02-02 15:21:41', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1277', '6482', '1', 'CT,头颅平扫,CT平扫', '2018-02-03 17:15', '无', '无', '2018-02-02 16:48:02', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1278', '6482', '2', '血常规,,1', '2018-02-03 17:10', '无', '无', '2018-02-02 16:48:02', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1279', '6484', '1', 'ES,胃镜检查,胃镜', '2018-02-03 14:35', '无', '无', '2018-02-02 17:06:06', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1280', '6484', '1', '心电,常规心电图,心电图', '2018-02-02 17:10', '无', '无', '2018-02-02 17:06:06', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1281', '6484', '2', '血常规,,1', '2018-02-03 17:15', '无', '无', '2018-02-02 17:06:06', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1282', '6505', '1', 'CT,右足增强,CT增强', '无', '无', '无', '2018-02-06 10:26:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1283', '6505', '2', '抗酸杆菌-灌洗液,引流液,1', '无', '无', '无', '2018-02-06 10:26:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1284', '6520', '1', 'CT检查,颈部,CT舌部平扫', '无', '无', '无', '2018-02-08 11:53:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1285', '6520', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),引流液,1', '无', '无', '无', '2018-02-08 11:53:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1286', '6514', '2', '病理癌基因蛋白检测（C-erbB-2）,尿,1', '无', '无', '无', '2018-02-08 13:22:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1287', '6537', '1', 'CT检查,胸部,CT肋骨平扫', '无', '无', '无', '2018-02-08 14:14:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1288', '6537', '2', '肿瘤细胞化疗药物敏感试验(吉西他滨+氟尿嘧啶)(1PPC),尿,1', '无', '无', '无', '2018-02-08 14:14:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1289', '6552', '1', 'X线造影,小造影,瘘（窦）道造影', '无', '无', '无', '2018-02-08 15:26:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1290', '6552', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-02-08 15:26:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1291', '6572', '1', 'CT,颈椎间盘（每三个部位）,CT平扫', '无', '无', '无', '2018-02-08 16:20:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1292', '6572', '2', '生化全套2,分泌物,1', '无', '无', '无', '2018-02-08 16:20:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1293', '6573', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-08 16:42:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1294', '6573', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-02-08 16:42:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1295', '6573', '2', '血常规,血,1', '无', '无', '无', '2018-02-08 16:42:28', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1296', '6570', '1', 'X线造影,小造影,瘘（窦）道造影', '无', '无', '无', '2018-02-08 17:33:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1297', '6570', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-02-08 17:33:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1298', '6574', '1', 'X线造影,妇科,双侧子宫输卵管造影', '无', '无', '无', '2018-02-08 19:06:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1299', '6574', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,引流液,1', '无', '无', '无', '2018-02-08 19:06:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1300', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:38:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1301', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:38:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1302', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:38:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1303', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:38:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1304', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:38:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1305', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:38:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1306', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:38:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1307', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:38:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1308', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:38:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1309', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:38:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1310', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:39:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1311', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:39:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1312', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:39:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1313', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:39:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1314', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:39:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1315', '6587', '2', '糖化血红蛋白测定,,1', '无', '无', '无', '2018-02-09 09:39:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1316', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:40:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1317', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:40:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1318', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:40:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1319', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:40:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1320', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:40:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1321', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:40:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1322', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:40:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1323', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:40:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1324', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:40:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1325', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:40:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1326', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:43:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1327', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:43:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1328', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:44:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1329', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:44:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1330', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:44:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1331', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:44:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1332', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:49:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1333', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:49:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1334', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:49:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1335', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:49:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1336', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:49:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1337', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:49:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1338', '6587', '2', '空腹血糖测定,血,1', '无', '无', '无', '2018-02-09 09:49:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1339', '6587', '2', '糖化血红蛋白测定,血,1', '无', '无', '无', '2018-02-09 09:49:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1340', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:00:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1341', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:00:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1342', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:03:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1343', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:03:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1344', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:04:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1345', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:04:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1346', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:04:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1347', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:04:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1348', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:04:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1349', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:04:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1350', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:04:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1351', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:04:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1352', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:04:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1353', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:04:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1354', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:04:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1355', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:04:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1356', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:05:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1357', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:05:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1358', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:11:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1359', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:11:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1360', '6597', '1', '检测名词,检测部位,检测项目', '无', '无', '无', '2018-02-09 10:32:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1361', '6592', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-02-09 10:34:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1362', '6592', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 10:34:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1363', '6599', '1', 'CT,头颅平扫,CT平扫', '无', '无', '无', '2018-02-09 11:08:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1364', '6599', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 11:08:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1365', '6599', '1', 'CT,头颅平扫,CT平扫', '无', '无', '无', '2018-02-09 11:08:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1366', '6599', '2', '血常规,血,1', '无', '无', '无', '2018-02-09 11:08:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1367', '6621', '1', 'CT,头颅平扫,CT平扫', '无', '无', '无', '2018-02-09 14:10:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1368', '6621', '2', '血常规五分类(小儿),,1', '无', '无', '无', '2018-02-09 14:10:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1369', '6627', '1', '眼部检查,眼睛,视力检查', '无', '无', '无', '2018-02-09 15:56:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1370', '6628', '1', '眼部检查,眼部,眼镜', '无', '无', '无', '2018-02-09 16:00:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1371', '6633', '1', '眼镜,眼睛,眼睛', '无', '无', '无', '2018-02-09 17:39:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1372', '6664', '1', '心电,常规心电图,心电图', '2018-03-07 08:50', '无', '预约成功', '2018-02-12 08:44:52', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1373', '6664', '2', '血常规,血,1', '无', '无', '无', '2018-02-12 08:44:52', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1374', '6676', '1', '心电,动态血压,心电图', '无', '无', '无', '2018-02-27 13:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1375', '6676', '1', 'CT,头颅CTA,CT增强', '无', '无', '无', '2018-02-27 13:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1376', '6676', '2', '生化全套,血,1', '无', '无', '无', '2018-02-27 13:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1377', '6676', '2', '高血压三项立位,血,1', '无', '无', '无', '2018-02-27 13:26:51', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1378', '6676', '1', '心电,动态血压,心电图', '无', '无', '无', '2018-02-27 13:26:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1379', '6676', '1', 'CT,头颅CTA,CT增强', '无', '无', '无', '2018-02-27 13:26:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1380', '6676', '2', '生化全套,血,1', '无', '无', '无', '2018-02-27 13:26:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1381', '6676', '2', '高血压三项立位,血,1', '无', '无', '无', '2018-02-27 13:26:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1382', '6687', '1', 'MRI检查,颈部,MR臂丛神经平扫（3.0T）', '无', '无', '无', '2018-03-01 14:50:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1383', '6687', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),引流液,1', '无', '无', '无', '2018-03-01 14:50:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1384', '6687', '1', 'MRI检查,颈部,MR臂丛神经平扫（3.0T）', '无', '无', '无', '2018-03-01 14:54:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1385', '6687', '2', 'DNA测序（脱氧核糖核酸测序）(遗传),引流液,1', '无', '无', '无', '2018-03-01 14:54:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1386', '6695', '1', 'CT检查,颈部,CT喉部平扫', '无', '无', '无', '2018-03-01 15:28:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1387', '6695', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-03-01 15:28:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1388', '6697', '1', 'MRI检查,头颅,MR胸腺平扫（3.0T）', '无', '无', '无', '2018-03-02 09:50:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1389', '6697', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,分泌物,1', '无', '无', '无', '2018-03-02 09:50:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1390', '6708', '1', 'MRI检查,盆腔,MR排便功能平扫（3.0T)', '无', '无', '无', '2018-03-07 16:00:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1391', '6708', '2', '荧光染色体原位杂交检查（IGH/MAF, t(14;16)(q32;q23)）,血,1', '无', '无', '无', '2018-03-07 16:00:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1392', '6711', '1', '心电,18导联心电图,心电图', '无', '无', '无', '2018-03-12 09:09:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1393', '6711', '1', 'DR,胸部正侧位,DR胸部', '无', '无', '无', '2018-03-12 09:09:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1394', '6711', '2', '血常规,血,1', '无', '无', '无', '2018-03-12 09:09:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1395', '6711', '2', '生化筛查,血,1', '无', '无', '无', '2018-03-12 09:09:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1396', '6711', '2', '肌钙蛋白I,血,1', '无', '无', '无', '2018-03-12 09:09:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1397', '6712', '1', '心电,动态心电图,心电图', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1398', '6712', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1399', '6712', '2', '血常规,血,1', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1400', '6712', '2', '凝血酶全套,血,1', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1401', '6712', '2', '肝功能常规,血,1', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1402', '6712', '2', '血脂全套,血,1', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1403', '6712', '2', '电解质筛查,血,1', '无', '无', '无', '2018-03-12 09:57:25', null, null, null, null, null, '2', '0');
INSERT INTO `report` VALUES ('1404', '6718', '1', '心电,动态心电图,心电图', '无', '无', '无', '2018-03-13 09:13:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1405', '6718', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-03-13 09:13:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1406', '6718', '1', '心电,动态心电图,心电图', '无', '无', '无', '2018-03-13 09:13:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1407', '6718', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-03-13 09:13:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1408', '6719', '1', '心电,动态心电图,心电图', '无', '无', '无', '2018-03-13 09:45:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1409', '6719', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-03-13 09:45:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1410', '6719', '1', '心电,动态心电图,心电图', '2018-03-13 10:00', '无', '无', '2018-03-13 09:45:06', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1411', '6719', '1', '心电,常规心电图,心电图', '2018-03-13 10:00', '无', '无', '2018-03-13 09:45:06', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1412', '6724', '1', '心电,动态心电图,心电图', '2018-03-14 10:45', '无', '无', '2018-03-13 10:41:40', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1413', '6724', '1', '心电,常规心电图,心电图', '2018-03-14 10:50', '无', '无', '2018-03-13 10:41:40', null, null, null, null, null, '1', '0');
INSERT INTO `report` VALUES ('1414', '6729', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-03-13 11:10:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1415', '6729', '1', '心电,动态心电图,心电图', '无', '无', '无', '2018-03-13 11:10:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1416', '6739', '1', '心电,动态心电图,心电图', '无', '无', '无', '2018-03-19 10:12:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1417', '6739', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-03-19 10:12:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1418', '6739', '1', 'ES,胃镜检查,胃镜', '无', '无', '无', '2018-03-19 10:12:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1419', '6739', '2', '血常规,血,1', '无', '无', '无', '2018-03-19 10:12:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1420', '6755', '1', 'PS,体液细胞学检查与诊断,病理', '无', '无', '无', '2018-03-23 09:37:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1421', '6755', '2', '巨细胞IgM,引流液,1', '无', '无', '无', '2018-03-23 09:37:12', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1422', '6780', '1', 'X线造影,小造影,瘘（窦）道造影', '无', '无', '无', '2018-03-25 14:00:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1423', '6780', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-03-25 14:00:50', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1424', '6784', '1', 'X线造影,妇科,双侧子宫输卵管造影', '无', '无', '无', '2018-03-25 14:07:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1425', '6784', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-03-25 14:07:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1426', '6792', '1', 'X线造影,小造影,经皮选择性静脉造影术', '无', '无', '无', '2018-03-25 15:01:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1427', '6792', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-03-25 15:01:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1428', '6806', '1', 'X线造影,局部血管造影,经皮选择性静脉造影术', '无', '无', '无', '2018-03-25 16:15:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1429', '6806', '2', '一般细菌培养及鉴定＋药敏（精液）（门诊）,引流液,1', '无', '无', '无', '2018-03-25 16:15:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1430', '6808', '1', 'X线造影,胆系,T管造影', '无', '无', '无', '2018-03-25 16:23:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1431', '6808', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-03-25 16:23:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1432', '6813', '1', 'X线造影,妇科,双侧子宫输卵管造影', '无', '无', '无', '2018-03-25 16:49:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1433', '6813', '2', '肿瘤细胞化疗药物敏感试验(紫杉醇)(1/8PPC),引流液,1', '无', '无', '无', '2018-03-25 16:49:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1434', '6905', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-04-09 16:21:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1435', '6905', '2', '检验科细菌室结核感染T细胞检测-M,引流液,1', '无', '无', '无', '2018-04-09 16:21:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1436', '6908', '1', '病理,病理,病理科胃肠镜标本活检病理诊断-M', '无', '无', '无', '2018-04-09 17:25:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1437', '6908', '2', '检验科细菌室结核感染T细胞检测-M,引流液,1', '无', '无', '无', '2018-04-09 17:25:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1438', '6909', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-04-10 13:30:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1439', '6909', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-04-10 13:30:18', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1440', '6916', '1', '病理,病理,病理科胃肠镜标本活检病理诊断-M', '无', '无', '无', '2018-04-11 14:54:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1441', '6916', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,精液,1', '无', '无', '无', '2018-04-11 14:54:15', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1442', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-09 10:00:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1443', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-09 10:00:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1444', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-09 10:02:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1445', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-09 10:02:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1446', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-09 10:11:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1447', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-09 10:11:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1448', '7190', '2', '输血定型', '无', '无', '无', '2018-05-09 10:12:16', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1449', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:02:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1450', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:02:56', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1451', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:02:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1452', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:02:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1453', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1454', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1455', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1456', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1457', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1458', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1459', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:03:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1460', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:03:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1461', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:03:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1462', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:03:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1463', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:03:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1464', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:03:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1465', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 09:06:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1466', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 09:06:06', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1467', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 15:00:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1468', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 15:00:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1469', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 16:26:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1470', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 16:26:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1471', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 16:26:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1472', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 16:26:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1473', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 16:40:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1474', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 16:40:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1475', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 18:57:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1476', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 18:57:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1477', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-10 18:57:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1478', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-10 18:57:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1479', '7211', '1', 'ＣＴ,头颅CT,CT上颌部平扫-M', '无', '无', '无', '2018-05-11 20:23:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1480', '7211', '2', '血液实验室淋巴细胞亚群检测(CD64index)-M,精液,1', '无', '无', '无', '2018-05-11 20:23:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1481', '7211', '1', 'ＣＴ,头颅CT,CT上颌部平扫-M', '无', '无', '无', '2018-05-11 20:24:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1482', '7211', '2', '血液实验室淋巴细胞亚群检测(CD64index)-M,精液,1', '无', '无', '无', '2018-05-11 20:24:17', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1483', '7211', '1', 'ＣＴ,头颅CT,CT上颌部平扫-M', '无', '无', '无', '2018-05-11 20:24:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1484', '7211', '2', '血液实验室淋巴细胞亚群检测(CD64index)-M,精液,1', '无', '无', '无', '2018-05-11 20:24:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1485', '7238', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-11 21:12:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1486', '7238', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-11 21:15:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1487', '7238', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-11 21:16:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1488', '7238', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-11 21:16:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1489', '7238', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-11 21:53:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1490', '7240', '1', '超声,介入超声,超声-彩超引导下穿刺活检术≤60＇取细胞-M', '无', '无', '无', '2018-05-13 09:49:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1491', '7240', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-13 09:49:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1492', '7240', '1', '超声,介入超声,超声-彩超引导下穿刺活检术≤60＇取细胞-M', '无', '无', '无', '2018-05-13 13:37:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1493', '7240', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-13 13:37:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1494', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-14 15:17:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1495', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-14 15:17:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1496', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-14 15:37:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1497', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-14 15:37:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1498', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-14 20:42:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1499', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-14 20:42:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1500', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 10:35:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1501', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 10:35:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1502', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 10:35:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1503', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 10:35:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1504', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:24:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1505', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:24:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1506', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:27:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1507', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:27:11', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1508', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:27:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1509', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:27:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1510', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:28:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1511', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:28:08', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1512', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:29:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1513', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:29:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1514', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:29:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1515', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:29:42', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1516', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-15 11:29:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1517', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-15 11:29:53', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1518', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-16 10:20:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1519', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-16 10:20:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1520', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 13:58:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1521', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 13:58:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1522', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 13:59:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1523', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 13:59:00', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1524', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 14:17:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1525', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 14:17:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1526', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 14:17:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1527', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 14:17:24', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1528', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 15:02:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1529', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 15:02:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1530', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 15:09:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1531', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 15:09:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1532', '7246', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 15:15:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1533', '7246', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 15:15:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1534', '7321', '2', '01快速血糖,分泌物,1', '无', '无', '无', '2018-05-16 15:30:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1535', '7325', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-05-16 16:56:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1536', '7325', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-05-16 16:56:33', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1537', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-17 09:48:09', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1538', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-17 09:48:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1539', '7189', '1', 'CT检查,放射科检查--CT检查', '', '', '无', '2018-05-17 10:04:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1540', '7189', '2', '红细胞沉降率测定(ESR)', '无', '无', '无', '2018-05-17 10:04:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1541', '7365', '1', 'X线摄影,胸部,胸部正侧位', '无', '无', '无', '2018-05-22 10:16:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1542', '7365', '2', '01血常规（三分类）,血,1', '无', '无', '无', '2018-05-22 10:16:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1543', '7371', '1', 'CT检查,头部,CT头颅外伤', '无', '无', '无', '2018-05-22 11:32:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1544', '7371', '1', '超声检查,腹部,肝胆脾胰', '无', '无', '无', '2018-05-22 11:32:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1545', '7371', '2', '02尿常规,尿,1', '无', '无', '无', '2018-05-22 11:32:10', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1546', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 10:50:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1547', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 11:17:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1548', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 11:32:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1549', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 11:34:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1550', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 11:35:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1551', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 11:42:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1552', '7427', '2', 'IgM等测定,血,1', '无', '无', '无', '2018-05-30 11:43:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1553', '7437', '1', '超声检查,浅表,涎腺＋颈部淋巴结', '无', '无', '无', '2018-05-31 15:40:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1554', '7437', '2', '血清维生素测定,其他,1', '无', '无', '无', '2018-05-31 15:40:48', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1555', '7437', '1', '超声检查,浅表,涎腺＋颈部淋巴结', '无', '无', '无', '2018-05-31 15:46:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1556', '7437', '2', '血清维生素测定,其他,1', '无', '无', '无', '2018-05-31 15:46:20', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1557', '7438', '1', '传染科超声检查,浅表,腹股沟淋巴结', '无', '无', '无', '2018-05-31 15:58:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1558', '7438', '2', '血清维生素测定,尿,1', '无', '无', '无', '2018-05-31 15:58:27', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1559', '7438', '1', '传染科超声检查,浅表,腹股沟淋巴结', '无', '无', '无', '2018-05-31 16:00:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1560', '7438', '2', '血清维生素测定,尿,1', '无', '无', '无', '2018-05-31 16:00:58', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1561', '7442', '1', 'PS,印记杂交技术,病理', '无', '无', '无', '2018-06-01 14:14:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1562', '7442', '2', '结核杆菌快速液体药敏检测,白带,1', '无', '无', '无', '2018-06-01 14:14:47', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1563', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1564', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1565', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1566', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1567', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1568', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1569', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1570', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1571', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1572', '7443', '1', '脑电,多发性周围神经病,肌电图', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1573', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1574', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1575', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1576', '7443', '2', '结核杆菌X-PERT基因检测,尿,1', '无', '无', '无', '2018-06-01 14:27:43', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1577', '7444', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-06-01 14:42:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1578', '7444', '2', '结核杆菌快速液体药敏检测,尿,1', '无', '无', '无', '2018-06-01 14:42:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1579', '7444', '1', '心电,常规心电图,心电图', '无', '无', '无', '2018-06-01 14:56:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1580', '7444', '2', '结核杆菌快速液体药敏检测,尿,1', '无', '无', '无', '2018-06-01 14:56:03', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1581', '7446', '1', 'PS,胸水的细胞学检查与诊断,病理', '无', '无', '无', '2018-06-01 14:59:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1582', '7446', '2', '结核杆菌X-PERT基因检测,白带,1', '无', '无', '无', '2018-06-01 14:59:32', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1583', '7464', '1', '心电,床边心电图,心电图', '无', '无', '无', '2018-06-04 14:55:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1584', '7464', '2', '结核杆菌基因芯片菌种鉴定及耐药基因检测,白带,1', '无', '无', '无', '2018-06-04 14:55:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1585', '7464', '1', '心电,床边心电图,心电图', '无', '无', '无', '2018-06-04 14:58:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1586', '7464', '2', '结核杆菌基因芯片菌种鉴定及耐药基因检测,白带,1', '无', '无', '无', '2018-06-04 14:58:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1587', '7464', '1', '心电,床边心电图,心电图', '无', '无', '无', '2018-06-04 15:00:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1588', '7464', '2', '结核杆菌基因芯片菌种鉴定及耐药基因检测,白带,1', '无', '无', '无', '2018-06-04 15:00:14', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1589', '7473', '1', '心电,床边心电图,心电图', '无', '无', '无', '2018-06-04 16:39:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1590', '7473', '2', '结核杆菌快速液体药敏检测,血,1', '无', '无', '无', '2018-06-04 16:39:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1591', '7487', '1', '心电图检查,心脏,动态心电图', '无', '无', '无', '2018-06-05 14:36:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1592', '7487', '2', '荧光染色体原位杂交检查/AML-ETO,分泌物,1', '无', '无', '无', '2018-06-05 14:36:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1593', '7487', '1', '心电图检查,心脏,动态心电图', '无', '无', '无', '2018-06-05 14:36:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1594', '7487', '2', '荧光染色体原位杂交检查/AML-ETO,分泌物,1', '无', '无', '无', '2018-06-05 14:36:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1595', '7499', '1', '功能性检查,肺通气功能检查,肺功能', '无', '无', '无', '2018-06-06 14:40:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1596', '7499', '2', '遗传性耳聋基因检测,血,1', '无', '无', '无', '2018-06-06 14:40:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1597', '7501', '1', '超声,软组织,超声科-(左,右,双)侧膝关节-M', '无', '无', '无', '2018-06-06 15:53:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1598', '7501', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-06 15:53:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1599', '7501', '1', '超声,软组织,超声科-(左,右,双)侧膝关节-M', '无', '无', '无', '2018-06-06 15:54:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1600', '7501', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-06 15:54:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1601', '7501', '1', '超声,软组织,超声科-(左,右,双)侧膝关节-M', '无', '无', '无', '2018-06-06 15:54:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1602', '7501', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-06 15:54:22', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1603', '7501', '1', '超声,软组织,超声科-(左,右,双)侧膝关节-M', '无', '无', '无', '2018-06-06 16:02:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1604', '7501', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-06 16:02:05', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1605', '7497', '1', '超声,浅表软组织,超声-(左侧、右侧)耳后软组织-M', '无', '无', '无', '2018-06-06 19:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1606', '7497', '2', '急诊科B型钠酸肽-M,白带,1', '无', '无', '无', '2018-06-06 19:03:07', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1607', '7515', '1', '超声,胃肠,超声-肠道(疝)-M', '无', '无', '无', '2018-06-07 14:06:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1608', '7515', '2', '检验科细菌室结核感染T细胞检测-M,引流液,1', '无', '无', '无', '2018-06-07 14:06:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1609', '7515', '1', '超声,胃肠,超声-肠道(疝)-M', '无', '无', '无', '2018-06-07 14:06:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1610', '7515', '2', '检验科细菌室结核感染T细胞检测-M,引流液,1', '无', '无', '无', '2018-06-07 14:06:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1611', '7516', '1', '病理,病理,病理科骨髓检查图象分析诊断-M', '无', '无', '无', '2018-06-07 14:52:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1612', '7516', '2', '检验科细菌室结核感染T细胞检测-M,分泌物,1', '无', '无', '无', '2018-06-07 14:52:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1613', '7516', '1', '病理,病理,病理科骨髓检查图象分析诊断-M', '无', '无', '无', '2018-06-07 14:52:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1614', '7516', '2', '检验科细菌室结核感染T细胞检测-M,分泌物,1', '无', '无', '无', '2018-06-07 14:52:44', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1615', '7516', '1', '病理,病理,病理科骨髓检查图象分析诊断-M', '无', '无', '无', '2018-06-07 14:53:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1616', '7516', '1', '病理,病理,病理科骨髓检查图象分析诊断-M', '无', '无', '无', '2018-06-07 14:53:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1617', '7516', '2', '检验科细菌室结核感染T细胞检测-M,分泌物,1', '无', '无', '无', '2018-06-07 14:53:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1618', '7516', '2', '检验科细菌室结核感染T细胞检测-M,分泌物,1', '无', '无', '无', '2018-06-07 14:53:37', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1619', '7524', '1', '超声,胸腔,超声-急诊胸腔积液(左、右、双侧)-M', '无', '无', '无', '2018-06-07 15:03:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1620', '7524', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-07 15:03:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1621', '7524', '1', '超声,胸腔,超声-急诊胸腔积液(左、右、双侧)-M', '无', '无', '无', '2018-06-07 15:04:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1622', '7524', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-07 15:04:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1623', '7525', '1', '核医学,吸碘及核素治疗,核医学科碘131治疗甲亢(≥10毫居里)-M', '无', '无', '无', '2018-06-07 15:30:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1624', '7525', '2', '检验科细菌室结核感染T细胞检测-M,白带,1', '无', '无', '无', '2018-06-07 15:30:34', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1625', '7525', '1', '核医学,吸碘及核素治疗,核医学科碘131治疗甲亢(≥10毫居里)-M', '无', '无', '无', '2018-06-07 15:42:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1626', '7525', '2', '检验科细菌室结核感染T细胞检测-M,白带,1', '无', '无', '无', '2018-06-07 15:42:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1627', '7532', '1', 'ＣＴ,头颈CT,CT眼部平扫-M', '无', '无', '无', '2018-06-08 14:47:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1628', '7532', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-08 14:47:49', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1629', '7579', '1', '病理,病理,病理科活检(活体组织病理图像分析诊断-M', '无', '无', '无', '2018-06-09 11:06:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1630', '7579', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,引流液,1', '无', '无', '无', '2018-06-09 11:06:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1631', '7775', '1', 'ＣＴ,胸部CT,CT心脏搭桥术后冠脉造影(双筒M.)-M', '无', '无', '无', '2018-06-26 10:12:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1632', '7775', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,血,1', '无', '无', '无', '2018-06-26 10:12:45', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1633', '7775', '1', 'ＣＴ,胸部CT,CT心脏搭桥术后冠脉造影(双筒M.)-M', '无', '无', '无', '2018-06-26 10:16:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1634', '7775', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,血,1', '无', '无', '无', '2018-06-26 10:16:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1635', '7775', '1', 'ＣＴ,胸部CT,CT心脏搭桥术后冠脉造影(双筒M.)-M', '无', '无', '无', '2018-06-26 10:18:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1636', '7775', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,血,1', '无', '无', '无', '2018-06-26 10:18:21', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1637', '7775', '1', 'ＣＴ,胸部CT,CT心脏搭桥术后冠脉造影(双筒M.)-M', '无', '无', '无', '2018-06-26 10:20:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1638', '7775', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,血,1', '无', '无', '无', '2018-06-26 10:20:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1639', '7775', '1', 'ＣＴ,胸部CT,CT心脏搭桥术后冠脉造影(双筒M.)-M', '无', '无', '无', '2018-06-26 10:21:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1640', '7775', '2', '血液实验室淋巴细胞亚群检测(相对计数)-M,血,1', '无', '无', '无', '2018-06-26 10:21:41', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1641', '7785', '1', 'ＣＴ,胸部CT,CT胸部平扫-M', '无', '无', '无', '2018-06-27 15:04:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1642', '7785', '2', '检验科门诊血常规-M,血,1', '无', '无', '无', '2018-06-27 15:04:31', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1643', '7825', '1', '超声检查,浅表,甲状腺＋颈部淋巴结', '无', '无', '无', '2018-07-04 10:02:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1644', '7825', '2', '02尿常规,尿,1', '无', '无', '无', '2018-07-04 10:02:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1645', '7825', '1', '超声检查,浅表,甲状腺＋颈部淋巴结', '无', '无', '无', '2018-07-04 10:02:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1646', '7825', '2', '02尿常规,尿,1', '无', '无', '无', '2018-07-04 10:02:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1647', '7875', '1', 'h,s,s', '无', '无', '无', '2018-07-09 13:51:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1648', '8002', '1', '传染科超声检查,浅表,体表包块', '无', '无', '无', '2018-07-24 15:24:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1649', '8002', '2', '02尿妊娠试验,脑脊液,1', '无', '无', '无', '2018-07-24 15:24:30', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1650', '8012', '1', 'X线造影,消化道,食道造影', '无', '无', '无', '2018-07-25 11:09:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1651', '8012', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-25 11:09:52', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1652', '8016', '1', 'X线造影,消化道,食道造影', '无', '无', '无', '2018-07-25 13:48:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1653', '8016', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-25 13:48:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1654', '10002', '1', 'X线造影,妇科,子宫输卵管造影', '无', '无', '无', '2018-07-25 16:34:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1655', '10002', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-25 16:34:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1656', '10003', '1', 'X线造影,消化道,食道造影', '无', '无', '无', '2018-07-25 16:49:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1657', '10003', '2', '01血常规（三分类）,静脉插管,1', '无', '无', '无', '2018-07-25 16:49:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1658', '10004', '1', 'X线造影,消化道,胃造影/上消化道造影', '无', '无', '无', '2018-07-25 16:53:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1659', '10004', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-25 16:53:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1660', '10006', '1', 'X线造影,消化道,胃造影/上消化道造影', '无', '无', '无', '2018-07-26 09:35:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1661', '10006', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-26 09:35:57', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1662', '8014', '1', 'CT,头,无', '无', '无', '无', '2018-07-26 09:36:54', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1663', '8014', '1', 'CT,头,无', '无', '无', '无', '2018-07-26 09:37:02', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1664', '10007', '1', 'MRI检查,颈部,MR颈部软组织平扫（3.0T）', '无', '无', '无', '2018-07-26 09:48:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1665', '10007', '2', '01血常规（三分类）,静脉插管,1', '无', '无', '无', '2018-07-26 09:48:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1666', '10016', '1', 'X线造影,消化道,胃造影/上消化道造影', '无', '无', '无', '2018-07-26 13:42:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1667', '10016', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-26 13:42:59', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1668', '10018', '1', 'X线造影,消化道,胃造影/上消化道造影', '无', '无', '无', '2018-07-26 14:24:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1669', '10018', '2', '01血常规（三分类）,拭子,1', '无', '无', '无', '2018-07-26 14:24:36', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1670', '10044', '1', 'PS,免疫组织化学染色诊断（单克隆）,病理', '无', '无', '无', '2018-07-31 09:30:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1671', '10044', '2', '维生素谱质谱法,血,1', '无', '无', '无', '2018-07-31 09:30:19', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1672', '10053', '1', 'ES,胃镜检查（无痛）,胃镜', '无', '无', '无', '2018-08-01 09:37:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1673', '10097', '1', '心电,心电图平板运动实验,心电图', '无', '无', '无', '2018-08-08 15:56:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1674', '10097', '2', '风疹病毒IgG,引流液,1', '无', '无', '无', '2018-08-08 15:56:25', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1675', '10097', '1', '心电,心电图平板运动实验,心电图', '无', '无', '无', '2018-08-08 15:56:38', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1676', '10097', '2', '风疹病毒IgG,引流液,1', '无', '无', '无', '2018-08-08 15:56:39', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1677', '10097', '1', '心电,心电图平板运动实验,心电图', '无', '无', '无', '2018-08-08 15:56:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1678', '10097', '2', '风疹病毒IgG,引流液,1', '无', '无', '无', '2018-08-08 15:56:40', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1679', '10101', '1', 'ES,胃镜检查（无痛）,胃镜', '无', '无', '无', '2018-08-08 16:28:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1680', '10101', '2', '维生素谱质谱法,咽拭子,1', '无', '无', '无', '2018-08-08 16:28:26', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1681', '10339', '2', '01快速血糖,拭子,1', '无', '无', '无', '2018-08-15 11:24:46', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1682', '10464', '1', '放射,Ｘ光,DR骶尾椎正侧位-M', '无', '无', '无', '2018-08-20 16:18:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1683', '10464', '2', '检验科生化室肝脏功能1-MC,血,1', '无', '无', '无', '2018-08-20 16:18:13', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1684', '10464', '1', '放射,Ｘ光,DR骶尾椎正侧位-M', '无', '无', '无', '2018-08-20 16:18:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1685', '10464', '2', '检验科生化室肝脏功能1-MC,血,1', '无', '无', '无', '2018-08-20 16:18:23', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1686', '10464', '1', '放射,Ｘ光,DR骶尾椎正侧位-M', '无', '无', '无', '2018-08-20 16:25:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1687', '10464', '2', '检验科生化室肝脏功能1-MC,血,1', '无', '无', '无', '2018-08-20 16:25:04', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1688', '10472', '1', '放射,钡剂造影,DR钡灌肠造影-M', '无', '无', '无', '2018-08-21 14:42:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1689', '10472', '2', '核医学科甲功5项-M,血,1', '无', '无', '无', '2018-08-21 14:42:55', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1690', '10472', '1', '放射,钡剂造影,DR钡灌肠造影-M', '无', '无', '无', '2018-08-21 14:43:01', null, null, null, null, null, '0', '0');
INSERT INTO `report` VALUES ('1691', '10472', '2', '核医学科甲功5项-M,血,1', '无', '无', '无', '2018-08-21 14:43:01', null, null, null, null, null, '0', '0');

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
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'user', '普通用户权限', '2018-11-29 15:27:13', '2018-11-29 15:27:16');
INSERT INTO `role` VALUES ('2', 'doctor', '普通医生权限', '2018-11-29 15:28:12', '2018-11-29 15:28:14');
INSERT INTO `role` VALUES ('3', 'userAdmin', '用户管理员', '2018-11-29 15:29:22', '2018-11-29 15:29:24');
INSERT INTO `role` VALUES ('4', 'doctorAdmin', '医生管理员', '2018-11-29 15:29:59', '2018-11-29 15:30:01');
INSERT INTO `role` VALUES ('5', 'superAdmin', '超级管理员', '2018-11-29 15:30:28', '2018-11-29 15:30:30');

-- ----------------------------
-- Table structure for schedule_department
-- ----------------------------
DROP TABLE IF EXISTS `schedule_department`;
CREATE TABLE `schedule_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_department
-- ----------------------------
INSERT INTO `schedule_department` VALUES ('1', '1', '1', '0', '0', '0', '1', '0', '30', '0', '0', '100', '0', '100', '2019-01-02', '2018-11-20 10:58:29', '2018-12-26 14:37:53');
INSERT INTO `schedule_department` VALUES ('2', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '100', '100', '0', '2019-01-02', '2018-11-21 11:26:13', '2018-11-21 11:26:16');
INSERT INTO `schedule_department` VALUES ('3', '3', '0', '0', '1', '0', '1', '0', '0', '12', '0', '0', '50', '50', '2019-01-03', '2018-11-26 09:20:03', '2019-01-02 14:54:08');

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
  `doctor_name` varchar(255) DEFAULT NULL COMMENT '医生姓名',
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
  `morning_call_no` int(11) DEFAULT NULL COMMENT '早上医生叫到几号',
  `afternoon_call_no` int(11) DEFAULT NULL COMMENT '医生下午叫到几号',
  `night_call_no` int(11) DEFAULT NULL COMMENT '晚上医生叫到几号',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_doctor
-- ----------------------------
INSERT INTO `schedule_doctor` VALUES ('1', '3', '3', '专家科室', '3', '专家1', '0', '1', '1', '2019-01-03', '0', '12', '0', '0', '50', '50', '9', '4', '0', '2018-11-26 09:16:54', '2019-01-02 14:56:36');
INSERT INTO `schedule_doctor` VALUES ('2', '1', '1', '普通科室', '1', '普通医生1', '1', '1', '1', '2019-01-02', '17', '0', '0', '50', '50', '50', '15', '0', '0', '2018-12-14 17:20:32', '2018-12-26 14:35:03');
INSERT INTO `schedule_doctor` VALUES ('3', '2', '2', '普通科室2', '2', '普通医生2', '1', '1', '1', '2019-01-02', '0', '0', '0', '50', '50', '50', '9', '0', '0', '2018-12-14 17:21:48', '2018-12-14 17:21:50');
INSERT INTO `schedule_doctor` VALUES ('4', '1', '1', '普通科室', '2', '普通医生2', '1', '1', '1', '2019-01-02', '17', '0', '0', '50', '50', '50', '9', '0', '0', '2018-12-18 10:11:25', '2018-12-29 16:06:15');

-- ----------------------------
-- Table structure for season_time
-- ----------------------------
DROP TABLE IF EXISTS `season_time`;
CREATE TABLE `season_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `type` int(11) DEFAULT NULL COMMENT '0 夏令时 1 冬令时',
  `start_date` varchar(16) DEFAULT NULL COMMENT '开始日期',
  `end_date` varchar(16) DEFAULT NULL COMMENT '结束日期',
  `morning_start` varchar(32) DEFAULT NULL COMMENT '早上开始时间',
  `morning_end` varchar(32) DEFAULT NULL COMMENT '早上结束时间',
  `afternoon_start` varchar(32) DEFAULT NULL COMMENT '下午开始时间',
  `afternoon_end` varchar(32) DEFAULT NULL COMMENT '下午结束时间',
  `night_start` varchar(32) DEFAULT NULL COMMENT '晚上开始时间',
  `night_end` varchar(32) DEFAULT NULL COMMENT '晚上结束时间',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of season_time
-- ----------------------------
INSERT INTO `season_time` VALUES ('1', '冬令时', '1', '10-01', '04-30', '08:00', '11:30', '13:00', '17:00', '18:00', '23:55', '2016-09-12 14:56:19', '2017-02-13 22:56:34');
INSERT INTO `season_time` VALUES ('2', '夏令时', '0', '05-01', '09-30', '08:00', '11:30', '13:30', '17:00', '18:30', '21:25', '2016-09-12 14:56:19', '2016-10-14 08:55:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '15868154074', '91a123b8ba35f02c0cb3e90563820030880d93ec97d8bc7d', null, null, null, null, '1', '2018-11-27 15:16:34', '2018-11-27 15:16:34');
INSERT INTO `user` VALUES ('3', '15868135219', 'e5849261ef9d489d37566361289d5067bb11999d0868a40a', null, null, null, null, '1', '2018-11-28 11:43:00', '2018-11-28 11:43:00');
INSERT INTO `user` VALUES ('4', '13777777771', '123456', null, null, null, null, '2', '2018-11-29 15:25:24', '2018-11-29 15:25:32');
INSERT INTO `user` VALUES ('5', '13777777772', '123456', null, null, null, null, '2', '2018-11-29 15:25:26', '2018-11-29 15:25:36');
INSERT INTO `user` VALUES ('6', '13777777773', '123456', null, null, null, null, '2', '2018-11-29 15:25:29', '2018-11-29 15:25:39');
INSERT INTO `user` VALUES ('8', '15868154012', 'f7446f84ef17a9c125e0219004648e25ed65a5f64991d645', null, null, null, null, '1', '2018-11-30 14:07:28', '2018-11-30 14:07:28');
INSERT INTO `user` VALUES ('9', '15868154079', 'c6906703085088a362f4127f197349b1db0008cd5e881b02', null, null, null, null, '1', '2018-12-06 13:31:33', '2018-12-06 13:31:33');
INSERT INTO `user` VALUES ('10', '15868151111', '55da22044653e3a168997d86f4515b62d11ab7ad7203f293', null, null, null, null, '4', '2018-12-29 13:50:59', '2018-12-29 13:50:59');

-- ----------------------------
-- Table structure for user_reservation
-- ----------------------------
DROP TABLE IF EXISTS `user_reservation`;
CREATE TABLE `user_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `patient_id` int(11) DEFAULT NULL COMMENT '就诊人id',
  `patient_name` varchar(32) DEFAULT NULL COMMENT '患者姓名',
  `schedule_department_id` int(11) DEFAULT NULL COMMENT '排班科室id',
  `schedule_doctor_id` int(11) DEFAULT NULL COMMENT '排班医生id',
  `type` int(5) DEFAULT NULL COMMENT ' 预约类型 1普通挂号 2普通预约 3 专家预约 ',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生id',
  `doctor_name` varchar(128) DEFAULT NULL COMMENT '医生姓名',
  `department_id` int(11) DEFAULT NULL COMMENT '科室id',
  `department_name` varchar(128) DEFAULT NULL COMMENT '科室名称',
  `reg_no` int(11) DEFAULT NULL COMMENT '就诊序号(对应医生就诊序号)',
  `clinic_time` varchar(128) DEFAULT NULL COMMENT '就诊时间,根据令时得出（12:00-18:00）',
  `clinic_date` varchar(128) DEFAULT NULL COMMENT '就诊日期',
  `time_interval` varchar(255) DEFAULT NULL COMMENT '预约时间段 上午  下午 晚上',
  `start_time` datetime DEFAULT NULL COMMENT '问诊开始时间',
  `finish_time` datetime DEFAULT NULL COMMENT '问诊结束时间',
  `status` int(11) DEFAULT '1' COMMENT '问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）',
  `condition_desc` text CHARACTER SET utf8mb4 COMMENT '病情描述',
  `error_msg` varchar(256) DEFAULT NULL COMMENT '取号返回的错误信息（预约/挂号）',
  `is_click` varchar(255) DEFAULT '0' COMMENT '是否被点击查看0未被，1已被点击',
  `is_evaluate` varchar(255) DEFAULT '0' COMMENT '是否评价，0未评价，1已评价',
  `clinic_pay_status` varchar(255) DEFAULT '0' COMMENT '挂号费支付状态',
  `recipe_pay_status` varchar(255) DEFAULT '0' COMMENT '处方支付状态 0未支付 1已支付',
  `clinic_price` varchar(10) DEFAULT NULL COMMENT '挂号费',
  `recipe_number` int(10) DEFAULT NULL COMMENT '问诊包含的处方单数量',
  `recipe_price` varchar(10) DEFAULT NULL COMMENT '处方费（所有处方的总费用）',
  `total_price` varchar(255) DEFAULT NULL COMMENT '总费用(挂号处方)',
  `is_audit` varchar(255) DEFAULT '0' COMMENT '处方是否审核  0未审核，1已审核',
  `audit_status` varchar(255) DEFAULT '1' COMMENT '处方审核状态 1不通过 2已通过',
  `is_read` varchar(255) DEFAULT '0' COMMENT '是否可以编辑处方 1可以 0不可以',
  `examine_fail_reason` varchar(512) DEFAULT NULL COMMENT '处方审核不通过的原因',
  `skip_reason` varchar(255) DEFAULT NULL COMMENT '医生设置过号的原因',
  `is_return_visit` varchar(2) DEFAULT '0' COMMENT '是否为复诊患者,0不是1是',
  `call_number_time` datetime DEFAULT NULL COMMENT '叫号时间',
  `repulse` varchar(10) DEFAULT '0' COMMENT '1拒绝退款，0未拒绝',
  `cancel_reason` varchar(512) DEFAULT NULL COMMENT '取消就诊原因',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `first_waitroom` varchar(10) DEFAULT '1' COMMENT '是否第一次进入候诊间 0不是 1是',
  `clinic_type` varchar(255) DEFAULT NULL COMMENT '诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）',
  `is_end` int(11) DEFAULT '0' COMMENT '是否已终止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_reservation
-- ----------------------------
INSERT INTO `user_reservation` VALUES ('57', '9', '18', '小红', '1', '2', '1', '1', '普通医生1', '1', '普通科室', '14', '08:00-11:30', '2018-12-24', '上午', null, null, '5', 'asdasfdaf', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-24 14:14:43', '2018-12-26 14:35:03');
INSERT INTO `user_reservation` VALUES ('58', '9', '18', '小红', '1', '4', '1', '2', '普通医生2', '1', '普通科室', '14', '08:00-11:30', '2018-12-24', '上午', null, null, '4', '32312312', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-24 16:18:18', '2018-12-24 16:18:18');
INSERT INTO `user_reservation` VALUES ('59', '9', '18', '小红', '1', '2', '1', '1', '普通医生1', '1', '普通科室', '15', '08:00-11:30', '2018-12-25', '上午', null, null, '4', 'dsfsadf', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-25 09:34:15', '2018-12-25 09:34:15');
INSERT INTO `user_reservation` VALUES ('60', '9', '18', '小红', '1', '4', '1', '2', '普通医生2', '1', '普通科室', '15', '08:00-11:30', '2018-12-25', '上午', null, null, '4', 'sadsd', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-25 10:23:36', '2018-12-25 10:23:36');
INSERT INTO `user_reservation` VALUES ('61', '9', '18', '小红', '3', '1', '3', '3', '专家1', '3', '专家科室', '11', '13:00-17:00', '2018-12-26', '下午', null, null, '4', '232', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-25 13:10:38', '2018-12-25 13:10:38');
INSERT INTO `user_reservation` VALUES ('62', '9', '18', '小红', '1', '2', '1', '1', '普通医生1', '1', '普通科室', '16', '08:00-11:30', '2018-12-25', '上午', null, null, '5', '232', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-25 14:28:42', '2018-12-25 17:14:51');
INSERT INTO `user_reservation` VALUES ('63', '9', '18', '小红', '1', '4', '1', '2', '普通医生2', '1', '普通科室', '16', '08:00-11:30', '2018-12-26', '上午', null, null, '4', 'czxcdsf', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2018-12-26 14:37:53', '2018-12-26 14:38:00');
INSERT INTO `user_reservation` VALUES ('64', '9', '18', '小红', '3', '1', '3', '3', '专家1', '3', '专家科室', '12', '13:00-17:00', '2019-01-03', '下午', null, null, '1', 'sadasdas', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2019-01-02 14:54:04', '2019-01-02 14:54:04');
INSERT INTO `user_reservation` VALUES ('65', '9', '18', '小红', '3', '1', '3', '3', '专家1', '3', '专家科室', '12', '13:00-17:00', '2019-01-03', '下午', null, null, '1', 'sadasdas', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2019-01-02 14:54:05', '2019-01-02 14:54:05');
INSERT INTO `user_reservation` VALUES ('66', '9', '18', '小红', '3', '1', '3', '3', '专家1', '3', '专家科室', '13', '13:00-17:00', '2019-01-03', '下午', null, null, '4', 'sadasdas', null, '0', '0', '0', '0', '0.00', null, null, null, '0', '1', '0', null, null, '0', null, '0', null, null, '1', null, '0', '2019-01-02 14:54:08', '2019-01-02 14:54:11');

-- ----------------------------
-- Table structure for user_reservation_img
-- ----------------------------
DROP TABLE IF EXISTS `user_reservation_img`;
CREATE TABLE `user_reservation_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_reservation_id` int(11) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_reservation_img
-- ----------------------------
INSERT INTO `user_reservation_img` VALUES ('1', '17', '57', null, null);
INSERT INTO `user_reservation_img` VALUES ('2', '18', '57', null, null);
INSERT INTO `user_reservation_img` VALUES ('3', '19', '57', null, null);
INSERT INTO `user_reservation_img` VALUES ('4', '21', '58', null, null);
INSERT INTO `user_reservation_img` VALUES ('5', '22', '59', null, null);
INSERT INTO `user_reservation_img` VALUES ('6', '23', '60', '2018-12-19 09:52:57', '2018-12-19 09:52:57');
INSERT INTO `user_reservation_img` VALUES ('7', '41', '61', '2018-12-20 09:20:23', '2018-12-20 09:20:23');
INSERT INTO `user_reservation_img` VALUES ('8', '41', '62', '2018-12-20 09:20:23', '2018-12-20 09:20:23');
INSERT INTO `user_reservation_img` VALUES ('9', '42', '63', '2018-12-20 09:45:14', '2018-12-20 09:45:14');
INSERT INTO `user_reservation_img` VALUES ('10', '42', '64', '2018-12-20 09:45:14', '2018-12-20 09:45:14');
INSERT INTO `user_reservation_img` VALUES ('11', '42', '65', '2018-12-20 09:45:14', '2018-12-20 09:45:14');
INSERT INTO `user_reservation_img` VALUES ('12', '42', '66', '2018-12-20 09:45:14', '2018-12-20 09:45:14');

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

-- ----------------------------
-- Records of user_reservation_status
-- ----------------------------
INSERT INTO `user_reservation_status` VALUES ('1', '已预约待支付', '2018-12-25 17:04:18', '2018-12-25 17:04:21');
INSERT INTO `user_reservation_status` VALUES ('2', '用户取消', '2018-12-25 17:04:18', '2018-11-19 17:04:26');
INSERT INTO `user_reservation_status` VALUES ('3', '超时支付取消', '2018-12-25 17:04:18', '2018-11-19 17:04:31');
INSERT INTO `user_reservation_status` VALUES ('4', '已付款等待视频', '2018-12-25 17:04:18', '2018-11-19 17:04:38');
INSERT INTO `user_reservation_status` VALUES ('5', '已付款已过号', '2018-12-25 17:04:18', '2018-11-19 17:04:43');
INSERT INTO `user_reservation_status` VALUES ('6', '申请退款中', '2018-12-25 17:04:18', '2018-11-19 17:04:48');
INSERT INTO `user_reservation_status` VALUES ('7', '已退款', '2018-11-19 17:04:50', '2018-11-19 17:04:53');
INSERT INTO `user_reservation_status` VALUES ('8', '拒绝退款', '2018-11-19 17:04:56', '2018-11-19 17:04:58');
INSERT INTO `user_reservation_status` VALUES ('9', '退款中', '2018-11-19 17:05:01', '2018-11-19 17:05:04');
INSERT INTO `user_reservation_status` VALUES ('10', '完成就诊待评价', '2018-11-19 17:05:08', '2018-11-19 17:05:10');
INSERT INTO `user_reservation_status` VALUES ('11', '已评价', '2018-11-19 17:05:13', '2018-11-19 17:05:16');
INSERT INTO `user_reservation_status` VALUES ('12', '就诊中', '2018-11-19 17:05:19', '2018-11-19 17:05:23');
INSERT INTO `user_reservation_status` VALUES ('13', '同意退款', '2018-11-19 17:05:25', '2018-11-19 17:05:27');
INSERT INTO `user_reservation_status` VALUES ('14', '历史未就诊', '2018-11-19 17:05:30', '2018-11-19 17:05:33');
INSERT INTO `user_reservation_status` VALUES ('15', '未审方', '2018-11-19 17:05:35', '2018-11-19 17:05:37');
INSERT INTO `user_reservation_status` VALUES ('16', '审方通过（患者未查看待取药）', '2018-11-19 17:05:40', '2018-11-19 17:05:42');
INSERT INTO `user_reservation_status` VALUES ('17', '未通过', '2018-11-19 17:05:46', '2018-11-19 17:05:49');
INSERT INTO `user_reservation_status` VALUES ('18', '患者已查看（待取药）', '2018-11-19 17:05:51', '2018-11-19 17:05:53');

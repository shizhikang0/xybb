/*
Navicat MySQL Data Transfer

Source Server         : MyConnection
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : xybb_db

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-05-22 22:47:54
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE database xybb_bb;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `detail` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品介绍',
  `type_id` int(2) DEFAULT '0' COMMENT '商品种类ID',
  `status` int(2) DEFAULT NULL COMMENT '商品状态（1：有货；0：无货）',
  `price` decimal(11,2) DEFAULT NULL,
  `original_price` decimal(11,2) DEFAULT NULL,
  `num` int(2) DEFAULT NULL COMMENT '商品件数',
  `picture1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片1',
  `picture2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'g_picture2',
  `picture3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'g_picture3',
  `page_views` int(8) DEFAULT NULL COMMENT '访问量',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '商品发布时间',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商品更改时间',
  PRIMARY KEY (`id`),
  KEY `fk_goods_type` (`type_id`),
  CONSTRAINT `fk_goods_type` FOREIGN KEY (`type_id`) REFERENCES `t_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:36', '2018-04-06 10:57:21');
INSERT INTO `t_goods` VALUES ('2', 'ThinkPad E520', '七成新，四核，6G运行内存，500G硬盘', '3', '1', '2000.00', '4899.00', '1', 'http://localhost:8089/xybb/static/images/shops/thinkpad520.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad521.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad522.jpg', '3', '2018-05-20 12:18:33', '2018-04-21 16:32:32');
INSERT INTO `t_goods` VALUES ('3', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:36', '2018-04-06 10:57:21');
INSERT INTO `t_goods` VALUES ('4', 'ThinkPad E520', '七成新，四核，6G运行内存，500G硬盘', '3', '1', '2000.00', '4899.00', '1', 'http://localhost:8089/xybb/static/images/shops/thinkpad520.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad521.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad522.jpg', '4', '2018-05-22 15:02:42', '2018-04-21 16:32:32');
INSERT INTO `t_goods` VALUES ('5', 'ThinkPad E520', '七成新，四核，6G运行内存，500G硬盘', '3', '1', '2000.00', '4899.00', '1', 'http://localhost:8089/xybb/static/images/shops/thinkpad520.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad521.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad522.jpg', '0', '2018-05-09 18:34:36', '2018-04-21 16:32:32');
INSERT INTO `t_goods` VALUES ('6', 'ThinkPad E520', '七成新，四核，6G运行内存，500G硬盘', '3', '1', '2000.00', '4899.00', '1', 'http://localhost:8089/xybb/static/images/shops/thinkpad520.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad521.jpg', 'http://localhost:8089/xybb/static/images/shops/thinkpad522.jpg', '0', '2018-05-09 18:34:36', '2018-04-21 16:32:32');
INSERT INTO `t_goods` VALUES ('7', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:36', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('8', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('9', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('10', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('11', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('12', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('13', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('14', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 18:34:40', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('15', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:02', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('16', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:03', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('17', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:05', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('18', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:15', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('19', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:15', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('20', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:15', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('21', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:20', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('22', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:20', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('23', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:20', '2018-04-22 11:44:11');
INSERT INTO `t_goods` VALUES ('24', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '21', '2018-05-11 09:42:44', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('25', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:20', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('26', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '1', '2018-05-16 17:29:07', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('27', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:25', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('28', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:25', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('29', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:25', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('30', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:25', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('31', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '1', '2018-05-09 18:33:55', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('32', '红米note3', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '0', '2018-05-09 17:54:25', '2018-04-22 11:44:12');
INSERT INTO `t_goods` VALUES ('33', 'iphone7', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/iphone701.jpg', 'http://localhost:8089/xybb/static/images/shops/iphone702.jpg', 'http://localhost:8089/xybb/static/images/shops/iphone703.jpg', '17', '2018-05-22 14:30:01', '2018-05-11 09:39:27');
INSERT INTO `t_goods` VALUES ('34', 'iphone7', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/iphone711.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '10', '2018-05-22 14:29:45', '2018-05-11 08:44:12');
INSERT INTO `t_goods` VALUES ('35', 'iphone6', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/iphone6.png', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '2', '2018-05-16 17:29:00', '2018-05-10 11:44:10');
INSERT INTO `t_goods` VALUES ('36', '小米2s', '八成新，指纹识别，无卡顿', '2', '1', '200.00', '1399.00', '1', 'http://localhost:8089/xybb/static/images/shops/xiaomi2.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote302.jpg', 'http://localhost:8089/xybb/static/images/shops/hongminote303.jpg', '4', '2018-05-22 14:29:46', '2018-05-11 05:44:12');
INSERT INTO `t_goods` VALUES ('43', '小提琴', '既然琴瑟起，何以笙箫默', '4', '1', '100.50', '500.50', '1', 'http://192.168.124.143/images/2018/05/20/74e5af754exiaotiqin1.jpg', 'http://192.168.124.143/images/2018/05/20/ba79967234xiaotiqin2.jpg', 'http://192.168.124.143/images/2018/05/20/07c4f10d31xiaotiqin3.jpg', '12', '2018-05-22 15:38:17', '2018-05-20 10:10:34');
INSERT INTO `t_goods` VALUES ('44', '吉他', '九成新，刚买两个月，音质非常好', '4', '1', '50.00', '199.00', '1', 'http://192.168.124.143/images/2018/05/20/bc097ce48bjita1.jpg', 'http://192.168.124.143/images/2018/05/20/cb7845bea7jita2.jpg', 'http://192.168.124.143/images/2018/05/20/4f436d9d3cjita3.jpg', '9', '2018-05-22 14:52:27', '2018-05-20 10:15:23');
INSERT INTO `t_goods` VALUES ('45', '自行车', '七成新，用过一年，没有损坏。车身轻巧。', '5', '1', '50.00', '200.00', '1', 'http://192.168.124.143/images/2018/05/20/e98b1a03c3bike1.jpg', 'http://192.168.124.143/images/2018/05/20/6b62e8a475bike2.jpg', 'http://192.168.124.143/images/2018/05/20/0877fe4964bike3.jpg', '3', '2018-05-22 14:09:57', '2018-05-20 10:17:13');

-- ----------------------------
-- Table structure for t_goods_buyer
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_buyer`;
CREATE TABLE `t_goods_buyer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `status` int(1) DEFAULT '1' COMMENT '购买状态（1：放入购物车；2：购买成功；3：取消购买）',
  `createtime` timestamp NULL DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_buyer` (`buyer_id`),
  KEY `fk_goods_buyer_goodsid` (`goods_id`),
  CONSTRAINT `fk_goods_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `fk_goods_buyer_goodsid` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_buyer
-- ----------------------------
INSERT INTO `t_goods_buyer` VALUES ('1', '36', '9', '3', '2018-05-21 20:10:29', '2018-05-22 14:33:27');
INSERT INTO `t_goods_buyer` VALUES ('2', '45', '9', '3', '2018-05-21 20:01:20', '2018-05-22 15:06:47');
INSERT INTO `t_goods_buyer` VALUES ('3', '43', '4', '1', '2018-05-21 20:12:58', '2018-05-21 20:12:58');
INSERT INTO `t_goods_buyer` VALUES ('4', '44', '9', '1', '2018-05-21 20:40:15', '2018-05-22 15:04:03');
INSERT INTO `t_goods_buyer` VALUES ('5', '33', '9', '3', '2018-05-21 20:40:27', '2018-05-22 14:33:27');
INSERT INTO `t_goods_buyer` VALUES ('8', '43', '9', '1', '2018-05-22 14:01:27', '2018-05-22 15:03:49');
INSERT INTO `t_goods_buyer` VALUES ('9', '33', '9', '3', '2018-05-22 14:01:28', '2018-05-22 14:33:27');

-- ----------------------------
-- Table structure for t_goods_seller
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_seller`;
CREATE TABLE `t_goods_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `status` int(1) DEFAULT '1' COMMENT '发布状态（1：待售；2：已销售；3：取消发布）',
  `createtime` timestamp NULL DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_seller` (`seller_id`),
  KEY `fk_goods_seller_goods` (`goods_id`),
  CONSTRAINT `fk_goods_seller` FOREIGN KEY (`seller_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `fk_goods_seller_goods` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_seller
-- ----------------------------
INSERT INTO `t_goods_seller` VALUES ('1', '1', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('2', '2', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('3', '3', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('4', '4', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('5', '5', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('6', '6', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('7', '7', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('8', '8', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('9', '9', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('10', '10', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('11', '11', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('12', '12', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('13', '13', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('14', '14', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('15', '15', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('16', '16', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('17', '17', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('18', '18', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('19', '19', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('20', '20', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('21', '21', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('22', '22', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('23', '23', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('24', '24', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('25', '25', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('26', '26', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('27', '27', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('28', '28', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('29', '29', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('30', '30', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('31', '31', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('32', '32', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('33', '33', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('34', '34', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('35', '35', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('36', '36', '1', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('41', '43', '7', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('42', '44', '7', '1', null, null);
INSERT INTO `t_goods_seller` VALUES ('43', '45', '7', '1', null, null);

-- ----------------------------
-- Table structure for t_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_type`;
CREATE TABLE `t_goods_type` (
  `id` int(11) NOT NULL COMMENT '商品种类ID',
  `name` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品种类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_goods_type
-- ----------------------------
INSERT INTO `t_goods_type` VALUES ('1', '书籍');
INSERT INTO `t_goods_type` VALUES ('2', '手机');
INSERT INTO `t_goods_type` VALUES ('3', '电脑');
INSERT INTO `t_goods_type` VALUES ('4', '乐器');
INSERT INTO `t_goods_type` VALUES ('5', '代步');
INSERT INTO `t_goods_type` VALUES ('6', '体育');
INSERT INTO `t_goods_type` VALUES ('7', '其它');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '用户类型（1：买家；2：卖家）',
  `name` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `sex` int(1) DEFAULT '1' COMMENT '1:男；2:女',
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '用户手机号',
  `address` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户地址',
  `head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autograph` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户注册时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户更改时间',
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`name`,`phone`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2', '时至康', '1', '46f1b49e120a9c5a68c300933b9ecc3e', '13166518517', '燕山大学东校区4舍626', 'http://localhost:8089/xybb/static/images/head/c04687411e424d4dae28f7f16d381a06shizhikang.jpg', '好好学习，天天向上', '2018-05-17 10:12:17', '2018-05-17 10:12:17', 'b1bb41b6ea3844c6bf158bbdbc7acd61');
INSERT INTO `t_user` VALUES ('2', '1', '李易霖', '1', '7dcbaaf0aa942637850e0bb23dc44264', '13166518518', '4舍626', null, null, '2018-05-21 20:43:12', '2018-04-06 10:51:18', '4bbf096a1e0d4789848d6c49d89726b7');
INSERT INTO `t_user` VALUES ('3', '1', '', '1', '88cd590646d382652201d811ee327935', '15512364562', null, null, null, '2018-05-10 21:31:58', '2018-05-10 21:31:58', '333255ddaf3f4d1cb229be4c9e26bf53');
INSERT INTO `t_user` VALUES ('4', '1', '乔峰', '1', '127841705a2f4e6ca3ceede680b7de91', '18814783935', '燕山大学东校区5舍626', 'http://localhost:8089/xybb/static/images/head/d598d32d808b4296ad7d97a76de399e017673fdsfs4.jpg', '我爱燕大', '2018-05-20 23:16:36', '2018-05-10 21:32:36', '3f3ea6a694454982be31fc236763431e');
INSERT INTO `t_user` VALUES ('7', '2', '聂风', '1', 'bb1df4d3cf650393e155a8f1ef38cc15', '15033579226', '燕大5舍222', 'http://localhost:8089/xybb/static/images/head/6bb15b0c7a7c4cd097f794c810498c19002f.jpg', '天天向上孤鸿寡鹄', '2018-05-19 16:02:52', '2018-05-19 16:02:52', '5c3da95a94ae4009b4a7a35582961e2b');
INSERT INTO `t_user` VALUES ('8', '1', '', '1', '389c8ac90b4fcea261cb314c3eb27f07', '13978997899', null, null, null, '2018-05-17 02:19:46', '2018-05-17 02:19:46', '1d886e2d49ff47bd9570df1eda7ff3bc');
INSERT INTO `t_user` VALUES ('9', '1', '步惊云', '1', 'e5f3913aa728f2831e189a47d7a701a6', '18068613849', '燕大东校区4舍233', 'http://localhost:8089/xybb/static/images/head/946084450b5d4fddad5472ce530eb7c217673fdsfs4.jpg', '我自横刀向天笑', '2018-05-17 08:55:53', '2018-05-17 08:28:17', '2c8d37f5759f4e50b3ada26406b81721');

-- ----------------------------
-- Procedure structure for test_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_insert`()
begin
declare i int default 7;
while i < 37 do
insert  into `t_goods`
(`id`,`name`,`detail`,`type_id`,`status`,`price`,`num`,`picture1`,`picture2`,`picture3`,`seller_id`,`buyer_id`,`createtime`,`updatetime`) 
values (i,'红米note3','八成新，指纹识别，无卡顿',2,1,200,1,'http://localhost:8089/xybb/static/images/shops/hongminote301.jpg','http://localhost:8089/xybb/static/images/shops/hongminote302.jpg','http://localhost:8089/xybb/static/images/shops/hongminote303.jpg',2,NULL,now(),now());
set i=i+1;
End while;
End
;;
DELIMITER ;

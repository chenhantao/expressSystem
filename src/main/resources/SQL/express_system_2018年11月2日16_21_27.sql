/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : express_system

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-11-02 16:21:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base
-- ----------------------------
INSERT INTO `base` VALUES ('1', 'root', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('2', 'utest', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('3', 'ctest', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('4', 'stest', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('5', 'utest2', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('6', 'ctest2', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('7', 'stest2', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('8', 'uchenhantao', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('9', 'uchenhantao1', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('10', 'u18034830302', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('11', 'u1234', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('12', 'ucht', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('13', 'ucht1', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('14', 'uchtchenhantao', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('15', 'schen', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO `base` VALUES ('16', 'serror', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO `base` VALUES ('19', 'schenhantao', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('20', 'schenhantao1', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('21', 'schenhantao2', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('22', 'uchenhantao2', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO `base` VALUES ('23', 'cchenhantao', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('24', 'cchenhantao1', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('25', 'szhaoyijun', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('26', 'cwanglaoshi', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('27', 'cnewtest', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('28', 'cyanshi', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `base` VALUES ('29', 'cyuzhongqu', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO `base` VALUES ('30', 'syanshikuaidizhan', '25d55ad283aa400af464c76d713c07ad');

-- ----------------------------
-- Table structure for courier
-- ----------------------------
DROP TABLE IF EXISTS `courier`;
CREATE TABLE `courier` (
  `courier_id` int(11) NOT NULL,
  `courier_name` varchar(255) DEFAULT NULL,
  `courier_phone` varchar(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `station_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`courier_id`),
  CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier
-- ----------------------------
INSERT INTO `courier` VALUES ('3', 'test1', '18034830302', '重庆市', '重庆市', '沙坪坝区', null, '19');
INSERT INTO `courier` VALUES ('6', 'test', '18034830302', '重庆市', '重庆市', '沙坪坝区', null, '19');
INSERT INTO `courier` VALUES ('8', 'test', '18034830202', '重庆市', '重庆市', '江北区', null, '19');
INSERT INTO `courier` VALUES ('9', 'test', '18034830202', '重庆市', '重庆市', '江北区', null, '25');
INSERT INTO `courier` VALUES ('23', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', null, '19');
INSERT INTO `courier` VALUES ('24', '陈瀚涛', '18034830302', '四川省', '成都市', '温江区', null, '20');
INSERT INTO `courier` VALUES ('26', '陈瀚涛', '18034830302', '重庆市', '重庆市', '江北区', null, '25');
INSERT INTO `courier` VALUES ('27', 'cht', '18034830302', '天津市', '天津市', '河西区', null, '0');
INSERT INTO `courier` VALUES ('28', '张三', '18034830302', '重庆市', '重庆市', '江北区', null, '25');
INSERT INTO `courier` VALUES ('29', '渝中区快递员', '13002020202', '重庆市', '重庆市', '渝中区', null, '21');

-- ----------------------------
-- Table structure for courier_order
-- ----------------------------
DROP TABLE IF EXISTS `courier_order`;
CREATE TABLE `courier_order` (
  `courier_id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `salary` double(10,2) DEFAULT '0.00',
  `order_state` tinyint(4) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courier_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier_order
-- ----------------------------
INSERT INTO `courier_order` VALUES ('6', '20180522232750525479', '0.00', '0', '2018-05-28 02:04:46');
INSERT INTO `courier_order` VALUES ('23', '20180522232750525479', '0.00', '0', '2018-05-27 01:44:17');
INSERT INTO `courier_order` VALUES ('23', '20180522234142134125', '0.00', '0', '2018-05-28 02:05:19');
INSERT INTO `courier_order` VALUES ('23', '20180523130213226433', '6.25', '1', '2018-05-27 05:02:40');
INSERT INTO `courier_order` VALUES ('23', '20180528135845313861', '3.00', '1', '2018-05-28 02:01:59');
INSERT INTO `courier_order` VALUES ('23', '20180531151641969242', '0.00', '0', '2018-05-31 03:19:02');
INSERT INTO `courier_order` VALUES ('24', '20180523130213226433', '6.25', '1', '2018-05-27 05:57:06');
INSERT INTO `courier_order` VALUES ('26', '20180528135845313861', '3.00', '1', '2018-05-28 02:17:39');

-- ----------------------------
-- Table structure for kotlin
-- ----------------------------
DROP TABLE IF EXISTS `kotlin`;
CREATE TABLE `kotlin` (
  `id` bigint(20) NOT NULL,
  `account` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kotlin
-- ----------------------------
INSERT INTO `kotlin` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `order_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_phone` varchar(11) NOT NULL,
  `sender_province` varchar(255) NOT NULL,
  `sender_city` varchar(255) NOT NULL,
  `sender_area` varchar(255) NOT NULL,
  `sender_addr` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_phone` varchar(11) NOT NULL,
  `recipient_province` varchar(255) NOT NULL,
  `recipient_city` varchar(255) NOT NULL,
  `recipient_area` varchar(255) NOT NULL,
  `recipient_addr` varchar(255) NOT NULL,
  `kind` varchar(255) NOT NULL,
  `weight` double(10,2) NOT NULL DEFAULT '0.00',
  `money` double(10,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `logistics_state` varchar(255) DEFAULT NULL,
  `current_province` varchar(255) NOT NULL,
  `current_city` varchar(255) NOT NULL,
  `current_area` varchar(255) NOT NULL,
  `current_station` varchar(255) DEFAULT NULL,
  `current_courier` varchar(255) DEFAULT NULL,
  `next_province` varchar(255) DEFAULT NULL,
  `next_city` varchar(255) DEFAULT NULL,
  `next_area` varchar(255) DEFAULT NULL,
  `pay_state` tinyint(4) NOT NULL DEFAULT '0',
  `order_state` tinyint(4) NOT NULL DEFAULT '0',
  `transport_state` tinyint(4) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('20180516041224246374', '2', '陈瀚涛', '18034830302', '重庆市', '重庆市', '渝北区', '沙坪坝区', '陈瀚涛', '18034830302', '四川省', '成都市', '青羊区', '西南财经大学', '文件', '0.10', '20.00', null, null, '重庆市', '重庆市', '沙坪坝区', null, null, null, null, null, '1', '0', '1', '2018-05-16 04:12:24');
INSERT INTO `orderlist` VALUES ('20180522232750525479', '8', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区重庆大学A区', '陈瀚涛', '18034830302', '重庆市', '重庆市', '江北区', '重庆大学', '小件', '2.00', '12.00', '1231', 'null-', '重庆市', '重庆市', '江北区', '江北', 'test', '', '', '', '1', '0', '1', '2018-05-22 11:27:50');
INSERT INTO `orderlist` VALUES ('20180522233831991993', '8', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区重庆大学A区', '陈瀚涛', '18034830302', '重庆市', '重庆市', '渝中区', '重庆大学', '小件', '2.00', '12.00', '12321', null, '重庆市', '重庆市', '沙坪坝区', null, null, null, null, null, '1', '0', '0', '2018-05-22 11:38:31');
INSERT INTO `orderlist` VALUES ('20180522234142134125', '8', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区重庆大学A区', '陈瀚涛', '18034830302', '四川省', '成都市', '青羊区', '四川大学', '小件', '2.00', '25.00', '3213', null, '重庆市', '重庆市', '沙坪坝区', '重庆大学快递站', '陈瀚涛', '', '', '', '1', '0', '1', '2018-05-22 11:41:42');
INSERT INTO `orderlist` VALUES ('20180523130213226433', '8', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区重庆大学A区', '陈瀚涛', '18034830302', '四川省', '成都市', '温江区', '西南财经大学', '小件', '2.00', '25.00', '无', '快递员已取件-已发往四川省成都市温江区-订单已完成-', '四川省', '成都市', '温江区', '四川大学快递站', '陈瀚涛', '', '', '', '1', '1', '1', '2018-05-23 01:02:13');
INSERT INTO `orderlist` VALUES ('20180528135845313861', '8', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', '重庆大学A区', '卢轲毅', '11111111111', '重庆市', '重庆市', '江北区', '重庆大学渝中分区', '小件', '2.00', '12.00', '', '快递员已接单，准备送往江北-dddddd-订单已完成-', '重庆市', '重庆市', '江北区', '江北', '陈瀚涛', '', '', '', '1', '1', '1', '2018-05-28 01:58:45');
INSERT INTO `orderlist` VALUES ('20180531151641969242', '8', '陈瀚涛', '18034830302', '重庆市', '重庆市', '沙坪坝区', '重庆大学A区', '王老师', '18034830302', '重庆市', '重庆市', '江北区', '重庆大学江北分区', '小件', '3.00', '14.00', '无', '快递员已取件-', '重庆市', '重庆市', '沙坪坝区', '重庆大学快递站', '陈瀚涛', '', '', '', '1', '0', '1', '2018-05-31 03:16:41');

-- ----------------------------
-- Table structure for place_price
-- ----------------------------
DROP TABLE IF EXISTS `place_price`;
CREATE TABLE `place_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `p_level` int(10) NOT NULL,
  `c_level` int(10) NOT NULL,
  `a_level` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of place_price
-- ----------------------------
INSERT INTO `place_price` VALUES ('1', '重庆市', '重庆市', '沙坪坝区', '1', '1', '1');
INSERT INTO `place_price` VALUES ('2', '重庆市', '重庆市', '渝中区', '1', '1', '2');
INSERT INTO `place_price` VALUES ('3', '重庆市', '重庆市', '江北区', '1', '1', '3');
INSERT INTO `place_price` VALUES ('4', '四川省', '成都市', '青羊区', '2', '1', '1');
INSERT INTO `place_price` VALUES ('5', '四川省', '成都市', '温江区', '2', '1', '2');
INSERT INTO `place_price` VALUES ('6', '四川省', '攀枝花市', '东区', '2', '2', '1');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `station_state` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`station_id`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('4', null, null, null, '', null, null, null, '1');
INSERT INTO `station` VALUES ('7', null, null, null, '', null, null, null, '1');
INSERT INTO `station` VALUES ('15', '重庆大学快递站', null, null, '', '', '陈瀚涛', '18034830302', '1');
INSERT INTO `station` VALUES ('16', '', null, null, '', '', '', '', '1');
INSERT INTO `station` VALUES ('19', '重庆大学快递站', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区重庆大学A区11舍', '陈瀚涛', '18034830302', '1');
INSERT INTO `station` VALUES ('20', '四川大学快递站', '四川省', '成都市', '温江区', '四川大学', '陈瀚涛', '18034830302', '1');
INSERT INTO `station` VALUES ('21', '渝中区快递站', '重庆市', '重庆市', '渝中区', '渝中区', '陈瀚涛', '18034830302', '1');
INSERT INTO `station` VALUES ('25', '江北区快递站', '重庆市', '重庆市', '江北区', '重庆市江北区重庆大学A区', '陈瀚涛', '18034830302', '1');
INSERT INTO `station` VALUES ('30', '演示的快递站', '辽宁省', '丹东市', '振安区', '演示地址', '负责人', '18034830302', '1');

-- ----------------------------
-- Table structure for station_order
-- ----------------------------
DROP TABLE IF EXISTS `station_order`;
CREATE TABLE `station_order` (
  `station_id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `salary` double(10,2) DEFAULT '0.00',
  `order_state` tinyint(4) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`station_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_order
-- ----------------------------
INSERT INTO `station_order` VALUES ('19', '20180522232750525479', '0.00', '0', '2018-05-25 06:05:33');
INSERT INTO `station_order` VALUES ('19', '20180522234142134125', '0.00', '0', '2018-05-26 04:39:30');
INSERT INTO `station_order` VALUES ('19', '20180523130213226433', '6.25', '1', '2018-05-27 05:02:11');
INSERT INTO `station_order` VALUES ('19', '20180528135845313861', '3.00', '1', '2018-05-28 02:00:26');
INSERT INTO `station_order` VALUES ('19', '20180531151641969242', '0.00', '0', '2018-05-31 03:18:19');
INSERT INTO `station_order` VALUES ('20', '20180523130213226433', '6.25', '1', '2018-05-27 05:53:32');
INSERT INTO `station_order` VALUES ('25', '20180522232750525479', '0.00', '0', '2018-05-27 02:29:16');
INSERT INTO `station_order` VALUES ('25', '20180528135845313861', '3.00', '1', '2018-05-28 02:08:03');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(16) DEFAULT NULL,
  `user_real_name` varchar(16) DEFAULT NULL,
  `phone_num` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `addr3` varchar(255) DEFAULT NULL,
  `history_addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('5', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('8', 'chenhantao', '陈瀚涛', '18034830302', '372101345@qq.com', null, '重庆大学A区', '重庆大学aabd区', '', '重庆大学江北分区');
INSERT INTO `user` VALUES ('9', 'chenhantao', '陈瀚涛', '18034830302', '372101345@qq.com', null, '重庆大学A区', '重庆大学BBB区', '', null);
INSERT INTO `user` VALUES ('10', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('11', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('12', 'cht', 'ccht', '18034830302', '372101345@qq.com', null, '重庆大学', null, null, null);
INSERT INTO `user` VALUES ('13', '1234', '1234', '18034830302', '372101345@qq.com', null, '重庆大学', null, null, null);
INSERT INTO `user` VALUES ('14', '陈瀚涛', 'cht', '18034830302', '32@qq.com', null, '重庆大学 ', null, null, null);
INSERT INTO `user` VALUES ('22', '陈瀚涛', '陈瀚涛', '18034830302', '372101345@qq.com', null, '重庆市沙坪坝区重庆大学A区', null, null, null);
DROP TRIGGER IF EXISTS `add`;
DELIMITER ;;
CREATE TRIGGER `add` AFTER INSERT ON `base` FOR EACH ROW begin
    if(new.account like "c%") then
       insert into courier(courier_id) values(new.id);
    else if(new.account like "u%") then
       insert into user(user_id) values(new.id);
    else if(new.account like "s%") then
       insert into station(station_id) values(new.id);
    end if;
    end if;
    end if;
end
;;
DELIMITER ;

/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : express_system

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-05-16 03:19:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base`
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `courier`
-- ----------------------------
DROP TABLE IF EXISTS `courier`;
CREATE TABLE `courier` (
  `courier_id` int(11) NOT NULL,
  `courier_name` varchar(255) DEFAULT NULL,
  `courier_phone` varchar(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`courier_id`),
  CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier
-- ----------------------------
INSERT INTO `courier` VALUES ('3', null, null, null, null, null, null);
INSERT INTO `courier` VALUES ('6', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `courier_order`
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

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_phone` varchar(255) NOT NULL,
  `sender_province` varchar(255) NOT NULL,
  `sender_city` varchar(255) NOT NULL,
  `sender_area` varchar(255) NOT NULL,
  `sender_addr` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_phone` varchar(255) NOT NULL,
  `recipient_province` varchar(255) NOT NULL,
  `recipient_city` varchar(255) NOT NULL,
  `recipient_area` varchar(255) NOT NULL,
  `recipient_addr` varchar(255) NOT NULL,
  `kind` varchar(255) NOT NULL,
  `weight` double(10,2) NOT NULL DEFAULT '0.00',
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) DEFAULT NULL,
  `logistics_state` varchar(255) DEFAULT NULL,
  `current_courier` varchar(255) DEFAULT NULL,
  `current_province` varchar(255) NOT NULL,
  `current_city` varchar(255) NOT NULL,
  `current_station` varchar(255) DEFAULT NULL,
  `next_province` varchar(255) DEFAULT NULL,
  `next_city` varchar(255) DEFAULT NULL,
  `pay_state` tinyint(4) NOT NULL DEFAULT '0',
  `order_state` tinyint(4) NOT NULL DEFAULT '0',
  `transport_state` tinyint(4) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `place_price`
-- ----------------------------
DROP TABLE IF EXISTS `place_price`;
CREATE TABLE `place_price` (
  `id` int(10) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `p_level` int(10) NOT NULL,
  `c_level` int(10) NOT NULL,
  `a_level` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of place_price
-- ----------------------------

-- ----------------------------
-- Table structure for `station`
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('4', null, null, null, null, null, null);
INSERT INTO `station` VALUES ('7', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `station_order`
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

-- ----------------------------
-- Table structure for `user`
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

/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : appstore

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 03/16/2018 10:19:14 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `app_list`
-- ----------------------------
DROP TABLE IF EXISTS `app_list`;
CREATE TABLE `app_list` (
  `id` int(255) NOT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_link` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `app_icon` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `app_list`
-- ----------------------------
BEGIN;
INSERT INTO `app_list` VALUES ('0', '0', 'Panda Hanzi', 'https://fir.im/ty8f', '1.0', 'static/shizi.png', null), ('1', '1', 'Panda Read', 'https://fir.im/nx9h', '1.0.2', 'static/read.png', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

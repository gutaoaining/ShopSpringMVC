/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2016-12-08 23:53:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `pass` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for busorder
-- ----------------------------
DROP TABLE IF EXISTS `busorder`;
CREATE TABLE `busorder` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `phone` varchar(20) default NULL,
  `remark` varchar(200) default NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `total` double(8,2) default NULL,
  `post` varchar(20) default NULL,
  `address` varchar(32) default NULL,
  `sid` int(11) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKBBFB18CE873F25D4` (`uid`),
  KEY `FKBBFB18CEAA0F7839` (`sid`),
  CONSTRAINT `FKBBFB18CE873F25D4` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `FKBBFB18CEAA0F7839` FOREIGN KEY (`sid`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(20) default NULL,
  `hot` tinyint(1) default '0',
  `aid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK302BCFEC2928710` (`aid`),
  CONSTRAINT `FK302BCFEC2928710` FOREIGN KEY (`aid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `price` double(8,2) default NULL,
  `pic` varchar(200) default NULL,
  `remark` longtext,
  `xremark` longtext,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `commend` tinyint(1) default NULL,
  `open` tinyint(1) default NULL,
  `cid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKED8DCCEF11F72EF5` (`cid`),
  CONSTRAINT `FKED8DCCEF11F72EF5` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sorder
-- ----------------------------
DROP TABLE IF EXISTS `sorder`;
CREATE TABLE `sorder` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `price` double(8,2) default NULL,
  `number` int(11) default NULL,
  `pid` int(11) default NULL,
  `bid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL auto_increment,
  `status` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(20) default NULL,
  `name` varchar(36) default NULL,
  `pass` varchar(36) default NULL,
  `sex` varchar(8) default NULL,
  `phone` varchar(20) default NULL,
  `email` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

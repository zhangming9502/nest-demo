/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : nest-zero-to-one

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2022-04-22 14:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account_name` varchar(24) NOT NULL COMMENT '用户账号',
  `real_name` varchar(20) NOT NULL COMMENT '真实姓名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '瀵嗙爜',
  `password_salt` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '瀵嗙爜鐩?',
  `mobile` varchar(15) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `role` tinyint(4) NOT NULL DEFAULT '3' COMMENT '用户角色：0-超级管理员|1-管理 员|2-开发&测试&运营|3-普通用户（只能查看）',
  `user_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-失效|1-有效|2-删 除',
  `create_by` smallint(6) NOT NULL COMMENT '创建人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` smallint(6) NOT NULL DEFAULT '0' COMMENT '修改人ID',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`),
  KEY `idx_m` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'javascript', 'script', '0', '0', '0', '3', '0', '0', '2022-04-11 15:56:44', '0', '2022-04-11 15:56:44');
INSERT INTO `admin_user` VALUES ('2', 'typescript', 'script', '0', '0', '0', '3', '0', '0', '2022-04-11 15:58:11', '0', '2022-04-11 15:58:11');
INSERT INTO `admin_user` VALUES ('3', 'nodejs', 'Kid', '1VvkHfc4Eff04eXwjqLCPA==', 'ickW', '17777777777', '2', '1', '0', '2022-04-12 10:50:55', '0', '2022-04-22 10:16:12');
INSERT INTO `admin_user` VALUES ('4', 'koa', 'kid', '2rT+jxrUUoDw2//eLzhvNA==', 'axhE', '17777777777', '3', '1', '0', '2022-04-12 15:00:10', '0', '2022-04-12 15:00:10');
INSERT INTO `admin_user` VALUES ('5', 'koa22', 'kid', 'USq5SBCJslbSjqH6DmlEpA==', 'p8RE', '17777777777', '3', '1', '0', '2022-04-12 17:54:17', '0', '2022-04-12 17:54:17');
INSERT INTO `admin_user` VALUES ('6', 'koa3', 'kid', 'btPSy8Dq9S7vhy/mXktSCA==', 'APWM', '17777777777', '3', '1', '0', '2022-04-12 17:56:03', '0', '2022-04-12 17:56:03');
INSERT INTO `admin_user` VALUES ('7', 'koa5', 'kid', 'gVUs34dTsYjDDTSVFUwWGw==', 'zGl0', '17777777777', '3', '1', '0', '2022-04-12 17:56:33', '0', '2022-04-12 17:56:33');
INSERT INTO `admin_user` VALUES ('8', 'koa6', 'kid', 'Dr6JoDJyEUSIQ34ObOvgvQ==', 'iYpx', '17777777777', '3', '1', '0', '2022-04-12 18:01:34', '0', '2022-04-12 18:01:34');
INSERT INTO `admin_user` VALUES ('9', '', 'kid', 'XewI60Dm/F6scTiL9p5Jmg==', 'iz5O', '17777777777', '3', '1', '0', '2022-04-12 19:17:18', '0', '2022-04-12 19:17:18');
INSERT INTO `admin_user` VALUES ('10', 'egg', 'egg.js', 'IE9061tzAqgC3P+kLncXQA==', 'XSyn', '16666666666', '3', '1', '0', '2022-04-22 14:23:24', '0', '2022-04-22 14:23:24');

-- ----------------------------
-- Table structure for `commodity`
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `ccolumn_id` smallint(6) NOT NULL COMMENT '商品_栏目ID',
  `commodity_name` varchar(10) NOT NULL COMMENT '商品_名称',
  `commodity_desc` varchar(20) NOT NULL COMMENT '商品_介绍',
  `market_price` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `sale_money` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `c_by` varchar(24) NOT NULL COMMENT '创建人',
  `c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `u_by` varchar(24) NOT NULL DEFAULT '0' COMMENT '修改人',
  `u_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_ccid` (`ccolumn_id`),
  KEY `idx_cn` (`commodity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '1', '皮城女警', '好戏开场了', '6300.00', '6300.00', 'nodejs', '2022-04-22 10:03:01', '0', '2022-04-22 10:03:01');
INSERT INTO `commodity` VALUES ('2', '2', '暴走萝莉', '规则，是用来打破的', '6300.00', '6300.00', 'nodejs', '2022-04-22 10:04:30', '0', '2022-04-22 10:04:30');
INSERT INTO `commodity` VALUES ('3', '3', '祖安狂人', '蒙多~~~', '4800.00', '4800.00', 'nodejs', '2022-04-22 10:06:29', '0', '2022-04-22 10:06:29');
INSERT INTO `commodity` VALUES ('4', '2', '麦林炮手', '我好想射点什么', '4800.00', '4800.00', 'undefined', '2022-04-22 10:16:40', '0', '2022-04-22 10:16:40');
INSERT INTO `commodity` VALUES ('5', '4', '德玛西亚之力', '人在塔在', '4800.00', '4800.00', 'undefined', '2022-04-22 10:22:13', '0', '2022-04-22 10:22:13');
INSERT INTO `commodity` VALUES ('6', '4', '德玛西亚之力2', '人在塔在', '4800.00', '4800.00', 'undefined', '2022-04-22 10:24:00', '0', '2022-04-22 10:24:00');
INSERT INTO `commodity` VALUES ('7', '4', '德玛西亚之力3', '人在塔在', '4800.00', '4800.00', 'undefined', '2022-04-22 10:29:57', '0', '2022-04-22 10:29:57');
INSERT INTO `commodity` VALUES ('8', '4', '德玛西亚之力5', '人在塔在', '4800.00', '4800.00', 'undefined', '2022-04-22 10:30:54', '0', '2022-04-22 10:30:54');
INSERT INTO `commodity` VALUES ('9', '4', '德玛西亚之力6', '人在塔在', '4800.00', '4800.00', 'undefined', '2022-04-22 10:32:12', '0', '2022-04-22 10:32:12');

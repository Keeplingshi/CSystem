/*
Navicat MySQL Data Transfer

Source Server         : csystem
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : csystemdb

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-03-11 20:27:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `ID` varchar(255) NOT NULL,
  `GRADEID` varchar(100) NOT NULL,
  `MAJORID` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_3b0a29fa0c444056806b2125edd` (`MAJORID`),
  KEY `FK_bca9542f49674fcdac1290e1111` (`GRADEID`),
  CONSTRAINT `FK_3b0a29fa0c444056806b2125edd` FOREIGN KEY (`MAJORID`) REFERENCES `major` (`ID`),
  CONSTRAINT `FK_bca9542f49674fcdac1290e1111` FOREIGN KEY (`GRADEID`) REFERENCES `grade` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('4028265b532c10e201532c131caf0003', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e392851a0000', '计科12-1班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c138b090004', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e392851a0000', '计科12-2班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c13e1070005', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e392851a0000', '计科12-3班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c14586f0006', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e392851a0000', '计科12-4班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c147b750007', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e392851a0000', '计科12-5班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c14a4fc0008', '40289f4e52eea86c0152eea96adf0000', '4028265b532c10e201532c124fb70002', '网络12-1班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c14d97b0009', '40289f4e52eea86c0152eea96adf0000', '4028265b532c10e201532c124fb70002', '网络12-2班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c1507be000a', '40289f4e52eea86c0152eea96adf0000', '4028265b532c10e201532c12084a0001', '信安12-1班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c152d0c000b', '40289f4e52eea86c0152eea96adf0000', '4028265b532c10e201532c12084a0001', '信安12-2班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c15d265000c', '40289f4e52eea86c0152eea96adf0000', '4028265b532c10e201532c12084a0001', '信安12-3班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c161f5c000d', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e394b3ab0002', '信科12-1班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c164f1e000e', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e394b3ab0002', '信科12-2班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c167bd3000f', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e394b3ab0002', '信科12-4班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c16cf280010', '40289f4e52eea86c0152eea96adf0000', '40289f4e52e38c7d0152e394b3ab0002', '信科12-3班');
INSERT INTO `class` VALUES ('4028265b532c10e201532c17f74d0012', '40289f4e52eea86c0152eea96adf0000', '4028265b532c10e201532c17cd370011', '延长学制');
INSERT INTO `class` VALUES ('4028265b532c10e201532c184aed0013', '4af74e49533b0daa01533bd424b8000c', 'ff80808153175a58015317a4721c0009', '研究生2013级');
INSERT INTO `class` VALUES ('4028265b532c10e201532c18801e0014', '4af74e49533b0daa01533bd424b8000c', 'ff80808153175a58015317a4721c0009', '研究生2014级');

-- ----------------------------
-- Table structure for codebook
-- ----------------------------
DROP TABLE IF EXISTS `codebook`;
CREATE TABLE `codebook` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PARENTID` varchar(100) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `TYPE` varchar(100) NOT NULL,
  `VALUE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_8c4f9cf673634ef5936ff1201f7` (`PARENTID`),
  CONSTRAINT `FK_8c4f9cf673634ef5936ff1201f7` FOREIGN KEY (`PARENTID`) REFERENCES `codebook` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of codebook
-- ----------------------------
INSERT INTO `codebook` VALUES ('1', '党员', null, null, '8001', '1');
INSERT INTO `codebook` VALUES ('11', '男', null, null, '8002', '0');
INSERT INTO `codebook` VALUES ('12', '女', null, null, '8002', '1');
INSERT INTO `codebook` VALUES ('2', '预备党员', null, null, '8001', '2');
INSERT INTO `codebook` VALUES ('20', '已签(出国)', null, null, '8003', '10');
INSERT INTO `codebook` VALUES ('21', '已签', null, null, '8003', '1');
INSERT INTO `codebook` VALUES ('22', '未签', null, null, '8003', '2');
INSERT INTO `codebook` VALUES ('23', '升学(保研)', null, null, '8003', '3');
INSERT INTO `codebook` VALUES ('24', '未签(考研)', null, null, '8003', '4');
INSERT INTO `codebook` VALUES ('25', '未签(考公)', null, null, '8003', '5');
INSERT INTO `codebook` VALUES ('26', '未签(拟出国)', null, null, '8003', '6');
INSERT INTO `codebook` VALUES ('27', '不分', null, null, '8003', '7');
INSERT INTO `codebook` VALUES ('28', '升学(考取)', null, null, '8003', '8');
INSERT INTO `codebook` VALUES ('29', '已签(公务员)', null, null, '8003', '9');
INSERT INTO `codebook` VALUES ('3', '团员', null, null, '8001', '3');
INSERT INTO `codebook` VALUES ('31', '三方已交', '21', null, '8004', '1');
INSERT INTO `codebook` VALUES ('32', '已签未交', '21', null, '8004', '2');
INSERT INTO `codebook` VALUES ('33', '未找到工作', '22', null, '8004', '3');
INSERT INTO `codebook` VALUES ('34', '已有offer在考虑', '22', null, '8004', '4');
INSERT INTO `codebook` VALUES ('4', '群众', null, null, '8001', '4');
INSERT INTO `codebook` VALUES ('41', '在学校', null, null, '8005', '1');
INSERT INTO `codebook` VALUES ('42', '在家', null, null, '8005', '2');
INSERT INTO `codebook` VALUES ('43', '实习', null, null, '8005', '3');
INSERT INTO `codebook` VALUES ('44', '其他', null, null, '8005', '4');
INSERT INTO `codebook` VALUES ('51', '积极', null, null, '8006', '1');
INSERT INTO `codebook` VALUES ('52', '不积极', null, null, '8006', '2');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_e9022d4641c44933a68eeefa2d5` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('4af74e49533cbc2001533f7e04300001', '体育学院');
INSERT INTO `college` VALUES ('40289f4e52daee430152daefc7030000', '计算机学院');

-- ----------------------------
-- Table structure for discipline
-- ----------------------------
DROP TABLE IF EXISTS `discipline`;
CREATE TABLE `discipline` (
  `ID` varchar(255) NOT NULL,
  `NOTE` longtext,
  `TIME` datetime DEFAULT NULL,
  `DISCIPLINETYPEID` varchar(255) DEFAULT NULL,
  `STUDENTID` varchar(255) DEFAULT NULL,
  `COURSENAME` varchar(100) DEFAULT NULL,
  `COURSETEACHER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_91e5b008f8bd431b9062045be8c` (`DISCIPLINETYPEID`),
  KEY `FK_1951ec989f4e4d259191f7b1d48` (`STUDENTID`),
  CONSTRAINT `FK_1951ec989f4e4d259191f7b1d48` FOREIGN KEY (`STUDENTID`) REFERENCES `student` (`ID`),
  CONSTRAINT `FK_91e5b008f8bd431b9062045be8c` FOREIGN KEY (`DISCIPLINETYPEID`) REFERENCES `disciplinetype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discipline
-- ----------------------------
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534e9aeb650001', '', '2016-02-09 00:00:00', '1', '4028265b532c51eb01532c5568140002', '电子商务', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534e9cd3040002', '回家未假', '2016-01-18 00:00:00', '4028265b532cd9ab01532ce3b7650005', '4028265b532c51eb01532c5568140002', '', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534e9dee700003', '', '2015-03-03 00:00:00', '1', '4028265b532c51eb01532c5569c0000b', '微机原理与接口', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534ea681c70005', '', '2014-03-05 00:00:00', '1', '4028265b532c51eb01532c589d880114', '信号与系统', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534ea9265e0006', '夜不归宿', '2015-06-19 00:00:00', '4028265b532cd9ab01532ce3b7650005', '4028265b532c51eb01532c570d690045', '', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534ea9db980007', '挂科说明会议', '2015-04-09 00:00:00', '4af74e49534c2a3f01534ea459610004', '4028265b532c51eb01532c58397500db', '', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534eaab9e50008', '', '2014-12-29 00:00:00', '1', '4028265b532c51eb01532c57edda00bc', '硬件课程设计', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534eabcf580009', '选修课考试替考', '2014-12-25 00:00:00', '4028265b532cd9ab01532cec4bb10006', '4028265b532c51eb01532c58bd550133', '', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534ead0f06000a', '', '2014-09-29 00:00:00', '4028265b532cd9ab01532ce3b7650005', '4028265b532c51eb01532c58f8df0151', '', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534eae2479000b', '', '2015-05-15 00:00:00', '4028265b532cd9ab01532cec4bb10006', '4028265b532c51eb01532c576ff50066', '', '');
INSERT INTO `discipline` VALUES ('4af74e49534c2a3f01534eb7f9fd000c', '', '2016-02-29 00:00:00', '4028265b532cd9ab01532ce3b7650005', '4028265b532c51eb01532c57c2d900a1', '', '');

-- ----------------------------
-- Table structure for disciplinetype
-- ----------------------------
DROP TABLE IF EXISTS `disciplinetype`;
CREATE TABLE `disciplinetype` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_94b4d31e13d343d98e1d5a7ee1b` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disciplinetype
-- ----------------------------
INSERT INTO `disciplinetype` VALUES ('4028265b532cd9ab01532ce1ec990003', '上课迟到');
INSERT INTO `disciplinetype` VALUES ('4af74e49533b0daa01533b4e4ba00000', '早退');
INSERT INTO `disciplinetype` VALUES ('1', '旷课');
INSERT INTO `disciplinetype` VALUES ('4028265b532cd9ab01532ce3b7650005', '未假');
INSERT INTO `disciplinetype` VALUES ('4af74e49534c2a3f01534ea459610004', '活动缺席');
INSERT INTO `disciplinetype` VALUES ('4028265b532cd9ab01532cec4bb10006', '考试作弊');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `ID` varchar(255) NOT NULL,
  `GRADE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_f574f235e65245029f53f4d3b9f` (`GRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('4af74e49533b0daa01533bd424b8000c', '1001');
INSERT INTO `grade` VALUES ('40289f4e52eea86c0152eea96adf0000', '2012');
INSERT INTO `grade` VALUES ('4028265b532c51eb01532c6e64e801bc', '2013');
INSERT INTO `grade` VALUES ('4028265b532c51eb01532c6e810101bd', '2014');
INSERT INTO `grade` VALUES ('4af74e49533b0daa01533bceba530009', '2015');

-- ----------------------------
-- Table structure for jobinfo
-- ----------------------------
DROP TABLE IF EXISTS `jobinfo`;
CREATE TABLE `jobinfo` (
  `ID` varchar(255) NOT NULL,
  `CITY` varchar(200) DEFAULT NULL,
  `COMPANY` varchar(200) DEFAULT NULL,
  `CONTRACTSTATUS` int(11) DEFAULT NULL,
  `ISPOSITIVE` int(11) DEFAULT NULL,
  `MODIFYTIME` varchar(100) DEFAULT NULL,
  `NOTE` longtext,
  `NOWSTATE` int(11) DEFAULT NULL,
  `PROTOCALSTATE` int(11) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobinfo
-- ----------------------------
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5568140002', '', '', '7', '2', '2016-03-07 16:49 admin', '还不退学', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5568b40003', null, null, '4', '1', null, '观望状态，等待考研结果12.29QQ联系', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5568d90004', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '3.2开始赴公司实习，已交请假条', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5568fa0005', null, null, '2', '2', null, '家里安排去北京华软高科实习，2015.12.29QQ联系', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c55691d0006', null, '北京理工大学', '3', null, null, '苏州实习，12月5号qq联系', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5569400007', '苏州', '中科院苏州电子所', '1', null, null, '三月中下旬回校，无假条', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c55695f0008', null, '中国矿业大学', '4', '1', null, '考研失利，下学期找工作，12.29QQ联系', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5569800009', null, null, '2', null, null, '实习或不回，无假条', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c55699f000a', '南京', '普天和平科技有限公司', '1', null, null, '3.6前回校', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5569c0000b', '银川', '亚信科技（银川）', '2', null, null, '2.28请假实习', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5569e1000c', '北京', '金蝶国际软件集团有限公司', '1', null, null, '请假实习，假条寄回', '3', '1', '8000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556a28000d', '福州', '福建新大陆电脑股份有限公司', '1', null, null, '3.10回校，现在公司实习', '3', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556a48000e', null, '中国矿业大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556a6d000f', '南京', '苏宁云商集团股份有限公司', '1', null, null, '2.25请假实习', '3', '2', '6800');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556a930010', '南京', '中软国际有限公司', '1', null, null, '2.26请假实习', '1', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556ab40011', '天津', '方正宽带网络服务有限公司天津分公司', '1', null, '2016-03-04 09:38 swy', '3.7回校', '3', '2', '4800');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556ad60012', '南京', '南京中兴软创科技有限责任公司', '1', null, '2016-03-04 09:38 swy', '2.23请假实习', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556af90013', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '2.28请假实习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556b1b0014', '南京', '金现代信息技术有限公司', '1', null, null, '已经成功', '1', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556b440015', null, '中软国际（西安）', '1', null, null, '2.28请假去公司实习', '3', '1', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556b6b0016', '深圳', 'TCL多媒体研发中心', '1', null, null, '2.28请假实习', '2', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556b970017', null, null, '4', null, null, '3.7回校', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556bb20018', '北京', '畅游公司(NASDAQ：CYOU)', '1', null, null, '已经成功', '1', '2', '8400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556bcd0019', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '3.2晚到校', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556be8001a', null, null, '4', null, null, '年前不打算找工作，年后春招，录取了就不找了2015.12.29QQ联系', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556c02001b', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '已经成功', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556c18001c', '南京', '南京中兴软创科技有限责任公司', '1', null, '2016-03-04 09:39 swy', '毕业答辩回，无假条', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556c30001d', null, '东北大学', '3', null, null, '3.7返校，请假一周', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556c45001e', '天津', 'NTT（中国）有限公司', '1', null, null, '2.28请假外出实习', '1', '1', '4200');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556c59001f', '南京', '南京中软国际', '1', null, null, '2.26请假实习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c556c6c0020', null, '吉林大学', '3', null, null, '实习，六月回，无假条', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56af7f0021', null, null, '2', null, null, '阳光人寿保险', '1', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56af8d0022', null, null, '6', null, null, '办理留学手续', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56afa00023', null, null, '2', null, null, '12.1请假，已经找到3份工作，未决定去向', '2', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56afb10024', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '准备过几天去公司实习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56afbf0025', '南京', '东南大学', '3', null, null, '高泰实习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56afd40026', null, null, '2', null, null, '2.29请假实习', '1', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56afe60027', '南京', '南京烽火星空通信发展有限公司', '1', null, '2016-03-04 09:41 swy', '工作', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56aff30028', null, null, '2', null, null, '实习', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b0050029', null, '臻善科技科技有限公司', '2', null, null, '实习', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b016002a', null, null, '4', null, null, '比较刻苦，最近复习备考', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b024002b', null, null, '2', null, null, '在北京报班培训', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b037002c', '南京', '南京中软国际', '1', null, null, null, '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b04b002d', '澳大利亚南澳洲阿德莱德', '阿德莱德大学', '6', null, null, '2.27请假在家继续学习雅思', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b05a002e', '北京', '北京理工大学', '3', null, null, '已成功，复习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b06d002f', '北京', '北京科技大学', '3', null, null, '3.3返校', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b07f0030', null, null, '2', null, null, '3.1回校，文思海辉技术有限公司办理离职，准备去西安找工作', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b08e0031', null, null, '2', null, null, '准备重修课考试，最近比较认真', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b09f0032', '徐州', '中国矿业大学', '3', null, null, '准备继续实习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b0b10033', '南京', '南京富士通南大软件技术有限公司', '1', null, null, '刚刚开始实习', '3', '2', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b0c90034', null, null, '2', null, null, '说是家里给安排', '1', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b0df0035', '', '格力珠海', '1', null, '2016-03-04 09:41 swy', '', '1', '2', '5800');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b0ee0036', null, null, '4', null, null, '等国家线', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b0fe0037', null, null, '2', null, null, '家里安排工作？寒假可以定下来', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b10c0038', null, null, '4', null, null, '明年继续考研', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b1190039', null, null, '4', null, null, '每天坚持自习考研', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c56b128003a', '上海', '同济大学', '3', null, null, '在实习，打算到五月份回学校', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570cbe003b', '', '', '5', null, '2016-03-07 21:17 swy', '考公务员，3月3号回学校', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570ccb003c', null, null, '5', null, null, '3.1返校，未买到车票', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570cdf003d', '南京', '中国电信集团系统集成有限责任公司', '1', null, null, '2.29去南京办理解约', '3', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570ceb003e', '南京', '南京联迪恒星信息技术公司', '1', null, null, '去南京学培训日语，12月28号qq联系', '3', '2', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570cfb003f', '上海', '创维集团有限公司', '1', null, null, '在学校，准备补考', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d130040', null, null, '2', null, null, '过几天回学校', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d230041', null, null, '2', null, null, '在学校暂时', '4', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d360042', '苏州', '中科院电子所苏州研究院', '1', null, null, '苏州实习', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d450043', '北京', '中国电信集团系统集成有限责任公司', '1', null, null, '在公司实习中，12月28日qq联系', '3', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d540044', null, null, '2', null, null, '暂时在家', '4', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d690045', null, null, '4', null, null, '在学校学习，准备研究生', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d790046', '南京', '南京中软国际', '1', null, null, '3月中旬回学校，在家复习高数准备大补考', '2', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d880047', '南京', '中软国际', '1', null, null, '南京实习', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570d980048', '南京', '中软国际', '1', null, null, '回校准备补考重修', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570da70049', '南京', '南京中软国际', '1', null, null, '南京实习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570db3004a', '南京', '江苏金智教育信息技术有限公司', '1', null, null, '寒假期间住院，现在家养病', '3', '1', '8000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570dc2004b', '深圳', '深圳科列技术有限公司', '1', null, null, '找到工作，呆家玩，qq联系12月28日', '2', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570dd2004c', null, null, '2', null, null, '在学校找工作，准备补考', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570de1004d', '徐州', '中国矿业大学', '3', null, null, '高泰实习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570def004e', null, null, '5', null, null, '准备省考', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570dfc004f', '广州', '华南理工大学', '3', null, null, '回校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570e0b0050', null, null, '2', null, null, '北京腾讯实习12月28号qq联系', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570e170051', '南京', '南京理工大学', '3', null, null, '在校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c570e230052', null, '南京理工大学', '3', '1', null, '暂时在校', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576ed70053', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '在宿舍看书，打游戏！！', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576ee60054', '上海', '大众点评', '1', null, null, '在宿舍看书敲敲代码！很不错！', '3', '1', '11600');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576ef40055', '徐州', '中国矿业大学', '3', null, null, '在学校参加高泰实习。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f030056', null, null, '6', null, null, '家在徐州，长期请假', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f130057', null, null, '2', null, null, '过两天就回家了！如果没有考上的话！就准备找工作！考完研的这几天状态还是比较良好的！', '4', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f200058', null, null, '4', null, null, '2.29返校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f310059', '苏州', '中科院电子所苏州分所', '1', null, null, '已经把中科院那边的职位辞了！重新在上海找了一家！问他为什么放弃中科院，他说在那里实习了几个月，感觉那里环境，体系都不太适合自己！', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f41005a', '合肥', '中国科学技术大学', '3', null, null, '最近生活有点懒散了!没以前勤快！正在调整中！', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f50005b', null, null, '2', null, null, '问他接下来打算如何时！他自己都没想好！感觉一直在逃避现实！还是整天的在玩！没有什么目标！', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f5f005c', null, null, '4', null, null, '考研结束的这几天状态还是可以的！虽然数学考得不怎么好！他接下来是准备在学校学车，如果今年考研失利的话！他准备明年再战！', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f6f005d', '徐州', '中国矿业大学', '3', null, null, '在跟着学院老师做项目！', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f80005e', '北京', '北京科蓝软件公司', '1', null, null, '现在还在北京实习！前几天和他聊天的时候！问他在那边过的咋样的时候！他说那边的一些条件还没中科院好！不过有所得也有所失！感觉嘉宇的状态还是比较不错的！嘉宇人比较踏实！相信他在那边能闯出自己的一番天地！', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f8d005f', null, null, '2', null, null, '考研是肯定没戏的，最后专业课都没去考！他接下是准备考自己家当地的公务员！现在他已经报了公务员培训班啦！', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576f9d0060', null, null, '2', null, null, '天天在宿舍打游戏！他说先回家看看能不能找到工作！如果找不到就回学校看看！无语了！', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576fae0061', '苏州', '中创软件昆山', '1', null, null, '3.10返校，在家照顾母亲。', '2', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576fbd0062', null, null, '2', null, null, '最近状态一般！天气冷了以后就很少出去自习啦！在宿舍里面看看书玩玩手机！', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576fce0063', null, null, '2', null, null, '3.10返校，在家有事', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576fdb0064', null, null, '4', null, null, '问他考得咋样的时候，他说自己今年血崩！估计没戏啦！不过他心态还是不错的！问他接下来打算的时候！他说自己还没想好！准备回家和家里人再商量下，可能二战！或找工作！', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576fe70065', '苏州', '中科院电子所苏州分所', '1', null, null, '最近也和他联系了！问他在那边过的怎么样！他说还是可以的！感觉中科院那边挺适合元鑫的！而且他在那边表现也是非常不错的！听说他和那边的副院长关系还挺不错的！', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c576ff50066', '上海', '上海骏梦网络科技有限公司', '1', null, null, '在上海实习！感觉混的不错！', '3', '2', '12000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5770000067', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '已经在公司实习了一段时间了！他说在那边过得还行！有什么情况会和我说！', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5770110068', null, null, '2', null, null, '准备应征入伍，2.27请假，寒假在家做了视力矫正手术，大概4月才能返校', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57701e0069', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '最近在公司实习！状态还行！', '1', '1', '5400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57702a006a', null, null, '4', null, null, '3.1返校', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c577038006b', '西安', '西安交通大学', '3', null, null, '这段时间在外面做兼职，过几天就回家了！', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57704f006c', null, null, '2', null, null, '找工作态度还是比较消极！没近期找工作的打算，即便我已经和她交流开导过！', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c577061006d', '北京', '北京理工大学', '3', null, null, '在苏研院实习,最近这段时间回学校待两个星期！', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5797ed006e', null, null, '2', null, null, '在小南门由其母亲照看，很难正常毕业', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57985e006f', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '在中兴软创实习', '3', '1', '5400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798710070', '南京', '南京多维信联科技有限公司', '1', null, '2016-03-07 13:15 08123349', '在公司实习', '3', '2', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57987d0071', '北京', '北京航空航天大学', '3', null, null, '在学校学习，学车', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57988e0072', '', '昆明富滇银行', '1', null, '2016-03-07 13:11 08123349', '3.15返校', '2', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798a00073', '徐州', '中国矿业大学', '4', null, '2016-03-07 13:12 08123349', '积极准备复试中。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798af0074', '合肥', '中国科技大学', '4', null, null, '等待考研成绩，暂无工作打算，暂无二战考虑', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798bf0075', null, '中国科学院电子学研究所苏州研究院', '1', null, null, '继续在苏州实习', '3', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798d60076', '上海', '上海世昕软件开发有限公司', '1', null, null, '2.29请假去实习', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798ec0077', '南京', '泉峰集团', '1', null, null, '在公司实习', '3', '1', '4500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5798fb0078', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '在公司实习，学习Java编程，数据库编程', '3', '1', '5400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799080079', '南京', '南京烽火星空通信发展有限公司', '1', null, null, '在学习Java方面的知识', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c579914007a', null, null, '5', null, null, '想考家里的公务员，明年5月', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c579922007b', '深圳', '中国电信集团系统有限公司', '1', null, null, '在北京实习', '3', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57992f007c', '北京', '北京航空航天大学', '4', null, null, '等待考研成绩，暂无工作打算和二战考虑', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57993b007d', '苏州', '中磊电子（苏州）有限公司技术研发中心', '1', null, null, '在宿舍学习', '1', '1', '4800');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c579948007e', '南京', '南京烽火星空通信发展有限公司', '1', null, '2016-03-07 13:13 08123349', '在学校学习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c579956007f', '南京', '软通动力', '1', null, null, '在宿舍，接触不是太多，情况不太了解', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799630080', '苏州', '苏州电子所', '1', null, null, '在苏州实习', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799710081', '烟台', '烟台海颐科技有限公司', '1', null, null, '在常州一公司实习', '1', '2', '4000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799830082', '徐州', '中国矿业大学', '3', null, '2016-03-07 13:13 08123349', '在校学习', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799920083', null, null, '2', null, null, '在西安找工作', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799a00084', null, null, '2', null, null, '在苏州实习，同时在积极找工作', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799af0085', '珠海', '珠海格力电器股份有限公司', '1', null, null, '3.5号回学校，在家陪母亲看病，qq联系', '2', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5799bd0086', '深圳', '中国电信集团系统有限公司', '1', null, null, '正在北京实习', '3', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1290087', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '三方已交。', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1400088', null, null, '2', null, null, '出去实习找工作', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c15b0089', '南京', '联迪恒星(南京)信息系统有限公司', '1', null, null, null, '3', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c170008a', '', '北京红马传媒文化发展有限公司', '2', null, '2016-03-07 19:04 swy', '网络1-干兵 15:05:42 \n公司好像只签自己的\n网络1-干兵 15:05:56 \n听说在那个合约里面注明', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c181008b', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '已经找到工作，并签约', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c192008c', '', '中软国际', '1', null, '2016-03-07 17:55 wsn', '', '1', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1a0008d', '南京', '南京软通动力信息技术服务有限公司', '1', null, '2016-03-07 10:37 wsn', '已经辞职准备新工作', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1b3008e', '西安', '神州数码', '1', null, null, '三方已交。', '3', '2', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1c6008f', '南京', '江苏润和软件股份有限公司', '1', null, null, '已经过了润和的面试，还没签三方。', '2', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1d30090', null, null, '2', null, null, '找到了一家昆山的企业，待遇较低，不想去，已经回家，说是明年春招再找', '1', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1e40091', null, null, '2', null, null, '基本毕业不了，有点自暴自弃的样子。在宿舍打游戏，没出去找工作。', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c1f60092', '南京', '亚信科技公司', '1', null, null, '过了南京亚信的面试，还没签三方，11月底过去实习。', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2040093', null, '中国科学技术大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2150094', '南京', '软通动力', '1', null, null, '国家公务员笔试已经通过，现在在准备面试。', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2280095', null, null, '4', null, null, '孙浦朝考研好像不太理想，准备明年二战。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2350096', '', '', '2', null, '2016-02-29 17:54 swy', '他也不知道自己能不能考上，反正就说是数学考得比较烂，目前在学校。', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2460097', '苏州昆山', '中创软件昆山', '1', null, null, '已签三方', '2', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2540098', null, null, '4', null, null, '目前在学校，估计考上的希望不是很大。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2600099', null, '电子科技大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c26e009a', '', '', '4', null, '2016-02-29 17:53 admin', '二战', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c280009b', '杭州', null, '1', null, null, '目前在杭州实习，公司承诺转正后10000+，不清楚是否留在那里。', '3', '2', '10000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c28f009c', '南京', '南京中兴软创科技有限责任公司', '1', null, null, null, '1', '1', '6200');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c29e009d', '南京', '南京中兴软创科技有限责任公司', '1', null, null, null, '1', '2', '5700');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2ad009e', '珠海', '格力珠海', '1', null, '2016-03-04 09:26 swy', '珠海格力电器股份有限公司', '1', '2', '5800');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2ba009f', null, null, '4', null, null, '怀庆应该考的不错，有很大的希望能够考上本院的研究生', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2c800a0', null, '中科院信工所', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2d900a1', '南京', '南京软通动力信息技术服务有限公司', '1', null, '2016-03-07 10:34 wsn', '苏州博士？毁约软通动力', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57c2e700a2', '南京', '南京中兴软创科技有限责任公司', '1', null, null, null, '1', '1', '5700');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ebf900a3', '', '', '7', null, '2016-03-04 11:17 swy', '准备延长学制', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec0b00a4', null, '上海共进', '1', null, null, null, '1', '1', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec2100a5', null, null, '2', null, null, '3.4日晚到校，毕业之后想回家乡青海那边，在准备省考', '2', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec3100a6', null, null, '2', null, null, '刚辞职回学校准备重新找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec4600a7', '西安', '锐捷网络科技股份有限公司', '1', null, null, '实习中', '3', '1', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec6000a8', '北京', '方正宽带上海', '2', null, null, '找工作，最近一段时间比较积极，一直在网申，对相关企业关注比较高，但是相对来说，学校的校园招聘参加的比较少，现在已经决定要签方正宽带。', '1', '4', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec7600a9', '西安', '西安电子科技大学', '3', null, null, '保研之后，学习的态度有点消极，宿舍呆的时间有点多，但是导师也给布置了一定的任务，相信他自己应该知道时间的安排。', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ec8b00aa', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '签了中兴软创的offer，但是自己可能觉得还是不太满意，所以最近也还在积极的找工作，参加各种校园宣讲和网申。', '2', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ecaa00ab', null, null, '2', null, null, '考公务员', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ecbf00ac', null, null, '5', null, null, '3.7号回学校，在广州参加中国人民银行面试', '4', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ecd500ad', null, null, '2', null, null, '准备找工作，前一阵在成都那边试了一段时间。目前在学校准备先考CCIE的资格证书，有准备等明年拿到证书在参加春招的打算。考CCIE的决心较大，目标挺明确的。', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ecf400ae', null, null, '5', null, null, '是决定要找工作了，但是感觉对于找工作这件事有点逃避的心理，对自己不太自信，鼓励他去积极参加校招，但是好像一次都没去过，现在打算考公务员。', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed0200af', null, '澳洲留学', '6', null, null, '3.2日返校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed1900b0', '', '中软国际', '1', null, '2016-03-07 17:56 wsn', '3.1日返校', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed2e00b1', '杭州', '浪潮集团有限公司', '1', null, null, '目前在南京实习', '3', '2', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed4300b2', '北京', '锐捷网络科技股份有限公司', '1', null, '2016-03-04 09:34 swy', '3.6回学校', '1', '1', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed5d00b3', null, '签的哪里？', '1', null, null, '2.28请假去实习', '3', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed6d00b4', null, null, '4', null, null, '准备考研，是我们班我觉得最靠谱的考研的同学，学习认真，每天坚持上自习，对自己的目标认识明确。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed7c00b5', null, null, '2', null, null, '考研失败准备找工作，回学校准备', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed8c00b6', null, null, '2', null, null, '杭州实习，三方没签，有跳槽的心思。', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57ed9d00b7', null, null, '6', null, null, '四月份回学校，有澳洲大学一个有限offer，已经决定是要出国了，自己也在关注这方面的事情，找工作是完全放弃的感觉，今年学校的双选会也不会去参加了。', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57eda900b8', null, null, '2', null, null, '11.27请假实习，找工作，已有的offer是上海的，但是自己不是很满意，想要再找一份。', '2', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57edb600b9', '西安', '西安交大', '3', null, null, '在西安交大跟导师学习。', '4', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57edc100ba', '安徽', '中国科技大学', '3', null, null, '4.5返校，在科大讯飞实习，假条未到', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57edcf00bb', '天津', '天津大学', '3', null, null, '在北京学习研究生期间的学习资料', '4', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c57edda00bc', '实习的地点在北京', null, '2', null, null, '在北京去哪儿网公司实习，但是自己也有明年出国的打算。', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580ca100bd', '南京', '艾欧史密斯', '5', null, '2016-03-11 16:39 testins', '在学校', '1', null, '4800');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580cb200be', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '在公司实习。', '3', '1', '5400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580cc500bf', null, '亚信科技总部北京', '2', null, null, '当前在亚信科技（中国）有限公司实习', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580cdf00c0', '南京', '南京中软国际', '8', null, '2016-03-11 16:39 testins', '在学校。', '1', null, '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580cf500c1', null, null, '2', null, null, '2.27请假，在北京做项目和联系出国事宜。之前考研失败', '4', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d0800c2', null, null, '4', null, null, '等待复试通知，顺便找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d1800c3', '广州', '华南理工大学', '3', null, null, '做毕业设计。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d2800c4', '南京', '软通动力信息技术(集团)有限公司', '1', null, '2016-03-07 09:44 admin', '在南京实习中', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d3800c5', null, null, '5', null, null, '已经考上公务员', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d4800c6', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '实习中。', '3', '1', '5400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d5800c7', '南京', '联迪恒星(南京)信息系统有限公司', '1', null, null, '在学校', '3', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d6900c8', '南京', '南京富士通南大', '1', null, null, '在学校', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d7900c9', '北京', '奇虎360', '1', null, null, '已去实习了', '3', '2', '13000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d8a00ca', '南京', '软通动力信息技术(集团)有限公司', '1', null, null, '在学校', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580d9a00cb', null, null, '4', null, null, '正在找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580daa00cc', '南京', '中软国际', '1', null, null, '已经去实习了', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580db900cd', null, null, '2', null, null, '在家，准备回校', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580dc600ce', '徐州', '中国矿业大学', '3', null, null, '在学校', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580dd400cf', '南京', '软通动力信息技术(集团)有限公司', '1', null, '2016-03-07 09:44 admin', '在学校', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580de100d0', '北京', '新奥集团', '1', null, null, '实习', '3', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580dee00d1', null, null, '6', null, null, '在学校做毕设', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580df900d2', null, null, '4', null, null, '准备找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580e0800d3', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '实习中', '3', '2', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580e1500d4', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '2.29-4.10在公司实习', '3', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580e2200d5', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '实习中', '3', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580e2f00d6', '', '青海国税局公务员', '1', null, '2016-03-07 18:59 swy', '3.12返校，公务员面试刚通过', '2', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580e3b00d7', null, null, '4', null, null, '准备找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c580e4800d8', null, null, '4', null, null, '成绩出来了，准备复试中', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58395500d9', null, null, '2', null, null, '张仁峰目前就想找个重庆的工作，不过校招和宣讲会很少有重庆的，所以到现在还没找的。不过他比较恋家，想等明年春招的时候看看。经过我的劝说，现在也会考虑其他城市的招聘了，前两天还去了杭州面试！', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58396800da', '深圳', '深圳紫金支点', '1', null, null, '11月2日起开始在深圳实习', '3', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58397500db', '南京', '联迪恒星(南京)信息系统有限公司', '1', null, null, '已经找到工作了，最近在学习比较闲，等下学期开学实习', '1', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58397f00dc', null, null, '4', null, null, '考研失败了，准备二战', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58399000dd', '烟台', '烟台海颐软件股份有限公司', '1', null, null, '2.29回校，工作地点在海南可以经常陪伴父母，所以他说对他来说是份好工作', '1', '2', '4200');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5839a200de', '', '比亚迪', '1', null, '2016-03-07 19:08 swy', '考川大，成绩不太理想，可能考虑调剂。', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5839ad00df', null, null, '4', null, null, '考研失败，打算找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5839bd00e0', null, null, '4', null, null, '3.14返校，路途遥远', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5839d200e1', null, null, '2', null, null, '3.7返校，考研失败，先找工作', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5839e100e2', '南京', '中软国际', '1', null, null, '正在实习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5839f200e3', '南京', '中软国际', '1', null, null, '正在实习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a0200e4', '上海', '携程国际有限公司', '1', null, null, '正在实习', '3', '1', '11500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a0f00e5', '上海', '华东理工大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a1e00e6', '北京', '海池进出口有限公司', '2', null, null, '实习中，有可能会去考公务员', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a5300e7', null, null, '4', null, null, '应该能考上，正在准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a6500e8', null, null, '2', null, null, '3.9回校，在家参加公务员考试培训', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a7100e9', '南京', '南大富士通', '1', null, null, '现在在学校，准备去富士通实习', '3', '2', '5010');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a7d00ea', '北京', '北京无双科技', '1', null, null, '正在海南实习', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a8a00eb', '南京', '亚信科技', '2', null, null, '正在实习', '3', '4', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583a9700ec', null, null, '2', null, null, '考银行', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583aa200ed', '', '中软国际', '1', null, '2016-03-07 17:54 wsn', '', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583aad00ee', '北京', '北京邮电大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583ab800ef', '徐州', '中国矿业大学', '3', null, null, '主要跟着林老师做项目', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583ac300f0', null, null, '4', null, null, '考了348准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c583ad000f1', null, null, '6', null, null, '还在申请国外的大学！马上就要申请上了', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5872d300f2', null, null, '6', null, null, '现在在苏州电子所实习。准备出国，等消息中。', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5872e300f3', '南京', '南京中软国际', '1', null, null, '现在在南京中软实习。', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5872f000f4', null, null, '4', null, null, '考研结果可能不太理想，现准备考国家电网中', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5872fa00f5', '南京', '双选会：江苏海隆', '1', null, null, '最近在老师实验室，且需准备补考', '1', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58730800f6', '南京', '南京中软国际', '1', null, null, '已去南京实习', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58731e00f7', null, null, '4', null, null, '考研结果待定，等重大出复试线。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58732c00f8', null, null, '4', null, null, '现阶段帮助老师做做项目，可能准备二战', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58733d00f9', '南京', '南京中软国际', '1', null, null, '在校准备关于实习内容', '1', '1', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58734e00fa', null, '中国科学技术大学', '3', null, null, '已到中科大做毕业设计项目', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58735a00fb', '南京', '南京中软国际', '1', null, null, '已南京实习', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58736b00fc', '', '中软国际', '1', null, '2016-03-07 17:59 wsn', '', '2', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58737c00fd', '南京', '双选会：江苏海隆', '1', null, null, '已经回家，明年开学后直接去公司实习', '2', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58738900fe', '徐州', '自主创业', '1', null, null, '徐州盛世光明软件技术有限公司', '3', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58739400ff', '', '中软国际', '1', null, '2016-03-07 18:00 wsn', '', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873a20100', null, null, '6', null, null, '已经考过了托福，正在准备出国的其他事宜', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873b20101', '', '', '4', null, '2016-03-03 15:46 08123452', '表示数学考得不理想，说等明年成绩出来再说', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873bf0102', null, null, '2', null, null, '最近在准备重修课程的考试，开始上晚自习，但对自己将来如何打算依然举棋不定', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873ce0103', '苏州', '中科院电子所苏州研究院', '1', null, null, '在公司实习', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873de0104', '广州', '广州高新兴科技', '1', null, null, '在公司实习', '3', '1', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873ec0105', null, null, '4', null, null, '考研后持观望态度，等待成绩出来，如果考不上则准备找工作', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5873f60106', null, null, '2', null, null, '前期考研，先准备找工作，就业意向广州', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5874010107', '苏州', '中科院电子所苏州研究院', '1', null, '2016-03-03 15:48 08123452', '在苏州电子所实习', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58740d0108', '西安', '西安中软国际', '1', null, null, '练车，1月7号后回家，明年开学准备去实习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5874180109', null, null, '4', null, null, '考完后表示数学考得不好，但考后状态较好，打算成绩出来之后再做打算', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c587427010a', '南京', '南京富士通南大软件技术有限公司', '1', null, null, '在家，过完年后去公司实习', '2', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c587431010b', null, '北京理工大学', '3', null, null, '正在实习，之后回家', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58743d010c', null, '中国科学技术大学', '3', null, null, '正在实习，之后准备回家', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c587449010d', '南京', '中兴软创科技有限责任公司', '1', null, null, '请假去实习', '3', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c587457010e', null, null, '4', null, null, '考研结果似乎并不理想，现在已经准备开始找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c587465010f', '南京', '中兴软创科技股份有限公司', '1', null, null, '在南京实习', '3', '1', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5874710110', null, null, '4', null, null, '考完研后说成绩可能在国家线左右，目前准备等考试成绩出来后再做打算', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589d5a0111', '大连', '大连理工大学', '3', null, null, '在学校自习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589d6b0112', null, null, '2', null, null, '准备应征入伍', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589d780113', '上海', null, '2', null, null, '上海岸卓科技有限公司', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589d880114', '杭州', null, '2', null, null, '熟悉自己所签岗位', '3', '3', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589d950115', '', '中软国际', '1', null, '2016-03-07 17:57 wsn', '', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589da40116', null, null, '4', null, null, '自习，准备考研，状态很好，每天有冲劲', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589db00117', '南京', null, '2', null, null, '12.5联系，江苏荣泽信息科技股份有限公司\n4人合租，都不认识。', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589dc00118', '合肥', '京东方', '1', null, null, '近期未积极关注校园招聘', '1', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589dd00119', '福州', '福建星网锐捷通信有限公司', '1', null, null, null, '3', '2', '8000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589ddd011a', null, '亨通线缆', '1', null, null, '投简历，积极参加各种招聘会', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589df1011b', '南京', '中兴软创科技股份有限公司', '1', null, null, '12.2请假去公司实习。', '3', '1', '5400');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e09011c', '南京', '软通动力信息技术(集团)有限公司', '1', null, '2016-03-07 09:44 admin', '准备去公司实习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e17011d', null, null, '4', null, null, '自习，准备考研，状态不错，心情好', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e27011e', null, null, '2', null, null, '自习，准备考研，三天打鱼', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e39011f', '北京', '中国科学院大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e440120', '成都', '电子科技大学', '3', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e530121', '长沙', null, '2', null, null, '参加达内java培训', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e600122', null, null, '4', null, null, '自习，准备考研，状态很好，科目基本全部复习完', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e6b0123', '', '中软国际', '1', null, '2016-03-07 17:57 wsn', '', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e770124', null, null, '2', null, null, '3.13考研失利，开始找工作，现在在武汉', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e810125', null, null, '4', null, null, '天天认真复习，中午不回宿舍休息，晚上才回来。', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e8d0126', '', '', '6', null, '2016-03-04 10:47 admin', '德国的学校，4月底出结果，3.5回校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589e980127', null, null, '4', null, null, '自习，准备考研，积极，状态好', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589ea30128', null, null, '4', null, null, '自习，准备考研，积极，状态好', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589eaf0129', null, null, '4', null, null, '自习，准备考研，积极，状态好', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589ebb012a', null, null, '4', null, null, '自习，准备考研，积极，状态好', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589ec8012b', '西安', '西北工业大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589ed4012c', null, '臻善科技科技有限公司', '2', null, null, '投简历，积极参加各类招聘', '1', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589ee1012d', null, null, '4', null, null, '上自习，已經在準備考研了，状态还行', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c589eed012e', '厦门', '厦门大学', '3', null, null, null, '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd1f012f', null, null, '2', null, null, '仍没有就业，自己分析了下原因：、专业相关的社会经验不足 2、没有工作经验，为人处事并不是太成熟。 3、英语比较差，尤其是口语发达能力比较差，对未来规划：关注电子信息行业及通信编程等，继续充实自己，早日找到好工作', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd2f0130', '', '东北大学', '4', null, '2016-03-03 14:42 admin', '现阶段正在准备复试，340+', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd3b0131', '', '', '4', null, '2016-03-03 14:42 admin', '准备二战', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd460132', null, '中国矿业大学', '3', null, null, '正在上研究生课程，跟随导师做项目，还要准备毕业设计，班长很累的有木有', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd550133', '', '', '4', null, '2016-03-03 14:42 admin', '考西安电子科技大学', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd690134', '', '中科院电子所苏州研究院', '1', null, '2016-03-03 14:43 admin', '正在电子所实习', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd740135', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '11.30请假去公司实习', '1', '1', '6200');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd840136', null, null, '2', null, null, '考研感觉不理想，准备找工作', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bd940137', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '11.30请假去实习', '1', '1', '5700');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bda00138', '苏州', '中科院电子所苏州研究院', '1', null, null, '目前在中科院电子所苏州研究院实习，实习生活感觉还好，在实习中也能学到一些东西。未来在职业生涯的打算是做计算机软件，主要是数据计算方向。', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bdb30139', '南京', '联迪恒星(南京)信息系统有限公司', '1', null, '2016-03-03 14:44 admin', '目前在公司培训IT技能，主要包括JAVA与JAVA WEB，自己做一些小东西与网页。将来先在这个公司干一段时间，如果自己能做好这一行就做下去。做个1,2年就回重庆找工作，要么继续IT，要么就公考', '3', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bdc4013a', '南京', '南京富士通南大软件技术有限公司', '1', null, null, '现在在实习中，近期打算加强毕业设计相关知识的学习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bdd0013b', '', '中国矿业大学（北京）', '4', null, '2016-03-03 14:45 admin', '考研很累，但也有收获，准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bddb013c', '', '', '2', null, '2016-03-03 14:45 admin', '考研失利，听说有华为内推', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bde9013d', '', '中国矿业大学', '4', null, '2016-03-03 14:46 admin', '准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bdf8013e', '', '', '2', null, '2016-03-03 14:46 admin', '考研失利，准备回家找工作', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be05013f', '', '西安电子科技大学', '4', null, '2016-03-03 14:47 admin', '准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be140140', '', '中软国际', '1', null, '2016-03-07 17:58 wsn', '', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be270141', '南京', '亚信科技(南京)有限公司', '2', null, null, '得到了亚信南京的实习offer。三方还不能签', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be340142', '电信科学技术第十研究所(人事处)/西安市雁塔西路6号/710061', '电信科学技术第十研究所', '1', null, '2016-03-01 09:03 admin', '3.1返校', '1', '1', '4000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be420143', null, '北京邮电大学', '3', null, null, '3.2返校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be4f0144', null, '东北大学', '3', null, null, '现阶段进行毕业设计的原型设计，年前开发出初始版本，确定大体功能，年后进行针对性的功能开发，并进行毕业论文的撰写', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be5a0145', null, null, '2', null, null, '暂时没有拿到电子所的offer，正在积极找工作', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be670146', null, '武汉大学', '3', null, null, '想念同学，正在做毕设相关', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be740147', '无锡太仓市', '双选会：太仓市同维电子有限公司', '1', null, '2016-03-03 14:47 admin', '三方协议暂时没有拿到，现阶段在校准备四级。主要以后在公司中从事软件测试工作我现在正在去为公司实习做准备，自学一些应聘职位相关的知识。职业规划是希望未来可以通过努力和不断地学习，以提高职业技能。', '3', '2', '4500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be810148', null, null, '2', null, null, '对于考研有一些感触，觉得应该从假期开始看书，对考研的结果比较释然。现在已回家，心情良好，期待更好的明天', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be8d0149', '', '', '5', null, '2016-03-03 14:48 admin', '公务员考试已经完成，正在家中准备银行面试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58be99014a', null, null, '2', null, null, '放弃考研', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bea5014b', null, '四川大学', '3', null, null, '准备毕业设计', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58beb1014c', '', '南京师范大学', '4', null, '2016-03-03 14:48 admin', '心理学考研，准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58bebd014d', '', '中软国际', '1', null, '2016-03-07 17:58 wsn', '', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f81f014e', '南京', '联迪恒星(南京)信息系统有限公司', '1', null, null, '公司实习', '3', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f85e014f', '苏州工业园区人力资源管理服务中心/江苏省苏州工业园区旺墩路168号市场大厦/215028', '中国科学院电子学研究所苏州研究院', '1', null, '2016-03-03 17:41 swy', '在苏州实习', '3', '1', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f8d60150', null, null, '2', null, null, '找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f8df0151', null, null, '6', null, null, '学习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f8ee0152', null, '联迪恒星(南京)信息系统有限公司', '1', null, null, '2.27已经和公司解约，准备回海南好工作', '3', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f8ff0153', '南京', '江苏瑞中数据股份有限公司', '1', null, null, '在公司实习', '3', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9100154', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '实习', '3', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9240155', '南京', '软通动力信息技术(集团)有限公司', '1', null, '2016-03-04 09:53 swy', '上海参加实习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9330156', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '公司实习', '3', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f93e0157', null, null, '2', null, null, '找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9490158', '南京', '南京中软国际', '1', null, null, '学习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9550159', '北京', '望京科技园握奇数据有限公司', '2', null, null, '公司可能会接收', '2', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f961015a', '包头', '江苏国泰新点软件公司', '1', null, null, '学校学习，3月份准备去实习', '1', '1', '4700');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f96f015b', '苏州工业园区人力资源管理服务中心/江苏省苏州工业园区旺墩路168号市场大厦/215028', '中国科学院电子学研究所苏州研究院', '1', null, '2016-03-03 17:40 swy', '目前在苏州中科院电子所苏州研究院实习', '3', '1', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f97b015c', '南京', '江苏海隆软件技术有限公司', '1', null, null, '准备做毕设', '1', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f986015d', '北京', '北京邮电大学', '3', null, null, '2.29请假去北京做毕业设计，假条未到', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f991015e', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '公司实习', '3', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f99e015f', '南京', '江苏海隆软件技术有限公司', '1', null, null, '学校学习', '1', '1', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9aa0160', '深圳', '深圳东软软件有限公司', '1', null, null, '3.10-5.8去公司实习', '3', '2', '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9b60161', null, null, '5', null, null, '备考公务员', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9c10162', null, null, '2', null, null, '找工作', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9cc0163', '', '', '2', null, '2016-03-07 21:05 swy', '春秋航空重庆春之翼信息科技有限公司12.7', '3', '4', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9d70164', '上海', '科达集团股份有限公司', '1', null, null, '苏州实习', '3', null, '6500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9e60165', null, null, '2', null, null, '3.3号回学校，考研失利准备找工作', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9f20166', null, null, '4', null, null, '成绩不是很好，不确定能否读研，边找工作边复习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58f9ff0167', null, '中国科学技术大学', '3', null, null, '学习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58fa0a0168', null, null, '5', null, null, '公司实习4.10返校', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58fa170169', '南京', '东南大学', '3', null, null, '学习、兼职', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58fa23016a', '成都', '电子科技大学', '3', null, null, '学习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58fa2f016b', '北京', '北京理工大学', '3', null, null, '学习', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58fa39016c', '', '', '2', null, '2016-03-07 21:05 swy', '准备找工作', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c58fa46016d', null, null, '4', null, null, '准备复试', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593d8e016e', null, null, '2', null, null, '一直在外实习未在校。', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593d9e016f', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593daf0170', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593dbb0171', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593dc80172', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593dd90173', '', '', '7', null, '2016-03-04 11:15 swy', '', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593de30174', '', '', '7', null, '2016-03-04 11:16 swy', '退学', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593df30175', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e030176', null, null, '2', null, null, null, '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e120177', null, null, '2', null, null, '信长城研究院。12.31联系', '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e210178', null, null, '2', null, null, null, '3', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e320179', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e41017a', null, null, '5', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e4e017b', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e5e017c', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e74017d', null, null, '2', null, null, null, '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e80017e', null, null, '2', null, null, '12.31说自己在内蒙找到工作，内蒙房管局', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c593e91017f', null, null, '5', null, null, '考浙江国考，已经通过复试，等待面试，但是还有6门课未通过', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5967d60180', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5967f00181', '上海', '科达集团股份有限公司', '1', null, null, null, '1', null, '8000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59680d0182', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968270183', '南京', '浪潮电子信息产业股份有限公司', '1', null, null, null, '1', null, '7500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968330184', null, null, '2', null, null, null, '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968440185', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968530186', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59685d0187', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968700188', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968860189', '南京', '南京中软国际', '1', null, null, null, '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c596895018a', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968a1018b', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968af018c', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968bd018d', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968c7018e', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968d1018f', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968de0190', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968e90191', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968f30192', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5968fe0193', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59690c0194', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5969180195', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5969230196', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59692e0197', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59693a0198', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5969460199', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c596953019a', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59695f019b', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59696a019c', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c596977019d', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c596981019e', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59698e019f', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c59699801a0', null, null, '2', null, null, null, '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c5969a401a1', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598c6501a2', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598c7401a3', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598c7d01a4', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598c8a01a5', '大连', '大连东软集团', '1', null, null, '写论文', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598c9901a6', '重庆', '中移物联网有限公司', '1', null, null, '写论文', '2', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598ca701a7', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598cb801a8', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598cc601a9', '上海', '东软集团股份有限公司', '1', null, null, null, '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598cd701aa', '重庆', '中移物联网有限公司', '1', null, null, null, '1', '1', '8000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598ce201ab', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598cf201ac', '苏州', '中科院电子所', '1', null, null, null, '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d0101ad', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d1001ae', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d2101af', '杭州', '华信咨询设计研究院有限公司', '1', null, null, null, '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d3001b0', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d4001b1', '南京', '南京富士通南大软件技术有限公司', '1', null, null, '写论文', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d5001b2', '徐州', '自主创业', '1', null, null, '徐州木牛流马科技有限公司', '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d5f01b3', '上海', '商泰软件有限公司', '1', null, null, null, '3', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d6c01b4', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d7701b5', null, null, '2', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c598d8201b6', '盐城', '交通银行盐城分行', '1', null, null, null, '1', '2', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fab701c8', '南京人才服务中心/南京市北京东路63号南京人才大厦/210008', '南京富士通南大软件技术有限公司', '1', '1', '2016-03-07 09:55 admin', '2016.3.7去公司实习', '1', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fad301c9', null, null, '2', null, null, '没打算去找工作，等家里安排', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fae201ca', null, null, '2', null, null, '2.27请假，刚刚解约（南京紫津融畅信息科技服务有限公司），最近请假一周修养，3.4到校', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99faee01cb', '苏州', '创维集团', '1', null, '2016-03-04 09:22 swy', '2016.3.3到学校', '1', '2', '4500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fafd01cc', null, null, '4', null, null, '2016.2.29到学校，准备二战', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb0c01cd', null, null, '6', null, null, '准备出国', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb1701ce', '南京', '江苏润和软件股份有限公司', '1', null, null, '4月份到学校', '3', '2', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb2001cf', '北京', '乐享在线科技(北京)有限公司', '1', null, null, '2016.5左右回学校', '3', '2', '7000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb2e01d0', '上海', '乐其网络科技有限公司', '2', null, '2016-03-04 09:59 swy', '', '1', '4', '4000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb3e01d1', '北京', '中科院信工所', '3', null, null, '到北京做毕设', '3', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb4a01d2', '南京', '亚信科技', '1', null, null, '2016.3.8左右去实习', '1', '2', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb5501d3', null, null, '4', null, null, '考研300多一点，基本过线，2016.2.29回学校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb6301d4', '南京', '江苏金智教育', '1', null, '2016-03-04 09:24 swy', '2016.3.2回学校', '1', '1', '5500');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fb9301d5', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '2016.3.1去实习', '1', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fba201d6', null, null, '2', null, null, '考研失利，没打算去找工作，等家里安排', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbac01d7', null, null, '2', null, null, '考研失利，在家找工作，请假至3.15', '2', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbb701d8', '南京', '南京烽火星空通信发展有限公司', '1', null, null, '2016.4左右回学校', '3', '1', '6000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbc501d9', '南京', '南京中兴软创科技有限责任公司', '1', null, null, '2016.4左右回学校', '3', '1', '4900');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbd101da', '徐州', '中国矿业大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbda01db', null, null, '4', null, null, '考研285分，准备调剂', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbeb01dc', '北京', '拉卡拉集团', '1', null, null, '2016.4.1到学校', '3', '2', '5000');
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fbf401dd', null, null, '4', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fc0001de', '南京', '东南大学', '3', null, null, '2016.2.29到学校', '2', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fc0e01df', null, null, '2', null, null, '没有找到工作，有创业的打算，2016.2.29到学校', '1', '3', null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fc1901e0', null, null, '4', null, null, '考研321分，基本考上本校', '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fc2501e1', '北京', '北京航空航天大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fc3001e2', '西安', '西安电子科技大学', '3', null, null, null, '1', null, null);
INSERT INTO `jobinfo` VALUES ('4028265b532c51eb01532c99fc3b01e3', '南京', '南京航空航天大学', '3', null, null, null, '1', null, null);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `ID` varchar(255) NOT NULL,
  `COLLEGEID` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fdae396ffd644e39820a48dc572` (`COLLEGEID`),
  CONSTRAINT `FK_fdae396ffd644e39820a48dc572` FOREIGN KEY (`COLLEGEID`) REFERENCES `college` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('4028265b532c10e201532c12084a0001', '40289f4e52daee430152daefc7030000', '信息安全');
INSERT INTO `major` VALUES ('4028265b532c10e201532c124fb70002', '40289f4e52daee430152daefc7030000', '网络工程');
INSERT INTO `major` VALUES ('4028265b532c10e201532c17cd370011', '40289f4e52daee430152daefc7030000', '其他');
INSERT INTO `major` VALUES ('40289f4e52e38c7d0152e392851a0000', '40289f4e52daee430152daefc7030000', '计算机科学与技术');
INSERT INTO `major` VALUES ('40289f4e52e38c7d0152e394b3ab0002', '40289f4e52daee430152daefc7030000', '电子信息科学与技术');
INSERT INTO `major` VALUES ('4af74e49533b0daa01533bc4b0480007', '40289f4e52daee430152daefc7030000', '计算机类');
INSERT INTO `major` VALUES ('ff80808153175a58015317a4721c0009', '40289f4e52daee430152daefc7030000', '研究生');

-- ----------------------------
-- Table structure for paty
-- ----------------------------
DROP TABLE IF EXISTS `paty`;
CREATE TABLE `paty` (
  `ID` varchar(255) NOT NULL,
  `ACTIVEDATE` datetime DEFAULT NULL,
  `APPLICATIONDATE` datetime DEFAULT NULL,
  `CONFIRMDATE` datetime DEFAULT NULL,
  `DEVELOPDATE` datetime DEFAULT NULL,
  `ISPASSACTIVE` int(11) DEFAULT NULL,
  `JOINPATYDATE` datetime DEFAULT NULL,
  `NOTE` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paty
-- ----------------------------
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5568140002', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5568b40003', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5568d90004', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', '1', null, '');
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5568fa0005', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, '1', null, '');
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c55691d0006', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5569400007', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, '2', null, '');
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c55695f0008', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5569800009', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, '1', null, '');
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c55699f000a', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5569c0000b', '2015-03-22 00:00:00', '2012-09-21 00:00:00', null, null, '1', null, '');
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5569e1000c', '2013-09-26 00:00:00', '2013-09-25 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556a28000d', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556a48000e', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556a6d000f', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556a930010', '2013-09-26 00:00:00', '2013-09-25 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556ab40011', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556ad60012', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556af90013', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556b1b0014', '2015-03-22 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556b440015', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556b6b0016', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556b970017', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556bb20018', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556bcd0019', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556be8001a', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556c02001b', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556c18001c', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556c30001d', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556c45001e', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556c59001f', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c556c6c0020', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56af7f0021', '2014-09-18 00:00:00', '2014-09-17 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56af8d0022', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56afa00023', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56afb10024', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56afbf0025', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56afd40026', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56afe60027', '2013-09-26 00:00:00', '2013-09-25 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56aff30028', '2014-09-18 00:00:00', '2013-09-25 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b0050029', '2015-03-22 00:00:00', '2012-09-24 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b016002a', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b024002b', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b037002c', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b04b002d', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b05a002e', '2013-09-26 00:00:00', '2013-08-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b06d002f', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b07f0030', '2014-03-13 00:00:00', '2014-03-13 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b08e0031', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b09f0032', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b0b10033', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b0c90034', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b0df0035', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b0ee0036', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b0fe0037', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b10c0038', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b1190039', '2012-09-26 00:00:00', '2012-09-22 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c56b128003a', '2013-09-26 00:00:00', '2012-09-22 00:00:00', null, '2014-09-18 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570cbe003b', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570ccb003c', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570cdf003d', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570ceb003e', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570cfb003f', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d130040', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d230041', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d360042', '2013-03-18 00:00:00', '2013-03-15 00:00:00', null, '2013-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d450043', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d540044', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d690045', '2013-03-18 00:00:00', '2013-03-15 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d790046', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d880047', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570d980048', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570da70049', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570db3004a', '2014-03-13 00:00:00', '2014-03-12 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570dc2004b', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570dd2004c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570de1004d', '2013-09-26 00:00:00', '2013-09-24 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570def004e', '2014-09-18 00:00:00', null, null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570dfc004f', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570e0b0050', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570e170051', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c570e230052', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576ed70053', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576ee60054', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576ef40055', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f030056', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f130057', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f200058', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f310059', '2012-09-26 00:00:00', '2012-09-20 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f41005a', '2012-09-26 00:00:00', '2012-09-19 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f50005b', '2014-09-18 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f5f005c', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f6f005d', '2013-03-18 00:00:00', '2012-09-20 00:00:00', null, '2013-09-26 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f80005e', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f8d005f', '2015-03-22 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576f9d0060', '2014-03-13 00:00:00', '2012-09-19 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576fae0061', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576fbd0062', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576fce0063', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576fdb0064', '2015-03-22 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576fe70065', '2013-09-26 00:00:00', '2012-09-20 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c576ff50066', '2015-03-22 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5770000067', '2014-09-18 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5770110068', '2015-03-22 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57701e0069', '2014-09-18 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57702a006a', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c577038006b', '2013-03-18 00:00:00', '2012-09-20 00:00:00', null, '2013-09-26 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57704f006c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c577061006d', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5797ed006e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57985e006f', '2013-09-26 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798710070', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57987d0071', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57988e0072', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798a00073', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798af0074', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798bf0075', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798d60076', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798ec0077', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5798fb0078', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799080079', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c579914007a', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c579922007b', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57992f007c', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57993b007d', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c579948007e', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c579956007f', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799630080', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799710081', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799830082', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799920083', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799a00084', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799af0085', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5799bd0086', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1290087', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1400088', '2013-03-18 00:00:00', '2013-03-23 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c15b0089', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c170008a', '2013-09-26 00:00:00', '2013-09-25 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c181008b', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c192008c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1a0008d', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1b3008e', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1c6008f', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1d30090', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1e40091', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c1f60092', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2040093', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2150094', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2280095', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2350096', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2460097', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2540098', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2600099', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c26e009a', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c280009b', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c28f009c', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c29e009d', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2ad009e', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2ba009f', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2c800a0', '2013-03-18 00:00:00', '2013-03-15 00:00:00', null, '2013-09-26 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2d900a1', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57c2e700a2', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ebf900a3', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec0b00a4', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec2100a5', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec3100a6', '2014-03-13 00:00:00', null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec4600a7', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec6000a8', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec7600a9', '2013-09-26 00:00:00', '2013-03-27 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ec8b00aa', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ecaa00ab', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ecbf00ac', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ecd500ad', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ecf400ae', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed0200af', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed1900b0', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed2e00b1', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed4300b2', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed5d00b3', '2013-09-26 00:00:00', '2012-09-22 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed6d00b4', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed7c00b5', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed8c00b6', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57ed9d00b7', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57eda900b8', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57edb600b9', '2013-03-18 00:00:00', '2012-09-24 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57edc100ba', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57edcf00bb', '2013-09-26 00:00:00', '2013-09-24 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c57edda00bc', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580ca100bd', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580cb200be', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580cc500bf', '2013-09-26 00:00:00', '2012-09-12 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580cdf00c0', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580cf500c1', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d0800c2', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d1800c3', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d2800c4', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d3800c5', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d4800c6', '2012-09-26 00:00:00', '2012-09-22 00:00:00', null, '2013-09-26 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d5800c7', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d6900c8', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d7900c9', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d8a00ca', '2012-09-26 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580d9a00cb', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580daa00cc', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580db900cd', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580dc600ce', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580dd400cf', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580de100d0', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580dee00d1', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580df900d2', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580e0800d3', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580e1500d4', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580e2200d5', '2014-09-18 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580e2f00d6', '2015-03-22 00:00:00', '2015-03-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580e3b00d7', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c580e4800d8', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58395500d9', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58396800da', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58397500db', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58397f00dc', null, '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58399000dd', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5839a200de', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5839ad00df', '2013-09-26 00:00:00', '2012-09-17 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5839bd00e0', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5839d200e1', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5839e100e2', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5839f200e3', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a0200e4', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a0f00e5', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a1e00e6', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a5300e7', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a6500e8', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a7100e9', '2012-09-26 00:00:00', '2012-09-19 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a7d00ea', '2012-09-26 00:00:00', '2012-09-21 00:00:00', '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a8a00eb', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583a9700ec', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583aa200ed', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583aad00ee', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583ab800ef', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583ac300f0', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c583ad000f1', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5872d300f2', null, '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5872e300f3', null, '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5872f000f4', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5872fa00f5', null, '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58730800f6', '2013-09-26 00:00:00', '2012-09-22 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58731e00f7', '2014-09-18 00:00:00', null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58732c00f8', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58733d00f9', '2014-09-18 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58734e00fa', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2013-09-26 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58735a00fb', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58736b00fc', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58737c00fd', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58738900fe', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58739400ff', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873a20100', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873b20101', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873bf0102', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873ce0103', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873de0104', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873ec0105', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5873f60106', null, null, '2013-11-17 00:00:00', null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5874010107', '2013-09-26 00:00:00', '2012-09-24 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58740d0108', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5874180109', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c587427010a', '2014-03-13 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c587431010b', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58743d010c', '2013-03-18 00:00:00', '2012-09-19 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c587449010d', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c587457010e', '2014-09-18 00:00:00', '2012-09-19 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c587465010f', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5874710110', '2014-09-18 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589d5a0111', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589d6b0112', null, '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589d780113', '2013-09-26 00:00:00', '2013-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589d880114', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589d950115', '2014-09-18 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589da40116', '2013-09-26 00:00:00', '2013-03-15 00:00:00', null, '2014-09-18 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589db00117', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589dc00118', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589dd00119', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589ddd011a', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589df1011b', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e09011c', '2014-03-13 00:00:00', '2013-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e17011d', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e27011e', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e39011f', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e440120', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e530121', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e600122', '2013-09-26 00:00:00', '2012-09-22 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e6b0123', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e770124', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e810125', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e8d0126', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589e980127', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589ea30128', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589eaf0129', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589ebb012a', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589ec8012b', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589ed4012c', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589ee1012d', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c589eed012e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd1f012f', null, '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd2f0130', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd3b0131', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd460132', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd550133', '2014-09-18 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd690134', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd740135', '2012-09-26 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd840136', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bd940137', '2014-03-13 00:00:00', '2014-03-14 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bda00138', '2013-09-26 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bdb30139', '2014-09-18 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bdc4013a', null, '2012-09-22 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bdd0013b', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bddb013c', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bde9013d', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bdf8013e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be05013f', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be140140', '2015-03-22 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be270141', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be340142', '2014-09-18 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be420143', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be4f0144', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be5a0145', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be670146', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be740147', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be810148', null, '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be8d0149', '2013-09-26 00:00:00', '2013-09-24 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58be99014a', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bea5014b', '2013-03-18 00:00:00', '2012-09-20 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58beb1014c', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58bebd014d', '2014-03-13 00:00:00', '2012-09-10 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f81f014e', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f85e014f', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f8d60150', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f8df0151', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f8ee0152', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f8ff0153', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9100154', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9240155', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9330156', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f93e0157', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9490158', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9550159', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f961015a', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f96f015b', '2013-03-18 00:00:00', '2012-09-22 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f97b015c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f986015d', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f991015e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f99e015f', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9aa0160', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9b60161', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9c10162', '2013-03-18 00:00:00', '2012-09-17 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9cc0163', '2014-09-18 00:00:00', '2012-09-20 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9d70164', '2013-09-26 00:00:00', '2012-09-11 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9e60165', '2014-03-13 00:00:00', '2012-09-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9f20166', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58f9ff0167', '2013-03-18 00:00:00', '2012-09-23 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58fa0a0168', '2014-03-13 00:00:00', '2012-09-23 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58fa170169', '2012-09-26 00:00:00', '2012-09-23 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58fa23016a', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58fa2f016b', '2013-09-26 00:00:00', '2012-09-23 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58fa39016c', '2014-09-18 00:00:00', '2012-09-23 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c58fa46016d', '2012-09-26 00:00:00', '2012-09-22 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593d8e016e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593d9e016f', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593daf0170', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593dbb0171', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593dc80172', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593dd90173', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593de30174', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593df30175', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e030176', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e120177', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e210178', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e320179', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e41017a', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e4e017b', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e5e017c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e74017d', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e80017e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c593e91017f', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5967d60180', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5967f00181', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59680d0182', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968270183', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968330184', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968440185', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968530186', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59685d0187', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968700188', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968860189', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c596895018a', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968a1018b', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968af018c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968bd018d', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968c7018e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968d1018f', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968de0190', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968e90191', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968f30192', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5968fe0193', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59690c0194', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5969180195', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5969230196', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59692e0197', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59693a0198', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5969460199', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c596953019a', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59695f019b', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59696a019c', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c596977019d', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c596981019e', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59698e019f', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c59699801a0', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c5969a401a1', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598c6501a2', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598c7401a3', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598c7d01a4', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598c8a01a5', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598c9901a6', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598ca701a7', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598cb801a8', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598cc601a9', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598cd701aa', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598ce201ab', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598cf201ac', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d0101ad', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d1001ae', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d2101af', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d3001b0', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d4001b1', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d5001b2', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d5f01b3', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d6c01b4', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d7701b5', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c598d8201b6', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fab701c8', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fad301c9', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fae201ca', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99faee01cb', '2015-03-22 00:00:00', '2015-03-22 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fafd01cc', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb0c01cd', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb1701ce', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb2001cf', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb2e01d0', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb3e01d1', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, '2014-07-04 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb4a01d2', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb5501d3', '2012-09-26 00:00:00', null, '2013-11-17 00:00:00', '2012-09-26 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb6301d4', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fb9301d5', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fba201d6', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbac01d7', '2014-09-18 00:00:00', '2012-09-21 00:00:00', null, '2015-03-22 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbb701d8', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbc501d9', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbd101da', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, '2015-06-01 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbda01db', '2014-03-13 00:00:00', '2012-09-21 00:00:00', null, '2014-09-18 00:00:00', null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbeb01dc', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fbf401dd', null, null, null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fc0001de', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fc0e01df', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fc1901e0', null, '2012-09-21 00:00:00', null, null, null, null, null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fc2501e1', '2013-03-18 00:00:00', '2012-09-21 00:00:00', null, '2013-09-26 00:00:00', null, '2014-12-21 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fc3001e2', '2012-09-26 00:00:00', '2012-09-21 00:00:00', null, '2013-03-18 00:00:00', null, '2013-12-25 00:00:00', null);
INSERT INTO `paty` VALUES ('4028265b532c51eb01532c99fc3b01e3', '2013-09-26 00:00:00', '2012-09-21 00:00:00', null, '2014-03-13 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` varchar(255) NOT NULL,
  `AUTHORITY` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `VALUE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('4028265b535b4a5c01535b4e5f890000', '5', '违纪管理员', 'disciplineAdmin');
INSERT INTO `role` VALUES ('40289f4e52d0f0650152d0f601440000', '1', '辅导员', 'instructor');
INSERT INTO `role` VALUES ('40289f4e52d0f0650152d0f6bbc20001', '2', '老师', 'teacher');
INSERT INTO `role` VALUES ('40289f4e52d0f0650152d0f77b9b0002', '3', '班长', 'monitor');
INSERT INTO `role` VALUES ('40289f4e52d0f0650152d0f811650003', '0', '管理员', 'admin');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` varchar(255) NOT NULL,
  `IDNUMBER` varchar(100) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `CELLPHONE` varchar(100) DEFAULT NULL,
  `DORMITORY` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ISMONITOR` int(11) DEFAULT '0',
  `NAME` varchar(100) NOT NULL,
  `NATIVEPLACE` varchar(100) DEFAULT NULL,
  `POLITICALSTATUS` int(11) DEFAULT NULL,
  `SEX` int(11) DEFAULT NULL,
  `STUID` varchar(100) NOT NULL,
  `CLASSID` varchar(255) DEFAULT NULL,
  `TEACHCLASS` varchar(100) DEFAULT NULL,
  `NATIONALITY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_4ccfc2fe27c242bd85fb57df9e6` (`STUID`),
  KEY `FK_92b0c9039c1f479b87899f73e5a` (`CLASSID`),
  CONSTRAINT `FK_92b0c9039c1f479b87899f73e5a` FOREIGN KEY (`CLASSID`) REFERENCES `class` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5568140002', '', '2016-03-01 00:00:00', '', '', '', '0', '鱼君', '', '4', '0', '08103334', '4028265b532c10e201532c131caf0003', '', '');
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5568b40003', null, null, null, null, null, '0', '曹阳', null, '3', '0', '08123212', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5568d90004', null, null, null, null, null, '0', '陈瑞龙', null, '3', '0', '08123213', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5568fa0005', null, null, null, null, null, '0', '陈子豪', null, '3', '0', '08123214', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c55691d0006', null, null, null, null, null, '0', '程伟', null, '2', '0', '08123215', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5569400007', null, null, null, null, null, '0', '崔凯伦', null, '3', '0', '08123216', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c55695f0008', null, null, null, null, null, '0', '胡东海', null, '3', '0', '08123217', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5569800009', null, null, null, null, null, '0', '胡金成', null, '3', '0', '08123218', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c55699f000a', null, null, null, null, null, '0', '蒋文维', null, '4', '0', '08123219', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5569c0000b', null, null, null, null, null, '0', '李振龙', null, '3', '0', '08123220', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5569e1000c', null, null, null, null, null, '0', '梁振兴', null, '2', '0', '08123221', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556a28000d', null, null, null, null, null, '0', '刘荧杰', null, '3', '0', '08123222', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556a48000e', null, null, null, null, null, '1', '陆凯', null, '3', '0', '08123223', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556a6d000f', null, null, null, null, null, '0', '门政伟', null, '3', '0', '08123224', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556a930010', null, null, null, null, null, '0', '沈玉龙', null, '3', '0', '08123225', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556ab40011', null, null, null, null, null, '0', '孙蒙', null, '3', '0', '08123226', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556ad60012', null, null, null, null, null, '0', '田陆野', null, '2', '0', '08123227', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556af90013', null, null, null, null, null, '0', '王冬升', null, '3', '0', '08123228', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556b1b0014', null, null, null, null, null, '0', '王宗山', null, '3', '0', '08123229', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556b440015', null, null, null, null, null, '0', '王鑫', null, '3', '0', '08123230', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556b6b0016', null, null, null, null, null, '0', '谢润斌', null, '3', '0', '08123231', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556b970017', null, null, null, null, null, '0', '徐鹏', null, '3', '0', '08123232', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556bb20018', null, null, null, null, null, '0', '杨典为', null, '3', '0', '08123233', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556bcd0019', null, null, null, null, null, '0', '杨光敏', null, '3', '0', '08123234', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556be8001a', null, null, null, null, null, '0', '张腾', null, '3', '0', '08123237', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556c02001b', null, null, null, null, null, '0', '郑炽光', null, '3', '0', '08123239', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556c18001c', null, null, null, null, null, '0', '周平', null, '3', '0', '08123240', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556c30001d', null, null, null, null, null, '0', '白文芳', null, '2', '1', '08123241', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556c45001e', null, null, null, null, null, '0', '方静', null, '3', '1', '08123243', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556c59001f', null, null, null, null, null, '0', '姜春婷', null, '3', '1', '08123244', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c556c6c0020', null, null, null, null, null, '0', '孙小雅', null, '3', '1', '08123245', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56af7f0021', null, null, null, null, null, '0', '陈俊杰', null, '3', '0', '08123246', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56af8d0022', null, null, null, null, null, '0', '陈佐', null, '4', '0', '08123248', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56afa00023', null, null, null, null, null, '0', '段康', null, '4', '0', '08123250', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56afb10024', null, null, null, null, null, '1', '冯敏超', null, '3', '0', '08123251', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56afbf0025', null, null, null, null, null, '0', '高文豪', null, '2', '0', '08123252', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56afd40026', null, null, null, null, null, '0', '冷涛', null, '4', '0', '08123254', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56afe60027', null, null, null, null, null, '0', '李大兴', null, '3', '0', '08123255', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56aff30028', null, null, null, null, null, '0', '李炜', null, '3', '0', '08123256', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b0050029', null, null, null, null, null, '0', '刘国栋', null, '3', '0', '08123257', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b016002a', null, null, null, null, null, '0', '卢俊晓', null, '3', '0', '08123258', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b024002b', null, null, null, null, null, '0', '梅盛林', null, '3', '0', '08123259', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b037002c', null, null, null, null, null, '0', '倪梦思', null, '3', '0', '08123260', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b04b002d', null, null, null, null, null, '0', '汤浩源', null, '4', '0', '08123261', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b05a002e', null, null, null, null, null, '0', '陶泽綦', null, '3', '0', '08123262', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b06d002f', null, null, null, null, null, '0', '吴彦飞', null, '3', '0', '08123264', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b07f0030', null, null, null, null, null, '0', '薛强', null, '3', '0', '08123265', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b08e0031', null, null, null, null, null, '0', '叶腾飞', null, '4', '0', '08123266', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b09f0032', null, null, null, null, null, '0', '张润岩', null, '3', '0', '08123267', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b0b10033', null, null, null, null, null, '0', '赵岩', null, '3', '0', '08123270', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b0c90034', null, null, null, null, null, '0', '甄聪', null, '3', '0', '08123271', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b0df0035', null, null, null, null, null, '0', '闫呈祥', null, '3', '0', '08123272', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b0ee0036', null, null, null, null, null, '0', '滕建磊', null, '4', '0', '08123273', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b0fe0037', null, null, null, null, null, '0', '姜秀燕', null, '3', '1', '08123274', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b10c0038', null, null, null, null, null, '0', '李亚鹏', null, '2', '1', '08123275', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b1190039', null, null, null, null, null, '0', '秦悦', null, '3', '1', '08123276', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c56b128003a', null, null, null, null, null, '0', '赵婉春', null, '2', '1', '08123279', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570cbe003b', null, null, null, null, null, '0', '阿杜', null, '3', '0', '08123280', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570ccb003c', null, null, null, null, null, '0', '樊鑫', null, '4', '0', '08123282', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570cdf003d', null, null, null, null, null, '0', '顾荣景', null, '3', '0', '08123284', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570ceb003e', null, null, null, null, null, '0', '郭伟', null, '3', '0', '08123285', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570cfb003f', null, null, null, null, null, '0', '韩坤', null, '3', '0', '08123286', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d130040', null, null, null, null, null, '0', '蒋炜', null, '4', '0', '08123288', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d230041', null, null, null, null, null, '0', '李明洋', null, '3', '0', '08123291', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d360042', null, null, null, null, null, '0', '李小飞', null, '3', '0', '08123292', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d450043', null, null, null, null, null, '0', '李睿', null, '3', '0', '08123293', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d540044', null, null, null, null, null, '0', '刘天皓', null, '4', '0', '08123294', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d690045', null, null, null, null, null, '0', '刘毅', null, '3', '0', '08123295', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d790046', null, null, null, null, null, '0', '马帅龙', null, '4', '0', '08123297', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d880047', null, null, null, null, null, '0', '倪竹刚', null, '3', '0', '08123298', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570d980048', null, null, null, null, null, '0', '欧阳谦', null, '3', '0', '08123299', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570da70049', null, null, null, null, null, '0', '温震震', null, '4', '0', '08123301', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570db3004a', null, null, null, null, null, '0', '吴海洋', null, '3', '0', '08123302', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570dc2004b', null, null, null, null, null, '0', '叶铸', null, '4', '0', '08123305', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570dd2004c', null, null, null, null, null, '0', '于子可', null, '4', '0', '08123306', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570de1004d', null, null, null, null, null, '1', '朱明俊', null, '2', '0', '08123307', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570def004e', null, null, null, null, null, '0', '白玛央宗', null, '3', '1', '08123308', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570dfc004f', null, null, null, null, null, '0', '丁晓芳', null, '2', '1', '08123309', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570e0b0050', null, null, null, null, null, '0', '沈圆', null, '3', '1', '08123310', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570e170051', null, null, null, null, null, '0', '谢梦蓝', null, '2', '1', '08123311', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c570e230052', null, null, null, null, null, '0', '朱换荣', null, '2', '1', '08123312', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576ed70053', null, null, null, null, null, '0', '李赞', null, '4', '0', '01120224', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576ee60054', null, null, null, null, null, '0', '陈俊昌', null, '4', '0', '08113434', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576ef40055', '', null, '13852489724', '', '', '0', '陈斌', '', '3', '0', '08123315', '4028265b532c10e201532c14586f0006', '', '汉族');
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f030056', null, null, null, null, null, '0', '陈浩天', null, '4', '0', '08123316', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f130057', null, null, null, null, null, '0', '杜辰', null, '4', '0', '08123317', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f200058', null, null, null, null, null, '0', '林鸿仁', null, '3', '0', '08123318', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f310059', null, null, null, null, null, '0', '罗江华', null, '3', '0', '08123319', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f41005a', null, null, null, null, null, '1', '秦运输', null, '2', '0', '08123320', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f50005b', null, null, null, null, null, '0', '师建勋', null, '3', '0', '08123321', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f5f005c', null, null, null, null, null, '0', '宋建', null, '3', '0', '08123322', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f6f005d', null, null, null, null, null, '0', '孙成成', null, '2', '0', '08123323', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f80005e', null, null, null, null, null, '0', '王嘉宇', null, '3', '0', '08123324', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f8d005f', null, null, null, null, null, '0', '徐竹', null, '3', '0', '08123325', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576f9d0060', null, null, null, null, null, '0', '薛航', null, '3', '0', '08123326', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576fae0061', null, null, null, null, null, '0', '杨佳尧', null, '3', '0', '08123328', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576fbd0062', null, null, null, null, null, '0', '张佳欢', null, '3', '0', '08123329', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576fce0063', null, null, null, null, null, '0', '张小健', null, '3', '0', '08123330', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576fdb0064', null, null, null, null, null, '0', '张亚', null, '3', '0', '08123331', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576fe70065', null, null, null, null, null, '0', '张元鑫', null, '3', '0', '08123332', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c576ff50066', null, null, null, null, null, '0', '赵亮', null, '3', '0', '08123335', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5770000067', null, null, null, null, null, '0', '周小辉', null, '3', '0', '08123337', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5770110068', null, null, null, null, null, '0', '周志强', null, '3', '0', '08123338', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57701e0069', null, null, null, null, null, '0', '朱杰', null, '3', '0', '08123339', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57702a006a', null, null, null, null, null, '0', '李岩', null, '3', '1', '08123341', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c577038006b', null, null, null, null, null, '0', '王羽', null, '2', '1', '08123342', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57704f006c', null, null, null, null, null, '0', '袁笛', null, '4', '1', '08123345', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c577061006d', null, null, null, null, null, '0', '龚长金', null, '4', '0', '10124325', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5797ed006e', null, null, null, null, null, '0', '刘龙', null, '4', '0', '08113503', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57985e006f', null, null, null, null, null, '0', '陈宇', null, '3', '0', '08123347', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798710070', null, null, null, null, null, '0', '陈振', null, '3', '0', '08123348', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57987d0071', null, null, null, null, null, '1', '崔毅峰', null, '2', '0', '08123349', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57988e0072', null, null, null, null, null, '0', '邓泽泽', null, '4', '0', '08123350', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798a00073', null, null, null, null, null, '0', '韩兆宇', null, '3', '0', '08123353', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798af0074', null, null, null, null, null, '0', '胡兴帅', null, '4', '0', '08123354', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798bf0075', null, null, null, null, null, '0', '黄华育', null, '3', '0', '08123355', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798d60076', null, null, null, null, null, '0', '蒋海波', null, '3', '0', '08123356', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798ec0077', null, null, null, null, null, '0', '柯昌胜', null, '3', '0', '08123357', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5798fb0078', null, null, null, null, null, '0', '刘明清', null, '3', '0', '08123359', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799080079', null, null, null, null, null, '0', '秦冠卫', null, '3', '0', '08123360', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c579914007a', null, null, null, null, null, '0', '任韩恩', null, '4', '0', '08123361', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c579922007b', null, null, null, null, null, '0', '石汉绪', null, '3', '0', '08123362', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57992f007c', null, null, null, null, null, '0', '孙奥迪', null, '4', '0', '08123364', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57993b007d', null, null, null, null, null, '0', '唐俊', null, '3', '0', '08123365', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c579948007e', null, null, null, null, null, '0', '王冲', null, '3', '0', '08123366', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c579956007f', null, null, null, null, null, '0', '王进勇', null, '4', '0', '08123367', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799630080', null, null, null, null, null, '0', '徐科', null, '3', '0', '08123369', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799710081', null, null, null, null, null, '0', '杨万春', null, '3', '0', '08123371', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799830082', null, null, null, null, null, '0', '张国兴', null, '2', '0', '08123372', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799920083', null, null, null, null, null, '0', '黄颖', null, '3', '1', '08123375', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799a00084', null, null, null, null, null, '0', '李密', null, '2', '1', '08123376', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799af0085', null, null, null, null, null, '0', '许芳萃', null, '4', '1', '08123377', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5799bd0086', null, null, null, null, null, '0', '张思杰', null, '1', '1', '08123378', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1290087', null, null, null, null, null, '0', '朱潇宇', null, '4', '0', '02120493', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1400088', null, null, null, null, null, '0', '范琨', null, '3', '0', '08123510', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c15b0089', null, null, null, null, null, '0', '傅凌晨', null, '4', '0', '08123511', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c170008a', null, null, null, null, null, '0', '干兵', null, '3', '0', '08123512', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c181008b', null, null, null, null, null, '0', '高新家', null, '4', '0', '08123513', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c192008c', null, null, null, null, null, '0', '华逸卿', null, '4', '0', '08123515', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1a0008d', null, null, null, null, null, '0', '李季', null, '4', '0', '08123516', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1b3008e', null, null, null, null, null, '0', '李森', null, '3', '0', '08123517', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1c6008f', null, null, null, null, null, '0', '廉永成', null, '3', '0', '08123518', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1d30090', null, null, null, null, null, '0', '刘慧锋', null, '3', '0', '08123519', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1e40091', null, null, null, null, null, '0', '刘云鹏', null, '4', '0', '08123520', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c1f60092', null, null, null, null, null, '0', '芦峰', null, '3', '0', '08123521', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2040093', null, null, null, null, null, '1', '苗清亮', null, '2', '0', '08123523', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2150094', null, null, null, null, null, '0', '齐海龙', null, '3', '0', '08123524', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2280095', null, null, null, null, null, '0', '孙浦朝', null, '2', '0', '08123526', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2350096', null, null, null, null, null, '0', '王冠男', null, '3', '0', '08123527', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2460097', null, null, null, null, null, '0', '王梦', null, '4', '0', '08123528', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2540098', null, null, null, null, null, '0', '王奇', null, '3', '0', '08123529', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2600099', null, null, null, null, null, '0', '王艺豪', null, '3', '0', '08123530', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c26e009a', null, null, null, null, null, '0', '肖轩', null, '4', '0', '08123531', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c280009b', null, null, null, null, null, '0', '徐和康', null, '3', '0', '08123532', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c28f009c', null, null, null, null, null, '0', '许显财', null, '3', '0', '08123533', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c29e009d', null, null, null, null, null, '0', '严子庆', null, '3', '0', '08123534', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2ad009e', null, null, null, null, null, '0', '杨波辉', null, '3', '0', '08123535', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2ba009f', null, null, null, null, null, '0', '赵怀庆', null, '3', '0', '08123536', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2c800a0', null, null, null, null, null, '0', '邹宇驰', null, '2', '0', '08123537', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2d900a1', null, null, null, null, null, '0', '成炜琳', null, '3', '1', '08123538', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57c2e700a2', null, null, null, null, null, '0', '刘旭', null, '3', '1', '08123539', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ebf900a3', null, null, null, null, null, '0', '李翔', null, '4', '0', '08113687', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec0b00a4', null, null, null, null, null, '0', '刘一昊', null, '4', '0', '08113688', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec2100a5', null, null, null, null, null, '0', '边睿', null, '4', '0', '08123541', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec3100a6', null, null, null, null, null, '0', '陈敏', null, '3', '0', '08123544', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec4600a7', null, null, null, null, null, '0', '党朴一', null, '3', '0', '08123545', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec6000a8', null, null, null, null, null, '0', '多杰伦珠', null, '4', '0', '08123546', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec7600a9', null, null, null, null, null, '0', '高岩', null, '3', '0', '08123547', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ec8b00aa', null, null, null, null, null, '0', '葛贺', null, '4', '0', '08123548', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ecaa00ab', null, null, null, null, null, '0', '花毛毛', null, '3', '0', '08123549', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ecbf00ac', null, null, null, null, null, '0', '黄琦', null, '4', '0', '08123550', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ecd500ad', null, null, null, null, null, '0', '贾振强', null, '4', '0', '08123551', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ecf400ae', null, null, null, null, null, '0', '解硕', null, '4', '0', '08123552', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed0200af', null, null, null, null, null, '0', '林嵩楠', null, '4', '0', '08123554', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed1900b0', null, null, null, null, null, '0', '孟硕', null, '4', '0', '08123556', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed2e00b1', null, null, null, null, null, '1', '石亚州', null, '2', '0', '08123558', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed4300b2', null, null, null, null, null, '0', '魏大旺', null, '3', '0', '08123561', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed5d00b3', null, null, null, null, null, '0', '杨宝来', null, '3', '0', '08123562', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed6d00b4', null, null, null, null, null, '0', '张冲', null, '4', '0', '08123563', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed7c00b5', null, null, null, null, null, '0', '张鑫鑫', null, '4', '0', '08123564', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed8c00b6', null, null, null, null, null, '0', '朱永伟', null, '1', '0', '08123566', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57ed9d00b7', null, null, null, null, null, '0', '闫羽健', null, '4', '0', '08123567', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57eda900b8', null, null, null, null, null, '0', '逄博超', null, '3', '0', '08123568', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57edb600b9', null, null, null, null, null, '0', '廖真', null, '2', '1', '08123569', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57edc100ba', null, null, null, null, null, '0', '罗煜璇', null, '4', '1', '08123570', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57edcf00bb', null, null, null, null, null, '0', '孟晨虹', null, '2', '1', '08123571', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c57edda00bc', null, null, null, null, null, '0', '李超奇', null, '3', '0', '10124488', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580ca100bd', '', null, '', '', '', '0', '柏龙蛟', '', '3', '0', '08123572', '4028265b532c10e201532c1507be000a', '', '');
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580cb200be', null, null, null, null, null, '0', '包震', null, '3', '0', '08123573', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580cc500bf', null, null, null, null, null, '0', '常健', null, '3', '0', '08123574', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580cdf00c0', null, null, null, null, null, '0', '戴暄', null, '3', '0', '08123575', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580cf500c1', null, null, null, null, null, '0', '李汉农', null, '3', '0', '08123577', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d0800c2', null, null, null, null, null, '0', '李嘉鑫', null, '2', '0', '08123578', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d1800c3', null, null, null, null, null, '0', '刘旭', null, '3', '0', '08123579', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d2800c4', null, null, null, null, null, '0', '刘洋', null, '2', '0', '08123580', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d3800c5', null, null, null, null, null, '0', '麦初钦', null, '3', '0', '08123581', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d4800c6', null, null, null, null, null, '0', '任青', null, '2', '0', '08123582', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d5800c7', null, null, null, null, null, '0', '王宝财', null, '4', '0', '08123584', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d6900c8', null, null, null, null, null, '0', '王坤', null, '3', '0', '08123585', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d7900c9', null, null, null, null, null, '0', '辛流通', null, '2', '0', '08123587', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d8a00ca', null, null, null, null, null, '0', '杨钧茗', null, '3', '0', '08123588', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580d9a00cb', null, null, null, null, null, '0', '俞涵文', null, '3', '0', '08123589', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580daa00cc', null, null, null, null, null, '0', '张国超', null, '4', '0', '08123590', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580db900cd', null, null, null, null, null, '0', '张健', null, '4', '0', '08123591', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580dc600ce', null, null, null, null, null, '1', '张震', null, '1', '0', '08123592', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580dd400cf', null, null, null, null, null, '0', '窦晖', null, '4', '0', '08123593', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580de100d0', null, null, null, null, null, '0', '覃义江', null, '4', '0', '08123594', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580dee00d1', null, null, null, null, null, '0', '陈俊雯', null, '3', '1', '08123595', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580df900d2', null, null, null, null, null, '0', '崔晓智', null, '3', '1', '08123596', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580e0800d3', null, null, null, null, null, '0', '杜泞岑', null, '3', '1', '08123597', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580e1500d4', null, null, null, null, null, '0', '公雪', null, '3', '1', '08123598', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580e2200d5', null, null, null, null, null, '0', '季江薇', null, '3', '1', '08123599', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580e2f00d6', null, null, null, null, null, '0', '蒲文蓉', null, '3', '1', '08123600', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580e3b00d7', null, null, null, null, null, '0', '师璐', null, '3', '1', '08123601', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c580e4800d8', null, null, null, null, null, '0', '张颖', null, '2', '1', '08123602', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58395500d9', null, null, null, null, null, '0', '张人峰', null, '4', '0', '08113727', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58396800da', null, null, null, null, null, '0', '闫张东', null, '4', '0', '08113730', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58397500db', null, null, null, null, null, '0', '赵旭', null, '4', '0', '08113788', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58397f00dc', null, null, null, null, null, '0', '丁荣源', null, '4', '0', '08123604', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58399000dd', null, null, null, null, null, '0', '符兴发', null, '1', '0', '08123606', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5839a200de', null, null, null, null, null, '0', '黄强', null, '3', '0', '08123607', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5839ad00df', null, null, null, null, null, '0', '廖思鹏', null, '3', '0', '08123610', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5839bd00e0', null, null, null, null, null, '0', '起文', null, '3', '0', '08123613', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5839d200e1', null, null, null, null, null, '0', '屈云轩', null, '3', '0', '08123615', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5839e100e2', null, null, null, null, null, '0', '沈杰', null, '3', '0', '08123616', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5839f200e3', null, null, null, null, null, '0', '王伟', null, '4', '0', '08123617', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a0200e4', null, null, null, null, null, '0', '王卓', null, '3', '0', '08123619', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a0f00e5', null, null, null, null, null, '1', '杨星光', null, '2', '0', '08123620', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a1e00e6', null, null, null, null, null, '0', '张国华', null, '3', '0', '08123621', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a5300e7', null, null, null, null, null, '0', '张孟阳', null, '1', '0', '08123622', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a6500e8', null, null, null, null, null, '0', '赵玉峰', null, '3', '0', '08123623', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a7100e9', null, null, null, null, null, '0', '周瑞云', null, '3', '0', '08123624', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a7d00ea', null, null, null, null, null, '0', '窦舜伟', null, '1', '0', '08123625', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a8a00eb', null, null, null, null, null, '0', '陈汇熙', null, '3', '1', '08123626', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583a9700ec', null, null, null, null, null, '0', '刘铭', null, '3', '1', '08123628', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583aa200ed', null, null, null, null, null, '0', '芶欣', null, '3', '1', '08123629', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583aad00ee', null, null, null, null, null, '0', '宋争艳', null, '2', '1', '08123630', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583ab800ef', null, null, null, null, null, '0', '王雨琪', null, '2', '1', '08123631', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583ac300f0', null, null, null, null, null, '0', '瓮佳星', null, '2', '1', '08123632', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c583ad000f1', null, null, null, null, null, '0', '薛默涵', null, '4', '1', '08123633', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5872d300f2', null, null, null, null, null, '0', '陈世渠', null, '4', '0', '08123445', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5872e300f3', null, null, null, null, null, '0', '程天佑', null, '4', '0', '08123446', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5872f000f4', null, null, null, null, null, '0', '戴锦超', null, '3', '0', '08123447', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5872fa00f5', null, null, null, null, null, '0', '丁军峰', null, '4', '0', '08123448', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58730800f6', null, null, null, null, null, '0', '郭洪强', null, '3', '0', '08123450', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58731e00f7', null, null, null, null, null, '0', '郭柱材', null, '3', '0', '08123451', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58732c00f8', null, null, null, null, null, '1', '胡安东', null, '2', '0', '08123452', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58733d00f9', null, null, null, null, null, '0', '蒋文斌', null, '3', '0', '08123453', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58734e00fa', null, null, null, null, null, '0', '晋忠孝', null, '2', '0', '08123454', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58735a00fb', null, null, null, null, null, '0', '李亮', null, '3', '0', '08123455', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58736b00fc', null, null, null, null, null, '0', '李鹏飞', null, '2', '0', '08123456', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58737c00fd', null, null, null, null, null, '0', '李帅', null, '3', '0', '08123457', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58738900fe', null, null, null, null, null, '0', '林阳辉', null, '4', '0', '08123458', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58739400ff', null, null, null, null, null, '0', '刘敬学', null, '3', '0', '08123459', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873a20100', null, null, null, null, null, '0', '南天棋', null, '4', '0', '08123460', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873b20101', null, null, null, null, null, '0', '牛佳琪', null, '4', '0', '08123461', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873bf0102', null, null, null, null, null, '0', '宋浩然', null, '4', '0', '08123462', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873ce0103', null, null, null, null, null, '0', '汤权', null, '4', '0', '08123463', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873de0104', null, null, null, null, null, '0', '唐宏图', null, '4', '0', '08123464', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873ec0105', null, null, null, null, null, '0', '徐磊', null, '3', '0', '08123465', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5873f60106', null, null, null, null, null, '0', '曾造邦', null, '1', '0', '08123466', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5874010107', null, null, null, null, null, '0', '张保全', null, '3', '0', '08123467', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58740d0108', null, null, null, null, null, '0', '张勇波', null, '3', '0', '08123468', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5874180109', null, null, null, null, null, '0', '赵俊龙', null, '3', '0', '08123469', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c587427010a', null, null, null, null, null, '0', '程义情', null, '3', '1', '08123470', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c587431010b', null, null, null, null, null, '0', '邓松高筠', null, '3', '1', '08123471', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58743d010c', null, null, null, null, null, '0', '何先婷', null, '3', '1', '08123472', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c587449010d', null, null, null, null, null, '0', '黄炀', null, '3', '1', '08123473', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c587457010e', null, null, null, null, null, '0', '乔雪梅', null, '3', '1', '08123474', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c587465010f', null, null, null, null, null, '0', '于晓燕', null, '3', '1', '08123475', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5874710110', null, null, null, null, null, '0', '张冰', null, '3', '1', '08123476', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589d5a0111', null, null, null, null, null, '0', '吴涛', null, '4', '0', '06122485', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589d6b0112', null, null, null, null, null, '0', '曹豪君', null, '4', '0', '08123379', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589d780113', null, null, null, null, null, '0', '郭胜', null, '3', '0', '08123380', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589d880114', null, null, null, null, null, '0', '韩阳', null, '3', '0', '08123381', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589d950115', null, null, null, null, null, '0', '何世甲', null, '3', '0', '08123382', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589da40116', null, null, null, null, null, '0', '孔祥东', null, '2', '0', '08123383', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589db00117', null, null, null, null, null, '0', '寇海峰', null, '4', '0', '08123384', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589dc00118', null, null, null, null, null, '0', '李全立', null, '3', '0', '08123385', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589dd00119', null, null, null, null, null, '0', '林芳明', null, '2', '0', '08123386', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589ddd011a', null, null, null, null, null, '0', '刘斌', null, '4', '0', '08123388', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589df1011b', null, null, null, null, null, '0', '刘小可', null, '4', '0', '08123389', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e09011c', null, null, null, null, null, '1', '卢要强', null, '3', '0', '08123390', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e17011d', null, null, null, null, null, '0', '毛威', null, '3', '0', '08123391', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e27011e', null, null, null, null, null, '0', '孙岩', null, '3', '0', '08123393', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e39011f', null, null, null, null, null, '0', '唐振韬', null, '2', '0', '08123394', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e440120', null, null, null, null, null, '0', '王井增', null, '2', '0', '08123395', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e530121', null, null, null, null, null, '0', '谢炼', null, '3', '0', '08123397', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e600122', null, null, null, null, null, '0', '严宇鹏', null, '3', '0', '08123399', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e6b0123', null, null, null, null, null, '0', '阴志伟', null, '3', '0', '08123400', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e770124', null, null, null, null, null, '0', '余马俊', null, '4', '0', '08123401', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e810125', null, null, null, null, null, '0', '赵新宇', null, '3', '0', '08123402', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e8d0126', null, null, null, null, null, '0', '周正', null, '4', '0', '08123403', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589e980127', null, null, null, null, null, '0', '代佳辉', null, '4', '1', '08123405', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589ea30128', null, null, null, null, null, '0', '韩佳琦', null, '3', '1', '08123406', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589eaf0129', null, null, null, null, null, '0', '廖珈敏', null, '3', '1', '08123407', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589ebb012a', null, null, null, null, null, '0', '刘莎', null, '3', '1', '08123408', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589ec8012b', null, null, null, null, null, '0', '彭明地', null, '2', '1', '08123409', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589ed4012c', null, null, null, null, null, '0', '宋丽', null, '3', '1', '08123410', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589ee1012d', null, null, null, null, null, '0', '王擎', null, '3', '1', '08123411', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c589eed012e', null, null, null, null, null, '0', '黄颖', null, '4', '0', '10124453', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd1f012f', null, null, null, null, null, '0', '陈迪炯', null, '4', '0', '08123412', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd2f0130', null, null, null, null, null, '0', '陈光旭', null, '3', '0', '08123413', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd3b0131', null, null, null, null, null, '0', '龚梦石', null, '4', '0', '08123416', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd460132', null, null, null, null, null, '1', '韩广智', null, '3', '0', '08123418', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd550133', null, null, null, null, null, '0', '贺一宁', null, '3', '0', '08123419', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd690134', null, null, null, null, null, '0', '缐多放', null, '3', '0', '08123420', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd740135', null, null, null, null, null, '0', '李旗', null, '3', '0', '08123421', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd840136', null, null, null, null, null, '0', '李思佳', null, '3', '0', '08123422', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bd940137', null, null, null, null, null, '0', '刘金坤', null, '3', '0', '08123423', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bda00138', null, null, null, null, null, '0', '刘旺', null, '3', '0', '08123424', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bdb30139', null, null, null, null, null, '0', '刘亚灵', null, '3', '0', '08123425', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bdc4013a', null, null, null, null, null, '0', '刘增林', null, '3', '0', '08123426', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bdd0013b', null, null, null, null, null, '0', '柳庭泽', null, '3', '0', '08123427', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bddb013c', null, null, null, null, null, '0', '苗洋', null, '3', '0', '08123428', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bde9013d', null, null, null, null, null, '0', '潘通彤', null, '4', '0', '08123429', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bdf8013e', null, null, null, null, null, '0', '王国庆', null, '4', '0', '08123430', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be05013f', null, null, null, null, null, '0', '徐福', null, '3', '0', '08123432', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be140140', null, null, null, null, null, '0', '杨森', null, '3', '0', '08123433', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be270141', null, null, null, null, null, '0', '张明亚', null, '2', '0', '08123435', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be340142', null, null, null, null, null, '0', '张旭鑫', null, '3', '0', '08123436', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be420143', null, null, null, null, null, '0', '刘明艺', null, '2', '1', '08123437', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be4f0144', null, null, null, null, null, '0', '孙婉译', null, '4', '1', '08123438', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be5a0145', null, null, null, null, null, '0', '孙婕妤', null, '3', '1', '08123439', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be670146', null, null, null, null, null, '0', '王桂凡', null, '3', '1', '08123440', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be740147', null, null, null, null, null, '0', '谢伟欢', null, '4', '1', '08123441', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be810148', null, null, null, null, null, '0', '徐一丹', null, '4', '1', '08123442', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be8d0149', null, null, null, null, null, '0', '姚飞', null, '2', '1', '08123443', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58be99014a', null, null, null, null, null, '0', '张诚诚', null, '2', '1', '08123444', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bea5014b', null, null, null, null, null, '0', '曹庆潮', null, '3', '0', '08123603', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58beb1014c', null, null, null, null, null, '0', '钱昭臣', null, '3', '0', '08123614', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58bebd014d', null, null, null, null, null, '0', '李佛晓', null, '3', '1', '08123627', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f81f014e', null, null, null, null, null, '0', '陈茂松', null, '3', '0', '08123477', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f85e014f', null, null, null, null, null, '0', '丁健', null, '3', '0', '08123478', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f8d60150', null, null, null, null, null, '0', '丁昭然', null, '4', '0', '08123479', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f8df0151', null, null, null, null, null, '0', '范世成', null, '4', '0', '08123480', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f8ee0152', null, null, null, null, null, '0', '符芳龙', null, '3', '0', '08123481', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f8ff0153', null, null, null, null, null, '0', '富鹏', null, '1', '0', '08123482', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9100154', null, null, null, null, null, '0', '高同', null, '3', '0', '08123483', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9240155', null, null, null, null, null, '0', '侯超杰', null, '3', '0', '08123484', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9330156', null, null, null, null, null, '0', '侯永辉', null, '3', '0', '08123485', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f93e0157', null, null, null, null, null, '0', '黄宇鹏', null, '3', '0', '08123486', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9490158', null, null, null, null, null, '0', '李远缘', null, '4', '0', '08123488', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9550159', null, null, null, null, null, '0', '刘强', null, '4', '0', '08123489', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f961015a', null, null, null, null, null, '1', '马彪', null, '3', '0', '08123490', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f96f015b', null, null, null, null, null, '0', '马文宇', null, '3', '0', '08123491', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f97b015c', null, null, null, null, null, '0', '聂亚斌', null, '4', '0', '08123492', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f986015d', null, null, null, null, null, '0', '任玮', null, '2', '0', '08123493', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f991015e', null, null, null, null, null, '0', '施黎明', null, '4', '0', '08123494', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f99e015f', null, null, null, null, null, '0', '孙博', null, '3', '0', '08123495', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9aa0160', null, null, null, null, null, '0', '王德水', null, '4', '0', '08123496', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9b60161', null, null, null, null, null, '0', '魏东', null, '4', '0', '08123497', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9c10162', null, null, null, null, null, '0', '吴光龙', null, '3', '0', '08123498', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9cc0163', null, null, null, null, null, '0', '张壹鸣', null, '3', '0', '08123499', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9d70164', null, null, null, null, null, '0', '瞿学童', null, '3', '0', '08123500', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9e60165', null, null, null, null, null, '0', '陈嘉澍', null, '3', '1', '08123501', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9f20166', null, null, null, null, null, '0', '李聪蕊', null, '3', '1', '08123502', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58f9ff0167', null, null, null, null, null, '0', '李星悦', null, '2', '1', '08123503', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58fa0a0168', null, null, null, null, null, '0', '梁旖敏', null, '3', '1', '08123504', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58fa170169', null, null, null, null, null, '0', '林鑫', null, '2', '1', '08123505', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58fa23016a', null, null, null, null, null, '0', '王雯璟', null, '2', '1', '08123506', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58fa2f016b', null, null, null, null, null, '0', '向燕', null, '2', '1', '08123507', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58fa39016c', null, null, null, null, null, '0', '杨丹', null, '3', '1', '08123508', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c58fa46016d', null, null, null, null, null, '0', '李帅', null, '2', '0', '08123553', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593d8e016e', null, null, null, null, null, null, '李剑宇', null, '4', '0', '08113352', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593d9e016f', null, null, null, null, null, null, '葛甜甜', null, '4', '1', '08113399', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593daf0170', null, null, null, null, null, null, '杨永耀', null, '4', '0', '08113420', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593dbb0171', null, null, null, null, null, null, '邢宏宇', null, '4', '1', '08113432', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593dc80172', null, null, null, null, null, null, '乔沐清', null, '4', '0', '08113445', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593dd90173', null, null, null, null, null, null, '田诗豪', null, '4', '0', '08113446', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593de30174', null, null, null, null, null, null, '黄炳河', null, '4', '0', '08113470', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593df30175', null, null, null, null, null, null, '严天理', null, '4', '0', '08113483', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e030176', null, null, null, null, null, null, '张远志', null, '4', '0', '08113484', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e120177', null, null, null, null, null, null, '李晶', null, '4', '0', '08113500', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e210178', null, null, null, null, null, null, '钱志龙', null, '4', '0', '08113535', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e320179', null, null, null, null, null, null, '伍恺', null, '4', '0', '08113644', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e41017a', null, null, null, null, null, null, '孙伟伟', null, '4', '0', '08113668', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e4e017b', null, null, null, null, null, null, '许元涛', null, '4', '0', '08113673', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e5e017c', null, null, null, null, null, null, '王斌', null, '4', '0', '08113781', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e74017d', null, null, null, null, null, null, '唐海春', null, '4', '0', '08113809', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e80017e', null, null, null, null, null, null, '王强', null, '4', '0', '08113812', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c593e91017f', null, null, null, null, null, null, '朱昱', null, '4', '0', '08113820', '4028265b532c10e201532c17f74d0012', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5967d60180', null, null, null, null, null, '0', '陈少达', null, '4', '0', 'TS13170044', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5967f00181', null, null, null, null, null, '0', '葛柳飞', null, '4', '0', 'TS13170045', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59680d0182', null, null, null, null, null, '0', '郭丽丽', null, '4', '1', 'TS13170046', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968270183', null, null, null, null, null, '0', '蒋礼青', null, '4', '0', 'TS13170047', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968330184', null, null, null, null, null, '0', '王惠', null, '4', '1', 'TS13170048', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968440185', null, null, null, null, null, '0', '王建伟', null, '4', '0', 'TS13170049', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968530186', null, null, null, null, null, '0', '杨媛', null, '4', '1', 'TS13170050', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59685d0187', null, null, null, null, null, '0', '杨琳琳', null, '4', '1', 'TS13170053', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968700188', null, null, null, null, null, '0', '王元平', null, '4', '0', 'TS13170054', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968860189', null, null, null, null, null, '0', '郝宁', null, '4', '0', 'ZS13170001', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c596895018a', null, null, null, null, null, '0', '叶枫', null, '4', '0', 'ZS13170003', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968a1018b', null, null, null, null, null, '0', '鲍苏宁', null, '4', '0', 'ZS13170004', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968af018c', null, null, null, null, null, '0', '蔡达', null, '4', '0', 'ZS13170005', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968bd018d', null, null, null, null, null, '0', '陈雄韬', null, '4', '0', 'ZS13170006', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968c7018e', null, null, null, null, null, '0', '黄祥东', null, '4', '0', 'ZS13170007', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968d1018f', null, null, null, null, null, '0', '康清华', null, '4', '0', 'ZS13170008', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968de0190', null, null, null, null, null, '0', '李响', null, '4', '0', 'ZS13170009', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968e90191', null, null, null, null, null, '0', '宋国娟', null, '4', '1', 'ZS13170010', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968f30192', null, null, null, null, null, '0', '宋路杰', null, '4', '0', 'ZS13170011', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5968fe0193', null, null, null, null, null, '0', '汤镇宇', null, '4', '0', 'ZS13170012', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59690c0194', null, null, null, null, null, '0', '王红阳', null, '4', '0', 'ZS13170013', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5969180195', null, null, null, null, null, '0', '王淑靖', null, '4', '1', 'ZS13170014', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5969230196', null, null, null, null, null, '0', '赵亚', null, '4', '0', 'ZS13170015', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59692e0197', null, null, null, null, null, '0', '朱志宾', null, '4', '0', 'ZS13170016', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59693a0198', null, null, null, null, null, '0', '李文杰', null, '4', '0', 'ZS13170017', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5969460199', null, null, null, null, null, '0', '李晓波', null, '4', '1', 'ZS13170018', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c596953019a', null, null, null, null, null, '0', '马恒', null, '4', '0', 'ZS13170019', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59695f019b', null, null, null, null, null, '1', '薛良勇', null, '4', '0', 'ZS13170020', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59696a019c', null, null, null, null, null, '0', '丁向东', null, '4', '0', 'ZS13170021', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c596977019d', null, null, null, null, null, '0', '王丹茹', null, '4', '1', 'ZS13170022', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c596981019e', null, null, null, null, null, '0', '臧平平', null, '4', '1', 'ZS13170023', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59698e019f', null, null, null, null, null, '0', '连江南', null, '4', '1', 'ZS13170029', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c59699801a0', null, null, null, null, null, '0', '王苗苗', null, '4', '1', 'ZS13170043', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c5969a401a1', null, null, null, null, null, '0', '王婷婷', null, '4', '1', 'ZS13170052', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598c6501a2', null, null, null, null, null, '0', '陈超', null, '4', '0', 'TS14170026', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598c7401a3', null, null, null, null, null, '0', '杜文涛', null, '4', '0', 'TS14170027', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598c7d01a4', null, null, null, null, null, '0', '李正奎', null, '4', '0', 'TS14170028', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598c8a01a5', null, null, null, null, null, '0', '汤海建', null, '4', '0', 'TS14170029', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598c9901a6', null, null, null, null, null, '0', '王超', null, '4', '0', 'TS14170030', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598ca701a7', null, null, null, null, null, '1', '邢贞明', null, '4', '0', 'TS14170031', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598cb801a8', null, null, null, null, null, '0', '张凤', null, '4', '1', 'TS14170032', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598cc601a9', null, null, null, null, null, '0', '张文波', null, '4', '0', 'TS14170033', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598cd701aa', null, null, null, null, null, '0', '赵峰', null, '4', '0', 'TS14170034', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598ce201ab', null, null, null, null, null, '0', '赵玉海', null, '4', '0', 'TS14170035', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598cf201ac', null, null, null, null, null, '0', '刘嘉雄', null, '4', '0', 'TS14170036', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d0101ad', null, null, null, null, null, '0', '倪健', null, '4', '0', 'TS14170037', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d1001ae', null, null, null, null, null, '0', '王观英', null, '4', '1', 'TS14170038', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d2101af', null, null, null, null, null, '0', '王伟东', null, '4', '0', 'TS14170040', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d3001b0', null, null, null, null, null, '0', '吴玎祥', null, '4', '0', 'TS14170041', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d4001b1', null, null, null, null, null, '0', '姚慧冉', null, '4', '1', 'TS14170042', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d5001b2', null, null, null, null, null, '0', '张宁', null, '4', '0', 'TS14170043', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d5f01b3', null, null, null, null, null, '0', '陈晨', null, '4', '1', 'TS14170055', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d6c01b4', null, null, null, null, null, '0', '陈皎', null, '4', '1', 'TS14170056', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d7701b5', null, null, null, null, null, '0', '刘探索', null, '4', '0', 'TS14170057', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c598d8201b6', null, null, null, null, null, '0', '周娜', null, '4', '1', 'TS14170058', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fab701c8', null, null, null, null, null, '0', '陈开武', null, '3', '0', '08123634', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fad301c9', null, null, null, null, null, '0', '陈秋羽', null, '3', '0', '08123636', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fae201ca', null, null, null, null, null, '0', '陈业森', null, '4', '0', '08123637', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99faee01cb', null, null, null, null, null, '0', '党涛涛', null, '3', '0', '08123638', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fafd01cc', null, null, null, null, null, '0', '胡修源', null, '3', '0', '08123639', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb0c01cd', null, null, null, null, null, '0', '黄彦培', null, '3', '0', '08123640', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb1701ce', null, null, null, null, null, '0', '刘林鑫', null, '4', '0', '08123641', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb2001cf', null, null, null, null, null, '0', '刘玉琦', null, '4', '0', '08123642', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb2e01d0', null, null, null, null, null, '0', '马广召', null, '1', '0', '08123643', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb3e01d1', null, null, null, null, null, '0', '苗发彪', null, '2', '0', '08123644', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb4a01d2', null, null, null, null, null, '0', '王栋', null, '3', '0', '08123645', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb5501d3', null, null, null, null, null, '0', '王龙飞', null, '1', '0', '08123646', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb6301d4', null, null, null, null, null, '0', '王随刚', null, '3', '0', '08123647', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fb9301d5', null, null, null, null, null, '0', '吴炀杰', null, '3', '0', '08123648', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fba201d6', null, null, null, null, null, '0', '许晗阳', null, '4', '0', '08123649', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbac01d7', null, null, null, null, null, '0', '杨朔', null, '3', '0', '08123650', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbb701d8', null, null, null, null, null, '0', '姚蓉珂', null, '3', '0', '08123651', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbc501d9', null, null, null, null, null, '0', '张潇', null, '4', '0', '08123652', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbd101da', null, null, null, null, null, '1', '赵星宇', null, '2', '0', '08123653', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbda01db', null, null, null, null, null, '0', '郑峰', null, '3', '0', '08123654', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbeb01dc', null, null, null, null, null, '0', '朱泽达', null, '4', '0', '08123655', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fbf401dd', null, null, null, null, null, '0', '高雅柔', null, '4', '1', '08123657', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fc0001de', null, null, null, null, null, '0', '李静', null, '2', '1', '08123658', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fc0e01df', null, null, null, null, null, '0', '李梦迪', null, '4', '1', '08123659', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fc1901e0', null, null, null, null, null, '0', '刘师师', null, '4', '1', '08123660', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fc2501e1', null, null, null, null, null, '0', '王晴', null, '2', '1', '08123661', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fc3001e2', null, null, null, null, null, '0', '章芮', null, '2', '1', '08123662', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `student` VALUES ('4028265b532c51eb01532c99fc3b01e3', null, null, null, null, null, '0', '张维珺', null, '3', '1', '08123663', '4028265b532c10e201532c15d265000c', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `ROLEID` varchar(100) NOT NULL,
  `CLASSID` varchar(100) DEFAULT NULL,
  `COLLEGEID` varchar(100) DEFAULT NULL,
  `GRADEID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_db27d763a81f423bb321457847d` (`USERNAME`),
  KEY `FK_eb472e321fdb4468b801db11ed4` (`ROLEID`),
  KEY `FK_ac40b3a9a7ec46f89b4291be943` (`CLASSID`),
  KEY `FK_bf6c7cf16804439596ef661c726` (`COLLEGEID`),
  KEY `FK_442f5392b3bf4fc9856c94a921d` (`GRADEID`),
  CONSTRAINT `FK_442f5392b3bf4fc9856c94a921d` FOREIGN KEY (`GRADEID`) REFERENCES `grade` (`ID`),
  CONSTRAINT `FK_ac40b3a9a7ec46f89b4291be943` FOREIGN KEY (`CLASSID`) REFERENCES `class` (`ID`),
  CONSTRAINT `FK_bf6c7cf16804439596ef661c726` FOREIGN KEY (`COLLEGEID`) REFERENCES `college` (`ID`),
  CONSTRAINT `FK_eb472e321fdb4468b801db11ed4` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4028265b532c51eb01532c5eb63101b7', 'RqGGTlyoIeX6ByI60XaH9A==', '08123223', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c131caf0003', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c5f9b6201ba', 'Lyo2G1t0KwtDSf2S/KDqUw==', '08123320', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c14586f0006', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c702fbd01be', 'quLO6CcCnwOzvloT7wEY6w==', 'swy', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '40289f4e52eea86c0152eea96adf0000');
INSERT INTO `user` VALUES ('4028265b532c51eb01532c74a4fa01bf', '47YZ7k5HYaB8q033+T+dww==', '08123523', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c14a4fc0008', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c74ddd201c0', 'Q85PwLrMc+RueWmA/uyG+g==', '08123558', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c14d97b0009', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c78b68501c1', 'J+FASe2mNH4fCbKfh8ZmHA==', '08123620', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c152d0c000b', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c78e64a01c2', 'LPWTSqcHSWKqtJJPJEw0Kg==', '08123592', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c1507be000a', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c793f1f01c3', 'EmtH/I7t+YZD1zV8ID3QbA==', '08123418', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c164f1e000e', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c7968a901c4', 'bUxBJA0A5FoEtg/U2r8nlg==', '08123490', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c167bd3000f', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c79b3ff01c6', 'sv5sKyv3yE34lUx4baIMmg==', 'ZS13170020', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c184aed0013', null, null);
INSERT INTO `user` VALUES ('4028265b532c51eb01532c79db4601c7', 'zCICTYrYjN/BFcVmHZnk/w==', 'TS14170031', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c18801e0014', null, null);
INSERT INTO `user` VALUES ('4028265b53543faa01535440ae3f0000', '4QrcOUm6Wau+VuBX8g+IPg==', 'testinstructor', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '40289f4e52eea86c0152eea96adf0000');
INSERT INTO `user` VALUES ('4028265b535b4a5c01535b51f9d10001', '4QrcOUm6Wau+VuBX8g+IPg==', 'csdis', '4028265b535b4a5c01535b4e5f890000', null, '40289f4e52daee430152daefc7030000', null);
INSERT INTO `user` VALUES ('4028265b5364b930015364c07cef0001', '4QrcOUm6Wau+VuBX8g+IPg==', 'testins', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '40289f4e52eea86c0152eea96adf0000');
INSERT INTO `user` VALUES ('40289f4e531e9a3401531e9ab5a40000', 'wzNncBURtPYCDsYd7TUgWQ==', 'admin', '40289f4e52d0f0650152d0f811650003', null, null, null);
INSERT INTO `user` VALUES ('40289f4e531e9a3401531e9d13ac0001', '4QrcOUm6Wau+VuBX8g+IPg==', 'chenbin', '40289f4e52d0f0650152d0f811650003', null, null, null);
INSERT INTO `user` VALUES ('4af74e49533b0daa01533b5c71a20001', 'eWlcPbKmP4GK0mnQsco58A==', '08123390', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c161f5c000d', null, null);
INSERT INTO `user` VALUES ('4af74e49533b0daa01533b65748c0002', 'OePvperu4hic7vRnPba1ug==', '08123653', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c15d265000c', null, null);
INSERT INTO `user` VALUES ('4af74e49533b0daa01533b66b5d00003', 'AEdjlsMiiscCh5dNxL+4dg==', '08123251', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c138b090004', null, null);
INSERT INTO `user` VALUES ('4af74e49533b0daa01533b688eb00004', 'aFOOAkdsUJNj4J2SBuLwjA==', 'wsn', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '40289f4e52eea86c0152eea96adf0000');
INSERT INTO `user` VALUES ('4af74e49533b0daa01533b6e9a800005', 'fML9uSkNNFa6UpXi8mM2Hg==', '08123452', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c16cf280010', null, null);
INSERT INTO `user` VALUES ('4af74e49533b0daa01533b844b420006', 'vdDV3N1ggj/SDSNVHm2m2Q==', '08123307', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c13e1070005', null, null);
INSERT INTO `user` VALUES ('4af74e49533b0daa01533bc7c8d60008', '4QrcOUm6Wau+VuBX8g+IPg==', 'lx', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '4028265b532c51eb01532c6e64e801bc');
INSERT INTO `user` VALUES ('4af74e49533b0daa01533bcf0c59000a', '4QrcOUm6Wau+VuBX8g+IPg==', 'db', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '4af74e49533b0daa01533bceba530009');
INSERT INTO `user` VALUES ('4af74e49533cbc200153408161510002', 'JNn0neJMF7ahZsoOSFRYhA==', '08123349', '40289f4e52d0f0650152d0f77b9b0002', '4028265b532c10e201532c147b750007', null, null);
INSERT INTO `user` VALUES ('4af74e49534c2a3f015350a2345e0010', '4QrcOUm6Wau+VuBX8g+IPg==', 'lilin', '40289f4e52d0f0650152d0f601440000', null, '40289f4e52daee430152daefc7030000', '4028265b532c51eb01532c6e810101bd');

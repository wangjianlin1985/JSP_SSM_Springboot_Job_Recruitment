/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : job_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-02 11:45:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `companyUserName` varchar(30) NOT NULL COMMENT 'companyUserName',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `qyjb` varchar(20) NOT NULL COMMENT '信用级别',
  `companyName` varchar(20) NOT NULL COMMENT '企业名称',
  `gszch` varchar(20) NOT NULL COMMENT '工商注册号',
  `yyzz` varchar(60) NOT NULL COMMENT '营业执照',
  `gsxz` varchar(20) NOT NULL COMMENT '公司性质',
  `gsgm` varchar(20) NOT NULL COMMENT '公司规模',
  `gghy` varchar(20) NOT NULL COMMENT '公司行业',
  `lxr` varchar(20) NOT NULL COMMENT '联系人',
  `lxdh` varchar(20) NOT NULL COMMENT '联系电话',
  `companyDesc` varchar(8000) NOT NULL COMMENT '公司介绍',
  `address` varchar(80) NOT NULL COMMENT '公司地址',
  `shzt` varchar(20) NOT NULL COMMENT '审核状态',
  PRIMARY KEY  (`companyUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('qy1', '123', '五星信用', '成都乐牛科技有限公司', '91510100060092779R', 'upload/9eab9ed1-9981-4a46-aef6-5eca84a4776f.jpg', '私营', '50-99人', '互联网/电子商务', '高女士', '028-83984083', '<p><span style=\"color: rgb(51, 51, 51); font-family: Arial, 宋体; font-size: 14px;\">本公司是一家集批发、零售|实体洗护为一体的宠物用品电子商务公司。公司目前主要经营来自美国、澳大利亚、加拿大、德国、法国、韩国及日本等国家的高档宠物用品。我们拥有淘宝网宠物用品行业十大金冠店铺——中国宠商在线，目前在淘宝网全国3万5千多家宠物用品店铺中排名第五，西南地区500多家宠物用品店铺排名第一。公司还拥有一家天猫商城——乐牛宠物用品专营店，实体连锁店——麦乐萌宠物洗护。公司现有员工100余人，我们年轻富有梦想、激情富有朝气。现因公司业务飞速增长，需要面向社会招纳英才</span></p>', '成都市高新区府城大道西段399号6栋1单元12层3号', '已审核');
INSERT INTO `t_company` VALUES ('qy2', '123', '四星信用', '盛垣商贸有限公司', '915101056890010298', 'upload/9eab9ed1-9981-4a46-aef6-5eca84a4776f.jpg', '私营', '1-49人', '交通/运输/物流', '赵凯旋', '028-82834234', '<p>统一社会信用代码：915101056890010298</p><p>成立日期：2009-04-28</p><p>组织机构代码：689001029</p><p>经营期限：2009-04-28至3999-01-01</p><p>企业类型：有限责任公司(自然人投资或控股)</p><p>登记机关：青羊区市场和质量监督管理局</p><p>经营状态：存续（在营、开业、在册）</p><p>注册地址：成都市青羊区腾飞大道51号工业集中发展区5-B幢</p><p>注册资本：100.000000万人民币</p><p>经营范围：销售：纺织、服装及家庭用品，首饰、工艺品及收藏品，建材，五金交电，电脑及配件。（依法须经批准的项目，经相关部门批准后方可开展经营活动）。</p><p><br/></p>', '成都市青羊区腾飞大道51号工业集中发展区5-B幢', '已审核');

-- ----------------------------
-- Table structure for `t_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery`;
CREATE TABLE `t_delivery` (
  `deliveryId` int(11) NOT NULL auto_increment COMMENT '投递id',
  `jobObj` int(11) NOT NULL COMMENT '应聘职位',
  `userObj` varchar(30) NOT NULL COMMENT '应聘人',
  `deliveryTime` varchar(20) default NULL COMMENT '投递时间',
  `handleTime` varchar(20) default NULL COMMENT '处理时间',
  `clzt` varchar(20) NOT NULL COMMENT '处理状态',
  `tzxx` varchar(800) NOT NULL COMMENT '通知信息',
  `gzpj` varchar(500) NOT NULL COMMENT '工作评价',
  PRIMARY KEY  (`deliveryId`),
  KEY `jobObj` (`jobObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_delivery_ibfk_1` FOREIGN KEY (`jobObj`) REFERENCES `t_job` (`jobId`),
  CONSTRAINT `t_delivery_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_delivery
-- ----------------------------
INSERT INTO `t_delivery` VALUES ('1', '1', 'user1', '2018-03-01 14:46:55', '2018-03-12 16:33:47', '已通知面试', '请你这个周末下午3点来公司面试', '--');
INSERT INTO `t_delivery` VALUES ('2', '1', 'user2', '2018-03-12 16:14:50', '2018-03-12 16:34:20', '待处理', '--', '--');
INSERT INTO `t_delivery` VALUES ('3', '2', 'user1', '2018-07-02 11:31:34', '--', '待处理', '--', '--');

-- ----------------------------
-- Table structure for `t_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `jobId` int(11) NOT NULL auto_increment COMMENT '职位id',
  `jobTypeObj` int(11) NOT NULL COMMENT '职位类别',
  `jobName` varchar(40) NOT NULL COMMENT '职位名称',
  `jobDesc` varchar(8000) NOT NULL COMMENT '职位描述',
  `salary` varchar(50) NOT NULL COMMENT '工作薪酬',
  `zprs` int(11) NOT NULL COMMENT '招聘人数',
  `xlyq` varchar(20) NOT NULL COMMENT '学历要求',
  `yxqx` varchar(30) NOT NULL COMMENT '有效期限',
  `gzqy` varchar(20) NOT NULL COMMENT '工作区域',
  `gzdz` varchar(80) NOT NULL COMMENT '工作地址',
  `viewNum` int(11) NOT NULL COMMENT '浏览次数',
  `companyObj` varchar(30) NOT NULL COMMENT '发布企业',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`jobId`),
  KEY `jobTypeObj` (`jobTypeObj`),
  KEY `companyObj` (`companyObj`),
  CONSTRAINT `t_job_ibfk_1` FOREIGN KEY (`jobTypeObj`) REFERENCES `t_jobtype` (`jobTypeId`),
  CONSTRAINT `t_job_ibfk_2` FOREIGN KEY (`companyObj`) REFERENCES `t_company` (`companyUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', '1', '淘宝促销客服（在家）', '<p><span style=\"color: rgb(40, 40, 40); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, SimSun, Arial, &quot;Helvetica Neue&quot;, Helvetica; font-size: 14px; background-color: rgb(255, 255, 255);\">1.协助店家完成冲量目标，达成销售业绩</span><br/><span style=\"color: rgb(40, 40, 40); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, SimSun, Arial, &quot;Helvetica Neue&quot;, Helvetica; font-size: 14px; background-color: rgb(255, 255, 255);\">2.帮助客户讲解下单流程，领券方法，活动介绍</span><br/><span style=\"color: rgb(40, 40, 40); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, SimSun, Arial, &quot;Helvetica Neue&quot;, Helvetica; font-size: 14px; background-color: rgb(255, 255, 255);\">3.维护客户，做好平时日常疑问咨询工作</span><br/><span style=\"color: rgb(40, 40, 40); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, SimSun, Arial, &quot;Helvetica Neue&quot;, Helvetica; font-size: 14px; background-color: rgb(255, 255, 255);\">4.做好产品介绍和自媒体促销宣传</span></p>', '120元/天', '12', '初中', '长期有效', '天府新区', '成都春熙路时代广场A15楼6号', '12', 'qy1', '2018-03-06 14:46:47');
INSERT INTO `t_job` VALUES ('2', '2', '仓库管理员', '<p><span style=\"color: rgb(46, 52, 59); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, 微软雅黑, arial, Tahoma, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">工作内容：1.负责仓库日常物资的验收、入库、码放、保管、盘点、对账等工 作；2.我们是淘宝女装店，需要严格按销售清单商品的型号、颜色和数量进行配货、打包发货；</span><br/><span style=\"color: rgb(46, 52, 59); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, 微软雅黑, arial, Tahoma, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">职位要求：1.有过同岗工作经验的优先，2.勤劳肯干，细致认真，能吃苦耐劳，有团队合作精神。3.男女不限。</span><br/><span style=\"color: rgb(46, 52, 59); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, 微软雅黑, arial, Tahoma, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">工作时间：早上9：00-18.00，单休。</span><br/></p>', '2000-4000元/月', '2', '学历不限', '2018-05-01截止', '全成都', '成都市区各个仓库', '4', 'qy1', '2018-03-12 17:01:14');

-- ----------------------------
-- Table structure for `t_jobrecord`
-- ----------------------------
DROP TABLE IF EXISTS `t_jobrecord`;
CREATE TABLE `t_jobrecord` (
  `recordId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `content` varchar(8000) NOT NULL COMMENT '内容',
  `userObj` varchar(30) NOT NULL COMMENT '记录人',
  `recordDate` varchar(20) default NULL COMMENT '记录时间',
  PRIMARY KEY  (`recordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_jobrecord_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jobrecord
-- ----------------------------
INSERT INTO `t_jobrecord` VALUES ('1', '2018年元旦兼职经历', '<p>记得上次是元旦当天，联系了一个商场促销，一大早就去了，一直忙到晚上8点过，好忙啊！</p>', 'user1', '2018-03-06 14:48:00');
INSERT INTO `t_jobrecord` VALUES ('2', '一次兼职受骗经历', '<p>2017年7月，我刚从大学毕业出校门不几天，就遇到一个兼职公司联系我，说给我推荐工作，结果我交了100元介绍费后就没有后续了！</p>', 'user1', '2018-03-12 15:31:56');

-- ----------------------------
-- Table structure for `t_jobtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_jobtype`;
CREATE TABLE `t_jobtype` (
  `jobTypeId` int(11) NOT NULL auto_increment COMMENT '职位类型id',
  `jobTypeName` varchar(20) NOT NULL COMMENT '职位类别名称',
  `jobTypeDesc` varchar(800) NOT NULL COMMENT '职位类别描述',
  PRIMARY KEY  (`jobTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jobtype
-- ----------------------------
INSERT INTO `t_jobtype` VALUES ('1', '促销导购', '帮助顾客快速消费');
INSERT INTO `t_jobtype` VALUES ('2', '物流仓储', '管理员物品运输和库存');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '我这里可以找到工作吗', '这里的公司都多吗，职位多吗？', 'user1', '2018-03-06 14:48:21', '职位分类很多的，总有你感兴趣的！', '2018-03-06 14:48:24');
INSERT INTO `t_leaveword` VALUES ('2', '管理员这里有骗子吗', '这里的发布兼职职位的企业有骗子没有？', 'user1', '2018-03-12 14:46:09', '放心，这里的企业都是我们正规审核的，没审核的企业是不能发布职位的哦！', '2018-03-12 17:08:06');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '大学生兼职平台成立了', '<p>如果你是学生，可以来这里挑选你满意的工作！</p><p>如果你是公司企业，也可以来这里审核后发布职位，供求职者投递！</p>', '2018-03-06 14:48:33');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '学生照片',
  `xl` varchar(20) NOT NULL COMMENT '学历',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `jianliFile` varchar(60) NOT NULL COMMENT '简历文件',
  `smrzzl` varchar(60) NOT NULL COMMENT '实名认证资料',
  `shzt` varchar(20) NOT NULL COMMENT '审核状态',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '张晓芬', '女', '2018-03-05', 'upload/303ccc64-02fa-4cdd-9868-d32f1f76f647.jpg', '本科', '13085903422', 'xiaofen@163.com', '四川成都红星路13号', 'upload/05357931-a471-4276-90bd-ca2a4ae0cb31.doc', 'upload/e9f16439-79b5-462c-b7e5-22fb2098c0dc.doc', '已审核', '2018-03-06 14:43:53');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '杨晓菊', '女', '2018-03-06', 'upload/8c6d2bbf-9df2-4a30-9048-d27ca63d031e.jpg', '大专', '13048302983', 'xiaoju@163.com', '四川南充', 'upload/05357931-a471-4276-90bd-ca2a4ae0cb31.doc', 'upload/e9f16439-79b5-462c-b7e5-22fb2098c0dc.doc', '已审核', '2018-03-12 14:36:30');

-- ----------------------------
-- Table structure for `t_weblink`
-- ----------------------------
DROP TABLE IF EXISTS `t_weblink`;
CREATE TABLE `t_weblink` (
  `linkId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `webName` varchar(50) NOT NULL COMMENT '网站名称',
  `webLogo` varchar(60) NOT NULL COMMENT '网站Logo',
  `webAddress` varchar(80) NOT NULL COMMENT '网站地址',
  PRIMARY KEY  (`linkId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_weblink
-- ----------------------------
INSERT INTO `t_weblink` VALUES ('1', '百度', 'upload/37634fb1-c105-4e62-a3b2-277f10d8f01a.jpg', 'http://www.baidu.com');
INSERT INTO `t_weblink` VALUES ('2', '酷狗', 'upload/NoImage.jpg', 'http://www.kugou.com');

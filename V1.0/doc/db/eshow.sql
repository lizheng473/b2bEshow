/*
MySQL Data Transfer
Source Host: 192.168.1.100
Source Database: eshow
Target Host: 192.168.1.100
Target Database: eshow
Date: 2010-3-19 9:28:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for album
-- ----------------------------
CREATE TABLE `album` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(30) default NULL COMMENT '相册名称',
  `description` varchar(400) default NULL COMMENT '相册描述',
  `photo` varchar(100) default NULL,
  `photoSize` int(11) default NULL COMMENT '照片数目',
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for album_copy
-- ----------------------------
CREATE TABLE `album_copy` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(30) default NULL COMMENT '相册名称',
  `description` varchar(400) default NULL COMMENT '相册描述',
  `photo` varchar(100) default NULL,
  `photoSize` int(11) default NULL COMMENT '照片数目',
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for album_copy1
-- ----------------------------
CREATE TABLE `album_copy1` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(30) default NULL COMMENT '相册名称',
  `description` varchar(400) default NULL COMMENT '相册描述',
  `photo` varchar(100) default NULL,
  `photoSize` int(11) default NULL COMMENT '照片数目',
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for album_copy2
-- ----------------------------
CREATE TABLE `album_copy2` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(30) default NULL COMMENT '相册名称',
  `description` varchar(400) default NULL COMMENT '相册描述',
  `photo` varchar(100) default NULL,
  `photoSize` int(11) default NULL COMMENT '照片数目',
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for app
-- ----------------------------
CREATE TABLE `app` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `updateTime` datetime default NULL,
  `flag` bit(1) default NULL,
  `name` varchar(50) default NULL,
  `url` varchar(100) default NULL,
  `sequence` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
CREATE TABLE `blog` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `updateTime` datetime default NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `commentSize` int(11) default NULL,
  `count` int(11) default NULL,
  `userId` int(11) default NULL,
  `categoryId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(100) default NULL,
  `content` varchar(400) default NULL,
  `ip` varchar(20) default NULL,
  `im` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `website` varchar(50) default NULL,
  `userId` int(11) default NULL,
  `blogId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `userId` (`userId`),
  KEY `blogId` (`blogId`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for board
-- ----------------------------
CREATE TABLE `board` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(100) default NULL COMMENT '版块名称',
  `description` varchar(400) default NULL COMMENT '板块描述',
  `sequence` int(11) default NULL COMMENT '序号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `updateTime` datetime default NULL,
  `name` varchar(20) default NULL,
  `remark` varchar(200) default NULL,
  `sequence` tinyint(2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `title` varchar(200) default NULL,
  `content` varchar(800) default NULL,
  `reply` varchar(800) default NULL,
  `state` int(11) default NULL,
  `username` varchar(50) default NULL,
  `ip` varchar(20) default NULL,
  `im` varchar(50) default NULL,
  `phone` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `website` varchar(50) default NULL,
  `replyId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for info
-- ----------------------------
CREATE TABLE `info` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(20) default NULL,
  `url` varchar(50) default NULL,
  `title` varchar(200) default NULL,
  `content` text,
  `enable` bit(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for photo
-- ----------------------------
CREATE TABLE `photo` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(50) default NULL,
  `description` varchar(400) default NULL,
  `img` varchar(100) default NULL,
  `commentSize` int(11) default NULL,
  `albumId` int(11) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for photo_comment
-- ----------------------------
CREATE TABLE `photo_comment` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `content` varchar(400) default NULL,
  `userId` int(11) default NULL,
  `photoId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for post
-- ----------------------------
CREATE TABLE `post` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `startTime` datetime default NULL,
  `endTime` datetime default NULL,
  `title` varchar(200) default NULL,
  `content` text,
  `enabled` bit(1) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(100) default NULL,
  `content` text,
  `img` varchar(100) default NULL,
  `sequence` int(11) default NULL,
  `enabled` bit(1) default NULL,
  `productCategoryId` int(11) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `description` varchar(400) default NULL,
  `sequence` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `description` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for service
-- ----------------------------
CREATE TABLE `service` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime NOT NULL,
  `updateTime` datetime default NULL,
  `title` varchar(40) NOT NULL,
  `content` text,
  `img` varchar(50) default NULL,
  `sequence` int(11) default NULL,
  `serviceTypeId` int(11) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `serviceTypeId` (`serviceTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for service_type
-- ----------------------------
CREATE TABLE `service_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `remark` varchar(400) default NULL,
  `sequence` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for thumb
-- ----------------------------
CREATE TABLE `thumb` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `description` varchar(400) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `model` varchar(20) default NULL,
  `enabled` bit(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for thumb_img
-- ----------------------------
CREATE TABLE `thumb_img` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(100) default NULL,
  `description` varchar(500) default NULL,
  `img` varchar(100) default NULL,
  `origImg` varchar(100) default NULL,
  `type` varchar(100) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `enabled` bit(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime NOT NULL,
  `updateTime` datetime default NULL,
  `title` varchar(200) NOT NULL,
  `content` text,
  `commentSize` int(11) default NULL,
  `count` int(11) default NULL,
  `tip` bit(1) default NULL,
  `userId` int(11) default NULL,
  `boardId` int(11) default NULL,
  `state` int(11) default NULL,
  `enabled` bit(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic_comment
-- ----------------------------
CREATE TABLE `topic_comment` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `name` varchar(100) default NULL,
  `content` varchar(400) default NULL,
  `ip` datetime default NULL,
  `userId` int(11) default NULL,
  `topicId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for twitter
-- ----------------------------
CREATE TABLE `twitter` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `type` varchar(20) default NULL,
  `content` varchar(400) default NULL,
  `commentSize` int(11) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for twitter_comment
-- ----------------------------
CREATE TABLE `twitter_comment` (
  `id` int(11) NOT NULL auto_increment,
  `addTime` datetime default NULL,
  `content` varchar(400) default NULL,
  `userId` int(11) default NULL,
  `twitterId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `version` int(11) default NULL,
  `addTime` datetime default NULL,
  `updateTime` datetime default NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(20) default NULL,
  `photo` varchar(50) default NULL,
  `realname` varchar(20) default NULL,
  `age` int(11) default NULL,
  `male` bit(1) default NULL,
  `birthday` date default NULL,
  `constellation` tinyint(2) default NULL,
  `birthAttrib` tinyint(2) default NULL,
  `marital` tinyint(1) default NULL,
  `bloodType` tinyint(1) default NULL,
  `hobby` varchar(50) default NULL,
  `intro` text,
  `account_expired` bit(1) default NULL,
  `account_locked` bit(1) default NULL,
  `credentials_expired` bit(1) default NULL,
  `account_enabled` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `album` VALUES ('2', '2009-08-23 18:50:05', '公司相册', '公司相册1', null, null, '1');
INSERT INTO `album` VALUES ('3', '2009-09-03 16:38:55', '餐饮美食', '餐饮美食', null, null, '1');
INSERT INTO `album` VALUES ('4', '2009-09-03 16:39:31', '休闲娱乐', '休闲娱乐', null, null, '1');
INSERT INTO `album` VALUES ('6', '2009-09-03 16:39:59', '逛街购物', '逛街购物', null, null, '1');
INSERT INTO `album` VALUES ('13', '2009-09-03 22:44:15', '生活服务', '生活服务', null, null, '1');
INSERT INTO `album` VALUES ('14', '2010-02-22 15:30:24', '测试', '测试', '20100223/30.jpg', '6', '1');
INSERT INTO `album_copy` VALUES ('2', '2009-08-23 18:50:05', '公司相册', '公司相册1', null, null, '1');
INSERT INTO `album_copy` VALUES ('3', '2009-09-03 16:38:55', '餐饮美食', '餐饮美食', null, null, '1');
INSERT INTO `album_copy` VALUES ('4', '2009-09-03 16:39:31', '休闲娱乐', '休闲娱乐', null, null, '1');
INSERT INTO `album_copy` VALUES ('6', '2009-09-03 16:39:59', '逛街购物', '逛街购物', null, null, '1');
INSERT INTO `album_copy` VALUES ('13', '2009-09-03 22:44:15', '生活服务', '生活服务', null, null, '1');
INSERT INTO `album_copy` VALUES ('14', '2010-02-22 15:30:24', '测试', '测试', '20100223/30.jpg', '6', '1');
INSERT INTO `album_copy1` VALUES ('2', '2009-08-23 18:50:05', '公司相册', '公司相册1', null, null, '1');
INSERT INTO `album_copy1` VALUES ('3', '2009-09-03 16:38:55', '餐饮美食', '餐饮美食', null, null, '1');
INSERT INTO `album_copy1` VALUES ('4', '2009-09-03 16:39:31', '休闲娱乐', '休闲娱乐', null, null, '1');
INSERT INTO `album_copy1` VALUES ('6', '2009-09-03 16:39:59', '逛街购物', '逛街购物', null, null, '1');
INSERT INTO `album_copy1` VALUES ('13', '2009-09-03 22:44:15', '生活服务', '生活服务', null, null, '1');
INSERT INTO `album_copy1` VALUES ('14', '2010-02-22 15:30:24', '测试', '测试', '20100223/30.jpg', '6', '1');
INSERT INTO `album_copy2` VALUES ('2', '2009-08-23 18:50:05', '公司相册', '公司相册1', null, null, '1');
INSERT INTO `album_copy2` VALUES ('3', '2009-09-03 16:38:55', '餐饮美食', '餐饮美食', null, null, '1');
INSERT INTO `album_copy2` VALUES ('4', '2009-09-03 16:39:31', '休闲娱乐', '休闲娱乐', null, null, '1');
INSERT INTO `album_copy2` VALUES ('6', '2009-09-03 16:39:59', '逛街购物', '逛街购物', null, null, '1');
INSERT INTO `album_copy2` VALUES ('13', '2009-09-03 22:44:15', '生活服务', '生活服务', null, null, '1');
INSERT INTO `album_copy2` VALUES ('14', '2010-02-22 15:30:24', '测试', '测试', '20100223/30.jpg', '6', '1');
INSERT INTO `blog` VALUES ('1', '2009-01-26 21:42:19', null, 'EShow开源框架平台成立了', 'Feedscrub:基于智能学习的RSS过滤器 ', '9', '6', '1', '1');
INSERT INTO `blog` VALUES ('2', '2009-02-28 12:38:46', '2009-02-28 12:38:46', '开发环境的简要说明', '2009年美发新时尚2009年美发新时尚2009年美发新时尚\r\n2009年美发新时尚\r\n\r\n2009年美发新时尚', '4', '12', '2', '2');
INSERT INTO `blog` VALUES ('3', '2009-08-22 22:39:11', '2009-08-22 22:39:11', '一、jdk、jre(6.0版本)的安装说明', '<span style=\"font-size:16px;font-family:simsun;\">&nbsp;&nbsp;&nbsp;&nbsp; 股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识是否啊股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识是否啊股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识是否啊股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识股票委托交易基本知识是否啊</span>', '8', '308', '3', '1');
INSERT INTO `blog` VALUES ('4', '2010-02-24 09:54:24', '2010-02-24 09:54:24', '二、程序开发工具MyEclipse(目前版本7.5) 安装', '<p>测光时是飞撒地方是 </p>\r\n', '1', '29', '4', '4');
INSERT INTO `blog` VALUES ('5', '2010-02-26 10:22:35', '2010-02-26 10:22:35', '三、Tomcat6.0.*的安装使用', '　虽然Struts2号称是一个全新的<a href=\"http://baike.baidu.com/view/66971.htm\" target=\"_blank\">框架</a>，但这仅仅是相对Struts 1而言。Struts 2 与Struts 1相比，确实有很多革命性的改进，但它并不是新发布的新框架，而是在另一个赫赫有名的框架：<a href=\"http://baike.baidu.com/view/25660.htm\" target=\"_blank\">WebWork</a>基础上发展起来的。从某种程度上来讲，Struts2没有继承Struts 1的血统，而是继承WebWork的血统。或者说，WebWork衍生出了Struts2，而不是Struts 1衍生了Struts2。因为Struts2是WebWork的升级，而不是一个全新的框架，因此稳定性、性能等各方面都有很好的保证：而且吸收了Struts 1和WebWork两者的优势，因此，是一个非常值得期待的框架。<br />\r\n<div class=\"spctrl\"></div>\r\n　　Apache Struts2是一个优雅的，可扩展的JAVA EE web框架。框架设计的目标贯穿整个开发周期，从开发到发布，包括维护的整个过程。<br />\r\n<div class=\"spctrl\"></div>\r\n　　Apache Struts 2即是之前大家所熟知的WebWork 2。在经历了几年的各自发展后，WebWork和Struts社区决定合二为一，也即是Struts 2<br />\r\n<div class=\"spctrl\"></div>\r\n　　Struts 2 英文学习网站：http://struts.apache.org/2.0.6/docs/guides.html <div class=\"bpctrl\"></div>\r\n<h2><div class=\"text_edit\">[<a onclick=\"editLemmaPara(\'http://baike.baidu.com/edit/\', 1381528, 2); return false;\" href=\"http://baike.baidu.com/view/1381528.htm?fr=ala0_1#\">编辑本段</a>]</div>\r\n<a name=\"2\"></a>Struts2和Struts1的不同</h2>\r\n　　<b>Action 类:</b> <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts1要求Action类继承一个抽象基类。Struts1的一个普遍问题是使用抽象类编程而不是接口。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts 2 Action类可以实现一个Action接口，也可实现其他接口，使可选和定制的服务成为可能。Struts2提供一个ActionSupport基类去实现 常用的接口。Action接口不是必须的，任何有execute标识的POJO对象都可以用作Struts2的Action对象。<br />\r\n<div class=\"spctrl\"></div>\r\n　　<b><a href=\"http://baike.baidu.com/view/1053.htm\" target=\"_blank\">线程</a>模式: <br />\r\n<div class=\"spctrl\"></div>\r\n　　</b>◆Struts1 Action是单例模式并且必须是线程安全的，因为仅有Action的一个实例来处理所有的请求。单例策略限制了Struts1 Action能做的事，并且要在开发时特别小心。Action资源必须是线程安全的或同步的。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts2 Action对象为每一个请求产生一个实例，因此没有线程安全问题。（实际上，servlet容器给每个请求产生许多可丢弃的对象，并且不会导致性能和垃圾回收问题） <br />\r\n<div class=\"spctrl\"></div>\r\n　　<b>Servlet 依赖: <br />\r\n<div class=\"spctrl\"></div>\r\n　　</b>◆Struts1 Action 依赖于Servlet API ,因为当一个Action被调用时HttpServletRequest 和 HttpServletResponse 被传递给execute方法。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts 2 Action不依赖于容器，允许Action脱离容器单独被测试。如果需要，Struts2 Action仍然可以访问初始的request和response。但是，其他的元素减少或者消除了直接访问HttpServetRequest 和 HttpServletResponse的必要性。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　<b>可测性:</b> <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆测试Struts1 Action的一个主要问题是execute方法暴露了servlet API（这使得测试要依赖于容器）。一个第三方扩展－－Struts TestCase－－提供了一套Struts1的模拟对象（来进行测试）。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts 2 Action可以通过初始化、设置属性、调用方法来测试，“依赖注入”支持也使测试更容易。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　捕获输入: <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts1 使用ActionForm对象捕获输入。所有的ActionForm必须继承一个基类。因为其他JavaBean不能用作ActionForm，开发者经常创建多余的类捕获输入。动态Bean（DynaBeans）可以作为创建传统ActionForm的选择，但是，开发者可能是在重新描述(创建)已经存在的JavaBean（仍然会导致有冗余的javabean）。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆ Struts 2直接使用Action属性作为输入属性，消除了对第二个输入对象的需求。输入属性可能是有自己(子)属性的rich对象类型。Action属性能够通过web页面上的taglibs访问。Struts2也支持ActionForm模式。rich对象类型，包括业务对象，能够用作输入/输出对象。这种ModelDriven 特性简化了taglib对POJO输入对象的引用。<br />\r\n<div class=\"spctrl\"></div>\r\n　　<b>表达式语言：</b> <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts1 整合了JSTL，因此使用JSTL EL。这种EL有基本对象图遍历，但是对集合和索引属性的支持很弱。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts2可以使用JSTL，但是也支持一个更强大和灵活的表达式语言－－\"Object Graph Notation Language\" (OGNL). <br />\r\n<div class=\"spctrl\"></div>\r\n　　绑定值到页面（view）: <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆ Struts 1使用标准JSP机制把对象绑定到页面中来访问。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts 2 使用 \"ValueStack\"技术，使taglib能够访问值而不需要把你的页面（view）和对象绑定起来。ValueStack策略允许通过一系列名称相同但类型不同的属性重用页面（view）。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　<b>类型转换：</b> <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts 1 ActionForm 属性通常都是String类型。Struts1使用Commons-Beanutils进行类型转换。每个类一个转换器，对每一个实例来说是不可配置的。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts2 使用OGNL进行类型转换。提供基本和常用对象的转换器。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　<b>校验：</b> <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts 1支持在ActionForm的validate方法中手动校验，或者通过Commons Validator的扩展来校验。同一个类可以有不同的校验内容，但不能校验子对象。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts2支持通过validate方法和XWork校验框架来进行校验。XWork校验框架使用为属性类类型定义的校验和内容校验，来支持chain校验子属性 <br />\r\n<div class=\"spctrl\"></div>\r\n　　<b>Action执行的控制：</b> <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts1支持每一个模块有单独的Request Processors（生命周期），但是模块中的所有Action必须共享相同的生命周期。 <br />\r\n<div class=\"spctrl\"></div>\r\n　　◆Struts2支持通过拦截器堆栈（Interceptor Stacks）为每一个Action创建不同的生命周期。堆栈能够根据需要和不同的Action一起使用。 <div class=\"bpctrl\"></div>\r\n<h2><div class=\"text_edit\">[<a onclick=\"editLemmaPara(\'http://baike.baidu.com/edit/\', 1381528, 3); return false;\" href=\"http://baike.baidu.com/view/1381528.htm?fr=ala0_1#\">编辑本段</a>]</div>\r\n<a name=\"3\"></a>Struts2的工作流程图</h2>\r\n　　 <div style=\"padding-bottom:3px;float:right;visibility:visible;\" class=\"text_pic\"><a href=\"http://baike.baidu.com/image/3bb22487cafd1333c75cc363\" target=\"_blank\"><img class=\"editorImg\" title=\"工作流程\" src=\"http://imgsrc.baidu.com/baike/abpic/item/3bb22487cafd1333c75cc363.jpg\" /></a> <h3 style=\"width:200px;\">工<wbr>作<wbr>流<wbr>程<wbr></h3>\r\n</div>\r\n当接收到一个httprequest<br />\r\n<div class=\"spctrl\"></div>\r\n　　Interceptor做一些拦截或者初始的工作<br />\r\n<div class=\"spctrl\"></div>\r\n　　当外部的httpservletrequest到来时<br />\r\n<div class=\"spctrl\"></div>\r\n　　初始到了servlet容器 传递给一个标准的过滤器链<br />\r\n<div class=\"spctrl\"></div>\r\n　　ActionContextCleanUp这个在集成插件方面非常有用<br />\r\n<div class=\"spctrl\"></div>\r\n　　Other filters(SitMesh,etc)<br />\r\n<div class=\"spctrl\"></div>\r\n　　调用FilterDispatecher会去查找相应的ActionMapper<br />\r\n<div class=\"spctrl\"></div>\r\n　　如果找到了相应的ActionMapper它将会将控制权限交给ActionProxy<br />\r\n<div class=\"spctrl\"></div>\r\n　　ActionProxy将会通过ConfigurationManager来查找配置struts.xml<br />\r\n<div class=\"spctrl\"></div>\r\n　　下一步将会 通过ActionInvocation来负责命令模式的实现（包括调用一些拦截Interceptor框架在调用action之前）<br />\r\n<div class=\"spctrl\"></div>\r\n　　一旦action返回，会查找相应的Result<br />\r\n<div class=\"spctrl\"></div>\r\n　　Result类型可以是 jsp或者freeMark 等<br />\r\n<div class=\"spctrl\"></div>\r\n　　这些组件和ActionMapper一起返回给请求的url（注意拦截器的执行顺序）<br />\r\n<div class=\"spctrl\"></div>\r\n　　响应的返回是通过我们在web.xml中配置的过滤器<br />\r\n<div class=\"spctrl\"></div>\r\n　　如果ActionContextCleanUp是当前使用的，则FilterDispatecher将不会清理<br />\r\n<div class=\"spctrl\"></div>\r\n　　sreadlocal ActionContext<br />\r\n<div class=\"spctrl\"></div>\r\n　　如果ActionContextCleanUp不使用，则将会去清理sreadlocals', '0', '8', '5', '1');
INSERT INTO `blog` VALUES ('6', '2010-02-26 13:42:05', '2010-02-26 13:42:05', '四、数据库：MySQL及其辅助工具Navicat for MySQL的安装使用', '<p>撰写</p>\r\n', '0', '6', '6', '1');
INSERT INTO `blog` VALUES ('7', '2010-02-26 13:42:49', '2010-02-26 13:42:49', '五、团队协作工具：SVN (TortoiseSVN)的安装使用', '撰写中', '0', '5', '7', '1');
INSERT INTO `blog` VALUES ('8', '2010-02-26 13:43:22', '2010-02-26 13:43:22', '六、推荐使用文本编辑工具EditPlus', '撰写中', '0', '3', '8', '1');
INSERT INTO `blog` VALUES ('9', '2010-02-26 13:43:53', '2010-02-26 13:43:53', '七、上传图片处理工具：jmagick的安装', '撰写中', '0', '15', '4', '1');
INSERT INTO `blog` VALUES ('10', '2010-03-01 00:50:41', '2010-03-01 00:50:41', 'OGNL表达式', 'OGNL全称是Object-Graph Navigation Language ，是一个用来获取和设置Java对象属性的表达式语言。<br />\r\n<br />\r\n要使用OGNL表达式，首先需要在web.xml中添加ActionContextClearUp过滤器：<br />\r\n<filter><br />\r\n&nbsp;&nbsp;<filter -NAME><p><filter><br />\r\n&nbsp;&nbsp;<filter -NAME>struts-cleanup</filter -NAME><br />\r\n&nbsp;&nbsp;<filter -CLASS><br />\r\n&nbsp;&nbsp;&nbsp;org.apache.struts2.dispatcher.ActionContextCleanUp<br />\r\n&nbsp;&nbsp;</filter -CLASS><br />\r\n&nbsp;</filter></p>\r\n<filter -MAPPING><br />\r\n&nbsp;&nbsp;<filter -NAME>struts-cleanup</filter -NAME><br />\r\n&nbsp;&nbsp;<url -PATTERN>/*</url -PATTERN><br />\r\n</filter -MAPPING><br />\r\n<br />\r\n在OGNL中经常会遇到的问题是#、%和$这3个符号的使用。<br />\r\n<br />\r\n“#”是用来：<br />\r\n1、访问OGNL上下文和Action上下文，相当于ActionContext.getContext()；<br />\r\n2、可以用来过滤和投影集合，如：users.{?#this.age&gt;20}<br />\r\n3、可以用于构造Map，如：#{a:aa,b:bb}<br />\r\n<br />\r\n“%”的用途是在标示的属性为字符串类型时，计算OGNL表达式的值，如：<br />\r\n<s :property value=\"%{#contactImpl.email}\"></s><?xml:namespace prefix = s /><s :property value=\"%{#contactImpl.email}\"></s :property><br />\r\n<br />\r\n“$”是用来：<br />\r\n1、用于在国际化资源文件中，引用OGNL表达式。<br />\r\n2、在Struts 2配置文件中，引用OGNL表达式，如 ：<br />\r\n<interceptor -REF name=\"fileUploadStack\"/><result type=\"redirect\"><action class=\"addPhoto\" name=\"AddPhoto\"><p><action class=\"addPhoto\" name=\"AddPhoto\"><br />\r\n<interceptor -REF name=\"fileUploadStack\"/></p>\r\n<p><result type=\"redirect\">ListPhotos.action?albumId=${albumId}</result> </p>\r\n<p></action></p>\r\n</action></action><br />\r\nBY Hunter', '1', '64', '4', '4');
INSERT INTO `blog_comment` VALUES ('1', '2009-02-28 16:50:44', '文章不错', '文章不错哈', null, null, null, null, '1', '1');
INSERT INTO `blog_comment` VALUES ('4', '2009-11-19 15:05:04', '回复:2009年美发新时尚', '哪里的发型师比较好？', null, null, null, null, '1', '2');
INSERT INTO `blog_comment` VALUES ('6', '2009-11-19 15:38:57', '回复:Feedscrub:基于智能学习的RSS过滤器 ', '还行', null, null, null, null, '1', '1');
INSERT INTO `blog_comment` VALUES ('7', '2009-11-19 17:53:35', '回复:股票委托交易基本知识', 'CVV', null, null, null, null, '1', '3');
INSERT INTO `blog_comment` VALUES ('8', '2009-11-19 17:55:50', '回复:股票委托交易基本知识', 'dfsdfsd', null, null, null, null, '1', '3');
INSERT INTO `blog_comment` VALUES ('9', '2010-02-22 15:10:05', '回复:股票委托交易基本知识', '的说法', null, null, null, null, '1', '3');
INSERT INTO `blog_comment` VALUES ('10', '2010-04-01 09:21:55', '回复:OGNL表达式', 'asdf', null, null, null, null, '5', '10');
INSERT INTO `blog_comment` VALUES ('11', '2010-04-01 09:25:36', '回复:二、程序开发工具MyEclipse(目前版本7.5) 安装', 'sdaff', null, null, null, null, '5', '4');
INSERT INTO `board` VALUES ('1', '2008-09-28 15:57:47', 'EShow办公室', 'EShow新闻发布，项目进度，任务申领，代码捐献', '1');
INSERT INTO `board` VALUES ('2', '2008-09-28 15:58:04', '开心灌水', '开心灌水', '2');
INSERT INTO `board` VALUES ('3', '2008-09-28 15:58:46', '客户咨询', '客户咨询', '3');
INSERT INTO `board` VALUES ('4', '2009-11-28 15:32:47', '情感交流', '情感交流', '4');
INSERT INTO `board` VALUES ('5', '2010-02-23 09:16:10', '生活小诀窍', '生活小诀窍', '5');
INSERT INTO `board` VALUES ('6', '2010-02-23 09:28:00', '生活在无锡', '生活在无锡', '6');
INSERT INTO `category` VALUES ('1', null, null, '初学教程', '初学者的学习教程', '1');
INSERT INTO `category` VALUES ('2', null, null, '开发日志', '开发日志', '2');
INSERT INTO `category` VALUES ('3', null, null, '心情故事', '心情故事', '3');
INSERT INTO `category` VALUES ('4', null, null, '技术感悟', '技术、感悟', '4');
INSERT INTO `category` VALUES ('5', null, null, '它山之石', '它山之石，可以攻玉', '5');
INSERT INTO `category` VALUES ('6', null, null, '数据库', '数据库的相关知识', null);
INSERT INTO `category` VALUES ('7', null, null, 'Linux', 'Linux的使用', null);
INSERT INTO `feedback` VALUES ('1', '2009-10-26 09:51:56', '11', '11', '点点滴滴', '1', '1', '1', '11', null, '1', '1', '1');
INSERT INTO `feedback` VALUES ('2', '2009-10-26 10:50:05', '333', '&nbsp;333 ', null, null, '222', null, null, null, null, null, null);
INSERT INTO `feedback` VALUES ('3', '2009-10-26 13:43:34', 'king', 'king<img alt=\"\" src=\"http://127.0.0.1:8080/eshow/fckeditor/editor/images/smiley/msn/heart.gif\" />&nbsp;', '服', null, 'king', null, null, null, null, null, null);
INSERT INTO `feedback` VALUES ('4', '2009-10-27 10:26:25', 'love', '&nbsp;love', '颠倒是非', null, 'sherry', null, null, null, null, null, null);
INSERT INTO `feedback` VALUES ('7', '2010-02-22 17:04:15', '但是发生的', '是的防守对方 但是发生的', '死水', null, '哈哈哈地方', null, null, null, null, null, null);
INSERT INTO `feedback` VALUES ('8', '2010-02-22 17:12:06', '晚饭', '晚上吃什么 ？', '呵呵', null, 'lyle', null, null, null, null, null, null);
INSERT INTO `info` VALUES ('1', null, 'about', '关于我们', '<p><br />\r\n&nbsp;</p>\r\n<div class=\"realintro\">\r\n<div class=\"introtitle\">作者:</div>\r\n<div class=\"titledecoratline\">&nbsp;</div>\r\n<br />\r\n<a href=\"http://localhost:8080/eshow/fckeditor/editor/\"><font color=\"#729613\">张磊</font></a>，英文名&nbsp;leida <br />\r\nEshow网创始人 <br />\r\n信奉信息自由，交流创造价值 <br />\r\n<br />\r\n<br />\r\n<div class=\"introtitle\">缘起:</div>\r\n<div class=\"titledecoratline\">&nbsp;</div>\r\n<br />\r\n很长一段时间以来，我对手头的播放器都颇为不爽： <br />\r\n领先的播放器技术都是国外的。 <br />\r\n而国内的所谓播放器 <br />\r\n不仅被插件插的一塌糊涂&mdash;&mdash;尤其是暴风影音这种， <br />\r\n更不用说挂羊头卖狗肉&mdash;&mdash; 只不过将海外的开源播放器拿回来打个包 <br />\r\n就挂上自己的名字开始强奸人家的GPL。 <br />\r\n2008年末，这个华人播放器开源项目启动了。 <br />\r\n我不敢说能够超越海外的播放器，但是会真正为华人的使用习惯，来尽量做得最好~~~而且绝对尊重和遵守开源协议。 <br />\r\n<br />\r\n<div class=\"introtitle\">联系方式:</div>\r\n<div class=\"titledecoratline\">&nbsp;</div>\r\n您可以通过多种方式联系我们： <br />\r\n<br />\r\n如果您有疑问或者意见想和大家讨论 <br />\r\n建议光临我们的 <a href=\"#\"><font color=\"#729613\">论坛</font></a> <br />\r\n<br />\r\n如果您想直接联络我（leida、张磊），可以通过 <br />\r\nEmail: <a href=\"mailto:leida@daoqun.net\">leida@daoqun.net</a><br />\r\nMSN: sentomas@hotmail.com <br />\r\nQQ: tomasen@gmail.com (1091736829) <br />\r\nQQ群：58553685 (稚嫩军团) <br />\r\nTwitter: http:www.daoqun.net<br />\r\ndabr: https://dabr.tomasen.org/user/ShooterPlayer <br />\r\n<b>个人联络须知</b>： <br />\r\n本人常常不在电脑旁。QQ/MSN留言请直接进入主题。纯打招呼恕不回复。\r\n<div title=\"抱歉是图片\">&nbsp;</div>\r\n</div>', '');
INSERT INTO `info` VALUES ('2', null, 'feedback', '汇报Bug', '<div class=\"realintro\"><div class=\"introtitle\">汇报Bug</div>\r\n<div class=\"titledecoratline\">&nbsp;</div>\r\n<br />\r\nEShow作为一个不断追求，不断进化的JAVA学习平台，需要您的反馈和意见。 <br />\r\n<br />\r\n当然我也欢迎您随时Email我直接联络： <a href=\"mailto:leida@daoqun.net\"><font color=\"#729613\">leida@daoqun.net</font></a> </div>\r\n', null);
INSERT INTO `info` VALUES ('3', null, 'joinus', '加入我们', '<div class=\"realintro\">\r\n<div class=\"realintro\">\r\n<div class=\"introtitle\">加入我们:</div>\r\n<div class=\"titledecoratline\">&nbsp;</div>\r\nEShow平台是一个不断追求，不断进化的软件，并且随时欢迎您的加入。 联系方式：<br />\r\nEShow平台是一个不断追求，不断进化的软件，并且随时欢迎您的加入。 联系方式：<br />\r\nEShow平台是一个不断追求，不断进化的软件，并且随时欢迎您的加入。 联系方式：<br />\r\nEShow平台是一个不断追求，不断进化的软件，并且随时欢迎您的加入。 联系方式：<br />\r\nEShow平台是一个不断追求，不断进化的软件，并且随时欢迎您的加入。 联系方式：<br />\r\nEShow平台是一个不断追求，不断进化的软件，并且随时欢迎您的加入。 联系方式： <br />\r\n&nbsp;</div>\r\n</div>', null);
INSERT INTO `info` VALUES ('4', null, 'donate', '捐助开发', '<center><h3>EShow捐赠箱</h3>\r\n<div class=\"adfreeamountbar\"><em>在您的支持下，2008年至今</em>EShow<em>捐赠箱总共收到 &nbsp; </em><div class=\"greenbarouter\"><div id=\"greenbar\" class=\"greenbarinner\">&nbsp;</div>\r\n<i>&nbsp; ￥<span id=\"adfreeamount\">-1500</span>元&nbsp;</i><i class=\"adfreeamounttext\">捐助款项</i></div>\r\n<div style=\"clear:both;\">&nbsp;</div>\r\n</div>\r\n</center><br />\r\n<div><ul><li><b>EShow捐赠箱创建于2008年8月8日。 2008年度收到来自3位支持者共计1500元资助</b></li>\r\n</ul>\r\n<ul><li>EShow创建于2008年，长期致力于Java开源，SSH框架开发的工作，是一个<font color=\"#729613\">非营利性</font>的的网站。</li>\r\n</ul>\r\n<div id=\"expnoprofite\" class=\"donateexp\">非营利组织（Non-Profit Organization，NPO）的运作并不是为了产生利益。非营利组织并非不寻求收入，非营利组织和一般企业之间的差异在于：非营利组织不将盈余分配给拥有者或股东，因之而具有独立、公共、民间等特性。非营利组织还是必须产生收益，以提供其活动的资金。但是，其收入和支出都是受到限制的。非营利组织因此往往由公、私部门捐赠来获得经费。中国大陆目前缺乏相关的法律规范，目前尚无法注册典型意义的非营利组织。要么注册成为普通的营利性公司，或者干脆选择不进行注册。。</div>\r\n<ul><li><b>EShow的主要收入源自广告收入和您的捐款，以负担硬件设备、网络租用、开发、美工与网站编辑方面的支出。</b></li>\r\n</ul>\r\n<ul><li>EShow的收支均向公众公开，详情可以查阅。</li>\r\n<li>只接收支付宝，<a href=\"mailto:zhang20084@126.com\">zhang20084@126.com</a> 张磊</li>\r\n</ul>\r\n</div>\r\n', null);
INSERT INTO `info` VALUES ('5', null, 'link', '友情链接', '<p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" style=\"width: 980px; background: url(images/bg-body.png) repeat-y 50% top\">\r\n    <tbody>\r\n        <tr>\r\n            <td valign=\"top\" style=\"padding-bottom: 40px; padding-left: 40px; padding-right: 40px; background: url(images/bg-sec-12.png) repeat-x 50% top; padding-top: 40px\">\r\n            <div class=\"sideblock\">友情链接： <br />\r\n            <div class=\"friendlinks\"><a href=\"http://www.daoqun.net\"><font color=\"#3399ff\">到群网</font></a> <br />\r\n            <a href=\"http://wenq.org/\"><font color=\"#3399ff\">文泉驿开源字体</font></a> <br />\r\n            &nbsp;</div>\r\n            </div>\r\n            <div id=\"introcontainer\">\r\n            <div class=\"introshadow\">\r\n            <div class=\"realintro\">\r\n            <div>\r\n            <div style=\"text-align: center; width: 100px; float: left\"><a href=\"http://verycd.com\"></a></div>\r\n            <div style=\"text-align: center; width: 100px; float: left\"><a href=\"http://www.yp001.com/\"><img border=\"0\" alt=\"邮票互动网\" src=\"http://www.yp001.com/logo.gif\" width=\"88\" height=\"30\" /><font color=\"#729613\"> </font></a></div>\r\n            <div style=\"clear: both\">&nbsp;</div>\r\n            </div>\r\n            </div>\r\n            </div>\r\n            </div>\r\n            </td>\r\n            <td width=\"3\">&nbsp;</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>', null);
INSERT INTO `info` VALUES ('6', null, 'history', '更多版本', '预览版是随着射手播放器的开发进程不断发展，不断更新的最新版本。预览版不仅包含最新的功能和技术，也包括最新的bug修正。 射手播放器欢迎更多用户参与预览版的测试并做出反馈。但 <b>预览版做为开发中的版本，也确有可能存在一些开发时难以预知的问题，所以并不推荐一般用户下载使用</b>。 关于更新内容也可以通过Blog <a href=\"http://blog.splayer.org/\" target=\"_blank\"><font color=\"#729613\">http://blog.splayer.org/</font></a>查看详细的解释和说明 <br />\r\n<br />\r\n<table class=\"btable\" width=\"100%\">\r\n    <thead>\r\n        <tr>\r\n            <th>Build No.</th>\r\n            <th>标准安装版</th>\r\n            <th>绿色版</th>\r\n            <th>说明</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td>971 <span class=\"stablevertxt\"><font color=\"#008000\">稳定版</font></span></td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/971/SPlayerSetup.exe\"><font color=\"#729613\">标准版</font></a></td>\r\n            <td><a onclick=\"return downcounter(3);\" href=\"http://file.splayer.org/971/splayer.7z\"><font color=\"#729613\">绿色版</font></a></td>\r\n            <td class=\"svnmsg\">\r\n            <div><a href=\"#\">CPU识别SSE41 SSE42的小修正<br />\r\n            识别S3支持硬解的显卡</a></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>970</td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/970/SPlayerSetup.exe\"><font color=\"#729613\">标准版</font></a></td>\r\n            <td><a onclick=\"return downcounter(3);\" href=\"http://file.splayer.org/970/splayer.7z\"><font color=\"#729613\">绿色版</font></a></td>\r\n            <td class=\"svnmsg\">\r\n            <div><a href=\"#\">打开文件的操作超过10秒则确定为打开文件失败，不再无尽的等待<br />\r\n            播放音乐而又不显示标题栏时，鼠标移动到顶部后显示关闭按钮<br />\r\n            CPU检测放入Thread中<br />\r\n            防止一处播放文件夹时可能产生的异常</a></div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<br />\r\n<br />\r\n<table class=\"btable\" width=\"100%\">\r\n    <thead>\r\n        <tr>\r\n            <th>Build No.</th>\r\n            <th>标准安装版</th>\r\n            <th>精简版</th>\r\n            <th>绿色版</th>\r\n            <th>完全版</th>\r\n            <th>说明</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td>192</td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/192/SPlayerSetup.exe\"><font color=\"#729613\">标准版</font></a></td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/192/netSetup.exe\"><font color=\"#729613\">高清版</font></a></td>\r\n            <td><a onclick=\"return downcounter(3);\" href=\"http://file.splayer.org/192/svplayer.rar\"><font color=\"#729613\">绿色版</font></a></td>\r\n            <td>-</td>\r\n            <td class=\"svnmsg\">\r\n            <div><a href=\"#\">新的选项设置逻辑结构<br />\r\n            add some remark</a></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>167</td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/167/SPlayerSetup.exe\"><font color=\"#729613\">标准版</font></a></td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/167/netSetup.exe\"><font color=\"#729613\">高清版</font></a></td>\r\n            <td><a onclick=\"return downcounter(3);\" href=\"http://file.splayer.org/167/svplayer.rar\"><font color=\"#729613\">绿色版</font></a></td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/167/allSetup.exe\"><font color=\"#729613\">完全版</font></a></td>\r\n            <td class=\"svnmsg\">\r\n            <div><a href=\"#\">修正双字幕时字幕重叠的问题<br />\r\n            完成EVR渲染器支持，Vista下自动启用</a></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>40</td>\r\n            <td>-</td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/40/netSetup.exe\"><font color=\"#729613\">高清版</font></a></td>\r\n            <td><a onclick=\"return downcounter(3);\" href=\"http://file.splayer.org/40/mplayerc.zip\"><font color=\"#729613\">绿色版</font></a></td>\r\n            <td><a onclick=\"return downcounter(1);\" href=\"http://file.splayer.org/40/allSetup.exe\"><font color=\"#729613\">完全版</font></a></td>\r\n            <td class=\"svnmsg\">\r\n            <div><a href=\"#\">支持选项中操纵元素style（设置字幕颜色的按钮的基</a></div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', null);
INSERT INTO `info` VALUES ('7', null, 'svn', '源码', '对 <a title=\"版权声明\" href=\"http://localhost:8080/eshow/fckeditor/editor/\"><font color=\"#729613\">版权声明</font></a>的源码 <p>根据以下的原因，您并无权限去做以下的动作:</p>\r\n<p>您刚才的请求只有user用户组的用户才能使用。</p>\r\n<p>您可以查看并复制此页面的源码:</p>\r\n<textarea id=\"wpTextbox1\" rows=\"25\" cols=\"80\" readonly=\"readonly\" name=\"wpTextbox1\">Eshow网遵守《中华人民共和国著作权法》（1990年9月7日第七届全国人民代表大会常务委员会第十五次会议通过，根据2001年10月27日第九届全国人民代表大会常务委员会第二十四次会议《关于修改〈中华人民共和国著作权法〉的决定》修正，下同），对站点上各分类内容相关的版权问题作出如下声明：==字幕翻译版权声明==Eshow网认为所有中文字幕属翻译创作，翻译人为翻译作品的著作权人，其内容之版权均应享有和遵守《中华人民共和国著作权法》相关条款所明确的权利与责任：“第二节 著作权归属，第十二条 改编、翻译、注释、整理已有作品而产生的作品，其著作权由改编、翻译、注释、整理人享有，但行使著作权时不得侵犯原作品的著作权。”“第四节 权利的限制 第二十二条 在下列情况下使用作品，可以不经著作权人许可，不向其支付报酬，但应当指明作者姓名、作品名称，并且不得侵犯著作权人依照本法享有的其他权利：（一）为个人学习、研究或者欣赏，使用他人已经发表的作品；（六）为学校课堂教学或者科学研究，翻译或者少量复制已经发表的作品，供教学或者科研人员使用，但不得出版发行。==文档图片和其他版权声明==上传人-著作权人有权利决定自己上传的内容之传播复制应该遵循何种协议。对于没有指定协议的内容，射手网默认使用“创作共用 by-nc-sa”协议：姓名标示（by）：您可以自由复制、散布、展示及演出本作品；您必须按照作者或授权人所指定的方式，保留其姓名标示。非商业性（nc）：您可以自由复制、散布、展示及演出本作品；您不得为商业目的而使用本作品。相同方式分享（sa）：你可以自由复制、散布、展示及演出本作品；若您改变、转变或改作本作品，仅在遵守与本着作相同的授权条款下，您才能散布由本作品产生的衍生作品。</textarea>', null);
INSERT INTO `info` VALUES ('11', null, 'terms', 'Eshow服务条款', '<div class=\"contxt\">Eshow网（eshow.org.cn）服务条款<br />\r\n一、服务条款的确认和接纳<br />\r\nEshow网（<a href=\"http://www.eshow.org.cn/\">http://www.eshow.org.cn/</a>）及其涉及到的产品、相关软件的所有权和运作权归无锡到群软件科技有限公司（以下简称到群软件）所有， 到群软件享有对Eshow网上一切活动的监督、提示、检查、纠正及处罚等权利。用户通过注册程序阅读本服务条款并点击\"同意\"按钮完成注册，即表示用户与到群软件已达成协议，自愿接受本服务条款的所有内容。如果用户不同意服务条款的条件，则不能获得使用eshow.org.cn服务以及注册成为Eshow网用户的权利。<br />\r\n二、服务保护条款<br />\r\n1、 到群软件运用自己的操作系统通过国际互联网络为用户提供各项服务<br />\r\n2、考虑到到群软件产品服务的重要性，用户同意:<br />\r\n（1）提供必要及准确的个人资料。<br />\r\n（2）不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。<br />\r\n3、用户可授权到群软件向第三方透露其注册资料，否则到群软件不能公开用户的姓名、住址、出件地址、电子邮箱、帐号。除非:<br />\r\n（1）事先获得用户明确授权后，用户要求到群软件或授权某人通过电子邮件服务或其他方式透露这些信息。<br />\r\n（2）相应的法律、法规要求以及按照有关政府主管部门的要求，需要到群软件提供用户的个人资料。<br />\r\n（3）为了维护公众以及Eshow网合法利益。<br />\r\n4、如果用户提供的资料不准确，不合法有效，到群软件保留结束用户使用到群软件各项服务的权利。<br />\r\n用户在享用到群软件各项服务的同时，同意接受到群软件提供的各类信息服务。<br />\r\n5、到群软件定义的信息内容包括:文字、软件、声音、照片、录像、图表；在广告中全部内容；到群软件为用户提供的商业信息等，所有这些内容受版权、商标权、和其它知识产权及所有权法律的保护。所以，用户只能在到群软件授权下才能使用这些内容，而不能擅自复制、修改、编撰这些内容、或创造与内容有关的衍生产品。<br />\r\n6、如果用户未遵守本服务条款的任何一项，到群软件有权利即终止提供一切服务，并保留通过法律手段追究责任的权利。<br />\r\n7、使用Eshow网提供的服务由用户自己承担风险，在适用法律允许的最大范围内，到群软件在任何情况下不就因使用或不能使用Eshow网提供的服务所发生的特殊的、意外的、直接或间接的损失承担赔偿责任。即使已事先被告知该损害发生的可能性。<br />\r\n8、用户须明白，使用Eshow网提供的服务涉及到Internet服务和电信增值服务，可能会受到各个环节不稳定因素的影响。因此服务存在因不可抗力、计算机病毒或黑客攻击、国家相关行业主管部门及电信运营商的调整、系统不稳定、用户所在位置、用户关机以及其他任何技术、互联网络、通信线路原因等造成的服务中断或不能满足用户要求的风险。用户须承担以上风险，到群软件不作担保。对因此导致用户不能发送、上传和接受阅读消息、或接发错消息，或无法实现其他通讯条件，到群软件不承担任何责任。<br />\r\n9、用户须明白，在使用Eshow网提供的服务存在有来自任何他人的包括威胁性的、诽谤性的、令人反感的或非法的内容或行为或对他人权利的侵犯（包括知识产权）的匿名或冒名的信息的风险，用户须承担以上风险，到群软件和合作公司对服务不作任何类型的担保，不论是明确的或隐含的，包括所有有关信息真实性、适用性、所有权和非侵权性的默示担保和条件，对因此导致任何因用户不正当或非法使用服务产生的直接、间接、偶然、特殊及后续的损害，不承担任何责任。<br />\r\n三、用户使用规则<br />\r\n特别提示用户，使用互联网必须遵守国家有关的政策和法律，包括刑法、国家安全法、保密法、计算机信息系统安全保护条例等，保护国家利益，保护国家安全，对于违法使用互联网络而引起的一切责任，由用户负全部责任。<br />\r\n1、用户在申请使用Eshow网提供的网络服务时，必须向到群软件提供准确的个人资料，如个人资料有任何变动，必须及时更新。<br />\r\n2、用户注册成功后，到群软件将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。<br />\r\n3、用户不得使用翻宝网服务发送或传播敏感信息和违反国家法律制度的信息，包括但不限于下列信息:<br />\r\n(a) 反对宪法所确定的基本原则的；<br />\r\n(b) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br />\r\n(c) 损害国家荣誉和利益的；<br />\r\n(d) 煽动民族仇恨、民族歧视，破坏民族团结的；<br />\r\n(e) 破坏国家宗教政策，宣扬邪教和封建迷信的；<br />\r\n(f) 散布谣言，扰乱社会秩序，破坏社会稳定的；<br />\r\n(g) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br />\r\n(h) 侮辱或者诽谤他人，侵害他人合法权益的；<br />\r\n(i) 含有法律、行政法规禁止的其他内容的。<br />\r\n4、用户在使用翻宝网络服务过程中，必须遵循以下原则:<br />\r\n(a) 遵守中国有关的法律和法规；<br />\r\n(b) 不得为任何非法目的而使用网络服务系统；<br />\r\n(c) 遵守所有与网络服务有关的网络协议、规定和程序；<br />\r\n(d) 不得利用Wshow网网络服务系统进行任何可能对互联网的正常运转造成不利影响的行为；<br />\r\n(e) 不得利用Eshow网网络服务系统传输任何骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料；<br />\r\n(f) 不得利用Eshow网网络服务系统进行任何不利于 千橡 公司的行为。<br />\r\n5、使用Eshow网站服务，用户应加强个人资料的保护意识，并注意个人密码的密码保护。<br />\r\n6、盗取他人用户帐号或利用网络通讯骚扰他人，均属于非法行为。用户不得采用测试、欺骗等任何非法手段，盗取其他用户的帐号和对他人进行骚扰。<br />\r\n四、服务条款的修改<br />\r\n到群软件会在必要时修改服务条款，服务条款一旦发生变动，公司将会在用户进入下一步使用前的页面提示修改内容。如果您同意改动，则再一次激活\"我同意\"按钮。如果您不接受，则及时取消您的用户使用服务资格。<br />\r\n用户要继续使用Eshow网各项服务需要两方面的确认:<br />\r\n（1）首先确认Eshow网服务条款及其变动。<br />\r\n（2）同意接受所有的服务条款限制。<br />\r\n五、服务修订<br />\r\n到群软件特别提示用户，到群软件为了保障公司业务发展和调整的自主权， 到群软件拥有随时修改或中断服务而不需通知用户的权利，到群软件行使修改或中断服务的权利不需对用户或任何第三方负责。用户必须在同意本条款的前提下，到群软件才开始对用户提供服务。 <br />\r\n六、用户隐私制度<br />\r\n尊重用户个人隐私是到群软件的一项基本政策。所以，作为对以上第二点个人注册资料分析的补充，到群软件一定不会公开、编辑或透露用户的注册资料及保存在到群软件各项服务中的非公开内容，除非到群软件在诚信的基础上认为透露这些信息在以下几种情况是必要的:<br />\r\n（1）遵守有关法律规定，包括在国家有关机关查询时，提供用户在Eshow网的网页上发布的信息内容及其发布时间、互联网地址或者域名以及其他用户上传至Eshow网的信息。<br />\r\n（2）遵从Eshow网产品服务程序。<br />\r\n（3）保持维护到群软件的商标所有权。<br />\r\n（4）在紧急情况下维护用户个人和社会大众的隐私安全。<br />\r\n（5）到群软件认为必要的其他情况下。<br />\r\n用户在此授权到群软件可以向其电子邮箱发送商业信息。<br />\r\n七、用户的帐号、密码和安全性<br />\r\n用户一旦成功注册，将得到一个密码和帐号。如果用户未保管好自己的帐号和密码而对其自身、到群软件或第三方造成的损害，用户将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。用户可随时改变自己的密码和图标。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通告到群软件。 <br />\r\n八、拒绝提供担保<br />\r\n用户明确同意邮件服务的使用由用户个人承担风险。到群软件不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性、安全性、出错发生都不作担保。到群软件拒绝提供任何担保，包括信息能否准确、及时、顺利地传送。 <br />\r\n九、有限责任<br />\r\n到群软件对直接、间接、偶然、特殊及继起的损害不负责任，这些损害来自:不正当使用产品服务，在网上购买商品或类似服务，在网上进行交易，非法使用服务或用户传送的信息有所变动。用户的上述行为引起对到群软件或第三方的损害，应当依法承担责任并向到群软件进行赔偿，到群软件可以自行或协助第三方使用用户提供的任何信息进行维权。<br />\r\n十、未经到群软件同意禁止进行商业性行为<br />\r\n用户承诺不经到群软件书面同意，不能利用到群软件各项服务在Wshow网或相关网站上进行销售或其他商业性行为。用户违反此约定，到群软件将依法追究其违约责任，由此给到群软件造成损失的，到群软件有权进行追偿。<br />\r\n十一、Eshow网用户信息的储存及限制<br />\r\n到群软件不对用户所发布信息的删除或储存失败负责。 <br />\r\n十二、保障<br />\r\n用户同意保障和维护到群软件全体成员的利益。 <br />\r\n十三、结束服务<br />\r\n用户或到群软件可随时根据实际情况中断服务。到群软件不需对任何个人或第三方负责而随时中断服务。用户若反对任何服务条款的建议或对后来的条款修改有异议，或对到群软件服务不满，用户享有以下的追索权:<br />\r\n（1）不再使用到群软件及（或）Eshow网的服务。<br />\r\n（2）结束用户使用到群软件及（或）Eshow网服务的资格。<br />\r\n（3）书面通告到群软件停止该用户的服务。<br />\r\n结束用户服务后，用户使用到群软件服务的权利马上中止。从那时起，到群软件不再对用户承担任何义务。<br />\r\n十四、通告<br />\r\n所有发给用户的通告都可通过电子邮件或常规的信件传送。到群软件会通过邮件服务发报消息给用户，告诉他们服务条款的修改、服务变更、或其它重要事情。同时，到群软件保留对Eshow网用户投放商业性广告的权利。<br />\r\n十五、参与广告策划<br />\r\n在到群软件书面许可下用户可在他们发表的信息中加入宣传资料或参与广告策划，在Eshow网各项免费服务上展示他们的产品，是在相应的用户和广告销售商之间发生。 到群软件不承担任何责任，到群软件没有义务为这类广告销售负任何责任。&nbsp;<br />\r\n十六、免责与赔偿声明<br />\r\n1、若到群软件已经明示其网络服务提供方式发生变更并提醒用户应当注意事项，用户未按要求操作所产生的一切后果由用户自行承担。<br />\r\n2、用户明确同意其使用到群软件网络服务所存在的风险将完全由其自己承担；因其使用到群软件服务而产生的一切后果也由其自己承担，到群软件对用户不承担任何责任。<br />\r\n3、到群软件不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。<br />\r\n4、用户同意保障和维护到群软件及其他用户的利益，由于用户登录网站内容违法、不真实、不正当、侵犯第三方合法权益，或用户违反本协议项下的任何条款而给到群软件或任何其他第三人造成损失，用户同意承担由此造成的损害赔偿责任。<br />\r\n十七、法律<br />\r\n用户和到群软件一致同意有关本协议以及使用到群软件的服务产生的争议交由仲裁解决，但是到群软件有权选择采取诉讼方式，并有权选择受理该诉讼的有管辖权的法院。若有任何服务条款与法律相抵触，那这些条款将按尽可能接近的方法重新解析，而其它条款则保持对用户产生法律效力和影响。<br />\r\n十八、其他<br />\r\n1、到群软件将视向用户所提供服务内容之特性，要求用户在注册千橡公司提供的有关服务时，遵守特定的条件和条款；如该特定条件和条款与以上服务条款有任何不一致之处，则已特定条件和条款为准。<br />\r\n2、本服务条款中的任何条款无论因何种原因完全或部分无效或不具有执行力，其余条款仍应有效并且有约束力。<br />\r\n3、本服务条款执行过程中所产生的任何问题翻宝网和用户都将友好协商解决。<br />\r\n4、以上条款的解释权归到群软件最终所有。<br />\r\n</div>\r\n', null);
INSERT INTO `info` VALUES ('8', null, 'eshow', '关于EShow', '<a class=\"lnk1\" href=\"http://127.0.0.1/eshow/fckeditor/editor/\"><img class=\"ftr\" src=\"http://127.0.0.1/eshow/images/technology.jpg\" width=\"111\" height=\"59\" alt=\"\" /><strong>技术领先</strong><span><font color=\"#000000\"> 采用流行的J2EE轻量级框架（Struts2+Spring<br />\r\n+Hibernate），基于国外开源框架Appfuse，我们可以简称Appfuse中文加强版&hellip;</font></span> </a><a class=\"lnk1\" href=\"http://127.0.0.1/eshow/fckeditor/editor/\"><img class=\"ftr\" src=\"http://127.0.0.1/eshow/images/easy.jpg\" width=\"111\" height=\"59\" alt=\"\" /><strong>简单易用</strong><span><font color=\"#000000\"> Java新手和入门SSH框架着，非常简单，非常易用！</font></span> </a><a class=\"lnk1\" href=\"http://127.0.0.1/eshow/fckeditor/editor/\"><img class=\"ftr\" src=\"http://127.0.0.1/eshow/images/fast.jpg\" width=\"111\" height=\"59\" alt=\"\" /><strong>快速开发</strong><span><font color=\"#000000\"> 使用基于SSH框架的EShow平台，可以快速开发出中小型企业网站和社区门户！</font></span> </a><a class=\"lnk1\" onclick=\"return downcounter(3);\" href=\"http://file.splayer.org/splayer.7z\" target=\"_blank\"><img class=\"ftr\" border=\"0\" src=\"http://127.0.0.1/eshow/images/opensource.jpg\" width=\"111\" height=\"59\" alt=\"\" /><strong>完全开源</strong><span><font color=\"#000000\"> 完全开放EShow的每一个细节！</font></span> </a><a class=\"lnk1\" href=\"http://127.0.0.1/eshow/fckeditor/editor/\"><img class=\"ftr\" src=\"http://127.0.0.1/eshow/images/update.jpg\" width=\"111\" height=\"59\" alt=\"\" /><strong>更新迅速</strong><span><font color=\"#000000\"> 到群软件团队会每一天更新EShow平台，使得EShow越来越好</font></span> </a><a class=\"lnk1\" href=\"http://127.0.0.1/eshow/fckeditor/editor/\"><img class=\"ftr\" src=\"http://127.0.0.1/eshow/images/ideal.jpg\" width=\"111\" height=\"59\" alt=\"\" /><strong>理想远大</strong><span><font color=\"#000000\"> 让EShow平台成为Java入门者的必备学习框架，成为一个流行的J2EE框架</font></span> </a>', null);
INSERT INTO `info` VALUES ('9', null, 'topicRule', '论坛规则', '<span style=\"font-size:18px;font-family:simhei;\">论坛规则</span><br />\r\n<br />\r\n1、请自觉遵守国家法律和互联网基本规则，不得发表任何政治性和违法言论，不得使用不文明的词语，不要发布会给阅读者带来严重不适或恐惧的文字和图片；<br />\r\n2、不得散布不负责任的谣言；<br />\r\n3、不能进行任何形式的人身攻击（包括发贴与论坛悄悄）；<br />\r\n4、对于音乐和HIFI器材的体会是非常主观的东西，在讨论过程中，如果发生争执，务请各方克制，禁止使用过激性语言；<br />\r\n5、不要发布毫无意义的空贴以及内容重复的帖子。<br />\r\n6、所发表的言论应当以实事求是为原则，不虚构，不夸大，不对未听过或者不了解的器材妄加评论，以真诚和谦虚的态度与网友交流，互相学习，互相提高。任何不以平等方式与网友进行交流者不受欢迎。不同档次的音响器材都有其使用者和爱好者，不同级别的玩家不应当以自己的标准恶意攻击其他档次的器材及玩家。<br />\r\n7、本网站分类开设了几个不同内容的讨论区，请注意在相应的讨论区里只能发表内容相关的贴子，以维护论坛的系统性和整洁性，非相关内容将被删除或移动到相关的讨论区，而不事先说明；<br />\r\n8、本站所用论坛系统只能检索贴子标题，所以标题中请尽量使用与内容相关的关键词，尽量使用规范、正确的文字。<br />\r\n9、转载其他来源的文章或资料时，必须注明作者以及所刊载的刊物/网站名。因转载而涉及的版权问题由转载者自行负责。严谨剽窃他人文章作为自己的发言； <p align=\"left\">10、用户名管理规则，用户不得注册以下用户名<br />\r\na、党和国家领导人或其他名人的真实姓名、字号、艺名、笔名；<br />\r\nb、国家机构或其他机构的名称；<br />\r\nc、其他网友之名相近、相仿的名字；<br />\r\nd、不文明、不健康之名字；<br />\r\ne、易产生歧义、引起他人误解之名字，如“管理员”之类。<br />\r\nf、图形、符号名字。</p>\r\n<p align=\"left\">11、注册用户应妥善保管用户名登陆密码，不要使用过于简单的密码，在公共电脑登陆网站离开前应退出登陆，以免被他人冒用用户名。如出现用户名被他人盗用或不同人员使用同一用户名而导致交易问题、违规发言等，责任一概由该用户名原注册人负责。本站用户名不得进行任何形式的有偿转让，一经发现立即锁定用户名。</p>\r\n<p align=\"left\">12、关于商业信息/广告。<br />\r\na、除了专门设置的商业信息区用于本站认证商家发布商业信息外，其他版块包括二手交易区，都不允许发布任何商业广告，并禁止任何倒卖器材牟利的行为以及任何个人组织的团购活动。二手区是网友交流自用物品的地方。详细交易规则请看二手区置顶贴。</p>\r\n<p align=\"left\">对于国外HIFI品牌总代理及国内正规耳机生产企业，在通过网站核实后给予在《行业信息》版发布行业信息的权利，详细规则见行业信息版置顶贴。</p>\r\n<p align=\"left\">b、各地正规HIFI产品经销商可把自己的信息发到耳机论坛置顶的“耳机购买指南”一贴的后面，只限一次。不得在论坛其他版块，包括各地交流版发布广告信息。</p>\r\n<p align=\"left\">c、如发现乱发广告贴或通过论坛悄悄话乱发广告者，一律全部删除所发帖子/悄悄话，并锁定用户名。对于不断注册重复发广告者，将屏蔽IP并屏蔽有关关键词</p>\r\n<p align=\"left\">d、提醒大家网上交易有风险，二手交易区所有交易行为均与本站无关。</p>\r\n<p align=\"left\">13、对于本站管理和发展的建议或者投诉可发到《建议与投诉区》，不通过这个渠道对网站或者网站管理人员进行攻击谩骂者，按人身攻击处理。</p>\r\n<p align=\"left\">14、对于故意捣乱、制造事端、挑拨离间者封用户名处理。</p>\r\n<p align=\"left\">15、对于网站管理和帖子处理，本站管理人员拥有最终裁定权，在作出最后裁定后仍然纠缠不清者封用户名处理。</p>\r\n<p align=\"left\">16、任何个人或者团体、公司不得注册多个用户名（马甲），隐瞒真实身份，进行恶意攻击或者自我吹捧、炒做，一旦发现立即公布，并封用户名。对于部分屡教不改的团体及公司将屏蔽其关键词。</p>\r\n<p align=\"left\">17、对于未经许可转载本站原创文章的商业网站，本站保留采取法律手段解决的权利，并屏蔽其关键词。</p>\r\n', null);
INSERT INTO `info` VALUES ('10', null, 'team', '团队成员', '<div class=\"span-14 border\"><div id=\"discover-content\" class=\"section\"><p sizset=\"0\" sizcache=\"2\"><img alt=\"\" src=\"http://www.daoqun.net/images/team/leida-wang.jpg\" /></p>\r\n<p><strong><font color=\"#800000\">Leida 张磊</font></strong><br />\r\n80后，来自周恩来的故乡，04年开始编程生涯，热爱Java，热衷于策划和运营。早期从事生物软件研发，07年服务一家台资企业，08年创业一年失败告终，09年上半年在无锡一家软件公司负责产品研发，09年下半年及以后将全部付出给一家顶尖互联网公司。。<br />\r\n&nbsp;</p>\r\n<p sizset=\"1\" sizcache=\"2\"><img alt=\"\" src=\"http://www.daoqun.net/images/team/sluna-wang.jpg\" /><br />\r\n<strong><font color=\"#800000\">Sluna 李海涛</font></strong><br />\r\n女,80后,sluna (本名:李海涛).一次偶然的机会,07让我漫入计算机行业,它不仅给了我方向,也给了我很多自信.很高兴能加入一支充满活力，智慧的到群团队,希望善与人际交往,富有创造性思维,对工作有极高的热情和强烈的责任心的我能给此团队出份力。<br />\r\n&nbsp;</p>\r\n<p sizset=\"1\" sizcache=\"2\"><img alt=\"\" src=\"http://www.daoqun.net/images/team/pixy-wang.jpg\" /><br />\r\n<span style=\"color:#800000;\"><strong>Pixy（本名：黄杨）</strong></span><br />\r\n男，80后，徐州籍，现位于无锡。毕业后来到无锡，辗转3月，幸遇leida，从此在软件事业上奋斗。喜欢钓鱼和旅游。最大的梦想就是成为一个JAVA界的牛人。。<br />\r\n&nbsp;</p>\r\n<p sizset=\"1\" sizcache=\"2\"><img alt=\"\" src=\"http://www.daoqun.net/images/team/king-wang.jpg\" /><br />\r\n<span style=\"color:#800000;\"><strong>King杨贤康</strong></span><br />\r\n80后，来自徐州，一直倾心于IT事业，兴趣爱好相当广泛，希望跟随团队共同创建我们的事业，为理想而奋进！Come on！</p>\r\n</div>\r\n</div>\r\n', null);
INSERT INTO `photo` VALUES ('6', '2009-09-01 09:56:31', '飞机', '飞机', '6.jpg', null, '2', '1');
INSERT INTO `photo` VALUES ('8', '2009-09-03 22:44:29', 'ss', 'ss', '8.jpg', null, '3', '1');
INSERT INTO `photo` VALUES ('9', '2009-09-03 22:45:03', 'ss', 'ss', '9.jpg', null, '13', '1');
INSERT INTO `photo` VALUES ('10', '2009-09-03 22:45:31', 'sss', 'sssssss', '10.jpg', null, '13', '1');
INSERT INTO `photo` VALUES ('11', '2009-09-03 22:46:28', 'ddd', 'dd', '11.jpg', null, '4', '1');
INSERT INTO `photo` VALUES ('14', '2009-09-03 22:52:17', '', '', null, null, '2', '1');
INSERT INTO `photo` VALUES ('15', '2009-09-11 00:04:35', 'd', 'd', '15.jpg', null, '3', '1');
INSERT INTO `photo` VALUES ('25', '2010-02-23 13:20:04', '1212', '2121', '25.jpg', null, '14', '1');
INSERT INTO `photo` VALUES ('26', '2010-02-23 13:23:08', 'we ', 'ewr ', '26.jpg', '0', '14', '1');
INSERT INTO `photo` VALUES ('27', '2010-02-23 13:44:32', 'qq', 'qq', '27.jpg', '0', '14', '1');
INSERT INTO `photo` VALUES ('28', '2010-02-23 13:44:43', 'wq', 'wqw', '28.jpg', '0', '14', '1');
INSERT INTO `photo` VALUES ('29', '2010-02-23 13:44:52', 'e', 'e', '29.jpg', '0', '14', '1');
INSERT INTO `photo` VALUES ('30', '2010-02-23 17:10:13', '四谛法', '大法师', '30.jpg', '2', '14', '1');
INSERT INTO `photo_comment` VALUES ('6', '2010-02-23 17:11:19', '说点什么吧萨法', '1', '30');
INSERT INTO `photo_comment` VALUES ('7', '2010-02-23 17:17:02', '发生', '1', '30');
INSERT INTO `post` VALUES ('1', '2009-08-23 00:45:14', null, null, '公司网站上线', '公司网站上线公司网站上线', '', '1');
INSERT INTO `product` VALUES ('1', '2010-02-21 14:03:01', '白白白1111111', '&nbsp;折&nbsp;&nbsp;&nbsp; 又双111111111111111', '1.jpg', null, null, '1', '1');
INSERT INTO `product` VALUES ('3', '2010-02-21 14:04:22', '大大大大大大', '&nbsp;大ddddddd', '3.jpg', null, null, null, '1');
INSERT INTO `product` VALUES ('4', '2010-02-25 09:34:10', '', '&nbsp;', null, null, null, null, '1');
INSERT INTO `product` VALUES ('6', '2010-02-25 09:34:21', '', '&nbsp;', null, null, null, null, '1');
INSERT INTO `product` VALUES ('7', '2010-02-25 09:35:19', 'ssssssssss', '&nbsp;', null, null, null, null, '1');
INSERT INTO `product_category` VALUES ('1', '生产线', '生产线', null);
INSERT INTO `role` VALUES ('1', 'ROLE_ADMIN', 'Administrator role (can edit Users)');
INSERT INTO `role` VALUES ('2', 'ROLE_USER', 'Default role for all Users');
INSERT INTO `service` VALUES ('1', '2010-02-25 09:33:11', '2010-02-25 09:33:11', '', '&nbsp;', null, null, '1', '1');
INSERT INTO `service` VALUES ('2', '2010-02-25 09:33:19', '2010-02-25 09:33:19', '', '&nbsp;', null, null, '1', '1');
INSERT INTO `service` VALUES ('3', '2010-02-25 09:33:33', '2010-02-25 09:33:33', '', '&nbsp;', null, null, '4', '1');
INSERT INTO `service` VALUES ('4', '2010-02-25 09:33:38', '2010-02-25 09:33:38', '', '&nbsp;', null, null, '4', '1');
INSERT INTO `service_type` VALUES ('1', '价目表', '价目表', '1');
INSERT INTO `service_type` VALUES ('2', '友情提醒', '友情提醒', '2');
INSERT INTO `service_type` VALUES ('3', '服务介绍', '服务介绍', '3');
INSERT INTO `service_type` VALUES ('4', '测试', '测试', null);
INSERT INTO `thumb` VALUES ('1', '测试', 'sfd', '100', '100', 'sdf ', null);
INSERT INTO `topic` VALUES ('1', '2009-02-28 02:29:22', '2010-02-21 15:11:47', '怎么样的发型最好看！ ', '<p>大家觉得呢？</p>', '5', '295', null, '1', '1', '1', '');
INSERT INTO `topic` VALUES ('2', '2009-02-28 02:29:44', '2010-02-22 15:10:56', '最好看的发型是什么？ ', '<p>我喜欢的就是最好看的</p>\r\n', '1', '27', null, '1', '1', '1', '');
INSERT INTO `topic` VALUES ('3', '2009-02-28 02:29:57', '2010-02-22 16:20:38', '为什么人走神呢！ ', '<p>呵呵，想心事！心不在焉！</p>\r\n', '3', '72', null, '1', '1', '1', '');
INSERT INTO `topic` VALUES ('4', '2009-02-28 02:30:11', '2010-02-21 15:14:13', '角斗士凉鞋――街拍明星常穿 ', '<p>都来看看！</p>', '2', '15', null, '2', '1', '1', '');
INSERT INTO `topic` VALUES ('5', '2010-02-22 15:44:20', '2010-02-22 15:44:24', '我最喜欢的歌曲！！！', '介绍给大家一首歌！《吻得太逼真》', '1', '8', null, '3', '4', '1', '');
INSERT INTO `topic` VALUES ('6', '2010-02-22 15:45:44', '2010-02-22 15:45:41', '现在社会的大实话', '当今社会，穷吃肉，富吃虾，领导干部吃王八；\r\n男想高，女想瘦，\r\n狗穿衣裳人露肉；\r\n过去把第一次留给丈夫\r\n现在把第一胎留给丈夫；\r\n乡下早晨鸡叫人，\r\n城里晚上人叫鸡；\r\n旧社会戏子卖艺不卖身，\r\n新社会演员卖身不卖艺\r\n工资真的要涨了\r\n心里更加爱党了\r\n能给孩子奖赏了\r\n见到老婆敢嚷了\r\n敢尝海鲜鹅掌了\r\n闲时能逛商场了\r\n遇见美女心痒了\r\n结果物价又涨了\r\n一切都他妈白想了\r\n没钱的时候,养猪\r\n有钱的时候，养狗。\r\n没钱的时候,在家里吃野菜\r\n有钱的时候,在酒店吃野菜。\r\n没钱的时候,在马路上骑自行车\r\n有钱的时候，在客厅里骑自行车。\r\n没钱的时候想结婚，\r\n有钱的时候想离婚\r\n没钱的时候老婆兼秘书,\r\n有钱的时候秘书兼老婆\r\n没钱的时候假装有钱,\r\n有钱的时候假装没钱\r\n人啊人，都不讲实话：\r\n说权证是毒品，都在玩；\r\n说钱是罪之源，都在捞；\r\n说美女是祸水，都想要；\r\n说高处不胜寒，都在爬；\r\n说烟酒伤身体，就不戒；\r\n说天堂最美好，都不去', '0', '6', null, '3', '4', '1', '');
INSERT INTO `topic` VALUES ('7', '2010-02-22 15:45:53', '2010-02-22 15:45:56', '你敢用普通话读下面的诗句么？读完包你哈哈大笑～', '一位语文老师为学生朗读了一首题为《卧春》的陆游的古诗，要求学生听写出来，语文老师朗读如下，有位学生听写如下、\r\n《卧春》（《我蠢》）\r\n暗梅幽闻花（俺没有文化）、卧枝伤恨底（我智商很低）、遥闻卧似水（要问我是谁）、易透达春绿（一头大蠢驴）、岸似绿（俺是驴）、岸似透绿（俺是头驴）、岸似透黛绿（俺是头呆驴）！\r\n看玩一定要转哦！转的人会爱情顺利，事业顺心，家庭和睦，一生开心！不过应该不介意留下小小的话吧！你们会有福报滴！！哈哈～\r\n毕竟开心无价嘛～呵呵', '0', '12', null, '3', '4', '1', '');
INSERT INTO `topic` VALUES ('8', '2009-11-28 16:18:24', '2010-02-21 15:15:12', '今天阴天', '&nbsp;真难受！', '1', '11', null, '2', '2', '1', '');
INSERT INTO `topic` VALUES ('9', '2009-11-28 16:18:44', '2010-02-21 15:15:24', '头发长了', '&nbsp;那就剪呗！', '0', '6', null, '2', '1', '1', '');
INSERT INTO `topic` VALUES ('10', '2009-11-28 16:19:08', '2010-02-21 15:15:34', '理发太贵了', '&nbsp;剪不起了！', '0', '6', null, '2', '1', '1', '');
INSERT INTO `topic` VALUES ('11', '2009-11-28 16:19:29', '2010-02-21 15:15:47', '你们厉害不', '&nbsp;那是必须的！', '0', '8', null, '2', '3', '1', '');
INSERT INTO `topic` VALUES ('12', '2009-12-04 09:55:58', '2010-02-21 15:16:04', 'qqqqqqqqqqqq', '&nbsp;qqqqqqqqqqqqqqqqq！', '1', '8', null, '2', '1', '1', '');
INSERT INTO `topic` VALUES ('13', '2009-12-04 09:59:27', '2010-02-21 15:16:24', 'sssssssssss', '&nbsp;ssssssssssssssssssss的', '2', '9', null, '2', '1', '1', '');
INSERT INTO `topic` VALUES ('14', '2010-02-22 15:48:33', '2010-02-22 15:48:36', '呵呵', '呵呵', '0', '12', null, '3', '4', '1', '');
INSERT INTO `topic` VALUES ('15', '2009-12-04 11:33:36', null, 'aqq111111', '&nbsp;11111', '1', '7', null, '2', '2', '1', '');
INSERT INTO `topic` VALUES ('16', '2010-02-21 13:46:03', null, '新年过的如何？', '&nbsp;你今年的新年过的好吗？有哪些开心的事啊？跟大家分享分享', '1', '9', null, '2', '2', '1', '');
INSERT INTO `topic` VALUES ('17', '2010-02-21 16:27:21', null, '我晕了', '&nbsp;搞的头晕了', '0', '4', null, '2', '4', '1', '');
INSERT INTO `topic` VALUES ('19', '2010-02-22 16:22:49', '2010-02-22 16:22:49', '大家好', '大家好啊！', '0', '4', null, '1', '2', '1', '');
INSERT INTO `topic` VALUES ('20', '2010-02-23 09:18:10', '2010-02-23 09:18:10', '早晨起来多喝水', '早上起床多喝水。有利于身体健康！', '1', '11', null, '1', '5', '1', '');
INSERT INTO `topic` VALUES ('21', '2010-02-23 16:18:57', '2010-02-23 16:18:57', '春天来了', '春天来了。大家有没有打算去春游的啊！', '0', '5', null, '2', '2', '1', '');
INSERT INTO `topic` VALUES ('23', '2010-02-24 10:12:24', '2010-03-02 09:34:24', '欢迎大家来到Eshow办公室！！！', '<p>嘿嘿，欢迎大家的到来！</p>\r\n', '0', '8', null, '1', '1', '1', '');
INSERT INTO `topic` VALUES ('25', '2010-02-24 10:12:43', '2010-03-02 09:35:31', '有打算去春游的吗？', '<p>春天来了！有打算去春游的吗？</p>\r\n', '0', '9', null, '1', '2', '1', '');
INSERT INTO `topic` VALUES ('26', '2010-02-24 10:18:10', '2010-03-02 09:39:29', 'CSS定位问题，在不同IE中的错位问题!', '<p>有谁精通CSS样式表啊。特别是定位问题！特别是IE8中，老是错位！谁有高招？</p>\r\n', '0', '6', null, '3', '1', '1', '');
INSERT INTO `topic` VALUES ('27', '2010-02-24 10:18:16', '2010-03-02 09:53:04', '今天又是新的一天了！', '<p>希望大家有新的收获！！！</p>\r\n', '0', '6', null, '1', '2', '1', '');
INSERT INTO `topic` VALUES ('28', '2010-02-24 10:18:27', '2010-03-02 09:52:24', '有关于Eshow办公室！', '<p>敬请期待！！！！！！！！！</p>\r\n', '0', '10', null, '1', '1', '1', '');
INSERT INTO `topic` VALUES ('29', '2010-02-24 10:18:32', '2010-03-02 09:43:16', '无锡是个好地方！', '<p>无锡是个好地方啊！</p>\r\n', '0', '6', null, '1', '6', '1', '');
INSERT INTO `topic` VALUES ('30', '2010-02-24 10:18:37', '2010-03-02 09:42:07', '有谁能分享点关于Mootools方面的技术啊？', '<p>各位大虾帮帮忙，分享点mootools技术啊！</p>\r\n', '0', '7', null, '3', '3', '1', '');
INSERT INTO `topic` VALUES ('31', '2010-02-24 10:20:11', '2010-03-02 09:37:02', '谁有好的文本编辑器！', '<p>哪位大虾有非常好的文本编辑器啊？发到开发日志里面共享共享啊！！！！</p>\r\n', '1', '9', null, '3', '3', '1', '');
INSERT INTO `topic` VALUES ('32', '2010-02-24 10:20:28', '2010-03-02 09:32:49', '又要降温', '<p>刚晴没两天，又要降温，郁闷ing。。。。。。。。。</p>\r\n', '0', '9', null, '1', '2', '1', '');
INSERT INTO `topic` VALUES ('33', '2010-02-24 10:33:30', '2010-03-02 09:31:51', '灌水咯！', '<p>灌水咯！！！！！淹死你们！！！！<img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/51.gif\" width=\"24\" height=\"24\" /></p>\r\n', '0', '5', null, '3', '5', '1', '');
INSERT INTO `topic` VALUES ('34', '2010-02-24 10:33:40', '2010-03-02 09:30:03', '今天谁去翻宝了？', '<p>你们今天去翻宝了没有？</p>\r\n', '0', '6', null, '2', '2', '1', '');
INSERT INTO `topic` VALUES ('35', '2010-02-24 10:33:53', '2010-03-02 09:24:59', '手机白屏怎么办？', '<p>谁能知道手机白屏怎么办啊？我的小七白了!<img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/49.gif\" width=\"24\" height=\"24\" /><img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/42.gif\" width=\"24\" height=\"24\" /><img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/42.gif\" width=\"24\" height=\"24\" /><img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/42.gif\" width=\"24\" height=\"24\" /></p>\r\n', '0', '7', null, '3', '3', '1', '');
INSERT INTO `topic` VALUES ('38', '2010-02-24 10:34:37', '2010-02-26 14:56:31', 'Eshow开源框架正式启航', '<p>Eshow开源框架正式启航，详情查看相关文章！</p>\r\n', '0', '17', null, '1', '1', '1', '');
INSERT INTO `topic` VALUES ('42', '2010-02-25 10:00:15', '2010-02-25 10:00:15', '呵呵', '你们好！', '0', '6', null, '7', '6', '0', '');
INSERT INTO `topic` VALUES ('43', '2010-02-25 10:35:21', '2010-02-25 10:35:21', '哇！美女', '昨天看见好多美女！<img border=\"0\" alt=\"\" src=\"http://localhost:8080/eshow/components/kindeditor/plugins/emoticons/51.gif\" width=\"24\" height=\"24\" />', '3', '59', null, '8', '1', '0', '');
INSERT INTO `topic_comment` VALUES ('1', '2009-11-19 15:52:43', '回复:怎么样的发型最好看！ ', '我也不知道', null, '1', '1');
INSERT INTO `topic_comment` VALUES ('2', '2009-12-07 11:32:46', '回复:怎么样的发型最好看！ ', '谁是', null, '1', '1');
INSERT INTO `topic_comment` VALUES ('4', '2010-02-21 14:35:16', '回复:为什么人走神呢！ ', '不知道呢', null, '1', '3');
INSERT INTO `topic_comment` VALUES ('6', '2010-02-21 14:40:08', '回复:为什么人走神呢！ ', '真的', null, '3', '3');
INSERT INTO `topic_comment` VALUES ('7', '2010-02-21 14:41:19', '回复:为什么人走神呢！ ', '不清楚', null, '2', '3');
INSERT INTO `topic_comment` VALUES ('8', '2010-02-21 14:43:15', '回复:最好看的发型是什么？ ', '根据个人头型来定的', null, '1', '2');
INSERT INTO `topic_comment` VALUES ('9', '2010-02-21 15:16:10', '回复:qqqqqqqqqqqq', '的', null, '1', '12');
INSERT INTO `topic_comment` VALUES ('10', '2010-02-21 16:36:42', '回复:aqq111111', '呵呵', null, '1', '15');
INSERT INTO `topic_comment` VALUES ('11', '2010-02-22 13:46:22', '回复:怎么样的发型最好看！ ', '大大大大大 ', null, '1', '1');
INSERT INTO `topic_comment` VALUES ('14', '2010-02-22 15:10:19', '回复:角斗士凉鞋――街拍明星常穿 ', 'ddddddddddddd', null, '1', '4');
INSERT INTO `topic_comment` VALUES ('15', '2010-02-22 15:10:24', '回复:角斗士凉鞋――街拍明星常穿 ', 'ddddddd', null, '1', '4');
INSERT INTO `topic_comment` VALUES ('16', '2010-02-22 15:25:59', '回复:新年过的如何？', '很好。', null, '1', '16');
INSERT INTO `topic_comment` VALUES ('17', '2010-02-22 16:26:22', '回复:今天阴天', '今天晴天！', null, '1', '8');
INSERT INTO `topic_comment` VALUES ('18', '2010-02-23 09:18:41', '回复:早晨起来多喝水', '我每天都喝的', null, '1', '20');
INSERT INTO `topic_comment` VALUES ('22', '2010-02-25 10:58:48', '回复:怎么样的发型最好看！ ', '<img border=\"0\" alt=\"\" src=\"http://localhost:8080/eshow/components/kindeditor/plugins/emoticons/51.gif\" width=\"24\" height=\"24\" />', null, '1', '1');
INSERT INTO `topic_comment` VALUES ('23', '2010-02-25 11:04:26', '回复:怎么样的发型最好看！ ', '<p><span style=\"color:#d40a00;\"><img border=\"0\" alt=\"\" src=\"http://localhost:8080/eshow/components/kindeditor/plugins/emoticons/29.gif\" width=\"24\" height=\"24\" /></span></p>\r\n', null, '1', '1');
INSERT INTO `topic_comment` VALUES ('24', '2010-02-25 14:35:50', '回复:hehe', 'heihei', null, '22', '5');
INSERT INTO `topic_comment` VALUES ('25', '2010-02-26 09:21:25', '回复:ddddddddd', '<img border=\"0\" alt=\"\" src=\"http://localhost:8080/eshow/components/kindeditor/plugins/emoticons/18.gif\" width=\"24\" height=\"24\" />', null, '22', '31');
INSERT INTO `topic_comment` VALUES ('26', '2010-03-01 15:44:23', '回复:哇！美女', '<img border=\"0\" alt=\"\" src=\"http://www.eshow.org.cn/eshow/components/kindeditor/plugins/emoticons/37.gif\" width=\"24\" height=\"24\" />', null, '1', '43');
INSERT INTO `topic_comment` VALUES ('27', '2010-03-02 09:19:23', '回复:哇！美女', '<img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/47.gif\" width=\"24\" height=\"24\" />', null, '1', '43');
INSERT INTO `topic_comment` VALUES ('28', '2010-03-02 09:28:33', '回复:哇！美女', '<img border=\"0\" alt=\"\" src=\"http://127.0.0.1:8080/eshow/components/kindeditor/plugins/emoticons/2.gif\" width=\"24\" height=\"24\" />', null, '1', '43');
INSERT INTO `twitter` VALUES ('2', '2009-11-19 14:58:23', null, '经典笑话：可怜的狗 <br>    早晨，两个邻居相遇了。一个说：\r\n    “听说，昨晚你妻子大吵大闹了？”\r\n    “是的，她在对狗发脾气。”\r\n    “可怜的狗！我好像听到你妻子甚至威胁要拿走它进门的钥\r\n匙！”', '0', '1');
INSERT INTO `twitter` VALUES ('3', '2009-11-19 15:28:29', null, '经典笑话：为难的事<br>     亨利向一个“凶杀指导者”请教：“怎样才能摆脱纠纷、羁绊，\r\n还有妻子的唠叨……”\r\n    “这有什么困难呢？”那位“指导者”说，“让你家的洗衣机、\r\n电冰箱的电路全部短路，尊夫人湿着手去接触，她就会永远离开你了\r\n……”\r\n    “这使不得！”亨利为难地说。\r\n    “不忍心下手么？”\r\n    “不，在家里洗衣，做饭的是我！”', '0', '1');
INSERT INTO `twitter` VALUES ('4', '2009-11-19 15:28:37', null, '经典笑话：我不希望你迟到     我的一个熟人，下班后在当地一家馆子里消磨得很晚。晚上10点左右回到家时，他的妻子正坐在饭桌旁等他。她没有盘问或责备他，而是爽快地问他想不想吃饭。由于毫无胃口，他离开她上床睡觉去了。\r\n    凌晨3点半，闹钟大吵。他匆匆起床，扭亮电灯。看过钟点后，他对妻子咆哮起来，要她作出解释。\r\n    “嗯，”她心平气和地回答，“要是你下班后要花4小时返回家中，我想你上班也需要同样的时间。我不希望你迟到！”', '0', '1');
INSERT INTO `twitter` VALUES ('5', '2009-11-19 15:28:56', null, '经典笑话：现在是谁抱歉？<br>     当我们初中的校长收到一盆仙人球时，我问他是不是他妻子送来的。他回答说是的，并解释说，他俩大吵了一架，她可能是把这送来以表歉意。他让我把卡片上的话念给他听，那上面用很大的红字写着：坐在上面。 ', '0', '1');
INSERT INTO `twitter` VALUES ('6', '2009-11-19 15:29:02', null, '经典笑话：不可同论<br>     丈夫听太太恶骂女佣人后，安慰她说：“你不要生气，我和你都是一样的命运。”\r\n    “先生！你哪能和我一样？”女佣说，“我已告诉你太太，明天起，我不干了，你敢说这句话吗？”', '0', '1');
INSERT INTO `twitter` VALUES ('7', '2009-11-19 15:29:16', null, '经典笑话：幸运的事故<br>       一架波音727在伊豆海面上坠落了，乘务员、乘客全体遭难，是个悲惨的事件。某公司的经理因出租汽车耽搁，没有赶上搭乘这架飞机，于是电台的记者采访他。\r\n    “您在那千钧一发之际，没赶上飞机，真是万幸哪！”\r\n    “托福托福。不过，幸运还不止于此呢！”\r\n    “还有什么呢？”\r\n    “我的内人赶上了那架飞机。”', '2', '1');
INSERT INTO `twitter` VALUES ('8', '2009-11-19 15:29:33', null, '经典笑话：该关的都关了<br>     亨利的妻子临睡前絮絮叨叨的谈话令他十分不快。\r\n    一天夜里，妻子又絮叨了一阵子后，问亨利：“家里的窗门都关好了吗？”\r\n    亨利回答：“亲爱的，除了你的话匣子外，该关的都关了。”', '0', '1');
INSERT INTO `twitter` VALUES ('9', '2009-11-19 15:29:48', null, '经典笑话：报复心理<br>     亨利的妻子老是埋怨亨利没有本事赚钱，不能让她过上舒服的日子。\r\n    一天晚上，亨利怄着气看完电视后，准备上床睡觉，正在脱上衣的妻子命令他道：“快把窗帘拉上，别人看到，多不好意思！”\r\n    亨利回答道：“没关系，别的男人要是看见你的模样，他会把自家的窗帘拉上的。”', '0', '1');
INSERT INTO `twitter` VALUES ('10', '2009-11-19 15:30:00', null, '经典笑话：我以为你还会长<br>     一个男人每次看到长腿高个的女士，总是津津乐道地品头论足一番，毫不掩饰自己的倾慕之感，他娇小、漂亮的太太实在忍不住了，气愤地问道：“如果你这样喜欢长腿高个的女人，干嘛你当年要娶我。”\r\n    他说：“当年我以为你还会长高的。”', '0', '1');
INSERT INTO `twitter` VALUES ('11', '2009-11-19 15:30:23', null, '经典笑话：比妻<br>     两个爱尔兰人肖恩和凯文，分别多年后在大街上相遇。\r\n    “快告诉我，”肖恩说，“你结婚了吗？”\r\n    “结了。我妻子是个天使，”凯文答道。\r\n    “你真幸运。而我的妻子仍然跟着我', '0', '1');
INSERT INTO `twitter` VALUES ('12', '2009-11-19 15:32:27', null, '经典笑话：运动减肥 <br>    医生：“消除你多余脂肪的唯一方法便是运动——尽量地运动。”\r\n    甲：“胡说！我太太每天都说个不停，可是她的下巴却一直是两层的。”', '12', '1');
INSERT INTO `twitter` VALUES ('13', '2009-11-26 09:57:13', null, '经典笑话：女做男<br>     妻子：“我常想：‘我做了男人就好了’。”\r\n    丈夫：“为什么？”\r\n    妻子：“我在绸缎店和珠宝店里，看见那些好的衣料和精美首饰，常常想，我若是男人，一定会买回去给老婆，看她会多么快活啊！”\r\n    丈夫：“？”', '0', '1');
INSERT INTO `twitter` VALUES ('14', '2009-11-26 09:57:18', null, '经典笑话：丈夫有趣吗？ <br>    吃晚饭时，我坐在一对慈祥的老夫老妻身旁。老夫在吃饭时还滔滔不绝地讲他的工作。快要吃完的时候，我对老夫的妻子说：“你丈夫很有趣。”她却严肃地望着我，小声地说：“偶尔跟他谈谈，他很有趣，可是千万别跟他一起生活。”', '0', '1');
INSERT INTO `twitter` VALUES ('15', '2009-11-26 14:40:13', null, '经典笑话：生日礼物 <br>    妻子过生日时，丈夫为妻子买了一副首饰，妻子看了这价值连城的珠宝欣喜异常，观赏之后，妻子说道：“亲爱的，如果你给我买辆奔驰轿车，不是更实惠些吗？”\r\n    “是啊，”丈夫脱口说道，“可惜奔驰轿车现在还没有假的！”', '0', '1');
INSERT INTO `twitter` VALUES ('16', '2009-11-26 16:46:38', null, '经典笑话：自由恋爱<br> 一户人家正在闹新房，大家要新郎新娘谈谈是怎样相识而结婚的。新娘含羞他说：“我俩是自由恋爱。”新郎连忙补充说：“不错，是自由恋爱，我把十多年来的积蓄全交给了你母亲，才使你得到了自由。”', '0', '1');
INSERT INTO `twitter` VALUES ('17', '2009-11-26 17:02:45', null, '经典笑话：求爱<br> 一日，一位苏北小帅哥和俏姑娘在火车上相遇。一阵经典的“乖乖聋嫡洞、韭菜炒大葱”之后，小帅哥拿出一副扑克牌与俏姑娘对玩：\r\n小帅哥：QQK？（谈谈看）\r\n俏姑娘：Q45？（谈什么）\r\n小帅哥：Q21！（谈恋爱）\r\n俏姑娘：8Q！！（不谈）\r\n$%……！\r\n火车快到站了，小帅哥不死心，于是又拿出扑克牌：\r\n小帅哥：3QQK？（再谈谈看）\r\n俏姑娘：948Q！！！（就是不谈）', '1', '1');
INSERT INTO `twitter` VALUES ('18', '2009-11-26 17:03:57', null, '经典笑话：七年一样 <br>甲女：“我同丈夫结婚到现在，七年以来，丈夫对待我，总是与结婚那天一样。” \r\n\r\n乙女：“我昨夜还听见你们二人争吵的呢！” \r\n\r\n甲女：“是的！丈夫与我结婚那天，就争吵的。” ', '1', '1');
INSERT INTO `twitter` VALUES ('19', '2009-11-26 17:06:09', null, '经典笑话：男女约会的尴尬场面 <br>\r\n尴尬三\r\n　　第一次见面，走了好久了。他说：“我饿了，你呢？”“有一点。”“该吃饭了，你回家去吧。”“今天我家没人，我在外面吃好了。”“哦，我知道有一家面还不错，我们一起去吧？”然后一起走了两站路多一点，来到一家大排挡。“老板，来两碗三鲜面。素三鲜。我不要鸡蛋，你呢？也不要吧？老板，两碗都不要加鸡蛋。”“我有事，先走了。”“嗳，不是说一起吃饭的么？怎么就走呀？我送你……等等，老板，只要一碗就好了！”', '2', '1');
INSERT INTO `twitter` VALUES ('20', '2009-11-26 17:06:17', null, '经典笑话：男女约会的尴尬场面<br>\r\n　　尴尬一<br>\r\n　　经过漫长的等待，终于下雨了！虽然不大，他还是拿了一把小伞等在她下班的路上。“你没带伞？我送你回家吧！”“不要紧的，雨不大，我自己走好了。伞又这么小，你自己打吧！”\r\n\r\n　<br>　尴尬二<br>\r\n　　请客吃饭，当然她也在。酒足饭饱，他喊了一声：这顿我请了！主动跑到总台去付帐，回来的时候后面跟了个小姐。因为钱不够。\r\n', '1', '1');
INSERT INTO `twitter` VALUES ('21', '2009-11-26 17:06:36', null, '经典笑话：打猎归来<br> 打猎归来的丈夫在车站给家里打电话。\r\n\r\n“喂，是玛丽吗？你快来车站接我吧！”\r\n\r\n“收获怎么样？亲爱的。”\r\n\r\n“还可以，从现在起，至少一个月内我们不再买肉了。”\r\n\r\n“是打死了一只鹿？”\r\n\r\n“不，是工资全部花光了，现在我连坐车回家的车票钱都没有了……”', '0', '1');
INSERT INTO `twitter` VALUES ('22', '2009-11-26 17:06:49', null, '经典笑话：绿帽子<br>     我的一个姓银的朋友很爱和我开玩笑。\r\n    一次，他指着我的头说：“我怎么看到你戴‘绿帽子’了呢？”\r\n    我说：“还不是怪你！（他大笑）……谁叫你们银家的女儿在出嫁前都要自己先尝一尝呢？！”\r\n', '0', '1');
INSERT INTO `twitter` VALUES ('23', '2009-11-26 17:06:56', null, '经典笑话：明天检查妇科<br> 夜晚，一对夫妇躺在床上。丈夫温柔的拍妻子的肩膀并开始摩擦妻子的手臂，妻子转过身说：亲爱的，对不起，我明天要去看妇科医生，我想保持清洁。丈夫遭到拒绝，无奈的转过身去准备睡觉了。可过了几分钟，丈夫又转过来开始温柔的拍妻子的肩膀，这次他凑到妻子耳边轻轻的问：明天你也要去看牙医吗？', '0', '1');
INSERT INTO `twitter` VALUES ('24', '2009-11-26 17:10:41', null, '经典笑话：银 婚<br> 一对夫妇上照相馆拍摄一张银婚纪念照，摄影时，摄影师对妇人说：“你靠近一点，手搭在你先生的肩上，这样照起来就会自然一些。”\r\n\r\n先生苦笑着说：“如果想拍一张更写实的照片，应该让她的手插进我的衣袋里。”', '2', '1');
INSERT INTO `twitter` VALUES ('25', '2009-11-26 17:13:12', null, '经典笑话：没脱裤子<br>\r\n 一兄得便秘，在厕所里久久不能如便，正在他极力努力的时候，看一哥们风一样的冲进厕所，进了他旁边的位置，刚进去就传来一真狂风暴雨，那兄羡慕的对那哥们说：哥们好羡慕你呀， \r\n　　那哥们说：羡慕啥，裤子还没脱呢～～ \r\n', '2', '1');
INSERT INTO `twitter` VALUES ('26', '2009-11-27 08:52:21', null, '经典笑话：坐飞机 <br>一天哥哥和弟弟一起坐飞机出门,弟弟由于是第一次坐飞机所以在飞机起飞后便开始吐,不一会就把飞机准备的呕吐带吐满了,于是哥哥说:\"我出去再找个带,你忍会儿\"一会儿哥哥回来了,但是他发现除了弟弟全机乘客都在吐,哥哥纳闷地问弟弟:\"弟弟呀,他们怎么都吐了?\"弟弟说:\"哥,我看袋子满了没地方吐\"弟弟举起呕吐袋,\"所以我把袋子里的喝了接着吐....然后他们都吐了.......', '3', '1');
INSERT INTO `twitter` VALUES ('27', '2009-11-27 09:10:05', null, '经典笑话：食人族 <br>\r\n一女子在食人族的追击下，跑进了一条死胡同。由于惊吓，女子尿湿了裤子。食人族见状大骂：“真他妈可惜！汤都弄撒了！”食人族的妇女生孩子后，首先要把孩子抱给丈夫，并殷勤地说：“趁热吃了吧！”\r\n食人族的巨富带儿子出国旅游，在飞机上，儿子问爸爸：“飞机上怎么这么多人？”爸爸答道：“老天爷总是保佑我们。食人族把电梯称作：自动售货机食人族把养子称作：不良食品食人族把澡堂称', '5', '1');
INSERT INTO `twitter` VALUES ('28', '2009-11-27 09:27:45', null, '臧天朔~获刑~斗殴案~判刑#臧天朔，心的祈祷，我卡拉过多次。真是一首好歌，有真情的歌。后来更广泛的朋友，已经充满了伪。造作。他，景岗山，王勇，都是当年内崔健的跟班。曾经在歌中充满说教。说教的人，已露出太多的自我遗失。是现在出事的前兆', '0', '2');
INSERT INTO `twitter` VALUES ('29', '2009-11-27 09:29:11', null, '还可通几乎都可以在一个页面中轻松完成，再加上有可以通过电脑、手机等多终端进行访问，大大提高了操作的便利性。这样就很容易吸引网友把各个单项功能应用都迁移到这个统一平台上来，也就意味着网民会舍弃其他网站单一功能的邮箱、博客以及即时通讯工具等而转投新浪，以减少多渠道沟通的繁琐操作和维护、更新方面的大量重复劳动，从而让这种统一的平台产生强大的聚合效应。', '1', '2');
INSERT INTO `twitter` VALUES ('30', '2009-11-27 09:41:42', null, '试想，如果再增加一项web版的即时通讯功能和大容量的网络文件柜功能，然后把几项功能采用“一号通”方式进行整合，那就意味着只要登录一次即可实现目前几乎所有主流的网络应用。网友既可以在自己的“个人主页”上发表各种图文影音内容或自娱自乐或展示传播，还可以随时发起与某一位好友的“点对点”实时对话和文件传送，如果对方不在线也可以用邮件发送或者通过网络文件柜进行共享，对于需要广播式通知的内容不再需要群发邮件而只需以围脖私信的方式就可以瞬间一步到位，各种“点对点”和“点对面”的互动沟通几乎都可以在一个页面中轻松完成，再加上有可以通过电脑、手机等多终端进行访问，大大提高了操作的便利性。这样就很容易吸引网友把各个单项功能应用都迁移', '1', '2');
INSERT INTO `twitter` VALUES ('31', '2009-11-27 09:42:11', null, '试想，如果再增加一项web版的即时通讯功能和大容量的网络文件柜功能，然后把几项功能采用“一号通”方式进行整合，那就意味着只要登录一次即可实现目前几乎所有主流的网络应用。网友既可以在自己的“个人主页”上发表各种图文影音内容或自娱自乐或展示传播，还可以随时发起与某一位好友的“点对', '1', '2');
INSERT INTO `twitter` VALUES ('32', '2009-11-27 09:46:12', null, '试想，如果再增加一项web版的即时通讯功能和大容量的网络文件柜功能，然后把几项功能采用“一号通”方式进行整合，那就意味着只要登录一次即可实现目前几乎所有主流的网络应用。网友既可以在自己的“个人主页”上发表各种图文影音内容或自娱自乐或展示传播，还可以随时发起与某一位好友的“点对点”实时对话和文件传送，如果对方不在线也可以用邮件发送或者通过网络文件柜进行共享，对于需要广播式通知的内容不再需要群发邮件而只需以围脖私信的方式就可以瞬间一步到位，各种“点对点”和“点对面”的互动沟通几乎都可以在一个页面', '0', '2');
INSERT INTO `twitter` VALUES ('33', '2009-11-27 09:48:08', null, '试想，如果再增加一项web版的即时通讯功能和大容量的网络文件柜功能，然后把几项功能采用“一号通”方式进行整合，那就意味着只要登录一次即可实现目前几乎所有主流的网络应用。网友既可以在自己的“个人主页”', '3', '2');
INSERT INTO `twitter` VALUES ('36', '2010-02-24 15:49:27', null, '我们的打地方a_dfas飞按时打发阿萨德发生地方阿萨德发司法所飞飞我们的打地方a_dfas飞按时打发阿萨德发生地方阿萨德发司法所飞飞我们的打地方a_dfas飞按时打发阿萨德发生地方阿萨德发司法所飞飞我们的打地方a_dfas飞按时打发阿萨德发生地方阿萨德发司法所飞飞我们的打地方a_dfas飞按时打发阿萨德发生地方阿萨德发司法所飞飞我们的打地方a_dfas飞按时打发阿萨德发生地方阿萨德发司法所飞飞我们', '3', '1');
INSERT INTO `twitter` VALUES ('37', '2010-02-26 09:09:31', null, '最近有什么新技术吗?\r\n', '2', '8');
INSERT INTO `twitter` VALUES ('38', '2010-02-26 09:11:58', null, '测试一下到底怎么回事！', '0', '7');
INSERT INTO `twitter` VALUES ('39', '2010-03-01 18:28:03', null, '我注册了，早日可以使用', '7', '2');
INSERT INTO `twitter_comment` VALUES ('1', '2009-08-27 12:11:00', '我们的项目正在完善中1', '1', null);
INSERT INTO `twitter_comment` VALUES ('2', '2009-09-24 09:39:27', '我要做mootools的删除1', '1', null);
INSERT INTO `twitter_comment` VALUES ('3', '2009-11-19 15:29:20', '测试', '1', '7');
INSERT INTO `twitter_comment` VALUES ('4', '2009-11-19 15:36:23', '好好测试', '1', '7');
INSERT INTO `twitter_comment` VALUES ('5', '2009-11-26 09:55:34', '发生的', '1', '12');
INSERT INTO `twitter_comment` VALUES ('6', '2009-11-26 09:55:43', '的身份', '1', '12');
INSERT INTO `twitter_comment` VALUES ('7', '2009-11-26 09:55:46', '地方', '1', '12');
INSERT INTO `twitter_comment` VALUES ('9', '2009-11-26 09:55:53', '的身份', '1', '12');
INSERT INTO `twitter_comment` VALUES ('10', '2009-11-26 09:55:58', '的方式的', '1', '12');
INSERT INTO `twitter_comment` VALUES ('11', '2009-11-26 09:56:02', '地方', '1', '12');
INSERT INTO `twitter_comment` VALUES ('12', '2009-11-26 09:56:07', '的身份', '1', '12');
INSERT INTO `twitter_comment` VALUES ('13', '2009-11-26 09:56:12', '反倒是', '1', '12');
INSERT INTO `twitter_comment` VALUES ('14', '2009-11-26 09:56:17', '东方舵手', '1', '12');
INSERT INTO `twitter_comment` VALUES ('15', '2009-11-26 09:56:20', '地方', '1', '12');
INSERT INTO `twitter_comment` VALUES ('16', '2009-11-26 09:56:26', '地方', '1', '12');
INSERT INTO `twitter_comment` VALUES ('17', '2009-11-26 09:56:32', '的身份', '1', '12');
INSERT INTO `twitter_comment` VALUES ('18', '2009-11-26 17:04:55', 'dfsdf', '1', '18');
INSERT INTO `twitter_comment` VALUES ('19', '2009-11-27 08:52:55', '都什么啊', '1', '25');
INSERT INTO `twitter_comment` VALUES ('20', '2009-11-27 09:03:56', '是吗？', '1', '26');
INSERT INTO `twitter_comment` VALUES ('21', '2009-11-27 09:09:30', '是的', '1', '26');
INSERT INTO `twitter_comment` VALUES ('24', '2009-11-27 09:21:35', '地方撒的', '1', '17');
INSERT INTO `twitter_comment` VALUES ('26', '2009-11-27 09:29:49', '看看', '2', '24');
INSERT INTO `twitter_comment` VALUES ('27', '2009-11-27 09:30:06', '的', '2', '29');
INSERT INTO `twitter_comment` VALUES ('31', '2009-12-03 11:13:47', '说说', '1', '27');
INSERT INTO `twitter_comment` VALUES ('32', '2010-02-21 13:28:08', '很不错。', '1', '33');
INSERT INTO `twitter_comment` VALUES ('35', '2010-02-21 13:51:39', 'dsfasd ', '1', '31');
INSERT INTO `twitter_comment` VALUES ('36', '2010-02-22 13:33:34', '测试', '1', '26');
INSERT INTO `twitter_comment` VALUES ('37', '2010-02-22 15:05:23', '支持', '1', '30');
INSERT INTO `twitter_comment` VALUES ('38', '2010-02-22 15:07:15', '大大', '1', '24');
INSERT INTO `twitter_comment` VALUES ('40', '2010-02-22 16:12:40', '森林林  ', '1', '20');
INSERT INTO `twitter_comment` VALUES ('45', '2010-02-24 15:49:50', '圣达菲', '1', '36');
INSERT INTO `twitter_comment` VALUES ('46', '2010-02-26 09:15:33', '我也不清楚啊', '22', '37');
INSERT INTO `twitter_comment` VALUES ('47', '2010-02-26 09:40:35', 'heheh\r\n', '1', '27');
INSERT INTO `twitter_comment` VALUES ('49', '2010-03-02 10:54:20', 'dddddddddddddddd', '1', '36');
INSERT INTO `twitter_comment` VALUES ('50', '2010-03-02 10:54:28', '地方阿萨德发司法', '1', '36');
INSERT INTO `twitter_comment` VALUES ('58', '2010-03-02 11:14:34', 'dddddddddddddddddd', '1', '39');
INSERT INTO `twitter_comment` VALUES ('52', '2010-03-02 11:09:20', 'dddddddddddddddddddddd', '1', '39');
INSERT INTO `twitter_comment` VALUES ('53', '2010-03-02 11:09:24', 'ddddddddddddd', '1', '39');
INSERT INTO `twitter_comment` VALUES ('55', '2010-03-02 11:10:55', 'ddddddddddddddddd', '1', '39');
INSERT INTO `twitter_comment` VALUES ('56', '2010-03-02 11:11:01', 'rrrrrrrrrrrrrrrrrrr', '1', '39');
INSERT INTO `twitter_comment` VALUES ('57', '2010-03-02 11:11:21', 'dddddddddddddddddd', '1', '39');
INSERT INTO `twitter_comment` VALUES ('59', '2010-03-02 13:20:04', 'dddddddddddddddd', '1', '19');
INSERT INTO `twitter_comment` VALUES ('60', '2010-03-02 13:20:08', 'dddddddddddddd', '1', '19');
INSERT INTO `twitter_comment` VALUES ('61', '2010-03-02 13:30:15', 'dddddddddddddddddd', '1', '37');
INSERT INTO `user` VALUES ('1', '18', '2008-11-03 15:33:31', '2008-11-03 16:19:05', 'leida@i-media.net.cn', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', '1.jpg', 'Eshow', '25', '', '2010-02-24', '1', '1', '1', '1', '我是一名合格的IT', '我是一名合格的IT', '', '', '', '');
INSERT INTO `user` VALUES ('2', '0', '2008-11-03 15:49:32', '2008-11-03 15:49:32', 'zhang20084@126.com', 'leida', 'ff1dab4bbeada27e4e02d7369c3fc90b6c5127b3', 'leida', '', null, null, '', '2010-02-24', null, null, null, null, null, null, '', '', '', '');
INSERT INTO `user` VALUES ('3', '18', '2009-11-28 18:54:21', '2010-03-01 17:39:46', 'lyle@daoqun.net', 'lyle', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'lyle', null, 'lyle', '27', '', null, '1', '1', '1', '1', '', '', '', '', '', '');
INSERT INTO `user` VALUES ('4', '1', '2010-02-26 11:09:14', '2010-02-26 11:09:14', 'hunter@daoqun.net', 'hunter', 'abab8b1e134756fa264d2da3ed9653cf21f07f95', '糊涂', null, '', null, '', null, '1', '1', '1', '1', '', '', '', '', '', '');
INSERT INTO `user` VALUES ('5', '0', '2010-02-26 11:25:13', '2010-02-26 11:25:13', '472420587@daoqun.net', 'pixy', 'e17bf24acf4b66a5e350d9187c9dacb80671d2bd', 'pixy', null, null, null, null, null, null, null, null, null, null, null, '', '', '', '');
INSERT INTO `user` VALUES ('6', '0', '2010-03-01 13:12:06', '2010-03-01 13:12:06', 'leida@daoqun.net', 'zhang20084', 'ff1dab4bbeada27e4e02d7369c3fc90b6c5127b3', '磊大', null, null, null, null, null, null, null, null, null, null, null, '', '', '', '');
INSERT INTO `user` VALUES ('7', '0', '2010-03-01 13:21:29', '2010-03-01 13:21:29', 'king@daoqun.net', 'king', '481902ec14eaf3fcfec6be82bd6a63b972ac517f', 'king', null, null, null, null, null, null, null, null, null, null, null, '', '', '', '');
INSERT INTO `user` VALUES ('8', '0', '2010-03-01 13:23:29', '2010-03-01 13:23:29', 'cjing310@live.com', 'cjing310', 'ce43f60e584ee5b08e19e6959bb956278c6c10fc', 'jason', null, null, null, null, null, null, null, null, null, null, null, '', '', '', '');
INSERT INTO `user` VALUES ('9', '0', '2010-03-02 13:32:47', '2010-03-02 13:32:47', 'xykqq2421@126.com', 'sluna2009', '89f1eb8bebefcc8bbe52d592bdf1309538c43361', 'sluna~', null, null, null, null, null, null, null, null, null, null, null, '', '', '', '');
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '1');
INSERT INTO `user_role` VALUES ('3', '1');
INSERT INTO `user_role` VALUES ('4', '1');
INSERT INTO `user_role` VALUES ('5', '1');
INSERT INTO `user_role` VALUES ('6', '1');
INSERT INTO `user_role` VALUES ('7', '1');
INSERT INTO `user_role` VALUES ('8', '1');
INSERT INTO `user_role` VALUES ('9', '2');

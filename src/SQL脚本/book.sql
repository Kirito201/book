/*
 Navicat MySQL Data Transfer

 Source Server         : lhl-mysql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 20/04/2019 21:32:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(32) DEFAULT NULL,
  `book_name` varchar(64) DEFAULT NULL,
  `book_author` varchar(64) DEFAULT NULL,
  `book_publish` varchar(64) DEFAULT NULL,
  `book_price` decimal(10,2) DEFAULT NULL,
  `book_state` int(11) DEFAULT '0',
  `book_type` int(11) DEFAULT NULL,
  `book_introduction` text,
  `book_shelf` int(11) DEFAULT NULL,
  `book_create_time` datetime DEFAULT NULL,
  `book_last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  KEY `fk_bookType` (`book_type`) USING BTREE,
  CONSTRAINT `fk_bookType` FOREIGN KEY (`book_type`) REFERENCES `book_type` (`book_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_info
-- ----------------------------
BEGIN;
INSERT INTO `book_info` VALUES (1, '9787302519287', 'Excel企业经营数据分析实战', '张倩', '清华大学出版社', 79.00, 0, 31, '本书是一本介绍Excel 2016企业经营数据实用操作的书籍，全面系统地介绍了Excel 2016的技术特点和企业数据实战应用知识。本书通过大量的实用案例，帮助读者快速掌握Excel的应用技巧，这些案例也适合读者直接在工作中借鉴使用。 本书共分11章，内容涉及企业数据高效录入、数据的整理和规范、数据的初步处理、数据的常规分析、公式和函数的应用、图表的应用、数据分析工具的应用及Excel的应用综合。 本书既可作为Excel初学者的入门指南，也可作为中、高级用户的实用参考手册，还可作为各类办公人员的培训教材', 1, '2019-04-16 10:12:03', '2019-04-19 14:18:24');
INSERT INTO `book_info` VALUES (2, '9787302515807', '零基础学WordPress', '老王经销商', '清华大学出版社', 79.00, 1, 31, '本书通过对安装使用WordPress搭建自媒体站点的前期、中期、后期进行详细讲解，使读者全面了解和掌握作为一个自媒体网站站长应掌握的域名、服务器、WordPress等方面的基础知识，同时通过实例站点与图书社区为读者提供了相关资源与服务，是一本绝无仅有、不可多得的技术书籍。\n全书分为3大部分，共21章节。第1～9章着重介绍域名的基础知识、购买域名的支付方式、购买域名的基本流程、域名备案的常规流程以及域名解析的常用方法；第10～17章着重介绍Linux的简单概念、相关社区的提问方法、使用服务器的基础知识、服务器安全的基础知识、权限管理的基础知识、使用防火墙的基础知识、操作数据库的基础知识、WordPress加速的基础知识以及管理账号密码的基础知识；第18～21章着重介绍安装使用WordPress过程中的基础知识、实例站点的建设流程。\n\n本书适合有志于成为优秀自媒体人的入门读者，也适合作为高等院校的选修计算机教材，还可供对搭建独立个人博客有兴趣的人士以及对建设独立企业官网有需求的中小企业参考。', 1, '2019-04-16 10:18:58', '2019-04-19 14:15:30');
INSERT INTO `book_info` VALUES (3, '9787302505945', '零基础入门学习C语言——带你学C带你飞（微课视频版）', '小甲鱼', '清华大学出版社', 79.00, 0, 23, '《零基础入门学习C语言——带你学C带你飞（微课视频版）》提倡“理解为主，应用为王”，通过列举一些有趣的例子，让读者在实践中理解概念。《零基础入门学习C语言——带你学C带你飞（微课视频版）》从变量、数据类型、取值范围等基本知识开始讲解，深入介绍分支与循环，讲到指针的时候，分散难点，依次讲解数组与指针、函数与指针、结构体与指针，每个知识点结合恰当的实例进行演示，环环相扣，内容详尽。\n编程知识深似海，小甲鱼没办法仅通过一《零基础入门学习C语言——带你学C带你飞（微课视频版）》将所有的知识都灌输给读者，但能够做到的是培养读者对编程的兴趣，提高编写代码的水平，锻炼自学的能力。\n\n《零基础入门学习C语言——带你学C带你飞（微课视频版）》贯彻的核心理念是：实用、好玩、参与。\n\n《零基础入门学习C语言——带你学C带你飞（微课视频版）》适合学习C语言的入门读者，也适用于对编程一无所知，但渴望用编程改变世界的朋友。', 2, '2019-04-16 10:21:15', '2019-04-19 14:06:25');
INSERT INTO `book_info` VALUES (4, '9787302523352', 'JSP Servlet Tomcat应用开发从零开始学（第2版）', '林龙 刘华贞', '清华大学出版社', 79.00, 0, 23, '本书全面介绍了JSP开发中涉及的相关技术要点和实战技巧。全书结构清晰，难度循序渐进，结合丰富的示例使零基础的读者能够熟练掌握JSP的开发、部署以及优化。\n本书分为3篇：第1篇为Java Web基础开发，内容包括搭建Java Web开发环境、JSP基础语法、JSP内置对象、Servlet技术、请求与响应、会话管理、Servlet进阶API、过滤器、监听器等；第2篇为Java Web高级开发，内容包括MySQL 8数据库开发、JSP与Java Bean、EL标签、JSTL标签库、自定义标签、JDBC详解、XML概述、资源国际化等；第3篇为Java Web实战，内容包括两个典型的系统，即家校通门户网站（JSP HTML CSS）、在线购物系统（JSP Java Bean MySQL）。\n\n本书内容精练、结构清晰、注重实战，适合广大Java Web初学人员学习，同时也非常适合大中专院校师生学习阅读，还可作为高等院校计算机及相关专业的教材使用。', 2, '2019-04-16 10:23:01', '2019-04-19 14:10:09');
INSERT INTO `book_info` VALUES (6, '9787302517559', 'Android 7应用程序开发教程', '李波', '清华大学出版社', 89.00, 0, 23, 'Android系统是目前最为流行的智能手机操作系统之一，面向Android系统的应用开发是目前的技术热点。本书针对Android SDK 7，结合全新的Android Studio开发环境，对Android应用编程基础知识进行讲解，易于读者理论联系实践，尽快掌握Android系统编程知识。\n本书分为14章，使用Java开发语言，内容主要包括Android 系统的发展历史、系统架构、应用程序框架、界面开发、网络访问、多媒体应用程序开发、数据存储等。本书每一章都给出实例，使读者进一步巩固所学的知识，提高综合实战能力。\n\n本书既适合熟悉Java编程的Android初学者和具有一定Android编程经验的用户，也可供广大计算机工作者和软件开发者参考。', 2, '2019-04-16 10:28:32', '2019-04-19 14:11:21');
INSERT INTO `book_info` VALUES (8, '9787302518082', 'AutoCAD 2018中文版入门与提高——土木工程设计', 'CAD/CAM/CAE技术联盟', '清华大学出版社', 89.80, 0, 23, '本书共分为3个部分15章，第1～5章为AutoCAD基础篇，包括AutoCAD2018基础入门，绘图基础与控制，图形的绘制与编辑，图形的尺寸、文字标注与表格，使用块、外部参照和设计中心等；第6～11章为建筑施工图篇，包括建筑施工图制图标准（2010版），建筑总平面图、平面图、立面图、剖面图、详图等的概述与绘制方法；第12～15章为结构施工图篇，包括建筑结构图制图标准（2010版），基础平面图与详图的概述与绘制方法，楼层结构平面图的概述与绘制方法，楼梯结构详图的概述与绘制方法。', 3, '2019-04-16 10:32:09', '2019-04-16 10:32:09');
INSERT INTO `book_info` VALUES (9, '9787302515654', 'Oracle 12c数据库入门与应用', '靳智良、冯海燕', '清华大学出版社', 66.00, 0, 23, 'Oracle数据库系统是数据库领域最优秀的数据库之一，《Oracle 12c数据库入门与应用》以Oracle最新版本12c为蓝本，系统地讲述了Oracle数据库的概念、管理和应用开发等内容。全书结构合理、内容翔实、示例丰富、语言简洁。从实际角度出发，系统地介绍了数据库和Oracle的相关概念和原理、数据维护(查询、更新和删除)、Oracle数据库管理(如安装与启动、用户权限)以及Oracle的应用开发基础，并在最后通过设计医院预约挂号系统数据库讲解开发的详细过程。\n《Oracle 12c数据库入门与应用》面向数据库管理人员和数据库开发人员，是初学者很好的入门教程，对Oracle管理员和应用程序开发员也有很好的学习和参考价值，也可以作为各大、中专院校相关专业的参考用书和相关培训机构的培训教材。', 3, '2019-04-16 10:34:42', '2019-04-16 10:34:42');
INSERT INTO `book_info` VALUES (10, '9787302524281', 'MySQL 5.7从入门到精通（视频教学版）（第2版）', '张工厂', '清华大学出版社', 138.00, 0, 23, '本书主要包括MySQL的安装与配置、数据库的创建、数据表的创建、数据类型和运算符、MySQL函数、查询数据、数据表的操作（插入、更新与删除数据）、索引、存储过程和函数、视图、触发器、用户管理、数据备份与还原、日志以及性能优化。最后通过3个综合案例的数据库设计，进一步讲述MySQL在实际工作中的应用。重点介绍MySQL安装与配置、数据类型和运算符以及数据表的操作。本书注重实战操作，帮助读者循序渐进地掌握MySQL中的各项技术。\n本书共有480个实例和19个综合案例，还有大量的经典习题。随书赠送了近20小时培训班形式的视频教学录像，详细讲解了书中每一个知识点和每一个数据库操作的方法和技巧。同时光盘中还提供了本书所有例子的源代码，读者可以直接查看和调用。\n\n本书适合MySQL数据库初学者、MySQL数据库开发人员和MySQL数据库管理员，同时也能作为高等院校和培训学校相关专业师生的教学用书。', 3, '2019-04-16 10:41:25', '2019-04-16 10:41:25');
INSERT INTO `book_info` VALUES (11, '9787302513223', 'SPSS实战与统计思维', '武松', '清华大学出版社', 99.00, 0, 23, '本书从统计学思维开始，由浅入深，全面系统地讲解了SPSS实战应用。本书涉及面广，从软件基本操作到高级统计分析技术，涉及SPSS目前绝大部分的应用范畴。本书涵盖SPSS概述、数据管理、统计描述分析、基本统计分析的报表制作、t检验、方差分析、Logistic回归、中介效应与调节效应分析以及大量的专项统计方法。本书以案例式教学为特色，书中提供了大量的应用案例，供读者实战演练。\n本书不仅适合有一定统计基础的人员阅读，也适合SPSS初学者。通信、金融、制造、医药、教育科研、市场调研、连锁零售和电子商务等行业的数据分析人员，可将本书作为一本易学易练的案头参考书。信息技术、心理学、经济管理等专业的大中专院校的学生和教师，可将本书作为一本教材使用。', 3, '2019-04-16 10:42:50', '2019-04-16 10:42:50');
INSERT INTO `book_info` VALUES (13, '9787302494881', '工业产品形态创新设计与评价方法', '高瞩', '清华大学出版社', 59.00, 0, 23, '本书提出产品形态原型和形态“传承度”的思想，通过对产品形态风格的描述与分析，建立形态原型的参数与产品形态风格的关系，构建了工业产品形态创新设计与评价的理论和方法，对工业产品的形态创新、分析评价及指导企业的设计实践具有重要的理论和实际意义。\n利用产品照片反求其形态3D模型，以形态分体的最适包围盒为单元，基于拓扑关系构建形态原型；提出基于产品形态原型的递进式形态语意获取方法，以及形态的风格空间和玫瑰图，面向风格的产品形态创新设计框架及软件开发思路；基于遗传算法对产品形态设计方案进行风格定位，构建了基于风格要求的产品形态创新设计方法。基于产品形态“传承度”，建立基于形态传承的设计评价方法及工业产品形态设计与评价（FD', 4, '2019-04-16 10:50:31', '2019-04-16 10:50:31');
INSERT INTO `book_info` VALUES (14, '9787302511083', '敏捷软件开发：用户故事实战', '迈克·科恩（Mike Cohn）著　王凌宇　译', '清华大学出版社', 69.80, 0, 23, '<p><img alt=\"\" src=\"/uploads/2019/04/16/13/13/e45d5c9b-8d16-4ab7-b60a-c430a0802ce8.jpg\" style=\"height:500px; width:369px\" /></p>\n\n<p>作为敏捷社区的经典名作，《敏捷软件开发：用户故事实战》不负众望，为软件行业提供了一种高效的需求过程，通过用户故事来节省时间、消除重复工作和开发更优秀的软件。要想构建可以满足用户需求的软件，最好的方法是从&ldquo;用户故事&rdquo;开始，用简明扼要的语言清楚明确地描述对实际用户有价值的功能。在本书中，敏捷实干家提供了一个详尽的蓝图来指导读者如何编写用户故事，如何在软件开发生命周期中实际运用用户故事。</p>\n\n<p>《敏捷软件开发：用户故事实战》共5部分21章，介绍了如何写出理想的用户故事，造成用户故事不理想的因素有哪些，如何在无法直接接触到用户的情况下有效搜集用户故事，如何对写好的用户故事进行整理、排优先级并在此基础上进行计划、管理和测试。</p>\n\n<p>《敏捷软件开发：用户故事实战》适合采用XP、Scrum甚至其他自主敏捷方法的所有开发、测试、分析师和项目负责人阅读和参考，可以帮助他们以更少的人手在更短的时间内开发出更符合用户需求的产品或服务。</p>\n', 3, '2019-04-16 17:10:54', '2019-04-16 17:10:54');
INSERT INTO `book_info` VALUES (15, '9787302489764', '软件之美', '申艳光、申思', '清华大学出版社', 39.00, 0, 23, '<p><img alt=\"\" src=\"/uploads/2019/04/16/15/5/fedec9fe-4d91-4ce3-93f0-5078d44d2eac.jpg\" style=\"height:500px; width:370px\" /></p><p>行走在红尘里，每个人都会遇见暴风骤雨和诗情画意。&ldquo;忧者见之而忧，喜者见之而喜&rdquo;。一路上，我们会听见花开的声音，会看见花绽的容颜，也会感受花落花谢的怜惜，如果我们能时时拥有温暖愉悦的心境，一路经历着、感悟着、感恩着，我们的生命就会开出美丽的花朵，永绽不败。</p>\n\n<p>一提到软件工程师，你是不是就会自动脑补一个对着计算机或者设备不停调试的呆板形象，而且会想到&ldquo;IT男&rdquo;&ldquo;码农&rdquo;这些词语？确实，在很多人心中，软件工程师是和呆板、机械、无趣画上等号的。</p>\n\n<p>请跟我们走进《软件之美》，本书将带你走进一个充满人文艺术气息的软件工程中，和我们一起发现、解读、领悟和体会软件之美和生活之美，敞开心扉、提升心境，体悟生活，感悟人生。</p>\n\n<p>本书共8章，内容包括软件中的思维、软件需求获取与分析、软件用户界面设计、邂逅编码、软件测试的心境、软件项目团队管理、软件文档写作的艺术和以道驭术等。</p>\n\n<p>本书可供从事计算机科学与技术学科和软件工程学科的相关工作者阅读、参考。</p>\n\n<p>行走在红尘里，每个人都会遇见暴风骤雨和诗情画意。&ldquo;忧者见之而忧，喜者见之而喜&rdquo;。一路上，我们会听见花开的声音，会看见花绽的容颜，也会感受花落花谢的怜惜，如果我们能时时拥有温暖愉悦的心境，一路经历着、感悟着、感恩着，我们的生命就会开出美丽的花朵，永绽不败。</p>\n\n<p>一提到软件工程师，你是不是就会自动脑补一个对着计算机或者设备不停调试的呆板形象，而且会想到&ldquo;IT男&rdquo;&ldquo;码农&rdquo;这些词语？确实，在很多人心中，软件工程师是和呆板、机械、无趣画上等号的。</p>\n\n<p>请跟我们走进《软件之美》，本书将带你走进一个充满人文艺术气息的软件工程中，和我们一起发现、解读、领悟和体会软件之美和生活之美，敞开心扉、提升心境，体悟生活，感悟人生。</p>\n\n<p>本书共8章，内容包括软件中的思维、软件需求获取与分析、软件用户界面设计、邂逅编码、软件测试的心境、软件项目团队管理、软件文档写作的艺术和以道驭术等。</p>\n\n<p>本书可供从事计算机科学与技术学科和软件工程学科的相关工作者阅读、参考。</p>\n', 3, '2019-04-16 17:18:43', '2019-04-16 17:18:43');
INSERT INTO `book_info` VALUES (16, '9787302511809', '大话软件测试——性能、自动化及团队管理', '赵强', '清华大学出版社', 79.00, 0, 27, '<p>本书并不是一本纯技术书籍，更像是一本系统性的参考书，能帮助读者深入理解性能测试和自动化测试的意义，也能帮助有多年工作经验正处于迷茫阶段的朋友排忧解难，还能给那些刚刚步入管理岗位的&ldquo;菜鸟们&rdquo;提供指导，尤其是其中的团队建设、绩效管理等是很多读者深感困惑的问题，可以说是测试工程师必读的一本书籍。</p>\n\n<p>本书分为两大部分：</p>\n\n<p>1~11章：&nbsp;以全新的角度来解释什么是性能测试和自动化测试，不仅以实际案例讲解了LoadRunner、JMeter、Soapui、Appium、移动端APP测试、前端性能、接口测试、安全测试、性能测试、自动化测试等内容，也讲解了大家最为头疼的两大难题&mdash;&mdash;性能测试通用分析思路和报告编写，同时也介绍了如何设计和开发轻量级自动化测试框架。</p>\n\n<p>12~14章：&nbsp;目前市面上缺少测试管理方面的图书，而本部分内容以作者本人的亲身经历来分享对测试行业的看法以及如何进行测试团队的建设、管理、绩效考核等，通俗易懂，是管理者的必读内容。</p>\n\n<p><img alt=\"\" src=\"/uploads/2019/04/16/5/7/b40b71a5-8426-47e1-92ee-e58a62cd538f.jpg\" style=\"float:left; height:300px; width:225px\" /></p>\n', 3, '2019-04-16 17:31:04', '2019-04-16 17:53:06');
COMMIT;

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type` (
  `book_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_type_name` varchar(64) DEFAULT NULL,
  `book_type_parent_id` int(11) DEFAULT NULL,
  `book_type_create_time` datetime DEFAULT NULL,
  `book_type_last_modify_time` datetime DEFAULT NULL,
  `book_type_note` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`book_type_id`) USING BTREE,
  KEY `fk_book_type` (`book_type_parent_id`) USING BTREE,
  CONSTRAINT `fk_book_type` FOREIGN KEY (`book_type_parent_id`) REFERENCES `book_type` (`book_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_type
-- ----------------------------
BEGIN;
INSERT INTO `book_type` VALUES (1, '所有分类', NULL, '2019-04-09 16:42:00', '2019-04-09 16:42:00', NULL);
INSERT INTO `book_type` VALUES (2, '马列主义毛邓思想', 1, '2019-04-09 16:43:00', '2019-04-19 21:26:15', '');
INSERT INTO `book_type` VALUES (3, '哲学', 1, '2019-04-09 16:43:20', '2019-04-09 16:43:20', NULL);
INSERT INTO `book_type` VALUES (4, '社会科学总论', 1, '2019-04-09 16:43:20', '2019-04-09 16:43:20', NULL);
INSERT INTO `book_type` VALUES (5, '政治、法律', 1, '2019-04-09 16:43:20', '2019-04-09 16:43:20', NULL);
INSERT INTO `book_type` VALUES (6, '军事', 1, '2019-04-09 16:43:21', '2019-04-09 16:43:21', NULL);
INSERT INTO `book_type` VALUES (7, '经济', 1, '2019-04-09 16:43:25', '2019-04-09 16:43:25', NULL);
INSERT INTO `book_type` VALUES (8, '文化、科学、教育、体育', 1, '2019-04-09 16:43:26', '2019-04-09 16:43:26', NULL);
INSERT INTO `book_type` VALUES (9, '语言、文字', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (10, '文学', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (11, '艺术', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (12, '历史、地理', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (13, '自然科学总论', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (14, '数理科学和化学', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (15, '天文学、地球科学', 1, '2019-04-09 16:47:00', '2019-04-09 16:47:00', NULL);
INSERT INTO `book_type` VALUES (16, '生物科学', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (17, '医药、卫生', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (18, '农业科学', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (19, '工业技术', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (20, '交通运输', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (21, '航空、航天', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (22, '环境科学、安全科学', 1, '2019-04-09 16:47:20', '2019-04-09 16:47:20', NULL);
INSERT INTO `book_type` VALUES (23, '综合性图书', 1, '2019-04-09 16:51:20', '2019-04-09 16:51:20', NULL);
INSERT INTO `book_type` VALUES (27, '测试分类1', 1, '2019-04-10 15:55:38', '2019-04-10 15:59:10', '');
INSERT INTO `book_type` VALUES (29, '测试分类2', 1, '2019-04-10 16:04:13', '2019-04-10 16:04:13', '');
INSERT INTO `book_type` VALUES (31, '测试2', 29, '2019-04-10 16:04:43', '2019-04-10 16:04:43', '222');
INSERT INTO `book_type` VALUES (32, '马克思、恩格斯著作', 2, '2019-04-10 16:14:30', '2019-04-10 16:14:30', '');
INSERT INTO `book_type` VALUES (33, '列宁著作', 2, '2019-04-10 16:14:41', '2019-04-10 16:14:41', '');
INSERT INTO `book_type` VALUES (34, '斯大林著作', 2, '2019-04-10 16:15:00', '2019-04-10 16:15:00', '');
INSERT INTO `book_type` VALUES (35, '毛泽东著作', 2, '2019-04-10 16:15:14', '2019-04-10 16:15:14', '');
INSERT INTO `book_type` VALUES (36, '马克思、恩格斯、列宁、斯大林、毛泽东著作汇编', 2, '2019-04-10 16:15:40', '2019-04-10 16:15:40', '');
INSERT INTO `book_type` VALUES (37, '马克思、恩格斯、列宁、斯大林、毛泽东的生平和传记', 2, '2019-04-10 16:16:00', '2019-04-10 16:16:00', '');
INSERT INTO `book_type` VALUES (38, '马克思主义、列宁主义、毛泽东思想的学习和研究', 2, '2019-04-10 16:16:21', '2019-04-10 16:16:21', '');
INSERT INTO `book_type` VALUES (39, '哲学理论', 3, '2019-04-10 16:16:37', '2019-04-10 16:16:37', '');
INSERT INTO `book_type` VALUES (40, '世界哲学', 3, '2019-04-10 16:16:47', '2019-04-10 16:16:47', '');
INSERT INTO `book_type` VALUES (41, '中国哲学', 3, '2019-04-10 16:17:59', '2019-04-10 16:17:59', '');
INSERT INTO `book_type` VALUES (42, '亚洲哲学', 3, '2019-04-10 16:18:10', '2019-04-10 16:18:10', '');
INSERT INTO `book_type` VALUES (43, '非洲哲学', 3, '2019-04-10 16:18:23', '2019-04-10 16:18:23', '');
INSERT INTO `book_type` VALUES (44, '欧洲哲学', 3, '2019-04-10 16:18:35', '2019-04-10 16:18:35', '');
INSERT INTO `book_type` VALUES (45, '大洋洲哲学', 3, '2019-04-10 16:18:44', '2019-04-10 16:18:44', '');
INSERT INTO `book_type` VALUES (46, '美洲哲学', 3, '2019-04-10 16:18:53', '2019-04-10 16:18:53', '');
INSERT INTO `book_type` VALUES (50, '思维科学', 3, '2019-04-10 16:24:58', '2019-04-10 16:24:58', '');
INSERT INTO `book_type` VALUES (51, '无神论、宗教', 3, '2019-04-10 16:25:18', '2019-04-10 16:25:18', '');
INSERT INTO `book_type` VALUES (52, '社会科学理论与方法论', 4, '2019-04-10 16:26:24', '2019-04-10 16:26:24', '');
INSERT INTO `book_type` VALUES (53, '社会科学现状、概况', 4, '2019-04-10 16:26:34', '2019-04-10 16:26:34', '');
INSERT INTO `book_type` VALUES (54, '机关、团体、会议', 4, '2019-04-10 16:26:44', '2019-04-10 16:26:44', '');
INSERT INTO `book_type` VALUES (55, '社会科学研究方法', 4, '2019-04-10 16:26:55', '2019-04-10 16:26:55', '');
INSERT INTO `book_type` VALUES (56, '社会科学教育与普及', 4, '2019-04-10 16:27:09', '2019-04-10 16:27:09', '');
INSERT INTO `book_type` VALUES (57, '社会科学丛书、文集、连续性出版物', 4, '2019-04-10 16:27:25', '2019-04-10 16:27:25', '');
INSERT INTO `book_type` VALUES (58, '社会科学参考工具书', 4, '2019-04-10 16:27:38', '2019-04-10 16:27:38', '');
INSERT INTO `book_type` VALUES (59, '社会科学文献检索工具书', 4, '2019-04-10 16:27:49', '2019-04-10 16:27:49', '');
INSERT INTO `book_type` VALUES (60, '统计学', 4, '2019-04-10 16:27:57', '2019-04-10 16:27:57', '');
INSERT INTO `book_type` VALUES (61, '政治理论', 5, '2019-04-10 16:29:38', '2019-04-10 16:29:38', '');
INSERT INTO `book_type` VALUES (62, '国际共产主义运动', 5, '2019-04-10 16:31:03', '2019-04-10 16:31:03', '');
INSERT INTO `book_type` VALUES (63, '中国共产党', 5, '2019-04-10 16:31:18', '2019-04-10 16:31:18', '');
INSERT INTO `book_type` VALUES (64, '军事理论', 6, '2019-04-10 16:34:34', '2019-04-10 16:34:34', '');
INSERT INTO `book_type` VALUES (65, '政治经济学', 7, '2019-04-10 16:34:46', '2019-04-10 16:34:46', '');
INSERT INTO `book_type` VALUES (66, '文化理论', 8, '2019-04-10 16:34:56', '2019-04-10 16:34:56', '');
INSERT INTO `book_type` VALUES (67, '语言学', 9, '2019-04-10 16:35:08', '2019-04-10 16:35:08', '');
INSERT INTO `book_type` VALUES (68, '文学理论', 10, '2019-04-10 16:35:18', '2019-04-10 16:35:18', '');
INSERT INTO `book_type` VALUES (69, '艺术理论', 11, '2019-04-10 16:35:30', '2019-04-10 16:35:30', '');
INSERT INTO `book_type` VALUES (70, '史学理论', 12, '2019-04-10 16:35:42', '2019-04-10 16:35:42', '');
INSERT INTO `book_type` VALUES (71, '自然科学理论与方法论', 13, '2019-04-10 16:36:12', '2019-04-10 16:36:12', '');
INSERT INTO `book_type` VALUES (72, '数学', 14, '2019-04-10 16:36:23', '2019-04-10 16:36:23', '');
INSERT INTO `book_type` VALUES (73, '天文学', 15, '2019-04-10 16:36:33', '2019-04-10 16:36:33', '');
INSERT INTO `book_type` VALUES (74, '普通生物学', 16, '2019-04-10 16:36:43', '2019-04-10 16:36:43', '');
INSERT INTO `book_type` VALUES (75, '预防医学、卫生学', 17, '2019-04-10 16:36:53', '2019-04-10 16:36:53', '');
INSERT INTO `book_type` VALUES (76, '农业基础科学', 18, '2019-04-10 16:37:06', '2019-04-10 16:37:06', '');
INSERT INTO `book_type` VALUES (77, '一般工业技术', 19, '2019-04-10 16:37:17', '2019-04-10 16:37:17', '');
INSERT INTO `book_type` VALUES (78, '综合运输', 20, '2019-04-10 16:37:45', '2019-04-10 16:37:45', '');
INSERT INTO `book_type` VALUES (79, '航空、航天技术的研究与探索', 21, '2019-04-10 16:38:05', '2019-04-10 16:38:05', '');
INSERT INTO `book_type` VALUES (80, '环境科学基础理论', 22, '2019-04-10 16:38:14', '2019-04-10 16:38:14', '');
INSERT INTO `book_type` VALUES (81, '丛书', 23, '2019-04-10 16:38:27', '2019-04-10 16:38:27', '');
INSERT INTO `book_type` VALUES (82, '百科全书、类书', 23, '2019-04-10 16:38:37', '2019-04-10 16:38:37', '');
INSERT INTO `book_type` VALUES (83, '测试1', 27, '2019-04-17 21:17:20', '2019-04-17 21:17:20', '');
COMMIT;

-- ----------------------------
-- Table structure for lend_return_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_return_list`;
CREATE TABLE `lend_return_list` (
  `lend_return_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `lend_date` date DEFAULT NULL,
  `should_lend_days` int(11) DEFAULT NULL,
  `should_return_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `is_damage` int(11) DEFAULT NULL,
  `damage_degree` varchar(32) DEFAULT NULL,
  `damage_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lend_return_id`) USING BTREE,
  KEY `fk_userId` (`user_id`) USING BTREE,
  KEY `fk_bookId` (`book_id`) USING BTREE,
  CONSTRAINT `fk_bookId` FOREIGN KEY (`book_id`) REFERENCES `book_info` (`book_id`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lend_return_list
-- ----------------------------
BEGIN;
INSERT INTO `lend_return_list` VALUES (1, 1, 155479343253180, '2019-04-17', 10, '2019-04-27', '2019-04-18', 0, NULL, NULL);
INSERT INTO `lend_return_list` VALUES (2, 2, 155479343253180, '2019-04-17', 20, '2019-05-07', '2019-04-19', 0, '', '');
INSERT INTO `lend_return_list` VALUES (3, 3, 155479343253065, '2019-03-17', 10, '2019-03-27', '2019-04-19', 1, '轻微损毁', '损毁');
INSERT INTO `lend_return_list` VALUES (4, 4, 155479343253065, '2019-04-17', 20, '2019-05-07', '2019-04-19', 0, '', '');
INSERT INTO `lend_return_list` VALUES (5, 6, 155479343253065, '2019-04-17', 20, '2019-05-07', '2019-04-19', 0, '', '');
INSERT INTO `lend_return_list` VALUES (9, 1, 155479343253065, '2019-04-18', 10, '2019-04-28', '2019-04-19', 0, '', '');
INSERT INTO `lend_return_list` VALUES (10, 1, 155479343253180, '2019-04-19', 10, '2019-04-29', '2019-04-19', 0, '', '');
INSERT INTO `lend_return_list` VALUES (11, 2, 155479343253111, '2019-04-19', 10, '2019-04-29', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(64) NOT NULL,
  `permission_url` varchar(256) DEFAULT NULL,
  `permission_parent_id` int(11) DEFAULT NULL,
  `permission_icon` varchar(256) DEFAULT NULL,
  `permission_create_time` datetime DEFAULT NULL,
  `permission_last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  KEY `fk_permission` (`permission_parent_id`) USING BTREE,
  CONSTRAINT `fk_permission` FOREIGN KEY (`permission_parent_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, '系统菜单', NULL, NULL, 'fa fa-desktop', '2019-03-26 00:00:00', '2019-03-26 00:00:00');
INSERT INTO `permission` VALUES (2, '系统管理', '', 1, 'fa fa-cog', '2019-03-26 00:00:00', '2019-03-26 00:00:00');
INSERT INTO `permission` VALUES (3, '用户管理', '/admin/user', 2, 'fa fa-user', '2019-03-26 00:00:00', '2019-03-26 00:00:00');
INSERT INTO `permission` VALUES (4, '角色管理', '/admin/role', 2, 'fa fa-list', '2019-03-28 00:00:00', '2019-03-28 00:00:00');
INSERT INTO `permission` VALUES (5, '图书管理', NULL, 1, 'fa fa-book', '2019-04-09 00:00:00', '2019-04-09 00:00:00');
INSERT INTO `permission` VALUES (6, '图书分类管理', '/admin/booktype', 5, 'fa fa-file-text', '2019-04-09 15:50:00', '2019-04-09 15:50:00');
INSERT INTO `permission` VALUES (7, '应用管理', '/admin/permission', 2, 'fa fa-tasks', '2019-04-10 18:37:00', '2019-04-10 18:37:00');
INSERT INTO `permission` VALUES (9, '图书信息管理', '/admin/bookinfo', 5, 'fa fa-book', '2019-04-15 00:00:00', '2019-04-15 00:00:00');
INSERT INTO `permission` VALUES (10, '借书管理', '/admin/booklend', 5, 'fa fa-edit', '2019-04-17 00:00:00', '2019-04-17 00:00:00');
INSERT INTO `permission` VALUES (11, '还书管理', '/admin/bookreturn', 5, 'fa fa-pencil', '2019-04-18 00:00:00', '2019-04-18 00:00:00');
INSERT INTO `permission` VALUES (12, '借阅者', NULL, 1, 'fa fa-user', '2019-04-19 00:00:00', '2019-04-19 00:00:00');
INSERT INTO `permission` VALUES (13, '图书检索', '/admin/booksearch', 12, 'fa fa-book', '2019-04-19 00:00:00', '2019-04-19 00:00:00');
INSERT INTO `permission` VALUES (14, '借还记录', '/admin/lendrecord', 12, 'fa fa-file-text-o', '2019-04-19 00:00:00', '2019-04-19 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL,
  `role_create_time` datetime DEFAULT NULL,
  `role_last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, '系统管理员', '2019-03-28 00:00:00', '2019-03-28 00:00:00');
INSERT INTO `role` VALUES (2, '借阅者', '2019-03-28 20:31:02', '2019-03-28 20:33:17');
INSERT INTO `role` VALUES (4, '图书管理员', '2019-03-29 16:03:45', '2019-03-29 19:13:34');
INSERT INTO `role` VALUES (5, '馆长', '2019-03-29 16:03:52', '2019-04-10 14:50:20');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_permission_id`) USING BTREE,
  KEY `fk_role_permission_rs1` (`role_id`) USING BTREE,
  KEY `fk_role_permission_rs2` (`permission_id`) USING BTREE,
  CONSTRAINT `fk_role_permission_rs1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_role_permission_rs2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (89, 2, 1);
INSERT INTO `role_permission` VALUES (90, 2, 12);
INSERT INTO `role_permission` VALUES (91, 2, 13);
INSERT INTO `role_permission` VALUES (92, 2, 14);
INSERT INTO `role_permission` VALUES (103, 1, 1);
INSERT INTO `role_permission` VALUES (104, 1, 2);
INSERT INTO `role_permission` VALUES (105, 1, 3);
INSERT INTO `role_permission` VALUES (106, 1, 4);
INSERT INTO `role_permission` VALUES (107, 1, 7);
INSERT INTO `role_permission` VALUES (108, 4, 1);
INSERT INTO `role_permission` VALUES (109, 4, 5);
INSERT INTO `role_permission` VALUES (110, 4, 6);
INSERT INTO `role_permission` VALUES (111, 4, 9);
INSERT INTO `role_permission` VALUES (112, 4, 10);
INSERT INTO `role_permission` VALUES (113, 4, 11);
COMMIT;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`role_user_id`) USING BTREE,
  KEY `fk_role_user_rs1` (`role_id`) USING BTREE,
  KEY `fk_role_user_rs2` (`user_id`) USING BTREE,
  CONSTRAINT `fk_role_user_rs1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_role_user_rs2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------
BEGIN;
INSERT INTO `role_user` VALUES (20, 155479343253111, 2);
INSERT INTO `role_user` VALUES (21, 155479343253180, 2);
INSERT INTO `role_user` VALUES (25, 155479496654441, 2);
INSERT INTO `role_user` VALUES (26, 155479343253065, 2);
INSERT INTO `role_user` VALUES (27, 155479343250980, 1);
INSERT INTO `role_user` VALUES (28, 155479343250980, 4);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `user_password` char(32) NOT NULL,
  `user_email` varchar(64) NOT NULL,
  `user_phone` varchar(32) NOT NULL,
  `user_state` int(11) NOT NULL DEFAULT '1',
  `user_create_time` datetime DEFAULT NULL,
  `user_last_modify_time` datetime DEFAULT NULL,
  `user_true_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (155479343250980, 'admin', 'ba3873f74a5b46a4f93816721dad7345', '1176239106@qq.com', '13515107277', 1, '2019-03-12 00:00:00', '2019-04-17 13:38:20', '超级管理员');
INSERT INTO `user` VALUES (155479343253065, 'huangjianzhi', 'ba3873f74a5b46a4f93816721dad7345', '826243171@qq.com', '13515107279', 1, '2019-03-13 19:07:52', '2019-03-29 16:54:11', '黄剑治');
INSERT INTO `user` VALUES (155479343253111, 'luhailiang', 'ba3873f74a5b46a4f93816721dad7345', 'luhailiang98@gmail.com', '13515107280', 1, '2019-03-17 15:13:57', '2019-03-29 22:59:56', '陆海亮');
INSERT INTO `user` VALUES (155479343253180, 'hejialiang', 'ba3873f74a5b46a4f93816721dad7345', '893524733@qq.com', '18218121213', 1, '2019-03-18 22:30:50', '2019-04-17 20:59:25', '何嘉亮');
INSERT INTO `user` VALUES (155479496654441, 'guoweiyu', 'ba3873f74a5b46a4f93816721dad7345', '1402009986@qq.com', '13515107777', 1, '2019-04-09 15:29:30', '2019-04-17 16:13:47', '郭为宇');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

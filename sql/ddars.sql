-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2021 at 01:49 PM
-- Server version: 5.7.32-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddars`
--

-- --------------------------------------------------------

--
-- Table structure for table `creditors`
--

CREATE TABLE IF NOT EXISTS `creditors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '债权人ID',
  `user_id` int(11) NOT NULL COMMENT '债权人类型用户ID',
  `creditor_group` int(11) NOT NULL COMMENT '债权人类型分组ID',
  `certificate_type` enum('法人','合伙企业','个体工商户','其他单位') DEFAULT NULL COMMENT '认证类型',
  `name` varchar(50) DEFAULT NULL COMMENT '个人/单位名称',
  `id_card` char(18) DEFAULT NULL COMMENT '身份证号',
  `credit_code` varchar(30) DEFAULT NULL COMMENT '信用代码',
  `principal` varchar(50) DEFAULT NULL COMMENT '主要负责人',
  `business_license` mediumblob COMMENT '营业执照文件',
  `certified_file` mediumblob COMMENT '法人身份证明文件',
  `id_card_file` mediumblob NOT NULL COMMENT '身份证复印件',
  `contact` varchar(50) NOT NULL COMMENT '联系人名称',
  `contact_tel` varchar(50) NOT NULL COMMENT '联系人电话',
  `contact_email` varchar(50) NOT NULL COMMENT '联系人邮箱',
  `contact_address` varchar(255) NOT NULL COMMENT '联系人地址',
  `creditor_type` int(11) NOT NULL COMMENT '债权人类型ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `creditor_type` (`creditor_group`),
  KEY `creditor_type_2` (`creditor_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditors`
--

INSERT INTO `creditors` (`id`, `user_id`, `creditor_group`, `certificate_type`, `name`, `id_card`, `credit_code`, `principal`, `business_license`, `certified_file`, `id_card_file`, `contact`, `contact_tel`, `contact_email`, `contact_address`, `creditor_type`) VALUES
(1, 1, 1, '法人', '成都XXXXX有限责任公司', NULL, '96MA32137894123213', '张麻子', 0x64656d6f, 0x64656d6f, 0x64656d6f, 'AA', '123456', '123@123.com', '清水河', 210010);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_arbitration`
--

CREATE TABLE IF NOT EXISTS `creditor_arbitration` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID：生效法律文书/申请执行/查封内容',
  `name` varchar(50) NOT NULL COMMENT '文书名称/执行案号',
  `content` varchar(255) NOT NULL COMMENT '文书/执行/查封内容',
  `institution_name` varchar(50) NOT NULL COMMENT '机构名称',
  `institution_contact` varchar(50) NOT NULL COMMENT '机构联系人/法官',
  `institution_tel` varchar(50) NOT NULL COMMENT '联系电话',
  `certified_file` mediumblob NOT NULL COMMENT '证明文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='涉诉、执行及财产保全情况';

--
-- Dumping data for table `creditor_arbitration`
--

INSERT INTO `creditor_arbitration` (`id`, `name`, `content`, `institution_name`, `institution_contact`, `institution_tel`, `certified_file`) VALUES
(1, 'XXX', '无', '成都XX', '张三', '123456', 0x64656d6f);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_guarantee`
--

CREATE TABLE IF NOT EXISTS `creditor_guarantee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信用担保ID',
  `creditor_rights_id` int(11) NOT NULL COMMENT '债权人ID',
  `timestamp` date DEFAULT NULL COMMENT '合同签署日期',
  `contract_name` varchar(255) NOT NULL COMMENT '合同名称',
  `contract_num` varchar(50) NOT NULL COMMENT '合同编号',
  `guarantor` varchar(50) NOT NULL COMMENT '担保人',
  `warrantee` varchar(50) NOT NULL COMMENT '被担保人',
  `scope` set('主债权','利息','违约金','损害赔偿金','实现担保权的费用','其他') NOT NULL COMMENT '担保范围',
  `certified_file` mediumblob NOT NULL COMMENT '证明文件',
  PRIMARY KEY (`id`),
  KEY `creditor_rights_id` (`creditor_rights_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_guarantee`
--

INSERT INTO `creditor_guarantee` (`id`, `creditor_rights_id`, `timestamp`, `contract_name`, `contract_num`, `guarantor`, `warrantee`, `scope`, `certified_file`) VALUES
(2, 1, '2021-05-07', '合同', '无', 'aa', 'ss', '利息,违约金', 0x64656d6f);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_mortgages`
--

CREATE TABLE IF NOT EXISTS `creditor_mortgages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '抵质押担保情况ID',
  `creditor_rights_id` int(11) NOT NULL COMMENT '债权ID',
  `contract_num` varchar(50) NOT NULL COMMENT '合同编号',
  `contract_name` varchar(50) NOT NULL COMMENT '合同名称',
  `mortgagee` varchar(50) NOT NULL COMMENT '质权人/抵押权人',
  `mortgagor` varchar(50) NOT NULL COMMENT '出质人/抵押人',
  `collateral` varchar(50) NOT NULL COMMENT '抵质押物',
  `scope` set('主债权','利息','违约金','损害赔偿金','实现担保权的费用','担保物保管费','其他') NOT NULL COMMENT '担保范围',
  `register_num` varchar(50) DEFAULT NULL COMMENT '权证号（办理登记）',
  `register_addition` varchar(255) DEFAULT NULL COMMENT '其他（办理登记）',
  `certified_file` mediumblob NOT NULL COMMENT '证明文件',
  PRIMARY KEY (`id`),
  KEY `creditor_rights_id` (`creditor_rights_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_mortgages`
--

INSERT INTO `creditor_mortgages` (`id`, `creditor_rights_id`, `contract_num`, `contract_name`, `mortgagee`, `mortgagor`, `collateral`, `scope`, `register_num`, `register_addition`, `certified_file`) VALUES
(1, 1, '无', '合同', '上海xx有限责任公司', '成都xx科技有限公司', '房屋', '主债权,利息,违约金', NULL, NULL, 0x64656d6f);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_rights`
--

CREATE TABLE IF NOT EXISTS `creditor_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '债权ID',
  `submit` int(1) NOT NULL COMMENT '提交标识，未提交为0，已提交为1',
  `creditor_id` int(11) NOT NULL COMMENT '债权人ID',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `description` varchar(255) NOT NULL COMMENT '债权形成说明',
  `right_type` int(11) NOT NULL COMMENT '债权性质ID',
  `supplement` int(1) NOT NULL DEFAULT '0',
  `currency` enum('人民币','美元') NOT NULL COMMENT '币种',
  `principle` double NOT NULL COMMENT '本金',
  `interest` double NOT NULL COMMENT '利息',
  `other` double NOT NULL COMMENT '其他',
  `contract_date` date NOT NULL COMMENT '合同签署日期',
  `contract_num` varchar(50) NOT NULL COMMENT '合同编号',
  `contract_name` varchar(128) NOT NULL COMMENT '合同名称',
  `debtor_name` varchar(50) NOT NULL COMMENT '主债务人',
  `creditor_name` varchar(50) NOT NULL COMMENT '主债权人',
  `contract_content` varchar(255) NOT NULL COMMENT '主要内容',
  `contract_certified_file` mediumblob NOT NULL COMMENT '合同证明文件',
  `litigation_case_num` varchar(50) DEFAULT NULL COMMENT '诉讼仲裁编号',
  `legal_doc` int(11) DEFAULT NULL COMMENT '法律文书ID',
  `apply_id` int(11) DEFAULT NULL COMMENT '申请执行ID',
  `seize_id` int(11) DEFAULT NULL COMMENT '查封内容ID',
  `expired` int(1) NOT NULL COMMENT '已过诉讼时效（0,1）',
  `unpaid` double NOT NULL COMMENT '欠付发票金额',
  `addition` varchar(255) NOT NULL COMMENT '补充说明',
  `addition_file` mediumblob COMMENT '补充材料',
  `express` int(11) DEFAULT NULL COMMENT '快递公司ID',
  `express_num` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `declaration_file` mediumblob COMMENT '申报信息单',
  PRIMARY KEY (`id`),
  KEY `right_type` (`right_type`),
  KEY `project_id` (`project_id`),
  KEY `creditor_id` (`creditor_id`),
  KEY `legal_doc` (`legal_doc`),
  KEY `apply_id` (`apply_id`),
  KEY `seize_id` (`seize_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_rights`
--

INSERT INTO `creditor_rights` (`id`, `submit`, `creditor_id`, `project_id`, `description`, `right_type`, `supplement`, `currency`, `principle`, `interest`, `other`, `contract_date`, `contract_num`, `contract_name`, `debtor_name`, `creditor_name`, `contract_content`, `contract_certified_file`, `litigation_case_num`, `legal_doc`, `apply_id`, `seize_id`, `expired`, `unpaid`, `addition`, `addition_file`, `express`, `express_num`, `declaration_file`) VALUES
(1, 0, 1, 1, '说明一下', 2, 0, '人民币', 1000001.001, 1000, 0, '2021-04-27', '无', '合同', '成都破产科技有限公司', '四川锤子科技有限公司', '无', 0x64656d6f, NULL, NULL, NULL, NULL, 0, 0, '无', 0x64656d6f, 1, '123456789', 0x64656d6f);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_rights_status`
--

CREATE TABLE IF NOT EXISTS `creditor_rights_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '债权状态ID',
  `creditor_right_id` int(11) NOT NULL COMMENT '债权ID',
  `debtor_verify` int(1) NOT NULL COMMENT '债务人审核（0,1）',
  `debtor_suggestion` varchar(255) NOT NULL DEFAULT '' COMMENT '债务人建议',
  `manager_verify` int(1) NOT NULL COMMENT '管理人审核（0,1）',
  `manager_suggestion` varchar(255) NOT NULL COMMENT '管理人建议',
  PRIMARY KEY (`id`),
  UNIQUE KEY `creditor_right_id` (`creditor_right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_rights_status`
--

INSERT INTO `creditor_rights_status` (`id`, `creditor_right_id`, `debtor_verify`, `debtor_suggestion`, `manager_verify`, `manager_suggestion`) VALUES
(1, 1, 1, '无', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `creditor_trustees`
--

CREATE TABLE IF NOT EXISTS `creditor_trustees` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '债权人中的受托人ID',
  `creditor_id` int(11) NOT NULL COMMENT '债权人ID',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `id_card` char(18) NOT NULL COMMENT '身份证号',
  `tel` varchar(20) NOT NULL COMMENT '联系电话',
  `company` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `lawyer` int(1) NOT NULL COMMENT '是否是律师（0, 1）',
  `law_firm_file` mediumblob COMMENT '律师事务所函',
  `lawyer_id_card_file` mediumblob COMMENT '律师身份证复印件',
  `power_of_attorney` mediumblob COMMENT '授权委托书',
  PRIMARY KEY (`id`),
  KEY `creditor_id` (`creditor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_trustees`
--

INSERT INTO `creditor_trustees` (`id`, `creditor_id`, `name`, `id_card`, `tel`, `company`, `lawyer`, `law_firm_file`, `lawyer_id_card_file`, `power_of_attorney`) VALUES
(1, 1, '牧之', '110022199909091234', '17321255121', NULL, 0, NULL, NULL, NULL),
(2, 1, '麻子', '110022199909091234', '17321255121', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_types`
--

CREATE TABLE IF NOT EXISTS `creditor_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210051 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_types`
--

INSERT INTO `creditor_types` (`id`, `name`, `content_id`) VALUES
(210010, '供应商债权人', 210),
(210020, '经销商债权人', 210),
(210030, '物流服务商债权人', 210),
(210040, '一般租赁债权人', 210),
(210050, '建设工程债权人', 210);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_types_content`
--

CREATE TABLE IF NOT EXISTS `creditor_types_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_types_content`
--

INSERT INTO `creditor_types_content` (`id`, `name`, `group_id`) VALUES
(100, '职工类债权人', 1),
(200, '融资类债权人', 2),
(210, '经营类债权人', 2),
(220, '公共服务类债权人', 2),
(300, '其他类债权人', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `creditor_types_group`
--

CREATE TABLE IF NOT EXISTS `creditor_types_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditor_types_group`
--

INSERT INTO `creditor_types_group` (`id`, `name`, `description`) VALUES
(1, '自然人', '自然人'),
(2, '非自然人', '法人或其他组织');

-- --------------------------------------------------------

--
-- Table structure for table `express`
--

CREATE TABLE IF NOT EXISTS `express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `format` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `express`
--

INSERT INTO `express` (`id`, `name`, `format`) VALUES
(1, '顺丰快递', 0),
(2, '圆通快递', 0),
(3, '申通快递', 0),
(4, 'EMS', 0),
(5, '中国快递', 0),
(6, '韵达快递', 0),
(7, '其他快递公司', 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_project`
--

CREATE TABLE IF NOT EXISTS `log_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目日志ID',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `message` varchar(255) NOT NULL COMMENT '日志信息',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_project`
--

INSERT INTO `log_project` (`id`, `project_id`, `message`, `timestamp`) VALUES
(1, 1, '第二次债权人会议主要内容', '2021-04-27 16:03:09'),
(2, 1, '123', '2021-04-27 17:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `project_list`
--

CREATE TABLE IF NOT EXISTS `project_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `debtor_id` int(11) NOT NULL COMMENT '债务人ID',
  `project_id` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '项目编号',
  `name` varchar(50) NOT NULL COMMENT '项目名称',
  `type` int(11) NOT NULL COMMENT '项目类型ID',
  `court` varchar(50) NOT NULL COMMENT '法院',
  `industry` varchar(50) NOT NULL COMMENT '所属行业',
  `acceptance_date` datetime DEFAULT NULL COMMENT '接收时间',
  `address` varchar(128) NOT NULL COMMENT '地址',
  `overview` varchar(255) NOT NULL COMMENT '概述',
  `manager` int(11) DEFAULT NULL COMMENT '管理人ID',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_2` (`project_id`),
  KEY `project_id` (`project_id`),
  KEY `manager` (`manager`),
  KEY `type` (`type`),
  KEY `debtor_id` (`debtor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_list`
--

INSERT INTO `project_list` (`id`, `debtor_id`, `project_id`, `name`, `type`, `court`, `industry`, `acceptance_date`, `address`, `overview`, `manager`, `parent_id`) VALUES
(1, 1, '202104300001', '四川省郫都区破产有限公司', 1, '四川省成都市中级人民法院', '化肥化工', '2021-04-29 15:35:59', '成都市郫都区合作路100号', '四川省郫都区破产有限公司', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE IF NOT EXISTS `project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目类型ID',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `description` varchar(255) NOT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_type`
--

INSERT INTO `project_type` (`id`, `name`, `description`) VALUES
(1, '重整', '重整项目');

-- --------------------------------------------------------

--
-- Table structure for table `rights_type`
--

CREATE TABLE IF NOT EXISTS `rights_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rights_type`
--

INSERT INTO `rights_type` (`id`, `name`) VALUES
(1, '职工债权'),
(2, '有财产担保债权'),
(3, '税款债权'),
(4, '普通债权');

-- --------------------------------------------------------

--
-- Table structure for table `user_creditor`
--

CREATE TABLE IF NOT EXISTS `user_creditor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '债权人用户ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `authentication_string` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `tel` char(30) CHARACTER SET latin1 NOT NULL COMMENT '联系电话',
  `user_type` int(11) NOT NULL COMMENT '民事主体类型',
  `username` varchar(30) NOT NULL COMMENT '用户名称',
  `id_card` char(18) DEFAULT NULL COMMENT '身份证号码',
  `verified` int(1) NOT NULL DEFAULT '0' COMMENT '认证标识，已认证为1，未认证为0',
  `address` varchar(128) DEFAULT NULL COMMENT '联系地址',
  `occupation` varchar(50) DEFAULT NULL COMMENT '所在行业',
  `company` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `company_num` varchar(20) DEFAULT NULL COMMENT '单位联系电话',
  `company_address` varchar(128) DEFAULT NULL COMMENT '单位地址',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_creditor`
--

INSERT INTO `user_creditor` (`id`, `project_id`, `authentication_string`, `tel`, `user_type`, `username`, `id_card`, `verified`, `address`, `occupation`, `company`, `company_num`, `company_address`, `email`) VALUES
(1, 1, '*606385D2B41C1268F697EF9B77AA7388C08153FA', '17321255121', 1, 'Newton', '513000000000000000', 1, '高新西区100号', '计算机', NULL, NULL, NULL, 'newton@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_creditor_types`
--

CREATE TABLE IF NOT EXISTS `user_creditor_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_creditor_types`
--

INSERT INTO `user_creditor_types` (`id`, `name`) VALUES
(1, '自然人'),
(2, '代理人');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE IF NOT EXISTS `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `description`) VALUES
(1, 'creditor', '债权人'),
(2, 'debtor', '债务人'),
(3, 'manager', '管理人');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creditors`
--
ALTER TABLE `creditors`
  ADD CONSTRAINT `creditors_idfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_creditor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creditors_idfk_3` FOREIGN KEY (`creditor_type`) REFERENCES `creditor_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditor_guarantee`
--
ALTER TABLE `creditor_guarantee`
  ADD CONSTRAINT `credit_guarantee_idfk_1` FOREIGN KEY (`creditor_rights_id`) REFERENCES `creditor_rights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditor_mortgages`
--
ALTER TABLE `creditor_mortgages`
  ADD CONSTRAINT `mortgages_idfk_1` FOREIGN KEY (`creditor_rights_id`) REFERENCES `creditor_rights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditor_rights`
--
ALTER TABLE `creditor_rights`
  ADD CONSTRAINT `creditor_rights_idfk_1` FOREIGN KEY (`creditor_id`) REFERENCES `creditors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creditor_rights_idfk_2` FOREIGN KEY (`project_id`) REFERENCES `project_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creditor_rights_idfk_3` FOREIGN KEY (`right_type`) REFERENCES `rights_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creditor_rights_idfk_4` FOREIGN KEY (`legal_doc`) REFERENCES `creditor_arbitration` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `creditor_rights_idfk_5` FOREIGN KEY (`apply_id`) REFERENCES `creditor_arbitration` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `creditor_rights_idfk_6` FOREIGN KEY (`seize_id`) REFERENCES `creditor_arbitration` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `creditor_rights_status`
--
ALTER TABLE `creditor_rights_status`
  ADD CONSTRAINT `creditor_rights_status_idfk_1` FOREIGN KEY (`creditor_right_id`) REFERENCES `creditor_rights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditor_trustees`
--
ALTER TABLE `creditor_trustees`
  ADD CONSTRAINT `trustees_idfk_1` FOREIGN KEY (`creditor_id`) REFERENCES `creditors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditor_types`
--
ALTER TABLE `creditor_types`
  ADD CONSTRAINT `creditor_types_idfk_1` FOREIGN KEY (`content_id`) REFERENCES `creditor_types_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditor_types_content`
--
ALTER TABLE `creditor_types_content`
  ADD CONSTRAINT `creditor_types_content_idfk_1` FOREIGN KEY (`group_id`) REFERENCES `creditor_types_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log_project`
--
ALTER TABLE `log_project`
  ADD CONSTRAINT `log_project_idfk_1` FOREIGN KEY (`project_id`) REFERENCES `project_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_list`
--
ALTER TABLE `project_list`
  ADD CONSTRAINT `project_list_idfk_1` FOREIGN KEY (`manager`) REFERENCES `user_manager` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_list_idfk_2` FOREIGN KEY (`type`) REFERENCES `project_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_list_idfk_3` FOREIGN KEY (`debtor_id`) REFERENCES `user_debtor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_creditor`
--
ALTER TABLE `user_creditor`
  ADD CONSTRAINT `user_creditor_idfk_1` FOREIGN KEY (`project_id`) REFERENCES `project_list` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

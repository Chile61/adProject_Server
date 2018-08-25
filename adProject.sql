-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.13-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 guns 的数据库结构
DROP DATABASE IF EXISTS `guns`;
CREATE DATABASE IF NOT EXISTS `guns` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `guns`;

-- 导出  表 guns.sys_dept 结构
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  guns.sys_dept 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`id`, `num`, `pid`, `pids`, `simplename`, `fullname`, `tips`, `version`) VALUES
	(24, 1, 0, '[0],', '总公司', '总公司', '', NULL),
	(25, 2, 24, '[0],[24],', '开发部', '开发部', '', NULL),
	(26, 3, 24, '[0],[24],', '运营部', '运营部', '', NULL),
	(27, 4, 24, '[0],[24],', '战略部', '战略部', '', NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 guns.sys_dict 结构
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- 正在导出表  guns.sys_dict 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` (`id`, `num`, `pid`, `name`, `tips`) VALUES
	(16, 0, 0, '状态', NULL),
	(17, 1, 16, '启用', NULL),
	(18, 2, 16, '禁用', NULL),
	(29, 0, 0, '性别', NULL),
	(30, 1, 29, '男', NULL),
	(31, 2, 29, '女', NULL),
	(35, 0, 0, '账号状态', NULL),
	(36, 1, 35, '启用', NULL),
	(37, 2, 35, '冻结', NULL),
	(38, 3, 35, '已删除', NULL),
	(39, 0, 0, '店铺类别', NULL),
	(40, 1, 39, '精品家装', NULL),
	(41, 2, 39, '家用电器', NULL),
	(42, 3, 39, '智能设备', NULL),
	(43, 4, 39, '母婴健康', NULL),
	(44, 5, 39, '餐饮美食', NULL),
	(45, 0, 0, '广告类别', NULL),
	(46, 1, 45, '图片广告', NULL),
	(47, 2, 45, '文字公告', NULL),
	(55, 0, 0, '广告位置', NULL),
	(56, 1, 55, '首页滚动', NULL),
	(57, 2, 55, '首页图片一', NULL),
	(58, 3, 55, '首页图片二', NULL),
	(59, 4, 55, '首页图片三', NULL),
	(60, 5, 55, '首页公告', NULL),
	(61, 6, 55, '店铺分类顶部', NULL),
	(62, 0, 0, '文章类别', NULL),
	(63, 1, 62, '推荐', NULL),
	(64, 2, 62, '猎奇', NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;

-- 导出  表 guns.sys_expense 结构
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE IF NOT EXISTS `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报销表';

-- 正在导出表  guns.sys_expense 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_expense` DISABLE KEYS */;
INSERT INTO `sys_expense` (`id`, `money`, `desc`, `createtime`, `state`, `userid`, `processId`) VALUES
	(1, 33.00, '33', '2017-12-18 22:11:12', 3, 1, '2501');
/*!40000 ALTER TABLE `sys_expense` ENABLE KEYS */;

-- 导出  表 guns.sys_login_log 结构
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE IF NOT EXISTS `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- 正在导出表  guns.sys_login_log 的数据：~183 rows (大约)
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` (`id`, `logname`, `userid`, `createtime`, `succeed`, `message`, `ip`) VALUES
	(216, '登录失败日志', NULL, '2017-12-14 23:34:50', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1'),
	(217, '登录日志', 1, '2017-12-14 23:35:33', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(218, '登录日志', 1, '2017-12-18 22:10:12', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(219, '登录日志', 1, '2017-12-18 23:22:17', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(220, '退出日志', 1, '2017-12-18 23:36:15', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(221, '登录失败日志', NULL, '2017-12-18 23:36:18', '成功', '账号:manager,账号密码错误', '0:0:0:0:0:0:0:1'),
	(222, '登录日志', 46, '2017-12-18 23:36:21', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(223, '退出日志', 46, '2017-12-18 23:36:34', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(224, '登录日志', 1, '2017-12-18 23:36:38', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(225, '退出日志', 1, '2017-12-18 23:37:24', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(226, '登录日志', 1, '2017-12-18 23:37:27', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(227, '退出日志', 1, '2017-12-18 23:37:41', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(228, '登录日志', 45, '2017-12-18 23:37:44', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(229, '退出日志', 45, '2017-12-18 23:37:52', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(230, '登录日志', 46, '2017-12-18 23:37:58', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(231, '退出日志', 46, '2017-12-18 23:38:33', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(232, '登录日志', 1, '2017-12-18 23:38:37', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(233, '登录日志', 1, '2017-12-30 10:15:26', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(234, '登录日志', 1, '2017-12-30 10:30:12', '成功', NULL, '192.168.5.149'),
	(235, '登录日志', 1, '2017-12-30 11:01:29', '成功', NULL, '192.168.5.149'),
	(236, '登录日志', 1, '2017-12-30 14:58:02', '成功', NULL, '192.168.5.149'),
	(237, '登录日志', 1, '2018-01-04 22:05:29', '成功', NULL, '127.0.0.1'),
	(238, '登录日志', 1, '2018-01-06 09:19:04', '成功', NULL, '127.0.0.1'),
	(239, '登录失败日志', NULL, '2018-01-07 00:34:25', '成功', '账号:admin,账号密码错误', '127.0.0.1'),
	(240, '登录日志', 1, '2018-01-07 00:34:31', '成功', NULL, '127.0.0.1'),
	(241, '登录日志', 1, '2018-01-07 00:51:31', '成功', NULL, '127.0.0.1'),
	(242, '登录日志', 1, '2018-01-07 11:09:44', '成功', NULL, '127.0.0.1'),
	(243, '登录日志', 1, '2018-01-09 16:53:39', '成功', NULL, '127.0.0.1'),
	(244, '登录日志', 1, '2018-01-09 17:15:41', '成功', NULL, '127.0.0.1'),
	(245, '登录日志', 1, '2018-01-10 10:15:27', '成功', NULL, '127.0.0.1'),
	(246, '登录日志', 1, '2018-01-14 16:05:56', '成功', NULL, '192.168.5.149'),
	(247, '登录日志', 1, '2018-01-14 16:17:47', '成功', NULL, '192.168.5.149'),
	(248, '登录日志', 1, '2018-01-14 16:21:34', '成功', NULL, '192.168.5.149'),
	(249, '登录日志', 1, '2018-01-14 16:30:55', '成功', NULL, '192.168.5.149'),
	(250, '登录日志', 1, '2018-01-14 16:35:49', '成功', NULL, '192.168.5.149'),
	(251, '登录日志', 1, '2018-01-14 17:33:30', '成功', NULL, '192.168.5.149'),
	(252, '登录日志', 1, '2018-01-14 17:37:07', '成功', NULL, '192.168.5.149'),
	(253, '登录日志', 1, '2018-01-14 21:06:41', '成功', NULL, '192.168.5.149'),
	(254, '退出日志', 1, '2018-01-14 21:11:04', '成功', NULL, '192.168.5.149'),
	(255, '登录日志', 1, '2018-01-14 21:11:09', '成功', NULL, '192.168.5.149'),
	(256, '登录日志', 1, '2018-01-14 22:27:48', '成功', NULL, '192.168.5.149'),
	(257, '登录日志', 1, '2018-01-14 22:30:25', '成功', NULL, '192.168.5.149'),
	(258, '登录日志', 1, '2018-01-14 23:01:47', '成功', NULL, '192.168.5.149'),
	(259, '登录日志', 1, '2018-01-14 23:02:02', '成功', NULL, '192.168.5.149'),
	(260, '登录日志', 1, '2018-01-14 23:04:55', '成功', NULL, '192.168.5.149'),
	(261, '登录日志', 1, '2018-01-14 23:05:27', '成功', NULL, '192.168.5.149'),
	(262, '登录日志', 1, '2018-01-14 23:08:17', '成功', NULL, '192.168.5.149'),
	(263, '登录日志', 1, '2018-01-14 23:11:17', '成功', NULL, '192.168.5.149'),
	(264, '登录日志', 1, '2018-01-14 23:15:27', '成功', NULL, '192.168.5.149'),
	(265, '登录日志', 1, '2018-01-14 23:16:05', '成功', NULL, '192.168.5.149'),
	(266, '登录日志', 1, '2018-01-14 23:16:19', '成功', NULL, '192.168.5.149'),
	(267, '登录日志', 1, '2018-01-14 23:22:49', '成功', NULL, '192.168.5.149'),
	(268, '登录日志', 1, '2018-01-14 23:23:02', '成功', NULL, '192.168.5.149'),
	(269, '登录日志', 1, '2018-01-14 23:23:38', '成功', NULL, '192.168.5.149'),
	(270, '登录日志', 1, '2018-01-14 23:24:40', '成功', NULL, '192.168.5.149'),
	(271, '登录日志', 1, '2018-01-14 23:25:08', '成功', NULL, '192.168.5.149'),
	(272, '登录日志', 1, '2018-01-17 22:17:51', '成功', NULL, '192.168.5.151'),
	(273, '登录日志', 1, '2018-01-17 23:20:10', '成功', NULL, '192.168.5.151'),
	(274, '登录日志', 1, '2018-01-17 23:25:25', '成功', NULL, '192.168.5.151'),
	(275, '登录日志', 1, '2018-01-18 22:15:29', '成功', NULL, '192.168.5.151'),
	(276, '登录日志', 1, '2018-01-18 22:22:41', '成功', NULL, '192.168.5.151'),
	(277, '登录日志', 1, '2018-01-18 22:26:36', '成功', NULL, '192.168.5.151'),
	(278, '登录日志', 1, '2018-01-18 22:43:08', '成功', NULL, '192.168.5.151'),
	(279, '登录日志', 1, '2018-01-18 22:51:20', '成功', NULL, '192.168.5.151'),
	(280, '登录日志', 1, '2018-01-20 16:26:26', '成功', NULL, '127.0.0.1'),
	(281, '登录日志', 1, '2018-01-20 16:28:05', '成功', NULL, '192.168.5.151'),
	(282, '退出日志', 1, '2018-01-20 16:34:03', '成功', NULL, '127.0.0.1'),
	(283, '登录日志', 1, '2018-01-20 16:34:07', '成功', NULL, '127.0.0.1'),
	(284, '登录日志', 1, '2018-01-20 16:35:00', '成功', NULL, '127.0.0.1'),
	(285, '登录日志', 1, '2018-01-20 17:46:13', '成功', NULL, '127.0.0.1'),
	(286, '登录日志', 1, '2018-01-20 18:13:02', '成功', NULL, '192.168.5.151'),
	(287, '退出日志', 1, '2018-01-20 18:13:45', '成功', NULL, '192.168.5.151'),
	(288, '登录日志', 45, '2018-01-20 18:13:50', '成功', NULL, '192.168.5.151'),
	(289, '登录日志', 1, '2018-01-21 12:46:50', '成功', NULL, '127.0.0.1'),
	(290, '退出日志', 1, '2018-01-21 13:08:12', '成功', NULL, '127.0.0.1'),
	(291, '登录日志', 1, '2018-01-21 13:18:37', '成功', NULL, '127.0.0.1'),
	(292, '登录日志', 1, '2018-01-21 13:31:55', '成功', NULL, '127.0.0.1'),
	(293, '退出日志', 1, '2018-01-21 13:39:16', '成功', NULL, '127.0.0.1'),
	(294, '登录日志', 1, '2018-01-21 13:39:22', '成功', NULL, '127.0.0.1'),
	(295, '退出日志', 1, '2018-01-21 13:46:59', '成功', NULL, '127.0.0.1'),
	(296, '登录日志', 1, '2018-01-21 13:47:04', '成功', NULL, '127.0.0.1'),
	(297, '退出日志', 1, '2018-01-21 13:48:49', '成功', NULL, '127.0.0.1'),
	(298, '登录日志', 1, '2018-01-21 13:48:55', '成功', NULL, '127.0.0.1'),
	(299, '退出日志', 1, '2018-01-21 13:49:05', '成功', NULL, '127.0.0.1'),
	(300, '登录日志', 48, '2018-01-21 13:49:14', '成功', NULL, '127.0.0.1'),
	(301, '登录日志', 1, '2018-01-21 13:49:20', '成功', NULL, '127.0.0.1'),
	(302, '退出日志', 1, '2018-01-21 13:49:45', '成功', NULL, '127.0.0.1'),
	(303, '登录日志', 48, '2018-01-21 13:49:54', '成功', NULL, '127.0.0.1'),
	(304, '退出日志', 48, '2018-01-21 13:50:12', '成功', NULL, '127.0.0.1'),
	(305, '登录日志', 1, '2018-01-21 13:50:15', '成功', NULL, '127.0.0.1'),
	(306, '退出日志', 1, '2018-01-21 13:58:51', '成功', NULL, '127.0.0.1'),
	(307, '登录日志', 1, '2018-01-21 13:58:55', '成功', NULL, '127.0.0.1'),
	(308, '退出日志', 1, '2018-01-21 14:14:53', '成功', NULL, '127.0.0.1'),
	(309, '登录日志', 48, '2018-01-21 14:15:00', '成功', NULL, '127.0.0.1'),
	(310, '退出日志', 48, '2018-01-21 14:15:24', '成功', NULL, '127.0.0.1'),
	(311, '登录日志', 1, '2018-01-21 14:15:28', '成功', NULL, '127.0.0.1'),
	(312, '登录日志', 1, '2018-01-21 14:21:25', '成功', NULL, '127.0.0.1'),
	(313, '登录日志', 1, '2018-01-21 14:23:41', '成功', NULL, '127.0.0.1'),
	(314, '登录日志', 1, '2018-01-21 22:56:24', '成功', NULL, '127.0.0.1'),
	(315, '登录失败日志', NULL, '2018-01-24 16:10:22', '成功', '账号:admin,账号密码错误', '127.0.0.1'),
	(316, '登录日志', 1, '2018-01-24 16:10:26', '成功', NULL, '127.0.0.1'),
	(317, '登录日志', 1, '2018-01-24 16:56:59', '成功', NULL, '127.0.0.1'),
	(318, '登录日志', 1, '2018-01-27 15:08:08', '成功', NULL, '127.0.0.1'),
	(319, '退出日志', 1, '2018-01-27 15:15:25', '成功', NULL, '127.0.0.1'),
	(320, '登录日志', 1, '2018-01-27 15:15:32', '成功', NULL, '127.0.0.1'),
	(321, '退出日志', 1, '2018-01-27 15:16:52', '成功', NULL, '127.0.0.1'),
	(322, '登录日志', 1, '2018-01-27 15:16:57', '成功', NULL, '127.0.0.1'),
	(323, '登录日志', 1, '2018-01-27 16:07:46', '成功', NULL, '127.0.0.1'),
	(324, '登录日志', 1, '2018-01-27 16:36:04', '成功', NULL, '127.0.0.1'),
	(325, '登录日志', 1, '2018-01-27 16:40:07', '成功', NULL, '127.0.0.1'),
	(326, '登录日志', 1, '2018-01-28 14:25:11', '成功', NULL, '127.0.0.1'),
	(327, '登录日志', 1, '2018-01-28 14:39:52', '成功', NULL, '127.0.0.1'),
	(328, '登录日志', 1, '2018-01-28 14:40:56', '成功', NULL, '127.0.0.1'),
	(329, '登录日志', 1, '2018-01-28 15:28:42', '成功', NULL, '127.0.0.1'),
	(330, '登录日志', 1, '2018-01-28 15:35:28', '成功', NULL, '127.0.0.1'),
	(331, '登录日志', 1, '2018-01-28 15:40:55', '成功', NULL, '127.0.0.1'),
	(332, '登录日志', 1, '2018-01-28 15:44:39', '成功', NULL, '127.0.0.1'),
	(333, '登录日志', 1, '2018-01-28 15:47:01', '成功', NULL, '127.0.0.1'),
	(334, '登录日志', 1, '2018-01-28 15:52:26', '成功', NULL, '127.0.0.1'),
	(335, '登录日志', 1, '2018-01-28 15:53:16', '成功', NULL, '127.0.0.1'),
	(336, '登录日志', 1, '2018-01-28 15:55:26', '成功', NULL, '127.0.0.1'),
	(337, '登录日志', 1, '2018-01-28 16:00:30', '成功', NULL, '127.0.0.1'),
	(338, '登录日志', 1, '2018-01-28 16:03:16', '成功', NULL, '127.0.0.1'),
	(339, '登录日志', 1, '2018-01-28 16:05:44', '成功', NULL, '127.0.0.1'),
	(340, '登录日志', 1, '2018-01-28 16:11:57', '成功', NULL, '127.0.0.1'),
	(341, '登录日志', 1, '2018-01-28 16:15:32', '成功', NULL, '127.0.0.1'),
	(342, '登录日志', 1, '2018-01-28 16:21:12', '成功', NULL, '127.0.0.1'),
	(343, '登录日志', 1, '2018-01-28 16:22:16', '成功', NULL, '127.0.0.1'),
	(344, '登录日志', 1, '2018-01-28 16:26:16', '成功', NULL, '127.0.0.1'),
	(345, '登录日志', 1, '2018-01-28 16:31:34', '成功', NULL, '127.0.0.1'),
	(346, '登录日志', 1, '2018-01-28 16:34:37', '成功', NULL, '127.0.0.1'),
	(347, '登录日志', 1, '2018-01-28 16:37:10', '成功', NULL, '127.0.0.1'),
	(348, '登录日志', 1, '2018-01-28 16:45:05', '成功', NULL, '127.0.0.1'),
	(349, '登录日志', 1, '2018-01-28 16:57:36', '成功', NULL, '127.0.0.1'),
	(350, '登录日志', 1, '2018-01-28 16:59:24', '成功', NULL, '127.0.0.1'),
	(351, '登录日志', 1, '2018-01-28 17:02:14', '成功', NULL, '127.0.0.1'),
	(352, '登录日志', 1, '2018-01-28 18:23:40', '成功', NULL, '127.0.0.1'),
	(353, '登录日志', 1, '2018-01-28 18:25:50', '成功', NULL, '127.0.0.1'),
	(354, '登录日志', 1, '2018-01-28 18:31:06', '成功', NULL, '127.0.0.1'),
	(355, '登录日志', 1, '2018-01-28 18:37:13', '成功', NULL, '127.0.0.1'),
	(356, '登录日志', 1, '2018-01-28 19:06:31', '成功', NULL, '127.0.0.1'),
	(357, '登录日志', 1, '2018-01-28 19:33:18', '成功', NULL, '127.0.0.1'),
	(358, '登录日志', 1, '2018-01-28 21:04:36', '成功', NULL, '127.0.0.1'),
	(359, '登录日志', 1, '2018-01-28 21:21:31', '成功', NULL, '127.0.0.1'),
	(360, '登录日志', 1, '2018-01-28 21:25:26', '成功', NULL, '127.0.0.1'),
	(361, '登录日志', 1, '2018-01-28 21:26:56', '成功', NULL, '127.0.0.1'),
	(362, '登录日志', 1, '2018-01-28 21:27:54', '成功', NULL, '127.0.0.1'),
	(363, '登录日志', 1, '2018-01-28 21:30:09', '成功', NULL, '127.0.0.1'),
	(364, '登录日志', 1, '2018-01-28 22:04:18', '成功', NULL, '127.0.0.1'),
	(365, '登录日志', 1, '2018-01-28 22:12:57', '成功', NULL, '127.0.0.1'),
	(366, '登录日志', 1, '2018-01-28 22:18:10', '成功', NULL, '127.0.0.1'),
	(367, '登录日志', 1, '2018-01-28 22:18:33', '成功', NULL, '127.0.0.1'),
	(368, '登录日志', 1, '2018-01-28 22:20:45', '成功', NULL, '127.0.0.1'),
	(369, '登录日志', 1, '2018-01-28 22:23:10', '成功', NULL, '127.0.0.1'),
	(370, '登录日志', 1, '2018-01-28 22:25:59', '成功', NULL, '127.0.0.1'),
	(371, '登录日志', 1, '2018-01-28 22:27:11', '成功', NULL, '127.0.0.1'),
	(372, '登录日志', 1, '2018-01-28 22:28:03', '成功', NULL, '127.0.0.1'),
	(373, '登录日志', 1, '2018-01-28 22:29:33', '成功', NULL, '127.0.0.1'),
	(374, '登录日志', 1, '2018-01-28 22:36:22', '成功', NULL, '127.0.0.1'),
	(375, '登录日志', 1, '2018-01-28 22:50:42', '成功', NULL, '127.0.0.1'),
	(376, '登录日志', 1, '2018-01-28 22:51:11', '成功', NULL, '127.0.0.1'),
	(377, '登录日志', 1, '2018-01-28 22:52:01', '成功', NULL, '127.0.0.1'),
	(378, '登录日志', 1, '2018-01-28 22:53:42', '成功', NULL, '127.0.0.1'),
	(379, '登录日志', 1, '2018-01-28 23:07:31', '成功', NULL, '127.0.0.1'),
	(380, '登录日志', 1, '2018-01-28 23:12:55', '成功', NULL, '127.0.0.1'),
	(381, '登录日志', 1, '2018-01-28 23:19:48', '成功', NULL, '127.0.0.1'),
	(382, '登录日志', 1, '2018-01-28 23:32:02', '成功', NULL, '127.0.0.1'),
	(383, '登录日志', 1, '2018-01-28 23:33:56', '成功', NULL, '127.0.0.1'),
	(384, '登录日志', 1, '2018-01-28 23:39:39', '成功', NULL, '127.0.0.1'),
	(385, '登录日志', 1, '2018-01-28 23:42:56', '成功', NULL, '127.0.0.1'),
	(386, '登录日志', 1, '2018-01-28 23:44:22', '成功', NULL, '127.0.0.1'),
	(387, '登录日志', 1, '2018-01-28 23:46:23', '成功', NULL, '127.0.0.1'),
	(388, '登录日志', 1, '2018-01-28 23:57:11', '成功', NULL, '127.0.0.1'),
	(389, '登录日志', 1, '2018-01-29 00:00:17', '成功', NULL, '127.0.0.1'),
	(390, '登录日志', 1, '2018-01-29 00:02:02', '成功', NULL, '127.0.0.1'),
	(391, '登录日志', 1, '2018-01-29 00:04:29', '成功', NULL, '127.0.0.1'),
	(392, '登录日志', 1, '2018-01-29 00:07:53', '成功', NULL, '127.0.0.1'),
	(393, '登录日志', 1, '2018-01-29 00:11:08', '成功', NULL, '127.0.0.1'),
	(394, '登录日志', 1, '2018-01-29 00:12:18', '成功', NULL, '127.0.0.1'),
	(395, '登录日志', 1, '2018-01-29 00:13:45', '成功', NULL, '127.0.0.1'),
	(396, '登录日志', 1, '2018-01-29 00:14:48', '成功', NULL, '127.0.0.1'),
	(397, '登录日志', 1, '2018-01-29 00:20:51', '成功', NULL, '127.0.0.1'),
	(398, '登录日志', 1, '2018-01-29 00:25:36', '成功', NULL, '127.0.0.1'),
	(399, '登录日志', 1, '2018-01-30 20:54:30', '成功', NULL, '127.0.0.1'),
	(400, '登录日志', 1, '2018-01-30 21:54:29', '成功', NULL, '127.0.0.1'),
	(401, '登录日志', 1, '2018-01-31 11:15:25', '成功', NULL, '127.0.0.1'),
	(402, '登录日志', 1, '2018-01-31 14:48:24', '成功', NULL, '127.0.0.1'),
	(403, '登录日志', 1, '2018-02-02 16:58:19', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(404, '登录日志', 1, '2018-02-02 16:58:20', '成功', NULL, '0:0:0:0:0:0:0:1'),
	(405, '登录日志', 1, '2018-02-13 22:41:24', '成功', NULL, '127.0.0.1');
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;

-- 导出  表 guns.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- 正在导出表  guns.sys_menu 的数据：~90 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `code`, `pcode`, `pcodes`, `name`, `icon`, `url`, `num`, `levels`, `ismenu`, `tips`, `status`, `isopen`) VALUES
	(105, 'system', '0', '[0],', '系统管理', 'fa-user', '#', 4, 1, 1, NULL, 1, 1),
	(106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 1, 2, 1, NULL, 1, 0),
	(107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 0, NULL, 1, 0),
	(108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 0, NULL, 1, 0),
	(109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 0, NULL, 1, 0),
	(110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 0, NULL, 1, 0),
	(111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 0, NULL, 1, 0),
	(112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 0, NULL, 1, 0),
	(113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 0, NULL, 1, 0),
	(114, 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', 2, 2, 1, NULL, 1, 0),
	(115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 0, NULL, 1, 0),
	(116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 0, NULL, 1, 0),
	(117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 0, NULL, 1, 0),
	(118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 0, NULL, 1, 0),
	(119, 'menu', 'system', '[0],[system],', '菜单管理', NULL, '/menu', 4, 2, 1, NULL, 1, 0),
	(120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 0, NULL, 1, 0),
	(121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 0, NULL, 1, 0),
	(122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 0, NULL, 1, 0),
	(128, 'log', 'system', '[0],[system],', '业务日志', NULL, '/log', 6, 2, 1, NULL, 1, 0),
	(130, 'druid', 'system', '[0],[system],', '监控管理', NULL, '/druid', 7, 2, 1, NULL, 1, NULL),
	(131, 'dept', 'system', '[0],[system],', '部门管理', NULL, '/dept', 3, 2, 1, NULL, 1, NULL),
	(132, 'dict', 'system', '[0],[system],', '字典管理', NULL, '/dict', 4, 2, 1, NULL, 1, NULL),
	(133, 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', 6, 2, 1, NULL, 1, NULL),
	(134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 0, NULL, 1, NULL),
	(135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 0, NULL, 1, NULL),
	(136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 0, NULL, 1, NULL),
	(137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 0, NULL, 1, NULL),
	(138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dict/add', 1, 3, 0, NULL, 1, NULL),
	(139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dict/update', 1, 3, 0, NULL, 1, NULL),
	(140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dict/delete', 1, 3, 0, NULL, 1, NULL),
	(141, 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', 9, 2, 1, NULL, 1, NULL),
	(142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 0, NULL, 1, NULL),
	(143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 0, NULL, 1, NULL),
	(144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 0, NULL, 1, NULL),
	(145, 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', 1, 1, 1, NULL, 1, NULL),
	(148, 'code', '0', '[0],', '代码生成', 'fa-code', '/code', 3, 1, 1, NULL, 1, NULL),
	(149, 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', 2, 1, 1, NULL, 1, NULL),
	(150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 0, NULL, 1, NULL),
	(151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 0, NULL, 1, NULL),
	(152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 0, NULL, 1, NULL),
	(153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 0, NULL, 1, NULL),
	(154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 0, NULL, 1, NULL),
	(155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 0, NULL, 1, NULL),
	(156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 0, NULL, 1, NULL),
	(157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 0, NULL, 1, NULL),
	(158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 0, NULL, 1, NULL),
	(159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 0, NULL, 1, NULL),
	(160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 0, NULL, 1, NULL),
	(161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 0, NULL, 1, NULL),
	(162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 0, NULL, 1, NULL),
	(163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 0, NULL, 1, NULL),
	(164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 0, NULL, 1, NULL),
	(165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 0, NULL, 1, NULL),
	(166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 0, NULL, 1, NULL),
	(167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 0, NULL, 1, NULL),
	(168, 'expense', '0', '[0],', '报销管理', 'fa-clone', '#', 5, 1, 1, NULL, 1, NULL),
	(169, 'expense_fill', 'expense', '[0],[expense],', '报销申请', '', '/expense', 1, 2, 1, NULL, 1, NULL),
	(170, 'expense_progress', 'expense', '[0],[expense],', '报销审批', '', '/process', 2, 2, 1, NULL, 1, NULL),
	(171, 'zy_system', '0', '[0],', '中盈创世系统管理', '', '#', 1000, 1, 1, NULL, 1, NULL),
	(172, 'zy_ad', 'zy_system', '[0],[zy_system],', '广告管理', '', '/ad', 1001, 2, 1, NULL, 1, NULL),
	(173, 'zy_article', 'zy_system', '[0],[zy_system],', '文章管理', '', '/article', 1002, 2, 1, NULL, 1, NULL),
	(174, 'zy_mgr', 'zy_system', '[0],[zy_system],', '用户管理', '', '/tUser', 1003, 2, 1, NULL, 1, NULL),
	(175, 'zy_shop', 'zy_system', '[0],[zy_system],', '店铺管理', '', '/shop', 1004, 2, 1, NULL, 1, NULL),
	(176, 'zy_order', 'zy_system', '[0],[zy_system],', '订单管理', '', '/order', 1005, 2, 1, NULL, 1, NULL),
	(177, 'zy_mgr_update', 'zy_mgr', '[0],[zy_system],[zy_mgr],', '修改', '', '/tUser/update', 10031, 3, 0, NULL, 1, NULL),
	(178, 'zy_mgr_delete', 'zy_mgr', '[0],[zy_system],[zy_mgr],', '删除', '', '/tUser/delete', 10032, 3, 0, NULL, 1, NULL),
	(179, 'zy_shop_update', 'zy_shop', '[0],[zy_system],[zy_shop],', '修改', '', '/shop/update', 10041, 3, 0, NULL, 1, NULL),
	(180, 'zy_shop_delete', 'zy_shop', '[0],[zy_system],[zy_shop],', '删除', '', '/shop/delete', 10042, 3, 0, NULL, 1, NULL),
	(181, 'zy_order_update', 'zy_order', '[0],[zy_system],[zy_order],', '修改', '', '/order/update', 10051, 3, 0, NULL, 1, NULL),
	(182, 'zy_order_delete', 'zy_order', '[0],[zy_system],[zy_order],', '删除', '', '/order/delete', 10052, 3, 0, NULL, 1, NULL),
	(183, 'zy_ad_add', 'zy_ad', '[0],[zy_system],[zy_ad],', '添加', '', '/ad/add', 10011, 3, 0, NULL, 1, NULL),
	(184, 'zy_ad_update', 'zy_ad', '[0],[zy_system],[zy_ad],', '修改', '', '/ad/update', 10012, 3, 0, NULL, 1, NULL),
	(185, 'zy_ad_delete', 'zy_ad', '[0],[zy_system],[zy_ad],', '删除', '', '/ad/delete', 10013, 3, 0, NULL, 1, NULL),
	(186, 'zy_article_add', 'zy_article', '[0],[zy_system],[zy_article],', '添加', '', '/article/add', 10021, 3, 0, NULL, 1, NULL),
	(187, 'zy_article_update', 'zy_article', '[0],[zy_system],[zy_article],', '修改', '', '/article/update', 10022, 3, 0, NULL, 1, NULL),
	(188, 'zy_article_delete', 'zy_article', '[0],[zy_system],[zy_article],', '删除', '', '/article/delete', 10023, 3, 0, NULL, 1, NULL),
	(189, 'zy_point_mg', 'zy_system', '[0],[zy_system],', '积分管理', '', '#', 1006, 2, 1, NULL, 1, NULL),
	(190, 'zy_point_cloud', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '云积分流水日志', '', '/cloudPointsAccountJournal', 10061, 3, 1, NULL, 1, NULL),
	(191, 'zy_point_conversionLog', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分转换日志', '', '/conversionLog', 10062, 3, 1, NULL, 1, NULL),
	(192, 'zy_point_conversionSumLog', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分转换日志汇总', '', '/conversionSumLog', 10063, 3, 1, NULL, 1, NULL),
	(193, 'zy_point_param', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分系统参数设置', '', '/param', 10064, 3, 1, NULL, 1, NULL),
	(194, 'zy_point_shoppingPointsAccountJournal', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '购物积分流水日志', '', '/shoppingPointsAccountJournal', 10065, 3, 1, NULL, 1, NULL),
	(195, 'zy_point_pointsAccountJournal', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分流水日志', '', '/pointsAccountJournal', 10066, 3, 1, NULL, 1, NULL),
	(196, 'zy_point_start', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '启动每日积分转换任务', '', '/dailyConversion/createConversionJob', 100641, 4, 0, NULL, 1, NULL),
	(197, 'zy_point_pause', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '暂停每日积分转换', '', '/dailyConversion/pauseConversionJob', 100642, 4, 0, NULL, 1, NULL),
	(198, 'zy_points_resumeConversionJob', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '恢复每日积分转换', '', '/dailyConversion/resumeConversionJob', 100643, 4, 0, NULL, 1, NULL),
	(199, 'zy_point_param_update', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '修改', '', '/param/update', 100644, 4, 0, NULL, 1, NULL),
	(200, 'zy_mgp', 'zy_system', '[0],[zy_system],', '商品管理', '', '#', 1007, 2, 1, NULL, 1, NULL),
	(201, 'zy_mgp_product', 'zy_mgp', '[0],[zy_system],[zy_mgp],', '商品目录', '', '/product', 10071, 3, 1, NULL, 1, NULL),
	(202, 'zy_mgp_productCategory', 'zy_mgp', '[0],[zy_system],[zy_mgp],', '商品类别', '', '/productCategory', 10072, 3, 1, NULL, 1, NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 guns.sys_notice 结构
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE IF NOT EXISTS `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- 正在导出表  guns.sys_notice 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `createtime`, `creater`) VALUES
	(6, '世界', 10, '欢迎使用Guns管理系统', '2017-01-11 08:53:20', 1),
	(8, '你好', NULL, '你好', '2017-05-10 19:28:57', 1);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;

-- 导出  表 guns.sys_operation_log 结构
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE IF NOT EXISTS `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- 正在导出表  guns.sys_operation_log 的数据：~76 rows (大约)
/*!40000 ALTER TABLE `sys_operation_log` DISABLE KEYS */;
INSERT INTO `sys_operation_log` (`id`, `logtype`, `logname`, `userid`, `classname`, `method`, `createtime`, `succeed`, `message`) VALUES
	(1, '业务日志', '添加管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'add', '2017-12-30 11:23:07', '成功', '账号=test'),
	(2, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-06 09:21:45', '成功', '字典名称=店铺类别,字典内容=1:精品家装;2:家用电器;3:智能设备;4:母婴健康;5:餐饮美食;'),
	(3, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-10 10:56:33', '成功', '字典名称=广告类别,字典内容=1:图片广告;2:文字公告;'),
	(4, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-10 11:00:19', '成功', '字典名称=广告位置,字典内容=1:首页滚动;2:首页图片一;3:首页图片二;4:首页图片三;5:首页公告;5:店铺分类顶部;'),
	(5, '业务日志', '修改字典', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'update', '2018-01-10 11:00:29', '成功', '字典名称=广告位置,字典内容=1:首页滚动;2:首页图片一;3:首页图片二;4:首页图片三;5:首页公告;6:店铺分类顶部;;;;'),
	(6, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:03:54', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTb9adce72.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(7, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:04:29', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor124.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTb9adce72.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(8, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:04:41', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor124.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTb9adce72.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(9, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:05:58', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTT97948641.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(10, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:06:18', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTT97948641.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(11, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:17:52', '失败', 'java.lang.ClassCastException: java.math.BigDecimal cannot be cast to java.lang.Float\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:67)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfea556df.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(12, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:20:27', '失败', 'java.lang.ClassCastException: java.math.BigDecimal cannot be cast to java.lang.Float\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:67)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfea556df.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(13, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:31:31', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n### The error may involve com.stylefeng.guns.modular.zy.dao.ZyPointDao.updateBatchUser-Inline\n### The error occurred while setting parameters\n### SQL: update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 1    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 45    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 46    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 47\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:231)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:73)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\n	at com.sun.proxy.TProxy89.update(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:294)\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\n	at com.sun.proxy.TProxy124.updateBatchUser(Unknown Source)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:86)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfbab4dfd.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\nCaused by: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:422)\n	at com.mysql.jdbc.Util.handleNewInstance(Util.java:404)\n	at com.mysql.jdbc.Util.getInstance(Util.java:387)\n	at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:939)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3878)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3814)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2478)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2625)\n	at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2551)\n	at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:1861)\n	at com.mysql.jdbc.PreparedStatement.execute(PreparedStatement.java:1192)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2931)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:131)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:493)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.TProxy138.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:46)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at org.apache.ibatis.executor.CachingExecutor.update(CachingExecutor.java:76)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\n	... 98 more\n'),
	(14, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:34:09', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n### The error may involve com.stylefeng.guns.modular.zy.dao.ZyPointDao.updateBatchUser-Inline\n### The error occurred while setting parameters\n### SQL: update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 1    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 45    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 46    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 47\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:231)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:73)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\n	at com.sun.proxy.TProxy89.update(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:294)\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\n	at com.sun.proxy.TProxy124.updateBatchUser(Unknown Source)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:86)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfbab4dfd.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\nCaused by: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:422)\n	at com.mysql.jdbc.Util.handleNewInstance(Util.java:404)\n	at com.mysql.jdbc.Util.getInstance(Util.java:387)\n	at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:939)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3878)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3814)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2478)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2625)\n	at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2551)\n	at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:1861)\n	at com.mysql.jdbc.PreparedStatement.execute(PreparedStatement.java:1192)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2931)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:131)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:493)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.TProxy138.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:46)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at org.apache.ibatis.executor.CachingExecutor.update(CachingExecutor.java:76)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\n	... 98 more\n'),
	(15, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-14 21:11:02', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档'),
	(16, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-20 16:28:25', '成功', '账号=admin;;;字段名称:头像,旧值:girl.gif,新值:9db001c4-3087-4639-ad4d-4780b3e2c68c.jpg'),
	(17, '业务日志', '重置管理员密码', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'reset', '2018-01-20 18:13:43', '成功', '账号=boss'),
	(18, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:02:03', '成功', '菜单名称=中盈创世系统管理'),
	(19, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:02:53', '成功', '菜单名称=广告管理'),
	(20, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:03:49', '成功', '菜单名称=文章管理'),
	(21, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:05:06', '成功', '菜单名称=用户管理'),
	(22, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:06:04', '成功', '菜单名称=店铺管理'),
	(23, '异常日志', '', 1, NULL, NULL, '2018-01-21 13:07:30', '失败', 'com.stylefeng.guns.core.exception.GunsException: 菜单编号重复，不能添加\n	at com.stylefeng.guns.modular.system.controller.MenuController.add(MenuController.java:147)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTFastClassBySpringCGLIBTT27b62c1b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor150.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:60)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:45)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTEnhancerBySpringCGLIBTT6348673a.add(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(24, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:07:42', '成功', '菜单名称=订单管理'),
	(25, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:07:55', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,文章管理,用户管理,店铺管理,订单管理'),
	(26, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:38:25', '成功', '菜单名称=修改'),
	(27, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:39:15', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,文章管理,用户管理,修改,店铺管理,订单管理'),
	(28, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:42:30', '成功', '菜单名称=删除'),
	(29, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:43:55', '成功', '菜单名称=修改'),
	(30, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:44:43', '成功', '菜单名称=删除'),
	(31, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:46:21', '成功', '菜单名称=修改'),
	(32, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:46:57', '成功', '菜单名称=删除'),
	(33, '业务日志', '添加角色', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'add', '2018-01-21 13:47:41', '成功', '角色名称=中盈系统管理员'),
	(34, '业务日志', '添加管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'add', '2018-01-21 13:48:16', '成功', '账号=zysystem'),
	(35, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:48:33', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(36, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:48:47', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(37, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:49:33', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(38, '业务日志', '分配角色', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2018-01-21 13:49:44', '成功', '账号=zysystem,角色名称集合=中盈系统管理员'),
	(39, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:50:31', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(40, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:51:29', '成功', '菜单名称=添加'),
	(41, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:52:08', '成功', '菜单名称=修改'),
	(42, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:52:47', '成功', '菜单名称=删除'),
	(43, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:53:30', '成功', '菜单名称=添加'),
	(44, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:54:01', '成功', '菜单名称=修改'),
	(45, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:54:28', '成功', '菜单名称=删除'),
	(46, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:54:42', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(47, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:54:55', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(48, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:57:18', '成功', '菜单名称=积分管理'),
	(49, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:58:38', '成功', '菜单名称=云积分流水日志'),
	(50, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:58:49', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志'),
	(51, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:01:59', '成功', '菜单名称=积分转换日志'),
	(52, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:03:22', '成功', '菜单名称=积分转换日志汇总'),
	(53, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:05:17', '成功', '菜单名称=积分系统参数设置'),
	(54, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:06:36', '成功', '菜单名称=购物积分流水日志'),
	(55, '业务日志', '修改菜单', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-01-21 14:07:22', '成功', '菜单名称=积分转换日志汇总;;;字段名称:菜单编号,旧值:zy_points_conversionSumLog,新值:zy_point_conversionSumLog'),
	(56, '异常日志', '', 1, NULL, NULL, '2018-01-21 14:09:04', '失败', 'com.stylefeng.guns.core.exception.GunsException: 菜单编号重复，不能添加\n	at com.stylefeng.guns.modular.system.controller.MenuController.add(MenuController.java:147)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTFastClassBySpringCGLIBTT27b62c1b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor146.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:60)\n	at sun.reflect.GeneratedMethodAccessor240.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:45)\n	at sun.reflect.GeneratedMethodAccessor303.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTEnhancerBySpringCGLIBTT759bb2fc.add(<generated>)\n	at sun.reflect.GeneratedMethodAccessor332.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(57, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:09:17', '成功', '菜单名称=积分流水日志'),
	(58, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:12:37', '成功', '菜单名称=启动每日积分转换任务'),
	(59, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:13:34', '成功', '菜单名称=暂停每日积分转换'),
	(60, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:14:36', '成功', '菜单名称=恢复每日积分转换'),
	(61, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:14:46', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,购物积分流水日志,积分流水日志'),
	(62, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:14:51', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,购物积分流水日志,积分流水日志'),
	(63, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:15:38', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,购物积分流水日志,积分流水日志'),
	(64, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-24 16:59:42', '成功', '字典名称=文章类别,字典内容=1:推荐;2:猎奇;'),
	(65, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-27 15:16:19', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志,商品管理,商品目录,商品类别'),
	(66, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-27 15:16:28', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志,商品管理,商品目录,商品类别'),
	(67, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-27 15:16:38', '成功', '账号=admin;;;字段名称:部门名称,旧值:战略部,新值:总公司'),
	(68, '业务日志', '删除管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'delete', '2018-01-27 15:16:45', '成功', '账号=test'),
	(69, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-28 18:23:53', '成功', '账号=admin;;;字段名称:头像,旧值:9db001c4-3087-4639-ad4d-4780b3e2c68c.jpg,新值:dbf385d7-c48c-436b-bb39-d47a7ddd2743.jpg'),
	(70, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-28 18:24:08', '成功', '账号=admin;;;字段名称:头像,旧值:9db001c4-3087-4639-ad4d-4780b3e2c68c.jpg,新值:dbf385d7-c48c-436b-bb39-d47a7ddd2743.jpg'),
	(71, '异常日志', '', 1, NULL, NULL, '2018-01-28 18:26:03', '失败', 'com.stylefeng.guns.core.exception.GunsException: 上传图片出错\n	at com.stylefeng.guns.modular.system.controller.UserMgrController.upload(UserMgrController.java:353)\n	at com.stylefeng.guns.modular.system.controller.UserMgrControllerTTFastClassBySpringCGLIBTT87f11409.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.UserMgrControllerTTEnhancerBySpringCGLIBTTe3286c05.upload(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(72, '异常日志', '', 1, NULL, NULL, '2018-01-28 18:30:26', '失败', 'com.stylefeng.guns.core.exception.GunsException: 上传图片出错\n	at com.stylefeng.guns.modular.system.controller.UserMgrController.upload(UserMgrController.java:353)\n	at com.stylefeng.guns.modular.system.controller.UserMgrControllerTTFastClassBySpringCGLIBTT87f11409.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.UserMgrControllerTTEnhancerBySpringCGLIBTTe3286c05.upload(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(73, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-28 18:37:48', '成功', '账号=admin;;;'),
	(74, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-28 19:06:40', '成功', '账号=admin;;;字段名称:头像,旧值:dbf385d7-c48c-436b-bb39-d47a7ddd2743.jpg,新值:ddcbb086-ccde-409c-b7f0-9638d496687a.jpg'),
	(75, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-28 19:33:27', '成功', '账号=admin;;;字段名称:头像,旧值:ddcbb086-ccde-409c-b7f0-9638d496687a.jpg,新值:44b5a25a-bb6f-47ff-aecf-0fd5a636cbbc.jpg'),
	(76, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-28 19:42:02', '成功', '账号=admin;;;字段名称:头像,旧值:44b5a25a-bb6f-47ff-aecf-0fd5a636cbbc.jpg,新值:872fcd79-fb92-403a-8931-2a3349dbca4f.jpg'),
	(77, '异常日志', '', 1, NULL, NULL, '2018-01-30 20:55:41', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'\r\n### The error may exist in com/stylefeng/guns/common/persistence/dao/ShopMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id AS id,`name`,`type`,description,userid,QRcode,category,brand,logo,license,`state`  FROM t_shop\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:231)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:73)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy90.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:230)\r\n	at org.apache.ibatis.binding.MapperMethod.executeForMany(MapperMethod.java:137)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:75)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy139.selectList(Unknown Source)\r\n	at com.baomidou.mybatisplus.service.impl.ServiceImpl.selectList(ServiceImpl.java:362)\r\n	at com.baomidou.mybatisplus.service.impl.ServiceImplTTFastClassBySpringCGLIBTT3e2398a4.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\r\n	at com.stylefeng.guns.modular.zy.service.impl.ShopServiceImplTTEnhancerBySpringCGLIBTT36c12dc3.selectList(<generated>)\r\n	at com.stylefeng.guns.modular.zy.controller.ShopController.list(ShopController.java:63)\r\n	at com.stylefeng.guns.modular.zy.controller.ShopControllerTTFastClassBySpringCGLIBTTa2969882.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\r\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\r\n	at sun.reflect.GeneratedMethodAccessor137.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\r\n	at com.stylefeng.guns.modular.zy.controller.ShopControllerTTEnhancerBySpringCGLIBTTabeda075.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'\r\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\r\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\r\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)\r\n	at com.mysql.jdbc.Util.handleNewInstance(Util.java:404)\r\n	at com.mysql.jdbc.Util.getInstance(Util.java:387)\r\n	at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:939)\r\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3878)\r\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3814)\r\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2478)\r\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2625)\r\n	at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2551)\r\n	at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:1861)\r\n	at com.mysql.jdbc.PreparedStatement.execute(PreparedStatement.java:1192)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2931)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:131)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:493)\r\n	at sun.reflect.GeneratedMethodAccessor117.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\r\n	at com.sun.proxy.TProxy155.execute(Unknown Source)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:63)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\r\n	at sun.reflect.GeneratedMethodAccessor115.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy153.query(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor115.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy153.query(Unknown Source)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:63)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:324)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:109)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:83)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)\r\n	at sun.reflect.GeneratedMethodAccessor134.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 107 more\r\n');
/*!40000 ALTER TABLE `sys_operation_log` ENABLE KEYS */;

-- 导出  表 guns.sys_param 结构
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE IF NOT EXISTS `sys_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `firstcommission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '一级提成',
  `secondcommission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '二级提成',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- 正在导出表  guns.sys_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_param` ENABLE KEYS */;

-- 导出  表 guns.sys_relation 结构
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE IF NOT EXISTS `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4449 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- 正在导出表  guns.sys_relation 的数据：~140 rows (大约)
/*!40000 ALTER TABLE `sys_relation` DISABLE KEYS */;
INSERT INTO `sys_relation` (`id`, `menuid`, `roleid`) VALUES
	(3377, 105, 5),
	(3378, 106, 5),
	(3379, 107, 5),
	(3380, 108, 5),
	(3381, 109, 5),
	(3382, 110, 5),
	(3383, 111, 5),
	(3384, 112, 5),
	(3385, 113, 5),
	(3386, 114, 5),
	(3387, 115, 5),
	(3388, 116, 5),
	(3389, 117, 5),
	(3390, 118, 5),
	(3391, 119, 5),
	(3392, 120, 5),
	(3393, 121, 5),
	(3394, 122, 5),
	(3395, 150, 5),
	(3396, 151, 5),
	(4329, 145, 6),
	(4330, 171, 6),
	(4331, 172, 6),
	(4332, 183, 6),
	(4333, 184, 6),
	(4334, 185, 6),
	(4335, 173, 6),
	(4336, 186, 6),
	(4337, 187, 6),
	(4338, 188, 6),
	(4339, 174, 6),
	(4340, 177, 6),
	(4341, 178, 6),
	(4342, 175, 6),
	(4343, 179, 6),
	(4344, 180, 6),
	(4345, 176, 6),
	(4346, 181, 6),
	(4347, 182, 6),
	(4348, 189, 6),
	(4349, 190, 6),
	(4350, 191, 6),
	(4351, 192, 6),
	(4352, 193, 6),
	(4353, 196, 6),
	(4354, 197, 6),
	(4355, 198, 6),
	(4356, 199, 6),
	(4357, 194, 6),
	(4358, 195, 6),
	(4359, 200, 6),
	(4360, 201, 6),
	(4361, 202, 6),
	(4362, 105, 1),
	(4363, 106, 1),
	(4364, 107, 1),
	(4365, 108, 1),
	(4366, 109, 1),
	(4367, 110, 1),
	(4368, 111, 1),
	(4369, 112, 1),
	(4370, 113, 1),
	(4371, 165, 1),
	(4372, 166, 1),
	(4373, 167, 1),
	(4374, 114, 1),
	(4375, 115, 1),
	(4376, 116, 1),
	(4377, 117, 1),
	(4378, 118, 1),
	(4379, 162, 1),
	(4380, 163, 1),
	(4381, 164, 1),
	(4382, 119, 1),
	(4383, 120, 1),
	(4384, 121, 1),
	(4385, 122, 1),
	(4386, 150, 1),
	(4387, 151, 1),
	(4388, 128, 1),
	(4389, 134, 1),
	(4390, 158, 1),
	(4391, 159, 1),
	(4392, 130, 1),
	(4393, 131, 1),
	(4394, 135, 1),
	(4395, 136, 1),
	(4396, 137, 1),
	(4397, 152, 1),
	(4398, 153, 1),
	(4399, 154, 1),
	(4400, 132, 1),
	(4401, 138, 1),
	(4402, 139, 1),
	(4403, 140, 1),
	(4404, 155, 1),
	(4405, 156, 1),
	(4406, 157, 1),
	(4407, 133, 1),
	(4408, 160, 1),
	(4409, 161, 1),
	(4410, 141, 1),
	(4411, 142, 1),
	(4412, 143, 1),
	(4413, 144, 1),
	(4414, 145, 1),
	(4415, 148, 1),
	(4416, 149, 1),
	(4417, 171, 1),
	(4418, 172, 1),
	(4419, 183, 1),
	(4420, 184, 1),
	(4421, 185, 1),
	(4422, 173, 1),
	(4423, 186, 1),
	(4424, 187, 1),
	(4425, 188, 1),
	(4426, 174, 1),
	(4427, 177, 1),
	(4428, 178, 1),
	(4429, 175, 1),
	(4430, 179, 1),
	(4431, 180, 1),
	(4432, 176, 1),
	(4433, 181, 1),
	(4434, 182, 1),
	(4435, 189, 1),
	(4436, 190, 1),
	(4437, 191, 1),
	(4438, 192, 1),
	(4439, 193, 1),
	(4440, 196, 1),
	(4441, 197, 1),
	(4442, 198, 1),
	(4443, 199, 1),
	(4444, 194, 1),
	(4445, 195, 1),
	(4446, 200, 1),
	(4447, 201, 1),
	(4448, 202, 1);
/*!40000 ALTER TABLE `sys_relation` ENABLE KEYS */;

-- 导出  表 guns.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  guns.sys_role 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `num`, `pid`, `name`, `deptid`, `tips`, `version`) VALUES
	(1, 1, 0, '超级管理员', 24, 'administrator', 1),
	(5, 2, 1, '临时', 26, 'temp', NULL),
	(6, 1, 1, '中盈系统管理员', 24, '中盈系统管理员', NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 guns.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `weiXin` varchar(50) DEFAULT NULL COMMENT '微信号',
  `stockPoints` int(11) NOT NULL DEFAULT '0' COMMENT '库存积分',
  `points` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `cloudPoints` int(11) NOT NULL DEFAULT '0' COMMENT '云积分',
  `onlyPayPoints` int(11) NOT NULL DEFAULT '0' COMMENT '消费积分',
  `QRcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- 正在导出表  guns.sys_user 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `avatar`, `account`, `password`, `salt`, `name`, `birthday`, `sex`, `email`, `phone`, `roleid`, `deptid`, `status`, `createtime`, `version`, `level`, `weiXin`, `stockPoints`, `points`, `cloudPoints`, `onlyPayPoints`, `QRcode`) VALUES
	(1, '872fcd79-fb92-403a-8931-2a3349dbca4f.jpg', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', 2, 'sn93@qq.com', '18200000000', '1', 24, 1, '2016-01-29 08:49:53', 25, 0, NULL, 0, 0, 0, 0, NULL),
	(44, NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', 1, 'abc@123.com', '', '5', 26, 3, '2017-05-16 20:33:37', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(45, NULL, 'boss', '5fd4630881e112be033e066a1ac46da2', 'ss6bu', '老板', '2017-12-04 00:00:00', 1, '', '', '1', 24, 1, '2017-12-04 22:24:02', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(46, NULL, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', 1, '', '', '1', 24, 1, '2017-12-04 22:24:24', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(47, NULL, 'test', '0a37893c3eb850b2d8b52b32e6415437', '0tsuf', 'test', NULL, NULL, '', '', NULL, 25, 3, '2017-12-30 11:23:07', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(48, NULL, 'zysystem', '6bf1946c986f4f6060a46d48e0b5d859', 'rifwh', '中盈系统管理员', NULL, 1, '', '', '6', 24, 1, '2018-01-21 13:48:16', NULL, 0, NULL, 0, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 guns.t_ad 结构
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE IF NOT EXISTS `t_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `typeId` int(11) DEFAULT NULL COMMENT '广告类别',
  `positionId` int(11) DEFAULT NULL COMMENT '广告位置',
  `userId` int(11) DEFAULT NULL COMMENT '发布人',
  `shopId` int(11) DEFAULT NULL COMMENT '发布店铺',
  `brandId` int(11) DEFAULT NULL COMMENT '对应品牌',
  `productId` int(11) DEFAULT NULL COMMENT '对应商品',
  `articleId` int(11) DEFAULT NULL COMMENT '对应文章',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '截止时间',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `lowPrice` decimal(10,2) DEFAULT NULL COMMENT '折后价',
  `highPrice` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `sortNum` int(11) DEFAULT NULL COMMENT '排序',
  `col` int(11) NOT NULL DEFAULT '4' COMMENT '列宽(1-12)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- 正在导出表  guns.t_ad 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `t_ad` DISABLE KEYS */;
INSERT INTO `t_ad` (`id`, `title`, `typeId`, `positionId`, `userId`, `shopId`, `brandId`, `productId`, `articleId`, `startTime`, `endTime`, `image`, `lowPrice`, `highPrice`, `sortNum`, `col`) VALUES
	(1, '0', 46, 56, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/2018-1.png', 123.30, 150.00, NULL, 4),
	(2, '0', 46, 56, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/2018-2.png', 123.30, 150.00, NULL, 4),
	(3, '0', 46, 56, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-1.png', 123.30, 150.00, NULL, 4),
	(4, '0', 46, 57, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-2.png', 123.30, 150.00, NULL, 4),
	(5, '0', 46, 57, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-2.png', 123.30, 150.00, NULL, 4),
	(6, '0', 46, 57, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-2.png', 123.30, 150.00, NULL, 4),
	(7, '0', 46, 58, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-3.png', 123.30, 150.00, NULL, 4),
	(8, '0', 46, 58, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-3.png', 123.30, 150.00, NULL, 4),
	(9, '0', 46, 58, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-3.png', 123.30, 150.00, NULL, 4),
	(10, '0', 46, 59, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(11, '0', 46, 59, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(12, '0', 46, 59, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(13, '招商进行中，好礼送不断', 47, 60, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(14, '首批入驻，分享大礼包', 47, 60, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(15, '装饰', 46, 61, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-zy.png', 123.30, 150.00, NULL, 4);
/*!40000 ALTER TABLE `t_ad` ENABLE KEYS */;

-- 导出  表 guns.t_address 结构
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE IF NOT EXISTS `t_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `shipAddress` varchar(255) NOT NULL COMMENT '地址',
  `shipMobile` int(11) NOT NULL COMMENT '联系电话',
  `shipName` int(11) NOT NULL COMMENT '收件人',
  `default` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- 正在导出表  guns.t_address 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_address` ENABLE KEYS */;

-- 导出  表 guns.t_article 结构
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE IF NOT EXISTS `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `typeId` int(11) DEFAULT NULL COMMENT '文章类别',
  `userId` int(11) DEFAULT NULL COMMENT '发布人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `startTtime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '截止时间',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '内容',
  `auditorId` int(11) DEFAULT NULL COMMENT '审核人',
  `auditorTime` datetime DEFAULT NULL COMMENT '审核时间',
  `publish` bit(1) NOT NULL DEFAULT b'0' COMMENT '发布',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- 正在导出表  guns.t_article 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
INSERT INTO `t_article` (`id`, `typeId`, `userId`, `title`, `createTime`, `startTtime`, `endTime`, `image`, `content`, `auditorId`, `auditorTime`, `publish`, `sort`) VALUES
	(1, 63, 1, '测试看下', '2018-01-24 17:00:19', '2018-01-24 17:00:20', '2018-01-31 17:00:22', 'assets/ad/2018-1.png', '开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试开始测试', 1, '2018-01-24 17:29:01', b'1', 1);
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;

-- 导出  表 guns.t_brand 结构
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE IF NOT EXISTS `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `brand` varchar(50) NOT NULL DEFAULT '0' COMMENT '品牌名称',
  `description` varchar(255) NOT NULL DEFAULT '0' COMMENT '品牌描述',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户品牌表';

-- 正在导出表  guns.t_brand 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_brand` ENABLE KEYS */;

-- 导出  表 guns.t_cloud_points_account_journal 结构
DROP TABLE IF EXISTS `t_cloud_points_account_journal`;
CREATE TABLE IF NOT EXISTS `t_cloud_points_account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `description` varchar(50) NOT NULL DEFAULT '0' COMMENT '描述',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '分值',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='云积分账户流水';

-- 正在导出表  guns.t_cloud_points_account_journal 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_cloud_points_account_journal` DISABLE KEYS */;
INSERT INTO `t_cloud_points_account_journal` (`id`, `userId`, `description`, `points`, `dateTime`) VALUES
	(1, 1, '系统转换', 3.000000, '2018-01-18 14:51:33'),
	(2, 45, '系统转换', 6.000000, '2018-01-18 14:51:33'),
	(3, 46, '系统转换', 9.000000, '2018-01-18 14:51:33'),
	(4, 47, '系统转换', 12.000000, '2018-01-18 14:51:33'),
	(5, 1, '系统转换', 2.982000, '2018-01-18 14:51:55'),
	(6, 45, '系统转换', 5.964000, '2018-01-18 14:51:55'),
	(7, 46, '系统转换', 8.946000, '2018-01-18 14:51:55'),
	(8, 47, '系统转换', 11.928000, '2018-01-18 14:51:55'),
	(9, 1, '系统转换', 2.964108, '2018-01-18 14:52:51'),
	(10, 45, '系统转换', 5.928216, '2018-01-18 14:52:51'),
	(11, 46, '系统转换', 8.892324, '2018-01-18 14:52:51'),
	(12, 47, '系统转换', 11.856432, '2018-01-18 14:52:51');
/*!40000 ALTER TABLE `t_cloud_points_account_journal` ENABLE KEYS */;

-- 导出  表 guns.t_conversion_log 结构
DROP TABLE IF EXISTS `t_conversion_log`;
CREATE TABLE IF NOT EXISTS `t_conversion_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(65) DEFAULT NULL COMMENT '用户id',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户当前积分',
  `cloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户当前云积分',
  `onlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户当前消费积分',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyCloudConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  `dailyConsumptionConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分分',
  `newPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后用户当前积分',
  `newCloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后用户当前云积分',
  `newOnlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后用户当前消费积分',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '转换时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='每天用户转换日志';

-- 正在导出表  guns.t_conversion_log 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_conversion_log` DISABLE KEYS */;
INSERT INTO `t_conversion_log` (`id`, `userId`, `points`, `cloudPoints`, `onlyPayPoints`, `dailyCloudConversionRate`, `dailyCloudConverPoints`, `dailyConsumptionConversionRate`, `dailyConsumptionConverPoints`, `newPoints`, `newCloudPoints`, `newOnlyPayPoints`, `createTime`, `succeed`, `message`) VALUES
	(1, 1, 1000.000000, 0.000000, 0.000000, 0.003000, 3.000000, 0.003000, 3.000000, 994.000000, 3.000000, 3.000000, '2018-01-18 22:51:33', NULL, NULL),
	(2, 45, 2000.000000, 0.000000, 0.000000, 0.003000, 6.000000, 0.003000, 6.000000, 1988.000000, 6.000000, 6.000000, '2018-01-18 22:51:33', NULL, NULL),
	(3, 46, 3000.000000, 0.000000, 0.000000, 0.003000, 9.000000, 0.003000, 9.000000, 2982.000000, 9.000000, 9.000000, '2018-01-18 22:51:33', NULL, NULL),
	(4, 47, 4000.000000, 0.000000, 0.000000, 0.003000, 12.000000, 0.003000, 12.000000, 3976.000000, 12.000000, 12.000000, '2018-01-18 22:51:33', NULL, NULL),
	(5, 1, 994.000000, 3.000000, 3.000000, 0.003000, 2.982000, 0.003000, 2.982000, 988.036000, 5.982000, 5.982000, '2018-01-18 22:51:55', NULL, NULL),
	(6, 45, 1988.000000, 6.000000, 6.000000, 0.003000, 5.964000, 0.003000, 5.964000, 1976.072000, 11.964000, 11.964000, '2018-01-18 22:51:55', NULL, NULL),
	(7, 46, 2982.000000, 9.000000, 9.000000, 0.003000, 8.946000, 0.003000, 8.946000, 2964.108000, 17.946000, 17.946000, '2018-01-18 22:51:55', NULL, NULL),
	(8, 47, 3976.000000, 12.000000, 12.000000, 0.003000, 11.928000, 0.003000, 11.928000, 3952.144000, 23.928000, 23.928000, '2018-01-18 22:51:55', NULL, NULL),
	(9, 1, 988.036000, 5.982000, 5.982000, 0.003000, 2.964108, 0.003000, 2.964108, 982.107784, 8.946108, 8.946108, '2018-01-18 22:52:51', NULL, NULL),
	(10, 45, 1976.072000, 11.964000, 11.964000, 0.003000, 5.928216, 0.003000, 5.928216, 1964.215568, 17.892216, 17.892216, '2018-01-18 22:52:51', NULL, NULL),
	(11, 46, 2964.108000, 17.946000, 17.946000, 0.003000, 8.892324, 0.003000, 8.892324, 2946.323352, 26.838324, 26.838324, '2018-01-18 22:52:51', NULL, NULL),
	(12, 47, 3952.144000, 23.928000, 23.928000, 0.003000, 11.856432, 0.003000, 11.856432, 3928.431136, 35.784432, 35.784432, '2018-01-18 22:52:51', NULL, NULL);
/*!40000 ALTER TABLE `t_conversion_log` ENABLE KEYS */;

-- 导出  表 guns.t_conversion_sum_log 结构
DROP TABLE IF EXISTS `t_conversion_sum_log`;
CREATE TABLE IF NOT EXISTS `t_conversion_sum_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '当前总积分',
  `cloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '当前总云积分',
  `onlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户总消费积分',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyCloudConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  `dailyConsumptionConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分分',
  `newPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后总积分',
  `newCloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后总云积分',
  `newOnlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后总消费积分',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '转换时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='每天转换总日志';

-- 正在导出表  guns.t_conversion_sum_log 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_conversion_sum_log` DISABLE KEYS */;
INSERT INTO `t_conversion_sum_log` (`id`, `points`, `cloudPoints`, `onlyPayPoints`, `dailyCloudConversionRate`, `dailyCloudConverPoints`, `dailyConsumptionConversionRate`, `dailyConsumptionConverPoints`, `newPoints`, `newCloudPoints`, `newOnlyPayPoints`, `createTime`, `succeed`, `message`) VALUES
	(1, 10000.000000, 0.000000, 0.000000, 0.003000, 30.000000, 0.003000, 30.000000, 9940.000000, 30.000000, 30.000000, '2018-01-18 22:51:33', NULL, NULL),
	(2, 9940.000000, 30.000000, 30.000000, 0.003000, 29.820000, 0.003000, 29.820000, 9880.360000, 59.820000, 59.820000, '2018-01-18 22:51:55', NULL, NULL),
	(3, 9880.360000, 59.820000, 59.820000, 0.003000, 29.641080, 0.003000, 29.641080, 9821.077840, 89.461080, 89.461080, '2018-01-18 22:52:51', NULL, NULL);
/*!40000 ALTER TABLE `t_conversion_sum_log` ENABLE KEYS */;

-- 导出  表 guns.t_dict 结构
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE IF NOT EXISTS `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- 正在导出表  guns.t_dict 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict` ENABLE KEYS */;

-- 导出  表 guns.t_login_log 结构
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE IF NOT EXISTS `t_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- 正在导出表  guns.t_login_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_login_log` ENABLE KEYS */;

-- 导出  表 guns.t_operation_log 结构
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE IF NOT EXISTS `t_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- 正在导出表  guns.t_operation_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_operation_log` ENABLE KEYS */;

-- 导出  表 guns.t_order 结构
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sn` varchar(50) DEFAULT NULL COMMENT '订单号',
  `userId` int(11) DEFAULT NULL COMMENT '下单人',
  `shopId` int(11) DEFAULT NULL COMMENT '店铺',
  `money` decimal(10,2) DEFAULT NULL COMMENT '合计金额',
  `createTime` datetime DEFAULT NULL COMMENT '下单时间',
  `shipAddress` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `shipName` varchar(50) DEFAULT NULL COMMENT '收货人',
  `shipMobile` varchar(20) DEFAULT NULL COMMENT '收货人联系电话',
  `remark` varchar(255) DEFAULT '0' COMMENT '备注',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态 0未付款 1待发货 2待收货 3已收货 4退货中 5已退货',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定单信息';

-- 正在导出表  guns.t_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;

-- 导出  表 guns.t_order_product 结构
DROP TABLE IF EXISTS `t_order_product`;
CREATE TABLE IF NOT EXISTS `t_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `productId` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `point` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品列表';

-- 正在导出表  guns.t_order_product 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_product` ENABLE KEYS */;

-- 导出  表 guns.t_param 结构
DROP TABLE IF EXISTS `t_param`;
CREATE TABLE IF NOT EXISTS `t_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `firstcommission` decimal(6,0) NOT NULL DEFAULT '0' COMMENT '一级提成',
  `secondcommission` decimal(6,0) NOT NULL DEFAULT '0' COMMENT '二级提成',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- 正在导出表  guns.t_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_param` DISABLE KEYS */;
INSERT INTO `t_param` (`id`, `firstcommission`, `secondcommission`, `dailyCloudConversionRate`, `dailyConsumptionConversionRate`) VALUES
	(1, 0, 0, 0.003000, 0.003000);
/*!40000 ALTER TABLE `t_param` ENABLE KEYS */;

-- 导出  表 guns.t_points_account_journal 结构
DROP TABLE IF EXISTS `t_points_account_journal`;
CREATE TABLE IF NOT EXISTS `t_points_account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `description` varchar(50) NOT NULL DEFAULT '0' COMMENT '描述',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '分值',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='积分账户流水';

-- 正在导出表  guns.t_points_account_journal 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_points_account_journal` DISABLE KEYS */;
INSERT INTO `t_points_account_journal` (`id`, `userId`, `description`, `points`, `dateTime`) VALUES
	(1, 1, '系统转换', -6.000000, '2018-01-18 14:51:33'),
	(2, 45, '系统转换', -12.000000, '2018-01-18 14:51:33'),
	(3, 46, '系统转换', -18.000000, '2018-01-18 14:51:33'),
	(4, 47, '系统转换', -24.000000, '2018-01-18 14:51:33'),
	(5, 1, '系统转换', -5.964000, '2018-01-18 14:51:55'),
	(6, 45, '系统转换', -11.928000, '2018-01-18 14:51:55'),
	(7, 46, '系统转换', -17.892000, '2018-01-18 14:51:55'),
	(8, 47, '系统转换', -23.856000, '2018-01-18 14:51:55'),
	(9, 1, '系统转换', -5.928216, '2018-01-18 14:52:51'),
	(10, 45, '系统转换', -11.856432, '2018-01-18 14:52:51'),
	(11, 46, '系统转换', -17.784648, '2018-01-18 14:52:51'),
	(12, 47, '系统转换', -23.712864, '2018-01-18 14:52:51');
/*!40000 ALTER TABLE `t_points_account_journal` ENABLE KEYS */;

-- 导出  表 guns.t_product 结构
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE IF NOT EXISTS `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `description` varchar(255) NOT NULL DEFAULT '0.00' COMMENT '描述',
  `lowPice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
  `highPice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `brandId` int(11) DEFAULT '0' COMMENT '品牌',
  `categoryId` int(11) DEFAULT '0' COMMENT '分类',
  `shopId` int(11) NOT NULL DEFAULT '0' COMMENT '店铺',
  `points` int(11) DEFAULT '0' COMMENT '获得积分',
  `showPice` bit(1) NOT NULL DEFAULT b'1' COMMENT '显示售价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- 正在导出表  guns.t_product 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;
INSERT INTO `t_product` (`id`, `name`, `description`, `lowPice`, `highPice`, `brandId`, `categoryId`, `shopId`, `points`, `showPice`) VALUES
	(1, '欧美风情', '0.00', 200.00, 20.00, 0, 1, 1, 2000, b'1');
/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;

-- 导出  表 guns.t_product_category 结构
DROP TABLE IF EXISTS `t_product_category`;
CREATE TABLE IF NOT EXISTS `t_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '类别名称',
  `shopId` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品类别表';

-- 正在导出表  guns.t_product_category 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product_category` DISABLE KEYS */;
INSERT INTO `t_product_category` (`id`, `name`, `shopId`) VALUES
	(1, '精品家装', 1);
/*!40000 ALTER TABLE `t_product_category` ENABLE KEYS */;

-- 导出  表 guns.t_product_image 结构
DROP TABLE IF EXISTS `t_product_image`;
CREATE TABLE IF NOT EXISTS `t_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `description` varchar(50) DEFAULT '0' COMMENT '描述',
  `image` varchar(50) DEFAULT NULL COMMENT '图片',
  `productId` int(11) DEFAULT '0' COMMENT '对应商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- 正在导出表  guns.t_product_image 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_image` ENABLE KEYS */;

-- 导出  表 guns.t_product_param 结构
DROP TABLE IF EXISTS `t_product_param`;
CREATE TABLE IF NOT EXISTS `t_product_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `param` varchar(10) DEFAULT '0' COMMENT '参数',
  `description` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `productId` int(11) DEFAULT '0' COMMENT '对应商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品参数表';

-- 正在导出表  guns.t_product_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_param` ENABLE KEYS */;

-- 导出  表 guns.t_quartzjob_config 结构
DROP TABLE IF EXISTS `t_quartzjob_config`;
CREATE TABLE IF NOT EXISTS `t_quartzjob_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '任务运行时间表达式',
  `job_desc` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `group_name` varchar(255) DEFAULT NULL COMMENT '任务组名',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `job_status` tinyint(4) DEFAULT NULL COMMENT '任务状态 0禁用 1启用 2删除',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `job_sql` varchar(255) DEFAULT NULL COMMENT '任务sql',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  guns.t_quartzjob_config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_quartzjob_config` DISABLE KEYS */;
INSERT INTO `t_quartzjob_config` (`id`, `create_at`, `cron_expression`, `job_desc`, `group_name`, `job_name`, `job_status`, `update_at`, `job_sql`) VALUES
	(1, '2018-01-14 14:27:10', '0 0 2 * * ? *', NULL, '管理员', '每日积分转换', 1, NULL, NULL);
/*!40000 ALTER TABLE `t_quartzjob_config` ENABLE KEYS */;

-- 导出  表 guns.t_recharge_log 结构
DROP TABLE IF EXISTS `t_recharge_log`;
CREATE TABLE IF NOT EXISTS `t_recharge_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operatorId` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1积分,2库存',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '充值积分',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值日志表';

-- 正在导出表  guns.t_recharge_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_recharge_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_recharge_log` ENABLE KEYS */;

-- 导出  表 guns.t_recharge_withdraw_sum_log 结构
DROP TABLE IF EXISTS `t_recharge_withdraw_sum_log`;
CREATE TABLE IF NOT EXISTS `t_recharge_withdraw_sum_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `recharge` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '充值总数',
  `withdraw` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '提现总数',
  `logDate` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='每天冲值和提现总数统计日志';

-- 正在导出表  guns.t_recharge_withdraw_sum_log 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_recharge_withdraw_sum_log` DISABLE KEYS */;
INSERT INTO `t_recharge_withdraw_sum_log` (`id`, `recharge`, `withdraw`, `logDate`) VALUES
	(1, 200.000000, 20.000000, '2018-01-31'),
	(2, 3000.000000, 301.000000, '2018-01-31');
/*!40000 ALTER TABLE `t_recharge_withdraw_sum_log` ENABLE KEYS */;

-- 导出  表 guns.t_shop 结构
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE IF NOT EXISTS `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `typeId` int(11) NOT NULL COMMENT '店铺类型',
  `description` varchar(255) NOT NULL COMMENT '店铺描述',
  `userid` int(11) NOT NULL COMMENT '店铺所属用户',
  `QRcode` int(11) NOT NULL COMMENT '店铺二维码',
  `category` int(11) NOT NULL COMMENT '经营类别',
  `brand` varchar(255) NOT NULL COMMENT '主营品牌',
  `logo` varchar(255) NOT NULL COMMENT '店铺LOGO',
  `license` varchar(255) NOT NULL COMMENT '经营执照',
  `state` int(11) NOT NULL COMMENT '店铺状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- 正在导出表  guns.t_shop 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_shop` DISABLE KEYS */;
INSERT INTO `t_shop` (`id`, `name`, `typeId`, `description`, `userid`, `QRcode`, `category`, `brand`, `logo`, `license`, `state`) VALUES
	(1, '创艺装饰', 40, '创艺装饰', 1, 0, 0, '创艺地板', '', '', 1);
/*!40000 ALTER TABLE `t_shop` ENABLE KEYS */;

-- 导出  表 guns.t_shopping_points_account_journal 结构
DROP TABLE IF EXISTS `t_shopping_points_account_journal`;
CREATE TABLE IF NOT EXISTS `t_shopping_points_account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `description` varchar(50) NOT NULL DEFAULT '0' COMMENT '描述',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '分值',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='消费积分账户流水';

-- 正在导出表  guns.t_shopping_points_account_journal 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_shopping_points_account_journal` DISABLE KEYS */;
INSERT INTO `t_shopping_points_account_journal` (`id`, `userId`, `description`, `points`, `dateTime`) VALUES
	(1, 1, '系统转换', 3.000000, '2018-01-18 14:51:33'),
	(2, 45, '系统转换', 6.000000, '2018-01-18 14:51:33'),
	(3, 46, '系统转换', 9.000000, '2018-01-18 14:51:33'),
	(4, 47, '系统转换', 12.000000, '2018-01-18 14:51:33'),
	(5, 1, '系统转换', 2.982000, '2018-01-18 14:51:55'),
	(6, 45, '系统转换', 5.964000, '2018-01-18 14:51:55'),
	(7, 46, '系统转换', 8.946000, '2018-01-18 14:51:55'),
	(8, 47, '系统转换', 11.928000, '2018-01-18 14:51:55'),
	(9, 1, '系统转换', 2.964108, '2018-01-18 14:52:51'),
	(10, 45, '系统转换', 5.928216, '2018-01-18 14:52:51'),
	(11, 46, '系统转换', 8.892324, '2018-01-18 14:52:51'),
	(12, 47, '系统转换', 11.856432, '2018-01-18 14:52:51');
/*!40000 ALTER TABLE `t_shopping_points_account_journal` ENABLE KEYS */;

-- 导出  表 guns.t_shop_cart 结构
DROP TABLE IF EXISTS `t_shop_cart`;
CREATE TABLE IF NOT EXISTS `t_shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `productId` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- 正在导出表  guns.t_shop_cart 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shop_cart` ENABLE KEYS */;

-- 导出  表 guns.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) NOT NULL COMMENT '账号',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) NOT NULL COMMENT '电话',
  `phoneVerification` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否验证',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `superior` varchar(255) NOT NULL COMMENT '上级id',
  `superiors` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `status` int(11) DEFAULT '1' COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `weiXin` varchar(50) DEFAULT NULL COMMENT '微信号',
  `stockPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '库存积分',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '积分',
  `cloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '云积分',
  `onlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '消费积分',
  `QRcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- 正在导出表  guns.t_user 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `avatar`, `account`, `password`, `salt`, `name`, `birthday`, `sex`, `email`, `phone`, `phoneVerification`, `roleid`, `superior`, `superiors`, `status`, `createtime`, `version`, `level`, `weiXin`, `stockPoints`, `points`, `cloudPoints`, `onlyPayPoints`, `QRcode`) VALUES
	(1, '', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', 2, 'sn93@qq.com', '18200000000', b'0', '1', '27', NULL, 1, '2016-01-29 08:49:53', 25, 0, NULL, 0.000000, 982.107784, 8.946108, 8.946108, '173d47cb-f0e0-4a96-af10-a4b1e4133c36.jpg'),
	(44, NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', 1, 'abc@123.com', '', b'0', '5', '1', NULL, 3, '2017-05-16 20:33:37', NULL, 0, NULL, 0.000000, 0.000000, 0.000000, 0.000000, 'sdfsd'),
	(45, NULL, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', 1, '', '', b'0', '1', '24', NULL, 1, '2017-12-04 22:24:02', NULL, 0, NULL, 0.000000, 1964.215568, 17.892216, 17.892216, 'dsvsd'),
	(46, NULL, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', 1, '', '', b'0', '1', '24', NULL, 1, '2017-12-04 22:24:24', NULL, 0, NULL, 0.000000, 2946.323352, 26.838324, 26.838324, NULL),
	(47, NULL, 'test', '0a37893c3eb850b2d8b52b32e6415437', '0tsuf', 'test', NULL, NULL, '', '', b'0', NULL, '25', NULL, 1, '2017-12-30 11:23:07', NULL, 0, NULL, 0.000000, 3928.431136, 35.784432, 35.784432, NULL),
	(48, NULL, 'test1', '111111', NULL, NULL, NULL, NULL, NULL, '13800138000', b'0', NULL, 'admin', NULL, 1, NULL, NULL, 0, NULL, 0.000000, 0.000000, 0.000000, 0.000000, NULL),
	(49, NULL, 'test2', '123456', NULL, NULL, NULL, NULL, NULL, '13800138000', b'0', NULL, 'admin', NULL, 1, NULL, NULL, 0, NULL, 0.000000, 0.000000, 0.000000, 0.000000, NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 guns.t_withdraw_log 结构
DROP TABLE IF EXISTS `t_withdraw_log`;
CREATE TABLE IF NOT EXISTS `t_withdraw_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operatorId` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '提现积分',
  `dateTime` datetime NOT NULL COMMENT '提现时间',
  `auditDateTime` datetime NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='提现日志';

-- 正在导出表  guns.t_withdraw_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_withdraw_log` DISABLE KEYS */;
INSERT INTO `t_withdraw_log` (`id`, `operatorId`, `userId`, `points`, `dateTime`, `auditDateTime`) VALUES
	(1, 1, 1, 200.000000, '2018-01-09 19:31:30', '2018-01-09 19:31:31');
/*!40000 ALTER TABLE `t_withdraw_log` ENABLE KEYS */;


-- 导出 guns-test 的数据库结构
DROP DATABASE IF EXISTS `guns-test`;
CREATE DATABASE IF NOT EXISTS `guns-test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `guns-test`;

-- 导出  表 guns-test.sys_dept 结构
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  guns-test.sys_dept 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`id`, `num`, `pid`, `pids`, `simplename`, `fullname`, `tips`, `version`) VALUES
	(24, 1, 0, '[0],', '总公司', '总公司', '', NULL),
	(25, 2, 24, '[0],[24],', '开发部', '开发部', '', NULL),
	(26, 3, 24, '[0],[24],', '运营部', '运营部', '', NULL),
	(27, 4, 24, '[0],[24],', '战略部', '战略部', '', NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 guns-test.sys_dict 结构
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- 正在导出表  guns-test.sys_dict 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` (`id`, `num`, `pid`, `name`, `tips`) VALUES
	(16, 0, 0, '状态', NULL),
	(17, 1, 16, '启用', NULL),
	(18, 2, 16, '禁用', NULL),
	(29, 0, 0, '性别', NULL),
	(30, 1, 29, '男', NULL),
	(31, 2, 29, '女', NULL),
	(35, 0, 0, '账号状态', NULL),
	(36, 1, 35, '启用', NULL),
	(37, 2, 35, '冻结', NULL),
	(38, 3, 35, '已删除', NULL),
	(39, 0, 0, '店铺类别', NULL),
	(40, 1, 39, '精品家装', NULL),
	(41, 2, 39, '家用电器', NULL),
	(42, 3, 39, '智能设备', NULL),
	(43, 4, 39, '母婴健康', NULL),
	(44, 5, 39, '餐饮美食', NULL),
	(45, 0, 0, '广告类别', NULL),
	(46, 1, 45, '图片广告', NULL),
	(47, 2, 45, '文字公告', NULL),
	(55, 0, 0, '广告位置', NULL),
	(56, 1, 55, '首页滚动', NULL),
	(57, 2, 55, '首页图片一', NULL),
	(58, 3, 55, '首页图片二', NULL),
	(59, 4, 55, '首页图片三', NULL),
	(60, 5, 55, '首页公告', NULL),
	(61, 6, 55, '店铺分类顶部', NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;

-- 导出  表 guns-test.sys_expense 结构
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE IF NOT EXISTS `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报销表';

-- 正在导出表  guns-test.sys_expense 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_expense` DISABLE KEYS */;
INSERT INTO `sys_expense` (`id`, `money`, `desc`, `createtime`, `state`, `userid`, `processId`) VALUES
	(1, 33.00, '33', '2017-12-18 22:11:12', 3, 1, '2501');
/*!40000 ALTER TABLE `sys_expense` ENABLE KEYS */;

-- 导出  表 guns-test.sys_login_log 结构
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE IF NOT EXISTS `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- 正在导出表  guns-test.sys_login_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;

-- 导出  表 guns-test.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- 正在导出表  guns-test.sys_menu 的数据：~90 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `code`, `pcode`, `pcodes`, `name`, `icon`, `url`, `num`, `levels`, `ismenu`, `tips`, `status`, `isopen`) VALUES
	(105, 'system', '0', '[0],', '系统管理', 'fa-user', '#', 4, 1, 1, NULL, 1, 1),
	(106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 1, 2, 1, NULL, 1, 0),
	(107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 0, NULL, 1, 0),
	(108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 0, NULL, 1, 0),
	(109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 0, NULL, 1, 0),
	(110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 0, NULL, 1, 0),
	(111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 0, NULL, 1, 0),
	(112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 0, NULL, 1, 0),
	(113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 0, NULL, 1, 0),
	(114, 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', 2, 2, 1, NULL, 1, 0),
	(115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 0, NULL, 1, 0),
	(116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 0, NULL, 1, 0),
	(117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 0, NULL, 1, 0),
	(118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 0, NULL, 1, 0),
	(119, 'menu', 'system', '[0],[system],', '菜单管理', NULL, '/menu', 4, 2, 1, NULL, 1, 0),
	(120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 0, NULL, 1, 0),
	(121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 0, NULL, 1, 0),
	(122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 0, NULL, 1, 0),
	(128, 'log', 'system', '[0],[system],', '业务日志', NULL, '/log', 6, 2, 1, NULL, 1, 0),
	(130, 'druid', 'system', '[0],[system],', '监控管理', NULL, '/druid', 7, 2, 1, NULL, 1, NULL),
	(131, 'dept', 'system', '[0],[system],', '部门管理', NULL, '/dept', 3, 2, 1, NULL, 1, NULL),
	(132, 'dict', 'system', '[0],[system],', '字典管理', NULL, '/dict', 4, 2, 1, NULL, 1, NULL),
	(133, 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', 6, 2, 1, NULL, 1, NULL),
	(134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 0, NULL, 1, NULL),
	(135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 0, NULL, 1, NULL),
	(136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 0, NULL, 1, NULL),
	(137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 0, NULL, 1, NULL),
	(138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dict/add', 1, 3, 0, NULL, 1, NULL),
	(139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dict/update', 1, 3, 0, NULL, 1, NULL),
	(140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dict/delete', 1, 3, 0, NULL, 1, NULL),
	(141, 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', 9, 2, 1, NULL, 1, NULL),
	(142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 0, NULL, 1, NULL),
	(143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 0, NULL, 1, NULL),
	(144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 0, NULL, 1, NULL),
	(145, 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', 1, 1, 1, NULL, 1, NULL),
	(148, 'code', '0', '[0],', '代码生成', 'fa-code', '/code', 3, 1, 1, NULL, 1, NULL),
	(149, 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', 2, 1, 1, NULL, 1, NULL),
	(150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 0, NULL, 1, NULL),
	(151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 0, NULL, 1, NULL),
	(152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 0, NULL, 1, NULL),
	(153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 0, NULL, 1, NULL),
	(154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 0, NULL, 1, NULL),
	(155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 0, NULL, 1, NULL),
	(156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 0, NULL, 1, NULL),
	(157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 0, NULL, 1, NULL),
	(158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 0, NULL, 1, NULL),
	(159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 0, NULL, 1, NULL),
	(160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 0, NULL, 1, NULL),
	(161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 0, NULL, 1, NULL),
	(162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 0, NULL, 1, NULL),
	(163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 0, NULL, 1, NULL),
	(164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 0, NULL, 1, NULL),
	(165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 0, NULL, 1, NULL),
	(166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 0, NULL, 1, NULL),
	(167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 0, NULL, 1, NULL),
	(168, 'expense', '0', '[0],', '报销管理', 'fa-clone', '#', 5, 1, 1, NULL, 1, NULL),
	(169, 'expense_fill', 'expense', '[0],[expense],', '报销申请', '', '/expense', 1, 2, 1, NULL, 1, NULL),
	(170, 'expense_progress', 'expense', '[0],[expense],', '报销审批', '', '/process', 2, 2, 1, NULL, 1, NULL),
	(171, 'zy_system', '0', '[0],', '中盈创世系统管理', '', '#', 1000, 1, 1, NULL, 1, NULL),
	(172, 'zy_ad', 'zy_system', '[0],[zy_system],', '广告管理', '', '/ad', 1001, 2, 1, NULL, 1, NULL),
	(173, 'zy_article', 'zy_system', '[0],[zy_system],', '文章管理', '', '/article', 1002, 2, 1, NULL, 1, NULL),
	(174, 'zy_mgr', 'zy_system', '[0],[zy_system],', '用户管理', '', '/tUser', 1003, 2, 1, NULL, 1, NULL),
	(175, 'zy_shop', 'zy_system', '[0],[zy_system],', '店铺管理', '', '/shop', 1004, 2, 1, NULL, 1, NULL),
	(176, 'zy_order', 'zy_system', '[0],[zy_system],', '订单管理', '', '/order', 1005, 2, 1, NULL, 1, NULL),
	(177, 'zy_mgr_update', 'zy_mgr', '[0],[zy_system],[zy_mgr],', '修改', '', '/tUser/update', 10031, 3, 0, NULL, 1, NULL),
	(178, 'zy_mgr_delete', 'zy_mgr', '[0],[zy_system],[zy_mgr],', '删除', '', '/tUser/delete', 10032, 3, 0, NULL, 1, NULL),
	(179, 'zy_shop_update', 'zy_shop', '[0],[zy_system],[zy_shop],', '修改', '', '/shop/update', 10041, 3, 0, NULL, 1, NULL),
	(180, 'zy_shop_delete', 'zy_shop', '[0],[zy_system],[zy_shop],', '删除', '', '/shop/delete', 10042, 3, 0, NULL, 1, NULL),
	(181, 'zy_order_update', 'zy_order', '[0],[zy_system],[zy_order],', '修改', '', '/order/update', 10051, 3, 0, NULL, 1, NULL),
	(182, 'zy_order_delete', 'zy_order', '[0],[zy_system],[zy_order],', '删除', '', '/order/delete', 10052, 3, 0, NULL, 1, NULL),
	(183, 'zy_ad_add', 'zy_ad', '[0],[zy_system],[zy_ad],', '添加', '', '/ad/add', 10011, 3, 0, NULL, 1, NULL),
	(184, 'zy_ad_update', 'zy_ad', '[0],[zy_system],[zy_ad],', '修改', '', '/ad/update', 10012, 3, 0, NULL, 1, NULL),
	(185, 'zy_ad_delete', 'zy_ad', '[0],[zy_system],[zy_ad],', '删除', '', '/ad/delete', 10013, 3, 0, NULL, 1, NULL),
	(186, 'zy_article_add', 'zy_article', '[0],[zy_system],[zy_article],', '添加', '', '/article/add', 10021, 3, 0, NULL, 1, NULL),
	(187, 'zy_article_update', 'zy_article', '[0],[zy_system],[zy_article],', '修改', '', '/article/update', 10022, 3, 0, NULL, 1, NULL),
	(188, 'zy_article_delete', 'zy_article', '[0],[zy_system],[zy_article],', '删除', '', '/article/delete', 10023, 3, 0, NULL, 1, NULL),
	(189, 'zy_point_mg', 'zy_system', '[0],[zy_system],', '积分管理', '', '#', 1006, 2, 1, NULL, 1, NULL),
	(190, 'zy_point_cloud', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '云积分流水日志', '', '/cloudPointsAccountJournal', 10061, 3, 1, NULL, 1, NULL),
	(191, 'zy_point_conversionLog', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分转换日志', '', '/conversionLog', 10062, 3, 1, NULL, 1, NULL),
	(192, 'zy_point_conversionSumLog', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分转换日志汇总', '', '/conversionSumLog', 10063, 3, 1, NULL, 1, NULL),
	(193, 'zy_point_param', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分系统参数设置', '', '/param', 10064, 3, 1, NULL, 1, NULL),
	(194, 'zy_point_shoppingPointsAccountJournal', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '购物积分流水日志', '', '/shoppingPointsAccountJournal', 10065, 3, 1, NULL, 1, NULL),
	(195, 'zy_point_pointsAccountJournal', 'zy_point_mg', '[0],[zy_system],[zy_point_mg],', '积分流水日志', '', '/pointsAccountJournal', 10066, 3, 1, NULL, 1, NULL),
	(196, 'zy_point_start', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '启动每日积分转换任务', '', '/dailyConversion/createConversionJob', 100641, 4, 0, NULL, 1, NULL),
	(197, 'zy_point_pause', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '暂停每日积分转换', '', '/dailyConversion/pauseConversionJob', 100642, 4, 0, NULL, 1, NULL),
	(198, 'zy_points_resumeConversionJob', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '恢复每日积分转换', '', '/dailyConversion/resumeConversionJob', 100643, 4, 0, NULL, 1, NULL),
	(199, 'zy_point_param_update', 'zy_point_param', '[0],[zy_system],[zy_point_mg],[zy_point_param],', '修改', '', '/param/update', 100644, 4, 0, NULL, 1, NULL),
	(200, 'zy_mgp', 'zy_system', '[0],[zy_system],', '商品管理', '', '#', 1007, 2, 1, NULL, 1, NULL),
	(201, 'zy_mgp_product', 'zy_mgp', '[0],[zy_system],[zy_mgp],', '商品目录', '', '/product', 10071, 3, 1, NULL, 1, NULL),
	(202, 'zy_mgp_productCategory', 'zy_mgp', '[0],[zy_system],[zy_mgp],', '商品类别', '', '/productCategory', 10072, 3, 1, NULL, 1, NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 guns-test.sys_notice 结构
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE IF NOT EXISTS `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- 正在导出表  guns-test.sys_notice 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `createtime`, `creater`) VALUES
	(6, '世界', 10, '欢迎使用Guns管理系统', '2017-01-11 08:53:20', 1),
	(8, '你好', NULL, '你好', '2017-05-10 19:28:57', 1);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;

-- 导出  表 guns-test.sys_operation_log 结构
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE IF NOT EXISTS `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- 正在导出表  guns-test.sys_operation_log 的数据：~76 rows (大约)
/*!40000 ALTER TABLE `sys_operation_log` DISABLE KEYS */;
INSERT INTO `sys_operation_log` (`id`, `logtype`, `logname`, `userid`, `classname`, `method`, `createtime`, `succeed`, `message`) VALUES
	(1, '业务日志', '添加管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'add', '2017-12-30 11:23:07', '成功', '账号=test'),
	(2, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-06 09:21:45', '成功', '字典名称=店铺类别,字典内容=1:精品家装;2:家用电器;3:智能设备;4:母婴健康;5:餐饮美食;'),
	(3, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-10 10:56:33', '成功', '字典名称=广告类别,字典内容=1:图片广告;2:文字公告;'),
	(4, '业务日志', '添加字典记录', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'add', '2018-01-10 11:00:19', '成功', '字典名称=广告位置,字典内容=1:首页滚动;2:首页图片一;3:首页图片二;4:首页图片三;5:首页公告;5:店铺分类顶部;'),
	(5, '业务日志', '修改字典', 1, 'com.stylefeng.guns.modular.system.controller.DictController', 'update', '2018-01-10 11:00:29', '成功', '字典名称=广告位置,字典内容=1:首页滚动;2:首页图片一;3:首页图片二;4:首页图片三;5:首页公告;6:店铺分类顶部;;;;'),
	(6, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:03:54', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTb9adce72.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(7, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:04:29', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor124.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTb9adce72.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(8, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:04:41', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor124.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTb9adce72.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(9, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:05:58', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTT97948641.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(10, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:06:18', '失败', 'java.lang.IndexOutOfBoundsException: Index: 0, Size: 0\n	at java.util.ArrayList.rangeCheck(ArrayList.java:653)\n	at java.util.ArrayList.get(ArrayList.java:429)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:65)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTT97948641.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(11, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:17:52', '失败', 'java.lang.ClassCastException: java.math.BigDecimal cannot be cast to java.lang.Float\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:67)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfea556df.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(12, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:20:27', '失败', 'java.lang.ClassCastException: java.math.BigDecimal cannot be cast to java.lang.Float\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:67)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfea556df.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(13, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:31:31', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n### The error may involve com.stylefeng.guns.modular.zy.dao.ZyPointDao.updateBatchUser-Inline\n### The error occurred while setting parameters\n### SQL: update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 1    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 45    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 46    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 47\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:231)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:73)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\n	at com.sun.proxy.TProxy89.update(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:294)\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\n	at com.sun.proxy.TProxy124.updateBatchUser(Unknown Source)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:86)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfbab4dfd.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\nCaused by: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:422)\n	at com.mysql.jdbc.Util.handleNewInstance(Util.java:404)\n	at com.mysql.jdbc.Util.getInstance(Util.java:387)\n	at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:939)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3878)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3814)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2478)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2625)\n	at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2551)\n	at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:1861)\n	at com.mysql.jdbc.PreparedStatement.execute(PreparedStatement.java:1192)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2931)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:131)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:493)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.TProxy138.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:46)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at org.apache.ibatis.executor.CachingExecutor.update(CachingExecutor.java:76)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\n	... 98 more\n'),
	(14, '异常日志', '', 1, NULL, NULL, '2018-01-14 16:34:09', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n### The error may involve com.stylefeng.guns.modular.zy.dao.ZyPointDao.updateBatchUser-Inline\n### The error occurred while setting parameters\n### SQL: update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 1    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 45    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 46    ;     update t_user    set    cloudPoints =  ,    onlyPayPoints =     where id = 47\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:231)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:73)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\n	at com.sun.proxy.TProxy89.update(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:294)\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:62)\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\n	at com.sun.proxy.TProxy124.updateBatchUser(Unknown Source)\n	at com.stylefeng.guns.modular.zy.controller.TestController.update(TestController.java:86)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTFastClassBySpringCGLIBTT2b44af1e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.zy.controller.TestControllerTTEnhancerBySpringCGLIBTTfbab4dfd.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\nCaused by: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\n			onlyPayPoints = \n			where id = 1\n		 ; \n			update t_user\n			set\n			cloudPoint\' at line 3\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:422)\n	at com.mysql.jdbc.Util.handleNewInstance(Util.java:404)\n	at com.mysql.jdbc.Util.getInstance(Util.java:387)\n	at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:939)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3878)\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:3814)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2478)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2625)\n	at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2551)\n	at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:1861)\n	at com.mysql.jdbc.PreparedStatement.execute(PreparedStatement.java:1192)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2931)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:2929)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:131)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:493)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.TProxy138.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:46)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.TProxy136.update(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at org.apache.ibatis.executor.CachingExecutor.update(CachingExecutor.java:76)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\n	... 98 more\n'),
	(15, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-14 21:11:02', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档'),
	(16, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-20 16:28:25', '成功', '账号=admin;;;字段名称:头像,旧值:girl.gif,新值:9db001c4-3087-4639-ad4d-4780b3e2c68c.jpg'),
	(17, '业务日志', '重置管理员密码', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'reset', '2018-01-20 18:13:43', '成功', '账号=boss'),
	(18, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:02:03', '成功', '菜单名称=中盈创世系统管理'),
	(19, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:02:53', '成功', '菜单名称=广告管理'),
	(20, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:03:49', '成功', '菜单名称=文章管理'),
	(21, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:05:06', '成功', '菜单名称=用户管理'),
	(22, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:06:04', '成功', '菜单名称=店铺管理'),
	(23, '异常日志', '', 1, NULL, NULL, '2018-01-21 13:07:30', '失败', 'com.stylefeng.guns.core.exception.GunsException: 菜单编号重复，不能添加\n	at com.stylefeng.guns.modular.system.controller.MenuController.add(MenuController.java:147)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTFastClassBySpringCGLIBTT27b62c1b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor150.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:60)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:45)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTEnhancerBySpringCGLIBTT6348673a.add(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(24, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:07:42', '成功', '菜单名称=订单管理'),
	(25, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:07:55', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,文章管理,用户管理,店铺管理,订单管理'),
	(26, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:38:25', '成功', '菜单名称=修改'),
	(27, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:39:15', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,文章管理,用户管理,修改,店铺管理,订单管理'),
	(28, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:42:30', '成功', '菜单名称=删除'),
	(29, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:43:55', '成功', '菜单名称=修改'),
	(30, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:44:43', '成功', '菜单名称=删除'),
	(31, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:46:21', '成功', '菜单名称=修改'),
	(32, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:46:57', '成功', '菜单名称=删除'),
	(33, '业务日志', '添加角色', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'add', '2018-01-21 13:47:41', '成功', '角色名称=中盈系统管理员'),
	(34, '业务日志', '添加管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'add', '2018-01-21 13:48:16', '成功', '账号=zysystem'),
	(35, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:48:33', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(36, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:48:47', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(37, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:49:33', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(38, '业务日志', '分配角色', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2018-01-21 13:49:44', '成功', '账号=zysystem,角色名称集合=中盈系统管理员'),
	(39, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:50:31', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,文章管理,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(40, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:51:29', '成功', '菜单名称=添加'),
	(41, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:52:08', '成功', '菜单名称=修改'),
	(42, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:52:47', '成功', '菜单名称=删除'),
	(43, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:53:30', '成功', '菜单名称=添加'),
	(44, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:54:01', '成功', '菜单名称=修改'),
	(45, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:54:28', '成功', '菜单名称=删除'),
	(46, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:54:42', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(47, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:54:55', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除'),
	(48, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:57:18', '成功', '菜单名称=积分管理'),
	(49, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 13:58:38', '成功', '菜单名称=云积分流水日志'),
	(50, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 13:58:49', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志'),
	(51, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:01:59', '成功', '菜单名称=积分转换日志'),
	(52, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:03:22', '成功', '菜单名称=积分转换日志汇总'),
	(53, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:05:17', '成功', '菜单名称=积分系统参数设置'),
	(54, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:06:36', '成功', '菜单名称=购物积分流水日志'),
	(55, '业务日志', '修改菜单', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-01-21 14:07:22', '成功', '菜单名称=积分转换日志汇总;;;字段名称:菜单编号,旧值:zy_points_conversionSumLog,新值:zy_point_conversionSumLog'),
	(56, '异常日志', '', 1, NULL, NULL, '2018-01-21 14:09:04', '失败', 'com.stylefeng.guns.core.exception.GunsException: 菜单编号重复，不能添加\n	at com.stylefeng.guns.modular.system.controller.MenuController.add(MenuController.java:147)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTFastClassBySpringCGLIBTT27b62c1b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor146.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:60)\n	at sun.reflect.GeneratedMethodAccessor240.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:45)\n	at sun.reflect.GeneratedMethodAccessor303.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTEnhancerBySpringCGLIBTT759bb2fc.add(<generated>)\n	at sun.reflect.GeneratedMethodAccessor332.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(57, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:09:17', '成功', '菜单名称=积分流水日志'),
	(58, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:12:37', '成功', '菜单名称=启动每日积分转换任务'),
	(59, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:13:34', '成功', '菜单名称=暂停每日积分转换'),
	(60, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:14:36', '成功', '菜单名称=恢复每日积分转换'),
	(61, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:14:46', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,购物积分流水日志,积分流水日志'),
	(62, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:14:51', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,购物积分流水日志,积分流水日志'),
	(63, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:15:38', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,购物积分流水日志,积分流水日志'),
	(64, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-21 14:40:48', '成功', '菜单名称=修改'),
	(65, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:40:59', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志'),
	(66, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-21 14:41:04', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志'),
	(67, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-23 23:31:05', '成功', '菜单名称=商品管理'),
	(68, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-23 23:32:13', '成功', '菜单名称=商品目录'),
	(69, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-23 23:32:48', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志,商品管理,商品目录'),
	(70, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-23 23:32:53', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志,商品管理,商品目录'),
	(71, '异常日志', '', 1, NULL, NULL, '2018-01-23 23:34:24', '失败', 'com.stylefeng.guns.core.exception.GunsException: 菜单编号重复，不能添加\n	at com.stylefeng.guns.modular.system.controller.MenuController.add(MenuController.java:147)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTFastClassBySpringCGLIBTT27b62c1b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.intercept.SessionInterceptor.sessionKit(SessionInterceptor.java:30)\n	at sun.reflect.GeneratedMethodAccessor161.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:60)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\n	at com.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:45)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\n	at com.stylefeng.guns.modular.system.controller.MenuControllerTTEnhancerBySpringCGLIBTTf852cf41.add(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:497)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:105)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1455)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\n'),
	(72, '业务日志', '菜单新增', 1, 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-01-23 23:34:42', '成功', '菜单名称=商品类别'),
	(73, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-23 23:34:55', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志,商品管理,商品目录,商品类别'),
	(74, '业务日志', '配置权限', 1, 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-01-23 23:35:02', '成功', '角色名称=中盈系统管理员,资源名称=通知,中盈创世系统管理,广告管理,添加,修改,删除,文章管理,添加,修改,删除,用户管理,修改,删除,店铺管理,修改,删除,订单管理,修改,删除,积分管理,云积分流水日志,积分转换日志,积分转换日志汇总,积分系统参数设置,启动每日积分转换任务,暂停每日积分转换,恢复每日积分转换,修改,购物积分流水日志,积分流水日志,商品管理,商品目录,商品类别'),
	(75, '业务日志', '修改管理员', 1, 'com.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2018-01-23 23:37:15', '成功', '账号=admin;;;字段名称:部门名称,旧值:战略部,新值:总公司'),
	(76, '业务日志', '清空登录日志', 1, 'com.stylefeng.guns.modular.system.controller.LoginLogController', 'delLog', '2018-01-23 23:38:38', '成功', '主键id=null');
/*!40000 ALTER TABLE `sys_operation_log` ENABLE KEYS */;

-- 导出  表 guns-test.sys_param 结构
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE IF NOT EXISTS `sys_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `firstcommission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '一级提成',
  `secondcommission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '二级提成',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- 正在导出表  guns-test.sys_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_param` ENABLE KEYS */;

-- 导出  表 guns-test.sys_relation 结构
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE IF NOT EXISTS `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4681 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- 正在导出表  guns-test.sys_relation 的数据：~140 rows (大约)
/*!40000 ALTER TABLE `sys_relation` DISABLE KEYS */;
INSERT INTO `sys_relation` (`id`, `menuid`, `roleid`) VALUES
	(3377, 105, 5),
	(3378, 106, 5),
	(3379, 107, 5),
	(3380, 108, 5),
	(3381, 109, 5),
	(3382, 110, 5),
	(3383, 111, 5),
	(3384, 112, 5),
	(3385, 113, 5),
	(3386, 114, 5),
	(3387, 115, 5),
	(3388, 116, 5),
	(3389, 117, 5),
	(3390, 118, 5),
	(3391, 119, 5),
	(3392, 120, 5),
	(3393, 121, 5),
	(3394, 122, 5),
	(3395, 150, 5),
	(3396, 151, 5),
	(4561, 105, 1),
	(4562, 106, 1),
	(4563, 107, 1),
	(4564, 108, 1),
	(4565, 109, 1),
	(4566, 110, 1),
	(4567, 111, 1),
	(4568, 112, 1),
	(4569, 113, 1),
	(4570, 165, 1),
	(4571, 166, 1),
	(4572, 167, 1),
	(4573, 114, 1),
	(4574, 115, 1),
	(4575, 116, 1),
	(4576, 117, 1),
	(4577, 118, 1),
	(4578, 162, 1),
	(4579, 163, 1),
	(4580, 164, 1),
	(4581, 119, 1),
	(4582, 120, 1),
	(4583, 121, 1),
	(4584, 122, 1),
	(4585, 150, 1),
	(4586, 151, 1),
	(4587, 128, 1),
	(4588, 134, 1),
	(4589, 158, 1),
	(4590, 159, 1),
	(4591, 130, 1),
	(4592, 131, 1),
	(4593, 135, 1),
	(4594, 136, 1),
	(4595, 137, 1),
	(4596, 152, 1),
	(4597, 153, 1),
	(4598, 154, 1),
	(4599, 132, 1),
	(4600, 138, 1),
	(4601, 139, 1),
	(4602, 140, 1),
	(4603, 155, 1),
	(4604, 156, 1),
	(4605, 157, 1),
	(4606, 133, 1),
	(4607, 160, 1),
	(4608, 161, 1),
	(4609, 141, 1),
	(4610, 142, 1),
	(4611, 143, 1),
	(4612, 144, 1),
	(4613, 145, 1),
	(4614, 148, 1),
	(4615, 149, 1),
	(4616, 171, 1),
	(4617, 172, 1),
	(4618, 183, 1),
	(4619, 184, 1),
	(4620, 185, 1),
	(4621, 173, 1),
	(4622, 186, 1),
	(4623, 187, 1),
	(4624, 188, 1),
	(4625, 174, 1),
	(4626, 177, 1),
	(4627, 178, 1),
	(4628, 175, 1),
	(4629, 179, 1),
	(4630, 180, 1),
	(4631, 176, 1),
	(4632, 181, 1),
	(4633, 182, 1),
	(4634, 189, 1),
	(4635, 190, 1),
	(4636, 191, 1),
	(4637, 192, 1),
	(4638, 193, 1),
	(4639, 196, 1),
	(4640, 197, 1),
	(4641, 198, 1),
	(4642, 199, 1),
	(4643, 194, 1),
	(4644, 195, 1),
	(4645, 200, 1),
	(4646, 201, 1),
	(4647, 202, 1),
	(4648, 145, 6),
	(4649, 171, 6),
	(4650, 172, 6),
	(4651, 183, 6),
	(4652, 184, 6),
	(4653, 185, 6),
	(4654, 173, 6),
	(4655, 186, 6),
	(4656, 187, 6),
	(4657, 188, 6),
	(4658, 174, 6),
	(4659, 177, 6),
	(4660, 178, 6),
	(4661, 175, 6),
	(4662, 179, 6),
	(4663, 180, 6),
	(4664, 176, 6),
	(4665, 181, 6),
	(4666, 182, 6),
	(4667, 189, 6),
	(4668, 190, 6),
	(4669, 191, 6),
	(4670, 192, 6),
	(4671, 193, 6),
	(4672, 196, 6),
	(4673, 197, 6),
	(4674, 198, 6),
	(4675, 199, 6),
	(4676, 194, 6),
	(4677, 195, 6),
	(4678, 200, 6),
	(4679, 201, 6),
	(4680, 202, 6);
/*!40000 ALTER TABLE `sys_relation` ENABLE KEYS */;

-- 导出  表 guns-test.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  guns-test.sys_role 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `num`, `pid`, `name`, `deptid`, `tips`, `version`) VALUES
	(1, 1, 0, '超级管理员', 24, 'administrator', 1),
	(5, 2, 1, '临时', 26, 'temp', NULL),
	(6, 1, 1, '中盈系统管理员', 24, '中盈系统管理员', NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 guns-test.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `weiXin` varchar(50) DEFAULT NULL COMMENT '微信号',
  `stockPoints` int(11) NOT NULL DEFAULT '0' COMMENT '库存积分',
  `points` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `cloudPoints` int(11) NOT NULL DEFAULT '0' COMMENT '云积分',
  `onlyPayPoints` int(11) NOT NULL DEFAULT '0' COMMENT '消费积分',
  `QRcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- 正在导出表  guns-test.sys_user 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `avatar`, `account`, `password`, `salt`, `name`, `birthday`, `sex`, `email`, `phone`, `roleid`, `deptid`, `status`, `createtime`, `version`, `level`, `weiXin`, `stockPoints`, `points`, `cloudPoints`, `onlyPayPoints`, `QRcode`) VALUES
	(1, '9db001c4-3087-4639-ad4d-4780b3e2c68c.jpg', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', 2, 'sn93@qq.com', '18200000000', '1', 24, 1, '2016-01-29 08:49:53', 25, 0, NULL, 0, 0, 0, 0, NULL),
	(44, NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', 1, 'abc@123.com', '', '5', 26, 3, '2017-05-16 20:33:37', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(45, NULL, 'boss', '5fd4630881e112be033e066a1ac46da2', 'ss6bu', '老板', '2017-12-04 00:00:00', 1, '', '', '1', 24, 1, '2017-12-04 22:24:02', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(46, NULL, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', 1, '', '', '1', 24, 1, '2017-12-04 22:24:24', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(47, NULL, 'test', '0a37893c3eb850b2d8b52b32e6415437', '0tsuf', 'test', NULL, NULL, '', '', NULL, 25, 1, '2017-12-30 11:23:07', NULL, 0, NULL, 0, 0, 0, 0, NULL),
	(48, NULL, 'zysystem', '6bf1946c986f4f6060a46d48e0b5d859', 'rifwh', '中盈系统管理员', NULL, 1, '', '', '6', 24, 1, '2018-01-21 13:48:16', NULL, 0, NULL, 0, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 guns-test.t_ad 结构
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE IF NOT EXISTS `t_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `typeId` int(11) DEFAULT NULL COMMENT '广告类别',
  `positionId` int(11) DEFAULT NULL COMMENT '广告位置',
  `userId` int(11) DEFAULT NULL COMMENT '发布人',
  `shopId` int(11) DEFAULT NULL COMMENT '发布店铺',
  `brandId` int(11) DEFAULT NULL COMMENT '对应品牌',
  `productId` int(11) DEFAULT NULL COMMENT '对应商品',
  `articleId` int(11) DEFAULT NULL COMMENT '对应文章',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '截止时间',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `lowPrice` decimal(10,2) DEFAULT NULL COMMENT '折后价',
  `highPrice` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `sortNum` int(11) DEFAULT NULL COMMENT '排序',
  `col` int(11) NOT NULL DEFAULT '4' COMMENT '列宽(1-12)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- 正在导出表  guns-test.t_ad 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `t_ad` DISABLE KEYS */;
INSERT INTO `t_ad` (`id`, `title`, `typeId`, `positionId`, `userId`, `shopId`, `brandId`, `productId`, `articleId`, `startTime`, `endTime`, `image`, `lowPrice`, `highPrice`, `sortNum`, `col`) VALUES
	(1, '0', 46, 56, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/2018-1.png', 123.30, 150.00, NULL, 4),
	(2, '0', 46, 56, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/2018-2.png', 123.30, 150.00, NULL, 4),
	(3, '0', 46, 56, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-1.png', 123.30, 150.00, NULL, 4),
	(4, '0', 46, 57, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-2.png', 123.30, 150.00, NULL, 4),
	(5, '0', 46, 57, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-2.png', 123.30, 150.00, NULL, 4),
	(6, '0', 46, 57, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-2.png', 123.30, 150.00, NULL, 4),
	(7, '0', 46, 58, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-3.png', 123.30, 150.00, NULL, 4),
	(8, '0', 46, 58, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-3.png', 123.30, 150.00, NULL, 4),
	(9, '0', 46, 58, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-3.png', 123.30, 150.00, NULL, 4),
	(10, '0', 46, 59, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(11, '0', 46, 59, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(12, '0', 46, 59, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(13, '招商进行中，好礼送不断', 47, 60, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(14, '首批入驻，分享大礼包', 47, 60, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-4.png', 123.30, 150.00, NULL, 4),
	(15, '装饰', 46, 61, 1, 1, 1, 1, 1, '2018-01-10 18:45:57', '2018-02-10 18:45:59', 'assets/ad/ad-zy.png', 123.30, 150.00, NULL, 4);
/*!40000 ALTER TABLE `t_ad` ENABLE KEYS */;

-- 导出  表 guns-test.t_address 结构
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE IF NOT EXISTS `t_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `shipAddress` varchar(255) NOT NULL COMMENT '地址',
  `shipMobile` int(11) NOT NULL COMMENT '联系电话',
  `shipName` int(11) NOT NULL COMMENT '收件人',
  `default` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- 正在导出表  guns-test.t_address 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_address` ENABLE KEYS */;

-- 导出  表 guns-test.t_article 结构
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE IF NOT EXISTS `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `typeId` int(11) DEFAULT NULL COMMENT '文章类别',
  `userId` int(11) DEFAULT NULL COMMENT '发布人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `startTtime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '截止时间',
  `image` varchar(255) DEFAULT '0' COMMENT '图片',
  `content` text COMMENT '内容',
  `auditorId` int(11) DEFAULT NULL COMMENT '审核人',
  `auditorTime` int(11) DEFAULT NULL COMMENT '审核时间',
  `publish` bit(1) DEFAULT b'0' COMMENT '发布',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- 正在导出表  guns-test.t_article 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;

-- 导出  表 guns-test.t_brand 结构
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE IF NOT EXISTS `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `brand` varchar(50) NOT NULL DEFAULT '0' COMMENT '品牌名称',
  `description` varchar(255) NOT NULL DEFAULT '0' COMMENT '品牌描述',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户品牌表';

-- 正在导出表  guns-test.t_brand 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_brand` ENABLE KEYS */;

-- 导出  表 guns-test.t_cloud_points_account_journal 结构
DROP TABLE IF EXISTS `t_cloud_points_account_journal`;
CREATE TABLE IF NOT EXISTS `t_cloud_points_account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `description` varchar(50) NOT NULL DEFAULT '0' COMMENT '描述',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '分值',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='云积分账户流水';

-- 正在导出表  guns-test.t_cloud_points_account_journal 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_cloud_points_account_journal` DISABLE KEYS */;
INSERT INTO `t_cloud_points_account_journal` (`id`, `userId`, `description`, `points`, `dateTime`) VALUES
	(1, 1, '系统转换', 3.000000, '2018-01-18 14:51:33'),
	(2, 45, '系统转换', 6.000000, '2018-01-18 14:51:33'),
	(3, 46, '系统转换', 9.000000, '2018-01-18 14:51:33'),
	(4, 47, '系统转换', 12.000000, '2018-01-18 14:51:33'),
	(5, 1, '系统转换', 2.982000, '2018-01-18 14:51:55'),
	(6, 45, '系统转换', 5.964000, '2018-01-18 14:51:55'),
	(7, 46, '系统转换', 8.946000, '2018-01-18 14:51:55'),
	(8, 47, '系统转换', 11.928000, '2018-01-18 14:51:55'),
	(9, 1, '系统转换', 2.964108, '2018-01-18 14:52:51'),
	(10, 45, '系统转换', 5.928216, '2018-01-18 14:52:51'),
	(11, 46, '系统转换', 8.892324, '2018-01-18 14:52:51'),
	(12, 47, '系统转换', 11.856432, '2018-01-18 14:52:51');
/*!40000 ALTER TABLE `t_cloud_points_account_journal` ENABLE KEYS */;

-- 导出  表 guns-test.t_conversion_log 结构
DROP TABLE IF EXISTS `t_conversion_log`;
CREATE TABLE IF NOT EXISTS `t_conversion_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(65) DEFAULT NULL COMMENT '用户id',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户当前积分',
  `cloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户当前云积分',
  `onlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户当前消费积分',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyCloudConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  `dailyConsumptionConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分分',
  `newPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后用户当前积分',
  `newCloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后用户当前云积分',
  `newOnlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后用户当前消费积分',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '转换时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='每天用户转换日志';

-- 正在导出表  guns-test.t_conversion_log 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_conversion_log` DISABLE KEYS */;
INSERT INTO `t_conversion_log` (`id`, `userId`, `points`, `cloudPoints`, `onlyPayPoints`, `dailyCloudConversionRate`, `dailyCloudConverPoints`, `dailyConsumptionConversionRate`, `dailyConsumptionConverPoints`, `newPoints`, `newCloudPoints`, `newOnlyPayPoints`, `createTime`, `succeed`, `message`) VALUES
	(1, 1, 1000.000000, 0.000000, 0.000000, 0.003000, 3.000000, 0.003000, 3.000000, 994.000000, 3.000000, 3.000000, '2018-01-18 22:51:33', NULL, NULL),
	(2, 45, 2000.000000, 0.000000, 0.000000, 0.003000, 6.000000, 0.003000, 6.000000, 1988.000000, 6.000000, 6.000000, '2018-01-18 22:51:33', NULL, NULL),
	(3, 46, 3000.000000, 0.000000, 0.000000, 0.003000, 9.000000, 0.003000, 9.000000, 2982.000000, 9.000000, 9.000000, '2018-01-18 22:51:33', NULL, NULL),
	(4, 47, 4000.000000, 0.000000, 0.000000, 0.003000, 12.000000, 0.003000, 12.000000, 3976.000000, 12.000000, 12.000000, '2018-01-18 22:51:33', NULL, NULL),
	(5, 1, 994.000000, 3.000000, 3.000000, 0.003000, 2.982000, 0.003000, 2.982000, 988.036000, 5.982000, 5.982000, '2018-01-18 22:51:55', NULL, NULL),
	(6, 45, 1988.000000, 6.000000, 6.000000, 0.003000, 5.964000, 0.003000, 5.964000, 1976.072000, 11.964000, 11.964000, '2018-01-18 22:51:55', NULL, NULL),
	(7, 46, 2982.000000, 9.000000, 9.000000, 0.003000, 8.946000, 0.003000, 8.946000, 2964.108000, 17.946000, 17.946000, '2018-01-18 22:51:55', NULL, NULL),
	(8, 47, 3976.000000, 12.000000, 12.000000, 0.003000, 11.928000, 0.003000, 11.928000, 3952.144000, 23.928000, 23.928000, '2018-01-18 22:51:55', NULL, NULL),
	(9, 1, 988.036000, 5.982000, 5.982000, 0.003000, 2.964108, 0.003000, 2.964108, 982.107784, 8.946108, 8.946108, '2018-01-18 22:52:51', NULL, NULL),
	(10, 45, 1976.072000, 11.964000, 11.964000, 0.003000, 5.928216, 0.003000, 5.928216, 1964.215568, 17.892216, 17.892216, '2018-01-18 22:52:51', NULL, NULL),
	(11, 46, 2964.108000, 17.946000, 17.946000, 0.003000, 8.892324, 0.003000, 8.892324, 2946.323352, 26.838324, 26.838324, '2018-01-18 22:52:51', NULL, NULL),
	(12, 47, 3952.144000, 23.928000, 23.928000, 0.003000, 11.856432, 0.003000, 11.856432, 3928.431136, 35.784432, 35.784432, '2018-01-18 22:52:51', NULL, NULL);
/*!40000 ALTER TABLE `t_conversion_log` ENABLE KEYS */;

-- 导出  表 guns-test.t_conversion_sum_log 结构
DROP TABLE IF EXISTS `t_conversion_sum_log`;
CREATE TABLE IF NOT EXISTS `t_conversion_sum_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '当前总积分',
  `cloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '当前总云积分',
  `onlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '用户总消费积分',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyCloudConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  `dailyConsumptionConverPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分分',
  `newPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后总积分',
  `newCloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后总云积分',
  `newOnlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '转换后总消费积分',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '转换时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='每天转换总日志';

-- 正在导出表  guns-test.t_conversion_sum_log 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_conversion_sum_log` DISABLE KEYS */;
INSERT INTO `t_conversion_sum_log` (`id`, `points`, `cloudPoints`, `onlyPayPoints`, `dailyCloudConversionRate`, `dailyCloudConverPoints`, `dailyConsumptionConversionRate`, `dailyConsumptionConverPoints`, `newPoints`, `newCloudPoints`, `newOnlyPayPoints`, `createTime`, `succeed`, `message`) VALUES
	(1, 10000.000000, 0.000000, 0.000000, 0.003000, 30.000000, 0.003000, 30.000000, 9940.000000, 30.000000, 30.000000, '2018-01-18 22:51:33', NULL, NULL),
	(2, 9940.000000, 30.000000, 30.000000, 0.003000, 29.820000, 0.003000, 29.820000, 9880.360000, 59.820000, 59.820000, '2018-01-18 22:51:55', NULL, NULL),
	(3, 9880.360000, 59.820000, 59.820000, 0.003000, 29.641080, 0.003000, 29.641080, 9821.077840, 89.461080, 89.461080, '2018-01-18 22:52:51', NULL, NULL);
/*!40000 ALTER TABLE `t_conversion_sum_log` ENABLE KEYS */;

-- 导出  表 guns-test.t_dict 结构
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE IF NOT EXISTS `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- 正在导出表  guns-test.t_dict 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict` ENABLE KEYS */;

-- 导出  表 guns-test.t_login_log 结构
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE IF NOT EXISTS `t_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- 正在导出表  guns-test.t_login_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_login_log` ENABLE KEYS */;

-- 导出  表 guns-test.t_operation_log 结构
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE IF NOT EXISTS `t_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- 正在导出表  guns-test.t_operation_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_operation_log` ENABLE KEYS */;

-- 导出  表 guns-test.t_order 结构
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sn` varchar(50) DEFAULT NULL COMMENT '订单号',
  `userId` int(11) DEFAULT NULL COMMENT '下单人',
  `shopId` int(11) DEFAULT NULL COMMENT '店铺',
  `money` decimal(10,2) DEFAULT NULL COMMENT '合计金额',
  `createTime` datetime DEFAULT NULL COMMENT '下单时间',
  `shipAddress` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `shipName` varchar(50) DEFAULT NULL COMMENT '收货人',
  `shipMobile` varchar(20) DEFAULT NULL COMMENT '收货人联系电话',
  `remark` varchar(255) DEFAULT '0' COMMENT '备注',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态 0未付款 1待发货 2待收货 3已收货 4退货中 5已退货',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定单信息';

-- 正在导出表  guns-test.t_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;

-- 导出  表 guns-test.t_order_product 结构
DROP TABLE IF EXISTS `t_order_product`;
CREATE TABLE IF NOT EXISTS `t_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `productId` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `point` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品列表';

-- 正在导出表  guns-test.t_order_product 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_product` ENABLE KEYS */;

-- 导出  表 guns-test.t_param 结构
DROP TABLE IF EXISTS `t_param`;
CREATE TABLE IF NOT EXISTS `t_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `firstcommission` decimal(6,0) NOT NULL DEFAULT '0' COMMENT '一级提成',
  `secondcommission` decimal(6,0) NOT NULL DEFAULT '0' COMMENT '二级提成',
  `dailyCloudConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日云积分转换率',
  `dailyConsumptionConversionRate` decimal(6,6) NOT NULL DEFAULT '0.000000' COMMENT '每日消费积分转换率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- 正在导出表  guns-test.t_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_param` DISABLE KEYS */;
INSERT INTO `t_param` (`id`, `firstcommission`, `secondcommission`, `dailyCloudConversionRate`, `dailyConsumptionConversionRate`) VALUES
	(1, 0, 0, 0.003000, 0.003000);
/*!40000 ALTER TABLE `t_param` ENABLE KEYS */;

-- 导出  表 guns-test.t_points_account_journal 结构
DROP TABLE IF EXISTS `t_points_account_journal`;
CREATE TABLE IF NOT EXISTS `t_points_account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `description` varchar(50) NOT NULL DEFAULT '0' COMMENT '描述',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '分值',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='积分账户流水';

-- 正在导出表  guns-test.t_points_account_journal 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_points_account_journal` DISABLE KEYS */;
INSERT INTO `t_points_account_journal` (`id`, `userId`, `description`, `points`, `dateTime`) VALUES
	(1, 1, '系统转换', -6.000000, '2018-01-18 14:51:33'),
	(2, 45, '系统转换', -12.000000, '2018-01-18 14:51:33'),
	(3, 46, '系统转换', -18.000000, '2018-01-18 14:51:33'),
	(4, 47, '系统转换', -24.000000, '2018-01-18 14:51:33'),
	(5, 1, '系统转换', -5.964000, '2018-01-18 14:51:55'),
	(6, 45, '系统转换', -11.928000, '2018-01-18 14:51:55'),
	(7, 46, '系统转换', -17.892000, '2018-01-18 14:51:55'),
	(8, 47, '系统转换', -23.856000, '2018-01-18 14:51:55'),
	(9, 1, '系统转换', -5.928216, '2018-01-18 14:52:51'),
	(10, 45, '系统转换', -11.856432, '2018-01-18 14:52:51'),
	(11, 46, '系统转换', -17.784648, '2018-01-18 14:52:51'),
	(12, 47, '系统转换', -23.712864, '2018-01-18 14:52:51');
/*!40000 ALTER TABLE `t_points_account_journal` ENABLE KEYS */;

-- 导出  表 guns-test.t_product 结构
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE IF NOT EXISTS `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `description` varchar(255) NOT NULL DEFAULT '0.00' COMMENT '描述',
  `lowPice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
  `highPice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `brandId` int(11) DEFAULT '0' COMMENT '品牌',
  `shopId` int(11) NOT NULL DEFAULT '0' COMMENT '店铺',
  `points` int(11) DEFAULT '0' COMMENT '获得积分',
  `showPice` bit(1) NOT NULL DEFAULT b'1' COMMENT '显示售价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- 正在导出表  guns-test.t_product 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;

-- 导出  表 guns-test.t_product_category 结构
DROP TABLE IF EXISTS `t_product_category`;
CREATE TABLE IF NOT EXISTS `t_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '类别名称',
  `shopId` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别表';

-- 正在导出表  guns-test.t_product_category 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_category` ENABLE KEYS */;

-- 导出  表 guns-test.t_product_image 结构
DROP TABLE IF EXISTS `t_product_image`;
CREATE TABLE IF NOT EXISTS `t_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `description` varchar(50) DEFAULT '0' COMMENT '描述',
  `image` varchar(50) DEFAULT NULL COMMENT '图片',
  `productId` int(11) DEFAULT '0' COMMENT '对应商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- 正在导出表  guns-test.t_product_image 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_image` ENABLE KEYS */;

-- 导出  表 guns-test.t_product_param 结构
DROP TABLE IF EXISTS `t_product_param`;
CREATE TABLE IF NOT EXISTS `t_product_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `param` varchar(10) DEFAULT '0' COMMENT '参数',
  `description` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `productId` int(11) DEFAULT '0' COMMENT '对应商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品参数表';

-- 正在导出表  guns-test.t_product_param 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_product_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_param` ENABLE KEYS */;

-- 导出  表 guns-test.t_quartzjob_config 结构
DROP TABLE IF EXISTS `t_quartzjob_config`;
CREATE TABLE IF NOT EXISTS `t_quartzjob_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '任务运行时间表达式',
  `job_desc` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `group_name` varchar(255) DEFAULT NULL COMMENT '任务组名',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `job_status` tinyint(4) DEFAULT NULL COMMENT '任务状态 0禁用 1启用 2删除',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `job_sql` varchar(255) DEFAULT NULL COMMENT '任务sql',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  guns-test.t_quartzjob_config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_quartzjob_config` DISABLE KEYS */;
INSERT INTO `t_quartzjob_config` (`id`, `create_at`, `cron_expression`, `job_desc`, `group_name`, `job_name`, `job_status`, `update_at`, `job_sql`) VALUES
	(1, '2018-01-14 14:27:10', '0 0 2 * * ? *', NULL, '管理员', '每日积分转换', 1, NULL, NULL);
/*!40000 ALTER TABLE `t_quartzjob_config` ENABLE KEYS */;

-- 导出  表 guns-test.t_recharge_log 结构
DROP TABLE IF EXISTS `t_recharge_log`;
CREATE TABLE IF NOT EXISTS `t_recharge_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operatorId` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1积分,2库存',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '充值积分',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值日志表';

-- 正在导出表  guns-test.t_recharge_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_recharge_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_recharge_log` ENABLE KEYS */;

-- 导出  表 guns-test.t_shop 结构
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE IF NOT EXISTS `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `type` int(11) NOT NULL COMMENT '店铺类型',
  `description` varchar(255) NOT NULL COMMENT '店铺描述',
  `userid` int(11) NOT NULL COMMENT '店铺所属用户',
  `QRcode` int(11) NOT NULL COMMENT '店铺二维码',
  `category` int(11) NOT NULL COMMENT '经营类别',
  `brand` varchar(255) NOT NULL COMMENT '主营品牌',
  `logo` varchar(255) NOT NULL COMMENT '店铺LOGO',
  `license` varchar(255) NOT NULL COMMENT '经营执照',
  `state` int(11) NOT NULL COMMENT '店铺状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- 正在导出表  guns-test.t_shop 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shop` ENABLE KEYS */;

-- 导出  表 guns-test.t_shopping_points_account_journal 结构
DROP TABLE IF EXISTS `t_shopping_points_account_journal`;
CREATE TABLE IF NOT EXISTS `t_shopping_points_account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `description` varchar(50) NOT NULL DEFAULT '0' COMMENT '描述',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '分值',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='消费积分账户流水';

-- 正在导出表  guns-test.t_shopping_points_account_journal 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_shopping_points_account_journal` DISABLE KEYS */;
INSERT INTO `t_shopping_points_account_journal` (`id`, `userId`, `description`, `points`, `dateTime`) VALUES
	(1, 1, '系统转换', 3.000000, '2018-01-18 14:51:33'),
	(2, 45, '系统转换', 6.000000, '2018-01-18 14:51:33'),
	(3, 46, '系统转换', 9.000000, '2018-01-18 14:51:33'),
	(4, 47, '系统转换', 12.000000, '2018-01-18 14:51:33'),
	(5, 1, '系统转换', 2.982000, '2018-01-18 14:51:55'),
	(6, 45, '系统转换', 5.964000, '2018-01-18 14:51:55'),
	(7, 46, '系统转换', 8.946000, '2018-01-18 14:51:55'),
	(8, 47, '系统转换', 11.928000, '2018-01-18 14:51:55'),
	(9, 1, '系统转换', 2.964108, '2018-01-18 14:52:51'),
	(10, 45, '系统转换', 5.928216, '2018-01-18 14:52:51'),
	(11, 46, '系统转换', 8.892324, '2018-01-18 14:52:51'),
	(12, 47, '系统转换', 11.856432, '2018-01-18 14:52:51');
/*!40000 ALTER TABLE `t_shopping_points_account_journal` ENABLE KEYS */;

-- 导出  表 guns-test.t_shop_cart 结构
DROP TABLE IF EXISTS `t_shop_cart`;
CREATE TABLE IF NOT EXISTS `t_shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `productId` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- 正在导出表  guns-test.t_shop_cart 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shop_cart` ENABLE KEYS */;

-- 导出  表 guns-test.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `superior` varchar(255) DEFAULT NULL COMMENT '上级id',
  `superiors` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `weiXin` varchar(50) DEFAULT NULL COMMENT '微信号',
  `stockPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '库存积分',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '积分',
  `cloudPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '云积分',
  `onlyPayPoints` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '消费积分',
  `QRcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- 正在导出表  guns-test.t_user 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `avatar`, `account`, `password`, `salt`, `name`, `birthday`, `sex`, `email`, `phone`, `roleid`, `superior`, `superiors`, `status`, `createtime`, `version`, `level`, `weiXin`, `stockPoints`, `points`, `cloudPoints`, `onlyPayPoints`, `QRcode`) VALUES
	(1, 'girl.gif', 'admin', '222222', '8pgby', '张三', '2017-05-05 00:00:00', 2, 'sn93@qq.com', '18200000000', '1', '27', NULL, 1, '2016-01-29 08:49:53', 25, 0, NULL, 0.000000, 982.107784, 8.946108, 8.946108, 'admin.jpg'),
	(44, NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', 1, 'abc@123.com', '', '5', '1', NULL, 3, '2017-05-16 20:33:37', NULL, 0, NULL, 0.000000, 0.000000, 0.000000, 0.000000, 'sdfsd'),
	(45, NULL, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', 1, '', '', '1', '24', NULL, 1, '2017-12-04 22:24:02', NULL, 0, NULL, 0.000000, 1964.215568, 17.892216, 17.892216, 'dsvsd'),
	(46, NULL, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', 1, '', '', '1', '24', NULL, 1, '2017-12-04 22:24:24', NULL, 0, NULL, 0.000000, 2946.323352, 26.838324, 26.838324, NULL),
	(47, NULL, 'test', '0a37893c3eb850b2d8b52b32e6415437', '0tsuf', 'test', NULL, NULL, '', '', NULL, '25', NULL, 1, '2017-12-30 11:23:07', NULL, 0, NULL, 0.000000, 3928.431136, 35.784432, 35.784432, NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 guns-test.t_withdraw_log 结构
DROP TABLE IF EXISTS `t_withdraw_log`;
CREATE TABLE IF NOT EXISTS `t_withdraw_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operatorId` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `points` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '提现积分',
  `dateTime` datetime NOT NULL COMMENT '提现时间',
  `auditDateTime` datetime NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='提现日志';

-- 正在导出表  guns-test.t_withdraw_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_withdraw_log` DISABLE KEYS */;
INSERT INTO `t_withdraw_log` (`id`, `operatorId`, `userId`, `points`, `dateTime`, `auditDateTime`) VALUES
	(1, 1, 1, 200.000000, '2018-01-09 19:31:30', '2018-01-09 19:31:31');
/*!40000 ALTER TABLE `t_withdraw_log` ENABLE KEYS */;


-- 导出 guns_flowable 的数据库结构
DROP DATABASE IF EXISTS `guns_flowable`;
CREATE DATABASE IF NOT EXISTS `guns_flowable` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `guns_flowable`;

-- 导出  表 guns_flowable.act_evt_log 结构
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE IF NOT EXISTS `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_evt_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ge_bytearray 结构
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE IF NOT EXISTS `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ge_bytearray 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` (`ID_`, `REV_`, `NAME_`, `DEPLOYMENT_ID_`, `BYTES_`, `GENERATED_`) VALUES
	('10002', 1, 'E:\\hospital\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', '10001', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E6365220A20202020202020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4449220A20202020202020202020202020786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F4449220A20202020202020202020202020747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F5850617468220A202020202020202020202020207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22457870656E736522206E616D653D22457870656E736550726F636573732220697345786563757461626C653D2274727565223E0A202020203C646F63756D656E746174696F6E3EE68AA5E99480E6B581E7A88B3C2F646F63756D656E746174696F6E3E0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E5BC80E5A73F223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D2266696C6C5461736B22206E616D653D22E587BAE5B7AEE68AA5E994802220666C6F7761626C653A61737369676E65653D22247B7461736B557365727D223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D226A756467655461736B223E3C2F6578636C7573697665476174657761793E0A202020203C757365725461736B2069643D226469726563746F7254616B22206E616D653D22E7BB8FE79086E5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E4D616E616765725461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C757365725461736B2069643D22626F73735461736B22206E616D653D22E88081E69DBFE5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E426F73735461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9F223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D226469726563746F724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226469726563746F7254616B22207461726765745265663D2266696C6C5461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22626F73734E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D22626F73735461736B22207461726765745265663D2266696C6C5461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22737461727422207461726765745265663D2266696C6C5461736B223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D2266696C6C5461736B22207461726765745265663D226A756467655461736B223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226A756467654D6F726522206E616D653D22E5A4A7E4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D22626F73735461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203E203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22626F737350617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D22626F73735461736B22207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226469726563746F7250617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D226469726563746F7254616B22207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226A756467654C65737322206E616D653D22E5B08FE4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D226469726563746F7254616B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203C3D203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F457870656E7365223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22457870656E7365222069643D2242504D4E506C616E655F457870656E7365223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223238352E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2266696C6C5461736B222069643D2242504D4E53686170655F66696C6C5461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223430352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226A756467655461736B222069643D2242504D4E53686170655F6A756467655461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223538352E302220793D223133302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226469726563746F7254616B222069643D2242504D4E53686170655F6469726563746F7254616B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223733352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22626F73735461736B222069643D2242504D4E53686170655F626F73735461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223535352E302220793D223235352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223737312E302220793D223238312E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223430352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223530352E302220793D223135302E3136363131323935363831303632223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223538352E343333333333333333333333332220793D223135302E3433333333333333333333333334223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654C657373222069643D2242504D4E456467655F6A756467654C657373223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223632342E353533303732363235363938332220793D223135302E3434363932373337343330313638223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733352E302220793D223135302E31333932373537363630313637223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F724E6F7450617373466C6F77222069643D2242504D4E456467655F6469726563746F724E6F7450617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F737350617373466C6F77222069643D2242504D4E456467655F626F737350617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223635352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223737312E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654D6F7265222069643D2242504D4E456467655F6A756467654D6F7265223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E343334303237373737373737382220793D223136392E3536353937323232323232323233223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E313338343038333034343938332220793D223235352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F7250617373466C6F77222069643D2242504D4E456467655F6469726563746F7250617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223238312E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F73734E6F7450617373466C6F77222069643D2242504D4E456467655F626F73734E6F7450617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, 0),
	('10003', 1, 'E:\\hospital\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '10001', _binary 0x89504E470D0A1A0A0000000D494844520000034D00000159080600000044DBC43F00002F4D4944415478DAED3F905C653FF0B92CBAAC65AD5A4AB1945AA897F2525ECAB55628B45834D7725DD68D8A6876984C24633F7C844C77808B80914196DA0848323F1A451164F9948D6C644132DD4D1203142085D9284A2008492484853F263F393F3F63A7A727C94CBE663FBFAAB7A6A7FBCC47CE9C3CFDFCFB7DCFE93F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0B99C723F89611886B1F3E13F003F343F0C47F942E5D33172C5CA499D732A63CF9D533A223FF39A25EFC875976667DB9D53E8F950BE50FA4CB67DEDE82C3F3F6FC15BEC4DD449004033C0A8939BB5F8F0F8D859AC9C764E3F3FC252673FB5B358BAB93608A5C1685A3C3F78154B67D893A8930080668051295FA85C3FBBE7B05C77E5E2F87C5A77F9A3B942F9E498553FCB85BE70552CCFDBBE7DF9937DB353E976DBEF2BCDB427512701003F00A35284A5AEAEAE833F74E9B4EECAD1F9AB4BEFCE1E3F79B5DBC5C7CE42E9AAF8D8D575DB9B738552EEEC393DEFEC2C565AED49D449004033C0A81321A9B3BB7C75BE583E2BCE5F8AA57A9DB3CBC7C5633F545F682A94E7548352BADDF6F33F177416CB9F8FF3A0D2ED8E3F512701003F00A34E9CBF949DB7942F94AF3F3F147D3FA68A95D3B2EDF2732B473FA5B6583F23EE8B70550D5985F2B4F83A7B137512003F30AA54034F1A3F04C54C512CCFAB86A1623F57AC5CB2C3B6C5CA49F9423F8DBE4FCC48D99BA8930080668051293F3F3A542F0031ABF291B8725EFAF935D3E72E7A6F4D683FDF5D39B1D1E5C673C5F20C7B127512003F303A43D3759543AAE73215CAD74FEFEE3F9DB37B3E1CF7C7A5C57385D2F7F3B37A3E109F67B3508DA4616A3F3F0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F005027D549003F3F003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00403F003403003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F00340300EAA43F00003F00D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300B0773CFFFCF35F2A140A495A2BDF676F00803F403F490E79E9A597D6A792C99327FF3F01003F801AAB56ADFA71D2EBFEFBEF5FD3D6D67692BD0200421300A9575E79E5AFB76EDDBA2DA971F9E597AFEAE8E878BBBD0300421340D35BBB76EDCAA4CE3F1BD6B6B7B7773F0020340134B5679F7D76463280F9F3E7AF4DEBE6313F008CDE803F423FC6C33FD0ACD25CF4575BB66C796DA0D0B46DDBB657F3F9FCB231633F6C6F01C0E80C4DC7A4E3F59D85A6D6D6D6B1F614D0AC56AF5EFD403F2B57AE5CD5D6D696B3B700603FA7BB77123FF0EA29D0CC3F5DBAABCC946CDEBCF9BEA8991D1D1D87D86300303A433F033F97D3059ADD37BEF18DB3773F2F32D345175D74AB99260018FDC1A9D1B94D0F9B65026869B9E5965B7E3750627AF2C927BF6B561E003F343FB7C9B94C00DB8D1B37EEC8341C6D6E701188E5EDEDEDCB5D3D0F009A441A92E69B650268ECCA2B3F3F696B6D68BAF6DA6B7F90D6CE593F00344F68FA58CDB94C273F007F122F24DD733FEB6ADED8F6A6B45EAEE8E8E878BBBD03004D243BB7C92C13407F53A74EFDD4FAF5EBB73F3F79728F8B3F00407386A6EA95F4EC0980C6E6CD9B7777A15088F33EE7DB1B003048493FBC72E5CA3F7CF0C1ADA5522959B870E1881C119A46EAEFDED3D3932C5EBCF8BFD2313F09EAE43F77DD7557B54EDE713F3F000C5634024B3F49D6AD5B97BCFAEAABC6011A2FBCF042B268D1A297D3C6E0CB8E4A5027F7C558B3663F09004311AF9C0A4CC3A6217875E1C2858F3B2A413FD449008691586AE28978F88C3F78DD5109EAA4A14E02308CC45A714FC2C33F70410B50270D75128091D80CBCB2E1B964E5C33FBFEEF96675C4EDB8CF13B86600D44975523FA0E99B818DEB3F3F3E23F9D55DE7EF30E2BE78CC93B86600D44975523FA0A99B8155BFFEF77E8D403656FF7A3F713F00A893EAA43A09407337038F573F6033108F79123F803AA94EAA9300347533B07C61D780CD403CE6495C3300EAA43AA94E023F3F6806409D5427D5490034038D475C056AA066201E3F3F0075529D54270168EA6660C5D239033603F19827713F00A893EAA43A09405337032FAE593FBFF792FE4B4ED2FB3F4FE29A015027D549751280A66E06623CFDC80DFD9A81B83FB86600D44975523F4033B0654BB2E2FEEFF45F7292DE178F79123F803AA94EAA9300346D3310EF64FFC4D2E2806BF5E331EF763F0075529D54270168BE6660CB96E4B915E5E43FEFB968C046201BB14D6CEBD5543F00A893EAA43A0940533403BB7AD5D4ABA93F5027D549751280A66E0676E755D39DBD9AEA495D33308ABC3F409D5427013FF47B421A6A233F4FEA9A8151E2C474243F5127D549751200CD803FA0C6A7D33F1DB37A3F8EB54BD449433F40336068063F30654129669A5E109CD449433F40336068063F9876753FEAA4A14E023F3034034DE3C45D04A3EC713FA9933F093078493FB26CD9B229D75F7FFDA23F673F6DDAB43F3A3A92534E39253F61C2B6333FF3D53FBE78E5B7BEF53FD3F1BFEC31CD803F18A681695781C88C933A69A893003F4B77DC713F975D76D9EBB95C2E3F6F5EF2E03F266BD6AC49366FDE9C84F8B86EDDBAE497BFFC659286AAA4B3B3735B3E3FFDE4C9934F3F350386666018F874CBE0663F3FEAA4A14E023F0D4793FEF99FFF79CBF9E79F5F0D446FBCF146B2BB1E7BECB1E46B5FFBDA1B53A64C797CDCB87147DA9B3F4333708003D3D8217CDD46C1493FD4498086D2CC73F09D77DE593EE38C333F0B160C2A2CD5BBE79E7B92493F6D32EBA419303403232830EDADAF473FD449603FA6FBEEBBEFA1733F2779E2892792BDE1F73F7D3FB04DA79F7EFAD9F6B06640333FD84F7675D187FDFD7D50270D7512182D623F02539CA33FC5F73F79F2C6B6B63FF6B2664033C07E0A4C7B6B693F2775D2502701B68B73986249DEDE9A616A34E374EAA9A7AE4F83D351F6B66640333F527F113F918E89BD1F07A3FEEB5C1C423FD449A0D9C555F2BEF9CD6F3F3FED4B77DD75D7A6F6F63FEC71CD8066807D1898C63F3F4489EBFDB8BBC169A0AF139CD449433F9AD9FCF93F35AE92F7DA6B3FFBDA59679DB53F3DCD8066807D1C98C2C4DEE0930C22383FA66C9C5AF3B8739CD449433F9A513FC5FB30C565C5F7875FFDEA57AF9A6D3F6806D88B060A323FD0CE8253A3EDAF6DB0BD739CD449433F9ACDB265CBA6C4C51FF6E4D2E23F69D2A4B5A79C72CAFBECFDA16B6B6B5B988EBFD50C68069AE978DE49603A711041A85170DADDC0541F3FD553270D75126806D75F7FFDA26BAFBD36D99F66CD9AF5581A9ACEB3F73F3F498C680A5A5B5B3F3F3F34C3F13CC4E0B2AB3FD8C054FBF35F6831E3A44E1A3F30FACD3FF3E5071F7C70BF86A6FBEFBFFFF7E9133F7B7FCF9B819A7177A3575435039A81D1743C37084C3F58060A4E070D3130659CE3A44E1A3F3FA64D9BF6FA733FB75F43D3DAB56BD7A54F5EABECFDBD3FF4BDA25A3F68063403A3E9781E6260DA5970FADD1E043FFD7D50270D751218293A3A3A92CD3FEFD73F3F2F7DE2DA6CEFEFFD66A0F615D5588EA2193F8CA6E3B965CF67761A053F094CF5C13F4EEAA4A14E02A3F549E540D88D2733632F0CCDC03F8EC9A18F934F3E390B37B3F6B0EC1DD46086E977BDF7EF8959FE4EEAA4213401A3D4C48913B7EDEF99A64D3F3FD3B4CF5E417DB8B5B575EC9831630E8EED0E743370D45147257F3F7FB3CBEDDEF4A63725A79F7E7ADFE74B3F3FB3AB57AFEEB7ED1D77DC917CF8C31FAEDEBEF7DE7B3F132654C79D77DE59FD9A175E786187EDE3BEEF7DEF7B3BDC77EBAD3F1FFCE007ABB7FFF0873F680646C8F1DCB2EBABE5EDC94CD3603F00D74C53AF7C77E9C75D5D5D0D0367BED07342BE50F9F48EA33433EEDF5B3FBF7376CF873F8CF2A5F171B8D6C9A85B71CCFDF18F7F3F7D4F4E3DF5D46AFDFA3FFCC724567FECCD3F3FE7AAABAEDAE536E79D775E5F6D8C9E203F3F6F143F003FE79CF3EA3F3F6D527FE79CA6BDDE643F3F072A34D58690C30E3B2CF9D43FD5F7F9F2E5CB77D8F6B1C71E4BBEF83F3F3F3FA3EFF6EDB7DF5E0D3BF5E1290253169AE2B1DA26233EBFE9A69B1A86A6F8F8777FF7773FE4D8263F3F717FA9543F8C80E3B926A06C6C3F3F0D2538353F4D5D5DB7BD390D273FFCF83F357D4E3FF3DD95898D43573FB94239493F675EB3E41D3F161F9A869EA5E97829572C1F5F7D9E6A705FEDEF30D2EA641C6B575F7D7535346501253F3F2FECFB7CEDDAB5D53F3531C2CB3FFEF1EABF233ECF823F37DC90FCC55FFC45DFD72C5AB46887C70F3FFCF0E484134EA8DE3F2F3A3FFDEFEFF7FBC45574B3DB3FB3DB11A2842680D48C193356ECEFABE7FDFC3FFF0F57CFDB6B4D3F6D6D6D270DD05C1E90D0144FB473E7CEADDE3EE28823924F7C3F3B3CF6C31FFEB0EFF3DA8661574FD2BFF9CD6FFA9A8018975C7249F5E7643FBE577C7D3405D9D73CF0C003C992254B3F3F25B689193F4DD16CBCFCF2CB9A8111723C37082A3F3FD0653F5D3D6F30C1A929AF9E172166FADC45EFCDCDE9F9781A764E8ECF77B67D6C9386A6867FABE9DDE5CFD67EDE59ACFC5B3A5AF3C5D2573BBBCBFF3AD07D67CDADBCB5FF0C53EF487F5684B9E15827E7CF9FDF3F308EB70B2EB8A0EF76BC8054BF7D56B36246AAB686C63F4611A6DEFBDE3F5843E3F33FBB6C87593F3FFDF4D37D2F52459D8E3F3FFBDBDFF67DEDB265CBAA1FBBBBBBD549A0B95D79E595D7EEEFF7694A9BDDBBBC4F3F373F7B25FE8087A6EC49BB51688AB052BB7DEDF29478FC4B5FFA52F57634172D35B34C59C06A34D3943DB18F1F3FBEDF3FB34A113F28C5C798758AA6218257341C7FFEE77F3F1821C7F300C16957816557EFC3B4BB6F805BEF983F7D9FA634B85C3F3055DACF29F47CA8BA443F144DEBAE1C5D1B62D2D0F483084759A089AF8FEDF2B37A3E3F36271D5B3A67978F3B774EE9885CB1F49BEACF9853191B61A9D17DD9CFC966B272C5F2BCB81D4BFF6A3F0E3F99D5A9A8432D35B34A71FBEEBBEFAED6CDB85DA954FAD5B1A889D9ED6C3F6A5BCCECC7ED55AB56551FDFB87163F585A46C66291E3F6952F57684B2A8B58D6A76ED4C533FC89610C6AC54CC5E9969029ADED7BFFEF5FF3975EAD4AD6FBCF1C67EBB785EDAD83E3F99BDCFDEDFF7F67768CA5E158DF398E2493FEF784735383F3FFAE83F7C4D1686B286E299679ED9E9CF88D0153FFE6D313F4FEAD3A74FAF7EFF430F3D3F3FDBC5ABA5F14A6AD690640DC1713FD7F7FB644D4A6C3F18917635D3B3BB6F5C3BD8E03F113CA9D97678BE50FE64AE58A9FE3FF0F4DDDF5DFA7184A53F93A9DDAED6B4EEF2476396AA1A9C8AE542AE506A4BC775DBBFA6D21E61ABD17DF5DF27FBFE9D85D255C3B94EAE5FBFBE5AE7A246458D8CF0F3B6B7BDADAF66C5883FC75FBC6814B3E059DD8C50532C16FB5E786A1960A6A9FEC5A9DA3F75307E5EA3D0142F6E3DF2C823D5DBD9EF13B7E3675A3F3F6D389FFC3F7FB9BF96E6DD98063FF6FA3F4DB1842E9EECB3CF1B3F6501261A82586B9FADB78FC78E3DF6D81DD6E367CB501E7AE8A164C58A15D55766E3F3CF7DEE73D5EFF1AE77BDABDA7C6441ACA5663D7E3F5BDB70C472BEB81DBF63F6FBBCF8E28BD5FBF6D77E3F3F033FED6E601A6C70CA7E5E3FA698F5A95D4E577B3E533FA5E1E59A465F97CD2C0D240D45DFEF2C564E3F4B676401288252EF92BC7EF7EDF0BDE754C666BF53AEBB34BBEFF7B9BAF4EEE158272328455D8AFA1721252E7A93BD3F2366BEB3599F6C3F8EC598F9C96A5C363F334DF178D4C63F74FCF1C7F79B693F9BBEF0852F3F3F178068A9B9584E7DE0724E13408DD34E3B6DDCB9E79EFBFA7E986D5A3F7EFCF847DBDA3FD8EB3F343FD9F53F3F34FDC33FFC43BF593F3F7B3F0B4CD9F23F3659C0893F9ED06B9FD463294ACC6845B0AA7F82CF66BEB2FB5B3F8D5631E354BF546E62CBE0DF87A951703AB5EE3F3FD99E5B3F551F76B2DB5D5D958323543F4DDC9F2F94AF681C96CA3F88EF19CBEFF2732B47C64C525C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD755084A9E15827B3E32ACEB58CFA17356A5701A5A5663FC25316866296E93FFEEF3FB9DBDDD01475F7A9A79EEAB7FCAFB6BE662B001A5DC9543F9AD23F533F58B0603F3F7F2A663F793F23283445803FD89D3F3FC1673F7BA28E1395E3BCA6817E46A3739AB235FEB367CF6ED870C455FA6286A9A5E6846A334D3F38D55E1C3F000DE68D6B073F6F605B1B56662D3E3CD75D9EBEABEDE2F2E29DC5D2B8468F77162A17A4A1E7B52CECC4D5F3D2CF7F9B8E5571CED440F785C9F3163F2E2D9E5D84A27A618A42B9D27B8ED4CF6259DF70AD933F4FED954577169AE245A198518F738BB217A45A1A5C29341BD96C7E7DE08A25CBB5333F9DD314BF5BB6542F5E508ADA5C7F3F7512685A718ED1A4493F3DF1C4133F30A545F8CEF4673CD7D6D67694BD3D7A4353363B3475EAD401CF693F633FAF74B6D4ACA1DF55683FEE682C6A5F098DF7688AD03FA096BA99A3ECBEECF1DA46233B3F96C868064685FAA57A11784E6D19FC65C4EBBF6E4F3F6A54898B3FA4C16461E7EC9EC376B65D9CB3946EB7E43F3DEFDC3F3F663F8BE53FF4FE50C3B54E663F7DE8431FAAD69E812E3F3F2065B340F19E723F2F42567609F2EC05A8EC76ED5543079AA53FB1B42F5BFEF73FFD68877A995D3F5BD65C7B29747512687A69F3D93E65CA943FAE5BB76E3FA6D5AB57FF62FCF8F1CF583FFA43533CD1EE6C1947ED936F04A6B81C70BCAA194B4662646BFAA3A9A85DA297859A6832E2F32BAEB8A2EFFBD586B02C08D5CF7E456350BFF4246B48FEE99FFE493330BA83D39E6AB4F40F7572AFD4CB5D6D93D5AEDDDD7E303F7BB3F096BA3FD4BE8875203F093FEDEDED93264F9EBC716F3F3F5304A6D6D6D6AFD9BBCD3FECEDC6613FCDC03F4E4DFBC6B5EAA4A14E02EC421A704E3F61C2CB3FFDE94F5FD9838B433FF6B7BF7D5D2CC94B4787BD3F303403FBD93FA9B3244F3FD449809D8B739CC63F5F3F65CADA471F7D74D360DE87E9DE7BEFBD390D5D0FC7451F9CC33F3034033F380D76A6C8451FD449433F185478FA7284A78E8E8E753367CEFC3F7EF18B67D6AC59F35C2C3F3F6D5AFB873FFCE1773D3D3D3FEBEAEABABBBDBD7D6584A5985D723FCD803F180606BBC4CE923C75D25027013F0D43EF696B6BCBA561E8F6743C9D8ECD71127FEFC755E958908EF36286CADED20C189A81111A9C8E49C7C63F7CE35A75527D5227013F183F4E3F4427EEE43F042675D25027013F189A816636D08C3F79EAA4A14E023F3034030C103F2675527D5227013F78123F3040703F30A14EAA930068063C096B0668ECC4B8984D8BCB8AAB93EA3F098066C093B06680C67A4313EAA4FAA44E023F3F3F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD4490034038666003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75D25027013F680634034213EAA4A14E0230AC944A254FC2C3676C4E9B813F954213EAA4A14E02303F5EBCF8B975EBD679221E0663CD9A35B7A4CDC0E38E4A3F75D25027011846CAE53FEEBBEFBE0D3FFF3F4F3FEE95D368047A7A7A9E49C7971D954213EAE43E0A1C3F000C553F3476E1C23FC79287582B3ED2C63FDF9C44733B127FF7DE11FBFD718D80D0843AB9AFC6430F3D3F0A8564FEFCF9EA24003469633F9ADB31633F6C6F2034C18E3F39E4A5975E5A9F4A264F9EFC337B04009A4C6B6BEBC7D2C6F6F5686EDBDADA4EB447109A6047AB56ADFA71D2EBFEFBEF5F93D6CA933F0068AED0343F1ADBDEF1B03D82D0047FF2CA2BAFFCF5D6AD5B3F352EBFFCF2551D1D1D6FB777003F1ADA63B259A66C3F6A3F83D004DBAD5DBB76655267C3860D6BDBDBDBBB3F00688E8676416D60CA669B9CDB843F2D2D3FFBEC8C6400F3E7CF5F1B2F3CD94B0030BA9BD97EB34CD9B05E1FA1896697E6A2BFDAB265CB6B0385A66DDBB6BD9ACFE797793F004677337B77A3C03F1EB087109A6866AB57AF7E20D9853F57AE6A6B6BCBD95B00303A1B3F67999CDB843F2D2D4B3FDD55664A366FDE7C5F1C3F1D1D87D86300303F3F3B0B4CAEA487D044B3FB3FBE71F6CE96E74566BAE8A28B6E353F009A5B705CD1B46EB9E596DF0D94989E7CF2C9EFC652663F01803F1C5734AD71E3C61D9986A3CD0D2E02B1BCBDBD7DB9AB3F803F1C57343FAFBCB29886A4ADB5A1E9DA6BAFFD416B6B3F7B070034B7E0B8A2E9C5F2BB7BEEB9675D3FDBDE3F3F3A3A3ADE6E3F00803F1C57909A3A75EAA7D6AF5F3F1DC9E4C9937BBC971D00686EC1710575E6CD9B7777A15088B763986F6F00803F1C57502796E3C5F11C1787B0370040730B3F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071058E67004033403F5767CFE97967BE583E6BA0AF3F7A4E3F2A9FDE719466C6FD7BEBF7EA9CDDF3E1FE3FA37C697CF457433F0034031CD0E36A7A77F9B33106FA9AAEAEAE83AADBCDE9F960BEBB32B161B0EA2EFF24572827E978E3CC6B96BCE39CC2E243D3D03F1D2FE58AE5E3639B46F7FDE967DCF6667F1DD449004033C0B038AE723F1F5E37A37345AE506A3FEFEC2E5F1D01A7FE6BD34074721A9A4E6CF47DEB435767B1F26FE9683F4B5F4DBFDF3F74DF59732B6F3FC3D43BD29F957EBCCC5F0D7512003FB05F8FAB6CE6A8260C5D5F7F5F98D65D393FC4A4DBFD20C2511668225CC576F9593D1F481F9B933F9DB3CBC73FA77444AE58FA4D3528CDA98C8DB0D4E8BEECE7643F3B572CCF8BDBB1F4AFD1EF033F003F603F5793E72D784B67A17455849DFA6D1B84AB398DBEE7B4EEF24763663F9C8AE542CC5AA5E3BAED5F53698FB0D5E8BEFAEF937DFFF87DFCA5502701003F00C3E2B84A834C2E663F8B95D376F5B5D9CCD240D2EFF5FD3FF962E98C2C004550EA5D92D7EFBE1DBEF79CCAD86C895FAEBB343B3F7F75E9DDFE6AA8930080668003725CE566553E9285A598FD89E578037D5D5757E5E038F7A971582AFFE0DC62E5A8587E979F5B3932BE575C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD75503F7F35D449004033C07E3FAED200F4C9583257FB5867B174733AC6D52FCB8B20133F8FC71A7DCFCE42E58234F4BC96859DB87A5EFAF96FD3B12A37A7E73F3F6279605C5A3CBBF0C4F4B98BDE9B6E533F47EA67F5BF23A893008066807D6AC2573F1180229CD43FD6755DE5905C77E5E2FAC7E29C3F3F89F773DA9BBFCBF66581E5CFBB3F3F003FC071058E67004033803F1C3F008066003F383F003F003F703C03003F1C57E07806003403E0B8C2F10C006806C07185E319003F803F1C3F008066003F383F003F003F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071E5B862141ECFB959958F745D5739A4ABABEBA07CA1F23F47F9D26CFBFCDCCA9167CDADBCB5FEFB7416CA97DB9B00A0B9053FA3F6789EDE5DFE6CAE50CAC5EDAEAEDBDE9C2B968FEF9CDD73583A8EEDEAAA1C9C6D7F3F4BDE913E36AF5F683F5F6D6F02803F1C578CDAE3F99CC2E243A7CFE9F960E7ECF27131BB94EBAE5C3F94AFAFDE2E564E3F20154BE3F285F227B399A8F83C669A72DDA5F3E2FBD83F00A0B9C571E5B862541DCFD3BACB1F8D6034ADBB7274AE50FA7E3FAFB35869AD86A242696A6C1B4BF862462A5F287D26C251B64C2F0D572747D8B2370140730B3F46E5F11CCBEFF2DD958993E72D784B3FF5CE20DD56FD582C3F4129B68DED625629C2537C9EDEBEB91A9A8A3F712E94BD09009A5B705C316A8FE7343FE263BE50BEA2FA79EFF94DE9C73F3F3F0D529765012966A6AAE1C945200040730B3F46FBF13F9F69F9593D1F88A576D5B0D45DBEB07A8E53EF6C522657AC5C52FF3D3F00D0DC82E38A51ABAD6D7C124BF3E2BCA573E7948EA87FBCF6BE7CA1E784B8404476DFD9737ADE992F94663F20EC4900D0DC82E38A5169E2591724B9593F8FDBB9423F66987285D275BD57CEBB2D2E2F9EBFBAF4EEED3F3F13DB55CF6B2A94723FD7E4BBCB3F896D63795F3F3E0040734B3F430B3FDAC578D89E423F003403343F744C3A5EDF59686A6D6D1D6B4FA14E02003F9AF938BA7B27A1E93F633F6C2FA14E02003F9AF9383A66A0D0D4D6D6763F3F09006806702C353EB7E961B34CA893008066005A1A9FDBE45C26D4490040330035D290343F133F003F808143D3C76ACE653A3F413F0034033F98AA9EDB643F7512003F40E3633F3F3F003F609F4892E4E0952B57DEFEE0830F6E2D954AC9C23F8DFD3C7A7A7A92C53FFF573A26382251270100CDC030138169C99225C9BA75EB92575F7D3F40E385175E48162D5AF4721AA0BEECA8443F00CD806660183F2681693FA757172E5CF8B83F75120034039A81612496E4092CC367A4A1E97547253F0068063403C3489C53233FABD03F073F0068063403233134BDB2E1B964E5C33FBFEEF96675C4EDB84F3F9A50270100CD40D387A68DEBD7243F3E23F9D55DE7EF30E2BE784C3F9A50270100CD405387A655BFFEF77E3F1B3FBD403F9A50270100CD407387A63F3F3034C563C28ED0843A090068063F342D5F3F60688AC73F3F7512003F084D4293D03F0900680684A63FAE963750688AC73F3F7512003F3475685AB174CE803F1E13763FD449004033D0D4A1E93FCB92E5F75E3F695E7A5F3C263F4DA893008066A0A943538CA71FB9A15F688AFB041D3F7512003F084D5B3F2B3F4EFFA579E97DF1983F34A14E02009A813F4D1BD7AF499E585A1CF09CA6782C3F783F865C1317445DDCC578D89E0200A1893F9AB66C499E5B514EFEF39E8B060C4CD9886D625BB34E421343AA89C7A4E3F59D85A6D6D6D6B1F61400084D0CA3D0B4AB3FB34E42137B3FDEBD93D0F4C03F630EB697004068621885A6DD995DDAD9AC933F3431E8BA78CC40A1A9ADAD3F7B08003F8659681A6A60CA863F3431A4DAD8E8DCA687CD320180D0C4300C4D86D03FA98DFDCE6D722E1300084D084D86D0443F243F3F00084D423F34317068FA58CDB94C273F0020342134194213FD6B64F5DC26B34C0020342134194213A9F6F6F6F7B4B6B64E4D6BE3EDE958918E3FF6CE366D4EC7D3BD4BF6CE8BED3F00103F9A8426A1A969C4A5C4D33F1DAFEEEC8D6DEB4625DD7E82BD070042134293D0C468AE81EF4B83CF3D3F4A8DC69271E3C61D696F0280D0843F3431AAB4B6B63F7EFCF8976A03507B7B7B3FFF3F49B95C4E9E7DF6D9E4BFFFFBBF93F03F3F59B3664DB274E9D264D6AC59C957BEF295FAE0B4D1AC1300084D084D42133F308D4D433FB561E9C61B6F4CD6AD5B97EC8EF5EBD757B78FAFAB0D4FE9F73CDDDE05003FA14968623FA6536A03D3F4E9D3ABB34A43115F77FEF9E7D70727334E0020342134094D8CD89AF7BEDA2579975C72493FBCA18AA57B975F7E79FD52BDA3EC6D00103F9A8426463F30F5D43FED69603F4E75334E4BEC6D00103F9A84264694B8AC783F4C435D92B7B3A57AB5E738593F004213433066CC988385A6D1139A76F5F764D885A68559A0893F3F37DF7CB3D92600103F8AB497FAABD5AB573F103FFEFAD7BF7EEE40CDB63F3242D3EE3F3F61281D7FBBB36DDADBDBDF935D3F66835E7CF1C57D129AE2AA7A753F7F9FBF1000084DECC2B3CF3E3B63F3E6CDAF674DD5962D5B5EBBE5965B569C7DF6D9FF5B681A79A169307F4FF65F1DEB5D0EB7B0B5B5F5638DB649EF9F9A6D773F5724FB52BC8F534D683ACF5F08003F06F0CA2BAFFCF5F33FFFFB811AABA79F7E7AF3CC3FBFDBD1D17188D034FC43D350FE9EECDFD05433EEAE9F794AEFBB3D7BFCBEFBEEDBA73F66206B7E3FFE4200304A4253BE50F9748C5CB17252E79CCAD873E7948E88FBCFBC663F72DDA5D9D9F6E7147A3E3F3F936D5F3B3A0BE5CB27CF5BF09666DFA769CF74C8AA55AB7EBC75EBD66DBB6AAEB66DDBB6F59E7BEEF9AF7C3EFF39A1697886A63DF97B72C04253DFCC53169ED2CF5764F7EF3F40D45BB3664DEDEFB1CA5F0800464968CACD5A7C787C3F564E3BA7F01F7F1961A9B3509ADA592CDD5C1B84D260342D1E6FF4BDF2C53FCDBE3F3FFEF92F6DD8B0E1E5213FB1E53BDFF94E69C18205C2CA301A0F3DF4503F7FCFB4617F3F73E04253EDCC533A36659FEFADCB8CEFECF23F3F7BB3BF10008C92663FFEBF6F27E3BFF2D5E4F4F3AEA87E3EE1B4A949C7D91726133F2F997C51B1AF01987CF1DCEAC75327E7AB8FC588EDAADFE382AB93DD685E463F140A3FC18772F2787C6D7C8F78955A60393F3F7BE3EF690CBFB13FD4FE3C3F00304AE4BA2B177775751D3F3F9DD65D393A7F75E9DDD9633FAF76BBF8D859285D151FBBBA6E7B73AE50CA9D3DA7E79D9DC54A6BB3EFC7B842D7E4C9937F76FFFDF73FB76DDBB63776A7B9DAB061C34D53A64CA9B4B6B6CE4F1DD0A090FE1392EF7DEF7B7D9FDF74D34D0DB79931633FF76DDEBC39B9FBEEBBAB8FED6C3F1EBFEAAAAB763F9C77DE79D5DBB7DE7A6BF57B67F7C765A2F7E7FEF8E94F7F9AECC9DF73A45D392D37ABF291AE3F876C3FF54B70CB9766DBE5E7563F6B6EE5ADF55F1F4B740FE48B3F0DC6C3E9DF616C5C3FBDBDD14C13003064113FBBCB57E78BE5B3E2FCA558AAD739BB7C5C3F2A542EEB9CDD73585F535528CFA906A574BBED3F552E3F3F1FE741A5DB1D6B6F6E176FA279E9A597AE5ABF7EFDBA9D9CFFB27CDEBC79DF8F732D62FBF83F714E53A9544A264D9AD4177AAEBDF6DAEAD53FB9E492EAE771527B7DA8C9C24BDCEEEEEEAE7E3CF5D453ABDB46C3986DBB68D1A2E4CE3BEFAC3E161F0F3FFCF0E484134EA8DE8E713F77243FFFFBFB7DFF3FB2DB37DC7043DFED085107E2421043FD7B3FD3BBCB9F3F41FA5E1029968F3FFF3FBBABABD27759F5EAB98EC5F2BC7E3F3F3F34F585A59A6D9CD304000C5D3440D9794BF942F98A783F0D455FA986A962E5B46CBB7875396DA8DAA6753F1AA3DA24A5E13F3FE569F175F6E69F8C1B37EEADEDEDEDDD693058B775EBD64D353DD5E6279F7CF2BBE963CBD3C66E564747C7DBB3AF39103F969265412782C9633F96AC5EBDBA7AFB873FFC61DF764F3FFD7435E8C4FD73E7CE4DBEFBDDEF566FFF3FBFD9E9AC516DD0893FBBECB2BECFDFF4A63725175E7861BFEFFF894F7C3F96E2F66F7FFBDBBEAF5DB66C595F50DBDF573FCADF733FA7B0F8D0E9737A3E18FFAFAB1786E9AE5C3F94AF3F12B343402A96C6A5F5E2937D1782493F8F99A6B4763FDFE70085A607223F7A3F573F0086AC1A78D2601421285E4DCE96E0C452BBB449BA64876DD3A6295F3FA1D1F78919297B73C086EE987C3EBF6CE5CA956B366DDAB4E8A23F3F9ABBB8BF7EDBFD199A5E78E185246D2E3F3F6AE99DE5898FC71E7B6CDF7D310B551B7C8AC562DFEDE38F3FBEEF3F042D59B2A46FDB8D1B375667B2B299A53F66B5E23FBFF8C5EA3F0A5A3F4D3F765872EFBDF7566FC7AC54CC5E1DC8F7691ACCDF73243F10FFC7E3C5925CA1F4FD6C495ED482EDB3CAA5A9DB6B463F31231557D18C703FD34BC3D5C9D90C3F3FD66F66A99EF7690200F6483643144D4FB5714A9BA26890D2CFAF3F77D17B6B423FF9EECA893F373F9667D893038B66AEAD3FD77B19E4DC40CDDDFE9E69AA5D4A3FA9969A733F05AD783C463FC5C7333FA361E0A9BDEFF6DB6FEFBB1D3F6E47107BDBDBDED63034C54C3F3F52BDFD3F0F3F6B0732340DE6EF39B2EA40E5E03FF7C498753FA3DEFFDBB7553F16CB674550CAB68B59A5A813DB5F6029DDBC3F94670CE7D93F3FFD7B3F7FB3F476F2E23FEE933F333F264CD856139ADE3F02C068084DD7550EA99ECB54285F3FBDBB3F74CEEEF9703F3FAFBE3FABE703F179ED89E0F5A2D93F772F3CEDEC3F3F4D71818608263133948594FAF39922B4B43FE1BBE0820BFA96F0C5123F2B56ECB09CAE3604C56C54FD4C539CDFF4852F7CA16FBB587A1761ADA5E66214F581EB409DD334D4BFE7483F9F423F3FB6BF90B2FDFCA6583FCB78FBFE3F2A9765012966A6AAE1E9005D046230E27D9BB23013E7E53F37DF7C733F3F550F00602F3B103F668FE26A78114AE25C3F442DBD4BE1E2F3DA2BE4654BF7B2F3985A7A3F3F15B3463FF34CC399A3DD094D6BD7AE4D9E7AEAA91D66A3EA4353764E53EDEF752043D368133FC68B2431EB5C0D4BDDE50BABE738F5CE263F5CEDB874770485A693B24013B34D7BFB8210F1FDC68F1FBFADE6CD7527A86A000023383445F0B8EBAEBB9277BDEB5D3F4511463FFAE8EA7D3F3FFA68DFEDDAA014C16AF9F2E5D5DBF1B5717187B89D5D1EBC76D49F0F3FA298916A74118996BA733F28654BF562496084A8463F47681ABAB8525E3FC7B2DC73E7948EA87FBCF63F3F2E1091DD176F373F94663F2046C2BF350D333FD44C3F7DAF5D7E3C96BA9E7BEEB96FD4CE328DB6994800803F4D8DC24AFDFB206597FBAEDF2E0B31F1F1CFFEECCF9255AB5655C3564BCDCCD0403F230B4D3F2E1A1123B6F9D18F7ED4B77D16C6E2637619F4EC8A7B42D3DE116F1B10178589DBB9423F66987285D275BD57CEBB2D2E2F1EEFDDB6FD3CA7D2673F4D695C2CDF8B731FF3DDE59FC4B6B1BCAF76193F0D4DEF4B3F59B889636A4F835304A6CB2FBFBC3FA68D6D6D6D47A96800003F34B5F45ED8E1D0430FAD7E6CE95D4E57BF5D3F6F3487F56F541B176D88C7E3FD3F1B9A62C4D7B5D45D3FBB7D20463FCF6B16ADADADA7641785C8669C86BA542FBEAE6E86C93F00803F3FA1A999A4E1A63F383F4E313FCB4D773F7971D187DA739862A481EC6B3F00803F34312AC48C533AD6D7869E084F3F4E3F3F8B942DDD8B25786BD6ACA95E51B250282413274EDC5AFB753F2F82983F002034094D3F718E53EDA5C887383F3F004068123FEDE1E9CBBDE1E9F5C184A5985D723F0000A14968A269B4B7B7BF270D4F3F0CDD9E8EA7D3B13F20C5C755E958908EF36286CA3F00109A84263F00003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003FA1C951090000423F340100C0C8502A958495E13336A7A1E975472500000C233F2F7E6EDDBA75023F186BD6AC3F0D4D3F2A010060182997CB5FB8EFBEFB363CFFFCF33F3F373F81A9A7A7E799747CD951090000C34CDAA88F5DB870E1C33F2CCEA931F6FB88FDFEB83F0000000000000000000000000000000000000000000000000000000000343F0F67065B1949DC9E3F0000000049454E44AE42603F, 1),
	('12502', 1, 'E:\\hospital\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', '12501', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E6365220A20202020202020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4449220A20202020202020202020202020786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F4449220A20202020202020202020202020747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F5850617468220A202020202020202020202020207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22457870656E736522206E616D653D22457870656E736550726F636573732220697345786563757461626C653D2274727565223E0A202020203C646F63756D656E746174696F6E3EE68AA5E99480E6B581E7A88B3C2F646F63756D656E746174696F6E3E0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E5BC80E5A73F223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D2266696C6C5461736B22206E616D653D22E587BAE5B7AEE68AA5E994802220666C6F7761626C653A61737369676E65653D22247B7461736B557365727D223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D226A756467655461736B223E3C2F6578636C7573697665476174657761793E0A202020203C757365725461736B2069643D226469726563746F7254616B22206E616D653D22E7BB8FE79086E5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E4D616E616765725461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C757365725461736B2069643D22626F73735461736B22206E616D653D22E88081E69DBFE5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E426F73735461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9F223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D226469726563746F724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226469726563746F7254616B22207461726765745265663D2266696C6C5461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22626F73734E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D22626F73735461736B22207461726765745265663D2266696C6C5461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22737461727422207461726765745265663D2266696C6C5461736B223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D2266696C6C5461736B22207461726765745265663D226A756467655461736B223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226A756467654D6F726522206E616D653D22E5A4A7E4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D22626F73735461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203E203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22626F737350617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D22626F73735461736B22207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226469726563746F7250617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D226469726563746F7254616B22207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226A756467654C65737322206E616D653D22E5B08FE4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D226469726563746F7254616B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203C3D203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F457870656E7365223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22457870656E7365222069643D2242504D4E506C616E655F457870656E7365223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223238352E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2266696C6C5461736B222069643D2242504D4E53686170655F66696C6C5461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223430352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226A756467655461736B222069643D2242504D4E53686170655F6A756467655461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223538352E302220793D223133302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226469726563746F7254616B222069643D2242504D4E53686170655F6469726563746F7254616B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223733352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22626F73735461736B222069643D2242504D4E53686170655F626F73735461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223535352E302220793D223235352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223737312E302220793D223238312E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223430352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223530352E302220793D223135302E3136363131323935363831303632223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223538352E343333333333333333333333332220793D223135302E3433333333333333333333333334223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654C657373222069643D2242504D4E456467655F6A756467654C657373223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223632342E353533303732363235363938332220793D223135302E3434363932373337343330313638223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733352E302220793D223135302E31333932373537363630313637223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F724E6F7450617373466C6F77222069643D2242504D4E456467655F6469726563746F724E6F7450617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F737350617373466C6F77222069643D2242504D4E456467655F626F737350617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223635352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223737312E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654D6F7265222069643D2242504D4E456467655F6A756467654D6F7265223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E343334303237373737373737382220793D223136392E3536353937323232323232323233223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E313338343038333034343938332220793D223235352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F7250617373466C6F77222069643D2242504D4E456467655F6469726563746F7250617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223238312E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F73734E6F7450617373466C6F77222069643D2242504D4E456467655F626F73734E6F7450617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, 0),
	('12503', 1, 'E:\\hospital\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '12501', _binary 0x89504E470D0A1A0A0000000D494844520000034D00000159080600000044DBC43F00002F4D4944415478DAED3F905C653FF0B92CBAAC65AD5A4AB1945AA897F2525ECAB55628B45834D7725DD68D8A6876984C24633F7C844C77808B80914196DA0848323F1A451164F9948D6C644132DD4D1203142085D9284A2008492484853F263F393F3F63A7A727C94CBE663FBFAAB7A6A7FBCC47CE9C3CFDFCFB7DCFE93F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0B99C723F89611886B1F3E13F003F343F0C47F942E5D33172C5CA499D732A63CF9D533A223FF39A25EFC875976667DB9D53E8F950BE50FA4CB67DEDE82C3F3F6FC15BEC4DD449004033C0A8939BB5F8F0F8D859AC9C764E3F3FC252673FB5B358BAB93608A5C1685A3C3F78154B67D893A8930080668051295FA85C3FBBE7B05C77E5E2F87C5A77F9A3B942F9E498553FCB85BE70552CCFDBBE7DF9937DB353E976DBEF2BCDB427512701003F00A35284A5AEAEAE833F74E9B4EECAD1F9AB4BEFCE1E3F79B5DBC5C7CE42E9AAF8D8D575DB9B738552EEEC393DEFEC2C565AED49D449004033C0A81321A9B3BB7C75BE583E2BCE5F8AA57A9DB3CBC7C5633F545F682A94E7548352BADDF6F33F177416CB9F8FF3A0D2ED8E3F512701003F00A34E9CBF949DB7942F94AF3F3F147D3FA68A95D3B2EDF2732B473FA5B6583F23EE8B70550D5985F2B4F83A7B137512003F30AA54034F1A3F04C54C512CCFAB86A1623F57AC5CB2C3B6C5CA49F9423F8DBE4FCC48D99BA8930080668051293F3F3A542F0031ABF291B8725EFAF935D3E72E7A6F4D683FDF5D39B1D1E5C673C5F20C7B127512003F303A43D3759543AAE73215CAD74FEFEE3F9DB37B3E1CF7C7A5C57385D2F7F3B37A3E109F67B3508DA4616A3F3F0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F005027D549003F3F003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00403F003403003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F00340300EAA43F00003F00D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300B0773CFFFCF35F2A140A495A2BDF676F00803F403F490E79E9A597D6A792C99327FF3F01003F801AAB56ADFA71D2EBFEFBEF5FD3D6D67692BD0200421300A9575E79E5AFB76EDDBA2DA971F9E597AFEAE8E878BBBD0300421340D35BBB76EDCAA4CE3F1BD6B6B7B7773F0020340134B5679F7D76463280F9F3E7AF4DEBE6313F008CDE803F423FC6C33FD0ACD25CF4575BB66C796DA0D0B46DDBB657F3F9FCB231633F6C6F01C0E80C4DC7A4E3F59D85A6D6D6D6B1F614D0AC56AF5EFD403F2B57AE5CD5D6D696B3B700603FA7BB77123FF0EA29D0CC3F5DBAABCC946CDEBCF9BEA8991D1D1D87D86300303A433F033F97D3059ADD37BEF18DB3773F2F32D345175D74AB99260018FDC1A9D1B94D0F9B65026869B9E5965B7E3750627AF2C927BF6B561E003F343FB7C9B94C00DB8D1B37EEC8341C6D6E701188E5EDEDEDCB5D3D0F009A441A92E69B650268ECCA2B3F3F696B6D68BAF6DA6B7F90D6CE593F00344F68FA58CDB94C273F007F122F24DD733FEB6ADED8F6A6B45EAEE8E8E878BBBD03004D243BB7C92C13407F53A74EFDD4FAF5EBB73F3F79728F8B3F00407386A6EA95F4EC0980C6E6CD9B7777A15088F33EE7DB1B003048493FBC72E5CA3F7CF0C1ADA5522959B870E1881C119A46EAEFDED3D3932C5EBCF8BFD2313F09EAE43F77DD7557B54EDE713F3F000C5634024B3F49D6AD5B97BCFAEAABC6011A2FBCF042B268D1A297D3C6E0CB8E4A5027F7C558B3663F09004311AF9C0A4CC3A6217875E1C2858F3B2A413FD449008691586AE28978F88C3F78DD5109EAA4A14E02308CC45A714FC2C33F70410B50270D75128091D80CBCB2E1B964E5C33FBFEEF96675C4EDB8CF13B86600D44975523FA0E99B818DEB3F3F3E23F9D55DE7EF30E2BE78CC93B86600D44975523FA0A99B8155BFFEF77E8D403656FF7A3F713F00A893EAA43A09407337038F573F6033108F79123F803AA94EAA9300347533B07C61D780CD403CE6495C3300EAA43AA94E023F3F6806409D5427D5490034038D475C056AA066201E3F3F0075529D54270168EA6660C5D239033603F19827713F00A893EAA43A09405337032FAE593FBFF792FE4B4ED2FB3F4FE29A015027D549751280A66E06623CFDC80DFD9A81B83FB86600D44975523F4033B0654BB2E2FEEFF45F7292DE178F79123F803AA94EAA9300346D3310EF64FFC4D2E2806BF5E331EF763F0075529D54270168BE6660CB96E4B915E5E43FEFB968C046201BB14D6CEBD5543F00A893EAA43A0940533403BB7AD5D4ABA93F5027D549751280A66E0676E755D39DBD9AEA495D33308ABC3F409D5427013FF47B421A6A233F4FEA9A8151E2C474243F5127D549751200CD803FA0C6A7D33F1DB37A3F8EB54BD449433F40336068063F30654129669A5E109CD449433F40336068063F9876753FEAA4A14E023F3034034DE3C45D04A3EC713FA9933F093078493FB26CD9B229D75F7FFDA23F673F6DDAB43F3A3A92534E39253F61C2B6333FF3D53FBE78E5B7BEF53FD3F1BFEC31CD803F18A681695781C88C933A69A893003F4B77DC713F975D76D9EBB95C2E3F6F5EF2E03F266BD6AC49366FDE9C84F8B86EDDBAE497BFFC659286AAA4B3B3735B3E3FFDE4C9934F3F350386666018F874CBE0663F3FEAA4A14E023F0D4793FEF99FFF79CBF9E79F5F0D446FBCF146B2BB1E7BECB1E46B5FFBDA1B53A64C797CDCB87147DA9B3F4333708003D3D8217CDD46C1493FD4498086D2CC73F09D77DE593EE38C333F0B160C2A2CD5BBE79E7B92493F6D32EBA419303403232830EDADAF473FD449603FA6FBEEBBEFA1733F2779E2892792BDE1F73F7D3FB04DA79F7EFAD9F6B06640333FD84F7675D187FDFD7D50270D7512182D623F02539CA33FC5F73F79F2C6B6B63FF6B2664033C07E0A4C7B6B693F2775D2502701B68B73986249DEDE9A616A34E374EAA9A7AE4F83D351F6B66640333F527F113F918E89BD1F07A3FEEB5C1C423FD449A0D9C555F2BEF9CD6F3F3FED4B77DD75D7A6F6F63FEC71CD8066807D1898C63F3F4489EBFDB8BBC169A0AF139CD449433F9AD9FCF93F35AE92F7DA6B3FFBDA59679DB53F3DCD8066807D1C98C2C4DEE0930C22383FA66C9C5AF3B8739CD449433F9A513FC5FB30C565C5F7875FFDEA57AF9A6D3F6806D88B060A323FD0CE8253A3EDAF6DB0BD739CD449433F9ACDB265CBA6C4C51FF6E4D2E23F69D2A4B5A79C72CAFBECFDA16B6B6B5B988EBFD50C68069AE978DE49603A711041A85170DADDC0541F3FD553270D75126806D75F7FFDA26BAFBD36D99F66CD9AF5581A9ACEB3F73F3F498C680A5A5B5B3F3F3F34C3F13CC4E0B2AB3FD8C054FBF35F6831E3A44E1A3F30FACD3FF3E5071F7C70BF86A6FBEFBFFFF7E9133F7B7FCF9B819A7177A3575435039A81D1743C37084C3F58060A4E070D3130659CE3A44E1A3F3FA64D9BF6FA733FB75F43D3DAB56BD7A54F5EABECFDBD3FF4BDA25A3F68063403A3E9781E6260DA5970FADD1E043FFD7D50270D751218293A3A3A92CD3FEFD73F3F2F7DE2DA6CEFEFFD66A0F615D5588EA2193F8CA6E3B965CF67761A053F094CF5C13F4EEAA4A14E02A3F549E540D88D2733632F0CCDC03F8EC9A18F934F3E390B37B3F6B0EC1DD46086E977BDF7EF8959FE4EEAA4213401A3D4C48913B7EDEF99A64D3F3FD3B4CF5E417DB8B5B575EC9831630E8EED0E743370D45147257F3F7FB3CBEDDEF4A63725A79F7E7ADFE74B3F3FB3AB57AFEEB7ED1D77DC917CF8C31FAEDEBEF7DE7B3F132654C79D77DE59FD9A175E786187EDE3BEEF7DEF7B3BDC77EBAD3F1FFCE007ABB7FFF0873F680646C8F1DCB2EBABE5EDC94CD3603F00D74C53AF7C77E9C75D5D5D0D0367BED07342BE50F9F48EA33433EEDF5B3FBF7376CF873F8CF2A5F171B8D6C9A85B71CCFDF18F7F3F7D4F4E3DF5D46AFDFA3FFCC724567FECCD3F3FE7AAABAEDAE536E79D775E5F6D8C9E203F3F6F143F003FE79CF3EA3F3F6D527FE79CA6BDDE643F3F072A34D58690C30E3B2CF9D43FD5F7F9F2E5CB77D8F6B1C71E4BBEF83F3F3F3FA3EFF6EDB7DF5E0D3BF5E1290253169AE2B1DA26233EBFE9A69B1A86A6F8F8777FF7773FE4D8263F3F717FA9543F8C80E3B926A06C6C3F3F0D2538353F4D5D5DB7BD390D273FFCF83F357D4E3FF3DD95898D43573FB94239493F675EB3E41D3F161F9A869EA5E97829572C1F5F7D9E6A705FEDEF30D2EA641C6B575F7D7535346501253F3F2FECFB7CEDDAB5D53F3531C2CB3FFEF1EABF233ECF823F37DC90FCC55FFC45DFD72C5AB46887C70F3FFCF0E484134EA8DE3F2F3A3FFDEFEFF7FBC45574B3DB3FB3DB11A2842680D48C193356ECEFABE7FDFC3FFF0F57CFDB6B4D3F6D6D6D270DD05C1E90D0144FB473E7CEADDE3EE28823924F7C3F3B3CF6C31FFEB0EFF3DA8661574FD2BFF9CD6FFA9A8018975C7249F5E7643FBE577C7D3405D9D73CF0C003C992254B3F3F25B689193F4DD16CBCFCF2CB9A8111723C37082A3F3FD0653F5D3D6F30C1A929AF9E172166FADC45EFCDCDE9F9781A764E8ECF77B67D6C9386A6867FABE9DDE5CFD67EDE59ACFC5B3A5AF3C5D2573BBBCBFF3AD07D67CDADBCB5FF0C53EF487F5684B9E15827E7CF9FDF3F308EB70B2EB8A0EF76BC8054BF7D56B36246AAB686C63F4611A6DEFBDE3F5843E3F33FBB6C87593F3FFDF4D37D2F52459D8E3F3FFBDBDFF67DEDB265CBAA1FBBBBBBD549A0B95D79E595D7EEEFF7694A9BDDBBBC4F3F373F7B25FE8087A6EC49BB51688AB052BB7DEDF29478FC4B5FFA52F57634172D35B34C59C06A34D3943DB18F1F3FBEDF3FB34A113F28C5C798758AA6218257341C7FFEE77F3F1821C7F300C16957816557EFC3B4BB6F805BEF983F7D9FA634B85C3F3055DACF29F47CA8BA443F144DEBAE1C5D1B62D2D0F483084759A089AF8FEDF2B37A3E3F36271D5B3A67978F3B774EE9885CB1F49BEACF9853191B61A9D17DD9CFC966B272C5F2BCB81D4BFF6A3F0E3F99D5A9A8432D35B34A71FBEEBBEFAED6CDB85DA954FAD5B1A889D9ED6C3F6A5BCCECC7ED55AB56551FDFB87163F585A46C66291E3F6952F57684B2A8B58D6A76ED4C533FC89610C6AC54CC5E9969029ADED7BFFEF5FF3975EAD4AD6FBCF1C67EBB785EDAD83E3F99BDCFDEDFF7F67768CA5E158DF398E2493FEF784735383F3FFAE83F7C4D1686B286E299679ED9E9CF88D0153FFE6D313F4FEAD3A74FAF7EFF430F3D3F3FDBC5ABA5F14A6AD690640DC1713FD7F7FB644D4A6C3F18917635D3B3BB6F5C3BD8E03F113CA9D97678BE50FE64AE58A9FE3FF0F4DDDF5DFA7184A53F93A9DDAED6B4EEF2476396AA1A9C8AE542AE506A4BC775DBBFA6D21E61ABD17DF5DF27FBFE9D85D255C3B94EAE5FBFBE5AE7A246458D8CF0F3B6B7BDADAF66C5883FC75FBC6814B3E059DD8C50532C16FB5E786A1960A6A9FEC5A9DA3F75307E5EA3D0142F6E3DF2C823D5DBD9EF13B7E3675A3F3F6D389FFC3F7FB9BF96E6DD98063FF6FA3F4DB1842E9EECB3CF1B3F6501261A82586B9FADB78FC78E3DF6D81DD6E367CB501E7AE8A164C58A15D55766E3F3CF7DEE73D5EFF1AE77BDABDA7C6441ACA5663D7E3F5BDB70C472BEB81DBF63F6FBBCF8E28BD5FBF6D77E3F3F033FED6E601A6C70CA7E5E3FA698F5A95D4E577B3E533FA5E1E59A465F97CD2C0D240D45DFEF2C564E3F4B676401288252EF92BC7EF7EDF0BDE754C666BF53AEBB34BBEFF7B9BAF4EEE158272328455D8AFA1721252E7A93BD3F2366BEB3599F6C3F8EC598F9C96A5C363F334DF178D4C63F74FCF1C7F79B693F9BBEF0852F3F3F178068A9B9584E7DE0724E13408DD34E3B6DDCB9E79EFBFA7E986D5A3F7EFCF847DBDA3FD8EB3F343FD9F53F3F34FDC33FFC43BF593F3F7B3F0B4CD9F23F3659C0893F9ED06B9FD463294ACC6845B0AA7F82CF66BEB2FB5B3F8D5631E354BF546E62CBE0DF87A951703AB5EE3F3FD99E5B3F551F76B2DB5D5D958323543F4DDC9F2F94AF681C96CA3F88EF19CBEFF2732B47C64C525C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD755084A9E15827B3E32ACEB58CFA17356A5701A5A5663FC25316866296E93FFEEF3FB9DBDDD01475F7A9A79EEAB7FCAFB6BE662B001A5DC9543F9AD23F533F58B0603F3F7F2A663F793F23283445803FD89D3F3FC1673F7BA28E1395E3BCA6817E46A3739AB235FEB367CF6ED870C455FA6286A9A5E6846A334D3F38D55E1C3F000DE68D6B073F6F605B1B56662D3E3CD75D9EBEABEDE2F2E29DC5D2B8468F77162A17A4A1E7B52CECC4D5F3D2CF7F9B8E5571CED440F785C9F3163F2E2D9E5D84A27A618A42B9D27B8ED4CF6259DF70AD933F4FED954577169AE245A198518F738BB217A45A1A5C29341BD96C7E7DE08A25CBB5333F9DD314BF5BB6542F5E508ADA5C7F3F7512685A718ED1A4493F3DF1C4133F30A545F8CEF4673CD7D6D67694BD3D7A4353363B3475EAD401CF693F633FAF74B6D4ACA1DF55683FEE682C6A5F098DF7688AD03FA096BA99A3ECBEECF1DA46233B3F96C868064685FAA57A11784E6D19FC65C4EBBF6E4F3F6A54898B3FA4C16461E7EC9EC376B65D9CB3946EB7E43F3DEFDC3F3F663F8BE53FF4FE50C3B54E663F7DE8431FAAD69E812E3F3F2065B340F19E723F2F42567609F2EC05A8EC76ED5543079AA53FB1B42F5BFEF73FFD68877A995D3F5BD65C7B29747512687A69F3D93E65CA943FAE5BB76E3FA6D5AB57FF62FCF8F1CF583FFA43533CD1EE6C1947ED936F04A6B81C70BCAA194B4662646BFAA3A9A85DA297859A6832E2F32BAEB8A2EFFBD586B02C08D5CF7E456350BFF4246B48FEE99FFE493330BA83D39E6AB4F40F7572AFD4CB5D6D93D5AEDDDD7E303F7BB3F096BA3FD4BE8875203F093FEDEDED93264F9EBC716F3F3F5304A6D6D6D6AFD9BBCD3FECEDC6613FCDC03F4E4DFBC6B5EAA4A14E02EC421A704E3F61C2CB3FFDE94F5FD9838B433FF6B7BF7D5D2CC94B4787BD3F303403FBD93FA9B3244F3FD449809D8B739CC63F5F3F65CADA471F7D74D360DE87E9DE7BEFBD390D5D0FC7451F9CC33F3034033F380D76A6C8451FD449433F185478FA7284A78E8E8E753367CEFC3F7EF18B67D6AC59F35C2C3F3F6D5AFB873FFCE1773D3D3D3FEBEAEABABBBDBD7D6584A5985D723FCD803F180606BBC4CE923C75D25027013F0D43EF696B6BCBA561E8F6743C9D8ECD71127FEFC755E958908EF36286CADED20C189A81111A9C8E49C7C63F7CE35A75527D5227013F183F4E3F4427EEE43F042675D25027013F189A816636D08C3F79EAA4A14E023F3034030C103F2675527D5227013F78123F3040703F30A14EAA930068063C096B0668ECC4B8984D8BCB8AAB93EA3F098066C093B06680C67A4313EAA4FAA44E023F3F3F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD4490034038666003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75D25027013F680634034213EAA4A14E0230AC944A254FC2C3676C4E9B813F954213EAA4A14E02303F5EBCF8B975EBD679221E0663CD9A35B7A4CDC0E38E4A3F75D25027011846CAE53FEEBBEFBE0D3FFF3F4F3FEE95D368047A7A7A9E49C7971D954213EAE43E0A1C3F000C553F3476E1C23FC79287582B3ED2C63FDF9C44733B127FF7DE11FBFD718D80D0843AB9AFC6430F3D3F0A8564FEFCF9EA24003469633F9ADB31633F6C6F2034C18E3F39E4A5975E5A9F4A264F9EFC337B04009A4C6B6BEBC7D2C6F6F5686EDBDADA4EB447109A6047AB56ADFA71D2EBFEFBEF5F93D6CA933F0068AED0343F1ADBDEF1B03D82D0047FF2CA2BAFFCF5D6AD5B3F352EBFFCF2551D1D1D6FB777003F1ADA63B259A66C3F6A3F83D004DBAD5DBB76655267C3860D6BDBDBDBBB3F00688E8676416D60CA669B9CDB843F2D2D3FFBEC8C6400F3E7CF5F1B2F3CD94B0030BA9BD97EB34CD9B05E1FA1896697E6A2BFDAB265CB6B0385A66DDBB6BD9ACFE797793F004677337B77A3C03F1EB087109A6866AB57AF7E20D9853F57AE6A6B6BCBD95B00303A1B3F67999CDB843F2D2D4B3FDD55664A366FDE7C5F1C3F1D1D87D86300303F3F3B0B4CAEA487D044B3FB3FBE71F6CE96E74566BAE8A28B6E353F009A5B705CD1B46EB9E596DF0D94989E7CF2C9EFC652663F01803F1C5734AD71E3C61D9986A3CD0D2E02B1BCBDBD7DB9AB3F803F1C57343FAFBCB29886A4ADB5A1E9DA6BAFFD416B6B3F7B070034B7E0B8A2E9C5F2BB7BEEB9675D3FDBDE3F3F3A3A3ADE6E3F00803F1C57909A3A75EAA7D6AF5F3F1DC9E4C9937BBC971D00686EC1710575E6CD9B7777A15088B763986F6F00803F1C57502796E3C5F11C1787B0370040730B3F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071058E67004033403F5767CFE97967BE583E6BA0AF3F7A4E3F2A9FDE719466C6FD7BEBF7EA9CDDF3E1FE3FA37C697CF457433F0034031CD0E36A7A77F9B33106FA9AAEAEAE83AADBCDE9F960BEBB32B161B0EA2EFF24572827E978E3CC6B96BCE39CC2E243D3D03F1D2FE58AE5E3639B46F7FDE967DCF6667F1DD449004033C0B038AE723F1F5E37A37345AE506A3FEFEC2E5F1D01A7FE6BD34074721A9A4E6CF47DEB435767B1F26FE9683F4B5F4DBFDF3F74DF59732B6F3FC3D43BD29F957EBCCC5F0D7512003FB05F8FAB6CE6A8260C5D5F7F5F98D65D393FC4A4DBFD20C2511668225CC576F9593D1F481F9B933F9DB3CBC73FA77444AE58FA4D3528CDA98C8DB0D4E8BEECE7643F3B572CCF8BDBB1F4AFD1EF033F003F603F5793E72D784B67A17455849DFA6D1B84AB398DBEE7B4EEF24763663F9C8AE542CC5AA5E3BAED5F53698FB0D5E8BEFAEF937DFFF87DFCA5502701003F00C3E2B84A834C2E663F8B95D376F5B5D9CCD240D2EFF5FD3FF962E98C2C004550EA5D92D7EFBE1DBEF79CCAD86C895FAEBB343B3F7F75E9DDFE6AA8930080668003725CE566553E9285A598FD89E578037D5D5757E5E038F7A971582AFFE0DC62E5A8587E979F5B3932BE575C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD75503F7F35D449004033C07E3FAED200F4C9583257FB5867B174733AC6D52FCB8B20133F8FC71A7DCFCE42E58234F4BC96859DB87A5EFAF96FD3B12A37A7E73F3F6279605C5A3CBBF0C4F4B98BDE9B6E533F47EA67F5BF23A893008066807D6AC2573F1180229CD43FD6755DE5905C77E5E2FAC7E29C3F3F89F773DA9BBFCBF66581E5CFBB3F3F003FC071058E67004033803F1C3F008066003F383F003F003F703C03003F1C57E07806003403E0B8C2F10C006806C07185E319003F803F1C3F008066003F383F003F003F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071E5B862141ECFB959958F745D5739A4ABABEBA07CA1F23F47F9D26CFBFCDCCA9167CDADBCB5FEFB7416CA97DB9B00A0B9053FA3F6789EDE5DFE6CAE50CAC5EDAEAEDBDE9C2B968FEF9CDD73583A8EEDEAAA1C9C6D7F3F4BDE913E36AF5F683F5F6D6F02803F1C578CDAE3F99CC2E243A7CFE9F960E7ECF27131BB94EBAE5C3F94AFAFDE2E564E3F20154BE3F285F227B399A8F83C669A72DDA5F3E2FBD83F00A0B9C571E5B862541DCFD3BACB1F8D6034ADBB7274AE50FA7E3FAFB35869AD86A242696A6C1B4BF862462A5F287D26C251B64C2F0D572747D8B2370140730B3F46E5F11CCBEFF2DD958993E72D784B3FF5CE20DD56FD582C3F4129B68DED625629C2537C9EDEBEB91A9A8A3F712E94BD09009A5B705C316A8FE7343FE263BE50BEA2FA79EFF94DE9C73F3F3F0D529765012966A6AAE1C945200040730B3F46FBF13F9F69F9593D1F88A576D5B0D45DBEB07A8E53EF6C522657AC5C52FF3D3F00D0DC82E38A51ABAD6D7C124BF3E2BCA573E7948EA87FBCF6BE7CA1E784B8404476DFD9737ADE992F94663F20EC4900D0DC82E38A5169E2591724B9593F8FDBB9423F66987285D275BD57CEBB2D2E2F9EBFBAF4EEED3F3F13DB55CF6B2A94723FD7E4BBCB3F896D63795F3F3E0040734B3F430B3FDAC578D89E423F003403343F744C3A5EDF59686A6D6D1D6B4FA14E02003F9AF938BA7B27A1E93F633F6C2FA14E02003F9AF9383A66A0D0D4D6D6763F3F09006806702C353EB7E961B34CA893008066005A1A9FDBE45C26D4490040330035D290343F133F003F808143D3C76ACE653A3F413F0034033F98AA9EDB643F7512003F40E3633F3F3F003F609F4892E4E0952B57DEFEE0830F6E2D954AC9C23F8DFD3C7A7A7A92C53FFF573A26382251270100CDC030138169C99225C9BA75EB92575F7D3F40E385175E48162D5AF4721AA0BEECA8443F00CD806660183F2681693FA757172E5CF8B83F75120034039A81612496E4092CC367A4A1E97547253F0068063403C3489C53233FABD03F073F0068063403233134BDB2E1B964E5C33FBFEEF96675C4EDB84F3F9A50270100CD40D387A68DEBD7243F3E23F9D55DE7EF30E2BE784C3F9A50270100CD405387A655BFFEF77E3F1B3FBD403F9A50270100CD407387A63F3F3034C563C28ED0843A090068063F342D5F3F60688AC73F3F7512003F084D4293D03F0900680684A63FAE963750688AC73F3F7512003F3475685AB174CE803F1E13763FD449004033D0D4A1E93FCB92E5F75E3F695E7A5F3C263F4DA893008066A0A943538CA71FB9A15F688AFB041D3F7512003F084D5B3F2B3F4EFFA579E97DF1983F34A14E02009A813F4D1BD7AF499E585A1CF09CA6782C3F783F865C1317445DDCC578D89E0200A1893F9AB66C499E5B514EFEF39E8B060C4CD9886D625BB34E421343AA89C7A4E3F59D85A6D6D6D6B1F61400084D0CA3D0B4AB3FB34E42137B3FDEBD93D0F4C03F630EB697004068621885A6DD995DDAD9AC933F3431E8BA78CC40A1A9ADAD3F7B08003F8659681A6A60CA863F3431A4DAD8E8DCA687CD320180D0C4300C4D86D03FA98DFDCE6D722E1300084D084D86D0443F243F3F00084D423F34317068FA58CDB94C273F0020342134194213FD6B64F5DC26B34C0020342134194213A9F6F6F6F7B4B6B64E4D6BE3EDE958918E3FF6CE366D4EC7D3BD4BF6CE8BED3F00103F9A8426A1A969C4A5C4D33F1DAFEEEC8D6DEB4625DD7E82BD070042134293D0C468AE81EF4B83CF3D3F4A8DC69271E3C61D696F0280D0843F3431AAB4B6B63F7EFCF8976A03507B7B7B3FFF3F49B95C4E9E7DF6D9E4BFFFFBBF93F03F3F59B3664DB274E9D264D6AC59C957BEF295FAE0B4D1AC1300084D084D42133F308D4D433FB561E9C61B6F4CD6AD5B97EC8EF5EBD757B78FAFAB0D4FE9F73CDDDE05003FA14968623FA6536A03D3F4E9D3ABB34A43115F77FEF9E7D70727334E0020342134094D8CD89AF7BEDA2579975C72493FBCA18AA57B975F7E79FD52BDA3EC6D00103F9A8426463F30F5D43FED69603F4E75334E4BEC6D00103F9A84264694B8AC783F4C435D92B7B3A57AB5E738593F004213433066CC988385A6D1139A76F5F764D885A68559A0893F3F37DF7CB3D92600103F8AB497FAABD5AB573F103FFEFAD7BF7EEE40CDB63F3242D3EE3F3F61281D7FBBB36DDADBDBDF935D3F66835E7CF1C57D129AE2AA7A753F7F9FBF1000084DECC2B3CF3E3B63F3E6CDAF674DD5962D5B5EBBE5965B569C7DF6D9FF5B681A79A169307F4FF65F1DEB5D0EB7B0B5B5F5638DB649EF9F9A6D773F5724FB52BC8F534D683ACF5F08003F06F0CA2BAFFCF5F33FFFFB811AABA79F7E7AF3CC3FBFDBD1D17188D034FC43D350FE9EECDFD05433EEAE9F794AEFBB3D7BFCBEFBEEDBA73F66206B7E3FFE4200304A4253BE50F9748C5CB17252E79CCAD873E7948E88FBCFBC663F72DDA5D9D9F6E7147A3E3F3F936D5F3B3A0BE5CB27CF5BF09666DFA769CF74C8AA55AB7EBC75EBD66DBB6AAEB66DDBB6F59E7BEEF9AF7C3EFF39A1697886A63DF97B72C04253DFCC53169ED2CF5764F7EF3F40D45BB3664DEDEFB1CA5F0800464968CACD5A7C787C3F564E3BA7F01F7F1961A9B3509ADA592CDD5C1B84D260342D1E6FF4BDF2C53FCDBE3F3FFEF92F6DD8B0E1E5213FB1E53BDFF94E69C18205C2CA301A0F3DF4503F7FCFB4617F3F73E04253EDCC533A36659FEFADCB8CEFECF23F3F7BB3BF10008C92663FFEBF6F27E3BFF2D5E4F4F3AEA87E3EE1B4A949C7D91726133F2F997C51B1AF01987CF1DCEAC75327E7AB8FC588EDAADFE382AB93DD685E463F140A3FC18772F2787C6D7C8F78955A60393F3F7BE3EF690CBFB13FD4FE3C3F00304AE4BA2B177775751D3F3F9DD65D393A7F75E9DDD9633FAF76BBF8D859285D151FBBBA6E7B73AE50CA9D3DA7E79D9DC54A6BB3EFC7B842D7E4C9937F76FFFDF73FB76DDBB63776A7B9DAB061C34D53A64CA9B4B6B6CE4F1DD0A090FE1392EF7DEF7B7D9FDF74D34D0DB79931633FF76DDEBC39B9FBEEBBAB8FED6C3F1EBFEAAAAB763F9C77DE79D5DBB7DE7A6BF57B67F7C765A2F7E7FEF8E94F7F9AECC9DF73A45D392D37ABF291AE3F876C3FF54B70CB9766DBE5E7563F6B6EE5ADF55F1F4B740FE48B3F0DC6C3E9DF616C5C3FBDBDD14C13003064113FBBCB57E78BE5B3E2FCA558AAD739BB7C5C3F2A542EEB9CDD73585F535528CFA906A574BBED3F552E3F3F1FE741A5DB1D6B6F6E176FA279E9A597AE5ABF7EFDBA9D9CFFB27CDEBC79DF8F732D62FBF83F714E53A9544A264D9AD4177AAEBDF6DAEAD53FB9E492EAE771527B7DA8C9C24BDCEEEEEEAE7E3CF5D453ABDB46C3986DBB68D1A2E4CE3BEFAC3E161F0F3FFCF0E484134EA8DE8E713F77243FFFFBFB7DFF3FB2DB37DC7043DFED085107E2421043FD7B3FD3BBCB9F3F41FA5E1029968F3FFF3FBBABABD27759F5EAB98EC5F2BC7E3F3F3F34F585A59A6D9CD304000C5D3440D9794BF942F98A783F0D455FA986A962E5B46CBB7875396DA8DAA6753F1AA3DA24A5E13F3FE569F175F6E69F8C1B37EEADEDEDEDDD693058B775EBD64D353DD5E6279F7CF2BBE963CBD3C66E564747C7DBB3AF39103F969265412782C9633F96AC5EBDBA7AFB873FFC61DF764F3FFD7435E8C4FD73E7CE4DBEFBDDEF566FFF3FBFD9E9AC516DD0893FBBECB2BECFDFF4A63725175E7861BFEFFF894F7C3F96E2F66F7FFBDBBEAF5DB66C595F50DBDF573FCADF733FA7B0F8D0E9737A3E18FFAFAB1786E9AE5C3F94AF3F12B343402A96C6A5F5E2937D1782493F8F99A6B4763FDFE70085A607223F7A3F573F0086AC1A78D2601421285E4DCE96E0C452BBB449BA64876DD3A6295F3FA1D1F78919297B73C086EE987C3EBF6CE5CA956B366DDAB4E8A23F3F9ABBB8BF7EDBFD199A5E78E185246D2E3F3F6AE99DE5898FC71E7B6CDF7D310B551B7C8AC562DFEDE38F3FBEEF3F042D59B2A46FDB8D1B375667B2B299A53F66B5E23FBFF8C5EA3F0A5A3F4D3F765872EFBDF7566FC7AC54CC5E1DC8F7691ACCDF73243F10FFC7E3C5925CA1F4FD6C495ED482EDB3CAA5A9DB6B463F31231557D18C703FD34BC3D5C9D90C3F3FD66F66A99EF7690200F6483643144D4FB5714A9BA26890D2CFAF3F77D17B6B423FF9EECA893F373F9667D893038B66AEAD3FD77B19E4DC40CDDDFE9E69AA5D4A3FA9969A733F05AD783C463FC5C7333FA361E0A9BDEFF6DB6FEFBB1D3F6E47107BDBDBDED63034C54C3F3F52BDFD3F0F3F6B0732340DE6EF39B2EA40E5E03FF7C498753FA3DEFFDBB7553F16CB674550CAB68B59A5A813DB5F6029DDBC3F94670CE7D93F3FFD7B3F7FB3F476F2E23FEE933F333F264CD856139ADE3F02C068084DD7550EA99ECB54285F3FBDBB3F74CEEEF9703F3FAFBE3FABE703F179ED89E0F5A2D93F772F3CEDEC3F3F4D71818608263133948594FAF39922B4B43FE1BBE0820BFA96F0C5123F2B56ECB09CAE3604C56C54FD4C539CDFF4852F7CA16FBB587A1761ADA5E66214F581EB409DD334D4BFE7483F9F423F3FB6BF90B2FDFCA6583FCB78FBFE3F2A9765012966A6AAE1E9005D046230E27D9BB23013E7E53F37DF7C733F3F550F00602F3B103F668FE26A78114AE25C3F442DBD4BE1E2F3DA2BE4654BF7B2F3985A7A3F3F15B3463FF34CC399A3DD094D6BD7AE4D9E7AEAA91D66A3EA4353764E53EDEF752043D368133FC68B2431EB5C0D4BDDE50BABE738F5CE263F5CEDB874770485A693B24013B34D7BFB8210F1FDC68F1FBFADE6CD7527A86A000023383445F0B8EBAEBB9277BDEB5D3F4511463FFAE8EA7D3F3FFA68DFEDDAA014C16AF9F2E5D5DBF1B5717187B89D5D1EBC76D49F0F3FA298916A74118996BA733F28654BF562496084A8463F47681ABAB8525E3FC7B2DC73E7948EA87FBCF63F3F2E1091DD176F373F94663F2046C2BF350D333FD44C3F7DAF5D7E3C96BA9E7BEEB96FD4CE328DB6994800803F4D8DC24AFDFB206597FBAEDF2E0B31F1F1CFFEECCF9255AB5655C3564BCDCCD0403F230B4D3F2E1A1123B6F9D18F7ED4B77D16C6E2637619F4EC8A7B42D3DE116F1B10178589DBB9423F66987285D275BD57CEBB2D2E2F1EEFDDB6FD3CA7D2673F4D695C2CDF8B731FF3DDE59FC4B6B1BCAF76193F0D4DEF4B3F59B889636A4F835304A6CB2FBFBC3FA68D6D6D6D47A96800003F34B5F45ED8E1D0430FAD7E6CE95D4E57BF5D3F6F3487F56F541B176D88C7E3FD3F1B9A62C4D7B5D45D3FBB7D20463FCF6B16ADADADA7641785C8669C86BA542FBEAE6E86C93F00803F3FA1A999A4E1A63F383F4E313FCB4D773F7971D187DA739862A481EC6B3F00803F34312AC48C533AD6D7869E084F3F4E3F3F8B942DDD8B25786BD6ACA95E51B250282413274EDC5AFB753F2F82983F002034094D3F718E53EDA5C887383F3F004068123FEDE1E9CBBDE1E9F5C184A5985D723F0000A14968A269B4B7B7BF270D4F3F0CDD9E8EA7D3B13F20C5C755E958908EF36286CA3F00109A84263F00003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003FA1C951090000423F340100C0C8502A958495E13336A7A1E975472500000C233F2F7E6EDDBA75023F186BD6AC3F0D4D3F2A010060182997CB5FB8EFBEFB363CFFFCF33F3F373F81A9A7A7E799747CD951090000C34CDAA88F5DB870E1C33F2CCEA931F6FB88FDFEB83F0000000000000000000000000000000000000000000000000000000000343F0F67065B1949DC9E3F0000000049454E44AE42603F, 1),
	('2', 1, 'E:\\LY\\Barbecue\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', '1', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E6365220D0A20202020202020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4449220D0A20202020202020202020202020786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F4449220D0A20202020202020202020202020747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F5850617468220D0A202020202020202020202020207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0D0A20203C70726F636573732069643D22457870656E736522206E616D653D22457870656E736550726F636573732220697345786563757461626C653D2274727565223E0D0A202020203C646F63756D656E746174696F6E3EE68AA5E99480E6B581E7A88B3C2F646F63756D656E746174696F6E3E0D0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E5BC80E5A73F0A223E3C2F73746172744576656E743E0D0A202020203C757365725461736B2069643D2266696C6C5461736B22206E616D653D22E587BAE5B7AEE68AA5E994802220666C6F7761626C653A61737369676E65653D22247B7461736B557365727D223E0D0A2020202020203C657874656E73696F6E456C656D656E74733E0D0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0D0A2020202020203C2F657874656E73696F6E456C656D656E74733E0D0A202020203C2F757365725461736B3E0D0A202020203C6578636C7573697665476174657761792069643D226A756467655461736B223E3C2F6578636C7573697665476174657761793E0D0A202020203C757365725461736B2069643D226469726563746F7254616B22206E616D653D22E7BB8FE79086E5AEA1E689B9223E0D0A2020202020203C657874656E73696F6E456C656D656E74733E0D0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E4D616E616765725461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0D0A2020202020203C2F657874656E73696F6E456C656D656E74733E0D0A202020203C2F757365725461736B3E0D0A202020203C757365725461736B2069643D22626F73735461736B22206E616D653D22E88081E69DBFE5AEA1E689B9223E0D0A2020202020203C657874656E73696F6E456C656D656E74733E0D0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E426F73735461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0D0A2020202020203C2F657874656E73696F6E456C656D656E74733E0D0A202020203C2F757365725461736B3E0D0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9F223E3C2F656E644576656E743E0D0A202020203C73657175656E6365466C6F772069643D226469726563746F724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226469726563746F7254616B22207461726765745265663D2266696C6C5461736B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22626F73734E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D22626F73735461736B22207461726765745265663D2266696C6C5461736B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22737461727422207461726765745265663D2266696C6C5461736B223E3C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D2266696C6C5461736B22207461726765745265663D226A756467655461736B223E3C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D226A756467654D6F726522206E616D653D22E5A4A7E4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D22626F73735461736B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203E203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22626F737350617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D22626F73735461736B22207461726765745265663D22656E64223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D226469726563746F7250617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D226469726563746F7254616B22207461726765745265663D22656E64223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D226A756467654C65737322206E616D653D22E5B08FE4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D226469726563746F7254616B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203C3D203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A20203C2F70726F636573733E0D0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F457870656E7365223E0D0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22457870656E7365222069643D2242504D4E506C616E655F457870656E7365223E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223238352E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2266696C6C5461736B222069643D2242504D4E53686170655F66696C6C5461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223430352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226A756467655461736B222069643D2242504D4E53686170655F6A756467655461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223538352E302220793D223133302E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226469726563746F7254616B222069643D2242504D4E53686170655F6469726563746F7254616B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223733352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22626F73735461736B222069643D2242504D4E53686170655F626F73735461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223535352E302220793D223235352E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223737312E302220793D223238312E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223331352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223430352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223530352E302220793D223135302E3136363131323935363831303632223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223538352E343333333333333333333333332220793D223135302E3433333333333333333333333334223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654C657373222069643D2242504D4E456467655F6A756467654C657373223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223632342E353533303732363235363938332220793D223135302E3434363932373337343330313638223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223733352E302220793D223135302E31333932373537363630313637223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F724E6F7450617373466C6F77222069643D2242504D4E456467655F6469726563746F724E6F7450617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F737350617373466C6F77222069643D2242504D4E456467655F626F737350617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223635352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223737312E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654D6F7265222069643D2242504D4E456467655F6A756467654D6F7265223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E343334303237373737373737382220793D223136392E3536353937323232323232323233223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E313338343038333034343938332220793D223235352E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F7250617373466C6F77222069643D2242504D4E456467655F6469726563746F7250617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223238312E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F73734E6F7450617373466C6F77222069643D2242504D4E456467655F626F73734E6F7450617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A202020203C2F62706D6E64693A42504D4E506C616E653E0D0A20203C2F62706D6E64693A42504D4E4469616772616D3E0D0A3C2F646566696E6974696F6E733E, 0),
	('2504', 1, 'hist.var-money', NULL, _binary 0xACED0005737200146A6176612E6D6174682E426967446563696D616C543F57F981284F0300024900057363616C654C0006696E7456616C7400164C6A6176612F6D6174682F426967496E74656765723B787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F0000787000000000737200146A6176612E6D6174682E426967496E74656765728CFC3F3F3F030006490008626974436F756E744900096269744C656E67746849001366697273744E6F6E7A65726F427974654E756D49000C6C6F776573745365744269744900067369676E756D5B00096D61676E69747564657400025B427871007E0002FFFFFFFFFFFFFFFFFFFFFF3FFFFF3F00000001757200025B42ACF3173F08543F0000787000000001217878, NULL),
	('3', 1, 'E:\\LY\\Barbecue\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '1', _binary 0x89504E470D0A1A0A0000000D494844520000034D00000159080600000044DBC43F00002F4D4944415478DAED3F905C653FF0B92CBAAC65AD5A4AB1945AA897F2525ECAB55628B45834D7725DD68D8A6876984C24633F7C844C77808B80914196DA0848323F1A451164F9948D6C644132DD4D1203142085D9284A2008492484853F263F393F3F63A7A727C94CBE663FBFAAB7A6A7FBCC47CE9C3CFDFCFB7DCFE93F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0B99C723F89611886B1F3E13F003F343F0C47F942E5D33172C5CA499D732A63CF9D533A223FF39A25EFC875976667DB9D53E8F950BE50FA4CB67DEDE82C3F3F6FC15BEC4DD449004033C0A8939BB5F8F0F8D859AC9C764E3F3FC252673FB5B358BAB93608A5C1685A3C3F78154B67D893A8930080668051295FA85C3FBBE7B05C77E5E2F87C5A77F9A3B942F9E498553FCB85BE70552CCFDBBE7DF9937DB353E976DBEF2BCDB427512701003F00A35284A5AEAEAE833F74E9B4EECAD1F9AB4BEFCE1E3F79B5DBC5C7CE42E9AAF8D8D575DB9B738552EEEC393DEFEC2C565AED49D449004033C0A81321A9B3BB7C75BE583E2BCE5F8AA57A9DB3CBC7C5633F545F682A94E7548352BADDF6F33F177416CB9F8FF3A0D2ED8E3F512701003F00A34E9CBF949DB7942F94AF3F3F147D3FA68A95D3B2EDF2732B473FA5B6583F23EE8B70550D5985F2B4F83A7B137512003F30AA54034F1A3F04C54C512CCFAB86A1623F57AC5CB2C3B6C5CA49F9423F8DBE4FCC48D99BA8930080668051293F3F3A542F0031ABF291B8725EFAF935D3E72E7A6F4D683FDF5D39B1D1E5C673C5F20C7B127512003F303A43D3759543AAE73215CAD74FEFEE3F9DB37B3E1CF7C7A5C57385D2F7F3B37A3E109F67B3508DA4616A3F3F0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F005027D549003F3F003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00403F003403003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F00340300EAA43F00003F00D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300B0773CFFFCF35F2A140A495A2BDF676F00803F403F490E79E9A597D6A792C99327FF3F01003F801AAB56ADFA71D2EBFEFBEF5FD3D6D67692BD0200421300A9575E79E5AFB76EDDBA2DA971F9E597AFEAE8E878BBBD0300421340D35BBB76EDCAA4CE3F1BD6B6B7B7773F0020340134B5679F7D76463280F9F3E7AF4DEBE6313F008CDE803F423FC6C33FD0ACD25CF4575BB66C796DA0D0B46DDBB657F3F9FCB231633F6C6F01C0E80C4DC7A4E3F59D85A6D6D6D6B1F614D0AC56AF5EFD403F2B57AE5CD5D6D696B3B700603FA7BB77123FF0EA29D0CC3F5DBAABCC946CDEBCF9BEA8991D1D1D87D86300303A433F033F97D3059ADD37BEF18DB3773F2F32D345175D74AB99260018FDC1A9D1B94D0F9B65026869B9E5965B7E3750627AF2C927BF6B561E003F343FB7C9B94C00DB8D1B37EEC8341C6D6E701188E5EDEDEDCB5D3D0F009A441A92E69B650268ECCA2B3F3F696B6D68BAF6DA6B7F90D6CE593F00344F68FA58CDB94C273F007F122F24DD733FEB6ADED8F6A6B45EAEE8E8E878BBBD03004D243BB7C92C13407F53A74EFDD4FAF5EBB73F3F79728F8B3F00407386A6EA95F4EC0980C6E6CD9B7777A15088F33EE7DB1B003048493FBC72E5CA3F7CF0C1ADA5522959B870E1881C119A46EAEFDED3D3932C5EBCF8BFD2313F09EAE43F77DD7557B54EDE713F3F000C5634024B3F49D6AD5B97BCFAEAABC6011A2FBCF042B268D1A297D3C6E0CB8E4A5027F7C558B3663F09004311AF9C0A4CC3A6217875E1C2858F3B2A413FD449008691586AE28978F88C3F78DD5109EAA4A14E02308CC45A714FC2C33F70410B50270D75128091D80CBCB2E1B964E5C33FBFEEF96675C4EDB8CF13B86600D44975523FA0E99B818DEB3F3F3E23F9D55DE7EF30E2BE78CC93B86600D44975523FA0A99B8155BFFEF77E8D403656FF7A3F713F00A893EAA43A09407337038F573F6033108F79123F803AA94EAA9300347533B07C61D780CD403CE6495C3300EAA43AA94E023F3F6806409D5427D5490034038D475C056AA066201E3F3F0075529D54270168EA6660C5D239033603F19827713F00A893EAA43A09405337032FAE593FBFF792FE4B4ED2FB3F4FE29A015027D549751280A66E06623CFDC80DFD9A81B83FB86600D44975523F4033B0654BB2E2FEEFF45F7292DE178F79123F803AA94EAA9300346D3310EF64FFC4D2E2806BF5E331EF763F0075529D54270168BE6660CB96E4B915E5E43FEFB968C046201BB14D6CEBD5543F00A893EAA43A0940533403BB7AD5D4ABA93F5027D549751280A66E0676E755D39DBD9AEA495D33308ABC3F409D5427013FF47B421A6A233F4FEA9A8151E2C474243F5127D549751200CD803FA0C6A7D33F1DB37A3F8EB54BD449433F40336068063F30654129669A5E109CD449433F40336068063F9876753FEAA4A14E023F3034034DE3C45D04A3EC713FA9933F093078493FB26CD9B229D75F7FFDA23F673F6DDAB43F3A3A92534E39253F61C2B6333FF3D53FBE78E5B7BEF53FD3F1BFEC31CD803F18A681695781C88C933A69A893003F4B77DC713F975D76D9EBB95C2E3F6F5EF2E03F266BD6AC49366FDE9C84F8B86EDDBAE497BFFC659286AAA4B3B3735B3E3FFDE4C9934F3F350386666018F874CBE0663F3FEAA4A14E023F0D4793FEF99FFF79CBF9E79F5F0D446FBCF146B2BB1E7BECB1E46B5FFBDA1B53A64C797CDCB87147DA9B3F4333708003D3D8217CDD46C1493FD4498086D2CC73F09D77DE593EE38C333F0B160C2A2CD5BBE79E7B92493F6D32EBA419303403232830EDADAF473FD449603FA6FBEEBBEFA1733F2779E2892792BDE1F73F7D3FB04DA79F7EFAD9F6B06640333FD84F7675D187FDFD7D50270D7512182D623F02539CA33FC5F73F79F2C6B6B63FF6B2664033C07E0A4C7B6B693F2775D2502701B68B73986249DEDE9A616A34E374EAA9A7AE4F83D351F6B66640333F527F113F918E89BD1F07A3FEEB5C1C423FD449A0D9C555F2BEF9CD6F3F3FED4B77DD75D7A6F6F63FEC71CD8066807D1898C63F3F4489EBFDB8BBC169A0AF139CD449433F9AD9FCF93F35AE92F7DA6B3FFBDA59679DB53F3DCD8066807D1C98C2C4DEE0930C22383FA66C9C5AF3B8739CD449433F9A513FC5FB30C565C5F7875FFDEA57AF9A6D3F6806D88B060A323FD0CE8253A3EDAF6DB0BD739CD449433F9ACDB265CBA6C4C51FF6E4D2E23F69D2A4B5A79C72CAFBECFDA16B6B6B5B988EBFD50C68069AE978DE49603A711041A85170DADDC0541F3FD553270D75126806D75F7FFDA26BAFBD36D99F66CD9AF5581A9ACEB3F73F3F498C680A5A5B5B3F3F3F34C3F13CC4E0B2AB3FD8C054FBF35F6831E3A44E1A3F30FACD3FF3E5071F7C70BF86A6FBEFBFFFF7E9133F7B7FCF9B819A7177A3575435039A81D1743C37084C3F58060A4E070D3130659CE3A44E1A3F3FA64D9BF6FA733FB75F43D3DAB56BD7A54F5EABECFDBD3FF4BDA25A3F68063403A3E9781E6260DA5970FADD1E043FFD7D50270D751218293A3A3A92CD3FEFD73F3F2F7DE2DA6CEFEFFD66A0F615D5588EA2193F8CA6E3B965CF67761A053F094CF5C13F4EEAA4A14E02A3F549E540D88D2733632F0CCDC03F8EC9A18F934F3E390B37B3F6B0EC1DD46086E977BDF7EF8959FE4EEAA4213401A3D4C48913B7EDEF99A64D3F3FD3B4CF5E417DB8B5B575EC9831630E8EED0E743370D45147257F3F7FB3CBEDDEF4A63725A79F7E7ADFE74B3F3FB3AB57AFEEB7ED1D77DC917CF8C31FAEDEBEF7DE7B3F132654C79D77DE59FD9A175E786187EDE3BEEF7DEF7B3BDC77EBAD3F1FFCE007ABB7FFF0873F680646C8F1DCB2EBABE5EDC94CD3603F00D74C53AF7C77E9C75D5D5D0D0367BED07342BE50F9F48EA33433EEDF5B3FBF7376CF873F8CF2A5F171B8D6C9A85B71CCFDF18F7F3F7D4F4E3DF5D46AFDFA3FFCC724567FECCD3F3FE7AAABAEDAE536E79D775E5F6D8C9E203F3F6F143F003FE79CF3EA3F3F6D527FE79CA6BDDE643F3F072A34D58690C30E3B2CF9D43FD5F7F9F2E5CB77D8F6B1C71E4BBEF83F3F3F3FA3EFF6EDB7DF5E0D3BF5E1290253169AE2B1DA26233EBFE9A69B1A86A6F8F8777FF7773FE4D8263F3F717FA9543F8C80E3B926A06C6C3F3F0D2538353F4D5D5DB7BD390D273FFCF83F357D4E3FF3DD95898D43573FB94239493F675EB3E41D3F161F9A869EA5E97829572C1F5F7D9E6A705FEDEF30D2EA641C6B575F7D7535346501253F3F2FECFB7CEDDAB5D53F3531C2CB3FFEF1EABF233ECF823F37DC90FCC55FFC45DFD72C5AB46887C70F3FFCF0E484134EA8DE3F2F3A3FFDEFEFF7FBC45574B3DB3FB3DB11A2842680D48C193356ECEFABE7FDFC3FFF0F57CFDB6B4D3F6D6D6D270DD05C1E90D0144FB473E7CEADDE3EE28823924F7C3F3B3CF6C31FFEB0EFF3DA8661574FD2BFF9CD6FFA9A8018975C7249F5E7643FBE577C7D3405D9D73CF0C003C992254B3F3F25B689193F4DD16CBCFCF2CB9A8111723C37082A3F3FD0653F5D3D6F30C1A929AF9E172166FADC45EFCDCDE9F9781A764E8ECF77B67D6C9386A6867FABE9DDE5CFD67EDE59ACFC5B3A5AF3C5D2573BBBCBFF3AD07D67CDADBCB5FF0C53EF487F5684B9E15827E7CF9FDF3F308EB70B2EB8A0EF76BC8054BF7D56B36246AAB686C63F4611A6DEFBDE3F5843E3F33FBB6C87593F3FFDF4D37D2F52459D8E3F3FFBDBDFF67DEDB265CBAA1FBBBBBBD549A0B95D79E595D7EEEFF7694A9BDDBBBC4F3F373F7B25FE8087A6EC49BB51688AB052BB7DEDF29478FC4B5FFA52F57634172D35B34C59C06A34D3943DB18F1F3FBEDF3FB34A113F28C5C798758AA6218257341C7FFEE77F3F1821C7F300C16957816557EFC3B4BB6F805BEF983F7D9FA634B85C3F3055DACF29F47CA8BA443F144DEBAE1C5D1B62D2D0F483084759A089AF8FEDF2B37A3E3F36271D5B3A67978F3B774EE9885CB1F49BEACF9853191B61A9D17DD9CFC966B272C5F2BCB81D4BFF6A3F0E3F99D5A9A8432D35B34A71FBEEBBEFAED6CDB85DA954FAD5B1A889D9ED6C3F6A5BCCECC7ED55AB56551FDFB87163F585A46C66291E3F6952F57684B2A8B58D6A76ED4C533FC89610C6AC54CC5E9969029ADED7BFFEF5FF3975EAD4AD6FBCF1C67EBB785EDAD83E3F99BDCFDEDFF7F67768CA5E158DF398E2493FEF784735383F3FFAE83F7C4D1686B286E299679ED9E9CF88D0153FFE6D313F4FEAD3A74FAF7EFF430F3D3F3FDBC5ABA5F14A6AD690640DC1713FD7F7FB644D4A6C3F18917635D3B3BB6F5C3BD8E03F113CA9D97678BE50FE64AE58A9FE3FF0F4DDDF5DFA7184A53F93A9DDAED6B4EEF2476396AA1A9C8AE542AE506A4BC775DBBFA6D21E61ABD17DF5DF27FBFE9D85D255C3B94EAE5FBFBE5AE7A246458D8CF0F3B6B7BDADAF66C5883FC75FBC6814B3E059DD8C50532C16FB5E786A1960A6A9FEC5A9DA3F75307E5EA3D0142F6E3DF2C823D5DBD9EF13B7E3675A3F3F6D389FFC3F7FB9BF96E6DD98063FF6FA3F4DB1842E9EECB3CF1B3F6501261A82586B9FADB78FC78E3DF6D81DD6E367CB501E7AE8A164C58A15D55766E3F3CF7DEE73D5EFF1AE77BDABDA7C6441ACA5663D7E3F5BDB70C472BEB81DBF63F6FBBCF8E28BD5FBF6D77E3F3F033FED6E601A6C70CA7E5E3FA698F5A95D4E577B3E533FA5E1E59A465F97CD2C0D240D45DFEF2C564E3F4B676401288252EF92BC7EF7EDF0BDE754C666BF53AEBB34BBEFF7B9BAF4EEE158272328455D8AFA1721252E7A93BD3F2366BEB3599F6C3F8EC598F9C96A5C363F334DF178D4C63F74FCF1C7F79B693F9BBEF0852F3F3F178068A9B9584E7DE0724E13408DD34E3B6DDCB9E79EFBFA7E986D5A3F7EFCF847DBDA3FD8EB3F343FD9F53F3F34FDC33FFC43BF593F3F7B3F0B4CD9F23F3659C0893F9ED06B9FD463294ACC6845B0AA7F82CF66BEB2FB5B3F8D5631E354BF546E62CBE0DF87A951703AB5EE3F3FD99E5B3F551F76B2DB5D5D958323543F4DDC9F2F94AF681C96CA3F88EF19CBEFF2732B47C64C525C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD755084A9E15827B3E32ACEB58CFA17356A5701A5A5663FC25316866296E93FFEEF3FB9DBDDD01475F7A9A79EEAB7FCAFB6BE662B001A5DC9543F9AD23F533F58B0603F3F7F2A663F793F23283445803FD89D3F3FC1673F7BA28E1395E3BCA6817E46A3739AB235FEB367CF6ED870C455FA6286A9A5E6846A334D3F38D55E1C3F000DE68D6B073F6F605B1B56662D3E3CD75D9EBEABEDE2F2E29DC5D2B8468F77162A17A4A1E7B52CECC4D5F3D2CF7F9B8E5571CED440F785C9F3163F2E2D9E5D84A27A618A42B9D27B8ED4CF6259DF70AD933F4FED954577169AE245A198518F738BB217A45A1A5C29341BD96C7E7DE08A25CBB5333F9DD314BF5BB6542F5E508ADA5C7F3F7512685A718ED1A4493F3DF1C4133F30A545F8CEF4673CD7D6D67694BD3D7A4353363B3475EAD401CF693F633FAF74B6D4ACA1DF55683FEE682C6A5F098DF7688AD03FA096BA99A3ECBEECF1DA46233B3F96C868064685FAA57A11784E6D19FC65C4EBBF6E4F3F6A54898B3FA4C16461E7EC9EC376B65D9CB3946EB7E43F3DEFDC3F3F663F8BE53FF4FE50C3B54E663F7DE8431FAAD69E812E3F3F2065B340F19E723F2F42567609F2EC05A8EC76ED5543079AA53FB1B42F5BFEF73FFD68877A995D3F5BD65C7B29747512687A69F3D93E65CA943FAE5BB76E3FA6D5AB57FF62FCF8F1CF583FFA43533CD1EE6C1947ED936F04A6B81C70BCAA194B4662646BFAA3A9A85DA297859A6832E2F32BAEB8A2EFFBD586B02C08D5CF7E456350BFF4246B48FEE99FFE493330BA83D39E6AB4F40F7572AFD4CB5D6D93D5AEDDDD7E303F7BB3F096BA3FD4BE8875203F093FEDEDED93264F9EBC716F3F3F5304A6D6D6D6AFD9BBCD3FECEDC6613FCDC03F4E4DFBC6B5EAA4A14E02EC421A704E3F61C2CB3FFDE94F5FD9838B433FF6B7BF7D5D2CC94B4787BD3F303403FBD93FA9B3244F3FD449809D8B739CC63F5F3F65CADA471F7D74D360DE87E9DE7BEFBD390D5D0FC7451F9CC33F3034033F380D76A6C8451FD449433F185478FA7284A78E8E8E753367CEFC3F7EF18B67D6AC59F35C2C3F3F6D5AFB873FFCE1773D3D3D3FEBEAEABABBBDBD7D6584A5985D723FCD803F180606BBC4CE923C75D25027013F0D43EF696B6BCBA561E8F6743C9D8ECD71127FEFC755E958908EF36286CADED20C189A81111A9C8E49C7C63F7CE35A75527D5227013F183F4E3F4427EEE43F042675D25027013F189A816636D08C3F79EAA4A14E023F3034030C103F2675527D5227013F78123F3040703F30A14EAA930068063C096B0668ECC4B8984D8BCB8AAB93EA3F098066C093B06680C67A4313EAA4FAA44E023F3F3F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD4490034038666003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75D25027013F680634034213EAA4A14E0230AC944A254FC2C3676C4E9B813F954213EAA4A14E02303F5EBCF8B975EBD679221E0663CD9A35B7A4CDC0E38E4A3F75D25027011846CAE53FEEBBEFBE0D3FFF3F4F3FEE95D368047A7A7A9E49C7971D954213EAE43E0A1C3F000C553F3476E1C23FC79287582B3ED2C63FDF9C44733B127FF7DE11FBFD718D80D0843AB9AFC6430F3D3F0A8564FEFCF9EA24003469633F9ADB31633F6C6F2034C18E3F39E4A5975E5A9F4A264F9EFC337B04009A4C6B6BEBC7D2C6F6F5686EDBDADA4EB447109A6047AB56ADFA71D2EBFEFBEF5F93D6CA933F0068AED0343F1ADBDEF1B03D82D0047FF2CA2BAFFCF5D6AD5B3F352EBFFCF2551D1D1D6FB777003F1ADA63B259A66C3F6A3F83D004DBAD5DBB76655267C3860D6BDBDBDBBB3F00688E8676416D60CA669B9CDB843F2D2D3FFBEC8C6400F3E7CF5F1B2F3CD94B0030BA9BD97EB34CD9B05E1FA1896697E6A2BFDAB265CB6B0385A66DDBB6BD9ACFE797793F004677337B77A3C03F1EB087109A6866AB57AF7E20D9853F57AE6A6B6BCBD95B00303A1B3F67999CDB843F2D2D4B3FDD55664A366FDE7C5F1C3F1D1D87D86300303F3F3B0B4CAEA487D044B3FB3FBE71F6CE96E74566BAE8A28B6E353F009A5B705CD1B46EB9E596DF0D94989E7CF2C9EFC652663F01803F1C5734AD71E3C61D9986A3CD0D2E02B1BCBDBD7DB9AB3F803F1C57343FAFBCB29886A4ADB5A1E9DA6BAFFD416B6B3F7B070034B7E0B8A2E9C5F2BB7BEEB9675D3FDBDE3F3F3A3A3ADE6E3F00803F1C57909A3A75EAA7D6AF5F3F1DC9E4C9937BBC971D00686EC1710575E6CD9B7777A15088B763986F6F00803F1C57502796E3C5F11C1787B0370040730B3F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071058E67004033403F5767CFE97967BE583E6BA0AF3F7A4E3F2A9FDE719466C6FD7BEBF7EA9CDDF3E1FE3FA37C697CF457433F0034031CD0E36A7A77F9B33106FA9AAEAEAE83AADBCDE9F960BEBB32B161B0EA2EFF24572827E978E3CC6B96BCE39CC2E243D3D03F1D2FE58AE5E3639B46F7FDE967DCF6667F1DD449004033C0B038AE723F1F5E37A37345AE506A3FEFEC2E5F1D01A7FE6BD34074721A9A4E6CF47DEB435767B1F26FE9683F4B5F4DBFDF3F74DF59732B6F3FC3D43BD29F957EBCCC5F0D7512003FB05F8FAB6CE6A8260C5D5F7F5F98D65D393FC4A4DBFD20C2511668225CC576F9593D1F481F9B933F9DB3CBC73FA77444AE58FA4D3528CDA98C8DB0D4E8BEECE7643F3B572CCF8BDBB1F4AFD1EF033F003F603F5793E72D784B67A17455849DFA6D1B84AB398DBEE7B4EEF24763663F9C8AE542CC5AA5E3BAED5F53698FB0D5E8BEFAEF937DFFF87DFCA5502701003F00C3E2B84A834C2E663F8B95D376F5B5D9CCD240D2EFF5FD3FF962E98C2C004550EA5D92D7EFBE1DBEF79CCAD86C895FAEBB343B3F7F75E9DDFE6AA8930080668003725CE566553E9285A598FD89E578037D5D5757E5E038F7A971582AFFE0DC62E5A8587E979F5B3932BE575C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD75503F7F35D449004033C07E3FAED200F4C9583257FB5867B174733AC6D52FCB8B20133F8FC71A7DCFCE42E58234F4BC96859DB87A5EFAF96FD3B12A37A7E73F3F6279605C5A3CBBF0C4F4B98BDE9B6E533F47EA67F5BF23A893008066807D6AC2573F1180229CD43FD6755DE5905C77E5E2FAC7E29C3F3F89F773DA9BBFCBF66581E5CFBB3F3F003FC071058E67004033803F1C3F008066003F383F003F003F703C03003F1C57E07806003403E0B8C2F10C006806C07185E319003F803F1C3F008066003F383F003F003F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071E5B862141ECFB959958F745D5739A4ABABEBA07CA1F23F47F9D26CFBFCDCCA9167CDADBCB5FEFB7416CA97DB9B00A0B9053FA3F6789EDE5DFE6CAE50CAC5EDAEAEDBDE9C2B968FEF9CDD73583A8EEDEAAA1C9C6D7F3F4BDE913E36AF5F683F5F6D6F02803F1C578CDAE3F99CC2E243A7CFE9F960E7ECF27131BB94EBAE5C3F94AFAFDE2E564E3F20154BE3F285F227B399A8F83C669A72DDA5F3E2FBD83F00A0B9C571E5B862541DCFD3BACB1F8D6034ADBB7274AE50FA7E3FAFB35869AD86A242696A6C1B4BF862462A5F287D26C251B64C2F0D572747D8B2370140730B3F46E5F11CCBEFF2DD958993E72D784B3FF5CE20DD56FD582C3F4129B68DED625629C2537C9EDEBEB91A9A8A3F712E94BD09009A5B705C316A8FE7343FE263BE50BEA2FA79EFF94DE9C73F3F3F0D529765012966A6AAE1C945200040730B3F46FBF13F9F69F9593D1F88A576D5B0D45DBEB07A8E53EF6C522657AC5C52FF3D3F00D0DC82E38A51ABAD6D7C124BF3E2BCA573E7948EA87FBCF6BE7CA1E784B8404476DFD9737ADE992F94663F20EC4900D0DC82E38A5169E2591724B9593F8FDBB9423F66987285D275BD57CEBB2D2E2F9EBFBAF4EEED3F3F13DB55CF6B2A94723FD7E4BBCB3F896D63795F3F3E0040734B3F430B3FDAC578D89E423F003403343F744C3A5EDF59686A6D6D1D6B4FA14E02003F9AF938BA7B27A1E93F633F6C2FA14E02003F9AF9383A66A0D0D4D6D6763F3F09006806702C353EB7E961B34CA893008066005A1A9FDBE45C26D4490040330035D290343F133F003F808143D3C76ACE653A3F413F0034033F98AA9EDB643F7512003F40E3633F3F3F003F609F4892E4E0952B57DEFEE0830F6E2D954AC9C23F8DFD3C7A7A7A92C53FFF573A26382251270100CDC030138169C99225C9BA75EB92575F7D3F40E385175E48162D5AF4721AA0BEECA8443F00CD806660183F2681693FA757172E5CF8B83F75120034039A81612496E4092CC367A4A1E97547253F0068063403C3489C53233FABD03F073F0068063403233134BDB2E1B964E5C33FBFEEF96675C4EDB84F3F9A50270100CD40D387A68DEBD7243F3E23F9D55DE7EF30E2BE784C3F9A50270100CD405387A655BFFEF77E3F1B3FBD403F9A50270100CD407387A63F3F3034C563C28ED0843A090068063F342D5F3F60688AC73F3F7512003F084D4293D03F0900680684A63FAE963750688AC73F3F7512003F3475685AB174CE803F1E13763FD449004033D0D4A1E93FCB92E5F75E3F695E7A5F3C263F4DA893008066A0A943538CA71FB9A15F688AFB041D3F7512003F084D5B3F2B3F4EFFA579E97DF1983F34A14E02009A813F4D1BD7AF499E585A1CF09CA6782C3F783F865C1317445DDCC578D89E0200A1893F9AB66C499E5B514EFEF39E8B060C4CD9886D625BB34E421343AA89C7A4E3F59D85A6D6D6D6B1F61400084D0CA3D0B4AB3FB34E42137B3FDEBD93D0F4C03F630EB697004068621885A6DD995DDAD9AC933F3431E8BA78CC40A1A9ADAD3F7B08003F8659681A6A60CA863F3431A4DAD8E8DCA687CD320180D0C4300C4D86D03FA98DFDCE6D722E1300084D084D86D0443F243F3F00084D423F34317068FA58CDB94C273F0020342134194213FD6B64F5DC26B34C0020342134194213A9F6F6F6F7B4B6B64E4D6BE3EDE958918E3FF6CE366D4EC7D3BD4BF6CE8BED3F00103F9A8426A1A969C4A5C4D33F1DAFEEEC8D6DEB4625DD7E82BD070042134293D0C468AE81EF4B83CF3D3F4A8DC69271E3C61D696F0280D0843F3431AAB4B6B63F7EFCF8976A03507B7B7B3FFF3F49B95C4E9E7DF6D9E4BFFFFBBF93F03F3F59B3664DB274E9D264D6AC59C957BEF295FAE0B4D1AC1300084D084D42133F308D4D433FB561E9C61B6F4CD6AD5B97EC8EF5EBD757B78FAFAB0D4FE9F73CDDDE05003FA14968623FA6536A03D3F4E9D3ABB34A43115F77FEF9E7D70727334E0020342134094D8CD89AF7BEDA2579975C72493FBCA18AA57B975F7E79FD52BDA3EC6D00103F9A8426463F30F5D43FED69603F4E75334E4BEC6D00103F9A84264694B8AC783F4C435D92B7B3A57AB5E738593F004213433066CC988385A6D1139A76F5F764D885A68559A0893F3F37DF7CB3D92600103F8AB497FAABD5AB573F103FFEFAD7BF7EEE40CDB63F3242D3EE3F3F61281D7FBBB36DDADBDBDF935D3F66835E7CF1C57D129AE2AA7A753F7F9FBF1000084DECC2B3CF3E3B63F3E6CDAF674DD5962D5B5EBBE5965B569C7DF6D9FF5B681A79A169307F4FF65F1DEB5D0EB7B0B5B5F5638DB649EF9F9A6D773F5724FB52BC8F534D683ACF5F08003F06F0CA2BAFFCF5F33FFFFB811AABA79F7E7AF3CC3FBFDBD1D17188D034FC43D350FE9EECDFD05433EEAE9F794AEFBB3D7BFCBEFBEEDBA73F66206B7E3FFE4200304A4253BE50F9748C5CB17252E79CCAD873E7948E88FBCFBC663F72DDA5D9D9F6E7147A3E3F3F936D5F3B3A0BE5CB27CF5BF09666DFA769CF74C8AA55AB7EBC75EBD66DBB6AAEB66DDBB6F59E7BEEF9AF7C3EFF39A1697886A63DF97B72C04253DFCC53169ED2CF5764F7EF3F40D45BB3664DEDEFB1CA5F0800464968CACD5A7C787C3F564E3BA7F01F7F1961A9B3509ADA592CDD5C1B84D260342D1E6FF4BDF2C53FCDBE3F3FFEF92F6DD8B0E1E5213FB1E53BDFF94E69C18205C2CA301A0F3DF4503F7FCFB4617F3F73E04253EDCC533A36659FEFADCB8CEFECF23F3F7BB3BF10008C92663FFEBF6F27E3BFF2D5E4F4F3AEA87E3EE1B4A949C7D91726133F2F997C51B1AF01987CF1DCEAC75327E7AB8FC588EDAADFE382AB93DD685E463F140A3FC18772F2787C6D7C8F78955A60393F3F7BE3EF690CBFB13FD4FE3C3F00304AE4BA2B177775751D3F3F9DD65D393A7F75E9DDD9633FAF76BBF8D859285D151FBBBA6E7B73AE50CA9D3DA7E79D9DC54A6BB3EFC7B842D7E4C9937F76FFFDF73FB76DDBB63776A7B9DAB061C34D53A64CA9B4B6B6CE4F1DD0A090FE1392EF7DEF7B7D9FDF74D34D0DB79931633FF76DDEBC39B9FBEEBBAB8FED6C3F1EBFEAAAAB763F9C77DE79D5DBB7DE7A6BF57B67F7C765A2F7E7FEF8E94F7F9AECC9DF73A45D392D37ABF291AE3F876C3FF54B70CB9766DBE5E7563F6B6EE5ADF55F1F4B740FE48B3F0DC6C3E9DF616C5C3FBDBDD14C13003064113FBBCB57E78BE5B3E2FCA558AAD739BB7C5C3F2A542EEB9CDD73585F535528CFA906A574BBED3F552E3F3F1FE741A5DB1D6B6F6E176FA279E9A597AE5ABF7EFDBA9D9CFFB27CDEBC79DF8F732D62FBF83F714E53A9544A264D9AD4177AAEBDF6DAEAD53FB9E492EAE771527B7DA8C9C24BDCEEEEEEAE7E3CF5D453ABDB46C3986DBB68D1A2E4CE3BEFAC3E161F0F3FFCF0E484134EA8DE8E713F77243FFFFBFB7DFF3FB2DB37DC7043DFED085107E2421043FD7B3FD3BBCB9F3F41FA5E1029968F3FFF3FBBABABD27759F5EAB98EC5F2BC7E3F3F3F34F585A59A6D9CD304000C5D3440D9794BF942F98A783F0D455FA986A962E5B46CBB7875396DA8DAA6753F1AA3DA24A5E13F3FE569F175F6E69F8C1B37EEADEDEDEDDD693058B775EBD64D353DD5E6279F7CF2BBE963CBD3C66E564747C7DBB3AF39103F969265412782C9633F96AC5EBDBA7AFB873FFC61DF764F3FFD7435E8C4FD73E7CE4DBEFBDDEF566FFF3FBFD9E9AC516DD0893FBBECB2BECFDFF4A63725175E7861BFEFFF894F7C3F96E2F66F7FFBDBBEAF5DB66C595F50DBDF573FCADF733FA7B0F8D0E9737A3E18FFAFAB1786E9AE5C3F94AF3F12B343402A96C6A5F5E2937D1782493F8F99A6B4763FDFE70085A607223F7A3F573F0086AC1A78D2601421285E4DCE96E0C452BBB449BA64876DD3A6295F3FA1D1F78919297B73C086EE987C3EBF6CE5CA956B366DDAB4E8A23F3F9ABBB8BF7EDBFD199A5E78E185246D2E3F3F6AE99DE5898FC71E7B6CDF7D310B551B7C8AC562DFEDE38F3FBEEF3F042D59B2A46FDB8D1B375667B2B299A53F66B5E23FBFF8C5EA3F0A5A3F4D3F765872EFBDF7566FC7AC54CC5E1DC8F7691ACCDF73243F10FFC7E3C5925CA1F4FD6C495ED482EDB3CAA5A9DB6B463F31231557D18C703FD34BC3D5C9D90C3F3FD66F66A99EF7690200F6483643144D4FB5714A9BA26890D2CFAF3F77D17B6B423FF9EECA893F373F9667D893038B66AEAD3FD77B19E4DC40CDDDFE9E69AA5D4A3FA9969A733F05AD783C463FC5C7333FA361E0A9BDEFF6DB6FEFBB1D3F6E47107BDBDBDED63034C54C3F3F52BDFD3F0F3F6B0732340DE6EF39B2EA40E5E03FF7C498753FA3DEFFDBB7553F16CB674550CAB68B59A5A813DB5F6029DDBC3F94670CE7D93F3FFD7B3F7FB3F476F2E23FEE933F333F264CD856139ADE3F02C068084DD7550EA99ECB54285F3FBDBB3F74CEEEF9703F3FAFBE3FABE703F179ED89E0F5A2D93F772F3CEDEC3F3F4D71818608263133948594FAF39922B4B43FE1BBE0820BFA96F0C5123F2B56ECB09CAE3604C56C54FD4C539CDFF4852F7CA16FBB587A1761ADA5E66214F581EB409DD334D4BFE7483F9F423F3FB6BF90B2FDFCA6583FCB78FBFE3F2A9765012966A6AAE1E9005D046230E27D9BB23013E7E53F37DF7C733F3F550F00602F3B103F668FE26A78114AE25C3F442DBD4BE1E2F3DA2BE4654BF7B2F3985A7A3F3F15B3463FF34CC399A3DD094D6BD7AE4D9E7AEAA91D66A3EA4353764E53EDEF752043D368133FC68B2431EB5C0D4BDDE50BABE738F5CE263F5CEDB874770485A693B24013B34D7BFB8210F1FDC68F1FBFADE6CD7527A86A000023383445F0B8EBAEBB9277BDEB5D3F4511463FFAE8EA7D3F3FFA68DFEDDAA014C16AF9F2E5D5DBF1B5717187B89D5D1EBC76D49F0F3FA298916A74118996BA733F28654BF562496084A8463F47681ABAB8525E3FC7B2DC73E7948EA87FBCF63F3F2E1091DD176F373F94663F2046C2BF350D333FD44C3F7DAF5D7E3C96BA9E7BEEB96FD4CE328DB6994800803F4D8DC24AFDFB206597FBAEDF2E0B31F1F1CFFEECCF9255AB5655C3564BCDCCD0403F230B4D3F2E1A1123B6F9D18F7ED4B77D16C6E2637619F4EC8A7B42D3DE116F1B10178589DBB9423F66987285D275BD57CEBB2D2E2F1EEFDDB6FD3CA7D2673F4D695C2CDF8B731FF3DDE59FC4B6B1BCAF76193F0D4DEF4B3F59B889636A4F835304A6CB2FBFBC3FA68D6D6D6D47A96800003F34B5F45ED8E1D0430FAD7E6CE95D4E57BF5D3F6F3487F56F541B176D88C7E3FD3F1B9A62C4D7B5D45D3FBB7D20463FCF6B16ADADADA7641785C8669C86BA542FBEAE6E86C93F00803F3FA1A999A4E1A63F383F4E313FCB4D773F7971D187DA739862A481EC6B3F00803F34312AC48C533AD6D7869E084F3F4E3F3F8B942DDD8B25786BD6ACA95E51B250282413274EDC5AFB753F2F82983F002034094D3F718E53EDA5C887383F3F004068123FEDE1E9CBBDE1E9F5C184A5985D723F0000A14968A269B4B7B7BF270D4F3F0CDD9E8EA7D3B13F20C5C755E958908EF36286CA3F00109A84263F00003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003FA1C951090000423F340100C0C8502A958495E13336A7A1E975472500000C233F2F7E6EDDBA75023F186BD6AC3F0D4D3F2A010060182997CB5FB8EFBEFB363CFFFCF33F3F373F81A9A7A7E799747CD951090000C34CDAA88F5DB870E1C33F2CCEA931F6FB88FDFEB83F0000000000000000000000000000000000000000000000000000000000343F0F67065B1949DC9E3F0000000049454E44AE42603F, 1),
	('5002', 1, '/Users/jerry/Desktop/guns/guns-admin/target/classes/processes/ExpenseProcess.bpmn20.xml', '5001', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E6365220A20202020202020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4449220A20202020202020202020202020786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F4449220A20202020202020202020202020747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F5850617468220A202020202020202020202020207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22457870656E736522206E616D653D22457870656E736550726F636573732220697345786563757461626C653D2274727565223E0A202020203C646F63756D656E746174696F6E3EE68AA5E99480E6B581E7A88B3C2F646F63756D656E746174696F6E3E0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E5BC80E5A73F223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D2266696C6C5461736B22206E616D653D22E587BAE5B7AEE68AA5E994802220666C6F7761626C653A61737369676E65653D22247B7461736B557365727D223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C6578636C7573697665476174657761792069643D226A756467655461736B223E3C2F6578636C7573697665476174657761793E0A202020203C757365725461736B2069643D226469726563746F7254616B22206E616D653D22E7BB8FE79086E5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E4D616E616765725461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C757365725461736B2069643D22626F73735461736B22206E616D653D22E88081E69DBFE5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E426F73735461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9F223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D226469726563746F724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226469726563746F7254616B22207461726765745265663D2266696C6C5461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22626F73734E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D22626F73735461736B22207461726765745265663D2266696C6C5461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22737461727422207461726765745265663D2266696C6C5461736B223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D2266696C6C5461736B22207461726765745265663D226A756467655461736B223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226A756467654D6F726522206E616D653D22E5A4A7E4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D22626F73735461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203E203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22626F737350617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D22626F73735461736B22207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226469726563746F7250617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D226469726563746F7254616B22207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D226A756467654C65737322206E616D653D22E5B08FE4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D226469726563746F7254616B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203C3D203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F457870656E7365223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22457870656E7365222069643D2242504D4E506C616E655F457870656E7365223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223238352E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2266696C6C5461736B222069643D2242504D4E53686170655F66696C6C5461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223430352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226A756467655461736B222069643D2242504D4E53686170655F6A756467655461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223538352E302220793D223133302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226469726563746F7254616B222069643D2242504D4E53686170655F6469726563746F7254616B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223733352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22626F73735461736B222069643D2242504D4E53686170655F626F73735461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223535352E302220793D223235352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223737312E302220793D223238312E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223430352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223530352E302220793D223135302E3136363131323935363831303632223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223538352E343333333333333333333333332220793D223135302E3433333333333333333333333334223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654C657373222069643D2242504D4E456467655F6A756467654C657373223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223632342E353533303732363235363938332220793D223135302E3434363932373337343330313638223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733352E302220793D223135302E31333932373537363630313637223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F724E6F7450617373466C6F77222069643D2242504D4E456467655F6469726563746F724E6F7450617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F737350617373466C6F77222069643D2242504D4E456467655F626F737350617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223635352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223737312E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654D6F7265222069643D2242504D4E456467655F6A756467654D6F7265223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E343334303237373737373737382220793D223136392E3536353937323232323232323233223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E313338343038333034343938332220793D223235352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F7250617373466C6F77222069643D2242504D4E456467655F6469726563746F7250617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223238312E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F73734E6F7450617373466C6F77222069643D2242504D4E456467655F626F73734E6F7450617373466C6F77223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, 0),
	('5003', 1, '/Users/jerry/Desktop/guns/guns-admin/target/classes/processes/ExpenseProcess.Expense.png', '5001', _binary 0x89504E470D0A1A0A0000000D494844520000034D00000159080600000044DBC43F000036004944415478DAED3F945C653FF0B0293F2A3F283F1FE2A7A0A272103C3F9551467086D8743A400B4EC292A4AB12400C5B3F3B495505211240760C62C0B004D2554502043E403F3F183F0901090C488248EE779F9B545BE97467234BA7EB3F3FA9E5567773FBF2F4F3AFF7DEB7FAF50300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001ACB41071D3FC67A379A9B170DFBC2584BC35F0B0068F0D0642F3F3F2A57B595AABF3FABBF3FCB5F3FCA633F2A9F6F6F6F3F5FACFC7C58B16397D82E573F90DE2F3FAAFBD89BA893008066803E270D43FD8FFCD99DEF4BC3D379F9F3CADB0E2DDDFEE15CB1F23F083DD056AA7C3F5CA5C16A5871DAD6B16DD7912B9673F942657F7B137512003FD0F74253B172C3800913364A83CF75C79D79D7E6B952E5B8F4F6A5F952259FDE9E7AECF9D56D62BB7C3F6951782A0FC897CADF8BD1563F3F56A85E30AC58DDCEDE443F0034033F434B53773FA6B6313F3F3F3F2A233FCA7BC673EDEDD58DDBC656F7CB8FAD7C2A025104A3FC793F8BF03F76ECBD68543A3F15A893008066803E259B552A546F6F2B56EE496FFF2237BABA43AE543D3B9E6B2B964F3FAAFB2E0A4595FDDB4AD5C34714AB7BE48BD591F1D851E757DF932B562E1B3CEE814DE2D43D7B137512003FD0E7C4CC3FC64D3FAE554AC3D084C5416A6A1A9E764BEF973AC355A1726A3C3FACA3D3A074611AB286E78B95B3E25AA6458F574E3F512701003F007D4A9C86170B3EA4E3DA7CA97C449C9E3F20554F3FABF7C54C526DDB98493FA5B8BEA96D4CC7676A6358F196F7C60C944520502701003F007D4E84A25800226EC7ACD1F0423FA661E9C0587A3C0D527765A7E1253F59904AEF47C8EA6E3F954520502701003F007D521A86BE159FD3142BE5C54C5304A55800A2BD7D3FD2E7C6B695AA4D23CFA96ED5562A5F13B351DD8D08593F3F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600409D5427014033602F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A8933F00680600502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00003F003F00502701003F00C0EAF1FCF3CFFF67B1584CD25AB9833F00421300753FD9F4A5975E9A974A060F1E7C3F02004213007566CD9A7545B2D8F4E9D3673737371F603F00803F40EAB5D75EDBF5ADB7DE5A98D439EDB4D366B5B6B66E693F00803FD0F0E6CC3F33E9E2E5975F9ED3D2D252B0770040680268683FF3CC49490F264E3F27AD9BBBDB4B00D07703D2A408493FF7DB5340A34A733F0B162CF85B4FA169E1C2856FE4F33FFDFBF7DFD8DE02803F9A764FC79B3F4D4D4D4DFBD95340A37AF6D967EF499663E6CC99B39A9B9B733F00F4DDE0743F423F3F051AD9DD77DFBDBCCC94CC3FFF8EA899ADADAD9BDA63003F43D3EE3D3FCBE9028DEEE4934F3E7A59A7E745661A356A3F3F01403F4EDD5DDB74BF5926807EFDAEBDF6DAC77A4A4C4F3CF1C485663F3F42D3523FB99609603F0306EC9486A3F9DD2C02F1704B4BCBC3563F80069186A489663F00BA77F6D96797D290F4567D681A3F7EFCC5693F6D3F0040E3843FEAAE65DAD71E01F887782369F2E4C9733FD8F6EAB45E3EDEDADABAA5BD03000DA4766D935926803F1D3AF45FE7CD9BB7201DC9E0C1833B2C3F003F9AB295F43F80EE8D1B37EED6623FD77D4E3F0060252549B2F1CC9933AFBBF7DE7B3F97CBC9942953D6CB11A1697DFDD93B3A3A9269D3A6BD988E418E485027D7C4B8F9E69B3F79FDF5D7AB3F00B0B23FB8F33F93B9733F6FBCF186B18EC60B2FBC904C3FF5953F38D05109EAE43FB367CF56270160553F3F53AF6908DE983265CAA38E4A50270D7512805E244E35F187B8F78CB41978D35109EAA4A14E02D08BC4B9E2FE08F7AA66C08216A04E1A3F00EB6333F0DACBCF2533EFBF3479A4E3D46CC4ED783F703F00A893EAA43A09403F03AFCE9B9D3C7CDB49C9EF6F3E763F8FC573FE886B06409D5427D549001A3F98F5C86F966A046AE3D947263F3F0075529D54270168EC66E0D1EA993D3603F19C3FE29A015027D549751280866E061E9ED2DE633310CFF9233F0075529D5427013F68063403A04EAA933F009A81EE473FD5533310CFF9233F0075529D54270168E866E0F1BBC7F6D80CC473FE886B06409D5427D549001A3FF8CB3FC9C3B79FB2F42927E963F19C3FE29A015027D549751280866E06623CF9C0E54B3503F1983FE09A015027D549751200CDC03FC9E33F58FA9493F4B1783F713F00A893EAA43A09403F03F1493FBCBBD4E3B9FAF19C4FBBD70C803AA94EAA9300345E33B06041F2DCE3953F9347F5D808D4466C13DB7A37553300EAA43AA94E023FCDC0F2DE35F56EAA6600D44975523FA0A19B811579D77459EFA6FAA33FE843B6B40B5027D5490034034BFD415AD5463FFC513F3FFBA623593FEAA43AA94E023F303403D4D9271DF3D2317AF1BFFBD925EAA4A14E023F3034032C19986A4129669A5E109CD449433F4033606806583A302DEF71D449433F40336068061AC6BE3F46B5E75DE3A44E1A3FC0CA4B92643F33660CB9ECB2CBA69E713F3F1F3EFCCDD6D6D6E4A0830E4A060D1AB4F03F8F7CE384134E9879E699675E998EFF638F69060CCD402F0D4C3F44669CD449433F58F9B074FDF5D75FFEE31FFFF8CD5C2E978C1B372EB9F7DE7B93D9B36727F3E7CF4F423F77EEDCE4B7BFFD6D9286AAA4ADAD6D613E3F6AF0E0C1DF3F350386663FD8A7DFCA3FADECF6A893863A09343F1C1DF6939FFC64C1B13F3FA2BFFFFDEFC98A7AE8A18792E38F3FFEEF433F7974C080013BD99B3F4333B08E03D37EABF0BA57052775D2502701BA95669E8D6FBCF1C6CA11471C914C3F69A5C252573F4F4E0E3BECB0D7CD3A69060CCDC07A149856D7EB51270D7512E8AB81E93FEEB86FD8B0613FFFF8C7647578EAA9A7923480BDFEFDEF7FFF687B58333F3F3FCB5BF4616D7F1DD449433FFA8A98618AC0143FAD4EF1F5060F1EFC6A73733F7B59333F602D05A6D5756A3F2775D250270116896B98E294BC3FC3D4DD8C3F3F322F0D4E3BDBDB3F3F006B48D7451C3648C7A13F5D195D5F67710875D25027814617ABE49D7AEAA96F3F4C6BD2CD37DFFC7A4B4B3FF6B86640333F0C4CFBD5059F8BA3C42DFE774583534F3F9CD449433F1AD9C43FAF8A55F2FEF6B73F6BDA51471D35C7697A3F3F006B3830854317079F642582537D60AA8D43EA9E778D933A69A89340238A59A6F81CA658567C6DF8FD3FFF86D926CD806680D5A83FD35D005A5670EA6EFBF1DD6C3F2775D2502781463363C68C21B1F8C3DB595A7C651D76D861730E3AE8A01DECFD55D7DC3F251D7B690634038D743C2F2330EDBB1241A8BBE0B4A281A96B7072AA9E3A69A8934023B8ECB2CBA68E1F3F3E599B463FFD501A9A8EB1F7575D3F3F3F343535EDA1193F34C2F1BC8AC16579C169650353FDF77FA19F192775D2502781BEEF8C33CE78E5DE7BEF5DABA169FAF4E94F3F3FD9FB6F3F3FB776F78EAA664033D0978EE76E02D38A06969E82D386AB18986A5CE3A44E1A3F3F3F1FFEE6733FB75643D39C3973E6A67FBC66D9FBABB519E87C47B5BE293F6806FAD2F1BC8A816959C1E9B1B71198DEEECF3F69A893C0FAA2B53F3F7FFE5A0D4DF1FD3F5CF3EDFDD53FD4BF3FA7A3680634037DE978EEF7F667763F4E6F2730750D4EAE7152270D7512E8AB7F54D68515F86366AC863F9A81050B1624F3E6CDCBFE5DD6767FFDEB5F97D8E6C5175FEC73CD806372D5C77FFCC77FD4C2CDE8B7593FEC6686E9B1C58FBF1D3FF277D3DCAC4EAEE278FDF5D7D7F8F778FEF9E77B7C2EDEC07CF5D5573F801571E8A13F5C3F4D3F3F669AD63FA8F7373535EDD73FFF8D63BB753F3CF3CC333FFEF087CEDBD198C6BF713F1EAFDD3F4C1FFDE8473F6F3F3FA78C6EB2C926C9430F3DB4D4D7DE6CB3CDB2C7A74F9F9E1C703F4B3F3FA273BB9FFEF4A7711A4E6700BBF8E28BB3DBEF7C3F63E9FBA4542A250F3FFCB066603D3A9EFB2D7FB5BC3FD3B4321F806BA669B15C3F7158F196F7767D3C5F2C7F315F284FAA8D5C3FADFE7EFEFCEA4EB1DD7167DEB5F9F04279CFDA38F6FC3F4B7CFDD13FD4563F3FDBF1CF4B7D3F9E6B6F9FF08EF4E7BA683F3F4BBA8EFFFAC179BDA24ECE993327F9A77FFAA7E44F7FFA5372FBED3F03060C58625C733FD976513F85C212E3DFFFFDDF3F51E366CF9E9D5C77DD753F3E7FF1BDEF7D6F3261C284251E3FA95B6E3FF9C4273E91DDDE69A79DB2FA14412E3F78E289273F807AC3860D7B636D5FD3F43FFF3F3FADF626B36B73D96F5D86A6733F27F9FAD7BFDE6D688AC7E3F9DAB65B6DB555F29EF7BC27D968A38D9277BCE31DD9ED0846F19A3F2382FD0B2FBC90FCF13FCC42CFCD37DF9C5C75D555C9C73EF6B1E4B23FCBC6313F937CEA539FEA9CDD8AE7E2EB446372DE793F1FFCE0079372B99C3FC25934133367CED40CAC47C7735D4079B5DF9AB9A669558253435FD3942B56CACBDBA6BDBDBA711A9A6EE9EE3F3F4A9F9B9E7E9D8B63E44BD5DDFF113FF64E1F7BA8AD583EB1AD58796E64A9BAF38A3CD7DEDEBE61DB983F0E3CF87B493F3E3F0F3F829A7B433FF7DC733FF9977FC96E3FF8E083C9D9679F9D8DA8631B6CB04172EDB5D766CF5D7DF5D5C99E7BEE99D5B2EF7C3FC9F7BEF73F241D77DC71C9873FFCE13FC6B19BFE5DCDEA4B6CF7D5AF7EB5C7116F46DD7DF7DDC95FFEF297E4924B2E4976D86187E4A9A79ECADEB4BAEDB6DB3F809E9C74D2498FAFEDD5F3D2C27C8BD5F3565B93794F73733F3D3497EB4568BAEFBEFB924B2F3F1B63C78ECDB61D33664CE76377DD7557B65DB1584CDEF5AE7765CF6FBAE9A6C951471D957C3F5FC89EBBE13FB259A57DF6D9A7F31D3F60954A2579E08107B286E2E73FFF791696E2F15FFCE217C959679DB5564E8FD10CACBEE3B99BA0B2A2333B3D2D2BDEDDEA792B133F6FF5BC243F5FAAE4B3C03F3FB85C3FC4547F3CF29CEA563F3F1D9F49C3CD39DD87AEEAE87CA1DAEDEF315FACDC1D3FDBAE5039335F2A1F3FCFAD0F7572E79D774E3A3A3A92A33F3A0B31F158D4A978E3A756C76A63D2A449C9473EF291ECF6F0E1C3932F7DE94BD96C3F3EF0812C3CD542D3B469D392BDF6DAABF375AFBCF24A3683F4ECB3CF763EF695AF7C25F9DDEF7E975C74D1453F55F1DACF7EF6B34B85A65B6F3F9BB95FD6E97D3FD0503FFBECF16BFB739A4E39E5949B7D4ED3DB6E3297F54E7C3F4DBBEEBA6BF2CB5F3FB9F03F3FC2F16FDC8FC7EB43539C9AB2DB6EBB65E3431FFA50B2C5165B74DE8F517BC7B53622303FFD5FFFFAD79DA129025134131190E2FE4F7EF2933FA89D3FA7F3F5EBE694ACFBEFBF5F333F1D3F04A7E50596E57D0ED38A7E006E573123D2709FD33F54BEDB563F1BB747142ADF4CC3D2C8C521E6ACB6B11D5F5B1C92BE103348B59106ABB171BA5CFD639D81A7583F0D6147FD60DC942D3F4CD94CD24D7521A9907EDF9397F75C3FE9F73F463FD7BC74FA55F7DF753F3FAAF65836464FFBD0BAAC3F5836DF7CF364D0A041C9D65B6F9D9D56F7B39FFD2C0B469FFEF4A73F143FB68D6B8EAEBCF2CA6C56298251D4B9BDF73F39F8E083B3D79E7AEAA99DA129B68FE0539BA13FCFBDFBDDEFEE3FB3F2B59FA3FEF4BCA897F1F5E2EBF75B3C3FA1E93F3F3F00C289279EF8F1A14387BEF5F73F7D3F3F70E0C03FA54D3FF6FE9AB7AE4253FC91DF633FB2F1B9CF7D2E3F1CFF3F8BE7633F33433F3FBBECB24BF64E6BFD6331A64E9DBA44688A53583FFEF8ACF188774E6BE39BDFFC66E77611ACB6DC72CBE4E4934FCEDE698D9F2166ADE2763F8D45685A3F6FA667453FB8766583533F3F1A6967C769766DC56A65F0B849EFCA024FA97252AE54ED9F05975265602D4C3FAA7B2D119A4A95A9E973C3EB1F3BF26777BE6FD1D7A8F64F43CFA834043DDD56AA7CBBF6BDD2D7FC22FD5E433AEF47082A3F2CEFB90113266C34AC783F3F533E1AA7FBC5EDF47B3F412B6EC758D775326684D2BFBD593FFFFCF3B3D9B08F7FFCE3D9B547F1FCAF7EF5ABECB9786328AE6D3F93F158849A6F7C3FD9BFDB6CB34DF686517D683FB4E33F66A7DC3DFAE8A3D973713649DC8F3F6F92D687A698897AE49147B2D0143FCE9831237B4DFCEB3F802E463FF1C46F7FFBDBB5756ADE953F3FEDF53F3FB8E082EC42E7EE4ECF8BC7E3F9B81D7FD44F39E5946C3F2931CB54BB5F3F3FBE7807359A8B38DFBF7FFFFED9754A3F693F366C58B65D84AEF8BA713C1F7AE8A15930FAB77FFBB764DCB871D9CF10EFA4C66C568CF83A42539FD0D38CD38A06A6950D4EB5EF7740A3ED3F3F57ACB6D48595CE45203F3B76692B54AEEAEE7569783F4EEB5BD6D78ED9A274BB73EBEE773F0F713B168B489F7B6CF0B8073659DE73FFF8592B273F56765DB47D7542FEBCE99BF5A63A19334451BBA2B6C56C7BD4B3589CA6367EF4A31F755E3F3F6FB7DD76D98239716A71D4C1783FAECBAC9D3F3FD58250D4B608583F4D713F4EC7AB85A6586062FFFDF7CF9E6F6A6A724D13C08A38FCF03F3F39F2CD3F3F6FE0C03F3637370FB2D7FB76683FCEB595EFBA86A6783C9EEFFACE6BFC818F50533F7314A3BD3FDBE6F2CB2F4F463F955DC85C7F7A5E2C3F174A1F76D8619D8DC6E33F9EBD6B1A4DC5D0A143B346227E86784D34293162C64A683F62C6A9EBA97287F65BF9CF613F381DD2E53FE4A20FF9B1954F3F765DC2503F1031C3D3DDA210CB5A04A2531AA8D2D7FEBFFA4520D2FB57C68C5476BB5019519BC55ADE73D9CF3FA47CA17C45E7FD427952ED673FB1755D27E3FB451D3F896A3F3F3FBFF8C5AC2EC5ED3875AFEB354D1164AAD56A36533F62C488ECCD9FB81D231674AA85A6580427669E62A19BD8BBB1D044DC8F3A590B4D713D5584A698E1AA9D3F3401AC80214386CC88C23FC5F55331CBB492D72DD0874353BC8B1AEFAA463FCBE346308A774DE3BCFEB81DE38E3BEE583F4D716174AC8A17ABEBD56F1BA7AFC4A97DB1FA5E3FD1A0C4B63136DC7043A1A93FA7FA3F3FD0CA7C706D4FAF6B3FB08DD051BBDD36A6F27FBACE2CB55F5ADDB4EB6BD2EDBED43F10711D54BE50199F86AADFA4812C57FFDC8862753F1CBD983F71FA5DED94C0E53D373F75C7F43F73A3ABBBC5FD589CE21F8B5594BF9EFE2CFFB5AEEB645C27743F57244F3FFD7416886A0B35DC74D34DC9B6DB6EBBC4B6F7DC734FD2D2D292D5AB0838B559F9B83F6690E2768CDA3FD4DE20EA69743D3DAFFE9AA6AEA1E9873FFC61B644B9D00450273F3AECB0C35E8FA6734D3F63C68DE9F778AEB9B979677B3F4253CCFC44108A55EEE28F703FF7E3F15A688AC0543FFAFAEBAFCFC6213F3F04B5FB31E27CFCDA6A50B1FA5D7D688A774CA3D1D878E38DB3EB045E7BEDB5CE95A8E26BEFB7DF7E593F3F433F58FBC0C7783F4EE3D30C3F5D4FD58BC07348BF955F46BCEBEBDEEEE7433F3F533F918690C9D9754A633ABED0D376F15C043F95AE7E39F07AB1F8C3C8B1E5ED7B3F11868615A76DBDA2CFB595AA87A73FD7B811E74FFD48EDB1B8762AFD793F9CD29FE7D2EE4ED35BDB7532667E060F1E9C7DDC42AC5C17A7DCC5B54B719D662C0211B7633CF6D863D9BF71FA71FC8C3FE1F16F3F3F669F6AF7E3BAA4F8DA3F74279C70425607E7CE9D9BD5BD98798FFB3F696DA5BE7823293F8FD0146F68C54CFF77BFFBDDECF3ED3F313F0B4E3F574213401769E3DA3264C890BF46A15D9D9E7DF6D93F0E1CF8B4D3F21A2B343FE0587DA9EB88C76B3FCED18F534862063F9FF94C3F96BF8D773E63C9F16834A27988D0B4FBEEBB279FFC3F3F3F3FB76365AAF8DAF1EEED97BFFCE56CA9F238753F9AA2A98880B5FDF6DB77062CCD403F4E6F5777A7FEA14EAEF288D99E7C3E9F85A7B81F6F24452D3FBACEF2C42A7B31DBD43FE9A493963F5127A3EED5DE743FB1D8445C3F9FFB14A747C7E735C5A93FAABEF6B5AF65AF8B1A19B361421340375A5A5A0E1B3C78F0ABAB6B3F663F303535351D6F3F4E688A999C7827B3BBE7E2F155FDEC3F583F6FDC8E0B9FE31DD4987D3F5C929E5E1B7FFC6B9FCB14B3503DFD7C3FC1690D0630D4C93FE2F4E7B87EB3BB3787A2163FEBE96E442D8DD7BBA6096019D28073D0A041835EB9E13F5E7B1B8B433FF7DC732F8D53F2D2D16AAF6A060CCDC05AF6764FA9734A3F69A893003F3F0D1C383F64C890390F3EF8E03F3F4CB7DF7E3F69E8BA3F167D700D9366C0D00CF482E0B43F450DBFE83F69A893002B173F8CF0D4DA3FF78C33CE78E4AEBBEE7A7AF6ECD9CFC5A94DE1F5D75F9FF33FFFF9B18E8E8E9BDADBDB6F6D69693F61296697AC92A719303403BDC0CA9E62E7943C75D2502701564D1A86B66B6E6ECEA561E8BA743C998EF98B3F542FFE9D958E493F2666A8EC2DCD803F584F83537C4ED0AB3FF0836BD549F5493F4033606806D8777120DA7719CFBF2030A9933F098066C0D00C34B29E669C9C92A74E1A3F003F4333400F01496052273F751200CD803FC29A017A084E3F26D449751200CD803FC29A01BAB76F2C66D3CFB2E2EAA43AA94E023FF0475833403F3FD449F5493F4033E08FB066003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75D25027013F183F3F75D25027013F183F3F75D25027013F183F3F75D25027013F183F3F75D25027013F183F3FD44975120034033F3FD44975120034033F3FD44975120034033F3FD44975120034033F3FD449433F40333F3F084DA8933F0940AF522E97FD113F637E3FBCE93F9A50270D7512805E64DAB469CFCD3F3FE25E3066CF9E7D6D3F3CEAA8149A50270D7512805EA452A9EC7F3F77BCFCFCF3CFBF3FF2BA7B3F1A818E8E8EA7D371A0A35268429D5C4381433F805595FE01DA6FCA9429F7C7290F71AEF83FAEB9E69A249ADBF5F1675F3C623F3F109A5027D7D4B8EFBEFB9262B1984C3F513F80066D6C274573DBBF7FFF8DED0D3F58523F9BBEF4D24BF352C9E0C1836FB24700A0C1343535ED9136B66F4673DBDCDCBC3F82D0044B3F6B3FC962D3A74F9F9DD6CA033F0068ACD034311ADBC5E37E7B043FFEE1B5D75EDBF5ADB7DE5A98D439EDB4D366B5B6B66E693F00406334B4BBD766996A230D51FBD933084DB0C83F7366265DBCFCF2CB735A5A5A0A3F003446433B3F30D5669B5CDB843FFDFA3DF3CC3327253D3F71E29C78E3C95E0280BEDD3F35CB541BCED74768A2D1A5B9683F0B16FCADA7D0B470E1C237F2F93F6F320140DF6E666F3F302D1EF7D843084D34B2679F7DF69E643966CE9C39ABB93F676F0140DF6C647B9C65726D134213F4EB77F7DD772F2F3325F3E7CFBF238EF1D6D6D64D3F00E87B8DECA46505262B3F34D1E84E3EF9E4A397757A5E64A651A346FDD24C1300686EC17145C3BAF6DA6B1F3F313DF1C41317C6A9CCAE6902003F38AE685803060C3F0D47F3BB5904E2E196969687AD9E07009A5B705CD1F03FFBEC521A92DE3F4DE3C78FBFB8A9A969B4BD03009A5B705CD1F0E2F4BBC93FCFADFB60DBABD3E3FAF1D6D63F3F00D0DC82E30A52433FFDD779F3E62D48473278F0E00E9F6507009A5B705C4117E3C68DBBB5582CC6C7314C3F0040730B3F3F4EC78B3F1687B0370040730B3F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FA0518EABB6C2948F3FA89300806600C7550FC755BE58E9E8FEF13FF385F2A4DAC815ABD3EAEFE7CFAF663F1F77E65D3F2F94F7AC8D63CFAF6E53FF7572A3A77DA8AD546D1A31B6E39FBB7E8F9E9E6B6F9FF08E5CB17C51BE5019BFD42896CFF0DB443F00CD806680B5725C0D2D4D3F0D4D3F5FDE6BDBDB3FA7A1E996EE9E4B43CFA0F4B9E9B962E5E218F952753F04AF8EBDD33F6A2B964F6C2B563F59AAEE3FCFB5B7B76F3FA6E383DD8DFC7993DFEFB73F09003F3F006BE4B84A43C767D29074566DA4A1E5C65CA17A7BFD6311663F46E9EBD270734E775F370D4CA3F385EABEDD3D977EBDBB23E8643F2A67E64BE5E3573F502701003F00EBE4B8CA8DAE6E19333A31D2DBBBE54A3FE58AE54B6B8FC5F8C13F5BA4613F3183541B693F1BA7CB3F3F788A953BF3A5CA51F1BA250353369374535D482A3F2B272FEFB9B6B11D5F4BBFD7753FA3A77DC86FD4F16C2F00806600D6E8713F3FB5952AFFD9DD354D6D85EA5E4B84A652656A1A6A86D73F76E4CFEE7C5F169A4AD5FEE9D7189586A0A7D3AFF7EDDAD7485FF38BB6627548E7FD34ECB495CA0396F7DC800913361A56BCE59DB140459CEE17B7D3EF714A04ADB81DC36F1375120034033FD6E87135ACD8B14B5BA1724916580A3F717F59AF4DC3CB6DFD926483656D13B345E976E7D6DDEF88451EE2762C163FF7D8E0710F6CB2BC3F835BB172F2886265D745DB5727E4CF9BBE99DF223F003F603F57C38AE58FC7A20EB599A258252F0D2D37C4620FDDBD6E598B40744A03553FFE5F3F10E9FD2B63466A5130AB8C4843D0B12BF25C3F3F295F285FD179BF509E54FB59F2A5CA40BF4DD449003F68065823C755AE50FD7E1A58AEEF7A4D509C7A3F7E75AC5AD7F5756D632A5FEA6911886CE18842657C1AAA7E3F9673F5CF3F56F748BFE68BE93FA7DF0D1E37E95D2BF25CACE83F5031BABA5B3F794E75ABF83F07BCAF3F3FF96DA24E0280664033C06A7758FEC749BE546DEBE934BB5CA972525C9FF48FB0D4F13F34712A5DFD72E0F562F1879163CBDBF7F43D230C0D2B4EDB7A459F6B2B550F4F7F8E7123CE9FFA91DA6331239686A66A04A758B4C2697AA893008066003F383F003F003F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071058E67004033003F1C3F008066001C57383F003F0038AEC03F006806705C81E319003FE0B8023F003FC071058E67004033803FFAC23FAC783F479E53DDCA1E05003F38AEE893C773AE503E265FA87C77F0B807363F3FE58A958BD3FBE3633F2BF7E43F7BC776E9ED9373A5EA015DBF4EBADDFEB942F5687B140034B7E0B8A24F1ECFED9756374D03D1ADB5D93F40B9523FB942E5CC3F3FD5B63FEECC3F4F033FB952E5CB6D85EAE99DA358ADA48F5F3F540FB2570140738BE3CA71453F9E47142BBBE68AE58969281A9786A059E9B83C0D50B78F1C5BDEBE733F3F7FDEE4F7B78DE9F84C6DE48AD569B9B1E5CF0D2DDDFE617B1500343F3F57F4A9E3B9AD543D3C0D4AD7A53F1D47A681E9A7E9634D31A3942F94BF93FE5B1E3061C2466DC5EA3F5015ABADEDED133FC1AAF6752258D99B00A0B9053F7DF6785E1492AA07C6F54C717D525BB17C625BA1725E5BA9F23F34DDD6198ED26DD26D072DBA5D191B3F2B56B74BB7BDC4DE04003F38AEE8B3C773BE58396B6869EA8E31BBD456A85E3F55EE5D34FB543F7DAE503FAE5F1A59AAEE1CB78715A76D3FAFBCAD45200040730B3F1A20345527C4621069483FBB5F285F113F3F3F682B55BEDD199A4AD55FB7B7B76F18B78FFCD99DEFCB97A67E3A7D3F4714A77ED6DE04003F38AEE893C773BE58F951AE583F57A87E7F78A1F2D5783C3F6F1BD3F1855CA9FCAFB56D7385727BB65DB1DA123F3FDBF1CFE96B47C5A97D3F00686EC171459FD47AD4F149BE541918B3471180169F92776D3FC5EC532C3F416AD1F54ED59658392F57A88C3FA7749BEBE3DFC5B76F6C1B5BDDCF1E05003F8D770C4D8AE36839E37E7B0A7512003FD0A8C7D0EEE9787359A1A9A9A9C9BBEBA83F008066803F8E6E5D4668BAA77FFF3FDB4BA89300806680463E8E763F343537371F600FA14E02003F1C4BDD5FDB74BF5926D44900403300FDBABFB6C9B54CA89300806600EAA42169A25926D449004033003D87A63DEAAE65DAD71E413F003403B0F431955DDB643F7512003F40F7C7D4EE3FD4490040333F3FC9C63367CEBCEEDE7BEF7DAB5C2E2753A64C31D6F2E8E8E848A64D9BF6623A06392251270100CD402F1381E93FEF4CE6CE9D9BBCF13F3F1A2FBCF0423275EAD4573F0075A0A31275120034039A815E24663FA65E139CDE3F65CAA38E4AD449003F68067A3F254F603F230D4D6F3A2A51270140333FE845E29A1A61A5573FFF7FA04E02806640333F86A6D75E7E2E9979FFA5C9231DA766236EC763828ED0843A090068061A3E343F6F76F2F06D2725BFBFF9D825463C163F3B42133F003F68E8D034EB913F15986AE3D94726093B42133F003F68ECD0F468F5CC1E43533C273F4DA893008066A0A143D3C353DA7B0C4DF19C3F34A14E02003FA14968129A50270100CD80D0D4FD88D5F27A0A4DF19C3F34A14E02009A813F4D8FDF3DB6C73F3F3B42133F003F68E8D0F4973F92876F3F65E953F3D2C7E239614768423F0034030D1D9A623CF9C0E54B85A6784C3F9A50270100CD80D0B46041F2F83F3F352F7D2C3F763FD449004033D0B0A1E9D579B3933FDE5DEAF19AA6782E3F783F563F4E8ABAB89C713F050042133F342D583FF77825F9C3E4513D06A6DA886D625BB34E4213AB5413774FC79B3F4D4D4D4DFBD953002034D18B42D3F26697CC3A094DACF6BA783F423FFDFBF7DFD85E0200A1895E149A5664766959B34EC28FD0C44AD7C5DD7B0A4DCDCD3FD843002034D1CB42D3AA06A6DA107E3F563F76776DD3FD663F0040683F3F4368629DD4C6A5AE6D722D1300084D084D86D0443F244D343F00084D423F34D17368DAA3EE5AA67D3F00103F3FA189A56B64766D93592600103F3FA189544B4BCB764D4D4D43D3DA785D3A1E4FC75F173FCD4FC7938B4F3F26B6B33F0040684268129A84A686114B89A7634A3ADE583FDB7619D574FB413F00084D084D42137D3FEE90069FC92B1194BA1B770E183060277B13003F3FA1893EA5A9A9E9A0810307BE541F805A5A5A92D34F3F3DA9542A3F3F93FC3FFE6F12FEFAD7BF26B367CF4EEEBEFBEE64F4E8D1C93F1F3F38BD6A3F003F3FA1893F98F64B43CEDFEBC3D295575E99CC3F375911F3E6CDCBB68FD7D587A7F46B7EDFDE05003FA14968627D0F4C073F3F234664B34A3F5E77ECB1C7760D4E663F0040684268129A586F6B3FF5A7E49D723F9DA7E0AD3F75EFB4D34EEB7AAADECEF63600084D084D4213EB9D343075D4CF30BDDDC0541F9CBA3FDD696F0380D0843F34B15E8965C5EBAF615AD553F29675AA5E3F4E4E3F00A18955D0BF7FFF8D85A6BE139A96F7FBA4D785A629B540133F3FD75C738DD92600109A5815692FB5CDB3CF3E7B4F2C577CE289278EECA9D9169AD68FD0B4A2BF4FD65E184AC75ECBDAA6A5A565BBDA3F311BF497BFFC658D84A65855AFCB723F3F0180D0C4723CF3CC3327CD9F3FFFCD5A53B560C182BF5D7BEDB53F7DF4D13F9AD6BFD03FBF4FD65E1D5B7C3ADC94A6A63FBADB267D7C686DBBB33F2B5993E2739CEA423F7E43003F00A169C084091BF54B3FECAD95F3DA6BAFEDFAFCF3CF3FD55363F5E4934F3FE38C332E6C6D6DDD5468EAFDA169557E9FACDDD054376E3FF3943E765DEDF93BEEB8638D86A69881ACFB59263F01401F094D6D85CA556DA5EAAF73C5EA6FF2C5F2D77385F298E185CAE7DBDBDB373F2B3F1F56ECD825B6CB95AA07A4F70B3D8FEA3E8DBE4FD39E69D359B3665DF1D65B6F2D5C5E73B570E1C23F4F9EFC623E3F77A1A97786A6B7F3FB649D85A6CE99A75A784A3F5E7B7C752F00D1D5ECD9B3EB7F8E597E4300D04742531A86FA1FF9B33BDF9786A7F3F2E7953F5ABAFDC3B962E59769107AA0AD54F9766D3F56C38AD3B68E6DBB8E5CB19C3F2A3FF2FE7CFEF93FF3E5975F7E6515AE8358703F173F4D3FACF4A271DF7D3F6FE7F73FEC5B3F3F34D5CF3CA5E3F5DAFDD5B5CCF8B23FAFFBDEF3FD8600A08F341B47B45F3FD4DC3F71CAF864603FC9E1234F4F869C784172F888D392A37E7255D272C861D97647B65F9AFD3F745472583FD9F8DEF093B33F3F3F1978C8E13F34307D76148BC5EC42F055B9783C5E1B5F23DEA55E5721E1A5975E3FCA656D133F58B060A5BF761A287B7C6EFEFCF9C9ABAFBEDA3F533F56C7EFB39146F3C09664E0A0D65EFF733FF5DFCF5F1A003F8696A6EE18334C6D632A5F6A2B567F3F54460C2F94F78CE7DADB3FB78DADEE3F5BF9D4B06275BBB642F582FC793F3FCA93F2C58EBD178D4A476C1B3FFABE3F3F0F1E7CD3F4E9D39F5BB870E1DF57A4B97AF9E597AF1E326448B5A9A969626A3F85AF7DED6BC9B9E79EBBC4633FF658E7EDD75E7B2D1AC0E47FFEE77FB2539CC63F3F733FC9FEFBEF9F7CF2939F4CB6DA6AABE4D9679FCD02C775D75D3FE2433FDFFBDEF72613264C58E2F15A90BAE5965B924F7C3FD9ED9D763F3B2DEEF5D75FCFBE3F4F3CB1CEF6C70D37DC90BC9DDFE7FAB6725AAE503E265FA87C77F0B807363F3FE58A958BD3FBE3633F2BF7C4FFEFB15D7AFBE43855B7EBEB633F573FBDAEDEFCE966DC9F3FF68B3FD3DBAF9A69020056BD512A558E4B1B9DDB3F4A6FFF2237BABA433F9DBD3F2A9F982F54F7AD35446DA5EA3F8AD53DF2C5EAC878ECA8F3ABEF491BABCBA2C98A53F7ECCD45E243347FF4A31FCD9A376FDEDC655CFFF2701A3A2E8A6B2D62FB78DDBAB8A6293F93CF7DEE73D98860B3DD76DB753FFDF4D3B330134D606C1BB3411164FEFB3F3BB9EAAAAB92F73F3F2AB2D5C87EFDEB5F273366CCC88255FC776CB6D966C957BFFA3F3F9B6C925D301F4B3F5F723F3F3BEC903CF5D453C9473FFAD1E4B6DB6E3FA1A93FC4AA3F3FED9756374DEBC03FCFA96E3F44558FCE95CA3F3F2A67C69B2AB5ED3FF3AECDD3FFEFEF48EBC597DB0AD5D33B47B15A491F3F3F07ADE3D0D41996EAB6714D1300B0EA62E6E807E3A66C113FA56168C2E22035350D4FBBA5F74B9DE1AA5039351E3FA962E5C2B4B91A3F56CE8A6B3F3D5E39D5DEFC87010306BCA7A5A5A570FDF5D7CF7DEBADB75EAFEBA9E6A741E0C2F4B987D3C66E746B6BEB96B5D7AC8BD0F43F0F643FC66EBBED3F7EF8E1D9EDF4E74FB6D8628BECF9D8EEA73FFD6916626A239EDF633FBAFD9AD3A64D4BF6DA6BAFCEFBAFBCF24A363FB350B5C7BEF295AF24BFFBDDEF928B2E3FD968A38DB2AFF9D9CF7E76A9D074EBAD3F471C713F4FEF5B1BABE7ADCAEF737D35A2583F3F7A625A07C6A5FFAFCF4AC7E5F1C6CAC8B1E53F374A3FF2E74D7E7FDB988ECFD446AE589D961B5BFE5C5C13B98E423F1158BBFB3FABE701003F4EC38B051FB277874B3FE2F4BC4501A97A423F003F3349B56D63262966948E3DBFBA4D7D3FAC78CB7B6306AAD11781584643B77B3E9F9F3173E6CCD969103F6AD4A85F4673178F77DD766D87A68E8E8E64E8D0A19D3F1FF948B2F7DE7B273F7248B2C1061B243FFCE7B3C76FBEF9E66C46E8CA2BAFCC824C9C6677F1C517271B6EB86136A3543F6AB352117CDEF39EF7748E78DDBBDFFDEECEFB975D7659E7CF517F7A5E84A6ADB73F193E7C78F69A3F42D3934F3E3F3EA769657E9FEB93F87F380D4AD7A53F1D47A681E9A7E9634D31A3942F94BF93FE5B8E8F1F486BC4902C5015ABADEDED133FC1EA1F6FAC546F5F47FF3F35B3D495CF690200565984A2EC739852316B34BC50FDBF693374602C3D3F497765A7E12DFE8CA6B81F21ABBB11335471CD933DDABD68E69A9B9B738B9741CEF5D4DCADEDD054AD563F00748E7DF6D9270B2A119EEA1F3F79723F4FF1FC3FEE98353F3315334A3FFFF9CFB3D93F7EF0834B04A1D82E4EB97BF4D147B3D7DD7BEFBDD9FD98A11A3F7E3FDBC64C3F3F9285A6B83F4EF58BD7C4BFBDE9C36D57E6F73F06A7A645FFFF3FCA4E3F964FCCAE772C55BE913F7F5B67384AB7493FB4B82E8C8D3F5DF358B9A4B7FEB7C5F586E9EFEBCDF89DA5B73F01D684580464D0A0410BEB423F2A20003F69D3F3ADF89CA67CA9928F993F4A3F00443F723F559BE21A87B652F99A988DEA6E44C8B227572C3C2DEBF9753F4D37DD7453769DD1BBDEF5AEE4C4134F3FBF583F4E9F8B2013DBDC733F59988A20336CD8B0E4C0030F4CBEF5AD6F65A7D7A5C12139EEB8E3927DF7DD773F14B3559B6FBEF912334D713F4EC7AB85A6E9D3A7670B49C4F34D4D4DBDF29AA655FD7DAE6FE28D93581826669762D1975CA972EFA2D9A7CA953F6C9DE1AA503D7D64A9BA73DCCE4E3FAFBCEDBA5A046265C4E736D5C24CCC9A3FD75C734D3FD39D3F00C06AB6B643D3EDB7DF9EECB2CB2ED969751164220CE572B9EC143F3A11A2463F996D1B2BE0C50C50049998391A31624472F4D14767EFD8C7AA791FFEF08793ABAFBE7A89D0F4B18F7D2CF9F33F9CCC3F337BDD830F3E98DDDF733F3B43533F18A1E93FFF78E7E979EB4B68EA6B623F16834843D2D5D9FD42F98AB88E29DE4CE9FA796DF1C1D7713B3E3F5F9AFA3FCD774471EA677B79683A3F6862B669752F08115F6FE0C03F3F5C7790AA0600B09E87A6385D2E167878EEB9E792F7BDEF7DD9E20C3F7F7C167E1E7EF8E16C3F424DAC8817B34E2FBCF042E792E3B5E5C9633F3F66905E7CF1C5254253BFBA3FBA8EAEA7E7D55FD3D43534FDF03FCC9628179AD66460AAFC28AE633FAADF1F5EA87C351E8B65C5DBC6747C21572AFF6B6DBB5CA1DC9E6D57ACB6C4A93FC676FC73FADA5131233FFC77A661A65A0B3511FC57D7F2E3712DDFC83FFF5E3FCBD4D7662201001A3234D58F0F7C3FC985175E98CD0AD54604A67E8B97183F9CA6B8C6293F8F95F5BEF9CD6F26DB6EBB6DB644F9A73FFDE92C50C5B63FFDEF3F4E38217BCDDCB973B3D73DFEF8E3D93F63C6642B8CD53E3F425A84A6783F66B8BEFBDDEF76AED617D75DC5CCD7E5975F2E34ADA9C054287F275F3F8CD93F408B4FC9BB36668F623F167E3FB5F87AC796B8CE313E3F669CD26DAE8F7F17DFBE313ED7AD97873FD2F1422DDC9C723F6F3B3845603AEDB4D3EAAF637AB5B9B97967150D00A08F85A6A38E3A2AD974D34D3F541BB1E4785CBBB460C1822542530498B8FEE8E4934FCE4EB59B356B56B6ACF8C1071F9C9C79E6994B7DEDB8462A5E178B40747DEE57BFFA5576EDD3F7BEF7BD6CA9F2F8BCA6583F42556DE189EDB73F79FAE9A78526568BF43FA8B628446DC669554FD58BD7759961725A1E00405F0D4D2B3A22BCC4A973F1EE7A3F52F5CFC7735D5F13A1EBBEFBEE5B6ADBDAF673E6CCE9F1FB4518AB8536A1893F0D37ADF53FAE718AC52122E0AF3F79B1E8433F4C31D24076BCBD0B00D0E0A1A99186D0D4B7C58C533AE6D5879E084FB19C7E7C006E3FD54EDD8B370866CF9E9DCD80168BC5E4D0430F7DABFE75714A5E04317B15004068129AE8533FA7FAA5C85771DCE91A260000A14968A2AF87A7031787A73757262CC5EC92553F00003FA18986D1D2D2B25D1A9E7269183F1D4FA663FEE28014FFCE4AC7A4741C1333543F00803F34094D000020341942130000084D86D0040000423F34010080D064084D0000203419421300002034094D0000803F340100004293D0040000084D4213000020341942130000084D86D0040000423F34010080D064084D0000203419421300002034094D0000803F340100004293D0040000084D421300002034094D8E4A0000103F3F00003FE57259583F637E1A9ADE74540200402F326DDAB4E7E6CE9D2BB0F43F7BF6EC6BD3D0F4A83F00007A914AA5B2FF1D77DCF1F2F33FFFBAE0B2EE663F307574743C9D8E031D3F0000D0CBA48DFA7E53A64C3F4E0D8B6B6A8CB53E623F2A300100000000000000000000000000000000000000000000000000000000000D3F031A6E023F8C63710000000049454E44AE42603F, 1),
	('7502', 1, 'E:\\LY\\Barbecue\\adProject\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', '7501', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E6365220D0A20202020202020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4449220D0A20202020202020202020202020786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F4449220D0A20202020202020202020202020747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F5850617468220D0A202020202020202020202020207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0D0A20203C70726F636573732069643D22457870656E736522206E616D653D22457870656E736550726F636573732220697345786563757461626C653D2274727565223E0D0A202020203C646F63756D656E746174696F6E3EE68AA5E99480E6B581E7A88B3C2F646F63756D656E746174696F6E3E0D0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E5BC80E5A73F0A223E3C2F73746172744576656E743E0D0A202020203C757365725461736B2069643D2266696C6C5461736B22206E616D653D22E587BAE5B7AEE68AA5E994802220666C6F7761626C653A61737369676E65653D22247B7461736B557365727D223E0D0A2020202020203C657874656E73696F6E456C656D656E74733E0D0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0D0A2020202020203C2F657874656E73696F6E456C656D656E74733E0D0A202020203C2F757365725461736B3E0D0A202020203C6578636C7573697665476174657761792069643D226A756467655461736B223E3C2F6578636C7573697665476174657761793E0D0A202020203C757365725461736B2069643D226469726563746F7254616B22206E616D653D22E7BB8FE79086E5AEA1E689B9223E0D0A2020202020203C657874656E73696F6E456C656D656E74733E0D0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E4D616E616765725461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0D0A2020202020203C2F657874656E73696F6E456C656D656E74733E0D0A202020203C2F757365725461736B3E0D0A202020203C757365725461736B2069643D22626F73735461736B22206E616D653D22E88081E69DBFE5AEA1E689B9223E0D0A2020202020203C657874656E73696F6E456C656D656E74733E0D0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E7374796C6566656E672E67756E732E6D6F64756C61722E666C6F7761626C652E68616E646C65722E426F73735461736B48616E646C6572223E3C2F666C6F7761626C653A7461736B4C697374656E65723E0D0A2020202020203C2F657874656E73696F6E456C656D656E74733E0D0A202020203C2F757365725461736B3E0D0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9F223E3C2F656E644576656E743E0D0A202020203C73657175656E6365466C6F772069643D226469726563746F724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226469726563746F7254616B22207461726765745265663D2266696C6C5461736B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22626F73734E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D22626F73735461736B22207461726765745265663D2266696C6C5461736B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22737461727422207461726765745265663D2266696C6C5461736B223E3C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D2266696C6C5461736B22207461726765745265663D226A756467655461736B223E3C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D226A756467654D6F726522206E616D653D22E5A4A7E4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D22626F73735461736B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203E203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D22626F737350617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D22626F73735461736B22207461726765745265663D22656E64223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D226469726563746F7250617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D226469726563746F7254616B22207461726765745265663D22656E64223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6F7574636F6D653D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D226A756467654C65737322206E616D653D22E5B08FE4BA8E353030E5853F20736F757263655265663D226A756467655461736B22207461726765745265663D226469726563746F7254616B223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6D6F6E6579203C3D203530307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A20203C2F70726F636573733E0D0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F457870656E7365223E0D0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22457870656E7365222069643D2242504D4E506C616E655F457870656E7365223E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223238352E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2266696C6C5461736B222069643D2242504D4E53686170655F66696C6C5461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223430352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226A756467655461736B222069643D2242504D4E53686170655F6A756467655461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223538352E302220793D223133302E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226469726563746F7254616B222069643D2242504D4E53686170655F6469726563746F7254616B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223733352E302220793D223131302E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22626F73735461736B222069643D2242504D4E53686170655F626F73735461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223535352E302220793D223235352E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223737312E302220793D223238312E30223E3C2F6F6D6764633A426F756E64733E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223331352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223430352E302220793D223135302E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223530352E302220793D223135302E3136363131323935363831303632223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223538352E343333333333333333333333332220793D223135302E3433333333333333333333333334223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654C657373222069643D2242504D4E456467655F6A756467654C657373223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223632342E353533303732363235363938332220793D223135302E3434363932373337343330313638223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223733352E302220793D223135302E31333932373537363630313637223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F724E6F7450617373466C6F77222069643D2242504D4E456467655F6469726563746F724E6F7450617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D2233372E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223131302E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F737350617373466C6F77222069643D2242504D4E456467655F626F737350617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223635352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223737312E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654D6F7265222069643D2242504D4E456467655F6A756467654D6F7265223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E343334303237373737373737382220793D223136392E3536353937323232323232323233223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223630352E313338343038333034343938332220793D223235352E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226469726563746F7250617373466C6F77222069643D2242504D4E456467655F6469726563746F7250617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223238312E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F73734E6F7450617373466C6F77222069643D2242504D4E456467655F626F73734E6F7450617373466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223239352E30223E3C2F6F6D6764693A776179706F696E743E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223435352E302220793D223139302E30223E3C2F6F6D6764693A776179706F696E743E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A202020203C2F62706D6E64693A42504D4E506C616E653E0D0A20203C2F62706D6E64693A42504D4E4469616772616D3E0D0A3C2F646566696E6974696F6E733E, 0),
	('7503', 1, 'E:\\LY\\Barbecue\\adProject\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '7501', _binary 0x89504E470D0A1A0A0000000D494844520000034D00000159080600000044DBC43F00002F4D4944415478DAED3F905C653FF0B92CBAAC65AD5A4AB1945AA897F2525ECAB55628B45834D7725DD68D8A6876984C24633F7C844C77808B80914196DA0848323F1A451164F9948D6C644132DD4D1203142085D9284A2008492484853F263F393F3F63A7A727C94CBE663FBFAAB7A6A7FBCC47CE9C3CFDFCFB7DCFE93F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0B99C723F89611886B1F3E13F003F343F0C47F942E5D33172C5CA499D732A63CF9D533A223FF39A25EFC875976667DB9D53E8F950BE50FA4CB67DEDE82C3F3F6FC15BEC4DD449004033C0A8939BB5F8F0F8D859AC9C764E3F3FC252673FB5B358BAB93608A5C1685A3C3F78154B67D893A8930080668051295FA85C3FBBE7B05C77E5E2F87C5A77F9A3B942F9E498553FCB85BE70552CCFDBBE7DF9937DB353E976DBEF2BCDB427512701003F00A35284A5AEAEAE833F74E9B4EECAD1F9AB4BEFCE1E3F79B5DBC5C7CE42E9AAF8D8D575DB9B738552EEEC393DEFEC2C565AED49D449004033C0A81321A9B3BB7C75BE583E2BCE5F8AA57A9DB3CBC7C5633F545F682A94E7548352BADDF6F33F177416CB9F8FF3A0D2ED8E3F512701003F00A34E9CBF949DB7942F94AF3F3F147D3FA68A95D3B2EDF2732B473FA5B6583F23EE8B70550D5985F2B4F83A7B137512003F30AA54034F1A3F04C54C512CCFAB86A1623F57AC5CB2C3B6C5CA49F9423F8DBE4FCC48D99BA8930080668051293F3F3A542F0031ABF291B8725EFAF935D3E72E7A6F4D683FDF5D39B1D1E5C673C5F20C7B127512003F303A43D3759543AAE73215CAD74FEFEE3F9DB37B3E1CF7C7A5C57385D2F7F3B37A3E109F67B3508DA4616A3F3F0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F005027D549003F3F003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00403F003403003F003F00502701003F00803A0900680600D44900403300A04E02003F007512003F00A89300806600403F00340300EAA43F00003F00D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300A04E02003F007512003F00A89300806600403F003403003F003F00502701003F00803A0900680600D44900403300803A0900680600D44900403300B0773CFFFCF35F2A140A495A2BDF676F00803F403F490E79E9A597D6A792C99327FF3F01003F801AAB56ADFA71D2EBFEFBEF5FD3D6D67692BD0200421300A9575E79E5AFB76EDDBA2DA971F9E597AFEAE8E878BBBD0300421340D35BBB76EDCAA4CE3F1BD6B6B7B7773F0020340134B5679F7D76463280F9F3E7AF4DEBE6313F008CDE803F423FC6C33FD0ACD25CF4575BB66C796DA0D0B46DDBB657F3F9FCB231633F6C6F01C0E80C4DC7A4E3F59D85A6D6D6D6B1F614D0AC56AF5EFD403F2B57AE5CD5D6D696B3B700603FA7BB77123FF0EA29D0CC3F5DBAABCC946CDEBCF9BEA8991D1D1D87D86300303A433F033F97D3059ADD37BEF18DB3773F2F32D345175D74AB99260018FDC1A9D1B94D0F9B65026869B9E5965B7E3750627AF2C927BF6B561E003F343FB7C9B94C00DB8D1B37EEC8341C6D6E701188E5EDEDEDCB5D3D0F009A441A92E69B650268ECCA2B3F3F696B6D68BAF6DA6B7F90D6CE593F00344F68FA58CDB94C273F007F122F24DD733FEB6ADED8F6A6B45EAEE8E8E878BBBD03004D243BB7C92C13407F53A74EFDD4FAF5EBB73F3F79728F8B3F00407386A6EA95F4EC0980C6E6CD9B7777A15088F33EE7DB1B003048493FBC72E5CA3F7CF0C1ADA5522959B870E1881C119A46EAEFDED3D3932C5EBCF8BFD2313F09EAE43F77DD7557B54EDE713F3F000C5634024B3F49D6AD5B97BCFAEAABC6011A2FBCF042B268D1A297D3C6E0CB8E4A5027F7C558B3663F09004311AF9C0A4CC3A6217875E1C2858F3B2A413FD449008691586AE28978F88C3F78DD5109EAA4A14E02308CC45A714FC2C33F70410B50270D75128091D80CBCB2E1B964E5C33FBFEEF96675C4EDB8CF13B86600D44975523FA0E99B818DEB3F3F3E23F9D55DE7EF30E2BE78CC93B86600D44975523FA0A99B8155BFFEF77E8D403656FF7A3F713F00A893EAA43A09407337038F573F6033108F79123F803AA94EAA9300347533B07C61D780CD403CE6495C3300EAA43AA94E023F3F6806409D5427D5490034038D475C056AA066201E3F3F0075529D54270168EA6660C5D239033603F19827713F00A893EAA43A09405337032FAE593FBFF792FE4B4ED2FB3F4FE29A015027D549751280A66E06623CFDC80DFD9A81B83FB86600D44975523F4033B0654BB2E2FEEFF45F7292DE178F79123F803AA94EAA9300346D3310EF64FFC4D2E2806BF5E331EF763F0075529D54270168BE6660CB96E4B915E5E43FEFB968C046201BB14D6CEBD5543F00A893EAA43A0940533403BB7AD5D4ABA93F5027D549751280A66E0676E755D39DBD9AEA495D33308ABC3F409D5427013FF47B421A6A233F4FEA9A8151E2C474243F5127D549751200CD803FA0C6A7D33F1DB37A3F8EB54BD449433F40336068063F30654129669A5E109CD449433F40336068063F9876753FEAA4A14E023F3034034DE3C45D04A3EC713FA9933F093078493FB26CD9B229D75F7FFDA23F673F6DDAB43F3A3A92534E39253F61C2B6333FF3D53FBE78E5B7BEF53FD3F1BFEC31CD803F18A681695781C88C933A69A893003F4B77DC713F975D76D9EBB95C2E3F6F5EF2E03F266BD6AC49366FDE9C84F8B86EDDBAE497BFFC659286AAA4B3B3735B3E3FFDE4C9934F3F350386666018F874CBE0663F3FEAA4A14E023F0D4793FEF99FFF79CBF9E79F5F0D446FBCF146B2BB1E7BECB1E46B5FFBDA1B53A64C797CDCB87147DA9B3F4333708003D3D8217CDD46C1493FD4498086D2CC73F09D77DE593EE38C333F0B160C2A2CD5BBE79E7B92493F6D32EBA419303403232830EDADAF473FD449603FA6FBEEBBEFA1733F2779E2892792BDE1F73F7D3FB04DA79F7EFAD9F6B06640333FD84F7675D187FDFD7D50270D7512182D623F02539CA33FC5F73F79F2C6B6B63FF6B2664033C07E0A4C7B6B693F2775D2502701B68B73986249DEDE9A616A34E374EAA9A7AE4F83D351F6B66640333F527F113F918E89BD1F07A3FEEB5C1C423FD449A0D9C555F2BEF9CD6F3F3FED4B77DD75D7A6F6F63FEC71CD8066807D1898C63F3F4489EBFDB8BBC169A0AF139CD449433F9AD9FCF93F35AE92F7DA6B3FFBDA59679DB53F3DCD8066807D1C98C2C4DEE0930C22383FA66C9C5AF3B8739CD449433F9A513FC5FB30C565C5F7875FFDEA57AF9A6D3F6806D88B060A323FD0CE8253A3EDAF6DB0BD739CD449433F9ACDB265CBA6C4C51FF6E4D2E23F69D2A4B5A79C72CAFBECFDA16B6B6B5B988EBFD50C68069AE978DE49603A711041A85170DADDC0541F3FD553270D75126806D75F7FFDA26BAFBD36D99F66CD9AF5581A9ACEB3F73F3F498C680A5A5B5B3F3F3F34C3F13CC4E0B2AB3FD8C054FBF35F6831E3A44E1A3F30FACD3FF3E5071F7C70BF86A6FBEFBFFFF7E9133F7B7FCF9B819A7177A3575435039A81D1743C37084C3F58060A4E070D3130659CE3A44E1A3F3FA64D9BF6FA733FB75F43D3DAB56BD7A54F5EABECFDBD3FF4BDA25A3F68063403A3E9781E6260DA5970FADD1E043FFD7D50270D751218293A3A3A92CD3FEFD73F3F2F7DE2DA6CEFEFFD66A0F615D5588EA2193F8CA6E3B965CF67761A053F094CF5C13F4EEAA4A14E02A3F549E540D88D2733632F0CCDC03F8EC9A18F934F3E390B37B3F6B0EC1DD46086E977BDF7EF8959FE4EEAA4213401A3D4C48913B7EDEF99A64D3F3FD3B4CF5E417DB8B5B575EC9831630E8EED0E743370D45147257F3F7FB3CBEDDEF4A63725A79F7E7ADFE74B3F3FB3AB57AFEEB7ED1D77DC917CF8C31FAEDEBEF7DE7B3F132654C79D77DE59FD9A175E786187EDE3BEEF7DEF7B3BDC77EBAD3F1FFCE007ABB7FFF0873F680646C8F1DCB2EBABE5EDC94CD3603F00D74C53AF7C77E9C75D5D5D0D0367BED07342BE50F9F48EA33433EEDF5B3FBF7376CF873F8CF2A5F171B8D6C9A85B71CCFDF18F7F3F7D4F4E3DF5D46AFDFA3FFCC724567FECCD3F3FE7AAABAEDAE536E79D775E5F6D8C9E203F3F6F143F003FE79CF3EA3F3F6D527FE79CA6BDDE643F3F072A34D58690C30E3B2CF9D43FD5F7F9F2E5CB77D8F6B1C71E4BBEF83F3F3F3FA3EFF6EDB7DF5E0D3BF5E1290253169AE2B1DA26233EBFE9A69B1A86A6F8F8777FF7773FE4D8263F3F717FA9543F8C80E3B926A06C6C3F3F0D2538353F4D5D5DB7BD390D273FFCF83F357D4E3FF3DD95898D43573FB94239493F675EB3E41D3F161F9A869EA5E97829572C1F5F7D9E6A705FEDEF30D2EA641C6B575F7D7535346501253F3F2FECFB7CEDDAB5D53F3531C2CB3FFEF1EABF233ECF823F37DC90FCC55FFC45DFD72C5AB46887C70F3FFCF0E484134EA8DE3F2F3A3FFDEFEFF7FBC45574B3DB3FB3DB11A2842680D48C193356ECEFABE7FDFC3FFF0F57CFDB6B4D3F6D6D6D270DD05C1E90D0144FB473E7CEADDE3EE28823924F7C3F3B3CF6C31FFEB0EFF3DA8661574FD2BFF9CD6FFA9A8018975C7249F5E7643FBE577C7D3405D9D73CF0C003C992254B3F3F25B689193F4DD16CBCFCF2CB9A8111723C37082A3F3FD0653F5D3D6F30C1A929AF9E172166FADC45EFCDCDE9F9781A764E8ECF77B67D6C9386A6867FABE9DDE5CFD67EDE59ACFC5B3A5AF3C5D2573BBBCBFF3AD07D67CDADBCB5FF0C53EF487F5684B9E15827E7CF9FDF3F308EB70B2EB8A0EF76BC8054BF7D56B36246AAB686C63F4611A6DEFBDE3F5843E3F33FBB6C87593F3FFDF4D37D2F52459D8E3F3FFBDBDFF67DEDB265CBAA1FBBBBBBD549A0B95D79E595D7EEEFF7694A9BDDBBBC4F3F373F7B25FE8087A6EC49BB51688AB052BB7DEDF29478FC4B5FFA52F57634172D35B34C59C06A34D3943DB18F1F3FBEDF3FB34A113F28C5C798758AA6218257341C7FFEE77F3F1821C7F300C16957816557EFC3B4BB6F805BEF983F7D9FA634B85C3F3055DACF29F47CA8BA443F144DEBAE1C5D1B62D2D0F483084759A089AF8FEDF2B37A3E3F36271D5B3A67978F3B774EE9885CB1F49BEACF9853191B61A9D17DD9CFC966B272C5F2BCB81D4BFF6A3F0E3F99D5A9A8432D35B34A71FBEEBBEFAED6CDB85DA954FAD5B1A889D9ED6C3F6A5BCCECC7ED55AB56551FDFB87163F585A46C66291E3F6952F57684B2A8B58D6A76ED4C533FC89610C6AC54CC5E9969029ADED7BFFEF5FF3975EAD4AD6FBCF1C67EBB785EDAD83E3F99BDCFDEDFF7F67768CA5E158DF398E2493FEF784735383F3FFAE83F7C4D1686B286E299679ED9E9CF88D0153FFE6D313F4FEAD3A74FAF7EFF430F3D3F3FDBC5ABA5F14A6AD690640DC1713FD7F7FB644D4A6C3F18917635D3B3BB6F5C3BD8E03F113CA9D97678BE50FE64AE58A9FE3FF0F4DDDF5DFA7184A53F93A9DDAED6B4EEF2476396AA1A9C8AE542AE506A4BC775DBBFA6D21E61ABD17DF5DF27FBFE9D85D255C3B94EAE5FBFBE5AE7A246458D8CF0F3B6B7BDADAF66C5883FC75FBC6814B3E059DD8C50532C16FB5E786A1960A6A9FEC5A9DA3F75307E5EA3D0142F6E3DF2C823D5DBD9EF13B7E3675A3F3F6D389FFC3F7FB9BF96E6DD98063FF6FA3F4DB1842E9EECB3CF1B3F6501261A82586B9FADB78FC78E3DF6D81DD6E367CB501E7AE8A164C58A15D55766E3F3CF7DEE73D5EFF1AE77BDABDA7C6441ACA5663D7E3F5BDB70C472BEB81DBF63F6FBBCF8E28BD5FBF6D77E3F3F033FED6E601A6C70CA7E5E3FA698F5A95D4E577B3E533FA5E1E59A465F97CD2C0D240D45DFEF2C564E3F4B676401288252EF92BC7EF7EDF0BDE754C666BF53AEBB34BBEFF7B9BAF4EEE158272328455D8AFA1721252E7A93BD3F2366BEB3599F6C3F8EC598F9C96A5C363F334DF178D4C63F74FCF1C7F79B693F9BBEF0852F3F3F178068A9B9584E7DE0724E13408DD34E3B6DDCB9E79EFBFA7E986D5A3F7EFCF847DBDA3FD8EB3F343FD9F53F3F34FDC33FFC43BF593F3F7B3F0B4CD9F23F3659C0893F9ED06B9FD463294ACC6845B0AA7F82CF66BEB2FB5B3F8D5631E354BF546E62CBE0DF87A951703AB5EE3F3FD99E5B3F551F76B2DB5D5D958323543F4DDC9F2F94AF681C96CA3F88EF19CBEFF2732B47C64C525C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD755084A9E15827B3E32ACEB58CFA17356A5701A5A5663FC25316866296E93FFEEF3FB9DBDDD01475F7A9A79EEAB7FCAFB6BE662B001A5DC9543F9AD23F533F58B0603F3F7F2A663F793F23283445803FD89D3F3FC1673F7BA28E1395E3BCA6817E46A3739AB235FEB367CF6ED870C455FA6286A9A5E6846A334D3F38D55E1C3F000DE68D6B073F6F605B1B56662D3E3CD75D9EBEABEDE2F2E29DC5D2B8468F77162A17A4A1E7B52CECC4D5F3D2CF7F9B8E5571CED440F785C9F3163F2E2D9E5D84A27A618A42B9D27B8ED4CF6259DF70AD933F4FED954577169AE245A198518F738BB217A45A1A5C29341BD96C7E7DE08A25CBB5333F9DD314BF5BB6542F5E508ADA5C7F3F7512685A718ED1A4493F3DF1C4133F30A545F8CEF4673CD7D6D67694BD3D7A4353363B3475EAD401CF693F633FAF74B6D4ACA1DF55683FEE682C6A5F098DF7688AD03FA096BA99A3ECBEECF1DA46233B3F96C868064685FAA57A11784E6D19FC65C4EBBF6E4F3F6A54898B3FA4C16461E7EC9EC376B65D9CB3946EB7E43F3DEFDC3F3F663F8BE53FF4FE50C3B54E663F7DE8431FAAD69E812E3F3F2065B340F19E723F2F42567609F2EC05A8EC76ED5543079AA53FB1B42F5BFEF73FFD68877A995D3F5BD65C7B29747512687A69F3D93E65CA943FAE5BB76E3FA6D5AB57FF62FCF8F1CF583FFA43533CD1EE6C1947ED936F04A6B81C70BCAA194B4662646BFAA3A9A85DA297859A6832E2F32BAEB8A2EFFBD586B02C08D5CF7E456350BFF4246B48FEE99FFE493330BA83D39E6AB4F40F7572AFD4CB5D6D93D5AEDDDD7E303F7BB3F096BA3FD4BE8875203F093FEDEDED93264F9EBC716F3F3F5304A6D6D6D6AFD9BBCD3FECEDC6613FCDC03F4E4DFBC6B5EAA4A14E02EC421A704E3F61C2CB3FFDE94F5FD9838B433FF6B7BF7D5D2CC94B4787BD3F303403FBD93FA9B3244F3FD449809D8B739CC63F5F3F65CADA471F7D74D360DE87E9DE7BEFBD390D5D0FC7451F9CC33F3034033F380D76A6C8451FD449433F185478FA7284A78E8E8E753367CEFC3F7EF18B67D6AC59F35C2C3F3F6D5AFB873FFCE1773D3D3D3FEBEAEABABBBDBD7D6584A5985D723FCD803F180606BBC4CE923C75D25027013F0D43EF696B6BCBA561E8F6743C9D8ECD71127FEFC755E958908EF36286CADED20C189A81111A9C8E49C7C63F7CE35A75527D5227013F183F4E3F4427EEE43F042675D25027013F189A816636D08C3F79EAA4A14E023F3034030C103F2675527D5227013F78123F3040703F30A14EAA930068063C096B0668ECC4B8984D8BCB8AAB93EA3F098066C093B06680C67A4313EAA4FAA44E023F3F3F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068429D54270140333F4068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD44900340386664068423FD4490034038666003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75523F00CD8066003F75D25027013F680634034213EAA4A14E0230AC944A254FC2C3676C4E9B813F954213EAA4A14E02303F5EBCF8B975EBD679221E0663CD9A35B7A4CDC0E38E4A3F75D25027011846CAE53FEEBBEFBE0D3FFF3F4F3FEE95D368047A7A7A9E49C7971D954213EAE43E0A1C3F000C553F3476E1C23FC79287582B3ED2C63FDF9C44733B127FF7DE11FBFD718D80D0843AB9AFC6430F3D3F0A8564FEFCF9EA24003469633F9ADB31633F6C6F2034C18E3F39E4A5975E5A9F4A264F9EFC337B04009A4C6B6BEBC7D2C6F6F5686EDBDADA4EB447109A6047AB56ADFA71D2EBFEFBEF5F93D6CA933F0068AED0343F1ADBDEF1B03D82D0047FF2CA2BAFFCF5D6AD5B3F352EBFFCF2551D1D1D6FB777003F1ADA63B259A66C3F6A3F83D004DBAD5DBB76655267C3860D6BDBDBDBBB3F00688E8676416D60CA669B9CDB843F2D2D3FFBEC8C6400F3E7CF5F1B2F3CD94B0030BA9BD97EB34CD9B05E1FA1896697E6A2BFDAB265CB6B0385A66DDBB6BD9ACFE797793F004677337B77A3C03F1EB087109A6866AB57AF7E20D9853F57AE6A6B6BCBD95B00303A1B3F67999CDB843F2D2D4B3FDD55664A366FDE7C5F1C3F1D1D87D86300303F3F3B0B4CAEA487D044B3FB3FBE71F6CE96E74566BAE8A28B6E353F009A5B705CD1B46EB9E596DF0D94989E7CF2C9EFC652663F01803F1C5734AD71E3C61D9986A3CD0D2E02B1BCBDBD7DB9AB3F803F1C57343FAFBCB29886A4ADB5A1E9DA6BAFFD416B6B3F7B070034B7E0B8A2E9C5F2BB7BEEB9675D3FDBDE3F3F3A3A3ADE6E3F00803F1C57909A3A75EAA7D6AF5F3F1DC9E4C9937BBC971D00686EC1710575E6CD9B7777A15088B763986F6F00803F1C57502796E3C5F11C1787B0370040730B3F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071058E67004033403F5767CFE97967BE583E6BA0AF3F7A4E3F2A9FDE719466C6FD7BEBF7EA9CDDF3E1FE3FA37C697CF457433F0034031CD0E36A7A77F9B33106FA9AAEAEAE83AADBCDE9F960BEBB32B161B0EA2EFF24572827E978E3CC6B96BCE39CC2E243D3D03F1D2FE58AE5E3639B46F7FDE967DCF6667F1DD449004033C0B038AE723F1F5E37A37345AE506A3FEFEC2E5F1D01A7FE6BD34074721A9A4E6CF47DEB435767B1F26FE9683F4B5F4DBFDF3F74DF59732B6F3FC3D43BD29F957EBCCC5F0D7512003FB05F8FAB6CE6A8260C5D5F7F5F98D65D393FC4A4DBFD20C2511668225CC576F9593D1F481F9B933F9DB3CBC73FA77444AE58FA4D3528CDA98C8DB0D4E8BEECE7643F3B572CCF8BDBB1F4AFD1EF033F003F603F5793E72D784B67A17455849DFA6D1B84AB398DBEE7B4EEF24763663F9C8AE542CC5AA5E3BAED5F53698FB0D5E8BEFAEF937DFFF87DFCA5502701003F00C3E2B84A834C2E663F8B95D376F5B5D9CCD240D2EFF5FD3FF962E98C2C004550EA5D92D7EFBE1DBEF79CCAD86C895FAEBB343B3F7F75E9DDFE6AA8930080668003725CE566553E9285A598FD89E578037D5D5757E5E038F7A971582AFFE0DC62E5A8587E979F5B3932BE575C18A2BA6CAF587E2A2EF2D0E8BE3F7DEF787C7BA0AA3F96676CBFDD75503F7F35D449004033C07E3FAED200F4C9583257FB5867B174733AC6D52FCB8B20133F8FC71A7DCFCE42E58234F4BC96859DB87A5EFAF96FD3B12A37A7E73F3F6279605C5A3CBBF0C4F4B98BDE9B6E533F47EA67F5BF23A893008066807D6AC2573F1180229CD43FD6755DE5905C77E5E2FAC7E29C3F3F89F773DA9BBFCBF66581E5CFBB3F3F003FC071058E67004033803F1C3F008066003F383F003F003F703C03003F1C57E07806003403E0B8C2F10C006806C07185E319003F803F1C3F008066003F383F003F003F703C03003F1C57E0780600340338AEC03F006806705C81E319003FE0B8023F003FC071E5B862141ECFB959958F745D5739A4ABABEBA07CA1F23F47F9D26CFBFCDCCA9167CDADBCB5FEFB7416CA97DB9B00A0B9053FA3F6789EDE5DFE6CAE50CAC5EDAEAEDBDE9C2B968FEF9CDD73583A8EEDEAAA1C9C6D7F3F4BDE913E36AF5F683F5F6D6F02803F1C578CDAE3F99CC2E243A7CFE9F960E7ECF27131BB94EBAE5C3F94AFAFDE2E564E3F20154BE3F285F227B399A8F83C669A72DDA5F3E2FBD83F00A0B9C571E5B862541DCFD3BACB1F8D6034ADBB7274AE50FA7E3FAFB35869AD86A242696A6C1B4BF862462A5F287D26C251B64C2F0D572747D8B2370140730B3F46E5F11CCBEFF2DD958993E72D784B3FF5CE20DD56FD582C3F4129B68DED625629C2537C9EDEBEB91A9A8A3F712E94BD09009A5B705C316A8FE7343FE263BE50BEA2FA79EFF94DE9C73F3F3F0D529765012966A6AAE1C945200040730B3F46FBF13F9F69F9593D1F88A576D5B0D45DBEB07A8E53EF6C522657AC5C52FF3D3F00D0DC82E38A51ABAD6D7C124BF3E2BCA573E7948EA87FBCF6BE7CA1E784B8404476DFD9737ADE992F94663F20EC4900D0DC82E38A5169E2591724B9593F8FDBB9423F66987285D275BD57CEBB2D2E2F9EBFBAF4EEED3F3F13DB55CF6B2A94723FD7E4BBCB3F896D63795F3F3E0040734B3F430B3FDAC578D89E423F003403343F744C3A5EDF59686A6D6D1D6B4FA14E02003F9AF938BA7B27A1E93F633F6C2FA14E02003F9AF9383A66A0D0D4D6D6763F3F09006806702C353EB7E961B34CA893008066005A1A9FDBE45C26D4490040330035D290343F133F003F808143D3C76ACE653A3F413F0034033F98AA9EDB643F7512003F40E3633F3F3F003F609F4892E4E0952B57DEFEE0830F6E2D954AC9C23F8DFD3C7A7A7A92C53FFF573A26382251270100CDC030138169C99225C9BA75EB92575F7D3F40E385175E48162D5AF4721AA0BEECA8443F00CD806660183F2681693FA757172E5CF8B83F75120034039A81612496E4092CC367A4A1E97547253F0068063403C3489C53233FABD03F073F0068063403233134BDB2E1B964E5C33FBFEEF96675C4EDB84F3F9A50270100CD40D387A68DEBD7243F3E23F9D55DE7EF30E2BE784C3F9A50270100CD405387A655BFFEF77E3F1B3FBD403F9A50270100CD407387A63F3F3034C563C28ED0843A090068063F342D5F3F60688AC73F3F7512003F084D4293D03F0900680684A63FAE963750688AC73F3F7512003F3475685AB174CE803F1E13763FD449004033D0D4A1E93FCB92E5F75E3F695E7A5F3C263F4DA893008066A0A943538CA71FB9A15F688AFB041D3F7512003F084D5B3F2B3F4EFFA579E97DF1983F34A14E02009A813F4D1BD7AF499E585A1CF09CA6782C3F783F865C1317445DDCC578D89E0200A1893F9AB66C499E5B514EFEF39E8B060C4CD9886D625BB34E421343AA89C7A4E3F59D85A6D6D6D6B1F61400084D0CA3D0B4AB3FB34E42137B3FDEBD93D0F4C03F630EB697004068621885A6DD995DDAD9AC933F3431E8BA78CC40A1A9ADAD3F7B08003F8659681A6A60CA863F3431A4DAD8E8DCA687CD320180D0C4300C4D86D03FA98DFDCE6D722E1300084D084D86D0443F243F3F00084D423F34317068FA58CDB94C273F0020342134194213FD6B64F5DC26B34C0020342134194213A9F6F6F6F7B4B6B64E4D6BE3EDE958918E3FF6CE366D4EC7D3BD4BF6CE8BED3F00103F9A8426A1A969C4A5C4D33F1DAFEEEC8D6DEB4625DD7E82BD070042134293D0C468AE81EF4B83CF3D3F4A8DC69271E3C61D696F0280D0843F3431AAB4B6B63F7EFCF8976A03507B7B7B3FFF3F49B95C4E9E7DF6D9E4BFFFFBBF93F03F3F59B3664DB274E9D264D6AC59C957BEF295FAE0B4D1AC1300084D084D42133F308D4D433FB561E9C61B6F4CD6AD5B97EC8EF5EBD757B78FAFAB0D4FE9F73CDDDE05003FA14968623FA6536A03D3F4E9D3ABB34A43115F77FEF9E7D70727334E0020342134094D8CD89AF7BEDA2579975C72493FBCA18AA57B975F7E79FD52BDA3EC6D00103F9A8426463F30F5D43FED69603F4E75334E4BEC6D00103F9A84264694B8AC783F4C435D92B7B3A57AB5E738593F004213433066CC988385A6D1139A76F5F764D885A68559A0893F3F37DF7CB3D92600103F8AB497FAABD5AB573F103FFEFAD7BF7EEE40CDB63F3242D3EE3F3F61281D7FBBB36DDADBDBDF935D3F66835E7CF1C57D129AE2AA7A753F7F9FBF1000084DECC2B3CF3E3B63F3E6CDAF674DD5962D5B5EBBE5965B569C7DF6D9FF5B681A79A169307F4FF65F1DEB5D0EB7B0B5B5F5638DB649EF9F9A6D773F5724FB52BC8F534D683ACF5F08003F06F0CA2BAFFCF5F33FFFFB811AABA79F7E7AF3CC3FBFDBD1D17188D034FC43D350FE9EECDFD05433EEAE9F794AEFBB3D7BFCBEFBEEDBA73F66206B7E3FFE4200304A4253BE50F9748C5CB17252E79CCAD873E7948E88FBCFBC663F72DDA5D9D9F6E7147A3E3F3F936D5F3B3A0BE5CB27CF5BF09666DFA769CF74C8AA55AB7EBC75EBD66DBB6AAEB66DDBB6F59E7BEEF9AF7C3EFF39A1697886A63DF97B72C04253DFCC53169ED2CF5764F7EF3F40D45BB3664DEDEFB1CA5F0800464968CACD5A7C787C3F564E3BA7F01F7F1961A9B3509ADA592CDD5C1B84D260342D1E6FF4BDF2C53FCDBE3F3FFEF92F6DD8B0E1E5213FB1E53BDFF94E69C18205C2CA301A0F3DF4503F7FCFB4617F3F73E04253EDCC533A36659FEFADCB8CEFECF23F3F7BB3BF10008C92663FFEBF6F27E3BFF2D5E4F4F3AEA87E3EE1B4A949C7D91726133F2F997C51B1AF01987CF1DCEAC75327E7AB8FC588EDAADFE382AB93DD685E463F140A3FC18772F2787C6D7C8F78955A60393F3F7BE3EF690CBFB13FD4FE3C3F00304AE4BA2B177775751D3F3F9DD65D393A7F75E9DDD9633FAF76BBF8D859285D151FBBBA6E7B73AE50CA9D3DA7E79D9DC54A6BB3EFC7B842D7E4C9937F76FFFDF73FB76DDBB63776A7B9DAB061C34D53A64CA9B4B6B6CE4F1DD0A090FE1392EF7DEF7B7D9FDF74D34D0DB79931633FF76DDEBC39B9FBEEBBAB8FED6C3F1EBFEAAAAB763F9C77DE79D5DBB7DE7A6BF57B67F7C765A2F7E7FEF8E94F7F9AECC9DF73A45D392D37ABF291AE3F876C3FF54B70CB9766DBE5E7563F6B6EE5ADF55F1F4B740FE48B3F0DC6C3E9DF616C5C3FBDBDD14C13003064113FBBCB57E78BE5B3E2FCA558AAD739BB7C5C3F2A542EEB9CDD73585F535528CFA906A574BBED3F552E3F3F1FE741A5DB1D6B6F6E176FA279E9A597AE5ABF7EFDBA9D9CFFB27CDEBC79DF8F732D62FBF83F714E53A9544A264D9AD4177AAEBDF6DAEAD53FB9E492EAE771527B7DA8C9C24BDCEEEEEEAE7E3CF5D453ABDB46C3986DBB68D1A2E4CE3BEFAC3E161F0F3FFCF0E484134EA8DE8E713F77243FFFFBFB7DFF3FB2DB37DC7043DFED085107E2421043FD7B3FD3BBCB9F3F41FA5E1029968F3FFF3FBBABABD27759F5EAB98EC5F2BC7E3F3F3F34F585A59A6D9CD304000C5D3440D9794BF942F98A783F0D455FA986A962E5B46CBB7875396DA8DAA6753F1AA3DA24A5E13F3FE569F175F6E69F8C1B37EEADEDEDEDDD693058B775EBD64D353DD5E6279F7CF2BBE963CBD3C66E564747C7DBB3AF39103F969265412782C9633F96AC5EBDBA7AFB873FFC61DF764F3FFD7435E8C4FD73E7CE4DBEFBDDEF566FFF3FBFD9E9AC516DD0893FBBECB2BECFDFF4A63725175E7861BFEFFF894F7C3F96E2F66F7FFBDBBEAF5DB66C595F50DBDF573FCADF733FA7B0F8D0E9737A3E18FFAFAB1786E9AE5C3F94AF3F12B343402A96C6A5F5E2937D1782493F8F99A6B4763FDFE70085A607223F7A3F573F0086AC1A78D2601421285E4DCE96E0C452BBB449BA64876DD3A6295F3FA1D1F78919297B73C086EE987C3EBF6CE5CA956B366DDAB4E8A23F3F9ABBB8BF7EDBFD199A5E78E185246D2E3F3F6AE99DE5898FC71E7B6CDF7D310B551B7C8AC562DFEDE38F3FBEEF3F042D59B2A46FDB8D1B375667B2B299A53F66B5E23FBFF8C5EA3F0A5A3F4D3F765872EFBDF7566FC7AC54CC5E1DC8F7691ACCDF73243F10FFC7E3C5925CA1F4FD6C495ED482EDB3CAA5A9DB6B463F31231557D18C703FD34BC3D5C9D90C3F3FD66F66A99EF7690200F6483643144D4FB5714A9BA26890D2CFAF3F77D17B6B423FF9EECA893F373F9667D893038B66AEAD3FD77B19E4DC40CDDDFE9E69AA5D4A3FA9969A733F05AD783C463FC5C7333FA361E0A9BDEFF6DB6FEFBB1D3F6E47107BDBDBDED63034C54C3F3F52BDFD3F0F3F6B0732340DE6EF39B2EA40E5E03FF7C498753FA3DEFFDBB7553F16CB674550CAB68B59A5A813DB5F6029DDBC3F94670CE7D93F3FFD7B3F7FB3F476F2E23FEE933F333F264CD856139ADE3F02C068084DD7550EA99ECB54285F3FBDBB3F74CEEEF9703F3FAFBE3FABE703F179ED89E0F5A2D93F772F3CEDEC3F3F4D71818608263133948594FAF39922B4B43FE1BBE0820BFA96F0C5123F2B56ECB09CAE3604C56C54FD4C539CDFF4852F7CA16FBB587A1761ADA5E66214F581EB409DD334D4BFE7483F9F423F3FB6BF90B2FDFCA6583FCB78FBFE3F2A9765012966A6AAE1E9005D046230E27D9BB23013E7E53F37DF7C733F3F550F00602F3B103F668FE26A78114AE25C3F442DBD4BE1E2F3DA2BE4654BF7B2F3985A7A3F3F15B3463FF34CC399A3DD094D6BD7AE4D9E7AEAA91D66A3EA4353764E53EDEF752043D368133FC68B2431EB5C0D4BDDE50BABE738F5CE263F5CEDB874770485A693B24013B34D7BFB8210F1FDC68F1FBFADE6CD7527A86A000023383445F0B8EBAEBB9277BDEB5D3F4511463FFAE8EA7D3F3FFA68DFEDDAA014C16AF9F2E5D5DBF1B5717187B89D5D1EBC76D49F0F3FA298916A74118996BA733F28654BF562496084A8463F47681ABAB8525E3FC7B2DC73E7948EA87FBCF63F3F2E1091DD176F373F94663F2046C2BF350D333FD44C3F7DAF5D7E3C96BA9E7BEEB96FD4CE328DB6994800803F4D8DC24AFDFB206597FBAEDF2E0B31F1F1CFFEECCF9255AB5655C3564BCDCCD0403F230B4D3F2E1A1123B6F9D18F7ED4B77D16C6E2637619F4EC8A7B42D3DE116F1B10178589DBB9423F66987285D275BD57CEBB2D2E2F1EEFDDB6FD3CA7D2673F4D695C2CDF8B731FF3DDE59FC4B6B1BCAF76193F0D4DEF4B3F59B889636A4F835304A6CB2FBFBC3FA68D6D6D6D47A96800003F34B5F45ED8E1D0430FAD7E6CE95D4E57BF5D3F6F3487F56F541B176D88C7E3FD3F1B9A62C4D7B5D45D3FBB7D20463FCF6B16ADADADA7641785C8669C86BA542FBEAE6E86C93F00803F3FA1A999A4E1A63F383F4E313FCB4D773F7971D187DA739862A481EC6B3F00803F34312AC48C533AD6D7869E084F3F4E3F3F8B942DDD8B25786BD6ACA95E51B250282413274EDC5AFB753F2F82983F002034094D3F718E53EDA5C887383F3F004068123FEDE1E9CBBDE1E9F5C184A5985D723F0000A14968A269B4B7B7BF270D4F3F0CDD9E8EA7D3B13F20C5C755E958908EF36286CA3F00109A84263F00003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003F4368020000A1C9103F00004068323F0000103F3F00003F43680200003F3F0000109A842600004068123F000000A149680200003FA1C951090000423F340100C0C8502A958495E13336A7A1E975472500000C233F2F7E6EDDBA75023F186BD6AC3F0D4D3F2A010060182997CB5FB8EFBEFB363CFFFCF33F3F373F81A9A7A7E799747CD951090000C34CDAA88F5DB870E1C33F2CCEA931F6FB88FDFEB83F0000000000000000000000000000000000000000000000000000000000343F0F67065B1949DC9E3F0000000049454E44AE42603F, 1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ge_property 结构
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE IF NOT EXISTS `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ge_property 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` (`NAME_`, `VALUE_`, `REV_`) VALUES
	('cfg.execution-related-entities-count', 'false', 1),
	('cfg.task-related-entities-count', 'false', 1),
	('common.schema.version', '6.2.0.0', 1),
	('identitylink.schema.version', '6.2.0.0', 1),
	('job.schema.version', '6.2.0.0', 1),
	('next.dbid', '15001', 7),
	('schema.history', 'create(6.2.0.0)', 1),
	('schema.version', '6.2.0.0', 1),
	('task.schema.version', '6.2.0.0', 1),
	('variable.schema.version', '6.2.0.0', 1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_actinst 结构
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE IF NOT EXISTS `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_actinst 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` (`ID_`, `REV_`, `PROC_DEF_ID_`, `PROC_INST_ID_`, `EXECUTION_ID_`, `ACT_ID_`, `TASK_ID_`, `CALL_PROC_INST_ID_`, `ACT_NAME_`, `ACT_TYPE_`, `ASSIGNEE_`, `START_TIME_`, `END_TIME_`, `DURATION_`, `DELETE_REASON_`, `TENANT_ID_`) VALUES
	('2507', 1, 'Expense:1:4', '2501', '2506', 'start', NULL, NULL, '开始 ', 'startEvent', NULL, '2017-12-18 22:11:11', '2017-12-18 22:11:11', 1, NULL, ''),
	('2508', 2, 'Expense:1:4', '2501', '2506', 'fillTask', '2509', NULL, '出差报销', 'userTask', '张三', '2017-12-18 22:11:11', '2017-12-18 23:36:43', 5132921, NULL, ''),
	('2513', 1, 'Expense:1:4', '2501', '2506', 'judgeTask', NULL, NULL, NULL, 'exclusiveGateway', NULL, '2017-12-18 23:36:43', '2017-12-18 23:36:43', 8, NULL, ''),
	('2514', 2, 'Expense:1:4', '2501', '2506', 'directorTak', '2515', NULL, '经理审批', 'userTask', NULL, '2017-12-18 23:36:43', '2017-12-18 23:38:16', 93336, NULL, ''),
	('2516', 1, 'Expense:1:4', '2501', '2506', 'end', NULL, NULL, '结束', 'endEvent', NULL, '2017-12-18 23:38:16', '2017-12-18 23:38:16', 9, NULL, '');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_attachment 结构
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE IF NOT EXISTS `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_attachment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_comment 结构
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE IF NOT EXISTS `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_comment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_detail 结构
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE IF NOT EXISTS `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_identitylink 结构
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE IF NOT EXISTS `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_identitylink 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` (`ID_`, `GROUP_ID_`, `TYPE_`, `USER_ID_`, `TASK_ID_`, `CREATE_TIME_`, `PROC_INST_ID_`) VALUES
	('2510', NULL, 'assignee', '张三', '2509', '2017-12-18 22:11:11', NULL),
	('2511', NULL, 'participant', '张三', NULL, NULL, '2501');
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_procinst 结构
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE IF NOT EXISTS `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_procinst 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` (`ID_`, `REV_`, `PROC_INST_ID_`, `BUSINESS_KEY_`, `PROC_DEF_ID_`, `START_TIME_`, `END_TIME_`, `DURATION_`, `START_USER_ID_`, `START_ACT_ID_`, `END_ACT_ID_`, `SUPER_PROCESS_INSTANCE_ID_`, `DELETE_REASON_`, `TENANT_ID_`, `NAME_`, `CALLBACK_ID_`, `CALLBACK_TYPE_`) VALUES
	('2501', 2, '2501', NULL, 'Expense:1:4', '2017-12-18 22:11:11', '2017-12-18 23:38:16', 5225475, NULL, 'start', 'end', NULL, NULL, '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_taskinst 结构
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE IF NOT EXISTS `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_taskinst 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` (`ID_`, `REV_`, `PROC_DEF_ID_`, `TASK_DEF_KEY_`, `PROC_INST_ID_`, `EXECUTION_ID_`, `SCOPE_ID_`, `SUB_SCOPE_ID_`, `SCOPE_TYPE_`, `SCOPE_DEFINITION_ID_`, `NAME_`, `PARENT_TASK_ID_`, `DESCRIPTION_`, `OWNER_`, `ASSIGNEE_`, `START_TIME_`, `CLAIM_TIME_`, `END_TIME_`, `DURATION_`, `DELETE_REASON_`, `PRIORITY_`, `DUE_DATE_`, `FORM_KEY_`, `CATEGORY_`, `TENANT_ID_`, `LAST_UPDATED_TIME_`) VALUES
	('2509', 2, 'Expense:1:4', 'fillTask', '2501', '2506', NULL, NULL, NULL, NULL, '出差报销', NULL, NULL, NULL, '张三', '2017-12-18 22:11:11', NULL, '2017-12-18 23:36:43', 5132848, NULL, 50, NULL, NULL, NULL, '', '2017-12-18 23:36:43'),
	('2515', 2, 'Expense:1:4', 'directorTak', '2501', '2506', NULL, NULL, NULL, NULL, '经理审批', NULL, NULL, NULL, NULL, '2017-12-18 23:36:43', NULL, '2017-12-18 23:38:16', 93335, NULL, 50, NULL, NULL, NULL, '', '2017-12-18 23:38:16');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_hi_varinst 结构
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE IF NOT EXISTS `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_hi_varinst 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` (`ID_`, `REV_`, `PROC_INST_ID_`, `EXECUTION_ID_`, `TASK_ID_`, `NAME_`, `VAR_TYPE_`, `SCOPE_ID_`, `SUB_SCOPE_ID_`, `SCOPE_TYPE_`, `BYTEARRAY_ID_`, `DOUBLE_`, `LONG_`, `TEXT_`, `TEXT2_`, `CREATE_TIME_`, `LAST_UPDATED_TIME_`) VALUES
	('2503', 0, '2501', '2501', NULL, 'money', 'serializable', NULL, NULL, NULL, '2504', NULL, NULL, NULL, NULL, '2017-12-18 22:11:11', '2017-12-18 22:11:11'),
	('2505', 0, '2501', '2501', NULL, 'taskUser', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '张三', NULL, '2017-12-18 22:11:11', '2017-12-18 22:11:11'),
	('2512', 1, '2501', '2501', NULL, 'outcome', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '通过', NULL, '2017-12-18 23:36:43', '2017-12-18 23:38:16');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_bytearray 结构
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE IF NOT EXISTS `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_bytearray 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_bytearray` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_group 结构
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE IF NOT EXISTS `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_group 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_info 结构
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE IF NOT EXISTS `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_info 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_membership 结构
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE IF NOT EXISTS `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_membership 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_priv 结构
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE IF NOT EXISTS `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_priv 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_priv_mapping 结构
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE IF NOT EXISTS `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_priv_mapping 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_priv_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv_mapping` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_property 结构
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE IF NOT EXISTS `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_property 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_property` DISABLE KEYS */;
INSERT INTO `act_id_property` (`NAME_`, `VALUE_`, `REV_`) VALUES
	('schema.version', '6.2.0.0', 1);
/*!40000 ALTER TABLE `act_id_property` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_token 结构
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE IF NOT EXISTS `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_token` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_id_user 结构
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE IF NOT EXISTS `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_id_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_procdef_info 结构
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE IF NOT EXISTS `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_procdef_info 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_re_deployment 结构
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE IF NOT EXISTS `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_re_deployment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` (`ID_`, `NAME_`, `CATEGORY_`, `KEY_`, `TENANT_ID_`, `DEPLOY_TIME_`, `ENGINE_VERSION_`) VALUES
	('1', 'SpringAutoDeployment', NULL, NULL, '', '2017-12-14 23:33:18', NULL),
	('10001', 'SpringAutoDeployment', NULL, NULL, '', '2018-07-02 10:49:54', NULL),
	('12501', 'SpringAutoDeployment', NULL, NULL, '', '2018-07-03 10:36:20', NULL),
	('5001', 'SpringAutoDeployment', NULL, NULL, '', '2017-12-30 10:29:36', NULL),
	('7501', 'SpringAutoDeployment', NULL, NULL, '', '2018-01-04 22:04:37', NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_re_model 结构
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE IF NOT EXISTS `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_re_model 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_re_procdef 结构
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE IF NOT EXISTS `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_re_procdef 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` (`ID_`, `REV_`, `CATEGORY_`, `NAME_`, `KEY_`, `VERSION_`, `DEPLOYMENT_ID_`, `RESOURCE_NAME_`, `DGRM_RESOURCE_NAME_`, `DESCRIPTION_`, `HAS_START_FORM_KEY_`, `HAS_GRAPHICAL_NOTATION_`, `SUSPENSION_STATE_`, `TENANT_ID_`, `ENGINE_VERSION_`) VALUES
	('Expense:1:4', 1, 'http://www.flowable.org/processdef', 'ExpenseProcess', 'Expense', 1, '1', 'E:\\LY\\Barbecue\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', 'E:\\LY\\Barbecue\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '报销流程', 0, 1, 1, '', NULL),
	('Expense:2:5004', 1, 'http://www.flowable.org/processdef', 'ExpenseProcess', 'Expense', 2, '5001', '/Users/jerry/Desktop/guns/guns-admin/target/classes/processes/ExpenseProcess.bpmn20.xml', '/Users/jerry/Desktop/guns/guns-admin/target/classes/processes/ExpenseProcess.Expense.png', '报销流程', 0, 1, 1, '', NULL),
	('Expense:3:7504', 1, 'http://www.flowable.org/processdef', 'ExpenseProcess', 'Expense', 3, '7501', 'E:\\LY\\Barbecue\\adProject\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', 'E:\\LY\\Barbecue\\adProject\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '报销流程', 0, 1, 1, '', NULL),
	('Expense:4:10004', 1, 'http://www.flowable.org/processdef', 'ExpenseProcess', 'Expense', 4, '10001', 'E:\\hospital\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', 'E:\\hospital\\guns\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '报销流程', 0, 1, 1, '', NULL),
	('Expense:5:12504', 1, 'http://www.flowable.org/processdef', 'ExpenseProcess', 'Expense', 5, '12501', 'E:\\hospital\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml', 'E:\\hospital\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png', '报销流程', 0, 1, 1, '', NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_deadletter_job 结构
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE IF NOT EXISTS `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_deadletter_job 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_event_subscr 结构
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE IF NOT EXISTS `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_event_subscr 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_execution 结构
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE IF NOT EXISTS `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_execution 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_history_job 结构
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE IF NOT EXISTS `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_history_job 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_history_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_history_job` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_identitylink 结构
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE IF NOT EXISTS `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_identitylink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_job 结构
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE IF NOT EXISTS `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_job 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_suspended_job 结构
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE IF NOT EXISTS `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_suspended_job 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_task 结构
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE IF NOT EXISTS `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_task 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_timer_job 结构
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE IF NOT EXISTS `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_timer_job 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;

-- 导出  表 guns_flowable.act_ru_variable 结构
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE IF NOT EXISTS `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  guns_flowable.act_ru_variable 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

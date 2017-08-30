-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-05-21 11:46:29
-- 服务器版本： 5.7.15-log
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testguest`
--
CREATE DATABASE IF NOT EXISTS `testguest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `testguest`;

-- --------------------------------------------------------

--
-- 表的结构 `tg_article`
--

CREATE TABLE `tg_article` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//id',
  `tg_reid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//主题ID',
  `tg_username` varchar(20) NOT NULL COMMENT '//发帖人',
  `tg_type` tinyint(2) UNSIGNED NOT NULL COMMENT '//发帖类型',
  `tg_title` varchar(40) NOT NULL COMMENT '//帖子标题',
  `tg_content` text NOT NULL COMMENT '//帖子内容',
  `tg_readcount` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//阅读量',
  `tg_commendcount` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//评论量',
  `tg_nice` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//精华帖',
  `tg_last_modify_date` datetime NOT NULL COMMENT '//最后修改时间',
  `tg_date` datetime NOT NULL COMMENT '//发帖时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_article`
--

INSERT INTO `tg_article` (`tg_id`, `tg_reid`, `tg_username`, `tg_type`, `tg_title`, `tg_content`, `tg_readcount`, `tg_commendcount`, `tg_nice`, `tg_last_modify_date`, `tg_date`) VALUES
(56, 0, '管理员', 4, '对付对付对付的', '[img]qpic/1/14.gif[/img][img]qpic/1/34.gif[/img][img]qpic/1/35.gif[/img][img]qpic/1/27.gif[/img][img]qpic/2/15.gif[/img][img]qpic/2/11.gif[/img][img]qpic/2/1.gif[/img][img]qpic/3/15.gif[/img][img]qpic/3/19.gif[/img][img]qpic/3/16.gif[/img][img]qpic/3/4.gif[/img]', 2, 0, 0, '0000-00-00 00:00:00', '2017-05-20 07:55:10'),
(55, 0, '管理员', 6, '5月12日停服维护公告', '亲爱的杀友好，\r\n\r\n三国杀移动版服务器将于2017年5月12日3:00--4:30停服升级维护，维护完成后将第一时间开启服务器。请杀友们安排好游戏时间，以免造成不必要损失。\r\n\r\n感谢大家对三国杀的大力支持！', 8, 0, 0, '0000-00-00 00:00:00', '2017-05-16 07:24:40'),
(53, 0, '管理员', 13, '5月16日7:00-9:00 全区临时维护公告', '亲爱的三国杀Online玩家朋友们：\r\n\r\n      为保证游戏顺畅运行，我们将于5月16日7:00开始对全区服务器进行临时停机维护，预计时长2小时。如果在预定时间内无法完成维护内容，开机时间也将继续顺延。请各位玩家相互转告，并提前留意游戏时间，以免造成不必要的损失。维护期间给您带来不便非常抱歉，服务器开启后将为您奉上本次维护补偿礼包，请留意查收系统信件。天梯\r\n\r\n      维护时间：5月16日7:00-9:00\r\n\r\n      补偿礼包：50银两\r\n\r\n      感谢每一位陪伴三国杀Online一路走来的玩家朋友，您的认可是我们动力的来源，希望您能一如既往地支持和理解我们的工作，谢谢！', 9, 0, 0, '2017-05-16 08:20:40', '2017-05-16 07:16:54'),
(54, 0, '管理员', 6, '西西里西西里西西里西西里西西里', '[flash]http://player.youku.com/player.php/sid/XMjcxMTgxNDMxNg==/v.swf[/flash]', 8, 0, 0, '0000-00-00 00:00:00', '2017-05-16 07:23:16');

-- --------------------------------------------------------

--
-- 表的结构 `tg_dir`
--

CREATE TABLE `tg_dir` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//ID',
  `tg_name` varchar(20) NOT NULL COMMENT '//相册目录名',
  `tg_type` tinyint(1) UNSIGNED NOT NULL COMMENT '//相册的类型',
  `tg_password` char(40) DEFAULT NULL COMMENT '//相册的密码',
  `tg_content` varchar(200) DEFAULT NULL COMMENT '//相册的描述',
  `tg_face` varchar(200) DEFAULT NULL COMMENT '//相册目录封面',
  `tg_dir` varchar(200) NOT NULL COMMENT '//相册的物理地址',
  `tg_date` datetime NOT NULL COMMENT '//相册创建的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_dir`
--

INSERT INTO `tg_dir` (`tg_id`, `tg_name`, `tg_type`, `tg_password`, `tg_content`, `tg_face`, `tg_dir`, `tg_date`) VALUES
(9, '121', 0, NULL, '', 'monipic/moshou.jpg', 'photo/1495336952', '2017-05-21 11:22:32');

-- --------------------------------------------------------

--
-- 表的结构 `tg_friend`
--

CREATE TABLE `tg_friend` (
  `tg_id` mediumint(8) NOT NULL COMMENT '//ID',
  `tg_touser` varchar(20) NOT NULL COMMENT '//被添加的好友',
  `tg_fromuser` varchar(20) NOT NULL COMMENT '//添加的人',
  `tg_content` varchar(200) NOT NULL COMMENT '//请求内容',
  `tg_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//验证',
  `tg_date` datetime NOT NULL COMMENT '//添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_friend`
--

INSERT INTO `tg_friend` (`tg_id`, `tg_touser`, `tg_fromuser`, `tg_content`, `tg_state`, `tg_date`) VALUES
(5, '炎日', '短笛', '我非常想和你交朋友！', 1, '2016-09-14 11:29:50');

-- --------------------------------------------------------

--
-- 表的结构 `tg_message`
--

CREATE TABLE `tg_message` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//ID',
  `tg_touser` varchar(20) NOT NULL COMMENT '//收信人',
  `tg_fromuser` varchar(20) NOT NULL COMMENT '//发信人',
  `tg_content` varchar(200) NOT NULL COMMENT '//发信内容',
  `tg_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//短信状态',
  `tg_date` datetime NOT NULL COMMENT '//发送时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_message`
--

INSERT INTO `tg_message` (`tg_id`, `tg_touser`, `tg_fromuser`, `tg_content`, `tg_state`, `tg_date`) VALUES
(1, '娜美', '炎日', '奈美你好，我想和你交朋友！！！', 0, '2010-09-09 11:21:15'),
(2, '炎日', '妮可罗宾', '方寸间，历数世上桑田沧海；时空里，细问人间暑往寒来；是朋友，星移斗转情不改；是知音，天涯海角记心怀。', 1, '2010-09-12 09:51:24'),
(3, '炎日', '香吉士', '风是透明的，雨是滴答的，云是流动的，歌是自由的，爱是用心的，恋是疯狂的，天是永恒的，你是难忘的。', 1, '2010-09-12 09:51:55'),
(4, '炎日', '索罗', '初遇你的心情是温馨的，和你交友的时候是真心的，与你在一起的时候是开心的，认识你这个朋友是无怨无悔的。', 1, '2010-09-12 09:52:45'),
(5, '炎日', '娜美', '风雨的街头，招牌能挂多久，爱过的老歌，你能记得几首，别忘了有像我这样的一位朋友！永远祝福你！', 1, '2010-09-12 09:54:17'),
(6, '炎日', '路飞', '恭喜发财财运到，财神对你哈哈笑，自摸杠点随你挑，抓到手里都是宝，收钱收到手酸掉，牌友气得哇哇叫。', 1, '2010-09-12 09:54:45'),
(19, '娜美', '炎日', '娜美，你好呀，我想和你交朋友！', 0, '2010-09-14 07:08:33'),
(20, '娜美', '炎日', '娜美,我和想和你交朋友！', 0, '2010-09-14 11:25:14');

-- --------------------------------------------------------

--
-- 表的结构 `tg_photo`
--

CREATE TABLE `tg_photo` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//ID',
  `tg_name` varchar(20) NOT NULL COMMENT '//图片名',
  `tg_url` varchar(200) NOT NULL COMMENT '//图片路径',
  `tg_content` varchar(200) DEFAULT NULL COMMENT '//图片简介',
  `tg_sid` mediumint(8) UNSIGNED NOT NULL COMMENT '//图片所在的目录',
  `tg_username` varchar(20) NOT NULL COMMENT '//上传者',
  `tg_readcount` smallint(5) NOT NULL DEFAULT '0' COMMENT '//浏览量',
  `tg_commendcount` smallint(5) NOT NULL DEFAULT '0' COMMENT '//评论量',
  `tg_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_photo`
--

INSERT INTO `tg_photo` (`tg_id`, `tg_name`, `tg_url`, `tg_content`, `tg_sid`, `tg_username`, `tg_readcount`, `tg_commendcount`, `tg_date`) VALUES
(34, '1212', 'photo/1495336952/1495337037.png', '', 9, '管理员', 33, 1, '2017-05-21 11:24:01');

-- --------------------------------------------------------

--
-- 表的结构 `tg_photo_commend`
--

CREATE TABLE `tg_photo_commend` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//ID',
  `tg_title` varchar(20) NOT NULL COMMENT '//评论标题',
  `tg_content` text NOT NULL COMMENT '//评论内容',
  `tg_sid` mediumint(8) UNSIGNED NOT NULL COMMENT '//图片的ID',
  `tg_username` varchar(20) NOT NULL COMMENT '//评论者',
  `tg_date` datetime NOT NULL COMMENT '//评论时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_photo_commend`
--

INSERT INTO `tg_photo_commend` (`tg_id`, `tg_title`, `tg_content`, `tg_sid`, `tg_username`, `tg_date`) VALUES
(11, 'RE:1212', '11111111111111111111', 34, '管理员', '2017-05-21 19:42:44');

-- --------------------------------------------------------

--
-- 表的结构 `tg_system`
--

CREATE TABLE `tg_system` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//ID',
  `tg_webname` varchar(20) NOT NULL COMMENT '//网站名称',
  `tg_article` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//文章分页数',
  `tg_blog` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//博友分页数',
  `tg_photo` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//相册分页数',
  `tg_skin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//网站皮肤',
  `tg_string` varchar(200) NOT NULL COMMENT '//网站敏感字符串',
  `tg_post` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//发帖限制',
  `tg_re` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//回帖限制',
  `tg_code` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//是否启用验证码',
  `tg_register` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//是否开放会员'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_system`
--

INSERT INTO `tg_system` (`tg_id`, `tg_webname`, `tg_article`, `tg_blog`, `tg_photo`, `tg_skin`, `tg_string`, `tg_post`, `tg_re`, `tg_code`, `tg_register`) VALUES
(1, '游卡客服', 10, 15, 12, 1, '他妈的|NND|草|操|垃圾|淫荡|贱货|SB|sb|jb|JB|法轮功|小泉', 60, 15, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tg_user`
--

CREATE TABLE `tg_user` (
  `tg_id` mediumint(8) UNSIGNED NOT NULL COMMENT '//用户自动编号',
  `tg_uniqid` char(40) NOT NULL COMMENT '//验证身份的唯一标识符',
  `tg_active` char(40) NOT NULL COMMENT '//激活登录用户',
  `tg_username` varchar(20) NOT NULL COMMENT '//用户名',
  `tg_password` char(40) NOT NULL COMMENT '//密码',
  `tg_question` varchar(20) NOT NULL COMMENT '//密码提示',
  `tg_answer` char(40) NOT NULL COMMENT '//密码回答',
  `tg_email` varchar(40) DEFAULT NULL COMMENT '//邮件',
  `tg_qq` varchar(10) DEFAULT NULL COMMENT '//QQ',
  `tg_url` varchar(40) DEFAULT NULL COMMENT '//网址',
  `tg_sex` char(1) NOT NULL COMMENT '//性别',
  `tg_face` char(12) NOT NULL COMMENT '//头像',
  `tg_switch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//个性签名开关',
  `tg_autograph` varchar(200) DEFAULT NULL COMMENT '//签名内容',
  `tg_level` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//会员等级',
  `tg_post_time` varchar(20) NOT NULL DEFAULT '0' COMMENT '//发帖的时间戳',
  `tg_article_time` varchar(20) NOT NULL DEFAULT '0' COMMENT '//回帖的时间戳',
  `tg_reg_time` datetime NOT NULL COMMENT '//注册时间',
  `tg_last_time` datetime NOT NULL COMMENT '//最后登录的时间',
  `tg_last_ip` varchar(20) NOT NULL COMMENT '//最后登录的IP',
  `tg_login_count` smallint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//登录次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tg_user`
--

INSERT INTO `tg_user` (`tg_id`, `tg_uniqid`, `tg_active`, `tg_username`, `tg_password`, `tg_question`, `tg_answer`, `tg_email`, `tg_qq`, `tg_url`, `tg_sex`, `tg_face`, `tg_switch`, `tg_autograph`, `tg_level`, `tg_post_time`, `tg_article_time`, `tg_reg_time`, `tg_last_time`, `tg_last_ip`, `tg_login_count`) VALUES
(41, 'a3453ad66ea7c76c7dcb5471b25c5577f14d9ff8', '', '管理员', '8b70d8f412286e406e03cfb7ded2684c5e9d7e3c', '回合', '143f23526995440124adb21bca307656654c44a9', 'kefu@dobest.com', '', '', '男', 'face/m52.gif', 0, NULL, 1, '1495238110', '0', '2017-05-16 07:15:38', '2017-05-21 19:42:28', '::1', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tg_article`
--
ALTER TABLE `tg_article`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_dir`
--
ALTER TABLE `tg_dir`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_friend`
--
ALTER TABLE `tg_friend`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_message`
--
ALTER TABLE `tg_message`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_photo`
--
ALTER TABLE `tg_photo`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_photo_commend`
--
ALTER TABLE `tg_photo_commend`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_system`
--
ALTER TABLE `tg_system`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `tg_user`
--
ALTER TABLE `tg_user`
  ADD PRIMARY KEY (`tg_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tg_article`
--
ALTER TABLE `tg_article`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id', AUTO_INCREMENT=57;
--
-- 使用表AUTO_INCREMENT `tg_dir`
--
ALTER TABLE `tg_dir`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//ID', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `tg_friend`
--
ALTER TABLE `tg_friend`
  MODIFY `tg_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '//ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `tg_message`
--
ALTER TABLE `tg_message`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//ID', AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `tg_photo`
--
ALTER TABLE `tg_photo`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//ID', AUTO_INCREMENT=35;
--
-- 使用表AUTO_INCREMENT `tg_photo_commend`
--
ALTER TABLE `tg_photo_commend`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//ID', AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `tg_system`
--
ALTER TABLE `tg_system`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tg_user`
--
ALTER TABLE `tg_user`
  MODIFY `tg_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//用户自动编号', AUTO_INCREMENT=42;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

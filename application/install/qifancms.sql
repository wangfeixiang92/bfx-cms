-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2019-04-26 03:34:45
-- 服务器版本： 5.5.53
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qifancms`
--

-- --------------------------------------------------------

--
-- 表的结构 `qifan_admin`
--

CREATE TABLE `qifan_admin` (
  `adminid` mediumint(6) UNSIGNED NOT NULL,
  `adminname` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `roleid` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `rolename` varchar(30) NOT NULL DEFAULT '',
  `realname` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `loginip` varchar(15) NOT NULL DEFAULT '',
  `addtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `addpeople` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_admin`
--

INSERT INTO `qifan_admin` (`adminid`, `adminname`, `password`, `roleid`, `rolename`, `realname`, `nickname`, `email`, `logintime`, `loginip`, `addtime`, `addpeople`) VALUES
(1, 'admin', '725dfbaca5be34807d740c468456e36a', 1, '超级管理员', '欧阳先生', '管理员', '2537990266@qq.com', 1547873415, '127.0.0.1', 1541661316, '系统');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_admin_log`
--

CREATE TABLE `qifan_admin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` varchar(15) NOT NULL DEFAULT '',
  `action` varchar(20) NOT NULL DEFAULT '',
  `querystring` varchar(255) NOT NULL DEFAULT '',
  `adminid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `adminname` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `logtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_admin_log`
--

INSERT INTO `qifan_admin_log` (`id`, `module`, `action`, `querystring`, `adminid`, `adminname`, `ip`, `logtime`) VALUES
(2017, 'admin', 'admin_manage', 'm=admin&c=admin_manage&a=public_edit_info', 1, 'admin', '127.0.0.1', 1547873455),
(2018, 'admin', 'admin_manage', 'm=admin&c=admin_manage&a=edit', 1, 'admin', '127.0.0.1', 1547873506),
(2019, 'admin', 'admin_manage', 'm=admin&c=admin_manage&a=edit', 1, 'admin', '127.0.0.1', 1547874030),
(2020, 'admin', 'index', 'm=admin&c=index&a=public_logout', 1, 'admin', '127.0.0.1', 1547876245),
(2021, 'admin', 'index', 'm=admin&c=index&a=public_logout', 0, '', '127.0.0.1', 1547876935);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_admin_login_log`
--

CREATE TABLE `qifan_admin_login_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `adminname` varchar(30) NOT NULL DEFAULT '',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `loginip` varchar(15) NOT NULL DEFAULT '',
  `address` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(30) NOT NULL DEFAULT '',
  `loginresult` tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录结果1为登录成功0为登录失败',
  `cause` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_admin_login_log`
--

INSERT INTO `qifan_admin_login_log` (`id`, `adminname`, `logintime`, `loginip`, `address`, `password`, `loginresult`, `cause`) VALUES
(91, 'admin', 1547873415, '127.0.0.1', '', '***', 1, '登录成功！');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_admin_role`
--

CREATE TABLE `qifan_admin_role` (
  `roleid` tinyint(3) UNSIGNED NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `system` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_admin_role`
--

INSERT INTO `qifan_admin_role` (`roleid`, `rolename`, `description`, `system`, `disabled`) VALUES
(1, '超级管理员', '超级管理员', 1, 0),
(2, '总编', '总编', 1, 0),
(3, '发布人员', '发布人员', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_admin_role_priv`
--

CREATE TABLE `qifan_admin_role_priv` (
  `roleid` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `qifan_admin_role_priv`
--

INSERT INTO `qifan_admin_role_priv` (`roleid`, `m`, `c`, `a`, `data`) VALUES
(0, 'admin', 'content', 'init', ''),
(0, 'admin', 'content', 'remove', ''),
(0, 'admin', 'content', 'del', ''),
(0, 'admin', 'content', 'edit', ''),
(0, 'admin', 'content', 'add', ''),
(0, 'admin', 'content', 'search', ''),
(0, 'admin', 'admin_manage', 'public_edit_info', ''),
(0, 'admin', 'admin_manage', 'public_edit_pwd', '');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_article`
--

CREATE TABLE `qifan_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(180) NOT NULL DEFAULT '',
  `seo_title` varchar(200) NOT NULL DEFAULT '',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `click` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `copyfrom` varchar(50) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `flag` varchar(12) NOT NULL DEFAULT '' COMMENT '1置顶,2头条,3特荐,4推荐,5热点,6幻灯,7跳转',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `system` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `listorder` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `groupids_view` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读权限',
  `readpoint` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读收费',
  `is_push` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否百度推送',
  `gzhname` varchar(100) NOT NULL DEFAULT '',
  `gzhurl` varchar(100) NOT NULL DEFAULT '',
  `quanwenurl` varchar(100) NOT NULL DEFAULT '',
  `backurl` varchar(100) NOT NULL DEFAULT '',
  `sharetime` varchar(100) NOT NULL DEFAULT '',
  `okurl` varchar(100) NOT NULL DEFAULT '',
  `videourl` varchar(100) NOT NULL DEFAULT '',
  `videotype` varchar(100) NOT NULL DEFAULT '',
  `adimg` varchar(100) NOT NULL DEFAULT '',
  `adurl` varchar(100) NOT NULL DEFAULT '',
  `sharenum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dianzan` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sharetitle` varchar(100) NOT NULL DEFAULT '',
  `sharedesc` varchar(100) NOT NULL DEFAULT '',
  `shareimg` varchar(100) NOT NULL DEFAULT '',
  `videofile` varchar(100) NOT NULL DEFAULT '',
  `ping` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `diytemplate` varchar(100) NOT NULL DEFAULT '',
  `diytpl` varchar(100) NOT NULL DEFAULT '',
  `vid` varchar(100) NOT NULL DEFAULT '',
  `music` varchar(100) NOT NULL DEFAULT '',
  `limiturl` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_attachment`
--

CREATE TABLE `qifan_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` char(15) NOT NULL DEFAULT '',
  `originname` varchar(50) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `filepath` char(200) NOT NULL DEFAULT '',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL DEFAULT '',
  `isimage` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `downloads` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `uploadtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_banner`
--

CREATE TABLE `qifan_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(150) NOT NULL DEFAULT '',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listorder` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `typeid` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1显示0隐藏'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_banner_type`
--

CREATE TABLE `qifan_banner_type` (
  `tid` int(10) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `qifan_banner_type`
--

INSERT INTO `qifan_banner_type` (`tid`, `name`) VALUES
(1, '首页');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_category`
--

CREATE TABLE `qifan_category` (
  `catid` smallint(5) NOT NULL,
  `catname` varchar(50) NOT NULL DEFAULT '',
  `modelid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `parentid` smallint(5) NOT NULL DEFAULT '0',
  `arrparentid` varchar(200) NOT NULL DEFAULT '',
  `arrchildid` varchar(200) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `catimg` varchar(150) NOT NULL DEFAULT '',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `listorder` smallint(5) NOT NULL DEFAULT '0',
  `member_publish` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员投稿',
  `display` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `pclink` varchar(100) NOT NULL DEFAULT '',
  `moblink` varchar(100) NOT NULL DEFAULT '',
  `subtitle` varchar(60) NOT NULL DEFAULT '' COMMENT '副标题',
  `mobname` varchar(30) NOT NULL DEFAULT '',
  `category_urlrule` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'URL规则',
  `category_template` varchar(30) NOT NULL DEFAULT '',
  `list_template` varchar(30) NOT NULL DEFAULT '',
  `show_template` varchar(30) NOT NULL DEFAULT '',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(200) NOT NULL DEFAULT '',
  `seo_description` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_category`
--

INSERT INTO `qifan_category` (`catid`, `catname`, `modelid`, `parentid`, `arrparentid`, `arrchildid`, `catdir`, `catimg`, `type`, `listorder`, `member_publish`, `display`, `pclink`, `moblink`, `subtitle`, `mobname`, `category_urlrule`, `category_template`, `list_template`, `show_template`, `seo_title`, `seo_keywords`, `seo_description`) VALUES
(2, '视频', 1, 0, '0', '2', 'shipin', '', 0, 2, 0, 1, 'http://code.yianju.ltd/liebian/shipin/', '', '', '视频', 0, 'category_article', 'list_article', 'show_txv', '', '', ''),
(1, '文章', 1, 0, '0', '1', 'wenzhang', '', 0, 1, 0, 1, 'http://code.yianju.ltd/liebian/wenzhang/', '', '', '文章', 0, 'category_article', 'list_article', 'show_gzh', '', '', ''),
(3, '图片', 1, 0, '0', '3', 'tupian', '', 0, 3, 0, 1, 'http://code.yianju.ltd/liebian/tupian/', '', '', '图片', 0, 'category_article', 'list_article', 'show_diy', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_config`
--

CREATE TABLE `qifan_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '配置说明',
  `value` text NOT NULL COMMENT '配置值',
  `fieldtype` varchar(20) NOT NULL DEFAULT '' COMMENT '字段类型',
  `setting` text NOT NULL COMMENT '字段设置',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_config`
--

INSERT INTO `qifan_config` (`id`, `name`, `type`, `title`, `value`, `fieldtype`, `setting`, `status`) VALUES
(1, 'site_name', 0, '站点名称', 'QifanCMS裂变管理系统', '', '', 1),
(2, 'site_url', 0, '站点根网址', 'http://localhost/liebian/', '', '', 1),
(3, 'site_keyword', 0, '站点关键字', 'qifancms,qifancms演示站,qifancms站点', '', '', 1),
(4, 'site_description', 0, '站点描述', '本站是qifancms演示站点', '', '', 1),
(5, 'site_copyright', 0, '版权信息', 'Powered By qifancms内容管理系统 © 2014-2019 起梵科技', '', '', 1),
(6, 'site_filing', 0, '站点备案号', '京ICP备666666号', '', '', 1),
(7, 'site_code', 0, '统计代码', '<script></script>', '', '', 1),
(8, 'site_theme', 0, '站点模板主题', 'default', '', '', 1),
(9, 'site_logo', 0, '站点logo', '', '', '', 1),
(10, 'url_rule', 0, '前端URL规则', '1', '', '', 1),
(11, 'is_words', 0, '是否开启前端留言功能', '0', '', '', 1),
(12, 'upload_maxsize', 0, '允许上传附件大小', '50000', '', '', 1),
(13, 'upload_types', 0, '允许上传附件类型', 'zip|rar|mp3|mp4|ogg|WebM', '', '', 1),
(14, 'ishtml5', 0, '选择上传附件插件类型', '1', '', '', 1),
(15, 'watermark_enable', 0, '是否开启图片水印', '0', '', '', 1),
(16, 'watermark_name', 0, '水印图片名称', 'mark.png', '', '', 1),
(17, 'watermark_position', 0, '水印的位置', '9', '', '', 1),
(18, 'mail_server', 1, 'SMTP服务器', 'smtp.qq.com', '', '', 1),
(19, 'mail_port', 1, 'SMTP服务器端口', '25', '', '', 1),
(20, 'mail_from', 1, 'SMTP服务器的用户邮箱', '', '', '', 1),
(21, 'mail_auth', 1, 'AUTH LOGIN验证', '1', '', '', 1),
(22, 'mail_user', 1, 'SMTP服务器的用户帐号', '', '', '', 1),
(23, 'mail_pass', 1, 'SMTP服务器的用户密码', '', '', '', 1),
(24, 'mail_inbox', 1, '收件邮箱地址', '', '', '', 1),
(25, 'admin_log', 2, '启用后台管理操作日志', '1', '', '', 1),
(26, 'admin_prohibit_ip', 2, '禁止登录后台的IP', '', '', '', 1),
(27, 'prohibit_words', 2, '屏蔽词', '她妈|它妈|他妈|你妈|去死|贱人', '', '', 1),
(28, 'comment_check', 2, '是否开启评论审核', '0', '', '', 1),
(29, 'comment_tourist', 2, '是否允许游客评论', '0', '', '', 1),
(30, 'is_link', 2, '允许用户申请友情链接', '0', '', '', 1),
(31, 'member_register', 3, '是否开启会员注册', '0', '', '', 1),
(32, 'member_email', 3, '新会员注册是否需要邮件验证', '0', '', '', 1),
(33, 'member_check', 3, '新会员注册是否需要管理员审核', '0', '', '', 1),
(34, 'member_point', 3, '新会员默认积分', '0', '', '', 1),
(35, 'member_qifan', 3, '是否开启会员登录验证码', '1', '', '', 1),
(36, 'rmb_point_rate', 3, '1元人民币购买积分数量', '10', '', '', 1),
(37, 'login_point', 3, '每日登陆奖励积分', '1', '', '', 1),
(38, 'comment_point', 3, '发布评论奖励积分', '1', '', '', 1),
(39, 'publish_point', 3, '投稿奖励积分', '3', '', '', 1),
(40, 'qq_app_id', 3, 'QQ App ID', '', '', '', 1),
(41, 'qq_app_key', 3, 'QQ App key', '', '', '', 1),
(42, 'weibo_key', 4, '微博登录App Key', '', '', '', 1),
(43, 'weibo_secret', 4, '微博登录App Secret', '', '', '', 1),
(44, 'wx_appid', 4, '微信开发者ID', 'wx0a5946ea26607bb5', '', '', 1),
(45, 'wx_secret', 4, '微信开发者密码', 'a53118824a302c9fdf06dcfae99e5921', '', '', 1),
(46, 'wx_token', 4, '微信Token签名', '', '', '', 1),
(47, 'wx_encodingaeskey', 4, '微信EncodingAESKey', '', '', '', 1),
(48, 'wx_relation_model', 4, '微信关联模型', 'article', '', '', 1),
(49, 'baidu_push_token', 0, '百度推送token', '', '', '', 1),
(50, 'advertise', 99, '首页广告位', '免费又好用的CMS建站系统，就选qifancms!', 'textarea', '', 1),
(51, 'admin_domains', 2, '域名池', 'http://v.beibys.com,http://v.cjiche.com', '', '', 1),
(52, 'admin_ddomain', 2, '落地域名', 'http://v.yianju.ltd,http://v.yi-anju.com', '', '', 1),
(53, 'source', 0, '新浪短地址source', '3271760578', '', '', 1),
(54, 'limit', 0, '访问限制', '0', '', '', 1),
(55, 'limiturl', 0, '限制访问时跳转URL', 'http://www.baidu.com', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_guestbook`
--

CREATE TABLE `qifan_guestbook` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '主题',
  `booktime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名字',
  `email` varchar(40) NOT NULL DEFAULT '' COMMENT '留言人电子邮箱',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '留言人电话',
  `qq` varchar(11) NOT NULL DEFAULT '' COMMENT '留言人qq',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '留言人地址',
  `bookmsg` text NOT NULL COMMENT '内容',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `ischeck` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `isread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否读过',
  `ispc` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1电脑,0手机',
  `replyid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '回复的id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_menu`
--

CREATE TABLE `qifan_menu` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(30) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `qifan_menu`
--

INSERT INTO `qifan_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES
(1, '内容管理', 0, '', '', '', '&#xe616;', 1, 1),
(3, '字段管理', 0, '', '', '', '&#xe6c0;', 2, 1),
(4, '管理员管理', 0, '', '', '', '&#xe62d;', 4, 1),
(5, '个人信息', 0, '', '', '', '&#xe602;', 5, 1),
(6, '系统管理', 0, '', '', '', '&#xe62e;', 6, 1),
(7, '数据管理', 0, '', '', '', '&#xe6b5;', 7, 1),
(13, '后台操作日志', 6, 'admin', 'admin_log', 'init', '', 66, 1),
(14, '操作日志删除', 13, 'admin', 'admin_log', 'del_log', '', 0, 0),
(15, '操作日志搜索', 13, 'admin', 'admin_log', 'search_log', '', 0, 0),
(16, '后台登录日志', 6, 'admin', 'admin_log', 'admin_login_log_list', '', 67, 1),
(17, '登录日志删除', 16, 'admin', 'admin_log', 'del_login_log', '', 0, 0),
(18, '管理员管理', 4, 'admin', 'admin_manage', 'init', '', 0, 1),
(19, '删除管理员', 18, 'admin', 'admin_manage', 'delete', '', 0, 0),
(20, '添加管理员', 18, 'admin', 'admin_manage', 'add', '', 0, 0),
(21, '编辑管理员', 18, 'admin', 'admin_manage', 'edit', '', 0, 0),
(22, '修改个人信息', 18, 'admin', 'admin_manage', 'public_edit_info', '', 0, 1),
(23, '修改个人密码', 18, 'admin', 'admin_manage', 'public_edit_pwd', '', 0, 1),
(24, '分类管理', 1, 'admin', 'category', 'init', '', 11, 1),
(25, '排序分类', 24, 'admin', 'category', 'order', '', 0, 1),
(26, '删除分类', 24, 'admin', 'category', 'delete', '', 0, 0),
(27, '添加分类', 24, 'admin', 'category', 'add', '', 0, 1),
(28, '编辑分类', 24, 'admin', 'category', 'edit', '', 0, 0),
(29, '编辑单页内容', 24, 'admin', 'category', 'page_content', '', 0, 0),
(30, '内容管理', 1, 'admin', 'content', 'init', '', 10, 1),
(31, '内容搜索', 30, 'admin', 'content', 'search', '', 0, 0),
(32, '添加内容', 30, 'admin', 'content', 'add', '', 0, 0),
(33, '修改内容', 30, 'admin', 'content', 'edit', '', 0, 0),
(34, '删除内容', 30, 'admin', 'content', 'del', '', 0, 0),
(35, '数据备份', 7, 'admin', 'database', 'init', '', 70, 1),
(36, '数据还原', 7, 'admin', 'database', 'databack_list', '', 71, 1),
(37, '优化表', 35, 'admin', 'database', 'public_optimize', '', 0, 0),
(38, '修复表', 35, 'admin', 'database', 'public_repair', '', 0, 0),
(39, '备份文件删除', 36, 'admin', 'database', 'databack_del', '', 0, 0),
(40, '备份文件下载', 36, 'admin', 'database', 'databack_down', '', 0, 0),
(41, '数据导入', 36, 'admin', 'database', 'import', '', 0, 0),
(42, '字段管理', 3, 'admin', 'model_field', 'init', '', 0, 1),
(43, '添加字段', 42, 'admin', 'model_field', 'add', '', 0, 0),
(44, '修改字段', 42, 'admin', 'model_field', 'edit', '', 0, 0),
(45, '删除字段', 42, 'admin', 'model_field', 'delete', '', 0, 0),
(46, '排序字段', 42, 'admin', 'model_field', 'order', '', 0, 0),
(47, '字段管理', 3, 'admin', 'module', 'init', '', 0, 0),
(48, '模块安装', 47, 'admin', 'module', 'install', '', 0, 0),
(49, '模块卸载', 47, 'admin', 'module', 'uninstall', '', 0, 0),
(50, '角色管理', 4, 'admin', 'role', 'init', '', 0, 1),
(51, '删除角色', 50, 'admin', 'role', 'delete', '', 0, 0),
(52, '添加角色', 50, 'admin', 'role', 'add', '', 0, 0),
(53, '编辑角色', 50, 'admin', 'role', 'edit', '', 0, 0),
(58, '系统设置', 6, 'admin', 'system_manage', 'init', '', 60, 1),
(65, 'TAG管理', 1, 'admin', 'tag', 'init', '', 16, 0),
(66, '添加TAG', 65, 'admin', 'tag', 'add', '', 0, 0),
(67, '编辑TAG', 65, 'admin', 'tag', 'edit', '', 0, 0),
(68, '删除TAG', 65, 'admin', 'tag', 'del', '', 0, 0),
(69, '批量更新URL', 1, 'admin', 'update_urls', 'init', '', 17, 1),
(70, '附件管理', 1, 'attachment', 'index', 'init', '', 14, 0),
(71, '附件搜索', 70, 'attachment', 'index', 'search_list', '', 0, 0),
(72, '附件浏览', 70, 'attachment', 'index', 'public_att_view', '', 0, 0),
(73, '删除单个附件', 70, 'attachment', 'index', 'del_one', '', 0, 0),
(74, '删除多个附件', 70, 'attachment', 'index', 'del', '', 0, 0),
(115, '权限管理', 50, 'admin', 'role', 'role_priv', '', 0, 0),
(122, '修改个人信息', 5, 'admin', 'admin_manage', 'public_edit_info', '', 51, 1),
(123, '修改密码', 5, 'admin', 'admin_manage', 'public_edit_pwd', '', 52, 1),
(139, 'URL规则管理', 6, 'admin', 'urlrule', 'init', '', 65, 1),
(140, '添加URL规则', 139, 'admin', 'urlrule', 'add', '', 0, 0),
(141, '删除URL规则', 139, 'admin', 'urlrule', 'del', '', 0, 0),
(142, '编辑URL规则', 139, 'admin', 'urlrule', 'edit', '', 0, 0),
(143, '批量移动', 30, 'admin', 'content', 'remove', '', 0, 0),
(144, 'SQL命令行', 7, 'admin', 'sql', 'init', '', 63, 1),
(145, '提交SQL命令', 144, 'admin', 'sql', 'do_sql', '', 0, 1),
(156, '幻灯片管理', 1, 'banner', 'banner', 'init', '', 11, 1),
(157, '添加轮播', 156, 'banner', 'banner', 'add', '', 0, 0),
(158, '修改轮播', 156, 'banner', 'banner', 'edit', '', 0, 0),
(159, '删除轮播', 156, 'banner', 'banner', 'del', '', 0, 0),
(160, '添加轮播分类', 156, 'banner', 'banner', 'cat_add', '', 0, 0),
(161, '管理轮播分类', 156, 'banner', 'banner', 'cat_manage', '', 0, 0),
(200, '微信配置', 0, '', '', '', '&#xe694;', 3, 1),
(201, '微信配置', 200, 'wechat', 'config', 'init', '', 0, 1),
(202, '保存配置', 201, 'wechat', 'config', 'save', '', 0, 0),
(254, '字段列表', 250, 'diyform', 'diyform_field', 'init', '', 0, 0),
(255, '添加字段', 254, 'diyform', 'diyform_field', 'add', '', 0, 0),
(256, '修改字段', 254, 'diyform', 'diyform_field', 'edit', '', 0, 0),
(257, '删除字段', 254, 'diyform', 'diyform_field', 'delete', '', 0, 0),
(268, '导出模型', 54, 'admin', 'sitemodel', 'import', '', 0, 0),
(269, '导入模型', 54, 'admin', 'sitemodel', 'export', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_message`
--

CREATE TABLE `qifan_message` (
  `messageid` int(10) UNSIGNED NOT NULL,
  `send_from` varchar(30) NOT NULL DEFAULT '' COMMENT '发件人',
  `send_to` varchar(30) NOT NULL DEFAULT '' COMMENT '收件人',
  `message_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '' COMMENT '主题',
  `content` text NOT NULL,
  `replyid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '回复的id',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '1正常0隐藏',
  `isread` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否读过',
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '系统信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_message_data`
--

CREATE TABLE `qifan_message_data` (
  `id` int(4) NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `group_message_id` int(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '读过的信息ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_message_group`
--

CREATE TABLE `qifan_message_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `groupid` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组id',
  `subject` char(80) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_model`
--

CREATE TABLE `qifan_model` (
  `modelid` int(10) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL DEFAULT '',
  `tablename` char(20) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `setting` text,
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `items` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_model`
--

INSERT INTO `qifan_model` (`modelid`, `name`, `tablename`, `description`, `setting`, `inputtime`, `items`, `disabled`, `type`, `sort`, `issystem`) VALUES
(1, '模型', 'article', '模型', '', 1466393786, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_model_field`
--

CREATE TABLE `qifan_model_field` (
  `catid` int(11) NOT NULL,
  `fieldid` mediumint(8) UNSIGNED NOT NULL,
  `modelid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(100) NOT NULL DEFAULT '',
  `css` varchar(30) NOT NULL DEFAULT '',
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `errortips` varchar(100) NOT NULL DEFAULT '',
  `fieldtype` varchar(20) NOT NULL DEFAULT '',
  `defaultvalue` varchar(30) NOT NULL DEFAULT '',
  `setting` text NOT NULL,
  `isrequired` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isunique` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isadd` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `listorder` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_model_field`
--

INSERT INTO `qifan_model_field` (`catid`, `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `errortips`, `fieldtype`, `defaultvalue`, `setting`, `isrequired`, `issystem`, `isunique`, `isadd`, `listorder`, `disabled`, `type`, `status`) VALUES
(0, 1, 0, 'title', '标题', '', '', 1, 100, '请输入标题', 'input', '', '', 1, 1, 0, 1, 0, 0, 0, 1),
(0, 3, 0, 'catid', '栏目', '', '', 1, 10, '请选择栏目', 'select', '', '', 1, 1, 0, 1, 0, 0, 0, 1),
(0, 4, 0, 'thumb', '缩略图', '', '', 0, 100, '', 'image', '', '', 0, 1, 0, 1, 0, 0, 0, 1),
(0, 7, 0, 'inputtime', '发布时间', '', '', 1, 10, '', 'datetime', '', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 8, 0, 'updatetime', '更新时间', '', '', 1, 10, '', 'datetime', '', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 10, 0, 'url', 'URL', '', '', 1, 200, '', 'input', '', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 11, 0, 'userid', '用户ID', '', '', 1, 10, '', 'input', '', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 12, 0, 'username', '用户名', '', '', 1, 30, '', 'input', '', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 13, 0, 'nickname', '昵称', '', '', 0, 30, '', 'input', '', '', 0, 1, 0, 0, 0, 0, 0, 1),
(0, 15, 0, 'content', '内容', '', '', 1, 999999, '', 'editor', '', '', 1, 1, 0, 1, 0, 0, 0, 1),
(0, 16, 0, 'click', '点击数', '', '', 1, 10, '', 'input', '0', '', 0, 1, 0, 0, 0, 0, 0, 1),
(0, 66, 0, 'vid', '腾讯VID', '腾讯VID和视频地址或文件只填一个', '', 0, 100, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 65, 0, 'diytpl', '自定义模板', '自定义模板 (覆盖栏目模板)', '', 0, 100, '', 'select', '', '{\\\"0\\\":\\\"show_1\\\",\\\"1\\\":\\\"show2\\\",\\\"2\\\":\\\"show3\\\"}', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 20, 0, 'status', '状态', '', '', 1, 2, '', 'checkbox', '', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 22, 0, 'listorder', '排序', '', '', 1, 5, '', 'input', '1', '', 1, 1, 0, 0, 0, 0, 0, 1),
(0, 38, 0, 'gzhname', '公众号名称', '公众号名称', '', 0, 12, '', 'input', '', '', 0, 1, 0, 1, 1, 0, 0, 1),
(0, 39, 0, 'gzhurl', '公众号链接', '公众号链接', '', 0, 100, '', 'input', '', '', 0, 1, 0, 1, 1, 0, 0, 1),
(0, 40, 0, 'quanwenurl', '阅读全文链接', '阅读全文链接', '', 0, 100, '', 'input', '', '', 0, 1, 0, 1, 1, 0, 0, 1),
(0, 41, 0, 'backurl', '后退链接', '后退链接', '', 0, 100, '', 'input', '', '', 0, 1, 0, 1, 2, 0, 0, 1),
(0, 42, 0, 'sharetime', '要求分享时间', '要求分享时间', '', 0, 100, '', 'input', '', '', 0, 1, 0, 1, 1, 0, 0, 1),
(0, 52, 0, 'sharenum', '分享群次数', '分享群次数', '', 0, 5, '', 'input', '', '', 0, 0, 0, 1, 1, 0, 0, 1),
(0, 44, 0, 'okurl', '分享成功链接', '分享成功链接', '', 0, 100, '', 'input', '', '', 0, 0, 0, 1, 1, 0, 0, 1),
(0, 50, 0, 'adimg', '广告图', '广告图上传或地址', '', 0, 100, '', 'image', '', '', 0, 0, 0, 1, 1, 0, 0, 1),
(0, 62, 0, 'videofile', '视频文件', '视频文件或文件地址，以.mp4等格式结尾', '', 0, 100, '', 'attachment', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 63, 0, 'ping', '评论', '评论数（视频模板）', '', 0, 1, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 51, 0, 'adurl', '广告链接', '点击广告链接', '', 0, 100, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 53, 0, 'dianzan', '点赞', '点赞', '', 0, 0, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 54, 0, 'sharetitle', '分享标题', '分享标题', '', 0, 100, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 55, 0, 'sharedesc', '分享描述', '分享描述', '', 0, 100, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 56, 0, 'shareimg', '分享图片', '分享图片', '', 0, 100, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 67, 0, 'music', '音乐', '音乐,仅在diy模板下有效', '', 0, 100, '', 'input', '', '', 0, 0, 0, 0, 1, 0, 0, 1),
(0, 68, 0, 'limiturl', '限制访问跳转URL', '未到允许访问的浏览器时，跳转至此地址', '', 0, 0, '', 'input', '', '', 0, 0, 0, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_module`
--

CREATE TABLE `qifan_module` (
  `module` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `iscore` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `setting` text,
  `listorder` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_module`
--

INSERT INTO `qifan_module` (`module`, `name`, `iscore`, `version`, `description`, `setting`, `listorder`, `disabled`, `installdate`, `updatedate`) VALUES
('admin', '后台模块', 1, '1.0', '后台模块', '', 0, 0, '2016-08-27', '2016-08-27'),
('index', '前台模块', 1, '1.0', '前台模块', '', 0, 0, '2016-09-21', '2016-09-21'),
('api', '接口模块', 1, '1.0', '为整个系统提供接口', '', 0, 0, '2016-08-28', '2016-08-28'),
('install', '安装模块', 1, '1.0', 'CMS安装模块', '', 0, 0, '2016-10-28', '2016-10-28'),
('attachment', '附件模块', 1, '1.0', '附件模块', '', 0, 0, '2016-10-10', '2016-10-10'),
('guestbook', '留言模块', 1, '1.0', '留言板模块', '', 0, 0, '2016-10-25', '2016-10-25'),
('search', '搜索模块', 1, '1.0', '搜索模块', '', 0, 0, '2016-11-21', '2016-11-21'),
('mobile', '手机模块', 1, '1.0', '手机模块', '', 0, 0, '2017-04-05', '2017-04-05'),
('banner', '轮播图管理', 0, '1.0', '轮播图管理模块', '', 0, 0, '2017-05-12', '2017-05-12'),
('wechat', '微信模块', 1, '1.0', '微信模块', '', 0, 0, '2017-11-03', '2017-11-03');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_order`
--

CREATE TABLE `qifan_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单状态0未付款1已付款',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `addtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下单时间',
  `paytime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付时间',
  `paytype` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付方式1支付宝2微信',
  `transaction` varchar(32) NOT NULL DEFAULT '' COMMENT '第三方交易单号',
  `money` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `quantity` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '数量',
  `ip` char(15) NOT NULL DEFAULT '',
  `desc` varchar(250) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_page`
--

CREATE TABLE `qifan_page` (
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL DEFAULT '',
  `pagedir` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_page`
--

INSERT INTO `qifan_page` (`catid`, `title`, `pagedir`, `keywords`, `description`, `content`, `updatetime`) VALUES
(0, 'htrhtrhtrh', 'danye', '金金金qqq', '一二三静静瑶', '<p>珀助手表珠<br/></p>', 1542031686),
(0, '', 'danye', '', '', '', 1542033898),
(0, '', 'youxi', '', '', '', 1544157251),
(0, '', 'youxi', '', '', '', 1544256807),
(0, '', 'gongzhonghao', '', '', '', 1544257237);

-- --------------------------------------------------------

--
-- 表的结构 `qifan_tag`
--

CREATE TABLE `qifan_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(30) NOT NULL DEFAULT '',
  `total` mediumint(9) UNSIGNED NOT NULL DEFAULT '0',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_tag_content`
--

CREATE TABLE `qifan_tag_content` (
  `modelid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `aid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_urlrule`
--

CREATE TABLE `qifan_urlrule` (
  `urlruleid` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `urlrule` varchar(100) NOT NULL DEFAULT '' COMMENT 'URL规则',
  `route` varchar(100) NOT NULL DEFAULT '' COMMENT '指向的路由'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qifan_urlrule`
--

INSERT INTO `qifan_urlrule` (`urlruleid`, `name`, `urlrule`, `route`) VALUES
(1, '内容页_m', 'm10a12(\\d+)c201b(\\d+)~.jpg', 'mobile/index/show/catid/$1/id/$2');

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_auto_reply`
--

CREATE TABLE `qifan_wechat_auto_reply` (
  `id` mediumint(8) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1关键字回复2自动回复3关注回复',
  `keyword` varchar(64) NOT NULL DEFAULT '' COMMENT '关键字回复的关键字',
  `keyword_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1完全匹配0模糊匹配',
  `relation_id` varchar(15) NOT NULL DEFAULT '' COMMENT '图文回复的关联内容ID',
  `content` text NOT NULL COMMENT '文本回复的内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_group`
--

CREATE TABLE `qifan_wechat_group` (
  `id` mediumint(9) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `count` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_mass`
--

CREATE TABLE `qifan_wechat_mass` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_type` char(6) NOT NULL DEFAULT '' COMMENT '消息类型',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0通过openid群发1通过分组群发2全部',
  `media_id` varchar(200) NOT NULL DEFAULT '',
  `msg_id` varchar(10) NOT NULL DEFAULT '',
  `msg_data_id` varchar(10) NOT NULL DEFAULT '' COMMENT '图文消息的数据ID',
  `receive` varchar(255) NOT NULL DEFAULT '' COMMENT '按组群发为组id，否则为openid列表',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1任务提交成功2群发已结束',
  `masstime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发送时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_media`
--

CREATE TABLE `qifan_wechat_media` (
  `id` int(11) NOT NULL,
  `originname` varchar(50) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `filepath` char(200) NOT NULL DEFAULT '',
  `type` char(6) NOT NULL DEFAULT '',
  `media_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0临时素材,1永久素材',
  `media_id` varchar(200) NOT NULL DEFAULT '',
  `created_at` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '永久素材的图片url/图文素材标题'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_menu`
--

CREATE TABLE `qifan_wechat_menu` (
  `id` mediumint(8) NOT NULL,
  `parentid` mediumint(6) NOT NULL DEFAULT '0',
  `name` varchar(48) NOT NULL DEFAULT '',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1关键字2跳转',
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `event` varchar(64) NOT NULL DEFAULT '',
  `listorder` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_message`
--

CREATE TABLE `qifan_wechat_message` (
  `id` int(10) UNSIGNED NOT NULL,
  `openid` char(100) NOT NULL DEFAULT '',
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统回复',
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `msgtype` varchar(32) NOT NULL DEFAULT '' COMMENT '消息类型',
  `isread` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1已读0未读',
  `content` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_scan`
--

CREATE TABLE `qifan_wechat_scan` (
  `id` int(11) NOT NULL,
  `scan` varchar(65) NOT NULL DEFAULT '' COMMENT '场景',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0永久,1临时',
  `expire_time` char(7) NOT NULL DEFAULT '0' COMMENT '二维码有效时间',
  `ticket` varchar(150) NOT NULL DEFAULT '',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '场景备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qifan_wechat_user`
--

CREATE TABLE `qifan_wechat_user` (
  `wechatid` int(10) UNSIGNED NOT NULL,
  `openid` char(100) NOT NULL DEFAULT '',
  `groupid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1关注0取消',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `city` char(50) NOT NULL DEFAULT '',
  `province` char(50) NOT NULL DEFAULT '',
  `country` char(50) NOT NULL DEFAULT '',
  `headimgurl` char(255) NOT NULL DEFAULT '',
  `subscribe_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `remark` varchar(50) NOT NULL DEFAULT '',
  `scan` varchar(30) NOT NULL DEFAULT '' COMMENT '来源场景'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qifan_admin`
--
ALTER TABLE `qifan_admin`
  ADD PRIMARY KEY (`adminid`) USING BTREE;

--
-- Indexes for table `qifan_admin_log`
--
ALTER TABLE `qifan_admin_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `logtime` (`logtime`) USING BTREE,
  ADD KEY `adminid` (`adminid`) USING BTREE;

--
-- Indexes for table `qifan_admin_login_log`
--
ALTER TABLE `qifan_admin_login_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `qifan_admin_role`
--
ALTER TABLE `qifan_admin_role`
  ADD PRIMARY KEY (`roleid`) USING BTREE,
  ADD KEY `disabled` (`disabled`) USING BTREE;

--
-- Indexes for table `qifan_admin_role_priv`
--
ALTER TABLE `qifan_admin_role_priv`
  ADD KEY `roleid` (`roleid`,`m`,`c`,`a`) USING BTREE;

--
-- Indexes for table `qifan_article`
--
ALTER TABLE `qifan_article`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `status` (`status`,`listorder`) USING BTREE,
  ADD KEY `catid` (`catid`,`status`) USING BTREE,
  ADD KEY `userid` (`userid`,`status`) USING BTREE;

--
-- Indexes for table `qifan_attachment`
--
ALTER TABLE `qifan_attachment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `userid_index` (`userid`) USING BTREE;

--
-- Indexes for table `qifan_banner`
--
ALTER TABLE `qifan_banner`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `typeid` (`typeid`) USING BTREE;

--
-- Indexes for table `qifan_banner_type`
--
ALTER TABLE `qifan_banner_type`
  ADD PRIMARY KEY (`tid`) USING BTREE;

--
-- Indexes for table `qifan_category`
--
ALTER TABLE `qifan_category`
  ADD PRIMARY KEY (`catid`) USING BTREE,
  ADD KEY `modelid` (`modelid`) USING BTREE;

--
-- Indexes for table `qifan_config`
--
ALTER TABLE `qifan_config`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- Indexes for table `qifan_guestbook`
--
ALTER TABLE `qifan_guestbook`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_booktime` (`booktime`) USING BTREE,
  ADD KEY `index_ischeck` (`ischeck`) USING BTREE,
  ADD KEY `index_replyid` (`replyid`) USING BTREE;

--
-- Indexes for table `qifan_menu`
--
ALTER TABLE `qifan_menu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `listorder` (`listorder`) USING BTREE,
  ADD KEY `parentid` (`parentid`) USING BTREE,
  ADD KEY `module` (`m`,`c`,`a`) USING BTREE;

--
-- Indexes for table `qifan_message`
--
ALTER TABLE `qifan_message`
  ADD PRIMARY KEY (`messageid`) USING BTREE,
  ADD KEY `replyid` (`replyid`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `qifan_message_data`
--
ALTER TABLE `qifan_message_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `message` (`userid`,`group_message_id`) USING BTREE;

--
-- Indexes for table `qifan_message_group`
--
ALTER TABLE `qifan_message_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `qifan_model`
--
ALTER TABLE `qifan_model`
  ADD PRIMARY KEY (`modelid`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- Indexes for table `qifan_model_field`
--
ALTER TABLE `qifan_model_field`
  ADD PRIMARY KEY (`fieldid`,`catid`) USING BTREE,
  ADD KEY `modelid` (`modelid`,`disabled`) USING BTREE,
  ADD KEY `field` (`field`,`modelid`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `qifan_module`
--
ALTER TABLE `qifan_module`
  ADD PRIMARY KEY (`module`) USING BTREE;

--
-- Indexes for table `qifan_order`
--
ALTER TABLE `qifan_order`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `userid` (`userid`) USING BTREE,
  ADD KEY `order_sn` (`order_sn`) USING BTREE;

--
-- Indexes for table `qifan_page`
--
ALTER TABLE `qifan_page`
  ADD KEY `catid` (`catid`) USING BTREE;

--
-- Indexes for table `qifan_tag`
--
ALTER TABLE `qifan_tag`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `tag` (`tag`) USING BTREE;

--
-- Indexes for table `qifan_tag_content`
--
ALTER TABLE `qifan_tag_content`
  ADD KEY `tag_index` (`modelid`,`aid`) USING BTREE,
  ADD KEY `tagid_index` (`tagid`) USING BTREE;

--
-- Indexes for table `qifan_urlrule`
--
ALTER TABLE `qifan_urlrule`
  ADD PRIMARY KEY (`urlruleid`) USING BTREE;

--
-- Indexes for table `qifan_wechat_auto_reply`
--
ALTER TABLE `qifan_wechat_auto_reply`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `type_index` (`type`) USING BTREE;

--
-- Indexes for table `qifan_wechat_group`
--
ALTER TABLE `qifan_wechat_group`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `qifan_wechat_mass`
--
ALTER TABLE `qifan_wechat_mass`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `qifan_wechat_media`
--
ALTER TABLE `qifan_wechat_media`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `qifan_wechat_menu`
--
ALTER TABLE `qifan_wechat_menu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `parentid` (`parentid`) USING BTREE,
  ADD KEY `listorder` (`listorder`) USING BTREE;

--
-- Indexes for table `qifan_wechat_message`
--
ALTER TABLE `qifan_wechat_message`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `openid` (`openid`) USING BTREE,
  ADD KEY `issystem` (`issystem`) USING BTREE;

--
-- Indexes for table `qifan_wechat_scan`
--
ALTER TABLE `qifan_wechat_scan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `qifan_wechat_user`
--
ALTER TABLE `qifan_wechat_user`
  ADD PRIMARY KEY (`wechatid`) USING BTREE,
  ADD UNIQUE KEY `openid` (`openid`) USING BTREE,
  ADD KEY `groupid` (`groupid`) USING BTREE,
  ADD KEY `subscribe` (`subscribe`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `qifan_admin`
--
ALTER TABLE `qifan_admin`
  MODIFY `adminid` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `qifan_admin_log`
--
ALTER TABLE `qifan_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2022;

--
-- 使用表AUTO_INCREMENT `qifan_admin_login_log`
--
ALTER TABLE `qifan_admin_login_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- 使用表AUTO_INCREMENT `qifan_admin_role`
--
ALTER TABLE `qifan_admin_role`
  MODIFY `roleid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `qifan_article`
--
ALTER TABLE `qifan_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `qifan_attachment`
--
ALTER TABLE `qifan_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `qifan_banner`
--
ALTER TABLE `qifan_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `qifan_banner_type`
--
ALTER TABLE `qifan_banner_type`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `qifan_category`
--
ALTER TABLE `qifan_category`
  MODIFY `catid` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `qifan_config`
--
ALTER TABLE `qifan_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- 使用表AUTO_INCREMENT `qifan_guestbook`
--
ALTER TABLE `qifan_guestbook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_menu`
--
ALTER TABLE `qifan_menu`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- 使用表AUTO_INCREMENT `qifan_message`
--
ALTER TABLE `qifan_message`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_message_data`
--
ALTER TABLE `qifan_message_data`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_message_group`
--
ALTER TABLE `qifan_message_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_model`
--
ALTER TABLE `qifan_model`
  MODIFY `modelid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `qifan_model_field`
--
ALTER TABLE `qifan_model_field`
  MODIFY `fieldid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- 使用表AUTO_INCREMENT `qifan_order`
--
ALTER TABLE `qifan_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_tag`
--
ALTER TABLE `qifan_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_urlrule`
--
ALTER TABLE `qifan_urlrule`
  MODIFY `urlruleid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_auto_reply`
--
ALTER TABLE `qifan_wechat_auto_reply`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_mass`
--
ALTER TABLE `qifan_wechat_mass`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_media`
--
ALTER TABLE `qifan_wechat_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_menu`
--
ALTER TABLE `qifan_wechat_menu`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_message`
--
ALTER TABLE `qifan_wechat_message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_scan`
--
ALTER TABLE `qifan_wechat_scan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qifan_wechat_user`
--
ALTER TABLE `qifan_wechat_user`
  MODIFY `wechatid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

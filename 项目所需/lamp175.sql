-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-04-14 22:24:06
-- 服务器版本： 5.5.23-log
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lamp175`
--

-- --------------------------------------------------------

--
-- 表的结构 `ad`
--

CREATE TABLE IF NOT EXISTS `ad` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `explain` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `cate`
--

CREATE TABLE IF NOT EXISTS `cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `cate`
--

INSERT INTO `cate` (`id`, `name`, `pid`, `path`) VALUES
(17, '服饰', 0, '0'),
(18, '潮流男装', 17, '0,17'),
(20, '活力童装', 17, '0,17'),
(21, '生活家居', 0, '0'),
(22, '家具家具', 21, '0,21'),
(23, '家用电器', 21, '0,21'),
(24, '汽车', 0, '0'),
(25, '国产汽车', 24, '0,24'),
(26, '日韩汽车', 24, '0,24'),
(27, '美规汽车', 24, '0,24'),
(29, '精品手机', 21, '0,21'),
(30, '妩媚女装', 17, '0,17');

-- --------------------------------------------------------

--
-- 表的结构 `configure`
--

CREATE TABLE IF NOT EXISTS `configure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置表id',
  `webname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '网站名称',
  `keywords` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '网站关键字',
  `logo` varchar(255) NOT NULL COMMENT '网站logo',
  `copy` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '网站版权',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '网站维护',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `configure`
--

INSERT INTO `configure` (`id`, `webname`, `keywords`, `logo`, `copy`, `status`) VALUES
(1, 'SuperUserMarket', 'LAMP', 'b9a5e4396517c47bf4d84085749af4e6.jpg', 'LAMP兄弟连', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dianzan`
--

CREATE TABLE IF NOT EXISTS `dianzan` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fishmember`
--

CREATE TABLE IF NOT EXISTS `fishmember` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fish_id` int(11) DEFAULT NULL COMMENT '鱼塘ID',
  `member_id` int(11) DEFAULT NULL COMMENT '鱼塘用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `fishs`
--

CREATE TABLE IF NOT EXISTS `fishs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鱼塘id',
  `tz_id` int(11) NOT NULL COMMENT '塘主id',
  `t_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '鱼塘名',
  `t_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'default.jpg' COMMENT '塘头像',
  `t_bac` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '鱼塘背景',
  `t_title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '鱼塘介绍',
  `cate_id` int(11) NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '鱼塘创建时间',
  PRIMARY KEY (`id`),
  KEY `tname` (`t_name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fishs`
--

INSERT INTO `fishs` (`id`, `tz_id`, `t_name`, `t_pic`, `t_bac`, `t_title`, `cate_id`, `createtime`) VALUES
(1, 0, '风行欧美', '1491920680919677.jpg', '1491920680746612.jpg', '引领欧美风尚！与国际接轨', 18, 0),
(3, 0, '汽车', '1491920563234558.jpg', '1491920610599823.jpg', '精品汽车！带你装逼带你飞', 25, 0),
(4, 0, '女人不是妖', '1491960482733825.jpg', '1491960482394989.jpg', '长相是天生的，魅力是培养的', 30, 1491960482);

-- --------------------------------------------------------

--
-- 表的结构 `friendlink`
--

CREATE TABLE IF NOT EXISTS `friendlink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接id',
  `linkname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '友情链接名称',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '友情链接地址',
  `content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '友情链接内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `friendlink`
--

INSERT INTO `friendlink` (`id`, `linkname`, `url`, `content`) VALUES
(13, '京东', 'http://www.jd.com', '电器商城'),
(12, '淘宝', 'http://www.taobao.com', '都是好货'),
(14, '优酷', 'http://www.youku.com', '都是大片'),
(15, '新浪', 'http://www.sian.com', '说你想说'),
(11, '百度', 'http://www.baidu.com', '无奇不有'),
(16, '天猫', 'http://www.tmall.com', '都是宝贝');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `p_id` int(11) DEFAULT NULL COMMENT '类别ID',
  `t_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属鱼塘ID',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goodstitle` varchar(255) DEFAULT NULL COMMENT '商品介绍',
  `s_id` int(11) DEFAULT NULL COMMENT '卖家ID',
  `b_id` int(11) DEFAULT '0' COMMENT '买家ID',
  `price` decimal(10,0) DEFAULT NULL COMMENT '商品价格',
  `created_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `reply` int(10) NOT NULL DEFAULT '0',
  `zan` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `guanzhu`
--

CREATE TABLE IF NOT EXISTS `guanzhu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` int(10) DEFAULT '0' COMMENT '关注者ID',
  `b_id` int(10) DEFAULT '0' COMMENT '被关注者ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `huodong`
--

CREATE TABLE IF NOT EXISTS `huodong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '鱼塘ID',
  `t_id` int(10) NOT NULL,
  `t_name` varchar(255) DEFAULT NULL COMMENT '鱼塘名称',
  `ltime` varchar(30) NOT NULL COMMENT '结束时间',
  `uid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `integrals`
--

CREATE TABLE IF NOT EXISTS `integrals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `integral` int(10) DEFAULT '0' COMMENT '积分',
  `intertime` varchar(255) DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `integrals`
--

INSERT INTO `integrals` (`id`, `uid`, `integral`, `intertime`) VALUES
(1, 31, 1969, '1492208475'),
(2, 32, 1762, '1492208462');

-- --------------------------------------------------------

--
-- 表的结构 `jingjia`
--

CREATE TABLE IF NOT EXISTS `jingjia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `p_id` int(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `lunbotu`
--

CREATE TABLE IF NOT EXISTS `lunbotu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `cate_id` int(11) NOT NULL COMMENT '类别id',
  `pic` varchar(255) NOT NULL COMMENT '轮播图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `lunbotu`
--

INSERT INTO `lunbotu` (`id`, `cate_id`, `pic`) VALUES
(1, 18, '1492207537671413.jpg'),
(2, 27, '1492184657123768.jpg'),
(6, 23, '1492184633983961.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `goodsid` int(10) NOT NULL DEFAULT '0' COMMENT '商品id ',
  `xiaoshouid` int(10) NOT NULL DEFAULT '0' COMMENT '卖家id',
  `ordertime` int(11) NOT NULL DEFAULT '0' COMMENT '订单提交时间',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '状态:0是，1是付款，2是发货，3是已完成',
  `numbers` int(11) NOT NULL COMMENT '单号',
  `telphone` varchar(25) NOT NULL COMMENT '收货人电话',
  `shouname` varchar(25) NOT NULL COMMENT '收货人姓名',
  `goumaiid` int(10) NOT NULL DEFAULT '0' COMMENT '购买者id',
  `sale_id` int(10) NOT NULL DEFAULT '0' COMMENT '拍卖商品的ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `sale_id` int(11) DEFAULT '0' COMMENT '拍卖品id',
  `goods_id` int(10) DEFAULT '0' COMMENT '商品ID',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拍卖商品id',
  `p_id` int(10) DEFAULT NULL COMMENT '分类id',
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `b_id` int(11) DEFAULT '0' COMMENT '买家id',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '拍卖标题',
  `dprice` int(11) DEFAULT NULL COMMENT '拍卖价格',
  `keyword` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '拍卖摘要',
  `stime` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '拍卖开始时间',
  `ltime` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '拍卖结束时间',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '0，1为填写收货信息；2为已发货；3为已完成；4为拍卖结束',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shenqing`
--

CREATE TABLE IF NOT EXISTS `shenqing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fish_id` int(10) DEFAULT NULL COMMENT '要申请的鱼塘ID',
  `user_id` int(10) DEFAULT NULL COMMENT '发起申请的用户ID',
  `status` int(10) DEFAULT '0' COMMENT '申请的状态，是否通过 0 为未通过 1为通过',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `fish_name` varchar(255) DEFAULT NULL COMMENT '要申请的塘的名称',
  `user_name` varchar(255) DEFAULT NULL COMMENT '要申请的用户名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shou_address`
--

CREATE TABLE IF NOT EXISTS `shou_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `shou_address` varchar(255) NOT NULL,
  `regdate` int(10) NOT NULL,
  `zhuxuan` tinyint(1) NOT NULL COMMENT '主选否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `talk_goods`
--

CREATE TABLE IF NOT EXISTS `talk_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品评论id',
  `uid` int(10) NOT NULL COMMENT '用户id',
  `rtime` int(10) NOT NULL COMMENT '评论时间戳',
  `content` text NOT NULL COMMENT '评论内容',
  `lays` tinyint(3) NOT NULL DEFAULT '1' COMMENT '层级',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示0屏蔽',
  `fatherid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `productid` int(10) NOT NULL COMMENT '商品ID',
  `uname` varchar(50) NOT NULL COMMENT '用户名（冗余）',
  `upic` varchar(60) NOT NULL COMMENT '用户头像（冗余）',
  `productname` varchar(60) NOT NULL COMMENT '商品名',
  `funame` varchar(50) NOT NULL DEFAULT '' COMMENT '冗余父级用户名',
  `fuid` int(10) NOT NULL DEFAULT '0' COMMENT '父级用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tongzhi`
--

CREATE TABLE IF NOT EXISTS `tongzhi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `f_id` int(11) DEFAULT '0' COMMENT '发送者ID',
  `s_id` int(10) DEFAULT '0' COMMENT '接受者ID',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `regdate` int(11) DEFAULT NULL COMMENT '信息时间',
  `dufou` int(10) DEFAULT '0' COMMENT '读否',
  `f_name` varchar(255) DEFAULT NULL,
  `s_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '0',
  `auth` int(11) NOT NULL DEFAULT '1',
  `created_at` int(255) NOT NULL DEFAULT '0',
  `update_at` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '手机号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth`, `created_at`, `update_at`, `email`, `pic`, `phone`) VALUES
(31, 'ceshi1', '$2y$10$SlNASHUFVS/CCvpxn7/aUOoje87jVXFLA39ym7mWOwXQG1t1jn9Ya', 1, 0, 1490446352, '858748808@qq.com', 'default.jpg', '17713277770'),
(32, 'admins', '$2y$10$SlNASHUFVS/CCvpxn7/aUOoje87jVXFLA39ym7mWOwXQG1t1jn9Ya', 4, 1490258515, 0, '858748808@qq.com', 'default.jpg', '17713277770');

-- --------------------------------------------------------

--
-- 表的结构 `userdetails`
--

CREATE TABLE IF NOT EXISTS `userdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户详情表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `sex` int(11) NOT NULL DEFAULT '2' COMMENT '用户性别',
  `uname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户昵称',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '居住地址',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `userdetails`
--

INSERT INTO `userdetails` (`id`, `uid`, `sex`, `uname`, `address`, `score`) VALUES
(1, 31, 2, '', '', 0),
(2, 32, 2, '', '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

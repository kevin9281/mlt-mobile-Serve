-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-12-19 03:27:28
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET NAMES UTF8;
DROP DATABASE IF EXISTS manluotuo;
CREATE DATABASE manluotuo CHARSET=UTF8;
USE manluotuo;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manluotuo`
--

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `iid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`iid`, `uid`, `pid`, `count`, `is_checked`) VALUES
(72, 74, 1, 2, 0),
(74, 1, 1, 1, 0),
(75, 1, 2, 1, 0),
(76, 74, 2, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `family_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `oldprice` decimal(10,2) DEFAULT NULL,
  `brand` varchar(64) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `goodPic` varchar(256) DEFAULT NULL,
  `detailPic` mediumtext,
  `indexPic` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`pid`, `family_id`, `title`, `price`, `oldprice`, `brand`, `stock`, `type`, `goodPic`, `detailPic`, `indexPic`) VALUES
(1, 1, '漫骆驼官方出品 少司命手办-《秦时明月》十周年纪念版手办 myethos 正版', '628.00', '628.00', 'myethos', 20, '现货628', 'http://127.0.0.1:3000/img/good-detail/01-1-big.jpg http://127.0.0.1:3000/img/good-detail/01-2-big.jpg http://127.0.0.1:3000/img/good-detail/01-3-big.jpg', 'http://127.0.0.1:3000/img/good-detail/01-detail-0.jpg http://127.0.0.1:3000/img/good-detail/01-detail-1.jpg http://127.0.0.1:3000/img/good-detail/01-detail-2.jpg http://127.0.0.1:3000/img/good-detail/01-detail-3.jpg http://127.0.0.1:3000/img/good-detail/01-detail-4.jpg http://127.0.0.1:3000/img/good-detail/01-detail-5.jpg http://127.0.0.1:3000/img/good-detail/01-detail-6.jpg http://127.0.0.1:3000/img/good-detail/01-detail-7.jpg http://127.0.0.1:3000/img/good-detail/01-detail-8.jpg http://127.0.0.1:3000/img/good-detail/01-detail-9.jpg', 'http://127.0.0.1:3000/img/product/pro1.jpg'),
(2, 2, '城户丈哥玛兽MegaHouse手办-《数码宝贝》Megahouse G.E.M 数码宝贝大冒险', '179.00', '399.00', '数码宝贝', 10, '现货179', 'http://127.0.0.1:3000/img/good-detail/02-1-big.jpg http://127.0.0.1:3000/img/good-detail/02-2-big.jpg http://127.0.0.1:3000/img/good-detail/02-3-big.jpg', 'http://127.0.0.1:3000/img/good-detail/02-detail-1.jpg http://127.0.0.1:3000/img/good-detail/02-detail-2.jpg http://127.0.0.1:3000/img/good-detail/02-detail-3.jpg http://127.0.0.1:3000/img/good-detail/02-detail-4.jpg http://127.0.0.1:3000/img/good-detail/02-detail-5.jpg http://127.0.0.1:3000/img/good-detail/02-detail-6.jpg http://127.0.0.1:3000/img/good-detail/02-detail-6.jpg http://127.0.0.1:3000/img/good-detail/02-detail-6.jpg http://127.0.0.1:3000/img/good-detail/02-detail-7.jpg http://127.0.0.1:3000/img/good-detail/02-detail-8.jpg', 'http://127.0.0.1:3000/img/product/pro2.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `xz_user`
--

CREATE TABLE `xz_user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xz_user`
--

INSERT INTO `xz_user` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`) VALUES
(1, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', 1),
(2, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', 1),
(3, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', 1),
(4, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', 0),
(74, 'lyyolyy', '2655814', '', '', NULL, '', 0),
(75, 'lyyolyy1', '2655814', '', '', NULL, '', 0),
(76, 'lyyolyy2', '123456', '1158781344@qq.com', '2655814', NULL, '丁伟20', 2),
(77, 'lyyolyy5', '123456', '', '', NULL, '', 1),
(78, '问问', '123456', '', '', NULL, '', 1),
(79, 'lyyolyy3', '123456', '1158781344@qq.com', NULL, NULL, NULL, 0),
(80, 'lyyolyy4', '123456', 'ding@qq.com', NULL, NULL, NULL, 0),
(81, 'lyyolyy123', '123456', '1158781344@qq.com', NULL, NULL, NULL, 0),
(82, 'hususu', '123456', 'dang@qq.com', NULL, NULL, NULL, 0),
(83, 'lyyolyy22', '123456', '1158781344@qq.com', NULL, NULL, NULL, 0),
(84, 'lyyolyy33', '123456', 'ding@qq.com', NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `xz_user`
--
ALTER TABLE `xz_user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `xz_user`
--
ALTER TABLE `xz_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--创建表的结构 `home`
# DECIMAL 高精度浮点数

CREATE TABLE home(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title  VARCHAR(255),
  img_url  VARCHAR(255),
  price DECIMAL(15,2),
  oldprice   DECIMAL(15,2),
  brand VARCHAR(255)
);

--插入数据
INSERT INTO home VALUES(null,'园田海未OP装良笑社粘土人510-《Love Live》良笑社 No.510 Q版粘土人','http://127.0.0.1:3000/product/home1.jpg',175,210,'Good Smile Company No.510'),
(null,'站立版Saber新娘版SEGA景品-《Fate Extra CCC》 SEGA 景品手办','http://127.0.0.1:3000/product/home2.jpg',95,0,'良笑社 Fare Extra CCC 新娘Ver.'),
(null,'皮卡丘眼镜厂挂件-《口袋妖怪》眼镜厂 毛绒钥匙挂件特价（随机发货）','http://127.0.0.1:3000/product/home3.jpg',11,13.2,'眼镜厂 毛绒钥匙挂件'),
(null,'双叶杏景品-《偶像大师》眼镜厂 SQ系列 景品手办','http://127.0.0.1:3000/product/home4.jpg',75,90,'眼镜厂 SQ景品 Candy Island'),
(null,'定春长款钱包-《银魂》 万事屋吉祥物 正版拉链钱包 现货','http://127.0.0.1:3000/product/home5.jpg',22,26.4,'漫能 万事屋吉祥物');

CREATE TABLE login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd VARCHAR(32),
  email VARCHAR(50) check (email like '%@%'),
  level VARCHAR(32) DEFAULT NULL,
  integral VARCHAR(32) DEFAULT NULL
);
INSERT INTO login VALUES
(null,'dingding',md5('123456'),'121282320@qq.com','注册用户','30'),
(null,'dangdang',md5('654321'),'121282321@qq.com','金卡用户','9999');
#md5密码加密 理解:用户输入123对 用户密码的内容加密


CREATE TABLE Category_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT(11) DEFAULT NULL,
  title VARCHAR(128) DEFAULT NULL,
  price DECIMAL(10,2) DEFAULT NULL,
  oldprice DECIMAL(10,2) DEFAULT NULL,
  brand VARCHAR(64) DEFAULT NULL,
  stock VARCHAR(32) DEFAULT NULL,
  categoryPic VARCHAR(256) DEFAULT NULL,
  goodsPic VARCHAR(256) DEFAULT NULL
);

INSERT INTO Category_product VALUES
(null,1,'苏九儿手办-《妖怪名单》特典版 Myethos 正版',570,0,'myethos','暂时缺货','http://127.0.0.1:3000/scr/1.jpg','http://127.0.0.1:3000/scr/111.jpg http://127.0.0.1:3000/scr/112.jpg'),
(null,2,'myethos 希尔手办-《崩坏学园2》 1/8 普通版 正版 预售',648,0,'myethos','暂时缺货','http://127.0.0.1:3000/scr/2.jpg','http://127.0.0.1:3000/scr/211.jpg http://127.0.0.1:3000/scr/212.jpg'),
(null,3,'漫骆驼官方出品 少司命手办-《秦时明月》十周年纪念版手办 myethos 正版',624,628,'myethos','暂时缺货','http://127.0.0.1:3000/scr/3.jpg','http://127.0.0.1:3000/scr/311.jpg http://127.0.0.1:3000/scr/312.jpg'),
(null,4,'【特价】雪之下雪乃 和服 Ver-《我的青春恋爱物语果然有问题。》雪之下雪乃 和服 Ver代理版 预售',832,0,'<<我的青春恋爱物语果然有问题.>>','暂时缺货','http://127.0.0.1:3000/scr/4.jpg','http://127.0.0.1:3000/scr/411.jpg http://127.0.0.1:3000/scr/412.jpg'),
(null,5,'【特价】figma 敌法师(带封内特典)-《DOTA2》figma 敌法师(带封内特典)代理版 预售',461,0,'DOTA2','暂时缺货','http://127.0.0.1:3000/scr/5.jpg','http://127.0.0.1:3000/scr/511.jpg http://127.0.0.1:3000/scr/512.jpg'),
(null,6,'【特价】粘土人 米拉娜(带封内特典)-《DOTA2》粘土人 米拉娜(带封内特典)代理版 预售',283,0,'DOTA2','暂时缺货','http://127.0.0.1:3000/scr/6.jpg','http://127.0.0.1:3000/scr/611.jpg http://127.0.0.1:3000/scr/612.jpg'),
(null,7,'【特价】粘土人 龙骑士(带封内特典)-《DOTA2》粘土人 龙骑士代理版 预售',283,0,'DOTA2','暂时缺货','http://127.0.0.1:3000/scr/7.jpg','http://127.0.0.1:3000/scr/711.jpg http://127.0.0.1:3000/scr/712.jpg'),
(null,8,'【特价】粘土人 战栗的龙卷-《一拳超人》粘土人 战栗的龙卷 代理版 预售',309,0,'一拳超人','暂时缺货','http://127.0.0.1:3000/scr/8.jpg','http://127.0.0.1:3000/scr/811.jpg http://127.0.0.1:3000/scr/812.jpg'),
(null,9,'【特价】粘土人 Archer Super Movable Edition(再販)预售',243,0,'Fate stay night','暂时缺货','http://127.0.0.1:3000/scr/9.jpg','http://127.0.0.1:3000/scr/911.jpg http://127.0.0.1:3000/scr/912.jpg'),
(null,10,'TAKARA TOMY MP33 火地狱-《变形金刚》 消防车 大师级 3C 正版模型 代理版 预售','待定',0,'变形金刚','暂时缺货','http://127.0.0.1:3000/scr/10.jpg','http://127.0.0.1:3000/scr/1111.jpg http://127.0.0.1:3000/scr/1112.jpg'),
(null,11,'联盟款T恤-《魔兽世界》 2016夏季新款男装 全款预售 6月初发货 正版T恤 预售',129,129,'魔兽世界','暂时缺货','http://127.0.0.1:3000/scr/11.jpg','http://127.0.0.1:3000/scr/11.jpg http://127.0.0.1:3000/scr/1222.jpg'),
(null,12,'部落款T恤-《魔兽世界》 2016夏季新款男装 全款预售 6月初发货 正版T恤 预售',129,129,'魔兽世界','暂时缺货','http://127.0.0.1:3000/scr/12.jpg','http://127.0.0.1:3000/scr/12.jpg http://127.0.0.1:3000/scr/1322.jpg'),
(null,13,'万代 宇智波鼬 人偶-《火影忍者》魂限定 SHF 疾风传 佐助VS鼬 正版人偶',419,419,'火隐忍者','暂时缺货','http://127.0.0.1:3000/scr/13.jpg','http://127.0.0.1:3000/scr/13.jpg http://127.0.0.1:3000/scr/13.jpg'),
(null,14,'TAKARA TOMY IDW LG_31 巨无霸福特-《变形金刚》 泰坦级 正版模型 日版 预售','待定',0,'变形金刚','暂时缺货','http://127.0.0.1:3000/scr/14.jpg','http://127.0.0.1:3000/scr/14.jpg http://127.0.0.1:3000/scr/14.jpg'),
(null,15,'Alter 绀菊 手办-《胧村正》 妖刀传 正版手办 再版 现货',758,710,'胧村正','暂时缺货','http://127.0.0.1:3000/scr/15.jpg','http://127.0.0.1:3000/scr/15.jpg http://127.0.0.1:3000/scr/15.jpg')

CREATE TABLE Catproduct(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT(11) DEFAULT NULL,
  title VARCHAR(128) DEFAULT NULL,
  price DECIMAL(10,2) DEFAULT NULL,
  oldprice DECIMAL(10,2) DEFAULT NULL,
  brand VARCHAR(64) DEFAULT NULL,
  stock VARCHAR(32) DEFAULT NULL,
  categoryPic VARCHAR(256) DEFAULT NULL,
  goodsPic VARCHAR(256) DEFAULT NULL,
  cartPic VARCHAR(256) DEFAULT NULL
);

INSERT INTO Catproduct VALUES
(null,1,'园田海未OP装良笑社粘土人510-《Love Live》良笑社 No.510 Q版粘土人',175,210,'Love Live','暂时缺货','http://127.0.0.1:3000/xq/1.jpg http://127.0.0.1:3000/xq/12.jpg http://127.0.0.1:3000/xq/13.jpg','http://127.0.0.1:3000/xq/14.jpg http://127.0.0.1:3000/xq/15.jpg http://127.0.0.1:3000/xq/16.jpg http://127.0.0.1:3000/xq/19.jpg','http://127.0.0.1:3000/xq/1.jpg'),
(null,2,'站立版Saber新娘版SEGA景品-《Fate Extra CCC》 SEGA 景品手办',95,0,'Fate stay night','暂时缺货','http://127.0.0.1:3000/xq/2.jpg http://127.0.0.1:3000/xq/21.jpg http://127.0.0.1:3000/xq/21.jpg','http://127.0.0.1:3000/xq/22.jpg http://127.0.0.1:3000/xq/23.jpg http://127.0.0.1:3000/xq/24.jpg http://127.0.0.1:3000/xq/30.jpg','http://127.0.0.1:3000/xq/2.jpg'),
(null,3,'皮卡丘眼镜厂挂件-《口袋妖怪》眼镜厂 毛绒钥匙挂件特价（随机发货）',11,13.2,'口袋妖怪','暂时缺货','http://127.0.0.1:3000/xq/pkq.jpg http://127.0.0.1:3000/xq/pkq.jpg http://127.0.0.1:3000/xq/pkq.jpg','http://127.0.0.1:3000/xq/pkqxq1.jpg http://127.0.0.1:3000/xq/pkqxq2.jpg http://127.0.0.1:3000/xq/pkqxq3.jpg http://127.0.0.1:3000/xq/pkqxq4.jpg','http://127.0.0.1:3000/xq/pkq.jpg'),
(null,4,'双叶杏景品-《偶像大师》眼镜厂 SQ系列 景品手办',75,90,'偶像大师','暂时缺货','http://127.0.0.1:3000/xq/3.jpg http://127.0.0.1:3000/xq/3.jpg http://127.0.0.1:3000/xq/3.jpg','http://127.0.0.1:3000/xq/6.jpg http://127.0.0.1:3000/xq/61.jpg http://127.0.0.1:3000/xq/62.jpg http://127.0.0.1:3000/xq/63.jpg','http://127.0.0.1:3000/xq/3.jpg' ),
(null,5,'定春长款钱包-《银魂》 万事屋吉祥物 正版拉链钱包 现货',22,26.4,'银魂','暂时缺货','http://127.0.0.1:3000/xq/4.jpg http://127.0.0.1:3000/xq/4.jpg http://127.0.0.1:3000/xq/4.jpg','http://127.0.0.1:3000/xq/9.jpg http://127.0.0.1:3000/xq/91.jpg http://127.0.0.1:3000/xq/92.jpg http://127.0.0.1:3000/xq/93.jpg','http://127.0.0.1:3000/xq/4.jpg')

CREATE TABLE mlt_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  count INT,
  price DECIMAL(10,2),
  pid INT,
  uid INT
);
INSERT INTO mlt_cart VALUES
()



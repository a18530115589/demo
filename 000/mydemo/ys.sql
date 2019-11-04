-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-10-26 10:22:24
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


DROP  DATABASE  IF  EXISTS  ys;
CREATE  DATABASE  ys;
USE  ys;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ys`
--

-- --------------------------------------------------------

--
-- 表的结构 `ys_binqin`
--

CREATE TABLE `ys_binqin` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `yid` int(11) DEFAULT NULL,
  `jbname` varchar(128) DEFAULT NULL,
  `ggn` varchar(25) DEFAULT NULL,
  `sgn` varchar(25) DEFAULT NULL,
  `gms` varchar(25) DEFAULT NULL,
  `syjh` varchar(25) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_binqin`
--

INSERT INTO `ys_binqin` (`id`, `uid`, `yid`, `jbname`, `ggn`, `sgn`, `gms`, `syjh`, `pic`) VALUES
(1, 1, 1, '高血压', '异常', '异常', '异常', '无', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ys_chufang`
--

CREATE TABLE `ys_chufang` (
  `id` int(11) NOT NULL,
  `jieguo` varchar(25) DEFAULT NULL,
  `yao` varchar(128) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `yid` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `yname` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_chufang`
--

INSERT INTO `ys_chufang` (`id`, `jieguo`, `yao`, `uid`, `yid`, `time`, `yname`) VALUES
(1, '高血压', '俯仰角颗粒 优赛明 维生素', 1, 1, NULL, '张琴倍');

-- --------------------------------------------------------

--
-- 表的结构 `ys_family`
--

CREATE TABLE `ys_family` (
  `lid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` char(25) DEFAULT NULL,
  `sfz` char(25) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `iphone` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_family`
--

INSERT INTO `ys_family` (`lid`, `uid`, `uname`, `sfz`, `gender`, `age`, `iphone`) VALUES
(1, 1, '李明明', '335248199711205611', 1, 23, '12345678910');

-- --------------------------------------------------------

--
-- 表的结构 `ys_login`
--

CREATE TABLE `ys_login` (
  `lid` int(11) NOT NULL,
  `uname` char(25) DEFAULT NULL,
  `upwd` char(25) DEFAULT NULL,
  `iphone` varchar(16) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_login`
--

INSERT INTO `ys_login` (`lid`, `uname`, `upwd`, `iphone`, `uid`) VALUES
(1, 'hahah', '123456', '12345678910', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ys_pj`
--

CREATE TABLE `ys_pj` (
  `id` int(11) NOT NULL,
  `yid` int(11) DEFAULT NULL,
  `uname` varchar(25) DEFAULT NULL,
  `ptime` date DEFAULT NULL,
  `pingjia` varchar(128) DEFAULT NULL,
  `xinxin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_pj`
--

INSERT INTO `ys_pj` (`id`, `yid`, `uname`, `ptime`, `pingjia`, `xinxin`) VALUES
(1, 1, '李明明', NULL, '医术高超', 5);

-- --------------------------------------------------------

--
-- 表的结构 `ys_qindan`
--

CREATE TABLE `ys_qindan` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `shuomin` varchar(128) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `ml` int(11) DEFAULT NULL,
  `yaoname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ys_user`
--

CREATE TABLE `ys_user` (
  `lid` int(11) NOT NULL,
  `uname` varchar(25) DEFAULT NULL,
  `upwd` varchar(130) DEFAULT NULL,
  `iphone` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_user`
--

INSERT INTO `ys_user` (`lid`, `uname`, `upwd`, `iphone`) VALUES
(1, '\"hahah\"', '123456', '18257172577'),
(2, '李明明', '123456', '110'),
(3, '用户7082568', 'e10adc3949ba59abbe56e057f', '123456'),
(4, '用户8386409', 'e10adc3949ba59abbe56e057f', '123456'),
(5, '用户8635909', 'b59c67bf196a4758191e42f76670ceba', '1111');

-- --------------------------------------------------------

--
-- 表的结构 `ys_yao`
--

CREATE TABLE `ys_yao` (
  `id` int(11) NOT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `yaoname` varchar(50) DEFAULT NULL,
  `ml` int(11) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `shuomin` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_yao`
--

INSERT INTO `ys_yao` (`id`, `pic`, `yaoname`, `ml`, `price`, `count`, `shuomin`) VALUES
(1, NULL, '优赛明 维生素E乳', 85, '25.00', 1, '咀嚼服用，三个小时一次'),
(2, NULL, '优赛明 维生素c乳', 85, '28.00', 1, '一日三次'),
(3, '', '泰诺', 1, '55.00', 50, '睡前服用'),
(4, NULL, '止咳糖浆', 85, '30.00', 20, '口服 一日三次');

-- --------------------------------------------------------

--
-- 表的结构 `ys_yiyuan`
--

CREATE TABLE `ys_yiyuan` (
  `id` int(11) NOT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `yyname` varchar(30) DEFAULT NULL,
  `dengji` varchar(30) DEFAULT NULL,
  `leixing` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_yiyuan`
--

INSERT INTO `ys_yiyuan` (`id`, `pic`, `yyname`, `dengji`, `leixing`) VALUES
(1, NULL, '北京协和医院', '三级甲等', '综合医院'),
(2, NULL, '北京第一人民医院', '三级甲等', '综合医院'),
(3, NULL, '杭州第一人民医院', '三级甲等', '综合医院'),
(4, NULL, '广州第一人民医院', '三级甲等', '综合医院'),
(5, NULL, '南京第一人民医院', '三级甲等', '综合医院'),
(6, NULL, '上海第一人民医院', '三级甲等', '综合医院'),
(7, NULL, '广州第一人民医院', '三级甲等', '综合医院'),
(8, NULL, '湖北第一人民医院', '三级甲等', '综合医院');

-- --------------------------------------------------------

--
-- 表的结构 `ys_ysxx`
--

CREATE TABLE `ys_ysxx` (
  `id` int(11) NOT NULL,
  `yid` int(11) DEFAULT NULL,
  `yname` varchar(25) DEFAULT NULL,
  `Hpname` varchar(25) DEFAULT NULL,
  `post` varchar(25) DEFAULT NULL,
  `goood` varchar(128) DEFAULT NULL,
  `keshi` varchar(25) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `experience` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_ysxx`
--

INSERT INTO `ys_ysxx` (`id`, `yid`, `yname`, `Hpname`, `post`, `goood`, `keshi`, `pic`, `intro`, `experience`) VALUES
(1, 1, '张琴倍', '北京协和医院', '副主任医师', '感冒 小儿支气管哮喘 小儿感冒 鼻炎', '儿科', NULL, '医学博士。毕业于北京大学八年制本博连读专业。国际脊柱内固定学会（AOSpine）会员。主要擅长脊柱外科微创手术治疗。', '医学博士。毕业于北京大学八年制本博连读专业。国际脊柱内固定学会（AOSpine）会员。主要擅长脊柱外科微创手术治疗');

-- --------------------------------------------------------

--
-- 表的结构 `ys_zhishi`
--

CREATE TABLE `ys_zhishi` (
  `id` int(11) NOT NULL,
  `yid` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `body` varchar(256) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ys_zhishi`
--

INSERT INTO `ys_zhishi` (`id`, `yid`, `title`, `body`, `pic`) VALUES
(1, 1, '\r\n夏天不能光脚丫、不能吃冰激凌？别用养生折腾孩子了', '看到孩子不穿袜子，光脚在地板上踩，就说会着凉，要穿袜子。也有不少爷爷奶奶一到夏天就想给宝宝们剃光头，美其名曰散热好，不怕长痱子，这有道理吗？老人们还会担心孩子夏天拉肚子，看到孩子吃冰激凌就冲上去夺过来。老人的执着有道理吗？我们来详细聊一聊。', NULL),
(2, 1, '风湿性疾病', '风湿病是一组侵犯关节、骨骼、肌肉、血管及有关软组织或结缔组织为主的疾病，其中多数为自身免疫性疾病。发病多较隐蔽而缓慢，病程较长，且大多具有遗传倾向。 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关；对非甾类抗炎药(NSAID)，糖皮质激素和免疫抑制剂有较好的短期或长期的缓解性反应。', NULL),
(3, 1, '高血压', '高血压（hypertension）是指以体循环动脉血压（收缩压和/或舒张压）增高为主要特征（收缩压≥140毫米汞柱，舒张压≥90毫米汞柱），可伴有心、脑、肾等器官的功能或器质性损害的临床综合征。高血压是最常见的慢性病，也是心脑血管病最主要的危险因素。正常人的血压随内外环境变化在一定范围内波动。在整体人群，血压水平随年龄逐渐升高，以收缩压更为明显，但50岁后舒张压呈现下降趋势，脉压也随之加大。 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关。', NULL),
(4, 1, '小儿感冒', '小儿急性上呼吸道感染系由各种病原引起的上呼吸道炎症，简称上感，俗称“感冒”，是小儿最常见的疾病。该病主要侵犯鼻、鼻咽和咽部，如上呼吸道某一局部炎症特别突出，即按该炎症处命名，如急性鼻炎、急性咽炎 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关；对非甾类抗炎药(NSAID)，糖皮质激素和免疫抑制剂有较好的短期或长期的缓解性反应。', NULL),
(5, 2, '高血压', '高血压（hypertension）是指以体循环动脉血压（收缩压和/或舒张压）增高为主要特征（收缩压≥140毫米汞柱，舒张压≥90毫米汞柱），可伴有心、脑、肾等器官的功能或器质性损害的临床综合征。高血压是最常见的慢性病，也是心脑血管病最主要的危险因素。正常人的血压随内外环境变化在一定范围内波动。在整体人群，血压水平随年龄逐渐升高，以收缩压更为明显，但50岁后舒张压呈现下降趋势，脉压也随之加大。 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关。', NULL),
(6, 1, '小儿感冒', '小儿急性上呼吸道感染系由各种病原引起的上呼吸道炎症，简称上感，俗称“感冒”，是小儿最常见的疾病。该病主要侵犯鼻、鼻咽和咽部，如上呼吸道某一局部炎症特别突出，即按该炎症处命名，如急性鼻炎、急性咽炎 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关；对非甾类抗炎药(NSAID)，糖皮质激素和免疫抑制剂有较好的短期或长期的缓解性反应。', NULL),
(7, 2, '高血压', '高血压（hypertension）是指以体循环动脉血压（收缩压和/或舒张压）增高为主要特征（收缩压≥140毫米汞柱，舒张压≥90毫米汞柱），可伴有心、脑、肾等器官的功能或器质性损害的临床综合征。高血压是最常见的慢性病，也是心脑血管病最主要的危险因素。正常人的血压随内外环境变化在一定范围内波动。在整体人群，血压水平随年龄逐渐升高，以收缩压更为明显，但50岁后舒张压呈现下降趋势，脉压也随之加大。 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关。', NULL),
(8, 3, '小儿感冒', '小儿急性上呼吸道感染系由各种病原引起的上呼吸道炎症，简称上感，俗称“感冒”，是小儿最常见的疾病。该病主要侵犯鼻、鼻咽和咽部，如上呼吸道某一局部炎症特别突出，即按该炎症处命名，如急性鼻炎、急性咽炎 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关；对非甾类抗炎药(NSAID)，糖皮质激素和免疫抑制剂有较好的短期或长期的缓解性反应。', NULL),
(9, 2, '高血压', '高血压（hypertension）是指以体循环动脉血压（收缩压和/或舒张压）增高为主要特征（收缩压≥140毫米汞柱，舒张压≥90毫米汞柱），可伴有心、脑、肾等器官的功能或器质性损害的临床综合征。高血压是最常见的慢性病，也是心脑血管病最主要的危险因素。正常人的血压随内外环境变化在一定范围内波动。在整体人群，血压水平随年龄逐渐升高，以收缩压更为明显，但50岁后舒张压呈现下降趋势，脉压也随之加大。 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关。', NULL),
(10, 3, '小儿感冒', '小儿急性上呼吸道感染系由各种病原引起的上呼吸道炎症，简称上感，俗称“感冒”，是小儿最常见的疾病。该病主要侵犯鼻、鼻咽和咽部，如上呼吸道某一局部炎症特别突出，即按该炎症处命名，如急性鼻炎、急性咽炎 诊断及治疗均有一定难度；血液中多可检查出不同的自身抗体，可能与不同HLA亚型有关；对非甾类抗炎药(NSAID)，糖皮质激素和免疫抑制剂有较好的短期或长期的缓解性反应。', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ys_binqin`
--
ALTER TABLE `ys_binqin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ys_chufang`
--
ALTER TABLE `ys_chufang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ys_family`
--
ALTER TABLE `ys_family`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `ys_login`
--
ALTER TABLE `ys_login`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `ys_pj`
--
ALTER TABLE `ys_pj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yid` (`yid`);

--
-- Indexes for table `ys_qindan`
--
ALTER TABLE `ys_qindan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ys_user`
--
ALTER TABLE `ys_user`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `ys_yao`
--
ALTER TABLE `ys_yao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ys_yiyuan`
--
ALTER TABLE `ys_yiyuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ys_ysxx`
--
ALTER TABLE `ys_ysxx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ys_zhishi`
--
ALTER TABLE `ys_zhishi`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ys_binqin`
--
ALTER TABLE `ys_binqin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ys_chufang`
--
ALTER TABLE `ys_chufang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ys_family`
--
ALTER TABLE `ys_family`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ys_login`
--
ALTER TABLE `ys_login`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ys_pj`
--
ALTER TABLE `ys_pj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ys_qindan`
--
ALTER TABLE `ys_qindan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ys_user`
--
ALTER TABLE `ys_user`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ys_yao`
--
ALTER TABLE `ys_yao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `ys_yiyuan`
--
ALTER TABLE `ys_yiyuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `ys_ysxx`
--
ALTER TABLE `ys_ysxx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ys_zhishi`
--
ALTER TABLE `ys_zhishi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

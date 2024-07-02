/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.37 : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `blog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `remark` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `article` */

insert  into `article`(`id`,`title`,`remark`,`content`,`user`,`time`) values (1,'斯巴达克起义',1,'在斯巴达克的领导下，罗马共和国爆发最大的一次奴隶起义。这次起义是古罗马帝国最大的一次起义，也是古代社会大规模奴隶反抗事件，在世界历史上具有重要意义。元老院宣布国家进入紧急状态，最后选任大奴隶主克拉苏统率大军，镇压起义军。公元前72年秋，斯巴达克的军队在意大利布鲁提亚半岛(今卡拉布里亚)集结，预计乘基利基海盗船渡过墨西拿海峡。但海盗不守信用，没有提供船只，在罗马军队的疯狂围攻下，6万名起义者战死，斯巴达克也壮烈牺牲。','1','2024-04-23'),(2,'极光',2,'极光（Aurora），是一种绚丽多彩的等离子体现象，其发生是由于太阳带电粒子流（太阳风）进入地球磁场，在地球南北两极附近地区的高空，夜间出现的灿烂美丽的光辉。在南极被称为南极光，在北极被称为北极光。地球的极光是来自地球磁层或太阳的高能带电粒子流（太阳风）使高层大气分子或原子激发（或电离）而产生。','1','2021-06-05'),(3,'《骆驼祥子》读后感',6,'我想现在堕落的祥子死了倒是一种解脱!这怨不得他自己，怨不得那些质朴的人们啊。挫折，善者也。它不仅能够磨练人的意志也能使人变得更加坚强。祥子在挫败中一次又一次抬起头，也许这次的失败过后，他还记得要爬起继续去走前方的路。但是老北京的社会——黑暗的，这怎能叫那些原本的善良的人们不发出像祥子一样的呐喊“我招谁惹谁了?!”体面的，要强的，好梦想的，利己的，个人的，健壮的，伟大的，祥子不知陪着人家送了多少回殡;不知道何时何地会埋起他自己来，埋起这堕落的，自私的，不幸的，社会病胎里的产儿，个人主义的末路鬼。','1','2024-06-05'),(4,'第一次十字军东征',1,'1096年至1099年间由西方基督教世界所发起，旨在收复在穆斯林的征服中被占领的累范特圣地的一项军事行动，最终以1099年十字军攻陷耶路撒冷收尾。1095年，教宗乌尔班二世最初为了应拜占庭皇帝阿历克塞一世的求援，而号召西方志愿军前往拜占庭帝国抵御塞尔柱人从安纳托利亚而来的入侵。后来，东征的目的逐渐演变为夺回圣地及耶路撒冷城，并将东方基督教从伊斯兰的统治者解放出来。','1','2024-03-16'),(5,'第二次世界大战',1,'第二次世界大战（英语：World War II，1931年9月18日/1937年7月7日/1939年9月1日 [259] [266] [277]—1945年9月2日 [60]），简称二战，亦称世界反法西斯战争 [264]，是以中、苏、美、英等同盟国和全世界反法西斯力量反抗德、日、意轴心国侵略的规模空前的全球性战争 [285]。战争范围从欧洲到亚洲，从大西洋到太平洋，先后有61个国家参战，84个国家和地区和约20亿的人口被卷入战争（占当时世界总人口80%以上）','1','2019-06-26'),(6,'坐了卧代二等座',5,'离放假还有两天，才决定去济南，结果低估了买票的难度，前一天候补，第二天早上突然发现有票，不管三七二十一抢了一张，一看是卧代二等座，心想正好体验一下这新奇的座椅。如我所料，二宝果然很喜欢、很兴奋。','1','2024-06-24'),(7,'一举两得——巧摘芹菜叶',5,'昨天妈妈买了一些芹菜，准备中午炒。家里乱糟糟的，妈妈要打扫卫生，因此要我把芹菜叶摘摘，但是我要写作业，没办法帮妈妈。就在这时，我家的老母鸡在院子“咯咯”地叫。我突发奇想：“为何不让老母鸡帮我摘芹菜叶呢？”我把芹菜绑在一根杆子上面，放到外面，为了让它不啄到我们爱吃的茎，我就把芹菜绑高点，让它只能啄到叶，这样既省去了我摘芹菜叶的麻烦，又填饱了老母鸡的肚子，真是一举两得。','6','2023-04-06'),(8,'名著《红楼梦》读后感',6,'寒假里，我读了一本书，叫做《红楼梦》，使我感悟深刻。','3','2022-09-13'),(9,'法外狂徒张三',2,'法外狂徒张三，去嫖娼。见到小姐后，张三问：多少钱？小姐说：3000块钱就OK。张三摇头：闹闹闹，像你这么美貌小女生，3000块钱哪里够？至少5000块！小姐大喜，事后张三掏出5000元钱。小姐接过钱，惊呆了：你这是冥币。……故事讲到这里，罗翔:\"首先，张三是强奸罪吗？这事儿不是强奸，因为小姐答应了张三。这是诈骗罪吗？人家张三给钱了——尽管给的是冥币，但的确是给了，所以不能说是诈骗。那么张三这个事儿，算不算是使用冥币罪？更不能，使用冥币算什么罪呢？就没这个罪名。所以张三同学，没有违法犯罪，就是不道德。','3','2022-11-26'),(10,'《崩坏：星穹铁道》',4,'上海米哈游网络科技股份有限公司自研的银河冒险策略游戏 ，是米哈游“崩坏”系列的第五部作品 。游戏于2021年10月27日-2021年11月1日开启“始发测试”，2022年5月25日-2022年6月15日开启“漫游测试”2023年2月10日-2023年3月24日开启“跃迁测试”，2023年4月26日正式开启全平台公测 .','4','2022-06-06'),(11,'宇宙中物质起源之谜的首个佐证',3,'粒子-反粒子镜像对称性也被称为电荷共轭宇称反演对称(CP对称)。被称为费米子的基本粒子群包括含有电子、缪子、陶子和中微子等基本粒子的轻子。日本T2K中微子合作组研究发现，轻子中存在CP对称性破缺。该破缺难以捕捉观察，但可用中微子来搜索。中微子有三种类别(“味道”)，这取决于其相关的带电轻子(电子、缪子、陶子)，它们可以在传播过程中从一种“味道”转变为另一种“味道”。','5','2018-12-30');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `catename` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `category` */

insert  into `category`(`id`,`catename`) values (1,'历史'),(2,'生活小常识'),(3,'科学'),(4,'游戏'),(5,'日常'),(6,'读后感');

/*Table structure for table `remarks` */

DROP TABLE IF EXISTS `remarks`;

CREATE TABLE `remarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `blog` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `remarks` */

insert  into `remarks`(`id`,`user`,`blog`,`content`,`time`) values (1,'admin','1','斯巴达克斯是一位杰出的军事领袖和反抗者，他领导的斯巴达克斯起义是古代罗马历史上最重要和最著名的奴隶起义之一。','2024-06-27 16:55:55'),(2,'admin','9','社会我张哥,人狠话不多！','2024-06-27 17:00:26'),(3,'lisi','10','米哈游！你是最棒的！','2024-06-27 17:07:39'),(4,'lisi','6','保真','2024-06-27 17:18:59'),(5,'wangwu','3','在《骆驼祥子》中，祥子的形象饱满而立体。他有着强烈的生存欲望，却在现实的打击下逐渐沦为行尸走肉。他的转变，不仅仅是性格的扭曲，更是社会的写照。祥子，一个被时代摧残走向毁灭的普通人，他的故事让人深思。','2024-06-27 18:01:36'),(6,'xiaoniao','5','一场正义的反法西斯战争','2024-06-27 18:13:47'),(7,'xiaoniao','11','科学的尽头是玄学,玄学的尽头是神学','2024-06-27 18:18:29'),(8,'zhangsan','2','美丽外表下的“灾难”','2024-06-27 18:23:09'),(9,'我不是药神','1','斯巴达克 是古希腊的一个城邦吧? 英勇善战','2024-06-27 18:28:43'),(29,'admin','1','1','2024-06-29 10:17:55'),(30,'666','1','原神 启动！','2024-07-01 17:00:10');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `enrollment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`id`,`uid`,`username`,`password`,`enrollment`) values (1,'202478463','admin','admin','2024-6-18'),(3,'2024433831','zhangsan','zhangsan','2024-06-26 20:28:04'),(4,'2024430961','lisi','lisi','2024-06-26 21:30:57'),(5,'2024849801','wangwu','wangwu','2024-06-27 16:13:11'),(6,'2024131762','xiaoniao','xiaoniao','2024-06-26 19:27:39'),(7,'2024113855','我不是药神','123456','2024-06-27 18:25:19'),(29,'2024976851','zhaoliu','zhaoliu','2024-06-29 17:50:12'),(30,'2024111560','叮当猫','123456','2024-06-30 13:13:50'),(31,'2024076278','肖恩','7890123','2024-06-30 14:22:44'),(32,'2024232803','小小将','xxj1','2024-06-30 15:07:02'),(33,'2024402466','赵玉','111','2024-07-01 12:05:10'),(34,'2024731221','666','666','2024-07-01 16:18:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

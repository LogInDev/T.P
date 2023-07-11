/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.33 : Database - mysqlhello
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysqlhello` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysqlhello`;

/*Table structure for table `base` */

DROP TABLE IF EXISTS `base`;

CREATE TABLE `base` (
  `baseId` int NOT NULL AUTO_INCREMENT,
  `baseName` varchar(255) NOT NULL,
  `baseType` varchar(255) NOT NULL,
  PRIMARY KEY (`baseId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `base` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `memberId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fokeingredientId` int DEFAULT NULL,
  `storeId` int DEFAULT NULL,
  `cartCount` int DEFAULT NULL,
  `aextratopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `asource` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `atopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `base` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bextratopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bsource` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `btopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cartImage` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ctopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `dtopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extramain` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `onePrice` int NOT NULL,
  `point` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `setbeverage` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `setside` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `storeAddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `storeName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `totalPoint` int DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `fokeingredientId` (`fokeingredientId`),
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb3;

/*Data for the table `cart` */

insert  into `cart`(`cartId`,`memberId`,`fokeingredientId`,`storeId`,`cartCount`,`aextratopping`,`asource`,`atopping`,`base`,`bextratopping`,`bsource`,`btopping`,`cartImage`,`ctopping`,`dtopping`,`extramain`,`onePrice`,`point`,`price`,`productName`,`setbeverage`,`setside`,`storeAddress`,`storeName`,`total`,`totalPoint`,`totalPrice`) values 
(1,'test',1,2,7,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(2,'admin',2,3,552,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(3,'admin',3,3,7,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(4,'admin',55,12,4,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(5,'admin',56,12,4,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(6,'admin',57,1,5,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(130,'admin@0',150,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(189,'admin@0',213,13,2,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(190,'admin@0',214,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(192,'admin@0',216,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(194,'admin@0',218,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(196,'admin@0',220,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(197,'admin@0',221,52,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(199,'admin@0',223,56,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(200,'admin@0',224,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(211,'dohoon@1',236,13,7,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(220,'dohoon@1',248,13,4,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(227,'dohoon@1',249,13,1,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(228,'dohoon@1',255,13,7,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(233,'dohoon@1',270,13,4,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(234,'dohoon@1',272,13,3,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(326,'kimdohoon96@naver.com',369,67,7,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(328,'kimdohoon96@naver.com',370,52,3,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(332,'kimdohoon96@naver.com',375,13,3,'','','','','','','','','','','',0,0,NULL,NULL,'','','','',NULL,NULL,NULL),
(339,'',0,0,4,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,26000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',4,1300,26000),
(340,'',0,0,5,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,6500,325,32500,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',5,1625,32500),
(341,'',0,0,3,'foke','렌치','파인애플','현미밥 추가',NULL,'스위트 칠리','풋콩','/img/product/product-4.png','렌틸콩','적양파',NULL,7500,375,22500,'단호박 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,1125,22500),
(342,'',0,0,3,'foke','허니머스타드','오이','현미밥 추가',NULL,'스위트 칠리','병아리콩','/img/product/product-6.png','콘샐러드','날치알',NULL,7500,375,22500,'두부 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,1125,22500),
(344,'',0,0,2,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,13000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,650,13000),
(345,'',0,0,2,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,13000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,650,13000),
(346,'',0,0,2,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,6500,325,13000,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,650,13000),
(347,'',0,0,2,'foke','렌치','파인애플','현미밥 추가',NULL,'스위트 칠리','풋콩','/img/product/product-4.png','렌틸콩','적양파',NULL,7500,375,15000,'단호박 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,750,15000),
(348,'',0,0,2,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-2.png','날치알','레디쉬',NULL,8000,400,16000,'포케 샐러드',NULL,NULL,'서울 종로구 종로 263-1 (종로6가)','동대문역',2,800,16000),
(349,'',0,0,2,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,13000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,650,13000),
(350,'',0,0,2,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,6500,325,13000,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,650,13000),
(351,'',0,0,1,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,9000,450,9000,'탄단지 샐러드','제로콜라','버섯 스프','서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',1,450,9000),
(352,'',0,0,3,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-2.png','날치알','레디쉬',NULL,8000,400,24000,'포케 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',3,1200,24000),
(353,'',0,0,3,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-1.png','날치알','레디쉬',NULL,7000,350,21000,'닭고기 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',3,1050,21000),
(354,'',0,0,3,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-1.png','날치알','레디쉬',NULL,7000,350,21000,'닭고기 샐러드',NULL,NULL,'부산 영도구 태종로 107 (영선동1가, 영도오션트라움)','부산영도',3,1050,21000),
(355,'',0,0,2,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-1.png','날치알','레디쉬',NULL,7000,350,14000,'닭고기 샐러드',NULL,NULL,'서울 종로구 종로 263-1 (종로6가)','동대문역',2,700,14000),
(356,'',0,0,2,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-2.png','날치알','레디쉬',NULL,8000,400,16000,'포케 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',2,800,16000),
(357,'',0,0,3,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,19500,'에그 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',3,975,19500),
(358,'',0,0,3,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-2.png','날치알','레디쉬',NULL,8000,400,24000,'포케 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',3,1200,24000),
(360,'',0,0,2,'foke','렌치','파인애플','현미밥 추가',NULL,'스위트 칠리','풋콩','/img/product/product-4.png','렌틸콩','적양파',NULL,7500,375,15000,'단호박 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',2,750,15000),
(361,'',0,0,2,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-2.png','날치알','레디쉬',NULL,8000,400,16000,'포케 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',2,800,16000),
(363,'',0,0,3,'foke','렌치','파인애플','현미밥 추가',NULL,'스위트 칠리','풋콩','/img/product/product-4.png','렌틸콩','적양파',NULL,7500,375,22500,'단호박 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',3,1125,22500),
(364,'',0,0,4,'foke','소금','오이','현미밥 추가',NULL,'렌치','파인애플','/img/product/product-7.png','병아리콩','렌틸콩',NULL,9000,450,36000,'우삼겹메밀면 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',4,1800,36000),
(365,'',0,0,5,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-1.png','날치알','레디쉬',NULL,7000,350,35000,'닭고기 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',5,1750,35000),
(366,'',0,0,6,'foke','소금','오이','현미밥 추가',NULL,'렌치','파인애플','/img/product/product-7.png','병아리콩','렌틸콩',NULL,9000,450,54000,'우삼겹메밀면 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',6,2700,54000),
(367,'',0,0,3,'foke','소금','오이','현미밥 추가',NULL,'렌치','파인애플','/img/product/product-7.png','병아리콩','렌틸콩',NULL,9000,450,27000,'우삼겹메밀면 샐러드',NULL,NULL,'서울 종로구 종로 263-1 (종로6가)','동대문역',3,1350,27000),
(368,'',0,0,1,'피코데가요','스위트 칠리','파인애플','현미밥 추가','퀴노아','레드와인식초','풋콩','/img/product/product-2.png','적양파','날치알','참치',14500,725,14500,'포케 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',1,725,14500),
(370,'',0,0,2,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-2.png','날치알','레디쉬',NULL,8000,400,16000,'포케 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',2,800,16000),
(371,'testdh',0,0,7,'피코데가요','스위트 칠리','병아리콩','현미밥 추가','퀴노아','레드와인식초','렌틸콩','/img/product/product-5.png','콘샐러드','날치알',NULL,10000,200,70000,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',7,1400,70000),
(372,'',0,0,1,'foke','스위트 칠리','렌틸콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-1.png','날치알','레디쉬',NULL,7000,350,7000,'닭고기 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',1,350,7000),
(373,'testdh',0,0,5,'아보카도','허니머스타드','오이','현미밥 추가','퀴노아','스위트 칠리','파인애플','/img/product/product-6.png','병아리콩','렌틸콩',NULL,11000,220,55000,'두부 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',5,1100,55000),
(374,'testdh1',0,0,12,'크랩샐러드','후추','오이','현미밥 추가','건강넛츠','렌치','파인애플','/img/product/product-3.png','병아리콩','렌틸콩',NULL,10000,200,60000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',6,1200,60000),
(375,'',0,0,2,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,6500,325,13000,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',2,650,13000),
(377,'',0,0,3,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,6500,325,19500,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,975,19500),
(378,'',0,0,4,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,26000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',4,1300,26000),
(379,'',0,0,4,'foke','스위트 어니언','풋콩','현미밥 추가',NULL,'레드와인식초','적양파','/img/product/product-5.png','날치알','레디쉬',NULL,6500,325,26000,'탄단지 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',4,1300,26000),
(381,'',0,0,3,'foke','렌치','파인애플','현미밥 추가',NULL,'스위트 칠리','풋콩','/img/product/product-4.png','렌틸콩','적양파',NULL,7500,375,22500,'단호박 샐러드',NULL,NULL,'서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','더조은 종각2',3,1125,22500),
(383,'',0,0,3,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,19500,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,975,19500),
(386,'',0,0,3,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,19500,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,975,19500),
(387,'',0,0,3,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,19500,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,975,19500),
(388,'',0,0,3,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,19500,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,975,19500),
(389,'',0,0,14,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,91000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',14,4550,91000),
(407,'${memberId}',0,0,4,'foke','foke','foke',NULL,NULL,NULL,NULL,'/img/product/product-11.png',NULL,NULL,NULL,4000,80,16000,'콘스프',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',4,320,16000),
(421,'test1@1',0,0,3,'foke','후추','파인애플','현미밥 추가',NULL,'스위트 칠리','렌틸콩','/img/product/product-3.png','날치알','레디쉬',NULL,6500,325,19500,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',3,975,19500),
(426,'fokeTest',0,0,13,'퀴노아','스위트 어니언','병아리콩','현미밥 추가',NULL,'레드와인식초','렌틸콩','/img/product/product-3.png','콘샐러드',NULL,NULL,8000,160,64000,'에그 샐러드',NULL,NULL,'서울 중구 명동길 74 (명동2가, 명동성당) ','명동성당',8,1280,64000);

/*Table structure for table `extramain` */

DROP TABLE IF EXISTS `extramain`;

CREATE TABLE `extramain` (
  `extramainId` int NOT NULL AUTO_INCREMENT,
  `extramainName` varchar(255) NOT NULL,
  `extramainType` varchar(255) NOT NULL,
  `extramainPrice` int NOT NULL,
  PRIMARY KEY (`extramainId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `extramain` */

insert  into `extramain`(`extramainId`,`extramainName`,`extramainType`,`extramainPrice`) values 
(1,'연어','메인추가',3000),
(2,'참치','메인추가',3000),
(3,'새우','메인추가',3000),
(4,'부채살','메인추가',3000);

/*Table structure for table `extratopping` */

DROP TABLE IF EXISTS `extratopping`;

CREATE TABLE `extratopping` (
  `extratoppingId` int NOT NULL AUTO_INCREMENT,
  `extratoppingName` varchar(255) NOT NULL,
  `extratoppingType` varchar(255) NOT NULL,
  `extratoppingPrice` int NOT NULL,
  PRIMARY KEY (`extratoppingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*Data for the table `extratopping` */

insert  into `extratopping`(`extratoppingId`,`extratoppingName`,`extratoppingType`,`extratoppingPrice`) values 
(1,'낫또','추가토핑',2000),
(2,'아보카도','추가토핑',2000),
(3,'크랩샐러드','추가토핑',2000),
(4,'피코데가요','추가토핑',2000),
(5,'퀴노아','추가토핑',1500),
(6,'건강넛츠','추가토핑',1500);

/*Table structure for table `fokeingredient` */

DROP TABLE IF EXISTS `fokeingredient`;

CREATE TABLE `fokeingredient` (
  `fokeingredientId` int NOT NULL AUTO_INCREMENT,
  `memberId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productName` varchar(100) NOT NULL,
  `base` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `atopping` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `btopping` varchar(100) DEFAULT NULL,
  `ctopping` varchar(100) DEFAULT NULL,
  `dtopping` varchar(100) DEFAULT NULL,
  `asource` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bsource` varchar(100) DEFAULT NULL,
  `aextratopping` varchar(100) DEFAULT NULL,
  `bextratopping` varchar(100) DEFAULT NULL,
  `extramain` varchar(100) DEFAULT NULL,
  `setbeverage` varchar(100) DEFAULT NULL,
  `setside` varchar(100) DEFAULT NULL,
  `total` int NOT NULL DEFAULT '1',
  `price` int NOT NULL DEFAULT '0',
  `onePrice` int DEFAULT '0',
  `productImage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fokeingredientId`),
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb3;

/*Data for the table `fokeingredient` */

insert  into `fokeingredient`(`fokeingredientId`,`memberId`,`productName`,`base`,`atopping`,`btopping`,`ctopping`,`dtopping`,`asource`,`bsource`,`aextratopping`,`bextratopping`,`extramain`,`setbeverage`,`setside`,`total`,`price`,`onePrice`,`productImage`) values 
(1,'admin@0','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금','렌치','낫또','아보카도','연어','제로콜라','버섯 스프',1,16000,16000,'/img/product/product-7.png'),
(2,'admin@0','두부 샐러드','현미밥 추가','오이','병아리콩','콘샐러드','날치알','허니머스타드','스위트 칠리','피코데가요','퀴노아','새우',NULL,NULL,1,14000,14000,'/img/product/product-6.png'),
(3,'admin@0','탄단지 샐러드','현미밥 추가','풋콩','적양파','날치알','레디쉬','스위트 어니언','레드와인식초','크랩샐러드','퀴노아','부채살',NULL,NULL,1,13000,13000,'/img/product/product-5.png'),
(4,'admin@0','단호박 샐러드','현미밥 추가','파인애플','풋콩','렌틸콩','적양파','렌치','스위트 칠리','아보카도','퀴노아','새우',NULL,NULL,1,14000,14000,'/img/product/product-4.png'),
(5,'admin@0','에그 샐러드','샐러드만','파인애플','렌틸콩','날치알','레디쉬','후추','스위트 칠리','아보카도','크랩샐러드','참치',NULL,NULL,1,13500,13500,'/img/product/product-3.png'),
(6,'admin@0','닭고기 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','레드와인식초','낫또','아보카도','새우',NULL,NULL,1,14000,14000,'/img/product/product-1.png'),
(7,'admin@0','포케 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','레드와인식초','피코데가요','퀴노아','새우',NULL,NULL,1,14500,14500,'/img/product/product-2.png'),
(8,'test1@1','에그 샐러드','현미밥 추가','날치알',NULL,NULL,NULL,'레드와인식초',NULL,'아보카도','퀴노아','참치','제로콜라','콘스프',5,65000,13000,'/img/product/product-3.png'),
(9,'test1@1','에그 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','스위트 칠리','레드와인식초','피코데가요','퀴노아','새우','제로콜라','콘스프',5,65000,13000,'/img/product/product-3.png'),
(10,'test1@1','에그 샐러드','현미밥 추가','풋콩','병아리콩','렌틸콩','레디쉬','렌치',NULL,NULL,NULL,NULL,NULL,NULL,7,45500,6500,'/img/product/product-3.png'),
(30,'test1@1','에그 샐러드','현미밥 추가','날치알','레디쉬',NULL,NULL,'스위트 칠리',NULL,'건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(31,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','스위트 어니언','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(32,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','스위트 어니언','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(33,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','스위트 어니언','건강넛츠',NULL,NULL,NULL,NULL,3,24000,8000,'/img/product/product-3.png'),
(34,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','스위트 어니언','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(35,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','스위트 어니언','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(36,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,3,24000,8000,'/img/product/product-3.png'),
(37,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,3,8000,2667,'/img/product/product-3.png'),
(38,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(39,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,4,32000,8000,'/img/product/product-3.png'),
(40,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(41,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(42,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(43,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-3.png'),
(44,'test1@1','에그 샐러드','현미밥 추가','오이','파인애플','풋콩','병아리콩','소금','후추','크랩샐러드',NULL,'연어','제로콜라','콘스프',3,34500,11500,'/img/product/product-3.png'),
(45,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'레드와인식초',NULL,'퀴노아',NULL,NULL,NULL,NULL,2,16000,8000,'/img/product/product-3.png'),
(46,'test1@1','에그 샐러드','현미밥 추가','풋콩','병아리콩','렌틸콩','레디쉬','렌치',NULL,NULL,NULL,NULL,NULL,NULL,4,26000,6500,'/img/product/product-3.png'),
(47,'test1@1','에그 샐러드','현미밥 추가','풋콩','병아리콩','렌틸콩','레디쉬','렌치',NULL,NULL,NULL,NULL,NULL,NULL,1,6500,6500,'/img/product/product-3.png'),
(48,'test1@1','에그 샐러드','현미밥 추가','풋콩','병아리콩','렌틸콩','레디쉬','렌치',NULL,NULL,NULL,NULL,NULL,NULL,3,19500,6500,'/img/product/product-3.png'),
(49,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'레드와인식초',NULL,NULL,NULL,NULL,NULL,NULL,1,6500,6500,'/img/product/product-3.png'),
(50,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'레드와인식초',NULL,NULL,NULL,NULL,NULL,NULL,1,6500,6500,'/img/product/product-3.png'),
(51,'test1@1','에그 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','스위트 칠리','레드와인식초','크랩샐러드','건강넛츠',NULL,NULL,NULL,3,30000,10000,'/img/product/product-3.png'),
(52,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파',NULL,NULL,'스위트 칠리','스위트 어니언','아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(53,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파',NULL,NULL,'스위트 칠리','스위트 어니언','아보카도','퀴노아',NULL,NULL,NULL,5,50000,10000,'/img/product/product-3.png'),
(54,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리',NULL,'아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(59,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','날치알',NULL,'레드와인식초',NULL,'아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(60,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','날치알',NULL,'레드와인식초',NULL,'아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(61,'test1@1','에그 샐러드','현미밥 추가','파인애플','병아리콩','렌틸콩',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(62,'test1@1','콘스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,20000,4000,'/img/product/product-11.png'),
(63,'test1@1','포케 샐러드','현미밥 추가','풋콩','병아리콩','렌틸콩','레디쉬','렌치',NULL,NULL,NULL,NULL,NULL,NULL,4,32000,8000,'/img/product/product-2.png'),
(64,'test1@1','포케 샐러드','현미밥 추가','풋콩','병아리콩','렌틸콩','레디쉬','렌치',NULL,NULL,NULL,NULL,NULL,NULL,4,32000,8000,'/img/product/product-2.png'),
(65,'test1@1','닭고기 샐러드','현미밥 추가','오이','파인애플','풋콩',NULL,'소금',NULL,NULL,NULL,NULL,NULL,NULL,3,21000,7000,'/img/product/product-1.png'),
(66,'test1@1','닭고기 샐러드','현미밥 추가','오이','파인애플','풋콩',NULL,'소금',NULL,NULL,NULL,NULL,NULL,NULL,2,14000,7000,'/img/product/product-1.png'),
(67,'test1@1','닭고기 샐러드','현미밥 추가','오이','파인애플','풋콩',NULL,'소금',NULL,NULL,NULL,NULL,NULL,NULL,2,14000,7000,'/img/product/product-1.png'),
(68,'test1@1','포케 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','레드와인식초',NULL,NULL,NULL,NULL,NULL,1,8000,8000,'/img/product/product-2.png'),
(69,'test1@1','에그 샐러드','현미밥 추가','파인애플','병아리콩','렌틸콩',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(70,'test1@1','닭고기 샐러드','현미밥 추가','오이','파인애플','풋콩',NULL,'소금',NULL,NULL,NULL,NULL,NULL,NULL,6,42000,7000,'/img/product/product-1.png'),
(71,'test1@1','포케 샐러드','현미밥 추가','콘샐러드','날치알',NULL,NULL,'스위트 칠리','레드와인식초','퀴노아',NULL,NULL,NULL,NULL,5,47500,9500,'/img/product/product-2.png'),
(72,'test1@1','포케 샐러드','현미밥 추가','콘샐러드','날치알',NULL,NULL,'스위트 칠리','레드와인식초','퀴노아',NULL,NULL,NULL,NULL,5,47500,9500,'/img/product/product-2.png'),
(73,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','레드와인식초',NULL,NULL,NULL,NULL,NULL,10,65000,6500,'/img/product/product-3.png'),
(74,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','레드와인식초',NULL,NULL,NULL,NULL,NULL,10,65000,6500,'/img/product/product-3.png'),
(75,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','레디쉬',NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,7,70000,10000,'/img/product/product-3.png'),
(76,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,7,70000,10000,'/img/product/product-3.png'),
(77,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'렌치','스위트 어니언','낫또','피코데가요',NULL,NULL,NULL,1,10500,10500,'/img/product/product-3.png'),
(78,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,5,50000,10000,'/img/product/product-3.png'),
(79,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,5,50000,10000,'/img/product/product-3.png'),
(80,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','사우스웨스트 치폴레','아보카도','퀴노아',NULL,NULL,NULL,3,30000,10000,'/img/product/product-3.png'),
(81,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,5,50000,10000,'/img/product/product-3.png'),
(82,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','레드와인식초','낫또','피코데가요','연어','제로사이다','콘스프',1,13500,13500,'/img/product/product-3.png'),
(83,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,1,10000,10000,'/img/product/product-3.png'),
(84,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(85,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','낫또','피코데가요',NULL,NULL,NULL,1,13000,13000,'/img/product/product-7.png'),
(86,'test1@1','버섯 스프','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,1,8500,8500,'/img/product/product-12.png'),
(87,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','스위트 칠리','낫또','퀴노아',NULL,NULL,NULL,1,12500,12500,'/img/product/product-7.png'),
(88,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','사우스웨스트 치폴레','아보카도','퀴노아',NULL,NULL,NULL,6,75000,12500,'/img/product/product-7.png'),
(89,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','사우스웨스트 치폴레','아보카도','퀴노아',NULL,NULL,NULL,7,87500,12500,'/img/product/product-7.png'),
(90,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','사우스웨스트 치폴레','아보카도','퀴노아',NULL,NULL,NULL,6,75000,12500,'/img/product/product-7.png'),
(91,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,'제로사이다','바질 스프',5,62500,12500,'/img/product/product-7.png'),
(92,'test1@1','우삼겹메밀면 샐러드','샐러드만','병아리콩','렌틸콩','날치알',NULL,'스위트 칠리','레드와인식초','아보카도','크랩샐러드','참치','제로콜라','바질 스프',7,112000,16000,'/img/product/product-7.png'),
(93,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','스위트 어니언','낫또','아보카도','새우','제로사이다','버섯 스프',5,80000,16000,'/img/product/product-7.png'),
(94,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','파인애플','병아리콩','렌틸콩',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','부채살','제로콜라','바질 스프',6,93000,15500,'/img/product/product-7.png'),
(95,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아','새우','제로콜라','버섯 스프',7,108500,15500,'/img/product/product-7.png'),
(96,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,'제로콜라','버섯 스프',5,62500,12500,'/img/product/product-7.png'),
(97,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드',NULL,NULL,'스위트 어니언','레드와인식초','낫또','피코데가요','새우','제로사이다','버섯 스프',4,64000,16000,'/img/product/product-7.png'),
(98,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','날치알',NULL,NULL,NULL,'레드와인식초',NULL,'퀴노아',NULL,'부채살','제로콜라','콘스프',1,13500,13500,'/img/product/product-7.png'),
(99,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드',NULL,NULL,'스위트 어니언','레드와인식초','낫또','피코데가요','새우','제로사이다','버섯 스프',4,64000,16000,'/img/product/product-7.png'),
(100,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드',NULL,NULL,'스위트 어니언','레드와인식초','낫또','피코데가요','새우','제로사이다','버섯 스프',5,80000,16000,'/img/product/product-7.png'),
(101,'test1@1','두부 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-6.png'),
(102,'test1@1','두부 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-6.png'),
(103,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(104,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(105,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(106,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(107,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(108,'test1@1','우삼겹메밀면 샐러드',NULL,'병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,NULL,NULL,8,100000,12500,'/img/product/product-7.png'),
(109,'test1@1','우삼겹메밀면 샐러드',NULL,'병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,NULL,NULL,8,100000,12500,'/img/product/product-7.png'),
(110,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,'제로콜라','버섯 스프',3,37500,12500,'/img/product/product-7.png'),
(115,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,'제로콜라','버섯 스프',6,75000,12500,'/img/product/product-7.png'),
(116,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,'제로콜라','버섯 스프',6,75000,12500,'/img/product/product-7.png'),
(121,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','아보카도','퀴노아','참치','제로콜라','버섯 스프',7,108500,15500,'/img/product/product-7.png'),
(122,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','부채살','제로콜라','버섯 스프',7,108500,15500,'/img/product/product-7.png'),
(123,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','부채살','제로콜라','버섯 스프',4,62000,15500,'/img/product/product-7.png'),
(124,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'허니머스타드',NULL,'아보카도','퀴노아',NULL,'제로사이다','버섯 스프',6,75000,12500,'/img/product/product-7.png'),
(125,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'허니머스타드',NULL,'아보카도','퀴노아',NULL,'제로사이다','버섯 스프',8,100000,12500,'/img/product/product-7.png'),
(126,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'허니머스타드',NULL,'아보카도','퀴노아',NULL,'제로사이다','버섯 스프',5,62500,12500,'/img/product/product-7.png'),
(127,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'허니머스타드',NULL,'아보카도','퀴노아',NULL,'제로사이다','버섯 스프',11,137500,12500,'/img/product/product-7.png'),
(128,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','부채살',NULL,NULL,4,62000,15500,'/img/product/product-7.png'),
(129,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','새우',NULL,NULL,4,62000,15500,'/img/product/product-7.png'),
(130,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','새우',NULL,NULL,5,77500,15500,'/img/product/product-7.png'),
(131,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','새우',NULL,NULL,3,46500,15500,'/img/product/product-7.png'),
(132,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','새우',NULL,NULL,1,15500,15500,'/img/product/product-7.png'),
(133,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','새우',NULL,NULL,1,15500,15500,'/img/product/product-7.png'),
(134,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','새우',NULL,NULL,1,15500,15500,'/img/product/product-7.png'),
(135,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','레드와인식초','아보카도','퀴노아','연어',NULL,NULL,3,46500,15500,'/img/product/product-7.png'),
(136,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도',NULL,NULL,NULL,NULL,1,11000,11000,'/img/product/product-7.png'),
(137,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도',NULL,NULL,NULL,NULL,1,11000,11000,'/img/product/product-7.png'),
(138,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(139,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(140,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(141,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(142,'test1@1','단호박 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-4.png'),
(143,'test1@1','단호박 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-4.png'),
(144,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(145,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(146,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,1,12500,12500,'/img/product/product-7.png'),
(147,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','참치',NULL,NULL,1,15500,15500,'/img/product/product-7.png'),
(148,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(149,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(151,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(152,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(153,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(154,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(155,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(156,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아','부채살',NULL,NULL,1,15500,15500,'/img/product/product-7.png'),
(157,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(158,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(159,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(160,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(161,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(162,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','날치알',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,1,12500,12500,'/img/product/product-7.png'),
(163,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(164,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(165,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(166,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(167,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(168,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(169,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(170,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(171,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(172,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(174,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(175,'test','단호박 샐러드','현미밥 추가','날치알',NULL,NULL,NULL,'레드와인식초',NULL,'퀴노아',NULL,NULL,'제로콜라','콘스프',20,180000,0,'/img/product/product-4.png'),
(178,'test1@1','두부 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-6.png'),
(181,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(182,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(184,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(185,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(188,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(189,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(190,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(192,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,3,37500,12500,'/img/product/product-7.png'),
(193,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,'제로사이다','콘스프',3,30000,10000,'/img/product/product-5.png'),
(194,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,4,40000,10000,'/img/product/product-3.png'),
(195,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'허니머스타드','스위트 어니언',NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(196,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(197,'test1@1','우삼겹메밀면 샐러드','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(198,'test1@1','에그 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,6,60000,10000,'/img/product/product-3.png'),
(225,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,4,44000,11000,'/img/product/product-4.png'),
(230,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','낫또','피코데가요',NULL,NULL,NULL,4,52000,13000,'/img/product/product-7.png'),
(265,'dohoon@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,22000,2000,'/img/product/product-8.png'),
(266,'dohoon@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8000,2000,'/img/product/product-8.png'),
(267,'dohoon@1','우삼겹메밀면 샐러드','현미밥 추가','오이',NULL,NULL,NULL,'소금',NULL,'낫또',NULL,NULL,NULL,NULL,3,33000,11000,'/img/product/product-7.png'),
(268,'dohoon@1','우삼겹메밀면 샐러드','현미밥 추가','오이',NULL,NULL,NULL,'소금',NULL,'낫또',NULL,NULL,NULL,NULL,3,33000,11000,'/img/product/product-7.png'),
(269,'dohoon@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩',NULL,NULL,NULL,'소금',NULL,'낫또',NULL,NULL,NULL,NULL,1,11000,11000,'/img/product/product-7.png'),
(270,'dohoon@1','버섯 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,20000,5000,'/img/product/product-12.png'),
(271,'dohoon@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','후추','스위트 칠리','아보카도','퀴노아',NULL,'제로사이다','버섯 스프',3,37500,12500,'/img/product/product-7.png'),
(272,'dohoon@1','탄단지 샐러드','현미밥 추가','병아리콩','콘샐러드',NULL,NULL,'스위트 칠리','레드와인식초','피코데가요',NULL,NULL,NULL,NULL,3,25500,8500,'/img/product/product-5.png'),
(273,'dohoon@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','적양파','레디쉬',NULL,'렌치',NULL,NULL,NULL,NULL,NULL,NULL,9,81000,9000,'/img/product/product-7.png'),
(274,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,'낫또','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(275,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','렌틸콩',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,3,37500,12500,'/img/product/product-7.png'),
(276,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'렌치','스위트 어니언','퀴노아',NULL,NULL,NULL,NULL,3,31500,10500,'/img/product/product-7.png'),
(277,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'소금','허니머스타드','낫또',NULL,NULL,NULL,NULL,8,88000,11000,'/img/product/product-7.png'),
(278,'test1@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,10000,2000,'/img/product/product-8.png'),
(279,'test1@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,16000,2000,'/img/product/product-8.png'),
(280,'test1@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8000,2000,'/img/product/product-8.png'),
(281,'test1@1','버섯 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5000,5000,'/img/product/product-12.png'),
(282,'test1@1','두부 샐러드','현미밥 추가','렌틸콩','적양파','날치알','레디쉬','스위트 칠리','레드와인식초','피코데가요',NULL,NULL,NULL,NULL,4,38000,9500,'/img/product/product-6.png'),
(283,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'레드와인식초',NULL,'피코데가요',NULL,NULL,NULL,NULL,3,33000,11000,'/img/product/product-7.png'),
(284,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','건강넛츠',NULL,NULL,NULL,NULL,6,63000,10500,'/img/product/product-7.png'),
(285,'test1@1','탄단지 샐러드','현미밥 추가','오이','병아리콩','날치알',NULL,'스위트 칠리','스위트 어니언','건강넛츠',NULL,NULL,NULL,NULL,9,72000,8000,'/img/product/product-5.png'),
(286,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','적양파',NULL,NULL,'허니머스타드','스위트 칠리','피코데가요',NULL,NULL,NULL,NULL,6,66000,11000,'/img/product/product-7.png'),
(287,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'스위트 칠리',NULL,'아보카도','퀴노아',NULL,NULL,NULL,5,62500,12500,'/img/product/product-7.png'),
(288,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,5,40000,8000,'/img/product/product-3.png'),
(289,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,6,48000,8000,'/img/product/product-3.png'),
(290,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,5,40000,8000,'/img/product/product-3.png'),
(291,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','적양파','날치알',NULL,'스위트 칠리','레드와인식초','피코데가요','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(292,'test1@1','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 어니언','레드와인식초','피코데가요',NULL,NULL,NULL,NULL,6,51000,8500,'/img/product/product-5.png'),
(293,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,6,60000,10000,'/img/product/product-5.png'),
(294,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,5,50000,10000,'/img/product/product-5.png'),
(295,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,9,90000,10000,'/img/product/product-5.png'),
(296,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,3,24000,8000,'/img/product/product-3.png'),
(297,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,4,32000,8000,'/img/product/product-3.png'),
(298,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,8,64000,8000,'/img/product/product-3.png'),
(299,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,11,88000,8000,'/img/product/product-3.png'),
(300,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,4,32000,8000,'/img/product/product-3.png'),
(301,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,5,40000,8000,'/img/product/product-3.png'),
(302,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,6,48000,8000,'/img/product/product-3.png'),
(303,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,3,24000,8000,'/img/product/product-3.png'),
(304,'test1@1','에그 샐러드','현미밥 추가','오이','병아리콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','건강넛츠',NULL,NULL,NULL,NULL,4,32000,8000,'/img/product/product-3.png'),
(305,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,5,60000,12000,'/img/product/product-7.png'),
(306,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,8,96000,12000,'/img/product/product-7.png'),
(307,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,10,120000,12000,'/img/product/product-7.png'),
(308,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,3,36000,12000,'/img/product/product-7.png'),
(309,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,1,12000,12000,'/img/product/product-7.png'),
(310,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,7,70000,10000,'/img/product/product-5.png'),
(311,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알','레디쉬',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,15,150000,10000,'/img/product/product-5.png'),
(312,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,7,87500,12500,'/img/product/product-7.png'),
(313,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,8,100000,12500,'/img/product/product-7.png'),
(314,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(315,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,9,112500,12500,'/img/product/product-7.png'),
(316,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,15,187500,12500,'/img/product/product-7.png'),
(317,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,9,112500,12500,'/img/product/product-7.png'),
(318,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,10,125000,12500,'/img/product/product-7.png'),
(319,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,14,175000,12500,'/img/product/product-7.png'),
(320,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(321,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,5,60000,12000,'/img/product/product-7.png'),
(322,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','적양파','날치알','허니머스타드','스위트 칠리','낫또','피코데가요','연어','제로콜라','바질 스프',1,16000,16000,NULL),
(323,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','콘샐러드','날치알',NULL,'스위트 칠리','스위트 어니언','퀴노아','건강넛츠',NULL,NULL,NULL,14,168000,12000,'/img/product/product-7.png'),
(324,'test1@1','두부 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아','새우','제로콜라','버섯 스프',1,14000,14000,NULL),
(325,'test1@1','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩','날치알','레디쉬','레드와인식초',NULL,'낫또','퀴노아','부채살',NULL,NULL,4,52000,13000,NULL),
(326,'test1@1','우삼겹메밀면 샐러드','샐러드만','렌틸콩','적양파','날치알',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,NULL),
(327,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,5,62500,12500,'/img/product/product-7.png'),
(328,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,6,75000,12500,'/img/product/product-7.png'),
(329,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,10,125000,12500,'/img/product/product-7.png'),
(330,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩','콘샐러드','날치알',NULL,'허니머스타드','스위트 칠리','피코데가요','퀴노아',NULL,NULL,NULL,15,187500,12500,'/img/product/product-7.png'),
(331,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,6,75000,12500,'/img/product/product-7.png'),
(332,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,19,237500,12500,'/img/product/product-7.png'),
(333,'test1@1','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','퀴노아','건강넛츠',NULL,NULL,NULL,3,28500,9500,'/img/product/product-5.png'),
(334,'test1@1','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','퀴노아','건강넛츠',NULL,NULL,NULL,7,66500,9500,'/img/product/product-5.png'),
(335,'test1@1','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','허니머스타드','스위트 칠리','퀴노아','건강넛츠',NULL,NULL,NULL,20,190000,9500,'/img/product/product-5.png'),
(336,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,NULL,NULL,4,50000,12500,'/img/product/product-7.png'),
(337,'test1@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,6000,2000,'/img/product/product-8.png'),
(338,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','올리브',NULL,'스위트 칠리','스위트 어니언','피코데가요',NULL,'참치',NULL,NULL,4,50000,12500,'/img/product/product-4.png'),
(339,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(340,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','크랩샐러드','건강넛츠',NULL,NULL,NULL,3,33000,11000,'/img/product/product-4.png'),
(341,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','병아리콩','렌틸콩','콘샐러드','스위트 칠리','레드와인식초','낫또','피코데가요',NULL,'제로사이다','버섯 스프',4,52000,13000,'/img/product/product-7.png'),
(342,'test1@1','에그 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'스위트 칠리','레드와인식초','피코데가요','퀴노아','새우','제로사이다','버섯 스프',5,65000,13000,'/img/product/product-3.png'),
(343,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(344,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(345,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','렌틸콩',NULL,NULL,NULL,'레드와인식초',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(346,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(347,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(348,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','오이','파인애플','병아리콩','렌틸콩','소금',NULL,NULL,NULL,NULL,NULL,NULL,1,9000,9000,'/img/product/product-7.png'),
(349,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','스위트 어니언','크랩샐러드','건강넛츠',NULL,NULL,NULL,4,44000,11000,'/img/product/product-4.png'),
(350,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','스위트 어니언','크랩샐러드','건강넛츠',NULL,NULL,NULL,5,55000,11000,'/img/product/product-4.png'),
(351,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드','날치알','스위트 칠리','스위트 어니언','크랩샐러드','건강넛츠',NULL,NULL,NULL,1,11000,11000,'/img/product/product-4.png'),
(352,'test1@1','두부 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'허니머스타드','스위트 칠리','크랩샐러드','건강넛츠','연어','제로사이다','버섯 스프',3,42000,14000,'/img/product/product-6.png'),
(353,'test1@1','우삼겹메밀면 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','낫또','피코데가요','새우','제로사이다','콘스프',3,48000,16000,'/img/product/product-7.png'),
(354,'test1@1','바질 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,9000,4500,'/img/product/product-10.png'),
(355,'test1@1','두부 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'소금','후추','낫또','피코데가요',NULL,NULL,NULL,2,23000,11500,'/img/product/product-6.png'),
(356,'test1@1','탄단지 샐러드','현미밥 추가','렌틸콩','날치알',NULL,NULL,'스위트 어니언','레드와인식초','낫또','피코데가요',NULL,NULL,NULL,3,31500,10500,'/img/product/product-5.png'),
(357,'test1@1','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,6000,2000,'/img/product/product-8.png'),
(358,'test1@1','탄단지 샐러드','현미밥 추가','오이','파인애플','병아리콩',NULL,'스위트 칠리','레드와인식초','아보카도','퀴노아',NULL,NULL,NULL,3,30000,10000,'/img/product/product-5.png'),
(359,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'허니머스타드','스위트 칠리','아보카도','퀴노아',NULL,'제로콜라','버섯 스프',3,33000,11000,'/img/product/product-4.png'),
(360,'test1@1','바질 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,13500,4500,'/img/product/product-10.png'),
(361,'test1@1','버섯 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10000,5000,'/img/product/product-12.png'),
(362,'gae799@naver.com','바질 스프','현미밥 추가',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4500,4500,NULL),
(363,'gae799@naver.com','버섯 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5000,5000,'/img/product/product-12.png'),
(364,'gae799@naver.com','바질 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4500,4500,'/img/product/product-10.png'),
(365,'gae799@naver.com','바질 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4500,4500,'/img/product/product-10.png'),
(366,'gae799@naver.com','두부 샐러드','현미밥 추가','오이','병아리콩','콘샐러드','날치알','허니머스타드',NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-6.png'),
(367,'dohoon@1','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'허니머스타드','스위트 칠리',NULL,NULL,NULL,NULL,NULL,3,19500,6500,'/img/product/product-5.png'),
(368,'gae799@naver.com','바질 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4500,4500,'/img/product/product-10.png'),
(369,'kimdohoon96@naver.com','바질 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,13500,4500,'/img/product/product-10.png'),
(370,'kimdohoon96@naver.com','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'허니머스타드','스위트 칠리','낫또','피코데가요',NULL,NULL,NULL,3,31500,10500,'/img/product/product-5.png'),
(371,'kimdohoon96@naver.com','탄단지 샐러드','현미밥 추가','병아리콩','렌틸콩',NULL,NULL,'허니머스타드','스위트 칠리','낫또','피코데가요',NULL,NULL,NULL,5,52500,10500,'/img/product/product-5.png'),
(372,'test1@1','단호박 샐러드','샐러드만','파인애플','풋콩','렌틸콩','적양파','렌치',NULL,'아보카도',NULL,NULL,'제로콜라','콘스프',1,12000,12000,'/img/product/product-4.png'),
(373,'test1@1','탄단지 샐러드','현미밥 추가','풋콩','적양파','날치알','레디쉬','스위트 어니언',NULL,NULL,NULL,NULL,NULL,NULL,1,6500,6500,'/img/product/product-5.png'),
(374,'test1@1','버섯 스프',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5000,5000,'/img/product/product-12.png'),
(375,'kimdohoon96@naver.com','제로사이다',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,6000,2000,'/img/product/product-8.png'),
(376,'test1@1','탄단지 샐러드','샐러드만','콘샐러드','날치알',NULL,NULL,'렌치','스위트 어니언','아보카도',NULL,'연어','제로콜라','콘스프',3,42000,14000,'/img/product/product-5.png'),
(377,'test1@1','단호박 샐러드','현미밥 추가','병아리콩','렌틸콩','콘샐러드',NULL,'허니머스타드','스위트 칠리','낫또','피코데가요',NULL,NULL,NULL,3,34500,11500,'/img/product/product-4.png'),
(378,'test1@1','에그 샐러드','현미밥 추가','파인애플','렌틸콩','날치알','레디쉬','후추',NULL,NULL,NULL,NULL,NULL,NULL,2,13000,6500,'/img/product/product-3.png'),
(379,'test1@1','단호박 샐러드','현미밥 추가','파인애플','풋콩','렌틸콩','적양파','렌치',NULL,NULL,NULL,NULL,NULL,NULL,1,7500,7500,'/img/product/product-4.png'),
(380,'test1@1','단호박 샐러드','샐러드만','파인애플','풋콩','렌틸콩','적양파','렌치',NULL,'낫또','건강넛츠',NULL,'제로콜라','버섯 스프',1,13500,13500,'/img/product/product-4.png');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `memberId` varchar(255) NOT NULL,
  `memberPw` varchar(200) DEFAULT NULL,
  `memberName` varchar(200) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `adminCk` int NOT NULL,
  `consentPush` int NOT NULL,
  `consentEmail` int NOT NULL,
  `consentSMS` int NOT NULL,
  `money` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `sex` int DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`memberId`,`memberPw`,`memberName`,`birth`,`phone`,`adminCk`,`consentPush`,`consentEmail`,`consentSMS`,`money`,`point`,`gender`,`sex`) values 
('22222','222','비번222','2023-06-23','222아직형식제한x',0,0,0,1,654321,2222,NULL,NULL),
('3','3','수정된비번3','2023-06-23','3',0,0,1,0,3333,333,NULL,NULL),
('4','4','비번4','2023-06-23','4',0,1,1,0,4,4,NULL,NULL),
('5','5','비번5','2023-06-23','5',0,0,1,0,5,5,NULL,NULL),
('admin','def','dohoon',NULL,'01011112222',1111,123,456,789,1000,1000,NULL,NULL),
('admin@0','$2a$10$nkapxZCarDZJMf0gsthwBeofCuFnSh0ghHADYzIv/uGAYPrSVOTE2','관리자','2023-04-17','01011112222',1,1,0,1,100000,5000,NULL,NULL),
('admin1','def','dohoon1',NULL,'01011112222',1111,123,456,789,1000,1000,NULL,NULL),
('do__ri@naver.com','$2a$10$Gz8b7Jp7TGP0IBfvpwgg5OuuBFYFIwPBkBOLKLwFDFcS5pP1rOeuq','도레미11!','2023-06-28','1111',0,0,1,1,NULL,NULL,NULL,NULL),
('dohoon@1','$2a$10$bbsf4mczL6oDghghVmC4Heet8WYP.e7uuoGMl.WrHwlTKj.F4JNj6','도훈','2023-04-28','01011112222',1,0,0,0,100000,5000,NULL,NULL),
('kimdohoon96@naver.com','$2a$10$u4r.Jo2J.vejb5W2zdAV5OPFeJamyILHzKVcmR5E9a6u/cVuzsyua','도훈','2023-05-02','01062520326',0,0,0,0,100000,5000,NULL,NULL),
('rltmdtj@naver.com','$2a$10$NhFb1M/gc73Tm59w7jbBzeJ.KyozH/zwIZnUHXpDwgDAMwqynB61m','기승서','2023-06-23','01088280944',1,1,1,1,100000,5000,NULL,NULL),
('test','$2a$10$svMHfLTX5fWfIsXGZOxDEO6lxRLarjAOWdwovEjoZwE0UodfXHQVq','test','2023-04-05','01011112222',0,1,1,1,100000,5000,NULL,NULL),
('test@test.com','$2a$10$HJK9Z1ZjWUzhX9Xpx8hDzuxFH0QGnmYlI.u02AUyq3jpumffEc5Wy','고래','2023-04-20','01011112222',0,0,0,0,100000,5000,NULL,NULL),
('test1@1','$2a$10$TO2AoTKPnUtxTc9W75iK9.LcA.5uDrpd724KgZ1K9sL3hq.Aw.XJC','11','2023-04-18','01011112222',0,1,1,1,100000,5000,NULL,NULL),
('test10@10','$2a$10$x.etfP11Jp07hHk1Bkm3aOgNtSNHdPQrWvftIEPV6vQS33ifjZRpq','랴랴랴랴','2023-04-25','01011112222',0,1,1,1,100000,5000,NULL,NULL),
('test2@2','$2a$10$mj9Vw48AqJFStDRu1jbuVO3.wmTI9VfS6WUQaP5p/2IhYWzWR2JNe','2','2023-04-17','01011112222',0,0,0,1,100000,5000,NULL,NULL),
('test6@6','$2a$10$oyDtC22FadFy2OKo5teDweGgQnxrldPt6xk.CMN5E.favhp810cMW','test6','2023-04-06','01011112222',0,1,1,1,100000,5000,NULL,NULL),
('test7@7','$2a$10$EJMph6yYJ5U01lf3n250AOMkAauTblqDg8Wo4n5eoF9P/7JrGguxy','7','2023-04-18','01011112222',0,1,1,1,100000,5000,NULL,NULL),
('whgdmsdpseld@naver.com','$2a$10$3guYZ3OvR4Ge4Rflbe/t.uq.wxSbN2dsnARDFC.m2Ly0/lmNbnEGu','차지환','1999-05-28','01032553578',1,0,0,0,100000,5000,NULL,NULL),
('수정된3','3','비번3','2023-06-23','3',0,0,1,0,3333,333,NULL,NULL),
('아직이메일아니어도되나','aaa','비번aaa','2023-06-23','아직형식제한x',0,1,1,1,123456,1111,NULL,NULL);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `noticeId` int NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(30) NOT NULL,
  `noticeContent` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `noticeDate` datetime(6) DEFAULT NULL,
  `noticeState` varchar(10) DEFAULT NULL,
  `noticeimage` varchar(255) DEFAULT NULL,
  `detailImage` varchar(255) DEFAULT NULL,
  `boardImage` varchar(255) DEFAULT NULL,
  `noticeImagefile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;

/*Data for the table `notice` */

insert  into `notice`(`noticeId`,`noticeTitle`,`noticeContent`,`noticeDate`,`noticeState`,`noticeimage`,`detailImage`,`boardImage`,`noticeImagefile`) values 
(67,'굿굿이','굿굿이','2023-07-05 09:45:28.450989',NULL,'bef5d634-92c9-48ba-93bd-cb808da13bda_ddd_resized.jpg','dae1f1ec-c2c5-4425-bc7d-6b3be9222ad5_ccc.jpg',NULL,NULL),
(68,'굿굿이2','굿굿이2','2023-07-05 09:45:44.406123',NULL,'28dea446-46b7-4598-a95d-45adfa55f26f_aaaa_resized.jpg','046c4f09-8992-4838-8fa9-64e1b778ab36_bbbb.jpg',NULL,NULL),
(69,'굿굿이3','굿굿이3','2023-07-05 09:46:05.703609',NULL,'325193eb-7e90-43d2-91c5-a150368fddd0_img_resized.jpg','a9ea093b-bd0b-4ea9-b48f-87e846d3ab91_ddd.jpg',NULL,NULL),
(71,'굿굿이4','굿굿이4','2023-07-05 09:46:44.723521',NULL,'fa767852-48aa-43da-ba30-177ab8e449a4_bbbb_resized.jpg','9c44c816-83d5-4f74-9464-03860f662f99_img.jpg',NULL,NULL),
(72,'굿굿이612121212','굿굿이612121212','2023-07-05 09:47:05.176526',NULL,'ac599a88-bb4b-450d-abf5-c54a05461596_ddd_resized.jpg','0a972e18-c5bf-4f6c-b931-ef4c870b3e88_img.jpg',NULL,NULL);

/*Table structure for table `noticedto` */

DROP TABLE IF EXISTS `noticedto`;

CREATE TABLE `noticedto` (
  `noticeId` int NOT NULL AUTO_INCREMENT,
  `noticeContent` varchar(200) DEFAULT NULL,
  `noticeDate` date DEFAULT NULL,
  `noticeImage` varchar(100) DEFAULT NULL,
  `noticeState` varchar(10) DEFAULT NULL,
  `noticeTitle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `noticedto` */

insert  into `noticedto`(`noticeId`,`noticeContent`,`noticeDate`,`noticeImage`,`noticeState`,`noticeTitle`) values 
(1,'고앵이',NULL,'c69f96d1-6c98-435f-a5f3-1740f4a50634_img.jpg',NULL,'고앵이');

/*Table structure for table `nutritional` */

DROP TABLE IF EXISTS `nutritional`;

CREATE TABLE `nutritional` (
  `NutritionalId` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `productName` varchar(20) NOT NULL,
  `Weight` int NOT NULL,
  `calorie` int NOT NULL,
  `protein` float DEFAULT NULL,
  `saturatedFat` float DEFAULT NULL,
  `sugarContent` float DEFAULT NULL,
  `sodium` float DEFAULT NULL,
  PRIMARY KEY (`NutritionalId`),
  KEY `productId` (`productId`),
  CONSTRAINT `nutritional_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `nutritional` */

insert  into `nutritional`(`NutritionalId`,`productId`,`productName`,`Weight`,`calorie`,`protein`,`saturatedFat`,`sugarContent`,`sodium`) values 
(1,1,'포케 샐러드',237,300,26,1.3,8.7,605),
(2,3,'닭고기 샐러드',362,152,19.8,0.7,9.7,455),
(3,6,'에그 샐러드',346,254,9.7,4.3,7.3,312),
(4,8,'단호박 샐러드',245,215,29.8,1.7,7.7,455),
(5,9,'탄단지 샐러드',254,245,9.7,4.3,7.3,215),
(6,10,'두부 샐러드',249,254,9.7,4.3,7.3,312),
(7,13,'우삼겹메밀면 샐러드',346,185,9.7,4.3,7.3,215),
(8,4,'콘스프',354,215,29.8,1.7,7.7,455),
(9,11,'바질 스프',384,245,9.7,4.3,7.3,215),
(10,12,'버섯 스프',249,254,9.7,4.3,7.3,312);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `memberId` varchar(100) DEFAULT NULL,
  `cartId` int DEFAULT NULL,
  `storeId` int DEFAULT NULL,
  `fokeingredientId` int DEFAULT NULL,
  `paymentAddress` varchar(255) DEFAULT NULL,
  `paymentPickup` varchar(255) DEFAULT NULL,
  `point` int DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `paymentDay` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`paymentId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

/*Data for the table `payment` */

insert  into `payment`(`paymentId`,`memberId`,`cartId`,`storeId`,`fokeingredientId`,`paymentAddress`,`paymentPickup`,`point`,`phone`,`paymentDay`) values 
(1,'admin@0',2,2,2,'서울특별시 중구 명동길 74 명동성당 B118호','명동성당',0,'사용안함','2022-05-21 00:00:00.000000'),
(3,'test1@1',9,3,0,'서울특별시 중구 명동길 74 명동성당 B118호','명동성당',0,'사용안함',NULL),
(4,'test1@1',0,3,4,'서울특별시 중구 명동길 74 명동성당 B118호','명동성당',0,'사용안함','2023-04-25 17:13:36.000000'),
(5,'test1@1',0,3,5,'서울특별시 중구 명동길 74 명동성당 B118호','명동성당',0,'사용안함','2023-04-25 17:15:00.000000'),
(6,'test1@1',0,1,6,'서울특별시 중구 명동길 74 명동성당 B118호','명동성당',0,'사용안함','2023-04-25 17:16:29.000000'),
(7,'admin',1,1,1,'서울 종로 어쩌고','경복궁',0,'사용안함',NULL);

/*Table structure for table `paymentdto` */

DROP TABLE IF EXISTS `paymentdto`;

CREATE TABLE `paymentdto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartId` int NOT NULL,
  `fokeingredientId` int NOT NULL,
  `memberId` varchar(255) DEFAULT NULL,
  `paymentAddress` varchar(255) DEFAULT NULL,
  `paymentCoupon` varchar(255) DEFAULT NULL,
  `paymentDay` datetime(6) DEFAULT NULL,
  `paymentId` int NOT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `paymentOrder` varchar(255) DEFAULT NULL,
  `paymentPickup` varchar(255) DEFAULT NULL,
  `paymentTakeout` int NOT NULL,
  `paymentmoney` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `point` int NOT NULL,
  `storeId` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `paymentdto` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `productType` varchar(20) NOT NULL,
  `productDetail` varchar(200) NOT NULL,
  `productPrice` varchar(20) NOT NULL,
  `productCalorie` varchar(20) NOT NULL,
  `productImage` varchar(100) DEFAULT NULL,
  `productEname` varchar(20) NOT NULL,
  `productLabel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

/*Data for the table `product` */

insert  into `product`(`productId`,`productName`,`productType`,`productDetail`,`productPrice`,`productCalorie`,`productImage`,`productEname`,`productLabel`) values 
(1,'포케 샐러드','샐러드','신선한 연어로 만든 샐러드!','8000','300','/img/product/product-2.png','Poke Salad',NULL),
(2,'제로콜라','음료','0칼로리의 시원한 음료수!','2000','0','/img/product/product-9.png','Zero Coke',NULL),
(3,'닭고기 샐러드','샐러드','저염 닭고기로 만들어진 샐러드!','7000','152','/img/product/product-1.png','Chicken Salad',NULL),
(4,'콘스프','사이드','따뜻하고 고소한 콘스프!','4000','215','/img/product/product-11.png','Corn Soup','sale'),
(5,'제로사이다','음료','0칼로리의 시원한 음료수!','2000','0','/img/product/product-8.png','Zero Cider','sale'),
(6,'에그 샐러드','샐러드','으깬 달걀이 들어가 있는 클래식 샐러드!','6500','254','/img/product/product-3.png','Egg Salad',''),
(8,'단호박 샐러드','샐러드','고소한 단호박 샐러드','7500','215','/img/product/product-4.png','Sweet Pumpkin Salad',NULL),
(9,'탄단지 샐러드','샐러드','탄수화물, 단백질, 지방을 조화롭게 맞춘 영양만점 샐러드!','6500','245','/img/product/product-5.png','Pebble Salad',NULL),
(10,'두부 샐러드','샐러드','고기가 없어도 포만감이 가득한 두부 샐러드!','7500','254','/img/product/product-6.png','Tofu Salad',NULL),
(11,'바질 스프','사이드','식욕을 돋구는 바질 향기가 가득한 스프!','4500','245','/img/product/product-10.png','basil Soup',NULL),
(12,'버섯 스프','사이드','영양 넘치는 버섯이 가득 씹히는 스프!','5000','254','/img/product/product-12.png','Mushroom Soup',NULL),
(13,'우삼겹메밀면 샐러드','샐러드','육즙가득 우삼겹과 탱글한 메밀면의 완벽 밸런스 만점 샐러드!','9000','185','/img/product/product-7.png','Beef Noodles Salad','new');

/*Table structure for table `recommend` */

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
  `search_id` int NOT NULL AUTO_INCREMENT,
  `search_text` varchar(200) NOT NULL,
  `result_text1` varchar(200) DEFAULT NULL,
  `result_text2` varchar(200) DEFAULT NULL,
  `result_text3` varchar(200) DEFAULT NULL,
  `result_text4` varchar(200) DEFAULT NULL,
  `result_text5` varchar(200) DEFAULT NULL,
  UNIQUE KEY `uq_recommend` (`search_text`),
  KEY `search_id` (`search_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `recommend` */

insert  into `recommend`(`search_id`,`search_text`,`result_text1`,`result_text2`,`result_text3`,`result_text4`,`result_text5`) values 
(7,'국수','수목식당','한창희천하일면','다원맛칼국수','우리집칼국수','상도국수'),
(8,'마라','신룽푸마라탕숭실대점','신룽푸마라탕','칠기마라샹궈마라탕','진푸중국요리','가야성'),
(3,'맥주','역전할머니맥주','생활맥주상도역점','역전할머니맥주서울숭실대점','캐빈','술광장호프치킨'),
(4,'중식','바른탕수육','럭키데이','채홍','진상천','진푸중국요리'),
(5,'초밥','우마이','상도타코야끼','스시초이','스시톡톡','추실장참치'),
(6,'치킨','호치킨','비비큐치킨흑석점','푸라닭흑석점','교촌치킨숭실대점','푸라닭상도1동점'),
(1,'커피','커피킹','오카페흑석점','카페','모코커피창고','모코커피'),
(9,'토스트','이삭토스트','치킨시대&피자시대','카페로뎀','슈퍼피자','피자플래넷동작점'),
(10,'한식','노칩스마켓','도담죽','밀짚모자','푸드딜리버리','고모밥죠');

/*Table structure for table `siteuser` */

DROP TABLE IF EXISTS `siteuser`;

CREATE TABLE `siteuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_h769wrp2qg2btc7uqngtr00ww` (`email`),
  UNIQUE KEY `UK_d8n9ab99h2922vu15x9u32v4w` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `siteuser` */

/*Table structure for table `source` */

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `sourceId` int NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(255) NOT NULL,
  `sourceType` varchar(255) NOT NULL,
  PRIMARY KEY (`sourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `source` */

insert  into `source`(`sourceId`,`sourceName`,`sourceType`) values 
(1,'소금','소스'),
(2,'후추','소스'),
(3,'렌치','소스'),
(4,'허니머스타드','소스'),
(5,'스위트 칠리','소스'),
(6,'스위트 어니언','소스'),
(7,'사우스웨스트 치폴레','소스'),
(8,'레드와인식초','소스');

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `quantityId` int NOT NULL AUTO_INCREMENT,
  `storeId` bigint DEFAULT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`quantityId`),
  KEY `productId` (`productId`),
  KEY `FKmaogsgux0dxjhpy4fitjqqg2u` (`storeId`),
  CONSTRAINT `FKmaogsgux0dxjhpy4fitjqqg2u` FOREIGN KEY (`storeId`) REFERENCES `store` (`storeId`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

/*Data for the table `stock` */

insert  into `stock`(`quantityId`,`storeId`,`productId`,`quantity`) values 
(1,1,1,10),
(2,1,2,20),
(3,1,3,30),
(4,1,4,40),
(5,1,5,50),
(6,1,6,60),
(8,2,1,10),
(9,2,2,20),
(10,2,3,30),
(11,2,4,40),
(12,2,5,50),
(13,2,6,60),
(15,13,1,0),
(16,13,2,20),
(17,13,3,0),
(18,13,4,40),
(19,13,5,50),
(20,13,6,60);

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `storeId` bigint NOT NULL AUTO_INCREMENT,
  `storeName` varchar(20) NOT NULL,
  `storeAddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `storeTel` varchar(20) DEFAULT NULL,
  `storeOpen` varchar(20) NOT NULL,
  `storeClose` varchar(20) NOT NULL,
  `storeLat` double NOT NULL,
  `storeLng` double NOT NULL,
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;

/*Data for the table `store` */

insert  into `store`(`storeId`,`storeName`,`storeAddress`,`storeTel`,`storeOpen`,`storeClose`,`storeLat`,`storeLng`) values 
(1,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(2,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(3,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(4,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(5,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(6,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(7,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(8,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(9,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(10,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(11,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(12,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(13,'명동성당','서울 중구 명동길 74 (명동2가, 명동성당) ','02-318-6202  ','08:00  ','21:30  ',37.5633,126.9873),
(20,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(21,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(22,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(23,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(24,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(25,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(26,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(27,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(28,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(29,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(30,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(31,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(32,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(33,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(34,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(35,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(36,'청량리역사 2','서울 동대문구 경동시장로2길 45 (청량리동) 1층','02-3707-1367','08:00','22:00',37.5807,127.0483),
(37,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(38,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(39,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(40,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(41,'서강대','	\r\n서울특별시 마포구 백범로 21','02-711-7007','08:00','23:00',37.548,126.9445),
(42,'울산언양','	\r\n울산광역시 울주군 언양읍 읍성로 38, 1층','052-264-2082','09:00','22:00',35.5694,129.1259),
(43,'남양주법조타운','	\r\n경기 남양주시 다산동 6169 다산메인타워 109, 110, 111호','031-564-3335','08:30','22:00',37.5607,127.1589),
(44,'증미역','	\r\n서울시 강서구 등촌동 631-5 1층','02-2013-5678','08:00','22:00',37.6146,129.1259),
(45,'대구동대구','	\r\n대구광역시 동구 신천동 386-3','053-742-0242','08:30','22:30',35.8725,128.6294),
(46,'삼전역','	\r\n서울시 송파구 백제고분로 197, 1층 101호','02-425-5141','08:00','21:00',37.5029,127.3177),
(47,'대전반석','	\r\n대전광역시 유성구 북유성대로 303, 101~102호/104호','042-825-0605','08:00','23:00',36.388,129.1259),
(48,'하남시청역  ','경기 하남시 신평로 65 (신장동) ','031-794-2022  ','09:00  ','22:00  ',37.537,127.2041),
(49,'과천중앙','	\r\n경기도 과천시 별양상가 3로 14','02-504-3140','08:00','23:00',37.4257,126.9921),
(50,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483),
(51,'안성공도','경기도 안성시 공도읍 공도로 93','02-504-3140','08:00','22:00',36.9915,127.1721),
(52,'경복궁','	\r\n서울특별시 종로구 사직로 115','02-725-5926','07:30','21:30',37.5755,126.9764),
(53,'광화문','	\r\n서울특별시 종로구 새문안로 3길 19','02-723-7222','08:00','22:00',37.5726,126.973),
(54,'대전은행','	\r\n대전광역시 중구 대종로 488번길 25','042-221-7050','08:00','23:00',36.3336,127.4219),
(55,'대학로','	\r\n서울특별시 종로구 동숭길 101 현대엘리베이터','02-764-5656','08:30','22:30',37.5662,126.9752),
(56,'독립문','	\r\n서울특별시 종로구 송월길 155 경희궁자이4단지 상가 1층 4104-4106호','02-730-8255','07:00','21:00',37.5697,126.96340000000001),
(58,'안국','서울 종로구 우정국로 69 (수송동, 동일빌딩) 1층','02-735-9000','07:00','21:00',37.5739,126.9821),
(66,'종로5가','서울 종로구 종로 213-1 (종로5가) 1층','02-766-7537','08:00','22:00',37.5704,126.9922),
(67,'북촌','서울 종로구 율곡로 67 (계동) 1층','02-747-4400','07:00','21:00',37.5774,126.9867),
(68,'부산영도','부산 영도구 태종로 107 (영선동1가, 영도오션트라움)','051-417-7852','08:00','22:00',35.0911,129.0416),
(69,'동대문역','서울 종로구 종로 263-1 (종로6가)','02-747-9809','08:00','22:00',37.5712,126.9886),
(70,'더조은 종각2','서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','02-738-5001','9:30','10:00',37.5691,126.9847);

/*Table structure for table `store2` */

DROP TABLE IF EXISTS `store2`;

CREATE TABLE `store2` (
  `storeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `storeName` varchar(20) NOT NULL,
  `storeAddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `storeTel` varchar(20) NOT NULL,
  `storeOpen` varchar(20) NOT NULL,
  `storeClose` varchar(20) NOT NULL,
  `storeLat` double NOT NULL,
  `storeLng` double NOT NULL,
  `regDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;

/*Data for the table `store2` */

insert  into `store2`(`storeId`,`storeName`,`storeAddress`,`storeTel`,`storeOpen`,`storeClose`,`storeLat`,`storeLng`,`regDate`) values 
(1,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(2,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(3,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(4,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(5,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(6,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(7,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(8,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(9,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(10,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(11,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(12,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(13,'명동성당  ','서울 중구 명동길 74 (명동2가, 명동성당) ','02-318-6202  ','08:00  ','21:30  ',37.5633,126.9873,'2023-06-27 16:57:10'),
(20,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(21,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(22,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(23,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(24,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(25,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(26,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(27,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(28,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(29,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(30,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(31,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(32,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(33,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(34,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(35,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(36,'청량리역사 2','서울 동대문구 경동시장로2길 45 (청량리동) 1층','02-3707-1367','08:00','22:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(37,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(38,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(39,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(40,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(41,'서강대','	\r\n서울특별시 마포구 백범로 21','02-711-7007','08:00','23:00',37.548,126.9445,'2023-06-27 16:57:10'),
(42,'울산언양','	\r\n울산광역시 울주군 언양읍 읍성로 38, 1층','052-264-2082','09:00','22:00',35.5694,129.1259,'2023-06-27 16:57:10'),
(43,'남양주법조타운','	\r\n경기 남양주시 다산동 6169 다산메인타워 109, 110, 111호','031-564-3335','08:30','22:00',37.5607,127.1589,'2023-06-27 16:57:10'),
(44,'증미역','	\r\n서울시 강서구 등촌동 631-5 1층','02-2013-5678','08:00','22:00',37.6146,129.1259,'2023-06-27 16:57:10'),
(45,'대구동대구','	\r\n대구광역시 동구 신천동 386-3','053-742-0242','08:30','22:30',35.8725,128.6294,'2023-06-27 16:57:10'),
(46,'삼전역','	\r\n서울시 송파구 백제고분로 197, 1층 101호','02-425-5141','08:00','21:00',37.5029,127.3177,'2023-06-27 16:57:10'),
(47,'대전반석','	\r\n대전광역시 유성구 북유성대로 303, 101~102호/104호','042-825-0605','08:00','23:00',36.388,129.1259,'2023-06-27 16:57:10'),
(48,'하남시청역  ','경기 하남시 신평로 65 (신장동) ','031-794-2022  ','09:00  ','22:00  ',37.537,127.2041,'2023-06-27 16:57:10'),
(49,'과천중앙','	\r\n경기도 과천시 별양상가 3로 14','02-504-3140','08:00','23:00',37.4257,126.9921,'2023-06-27 16:57:10'),
(50,'청량리역사','	\r\n서울특별시 동대문구 왕산로 214','02-3707-1367','08:00','23:00',37.5807,127.0483,'2023-06-27 16:57:10'),
(51,'안성공도','경기도 안성시 공도읍 공도로 93','02-504-3140','08:00','22:00',36.9915,127.1721,'2023-06-27 16:57:10'),
(52,'경복궁','	\r\n서울특별시 종로구 사직로 115','02-725-5926','07:30','21:30',37.5755,126.9764,'2023-06-27 16:57:10'),
(53,'광화문','	\r\n서울특별시 종로구 새문안로 3길 19','02-723-7222','08:00','22:00',37.5726,126.973,'2023-06-27 16:57:10'),
(54,'대전은행','	\r\n대전광역시 중구 대종로 488번길 25','042-221-7050','08:00','23:00',36.3336,127.4219,'2023-06-27 16:57:10'),
(55,'대학로','	\r\n서울특별시 종로구 동숭길 101 현대엘리베이터','02-764-5656','08:30','22:30',37.5662,126.9752,'2023-06-27 16:57:10'),
(56,'독립문','	\r\n서울특별시 종로구 송월길 155 경희궁자이4단지 상가 1층 4104-4106호','02-730-8255','07:00','21:00',37.5697,126.96340000000001,'2023-06-27 16:57:10'),
(58,'안국','서울 종로구 우정국로 69 (수송동, 동일빌딩) 1층','02-735-9000','07:00','21:00',37.5739,126.9821,'2023-06-27 16:57:10'),
(66,'종로5가','서울 종로구 종로 213-1 (종로5가) 1층','02-766-7537','08:00','22:00',37.5704,126.9922,'2023-06-27 16:57:10'),
(67,'북촌','서울 종로구 율곡로 67 (계동) 1층','02-747-4400','07:00','21:00',37.5774,126.9867,'2023-06-27 16:57:10'),
(68,'부산영도','부산 영도구 태종로 107 (영선동1가, 영도오션트라움)','051-417-7852','08:00','22:00',35.0911,129.0416,'2023-06-27 16:57:10'),
(69,'동대문역','서울 종로구 종로 263-1 (종로6가)','02-747-9809','08:00','22:00',37.5712,126.9886,'2023-06-27 16:57:10'),
(70,'더조은 종각2','서울 종로구 삼일대로17길 51 (관철동, 스타골드빌딩) 5층','02-738-5001','9:30','10:00',37.5691,126.9847,'2023-06-27 16:57:10'),
(71,'aaa','aaa','aaa','aaa','aaa',111,222,'2023-06-27 17:58:34');

/*Table structure for table `tbl_memo` */

DROP TABLE IF EXISTS `tbl_memo`;

CREATE TABLE `tbl_memo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `memoText` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tbl_memo` */

insert  into `tbl_memo`(`id`,`memoText`) values 
(1,'Sample...1'),
(2,'Sample...2'),
(3,'Sample...3'),
(4,'Sample...4'),
(5,'Sample...5'),
(6,'Sample...6'),
(7,'Sample...7'),
(8,'Sample...8'),
(9,'Sample...9'),
(10,'Sample...10'),
(11,'Sample...1'),
(12,'Sample...2'),
(13,'Sample...3'),
(14,'Sample...4'),
(15,'Sample...5'),
(16,'Sample...6'),
(17,'Sample...7'),
(18,'Sample...8'),
(19,'Sample...9'),
(20,'Sample...10'),
(21,'Sample...1'),
(22,'Sample...2'),
(23,'Sample...3'),
(24,'Sample...4'),
(25,'Sample...5'),
(26,'Sample...6'),
(27,'Sample...7'),
(28,'Sample...8'),
(29,'Sample...9'),
(30,'Sample...10'),
(31,'Sample...1'),
(32,'Sample...2'),
(33,'Sample...3'),
(34,'Sample...4'),
(35,'Sample...5'),
(36,'Sample...6'),
(37,'Sample...7'),
(38,'Sample...8'),
(39,'Sample...9'),
(40,'Sample...10'),
(41,'Sample...1'),
(42,'Sample...2'),
(43,'Sample...3'),
(44,'Sample...4'),
(45,'Sample...5'),
(46,'Sample...6'),
(47,'Sample...7'),
(48,'Sample...8'),
(49,'Sample...9'),
(50,'Sample...10');

/*Table structure for table `topping` */

DROP TABLE IF EXISTS `topping`;

CREATE TABLE `topping` (
  `toppingId` int NOT NULL AUTO_INCREMENT,
  `toppingName` varchar(255) NOT NULL,
  `toppingType` varchar(255) NOT NULL,
  `toppingPrice` int NOT NULL,
  PRIMARY KEY (`toppingId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `topping` */

insert  into `topping`(`toppingId`,`toppingName`,`toppingType`,`toppingPrice`) values 
(1,'오이','토핑',0),
(2,'파인애플','토핑',0),
(3,'풋콩','토핑',0),
(4,'병아리콩','토핑',0),
(5,'렌틸콩','토핑',0),
(6,'적양파','토핑',0),
(7,'콘샐러드','토핑',0),
(8,'날치알','토핑',0),
(9,'레디쉬','토핑',0),
(10,'올리브','토핑',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`password`,`username`) values 
(1,'aa@aa','$2a$10$jwt8iqfxz0QrUWZPsKRpZeytLDBhyKHS5RXa2idxrtYXzh4M6XLfu','aaa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

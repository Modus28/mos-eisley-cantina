-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: bar
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `billNum` int(10) NOT NULL,
  `c_id` int(10) DEFAULT NULL,
  `e_id` int(5) DEFAULT NULL,
  `tip` int(5) NOT NULL,
  PRIMARY KEY (`billNum`),
  KEY `customer_bill_fk_idx` (`c_id`),
  KEY `employee_bill_fk_idx` (`e_id`),
  CONSTRAINT `customer_bill_fk` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employee_bill_fk` FOREIGN KEY (`e_id`) REFERENCES `employee` (`e_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` VALUES (0,0,0,5),(1,1,1,4),(10,10,10,6),(11,11,11,9),(100,100,100,30),(101,101,101,8),(110,110,110,6),(111,111,111,7),(1000,1000,1000,120),(1001,1001,1001,3),(1011,1011,0,5),(1100,1100,1,9),(1101,1101,10,258),(1110,1110,11,1),(1111,1111,100,88),(10000,10000,101,9),(10001,10001,110,12),(10010,10010,111,36),(10011,10011,1000,67),(10100,10100,1001,8),(10101,0,0,66),(10110,100,1,22),(10111,1100,10,5),(11000,110,11,89),(11001,101,100,506),(11010,111,101,1),(11011,1101,111,2),(11100,100,1000,23),(11101,10100,1001,29);
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drinks`
--

DROP TABLE IF EXISTS `Drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drinks` (
  `d_id` int(5) NOT NULL,
  `dname` varchar(25) NOT NULL,
  `p_id` int(5) DEFAULT NULL,
  `alchohol` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `priceTable_drinks_fk_idx` (`p_id`),
  CONSTRAINT `priceTable_drinks_fk` FOREIGN KEY (`p_id`) REFERENCES `priceTable` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drinks`
--

LOCK TABLES `Drinks` WRITE;
/*!40000 ALTER TABLE `Drinks` DISABLE KEYS */;
INSERT INTO `Drinks` VALUES (1,'fuzzy navel',5,1),(2,'martini',4,1),(3,'bloody mary',3,1),(4,'margarita',3,1),(5,'rum punch',4,1),(6,'Mai Tai',5,1),(7,'vodka',3,1),(8,'beer',2,1),(9,'captian morgan',3,1),(10,'Spiked Lemondae',5,1),(11,'whiskey',3,1),(12,'hurricane',4,1),(13,'bahama mama',4,1),(14,'mojitos',3,1),(15,'Rasberry Daiquiri',4,1),(16,'Pina Colada',4,1),(17,'fountain drinks',1,0),(18,'water',0,0),(19,'juice',2,0),(20,'smoothie',3,0);
/*!40000 ALTER TABLE `Drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_id` int(5) NOT NULL,
  `cname` varchar(45) NOT NULL,
  `age` int(3) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (0,'Artanis',600),(1,'Zeratul',700),(10,'Abathur',50),(11,'Raynor',38),(100,'Kerrigen',35),(101,'Nova',21),(110,'Tassadar',800),(111,'Diablo',999),(1000,'Tyrael',999),(1001,'Zagara',10),(1010,'Dehaka',67),(1011,'Auriel',999),(1100,'Azmodan',400),(1101,'Tychus',40),(1110,'Xul',60),(1111,'Sylvanas',25),(10000,'Jaina',30),(10001,'Varian',35),(10010,'Li Li',15),(10011,'Rexxar',50),(10100,'Medivh',40);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinkpurchase`
--

DROP TABLE IF EXISTS `drinkpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drinkpurchase` (
  `billNum` int(10) NOT NULL,
  `d_id` int(5) NOT NULL,
  `qty` int(5) DEFAULT NULL,
  PRIMARY KEY (`billNum`,`d_id`),
  KEY `drinks_drinkpurchase_fk_idx` (`d_id`),
  CONSTRAINT `bill_drinkpurchase_fk` FOREIGN KEY (`billNum`) REFERENCES `Bill` (`billNum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `drinks_drinkpurchase_fk` FOREIGN KEY (`d_id`) REFERENCES `Drinks` (`d_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkpurchase`
--

LOCK TABLES `drinkpurchase` WRITE;
/*!40000 ALTER TABLE `drinkpurchase` DISABLE KEYS */;
INSERT INTO `drinkpurchase` VALUES (0,3,1),(0,18,2),(1,4,2),(1,11,2),(1,16,1),(1,18,2),(10,9,2),(10,17,1),(10,18,3),(11,2,1),(11,19,1);
/*!40000 ALTER TABLE `drinkpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `e_id` int(5) NOT NULL,
  `ename` varchar(45) NOT NULL,
  `salary` float DEFAULT NULL,
  `datehired` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'Hinata',2000,'12/15'),(1,'Kotori',5000,'1/1'),(10,'Umi',7500,'1/1'),(11,'Sakura',3000,'6/3'),(100,'Ruby',1500,'7/30'),(101,'Honoka',2500,'9/10'),(110,'Aoi',3600,'4/2'),(111,'Rin',3100,'9/10'),(1000,'Kekyo',1000,'10/30'),(1001,'Kagome',4100,'8/25');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooditem`
--

DROP TABLE IF EXISTS `fooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fooditem` (
  `f_id` int(5) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `p_id` int(10) DEFAULT NULL,
  `vegan` tinyint(1) DEFAULT NULL,
  `glutenfree` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `priceTable_fooditem_fk_idx` (`p_id`),
  CONSTRAINT `priceTable_fooditem_fk` FOREIGN KEY (`p_id`) REFERENCES `priceTable` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooditem`
--

LOCK TABLES `fooditem` WRITE;
/*!40000 ALTER TABLE `fooditem` DISABLE KEYS */;
INSERT INTO `fooditem` VALUES (1,'onion rings',4,1,0),(2,'fries',3,1,0),(3,'chicken wings',7,0,0),(4,'potato skins',6,0,0),(5,'nachos',5,0,0),(6,'loaded nachos',8,0,0),(7,'soft pretzles',8,0,0),(8,'chips and salsa',5,1,0),(9,'spinach and artichoke dip',4,1,1),(10,'BBQ pork sandwhich',9,0,0),(11,'gyro',9,0,0);
/*!40000 ALTER TABLE `fooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodpurchase`
--

DROP TABLE IF EXISTS `foodpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodpurchase` (
  `billNum` int(10) NOT NULL,
  `f_id` int(5) NOT NULL,
  `qty` int(5) DEFAULT NULL,
  PRIMARY KEY (`billNum`,`f_id`),
  KEY `fooditem_foodpurchase_fk_idx` (`f_id`),
  CONSTRAINT `bill_foodpurchase_fk` FOREIGN KEY (`billNum`) REFERENCES `Bill` (`billNum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fooditem_foodpurchase_fk` FOREIGN KEY (`f_id`) REFERENCES `fooditem` (`f_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodpurchase`
--

LOCK TABLES `foodpurchase` WRITE;
/*!40000 ALTER TABLE `foodpurchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `m_id` int(5) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `e_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `employee_manager_fk_idx` (`e_id`),
  CONSTRAINT `employee_manager_fk` FOREIGN KEY (`e_id`) REFERENCES `employee` (`e_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priceTable`
--

DROP TABLE IF EXISTS `priceTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priceTable` (
  `p_id` int(5) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priceTable`
--

LOCK TABLES `priceTable` WRITE;
/*!40000 ALTER TABLE `priceTable` DISABLE KEYS */;
INSERT INTO `priceTable` VALUES (0,0),(1,1),(2,2),(3,5),(4,7),(5,10),(6,12),(7,15),(8,17),(9,20);
/*!40000 ALTER TABLE `priceTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-12 20:33:53

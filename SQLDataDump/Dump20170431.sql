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
  CONSTRAINT `customer_bill_fk` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `employee_bill_fk` FOREIGN KEY (`e_id`) REFERENCES `employee` (`e_id`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  CONSTRAINT `priceTable_drinks_fk` FOREIGN KEY (`p_id`) REFERENCES `priceTable` (`p_id`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  CONSTRAINT `bill_drinkpurchase_fk` FOREIGN KEY (`billNum`) REFERENCES `Bill` (`billNum`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `drinks_drinkpurchase_fk` FOREIGN KEY (`d_id`) REFERENCES `Drinks` (`d_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkpurchase`
--

LOCK TABLES `drinkpurchase` WRITE;
/*!40000 ALTER TABLE `drinkpurchase` DISABLE KEYS */;
INSERT INTO `drinkpurchase` VALUES (0,3,1),(0,18,2),(1,4,2),(1,11,2),(1,16,1),(1,18,2),(10,9,2),(10,17,1),(10,18,3),(11,2,1),(11,19,1),(100,5,1),(100,6,1),(101,20,1),(110,3,1),(111,8,1),(111,18,1),(1000,4,1),(1000,19,1),(1001,18,1),(1011,1,1),(1100,6,1),(1101,7,1),(1101,18,1),(1110,18,1),(1111,4,1),(1111,5,1);
/*!40000 ALTER TABLE `drinkpurchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE Trigger CheckIfCustomerIsOver21 before insert on drinkpurchase
for each row 
begin
	if ((SELECT Drinks.alchohol from bar.Drinks WHERE NEW.d_id = Drinks.d_id) = 1 and (SELECT age from Customer, Bill Where Bill.billNum = New.billNum and Bill.c_id = Customer.c_id) < 21)
	then 
	signal sqlstate '45000' set message_text = 'Cannot by drink, customer underage';
end if;
end;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `m_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'Hinata',2000,'12/15',5),(1,'Kotori',5000,'1/1',5),(5,'Bob',21000,'12/15',NULL),(10,'Umi',7500,'1/1',5),(11,'Sakura',3000,'6/3',5),(100,'Ruby',1500,'7/30',5),(101,'Honoka',2500,'9/10',5),(110,'Aoi',3600,'4/2',5),(111,'Rin',3100,'9/10',5),(1000,'Kekyo',1000,'10/30',5),(1001,'Kagome',4100,'8/25',5);
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
  CONSTRAINT `priceTable_fooditem_fk` FOREIGN KEY (`p_id`) REFERENCES `priceTable` (`p_id`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  CONSTRAINT `bill_foodpurchase_fk` FOREIGN KEY (`billNum`) REFERENCES `Bill` (`billNum`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fooditem_foodpurchase_fk` FOREIGN KEY (`f_id`) REFERENCES `fooditem` (`f_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodpurchase`
--

LOCK TABLES `foodpurchase` WRITE;
/*!40000 ALTER TABLE `foodpurchase` DISABLE KEYS */;
INSERT INTO `foodpurchase` VALUES (0,1,2),(0,10,1),(1,3,2),(1,5,2),(1,6,1),(1,7,2),(10,4,1),(10,6,3),(10,8,2),(11,1,1),(11,2,1),(100,2,1),(100,5,1),(100,10,2),(101,3,1),(101,4,2),(101,8,1),(110,5,1),(110,7,3),(110,9,1),(110,11,3),(111,1,1),(111,2,3),(111,3,1),(1000,3,1),(1000,5,1),(1000,7,1),(1000,9,1),(1001,2,1),(1001,4,2),(1001,8,2),(1001,10,1),(1011,2,1),(1011,3,2),(1011,6,1),(1011,9,1),(1100,5,1),(1100,6,1),(1100,7,1),(1100,11,1),(1101,2,1),(1101,3,2),(1101,9,1),(1101,10,1),(1110,1,1),(1110,2,1),(1110,3,2),(1110,5,1),(1110,10,1),(1110,11,1),(1111,1,1),(1111,5,2),(1111,9,1),(1111,10,1),(1111,11,1),(10000,1,1),(10000,4,1),(10000,8,1),(10001,1,1),(10001,5,1),(10001,7,1),(10001,8,1),(10001,11,1),(10010,2,2),(10010,3,2),(10011,1,1),(10011,2,2),(10011,3,1),(10011,4,1),(10011,5,1),(10011,6,1),(10100,1,1),(10100,2,1),(10100,6,1),(10100,11,1),(10101,11,2),(10110,1,1),(10110,2,2),(10111,1,1),(11000,3,1),(11000,4,2),(11001,1,1),(11001,2,1),(11001,3,1),(11010,3,1),(11010,7,1),(11010,9,1),(11011,9,1),(11011,10,1),(11100,11,3),(11101,10,1);
/*!40000 ALTER TABLE `foodpurchase` ENABLE KEYS */;
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

--
-- Dumping routines for database 'bar'
--
/*!50003 DROP PROCEDURE IF EXISTS `dynamic1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dynamic1`(c_id integer(5))
BEGIN
SET @q1 =CONCAT("select bill.billNum, sum(priceTable.price * foodpurchase.qty)
from foodpurchase, bill, fooditem, priceTable
where foodpurchase.billNum = bill.billNum
and bill.c_id =", c_id," and fooditem.f_id = foodpurchase.f_id
and fooditem.p_id = priceTable.p_id
group by(bill.billNum)");
Prepare stmt1 From @q1;
execute stmt1;
deallocate prepare stmt1;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sumfoodpurchaseofcustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sumfoodpurchaseofcustomer`(c_id integer(5))
BEGIN
SET @q1 =CONCAT("select bill.billNum, sum(priceTable.price * foodpurchase.qty)
from foodpurchase, bill, fooditem, priceTable
where foodpurchase.billNum = bill.billNum
and bill.c_id =", c_id," and fooditem.f_id = foodpurchase.f_id
and fooditem.p_id = priceTable.p_id
group by(bill.billNum)");
Prepare stmt1 From @q1;
execute stmt1;
deallocate prepare stmt1;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-29 15:28:20

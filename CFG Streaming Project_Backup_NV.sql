-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: cfg_streaming_project
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `average_genre_performance_and_budget`
--

DROP TABLE IF EXISTS `average_genre_performance_and_budget`;
/*!50001 DROP VIEW IF EXISTS `average_genre_performance_and_budget`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `average_genre_performance_and_budget` AS SELECT 
 1 AS `Genre`,
 1 AS `Average_Budget`,
 1 AS `Average_Genre_Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `Budget_ID` varchar(10) NOT NULL,
  `Total_Budget` int DEFAULT NULL,
  `Talent_Cost` int DEFAULT NULL,
  `Set_Cost` int DEFAULT NULL,
  `Equipment_Cost` int DEFAULT NULL,
  `Marketing_Cost` int DEFAULT NULL,
  `Company_ID` varchar(10) DEFAULT NULL,
  `Country_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Budget_ID`),
  KEY `Company_ID` (`Company_ID`),
  KEY `Country_ID` (`Country_ID`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `production_company` (`Company_ID`),
  CONSTRAINT `budget_ibfk_2` FOREIGN KEY (`Country_ID`) REFERENCES `production_country` (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES ('B1',680,155,165,175,185,'COM1','C1'),('B10',500,110,120,130,140,'COM2','C3'),('B11',480,105,115,125,135,'COM2','C6'),('B12',460,100,110,120,130,'COM4','C7'),('B13',440,95,105,115,125,'COM4','C8'),('B14',420,90,100,110,120,'COM4','C10'),('B15',400,85,95,105,115,'COM3','C5'),('B16',380,80,90,100,110,'COM3','C5'),('B17',360,75,85,95,105,'COM3','C5'),('B18',340,70,80,90,100,'COM3','C5'),('B19',320,65,75,85,95,'COM1','C1'),('B2',660,150,160,170,180,'COM2','C2'),('B20',300,60,70,80,90,'COM1','C1'),('B21',280,55,65,75,85,'COM1','C1'),('B22',260,50,60,70,80,'COM1','C1'),('B23',240,45,55,65,75,'COM2','C3'),('B24',220,40,50,60,70,'COM2','C3'),('B25',200,35,45,55,65,'COM2','C3'),('B26',180,30,40,50,60,'COM3','C5'),('B27',160,25,35,45,55,'COM3','C5'),('B28',140,20,30,40,50,'COM1','C1'),('B29',120,15,25,35,45,'COM1','C1'),('B3',640,145,155,165,175,'COM3','C3'),('B30',100,10,20,30,40,'COM1','C2'),('B4',620,140,150,160,170,'COM4','C4'),('B5',600,135,145,155,165,'COM1','C5'),('B6',580,130,140,150,160,'COM1','C1'),('B7',560,125,135,145,155,'COM1','C1'),('B8',540,120,130,140,150,'COM1','C1'),('B9',520,115,125,135,145,'COM1','C2');
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `budget_and_rating_by_company`
--

DROP TABLE IF EXISTS `budget_and_rating_by_company`;
/*!50001 DROP VIEW IF EXISTS `budget_and_rating_by_company`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `budget_and_rating_by_company` AS SELECT 
 1 AS `Content_ID`,
 1 AS `Title`,
 1 AS `Genre`,
 1 AS `Rating`,
 1 AS `Budget`,
 1 AS `Production_Company`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `Content_ID` varchar(10) NOT NULL,
  `Content_Type` varchar(20) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Available_Globally` enum('Yes','No') DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `Genre` varchar(20) DEFAULT NULL,
  `Budget_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Content_ID`),
  KEY `content_ibfk_1` (`Budget_ID`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`Budget_ID`) REFERENCES `budget` (`Budget_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES ('CON1','Series','The Night Agent','Yes','2023-03-23','Thriller','B1'),('CON10','Series','FUBAR','Yes','2023-05-25','Comedy','B10'),('CON11','Series','Manifest','Yes','2022-11-04','Drama','B11'),('CON12','Series','Kaleidoscope: Limited Series','Yes','2023-01-01','Thriller','B12'),('CON13','Series','Firefly Lane','Yes','2022-12-02','Drama','B13'),('CON14','Movie','The Mother','Yes','2023-05-12','Action','B14'),('CON15','Series','Physical: 100','Yes','2023-01-24','Reality','B15'),('CON16','Series','Crash Course in Romance: Limited Series // 일타 스캔들: 리미티드 시리즈','Yes','2023-01-14','Drama','B16'),('CON17','Series','Love Is Blind','Yes','2023-03-24','Reality','B17'),('CON18','Series','BEEF','Yes','2023-04-06','Drama','B18'),('CON19','Series','The Diplomat','Yes','2023-04-20','Thriller','B19'),('CON2','Series','Ginny & Georgia','Yes','2023-01-05','Drama','B2'),('CON20','Movie','Luther: The Fallen Sun','Yes','2023-03-10','Thriller','B20'),('CON21','Series','Fake Profile','No','2023-05-31','Thriller','B21'),('CON22','Series','Vikings: Valhalla','Yes','2023-01-12','Drama','B22'),('CON23','Movie','Extraction 2','Yes','2023-06-16','Action','B23'),('CON24','Series','XO, Kitty','Yes','2023-05-18','Comedy','B24'),('CON25','Series','Doctor Cha: Limited Series // 닥터 차정숙: 리미티드 시리즈','Yes','2023-04-15','Drama','B25'),('CON26','Series','Shadow and Bone','Yes','2023-03-16','Drama','B26'),('CON27','Series','Griselda','Yes','2020-04-15','Drama','B27'),('CON28','Series','Sweet Tooth','Yes','2023-04-27','Drama','B28'),('CON29','Movie','You People','Yes','2023-01-27','Comedy','B29'),('CON3','Series','The Glory','Yes','2022-12-30','Thriller','B3'),('CON30','Series','Perfect Match','Yes','2023-02-14','Reality','B30'),('CON31','Series','Avatar: The Last Airbender Season 1','Yes','2024-02-23','Fantasy','B4'),('CON32','Series','Never Have I Ever Season 3','Yes','2023-09-01','Comedy','B6'),('CON4','Series','Wednesday','Yes','2022-11-23','Comedy','B4'),('CON5','Series','Queen Charlotte: A Bridgerton Story','Yes','2023-05-04','Drama','B5'),('CON6','Series','You','Yes','2023-02-09','Thriller','B6'),('CON7','Series','La Reina del Sur','No','2022-12-30','Telenovela','B7'),('CON8','Series','Outer Banks','Yes','2023-02-23','Drama','B8'),('CON9','Series','Fool Me Once','Yes','2021-02-24','Drama','B9');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Update_Release_Date` AFTER INSERT ON `content` FOR EACH ROW BEGIN
	DECLARE Content_Country_ID VARCHAR(10);
    SELECT Country_ID INTO Content_Country_ID FROM Budget WHERE Budget_ID = NEW.Budget_ID;
    UPDATE Production_Country
	SET Last_Production_Release_Date = (
		SELECT MAX(Release_Date)
        FROM Content
        WHERE Country_ID = Content_Country_ID)
    WHERE Country_ID = Content_Country_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance` (
  `Performance_ID` varchar(10) NOT NULL,
  `Hours_Viewed` int DEFAULT NULL,
  `Average_Rating` decimal(2,1) DEFAULT NULL,
  `Social_Media_Impressions` int DEFAULT NULL,
  `Content_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Performance_ID`),
  KEY `Content_ID` (`Content_ID`),
  CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content` (`Content_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES ('P1',8121,3.4,1359,'CON1'),('P10',2662,3.4,1264,'CON10'),('P11',2626,4.4,1244,'CON11'),('P12',2525,3.4,1235,'CON12'),('P13',2515,2.8,1207,'CON13'),('P14',2499,3.9,1205,'CON14'),('P15',2350,4.3,1017,'CON15'),('P16',2348,5.0,999,'CON16'),('P17',2297,2.5,999,'CON17'),('P18',2211,3.8,995,'CON18'),('P19',2141,3.4,990,'CON19'),('P2',6651,4.4,1348,'CON2'),('P20',2097,4.4,985,'CON20'),('P21',2065,3.4,978,'CON21'),('P22',2055,2.8,976,'CON22'),('P23',2018,3.9,964,'CON23'),('P24',2007,4.3,958,'CON24'),('P25',1947,5.0,957,'CON25'),('P26',1929,2.5,951,'CON26'),('P27',1840,3.8,950,'CON27'),('P28',1823,3.4,947,'CON28'),('P29',1818,4.4,1359,'CON29'),('P3',6228,3.4,1336,'CON3'),('P30',1768,3.4,1348,'CON30'),('P4',5077,2.8,1335,'CON4'),('P5',5030,3.9,1334,'CON5'),('P6',4406,4.3,1321,'CON6'),('P7',4296,5.0,1307,'CON7'),('P8',4025,2.5,1292,'CON8'),('P9',3021,3.8,1291,'CON9');
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_company`
--

DROP TABLE IF EXISTS `production_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_company` (
  `Company_ID` varchar(10) NOT NULL,
  `Production_Company` varchar(50) DEFAULT NULL,
  `Contact_Name` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_company`
--

LOCK TABLES `production_company` WRITE;
/*!40000 ALTER TABLE `production_company` DISABLE KEYS */;
INSERT INTO `production_company` VALUES ('COM1','Netflix Original','jane.doe@netflix.com','Head of Productions'),('COM2','Paramount Pictures','sabrinacarpenter@paramount.com','Vice President of Productions'),('COM3','Columbia Pictures','alex.jones@columbiapictures.com','EVP of Productions'),('COM4','The Walt Disney Company','elizabeth.smith@disney.com','Senior Manager of Productions');
/*!40000 ALTER TABLE `production_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_country`
--

DROP TABLE IF EXISTS `production_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_country` (
  `Country_ID` varchar(10) NOT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  `Is_Netflix_Available` enum('Yes','No') DEFAULT NULL,
  `Last_Production_Release_Date` date DEFAULT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_country`
--

LOCK TABLES `production_country` WRITE;
/*!40000 ALTER TABLE `production_country` DISABLE KEYS */;
INSERT INTO `production_country` VALUES ('C1','USA','Yes','2023-09-01'),('C10','China','No','2022-11-23'),('C2','UK','Yes','2023-01-05'),('C3','Korea','Yes','2022-12-30'),('C4','Brazil','Yes','2024-02-23'),('C5','India','No','2023-05-04'),('C6','Poland','No','2023-02-09'),('C7','Turkey','Yes','2022-12-30'),('C8','France','Yes','2022-11-23');
/*!40000 ALTER TABLE `production_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cfg_streaming_project'
--

--
-- Dumping routines for database 'cfg_streaming_project'
--
/*!50003 DROP FUNCTION IF EXISTS `Renew_Content` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Renew_Content`(
    hours_viewed INT
) RETURNS varchar(5) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE renewal_status VARCHAR(20);
    IF hours_viewed > 3000 THEN
        SET renewal_status = 'YES';
    ELSEIF (hours_viewed >= 2500 AND 
            hours_viewed <= 3000) THEN
        SET renewal_status = 'MAYBE';
    ELSEIF hours_viewed < 2500 THEN
        SET renewal_status = 'NO';
    END IF;
    RETURN (renewal_status);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `average_genre_performance_and_budget`
--

/*!50001 DROP VIEW IF EXISTS `average_genre_performance_and_budget`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_genre_performance_and_budget` AS select `c`.`Genre` AS `Genre`,round(avg(`b`.`Total_Budget`),2) AS `Average_Budget`,round(avg(`p`.`Average_Rating`),2) AS `Average_Genre_Rating` from ((`content` `c` join `budget` `b` on((`c`.`Budget_ID` = `b`.`Budget_ID`))) join `performance` `p` on((`c`.`Content_ID` = `p`.`Content_ID`))) where (`c`.`Genre` in ('Drama','Action','Thriller','Comedy','Reality')) group by `c`.`Genre` order by `Average_Budget` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `budget_and_rating_by_company`
--

/*!50001 DROP VIEW IF EXISTS `budget_and_rating_by_company`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `budget_and_rating_by_company` AS select `c`.`Content_ID` AS `Content_ID`,`c`.`Title` AS `Title`,`c`.`Genre` AS `Genre`,`p`.`Average_Rating` AS `Rating`,`b`.`Total_Budget` AS `Budget`,`pc`.`Production_Company` AS `Production_Company` from (((`content` `c` join `performance` `p` on((`c`.`Content_ID` = `p`.`Content_ID`))) join `budget` `b` on((`c`.`Budget_ID` = `b`.`Budget_ID`))) join `production_company` `pc` on((`b`.`Company_ID` = `pc`.`Company_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 20:13:33

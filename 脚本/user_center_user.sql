-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: user_center
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `wx_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信id',
  `wx_nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `roles` varchar(100) NOT NULL DEFAULT '' COMMENT '角色',
  `avatar_url` varchar(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `bonus` int(11) NOT NULL DEFAULT '300' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='分享';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'','weq','','xxx','2020-10-27 06:28:11','2020-10-27 06:28:11',100),(2,'','tom','','xxx','2020-10-27 06:28:50','2020-10-27 06:28:50',100),(3,'','swordman','','xxx','2020-10-27 06:28:50','2020-10-27 06:28:50',100),(4,'','jetty','','xxx','2020-10-27 06:28:51','2020-10-27 06:28:51',100),(5,'','','','xxx','2020-10-27 06:28:51','2020-10-27 06:28:51',100),(6,'','','','xxx','2020-10-27 06:28:51','2020-10-27 06:28:51',100),(7,'','','','xxx','2020-10-27 06:28:51','2020-10-27 06:28:51',100),(8,'','','','xxx','2020-10-27 06:28:52','2020-10-27 06:28:52',100),(9,'','','','xxx','2020-10-27 06:28:52','2020-10-27 06:28:52',100),(10,'','','','xxx','2020-10-27 06:28:52','2020-10-27 06:28:52',100),(11,'','','','xxx','2020-10-27 06:28:52','2020-10-27 06:28:52',100),(12,'','','','xxx','2020-10-27 06:28:53','2020-10-27 06:28:53',100),(13,'','','','xxx','2020-10-27 06:28:53','2020-10-27 06:28:53',100),(14,'','','','xxx','2020-10-27 06:28:53','2020-10-27 06:28:53',100),(15,'','','','xxx','2020-10-27 06:28:53','2020-10-27 06:28:53',100),(16,'','','','xxx','2020-10-27 06:28:53','2020-10-27 06:28:53',100),(17,'','','','xxx','2020-10-27 06:28:54','2020-10-27 06:28:54',100),(18,'','','','xxx','2020-10-27 06:28:54','2020-10-27 06:28:54',100),(19,'','','','xxx','2020-11-22 10:00:27','2020-11-22 10:00:27',100);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-18 16:25:07

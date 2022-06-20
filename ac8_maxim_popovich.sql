-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ac8_maxim_popovich
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Intel'),(2,'AMD'),(3,'Elbrus'),(4,'Baikal'),(5,'');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Процессор'),(2,'ОЗУ'),(3,'HDD'),(4,'Motherboard');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counterpartyes`
--

DROP TABLE IF EXISTS `counterpartyes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counterpartyes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `counterparty` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counterpartyes`
--

LOCK TABLES `counterpartyes` WRITE;
/*!40000 ALTER TABLE `counterpartyes` DISABLE KEYS */;
INSERT INTO `counterpartyes` VALUES (1,'counterparty_1'),(2,'counterparty_2'),(3,'counterparty_3');
/*!40000 ALTER TABLE `counterpartyes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movements_products`
--

DROP TABLE IF EXISTS `movements_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movements_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_products_taken_id` int DEFAULT NULL,
  `stock_products_placed_id` int DEFAULT NULL,
  `counterparty_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stock_products_taken` (`stock_products_taken_id`),
  KEY `FK_stock_products_placed` (`stock_products_placed_id`),
  KEY `FK_counterparty` (`counterparty_id`),
  KEY `FK_product_movements` (`product_id`),
  CONSTRAINT `FK_counterparty` FOREIGN KEY (`counterparty_id`) REFERENCES `counterpartyes` (`id`),
  CONSTRAINT `FK_product_movements` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_stock_products_placed` FOREIGN KEY (`stock_products_placed_id`) REFERENCES `stocks` (`id`),
  CONSTRAINT `FK_stock_products_taken` FOREIGN KEY (`stock_products_taken_id`) REFERENCES `stocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movements_products`
--

LOCK TABLES `movements_products` WRITE;
/*!40000 ALTER TABLE `movements_products` DISABLE KEYS */;
INSERT INTO `movements_products` VALUES (1,1,NULL,1,5,20,'2012-01-12'),(2,NULL,2,1,4,10,'2013-01-12'),(3,1,3,NULL,7,20,'2014-05-12'),(4,3,1,NULL,7,11,'2012-01-12'),(5,1,NULL,3,3,25,'2011-05-12'),(6,NULL,3,1,3,5,'2017-08-12'),(7,2,NULL,2,2,30,'2016-09-12'),(8,NULL,1,1,5,20,'2015-01-12'),(9,NULL,1,1,5,30,'2018-01-12'),(10,1,NULL,1,9,30,'2015-01-12');
/*!40000 ALTER TABLE `movements_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` varchar(20) NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_brand` (`brand_id`),
  KEY `FK_category` (`category_id`),
  CONSTRAINT `FK_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Core I7 9990',1,1),(2,'Core I9 1120',1,1),(3,'Ryzen 3 1200',2,1),(4,'elbrus-16c',3,1),(5,' Baikal M2',4,1),(6,'ElbrusOZU',3,2),(7,'BaikalHDD',4,3),(8,'Intel lga-1155',1,4),(9,'AmdDisk',2,3),(10,'BaikalMother',3,4),(11,'IntelOzu',4,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,'stock_1'),(2,'stock_2'),(3,'stock_3');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-14 18:29:37

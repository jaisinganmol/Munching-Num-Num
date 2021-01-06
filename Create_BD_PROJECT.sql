
drop schema if exists yelpdb;

create schema yelpdb;
use yelpdb;

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `business` (
  `business_id` char(22) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `business_address` varchar(150) NOT NULL,
  `business_state` varchar(50) NOT NULL,
  `business_city` varchar(50) NOT NULL,
  `business_is_open` int(11) DEFAULT NULL,
  `business_latitude` double DEFAULT NULL,
  `business_longitude` double DEFAULT NULL,
  `business_postal_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `business_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `business_attributes` (
  `business_id` char(22) NOT NULL,
  `bike_parking` tinyint(1) DEFAULT NULL,
  `business_accepts_bitcoin` tinyint(1) DEFAULT NULL,
  `business_accepts_creaditcard` tinyint(1) DEFAULT NULL,
  `garage_parking` tinyint(1) DEFAULT NULL,
  `street_parking` tinyint(1) DEFAULT NULL,
  `dogs_allowed` tinyint(1) DEFAULT NULL,
  `price_range` smallint(6) DEFAULT NULL,
  `wheelchair_access` tinyint(1) DEFAULT NULL,
  `valet_parking` tinyint(1) DEFAULT NULL,
  `parking_lot` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`business_id`),
  CONSTRAINT `business_attributes_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `business_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `business_category` (
  `business_id` char(22) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  KEY `business_id` (`business_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `business_category_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`),
  CONSTRAINT `business_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `review_id` varchar(22) NOT NULL,
  `business_id` char(22) DEFAULT NULL,
  `user_id` char(22) DEFAULT NULL,
  `review_cool` smallint(6) NOT NULL,
  `review_date` timestamp NOT NULL,
  `review_funny` smallint(6) NOT NULL,
  `review_stars` smallint(6) NOT NULL,
  `review_useful` smallint(6) NOT NULL,
  `review_text` text NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `business_id` (`business_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


 SET NAMES utf8 ;
 
 DROP TABLE IF EXISTS `tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tip` (
  `business_id` char(22) DEFAULT NULL,
  `user_id` char(22) DEFAULT NULL,
  `tip_date` datetime DEFAULT NULL,
  `tip_likes` smallint(6) DEFAULT NULL,
  `tip_text` varchar(500) DEFAULT NULL,
  KEY `business_id` (`business_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tip_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`),
  CONSTRAINT `tip_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` char(22) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_since` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `users_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_relationships` (
  `user1_id` char(22) DEFAULT NULL,
  `user2_id` char(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


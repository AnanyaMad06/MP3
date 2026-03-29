-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: taal_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`song_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (3,1,2,'2026-03-29 10:20:14'),(19,1,13,'2026-03-29 11:04:48'),(23,1,1,'2026-03-29 11:47:46');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `file_url` text,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Badtameez Dil','Benny Dayal','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Badtameez%20Dil%20-%20Pritam%2C%20Benny%20Dayal%2C%20Shefali%20Alvares.m4a','party'),(2,'Hips Don\'t Lie','Shakira','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Hips%20Don\'t%20Lie%20(Live%20-%20December%202006)%20-%20Shakira.m4a','party'),(3,'Brown Munde','AP Dhillon, Gurinder Gill','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Brown%20Munde%20-%20AP%20Dhillon%2C%20Gminxr%2C%20Gurinder%20Gill%2C%20Shinda%20Kahlon.m4a','party'),(4,'Gerua','Arijit Singh','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Gerua.mp3','romantic'),(5,'Raabta','Arijit Singh','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Raabta%20(title%20Track)%20Arijit%20Singh%20128%20Kbps.mp3','romantic'),(6,'Zaalima','Arijit Singh','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Zaalima%20Raees%20128%20Kbps.mp3','romantic'),(7,'Apna Bana Le','Arijit Singh','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Apna%20Bana%20Le%20-%20Full%20Audio%20Bhediya%20Varun%20Dhawan%2C%20Kriti%20Sanon%20Sachin-Jigar%2CArijit%20Singh%2CAmitabh%20B%20-%20Zee%20Music%20Company.m4a','romantic'),(8,'Can We Kiss Forever','Kinà','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Can%20We%20Kiss%20Forever%20-%20Kin%C3%A0.m4a','romantic'),(9,'Closer','The Chainsmokers','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Closer%20-%20The%20Chainsmokers.m4a','romantic'),(10,'Despacito','Luis Fonsi, Daddy Yankee','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Despacito%20-%20Luis%20Fonsi%2C%20Daddy%20Yankee.m4a','romantic'),(11,'Dildara','Vishal & Shekhar','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Dildaara%20(Stand%20By%20Me)%20-%20Vishal%20%26%20Shekhar%2C%20Shekhar%20Ravjiani%2C%20Vishal%20Dadlani%2C%20Shafqat%20Amanat%20Ali%2C%20Clinton%20Cerejo.m4a','romantic'),(12,'Janam Janam','Arijit Singh','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Janam%20Janam%20Dilwale%20128%20Kbps.mp3','romantic'),(13,'Ishq Jalakar','Shashwat Sachdev','https://raw.githubusercontent.com/AnanyaMad06/MP3/main/Songs/Ishq%20Jalakar%20Dhurandhar%20128%20Kbps.mp3\n','travel');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ananya','$2b$10$Uncqs99UQC18ShzlAbQvnuYgJpmpJwzDygOOsw4qzqV01FYQwjdXy'),(2,'Jash','$2b$10$EraqsLoH5w3K2E9K/YaLOuy3DnMYCt9zFZTfmizWc7kRjeHQWCk9W'),(3,'AnanyaNew','$2b$10$5eXjxOYKwcZFvogbZZLf4O/8azOzk83K8z332NBXTFJFhAkd2/ATu'),(4,'Mad','$2b$10$xcftL/soe9Lzw.Vh2mtcpOYN62MkflAc7ijr4dNuBnLgqDSV7GdUO');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 17:22:55

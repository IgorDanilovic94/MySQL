-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: prvi_assignment
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `plata`
--

DROP TABLE IF EXISTS `plata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plata` (
  `plata_id` int NOT NULL,
  `datum_isplate` date NOT NULL,
  `stanje_racuna` decimal(6,2) NOT NULL,
  `status` varchar(45) NOT NULL,
  `tip_zaposlenja` varchar(45) NOT NULL,
  `zaposleni_id` int NOT NULL,
  PRIMARY KEY (`plata_id`),
  KEY `fk_zaposleni_id` (`zaposleni_id`),
  CONSTRAINT `fk_zaposleni_id` FOREIGN KEY (`zaposleni_id`) REFERENCES `zaposleni` (`zaposleni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plata`
--

LOCK TABLES `plata` WRITE;
/*!40000 ALTER TABLE `plata` DISABLE KEYS */;
INSERT INTO `plata` VALUES (1,'2019-05-01',1500.00,'isplaceno','neodredjeno',1),(2,'2020-04-01',2000.00,'neisplaceno','odredjeno',2),(3,'2021-10-02',1800.00,'isplaceno','odredjeno',3);
/*!40000 ALTER TABLE `plata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poruka`
--

DROP TABLE IF EXISTS `poruka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poruka` (
  `poruka_id` int NOT NULL,
  `sadrzaj` longtext NOT NULL,
  `datum` date NOT NULL,
  `status` varchar(45) NOT NULL,
  `posiljalac` int NOT NULL,
  `primalac` int NOT NULL,
  PRIMARY KEY (`poruka_id`),
  KEY `fk_primalac_id` (`primalac`),
  KEY `fk_posiljalac_id` (`posiljalac`),
  CONSTRAINT `fk_posiljalac_id` FOREIGN KEY (`posiljalac`) REFERENCES `zaposleni` (`zaposleni_id`),
  CONSTRAINT `fk_primalac_id` FOREIGN KEY (`primalac`) REFERENCES `zaposleni` (`zaposleni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poruka`
--

LOCK TABLES `poruka` WRITE;
/*!40000 ALTER TABLE `poruka` DISABLE KEYS */;
INSERT INTO `poruka` VALUES (4,'kolega,kako ide','2022-05-20','neprocitano',1,2),(5,'mozes li mi pomoci','2022-05-18','procitano',1,3),(6,'trebam te nesta','2022-05-17','procitano',2,3);
/*!40000 ALTER TABLE `poruka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaposleni` (
  `zaposleni_id` int NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `korisnicko_ime` varchar(45) NOT NULL,
  `kratka_biografija` longtext,
  `foto` blob,
  PRIMARY KEY (`zaposleni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposleni`
--

LOCK TABLES `zaposleni` WRITE;
/*!40000 ALTER TABLE `zaposleni` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaposleni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21 17:51:57

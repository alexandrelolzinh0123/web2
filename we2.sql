-- MySQL dump 10.13  Distrib 5.6.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: web2
-- ------------------------------------------------------
-- Server version	5.6.35-1+deb.sury.org~xenial+0.1

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
-- Table structure for table `comprovantes`
--

DROP TABLE IF EXISTS `comprovantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprovantes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `recibo_id` int(10) unsigned NOT NULL,
  `vencimento` date NOT NULL,
  `pagamento` date NOT NULL,
  `aproved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_fk` (`user_id`),
  KEY `recibo_id_fk` (`recibo_id`),
  CONSTRAINT `recibo_id_fk` FOREIGN KEY (`recibo_id`) REFERENCES `files` (`id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprovantes`
--

LOCK TABLES `comprovantes` WRITE;
/*!40000 ALTER TABLE `comprovantes` DISABLE KEYS */;
INSERT INTO `comprovantes` VALUES (33,3,3,'2017-09-01','2017-06-01',1),(35,3,4,'2017-06-01','2017-06-01',1),(46,3,6,'2017-06-01','2017-06-01',1),(68,3,7,'2017-06-01','2017-06-01',1),(69,3,8,'2017-06-01','2017-06-01',1),(70,3,9,'2017-06-02','2017-06-02',1),(71,3,10,'2017-06-02','2017-06-02',1),(72,3,11,'2017-06-02','2017-06-02',1),(73,3,12,'2017-06-02','2017-06-02',1),(74,5,13,'2017-11-05','2017-07-05',1),(75,5,14,'2017-07-05','2017-07-05',0),(76,5,15,'2017-07-05','2017-07-05',0),(77,5,16,'2017-07-05','2017-07-05',0),(78,5,17,'2017-07-05','2017-07-05',0),(79,5,18,'2017-07-05','2017-07-05',0),(80,5,19,'2017-07-05','2017-07-05',0),(81,5,20,'2017-07-05','2017-07-05',0),(82,5,21,'2017-07-05','2017-07-05',0),(83,5,22,'2017-07-05','2017-07-05',0),(84,5,23,'2017-07-05','2017-07-05',0),(85,5,24,'2017-07-05','2017-07-05',0),(88,5,25,'2017-07-05','2017-07-05',0),(92,5,26,'2017-07-05','2017-07-05',0);
/*!40000 ALTER TABLE `comprovantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modfied` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'WEB II - Aula_04 - Instalando o CakePHP e Infraestrutura.pdf','/home/alexandre/web2/webroot/uploads/files/','2017-05-18 23:59:28','0000-00-00 00:00:00',0),(2,'Arrival_Film_deutsch_Poster_Wallpaper_Podcast_Download_Banner.jpg','/home/alexandre/web2/webroot/uploads/files/','2017-05-26 20:23:06','0000-00-00 00:00:00',0),(3,'WEB II - Aula_05 - Primeira Aplicação - Tutorial Blog.pdf','uploads/files/','2017-06-01 22:02:19','0000-00-00 00:00:00',0),(4,'WEB II - Aula_05 - Primeira Aplicação - Tutorial Blog.pdf','uploads/files/','2017-06-01 22:07:41','0000-00-00 00:00:00',0),(5,'WEB II - Aula_04 - Instalando o CakePHP e Infraestrutura.pdf','uploads/files/','2017-06-01 22:13:08','0000-00-00 00:00:00',0),(6,'WEB II - Aula_04 - Instalando o CakePHP e Infraestrutura.pdf','uploads/files/','2017-06-01 22:13:34','0000-00-00 00:00:00',0),(7,'login_db.sql','uploads/files/','2017-06-01 23:03:47','0000-00-00 00:00:00',0),(8,'leitor.html (2)','uploads/files/','2017-06-01 23:04:15','0000-00-00 00:00:00',0),(9,'leitor.zip','uploads/files/','2017-06-02 00:58:40','0000-00-00 00:00:00',0),(10,'_home_alexandre_web2_webroot_uploads_files','uploads/files/','2017-06-02 05:11:11','0000-00-00 00:00:00',0),(11,'criacao da home.rar','uploads/files/','2017-06-02 05:12:56','0000-00-00 00:00:00',0),(12,'criacao da home.rar','uploads/files/','2017-06-02 05:14:01','0000-00-00 00:00:00',0),(13,'login_db.sql','uploads/files/','2017-07-05 20:51:41','0000-00-00 00:00:00',0),(14,'See Colors.rar','uploads/files/','2017-07-05 20:52:54','0000-00-00 00:00:00',0),(15,'Arrival_Film_deutsch_Poster_Wallpaper_Podcast_Download_Banner.jpg','uploads/files/','2017-07-05 20:54:36','0000-00-00 00:00:00',0),(16,'3','uploads/files/','2017-07-05 20:56:55','0000-00-00 00:00:00',0),(17,'bootstrap-3.3.7-dist.zip','uploads/files/','2017-07-05 20:58:03','0000-00-00 00:00:00',0),(18,'3','uploads/files/','2017-07-05 21:13:11','0000-00-00 00:00:00',0),(19,'3(1)','uploads/files/','2017-07-05 21:17:02','0000-00-00 00:00:00',0),(20,'WEB II - Aula_04 - Instalando o CakePHP e Infraestrutura.pdf','uploads/files/','2017-07-05 21:21:44','0000-00-00 00:00:00',0),(21,'WEB II - Aula_04 - Instalando o CakePHP e Infraestrutura.pdf','uploads/files/','2017-07-05 21:24:20','0000-00-00 00:00:00',0),(22,'WEB II - Aula_04 - Instalando o CakePHP e Infraestrutura.pdf','uploads/files/','2017-07-05 21:25:03','0000-00-00 00:00:00',0),(23,'WEB II - Aula_05 - Primeira Aplicação - Tutorial Blog.pdf','uploads/files/','2017-07-05 21:26:52','0000-00-00 00:00:00',0),(24,'WEB II - Aula_05 - Primeira Aplicação - Tutorial Blog.pdf','uploads/files/','2017-07-05 21:28:43','0000-00-00 00:00:00',0),(25,'WEB II - Aula_05 - Primeira Aplicação - Tutorial Blog.pdf','uploads/files/','2017-07-05 21:37:41','0000-00-00 00:00:00',0),(26,'WEB II - Aula_05 - Primeira Aplicação - Tutorial Blog.pdf','uploads/files/','2017-07-05 21:48:40','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phinxlog`
--

LOCK TABLES `phinxlog` WRITE;
/*!40000 ALTER TABLE `phinxlog` DISABLE KEYS */;
INSERT INTO `phinxlog` VALUES (20170331172832,'CreateComprovante','2017-03-31 20:29:35','2017-03-31 20:29:35',0);
/*!40000 ALTER TABLE `phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `siape` varchar(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `plano` varchar(70) NOT NULL,
  `role` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siape` (`siape`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Inácio Neto','785414','Neto87','$2y$10$6nfRiCb2GST85GkfGMxTtOZ7hwmUephSvoNJcyqlfCx/zPPQyGuj6','SUS','Servidor'),(2,'Inácio Neto','32121321312','ui123','$2y$10$A3YlWmQyzToz/BLsnnYYPuNYKXQjwhZt9DuG5cftqtYDTVQwD7ry6','SUS','Servidor'),(3,'alexandre','12312319237','alexandre1','$2y$10$cPY.dGZdkihGO9X9qWq.8.UeAtL0/NTSBocIZt30743/VgmN9z10e','susu','Servidor'),(4,'rick','19837132213','rick123','$2y$10$ZW0zCggx/9N10evTZdM9PODN.hmdJvaBs3xnebEqg0S6xx4TdXCka','sus','Gestor'),(5,'alexandre','1231231231','ale123','$2y$10$9dhZNS82yY46og4UbmugPu0wH/kv9NWnDMT.3gQaWW9UWI5Unqdmi','SUS','Servidor');
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

-- Dump completed on 2017-07-06 20:46:15

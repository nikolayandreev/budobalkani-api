-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: local_budobalkani
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (52,'customer',1,NULL,NULL,'test123123','test23123',NULL,'test','ул.полковник Стоян Топузов №730',NULL,'1000','Sofia','BG','BG',NULL,'0123456798','',0,NULL,'2021-02-16 16:51:21','2021-02-17 16:25:04'),(54,'customer',1,NULL,NULL,'test','test',NULL,'','ул.полковник Стоян Топузов №730',NULL,'1000','Sofia','BG','BG',NULL,'0123456798','',0,NULL,'2021-02-16 16:51:31','2021-02-17 09:25:18'),(55,'customer',1,NULL,NULL,'test','test',NULL,'ACME23','ул.полковник Стоян Топузов №730',NULL,'1000','Sofia','BG','BG',NULL,'0123456798','BG130395814',1,NULL,'2021-02-17 08:35:34','2021-02-17 16:17:01');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Example','admin@example.com','$2y$10$KXeu8vGSK3nta2pCOfpPPe1QCyOv9N/MDOeQgKwFqmv2By2kScT5S','zuuy8OZqTfJm4k0SH2ICx59WTXLPzVVgxlAtHiamvJdfvojByLISHODkURIT0mSpUhtO3tc1bOs4BT9n',1,1,NULL,'2021-02-16 09:39:06','2021-02-16 09:39:06');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Продукти',0,1),(2,'judo','Джудо',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(1,6,1),(2,1,3),(2,6,3),(3,1,4),(3,6,4),(4,1,5),(4,6,5),(5,1,6),(5,6,6),(6,1,7),(6,6,7),(7,1,8),(7,6,8),(8,1,10),(8,6,10),(9,2,1),(9,7,1),(10,2,2),(10,7,2),(11,4,1),(11,10,1),(13,4,3),(13,10,2),(14,4,4),(14,10,3),(15,4,5),(15,10,4),(16,3,1),(16,9,1),(17,3,2),(17,9,2),(18,3,3),(18,9,3),(19,5,1),(19,11,1),(20,5,2),(20,11,2),(22,5,4),(22,11,3),(23,8,1),(24,8,2),(25,8,3),(26,1,9),(26,6,9),(27,1,2),(27,6,2);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'General',1,0,1),(2,'Description',2,0,1),(3,'Meta Description',3,0,1),(4,'Price',4,0,1),(5,'Shipping',5,0,1),(6,'General',1,0,2),(7,'Description',2,0,2),(8,'Атрибути',2,1,2),(9,'Meta Description',3,0,2),(10,'Price',4,0,2),(11,'Shipping',5,0,2);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,'en','Red',1),(2,'en','Green',2),(3,'en','Yellow',3),(4,'en','Black',4),(5,'en','White',5),(6,'en','S',6),(7,'en','M',7),(8,'en','L',8),(9,'en','XL',9),(10,'bg','Избери марка',10),(11,'bg','dax',11),(12,'bg','mizuno',12),(13,'bg','tokaido',13),(14,'bg','S',6),(15,'bg','M',7),(16,'bg','L',8),(17,'bg','XL',9),(18,'bg','#FFFFFF',1),(19,'bg','#C0C0C0',2),(20,'bg','#808080',3),(21,'bg','#000000',4),(22,'bg','#FF0000',5),(23,'bg','#800000',14),(24,'bg','#FFFF00',15),(25,'bg','#808000',16),(26,'bg','#00FF00',17),(27,'bg','#008000',18),(28,'bg','#00FFFF',19),(29,'bg','#008080',20),(30,'bg','#0000FF',21),(31,'bg','#000080',22),(32,'bg','#FF00FF',23),(33,'bg','#800080',24);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `attribute_id` int unsigned NOT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,'Бял',1,23,NULL),(2,'Сребрист',2,23,NULL),(3,'Сив',3,23,NULL),(4,'Черен',4,23,NULL),(5,'Червен',5,23,NULL),(6,'s',1,24,NULL),(7,'m',2,24,NULL),(8,'l',3,24,NULL),(9,'xl',4,24,NULL),(10,'Избери марка',1,25,NULL),(11,'DAX',2,25,NULL),(12,'Mizuno',3,25,NULL),(13,'Tokaido',4,25,NULL),(14,'Тъмно червен',6,23,NULL),(15,'Жълт',7,23,NULL),(16,'Маслина',8,23,NULL),(17,'Лайм',9,23,NULL),(18,'Зелен',10,23,NULL),(19,'Аква',11,23,NULL),(20,'Циан',12,23,NULL),(21,'Син',13,23,NULL),(22,'Нави',14,23,NULL),(23,'Фуксия',15,23,NULL),(24,'Лилав',16,23,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,'en','SKU',1),(2,'en','Name',2),(3,'en','URL Key',3),(4,'en','Tax Category',4),(5,'en','New',5),(6,'en','Featured',6),(7,'en','Visible Individually',7),(8,'en','Status',8),(9,'en','Short Description',9),(10,'en','Description',10),(11,'en','Price',11),(12,'en','Cost',12),(13,'en','Special Price',13),(14,'en','Special Price From',14),(15,'en','Special Price To',15),(16,'en','Meta Description',16),(17,'en','Meta Keywords',17),(18,'en','Meta Description',18),(19,'en','Width',19),(20,'en','Height',20),(21,'en','Depth',21),(22,'en','Weight',22),(23,'en','Color',23),(24,'en','Size',24),(25,'en','Brand',25),(26,'en','Allow Guest Checkout',26),(27,'en','Product Number',27),(28,'bg','Номер на продукта',27),(29,'bg','Разрешен за гости',26),(30,'bg','Марка',25),(31,'bg','Размер',24),(32,'bg','Цвят',23),(33,'bg','Тегло (кг)',22),(34,'bg','Дълбочина',21),(35,'bg','Височина (см)',20),(36,'bg','Дължина (см)',19),(37,'bg','Мета Описание',18),(38,'bg','Мета ключови думи',17),(39,'bg','Мета заглавие',16),(40,'bg','В промоция до',15),(41,'bg','В промоция от',14),(42,'bg','Промоционална цена',13),(43,'bg','Доставна цена',12),(44,'bg','Редовна цена',11),(45,'bg','Описание',10),(46,'bg','Кратко описание',9),(47,'bg','Активен',8),(48,'bg','Има вътрешна страница',7),(49,'bg','Препоръчан',6),(50,'bg','Нов продукт',5),(51,'bg','Приложи такси',4),(52,'bg','Слъг',3),(53,'bg','Име на продукта',2),(54,'bg','SKU',1);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_in_flat` tinyint(1) NOT NULL DEFAULT '1',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text','',1,1,1,0,0,0,1,0,0,'2021-02-16 09:39:05','2021-02-16 12:42:34',NULL,1,0),(2,'name','Име на продукта','text','',3,1,0,0,0,0,1,0,0,'2021-02-16 09:39:05','2021-02-16 12:42:20',NULL,1,1),(3,'url_key','Слъг','text','',4,1,1,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:41:55',NULL,1,0),(4,'tax_category_id','Приложи такси','select','',5,0,0,0,1,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:41:46','dropdown',1,0),(5,'new','Нов продукт','boolean','',6,0,0,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:41:24',NULL,1,0),(6,'featured','Препоръчан','boolean','',7,0,0,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:41:18',NULL,1,0),(7,'visible_individually','Има вътрешна страница','boolean','',9,1,0,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:41:01',NULL,1,0),(8,'status','Активен','boolean','',10,1,0,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:40:30',NULL,1,0),(9,'short_description','Кратко описание','textarea','',11,0,0,1,1,0,0,0,1,'2021-02-16 09:39:05','2021-02-16 12:40:22',NULL,1,0),(10,'description','Описание','textarea','',12,1,0,1,1,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:40:10',NULL,1,1),(11,'price','Редовна цена','price','decimal',13,1,0,0,0,1,0,0,1,'2021-02-16 09:39:05','2021-02-16 12:40:01',NULL,1,1),(12,'cost','Доставна цена','price','decimal',14,0,0,0,1,0,0,1,0,'2021-02-16 09:39:05','2021-02-16 12:39:49',NULL,1,0),(13,'special_price','Промоционална цена','price','decimal',15,0,0,0,0,0,0,0,1,'2021-02-16 09:39:05','2021-02-16 12:38:17',NULL,1,0),(14,'special_price_from','В промоция от','date','',16,0,0,0,1,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:37:54',NULL,1,0),(15,'special_price_to','В промоция до','date','',17,0,0,0,1,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:37:40',NULL,1,0),(16,'meta_title','Мета заглавие','textarea','',18,0,0,1,1,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:37:14',NULL,1,0),(17,'meta_keywords','Мета ключови думи','textarea','',20,0,0,1,1,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:37:03',NULL,0,0),(18,'meta_description','Мета Описание','textarea','',21,0,0,1,1,0,0,1,0,'2021-02-16 09:39:05','2021-02-16 12:36:26',NULL,1,0),(19,'width','Дължина (см)','text','decimal',22,0,0,0,0,0,0,1,0,'2021-02-16 09:39:05','2021-02-16 12:34:04',NULL,1,0),(20,'height','Височина (см)','text','decimal',23,0,0,0,0,0,0,1,0,'2021-02-16 09:39:05','2021-02-16 12:33:50',NULL,1,0),(21,'depth','Дълбочина','text','decimal',24,0,0,0,0,0,0,1,0,'2021-02-16 09:39:05','2021-02-16 12:33:38',NULL,1,0),(22,'weight','Тегло','text','decimal',25,0,0,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:33:27',NULL,1,0),(23,'color','Цвят','select','',26,0,0,0,0,0,1,1,1,'2021-02-16 09:39:05','2021-02-16 12:32:59','dropdown',1,0),(24,'size','Размер','select','',27,0,0,0,0,0,1,1,1,'2021-02-16 09:39:05','2021-02-16 12:25:17','dropdown',1,0),(25,'brand','Марка','select','',28,0,0,0,0,0,0,1,1,'2021-02-16 09:39:05','2021-02-16 12:25:34','dropdown',1,0),(26,'guest_checkout','Разрешен за гости','boolean','',8,1,0,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:23:19',NULL,1,0),(27,'product_number','Номер на продукта','text','',2,0,1,0,0,0,0,0,0,'2021-02-16 09:39:05','2021-02-16 12:22:59',NULL,1,0);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_appointment_slots`
--

DROP TABLE IF EXISTS `booking_product_appointment_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_appointment_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_appointment_slots`
--

LOCK TABLES `booking_product_appointment_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_appointment_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_appointment_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_default_slots`
--

DROP TABLE IF EXISTS `booking_product_default_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_default_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_default_slots`
--

LOCK TABLES `booking_product_default_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_default_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_default_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_ticket_translations`
--

DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_ticket_translations`
--

LOCK TABLES `booking_product_event_ticket_translations` WRITE;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_tickets`
--

DROP TABLE IF EXISTS `booking_product_event_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_event_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_tickets`
--

LOCK TABLES `booking_product_event_tickets` WRITE;
/*!40000 ALTER TABLE `booking_product_event_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_rental_slots`
--

DROP TABLE IF EXISTS `booking_product_rental_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_rental_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `renting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_rental_slots`
--

LOCK TABLES `booking_product_rental_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_rental_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_rental_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_table_slots`
--

DROP TABLE IF EXISTS `booking_product_table_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_table_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_table_slots`
--

LOCK TABLES `booking_product_table_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_table_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_table_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_products`
--

DROP TABLE IF EXISTS `booking_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_products`
--

LOCK TABLES `booking_products` WRITE;
/*!40000 ALTER TABLE `booking_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `booking_product_event_ticket_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL,NULL,NULL,0,1,2.0000,NULL,'BGN','BGN','BGN','BGN',20.0000,20.0000,20.0000,20.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,0,NULL,NULL,1,'2021-02-16 14:11:45','2021-02-16 15:45:14','');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,2,'asdasd','simple','Dana Kling MD',NULL,502.0000,1004.0000,1004.0000,10.0000,10.0000,20.0000,20.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"quantity\": 1}',NULL,7,1,NULL,'2021-02-16 15:35:44','2021-02-16 15:44:38',NULL,'');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `cart_rule_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`),
  CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `category_icon_path` text,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,1,14,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05','products_and_description',NULL,NULL),(2,2,NULL,1,15,16,NULL,'2021-02-16 11:55:47','2021-02-16 11:55:47','products_and_description',NULL,NULL),(3,3,NULL,1,17,18,NULL,'2021-02-16 11:56:18','2021-02-16 11:56:18','products_and_description',NULL,NULL),(4,4,NULL,1,19,20,NULL,'2021-02-16 11:56:48','2021-02-16 11:56:48','products_and_description',NULL,NULL),(5,5,NULL,1,21,22,NULL,'2021-02-16 11:57:13','2021-02-16 11:57:13','products_and_description',NULL,NULL),(6,6,NULL,1,23,24,NULL,'2021-02-16 11:57:41','2021-02-16 11:57:41','products_and_description',NULL,NULL),(7,7,NULL,1,25,26,NULL,'2021-02-16 11:58:08','2021-02-16 11:58:08','products_and_description',NULL,NULL),(8,9,NULL,1,27,32,NULL,'2021-02-16 11:58:31','2021-02-16 11:58:31','products_and_description',NULL,NULL),(9,10,NULL,1,28,29,8,'2021-02-16 12:05:31','2021-02-16 12:20:46','products_and_description',NULL,NULL),(10,11,NULL,1,30,31,8,'2021-02-16 12:21:31','2021-02-16 12:21:31','products_and_description',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` VALUES (1,25),(2,25),(3,25),(4,25),(5,25),(6,25),(7,25),(8,25),(9,25),(10,25);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text,
  `meta_title` text,
  `meta_description` text,
  `meta_keywords` text,
  `category_id` int unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `locale_id` int unsigned DEFAULT NULL,
  `url_path` varchar(2048) NOT NULL COMMENT 'maintained by database triggers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,'Root','root','Root','','','',1,'en',NULL,''),(2,'Джудо','judo','<p>test</p>','','','',1,'bg',NULL,''),(3,'Карате','karate','<p>test</p>','','','',2,'bg',5,''),(4,'Самбо','sambo','<p>test</p>','','','',3,'bg',5,''),(5,' Таекуондо','taekuondo','<p>test</p>','','','',4,'bg',5,''),(6,'Айкидо','aikido','<p>тест</p>','','','',5,'bg',5,''),(7,'ММА и Бокс','mma-i-boks','<p>test</p>','','','',6,'bg',5,''),(8,'Бразилско джиу джицу','brazilsko-jiu-jitsu','<p>test</p>','','','',7,'bg',5,''),(9,'Татами','tatami','<p>test</p>','','','',8,'bg',5,''),(10,'Карате','tatami-karate','<p>тест</p>','','','',9,'bg',5,'tatami-karate'),(11,'Джудо','tatami-judo','<p>test</p>','','','',10,'bg',5,'tatami-judo');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,3);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,5);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_content` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES (1,1,'en','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(2,1,'fr','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(3,1,'nl','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(4,1,'tr','Default',NULL,'\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost/themes/default/assets/images/1.webp data-src=http://localhost/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost/themes/default/assets/images/2.webp data-src=http://localhost/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost/themes/default/assets/images/3.webp data-src=http://localhost/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ','\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ',NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL),(5,1,'bg','Будобалкани - Онлайн магазин','','','','Not allowed','{\"meta_title\": \"Будобалкани\", \"meta_keywords\": \"онлайн, магазин, Будобалкани\", \"meta_description\": \"Будобалкани онлайн магазин\"}','2021-02-16 09:45:49','2021-02-16 09:54:46');
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default',NULL,'default','http://127.0.0.1:8000',NULL,NULL,0,'127.0.0.1',5,3,NULL,'2021-02-16 09:54:46',1);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_config_channel_id_foreign` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(5,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(6,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(7,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(8,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(9,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(10,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(11,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 09:39:05'),(12,'catalog.products.homepage.out_of_stock_items','0',NULL,NULL,'2021-02-16 09:39:05','2021-02-16 14:48:43'),(13,'customer.settings.social_login.enable_facebook','1','default',NULL,'2021-02-16 09:39:06','2021-02-16 09:39:06'),(14,'customer.settings.social_login.enable_twitter','0','default',NULL,'2021-02-16 09:39:06','2021-02-16 10:03:30'),(15,'customer.settings.social_login.enable_google','1','default',NULL,'2021-02-16 09:39:06','2021-02-16 09:39:06'),(16,'customer.settings.social_login.enable_linkedin','0','default',NULL,'2021-02-16 09:39:06','2021-02-16 10:03:30'),(17,'customer.settings.social_login.enable_github','0','default',NULL,'2021-02-16 09:39:06','2021-02-16 10:03:30'),(18,'general.content.shop.compare_option','1','default','en','2021-02-16 09:39:06','2021-02-16 09:39:06'),(19,'general.content.shop.compare_option','1','default','fr','2021-02-16 09:39:06','2021-02-16 09:39:06'),(20,'general.content.shop.compare_option','1','default','ar','2021-02-16 09:39:06','2021-02-16 09:39:06'),(21,'general.content.shop.compare_option','1','default','de','2021-02-16 09:39:06','2021-02-16 09:39:06'),(22,'general.content.shop.compare_option','1','default','es','2021-02-16 09:39:06','2021-02-16 09:39:06'),(23,'general.content.shop.compare_option','1','default','fa','2021-02-16 09:39:06','2021-02-16 09:39:06'),(24,'general.content.shop.compare_option','1','default','it','2021-02-16 09:39:06','2021-02-16 09:39:06'),(25,'general.content.shop.compare_option','1','default','ja','2021-02-16 09:39:06','2021-02-16 09:39:06'),(26,'general.content.shop.compare_option','1','default','nl','2021-02-16 09:39:06','2021-02-16 09:39:06'),(27,'general.content.shop.compare_option','1','default','pl','2021-02-16 09:39:06','2021-02-16 09:39:06'),(28,'general.content.shop.compare_option','1','default','pt_BR','2021-02-16 09:39:06','2021-02-16 09:39:06'),(29,'general.content.shop.compare_option','1','default','tr','2021-02-16 09:39:06','2021-02-16 09:39:06'),(30,'general.content.shop.wishlist_option','1','default','en','2021-02-16 09:39:06','2021-02-16 09:39:06'),(31,'general.content.shop.wishlist_option','1','default','fr','2021-02-16 09:39:06','2021-02-16 09:39:06'),(32,'general.content.shop.wishlist_option','1','default','ar','2021-02-16 09:39:06','2021-02-16 09:39:06'),(33,'general.content.shop.wishlist_option','1','default','de','2021-02-16 09:39:06','2021-02-16 09:39:06'),(34,'general.content.shop.wishlist_option','1','default','es','2021-02-16 09:39:06','2021-02-16 09:39:06'),(35,'general.content.shop.wishlist_option','1','default','fa','2021-02-16 09:39:06','2021-02-16 09:39:06'),(36,'general.content.shop.wishlist_option','1','default','it','2021-02-16 09:39:06','2021-02-16 09:39:06'),(37,'general.content.shop.wishlist_option','1','default','ja','2021-02-16 09:39:06','2021-02-16 09:39:06'),(38,'general.content.shop.wishlist_option','1','default','nl','2021-02-16 09:39:06','2021-02-16 09:39:06'),(39,'general.content.shop.wishlist_option','1','default','pl','2021-02-16 09:39:06','2021-02-16 09:39:06'),(40,'general.content.shop.wishlist_option','1','default','pt_BR','2021-02-16 09:39:06','2021-02-16 09:39:06'),(41,'general.content.shop.wishlist_option','1','default','tr','2021-02-16 09:39:06','2021-02-16 09:39:06'),(42,'general.content.shop.image_search','1','default','en','2021-02-16 09:39:06','2021-02-16 09:39:06'),(43,'general.content.shop.image_search','1','default','fr','2021-02-16 09:39:06','2021-02-16 09:39:06'),(44,'general.content.shop.image_search','1','default','ar','2021-02-16 09:39:06','2021-02-16 09:39:06'),(45,'general.content.shop.image_search','1','default','de','2021-02-16 09:39:06','2021-02-16 09:39:06'),(46,'general.content.shop.image_search','1','default','es','2021-02-16 09:39:06','2021-02-16 09:39:06'),(47,'general.content.shop.image_search','1','default','fa','2021-02-16 09:39:06','2021-02-16 09:39:06'),(48,'general.content.shop.image_search','1','default','it','2021-02-16 09:39:06','2021-02-16 09:39:06'),(49,'general.content.shop.image_search','1','default','ja','2021-02-16 09:39:06','2021-02-16 09:39:06'),(50,'general.content.shop.image_search','1','default','nl','2021-02-16 09:39:06','2021-02-16 09:39:06'),(51,'general.content.shop.image_search','1','default','pl','2021-02-16 09:39:06','2021-02-16 09:39:06'),(52,'general.content.shop.image_search','1','default','pt_BR','2021-02-16 09:39:06','2021-02-16 09:39:06'),(53,'general.content.shop.image_search','1','default','tr','2021-02-16 09:39:06','2021-02-16 09:39:06'),(54,'general.general.locale_options.weight_unit','kgs','default',NULL,'2021-02-16 10:01:05','2021-02-16 10:01:05'),(55,'general.general.email_settings.sender_name','Будобалкани (www.budobalkni.bg)','default',NULL,'2021-02-16 10:01:05','2021-02-16 10:01:05'),(56,'general.general.email_settings.shop_email_from','no-reply@budobalkani.bg','default',NULL,'2021-02-16 10:01:05','2021-02-16 10:01:05'),(57,'general.general.email_settings.admin_name','Екипът на Будобалкани','default',NULL,'2021-02-16 10:01:05','2021-02-16 10:01:05'),(58,'general.general.email_settings.admin_email','office@budobalkani.bg','default',NULL,'2021-02-16 10:01:05','2021-02-16 10:01:05'),(59,'general.content.shop.compare_option','0','default','bg','2021-02-16 10:01:21','2021-02-16 10:01:21'),(60,'general.content.shop.wishlist_option','1','default','bg','2021-02-16 10:01:21','2021-02-16 10:01:21'),(61,'general.content.shop.image_search','0','default','bg','2021-02-16 10:01:21','2021-02-16 10:01:21'),(62,'general.content.footer.footer_content','','default','bg','2021-02-16 10:01:21','2021-02-16 10:01:21'),(63,'general.content.footer.footer_toggle','0','default','bg','2021-02-16 10:01:21','2021-02-16 10:01:21'),(64,'general.content.custom_scripts.custom_css','','default',NULL,'2021-02-16 10:01:21','2021-02-16 10:01:21'),(65,'general.content.custom_scripts.custom_javascript','','default',NULL,'2021-02-16 10:01:22','2021-02-16 10:01:22'),(66,'general.design.admin_logo.logo_image','configuration/KMbw9VRBXVgipxEDE2f77zi6bznwXF9o0pAv0i1M.png','default',NULL,'2021-02-16 10:01:41','2021-02-16 10:01:48'),(67,'catalog.products.homepage.no_of_new_product_homepage','',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(68,'catalog.products.homepage.no_of_featured_product_homepage','',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(69,'catalog.products.storefront.mode','grid','default',NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(70,'catalog.products.storefront.products_per_page','','default',NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(71,'catalog.products.storefront.sort_by','name-desc','default',NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(72,'catalog.products.storefront.buy_now_button_display','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(73,'catalog.products.review.guest_review','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(74,'catalog.products.attribute.image_attribute_upload_size','',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(75,'catalog.products.attribute.file_attribute_upload_size','',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(76,'catalog.products.social_share.enabled','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(77,'catalog.products.social_share.facebook','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(78,'catalog.products.social_share.twitter','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(79,'catalog.products.social_share.pinterest','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(80,'catalog.products.social_share.whatsapp','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(81,'catalog.products.social_share.linkedin','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(82,'catalog.products.social_share.email','0',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(83,'catalog.products.social_share.share_message','',NULL,NULL,'2021-02-16 10:03:03','2021-02-16 10:03:03'),(84,'customer.settings.address.street_lines','','default',NULL,'2021-02-16 10:03:30','2021-02-16 16:27:15'),(85,'customer.settings.newsletter.subscription','0',NULL,NULL,'2021-02-16 10:03:30','2021-02-16 10:03:30'),(86,'customer.settings.email.verification','1',NULL,NULL,'2021-02-16 10:03:30','2021-02-16 10:03:30'),(87,'sales.shipping.origin.country','BG','default','bg','2021-02-16 10:03:58','2021-02-16 10:03:58'),(88,'sales.shipping.origin.state','SF','default','bg','2021-02-16 10:03:58','2021-02-16 10:03:58'),(89,'sales.shipping.origin.city','София','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(90,'sales.shipping.origin.address1','ул. Белимел 19Б','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(91,'sales.shipping.origin.zipcode','1000','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(92,'sales.shipping.origin.store_name','Склад на Будобалкани','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(93,'sales.shipping.origin.vat_number','','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(94,'sales.shipping.origin.contact','','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(95,'sales.shipping.origin.bank_details','','default',NULL,'2021-02-16 10:03:58','2021-02-16 10:03:58'),(96,'sales.carriers.free.title','Безплатна доставка',NULL,'bg','2021-02-16 10:04:35','2021-02-16 10:04:35'),(97,'sales.carriers.free.description','Безплатна доставка',NULL,'bg','2021-02-16 10:04:35','2021-02-16 10:04:35'),(98,'sales.carriers.free.active','1',NULL,'bg','2021-02-16 10:04:35','2021-02-16 10:04:35'),(99,'sales.carriers.free.is_calculate_tax','1',NULL,NULL,'2021-02-16 10:04:35','2021-02-16 10:04:35'),(100,'sales.carriers.flatrate.title','Фиксирана такса','default','bg','2021-02-16 10:04:35','2021-02-16 10:04:35'),(101,'sales.carriers.flatrate.description','Такса за доставка','default',NULL,'2021-02-16 10:04:35','2021-02-16 10:04:35'),(102,'sales.carriers.flatrate.default_rate','6.99','default',NULL,'2021-02-16 10:04:35','2021-02-16 10:04:35'),(103,'sales.carriers.flatrate.type','per_order',NULL,NULL,'2021-02-16 10:04:35','2021-02-16 10:04:35'),(104,'sales.carriers.flatrate.active','1',NULL,'bg','2021-02-16 10:04:35','2021-02-16 10:04:35'),(105,'sales.carriers.flatrate.is_calculate_tax','1',NULL,NULL,'2021-02-16 10:04:35','2021-02-16 10:04:35'),(106,'sales.paymentmethods.paypal_smart_button.title','PayPal Smart Button',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(107,'sales.paymentmethods.paypal_smart_button.description','PayPal',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(108,'sales.paymentmethods.paypal_smart_button.client_id','sb',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(109,'sales.paymentmethods.paypal_smart_button.client_secret','',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(110,'sales.paymentmethods.paypal_smart_button.accepted_currencies','',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(111,'sales.paymentmethods.paypal_smart_button.active','0',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(112,'sales.paymentmethods.paypal_smart_button.sandbox','0',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(113,'sales.paymentmethods.paypal_smart_button.sort','1',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(114,'sales.paymentmethods.cashondelivery.title','Наложен платеж',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(115,'sales.paymentmethods.cashondelivery.description','Плащане при получаване на продуктите',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(116,'sales.paymentmethods.cashondelivery.active','1',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(117,'sales.paymentmethods.cashondelivery.instructions','',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(118,'sales.paymentmethods.cashondelivery.sort','1',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(119,'sales.paymentmethods.moneytransfer.title','Money Transfer',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(120,'sales.paymentmethods.moneytransfer.description','Money Transfer',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(121,'sales.paymentmethods.moneytransfer.active','0',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(122,'sales.paymentmethods.moneytransfer.mailing_address','',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(123,'sales.paymentmethods.moneytransfer.sort','2',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(124,'sales.paymentmethods.paypal_standard.title','PayPal Standard',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(125,'sales.paymentmethods.paypal_standard.description','PayPal Standard',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(126,'sales.paymentmethods.paypal_standard.business_account','test@webkul.com',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(127,'sales.paymentmethods.paypal_standard.active','0',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(128,'sales.paymentmethods.paypal_standard.sandbox','0',NULL,'bg','2021-02-16 10:05:03','2021-02-16 10:05:03'),(129,'sales.paymentmethods.paypal_standard.sort','3',NULL,NULL,'2021-02-16 10:05:03','2021-02-16 10:05:03'),(130,'sales.orderSettings.order_number.order_number_prefix','','default','bg','2021-02-16 10:05:15','2021-02-16 10:05:15'),(131,'sales.orderSettings.order_number.order_number_length','','default','bg','2021-02-16 10:05:15','2021-02-16 10:05:15'),(132,'sales.orderSettings.order_number.order_number_suffix','','default','bg','2021-02-16 10:05:15','2021-02-16 10:05:15'),(133,'sales.orderSettings.order_number.order_number_generator-class','','default','bg','2021-02-16 10:05:15','2021-02-16 10:05:15'),(134,'sales.orderSettings.minimum-order.minimum_order_amount','','default','bg','2021-02-16 10:05:15','2021-02-16 10:05:15'),(135,'sales.orderSettings.invoice_slip_design.logo','configuration/pV0saRX8OgtBYswxJxT4uy7Y2BiiZVFrWNVVhZ9f.png','default',NULL,'2021-02-16 10:05:15','2021-02-16 10:05:15');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','Côte d’Ivoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Curaçao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','Réunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','São Tomé & Príncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barthélemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(243,'UN','United Nations'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  `country_state_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
INSERT INTO `country_state_translations` VALUES (1,'ar','ألاباما',1),(2,'ar','ألاسكا',2),(3,'ar','ساموا الأمريكية',3),(4,'ar','أريزونا',4),(5,'ar','أركنساس',5),(6,'ar','القوات المسلحة أفريقيا',6),(7,'ar','القوات المسلحة الأمريكية',7),(8,'ar','القوات المسلحة الكندية',8),(9,'ar','القوات المسلحة أوروبا',9),(10,'ar','القوات المسلحة الشرق الأوسط',10),(11,'ar','القوات المسلحة في المحيط الهادئ',11),(12,'ar','كاليفورنيا',12),(13,'ar','كولورادو',13),(14,'ar','كونيتيكت',14),(15,'ar','ديلاوير',15),(16,'ar','مقاطعة كولومبيا',16),(17,'ar','ولايات ميكرونيزيا الموحدة',17),(18,'ar','فلوريدا',18),(19,'ar','جورجيا',19),(20,'ar','غوام',20),(21,'ar','هاواي',21),(22,'ar','ايداهو',22),(23,'ar','إلينوي',23),(24,'ar','إنديانا',24),(25,'ar','أيوا',25),(26,'ar','كانساس',26),(27,'ar','كنتاكي',27),(28,'ar','لويزيانا',28),(29,'ar','مين',29),(30,'ar','جزر مارشال',30),(31,'ar','ماريلاند',31),(32,'ar','ماساتشوستس',32),(33,'ar','ميشيغان',33),(34,'ar','مينيسوتا',34),(35,'ar','ميسيسيبي',35),(36,'ar','ميسوري',36),(37,'ar','مونتانا',37),(38,'ar','نبراسكا',38),(39,'ar','نيفادا',39),(40,'ar','نيو هامبشاير',40),(41,'ar','نيو جيرسي',41),(42,'ar','المكسيك جديدة',42),(43,'ar','نيويورك',43),(44,'ar','شمال كارولينا',44),(45,'ar','شمال داكوتا',45),(46,'ar','جزر مريانا الشمالية',46),(47,'ar','أوهايو',47),(48,'ar','أوكلاهوما',48),(49,'ar','ولاية أوريغون',49),(50,'ar','بالاو',50),(51,'ar','بنسلفانيا',51),(52,'ar','بورتوريكو',52),(53,'ar','جزيرة رود',53),(54,'ar','كارولينا الجنوبية',54),(55,'ar','جنوب داكوتا',55),(56,'ar','تينيسي',56),(57,'ar','تكساس',57),(58,'ar','يوتا',58),(59,'ar','فيرمونت',59),(60,'ar','جزر فيرجن',60),(61,'ar','فرجينيا',61),(62,'ar','واشنطن',62),(63,'ar','فرجينيا الغربية',63),(64,'ar','ولاية ويسكونسن',64),(65,'ar','وايومنغ',65),(66,'ar','ألبرتا',66),(67,'ar','كولومبيا البريطانية',67),(68,'ar','مانيتوبا',68),(69,'ar','نيوفاوندلاند ولابرادور',69),(70,'ar','برونزيك جديد',70),(71,'ar','مقاطعة نفوفا سكوشيا',71),(72,'ar','الاقاليم الشمالية الغربية',72),(73,'ar','نونافوت',73),(74,'ar','أونتاريو',74),(75,'ar','جزيرة الأمير ادوارد',75),(76,'ar','كيبيك',76),(77,'ar','ساسكاتشوان',77),(78,'ar','إقليم يوكون',78),(79,'ar','Niedersachsen',79),(80,'ar','بادن فورتمبيرغ',80),(81,'ar','بايرن ميونيخ',81),(82,'ar','برلين',82),(83,'ar','براندنبورغ',83),(84,'ar','بريمن',84),(85,'ar','هامبورغ',85),(86,'ar','هيسن',86),(87,'ar','مكلنبورغ-فوربومرن',87),(88,'ar','نوردراين فيستفالن',88),(89,'ar','راينلاند-بفالز',89),(90,'ar','سارلاند',90),(91,'ar','ساكسن',91),(92,'ar','سكسونيا أنهالت',92),(93,'ar','شليسفيغ هولشتاين',93),(94,'ar','تورنغن',94),(95,'ar','فيينا',95),(96,'ar','النمسا السفلى',96),(97,'ar','النمسا العليا',97),(98,'ar','سالزبورغ',98),(99,'ar','Каринтия',99),(100,'ar','STEIERMARK',100),(101,'ar','تيرول',101),(102,'ar','بورغنلاند',102),(103,'ar','فورارلبرغ',103),(104,'ar','أرجاو',104),(105,'ar','Appenzell Innerrhoden',105),(106,'ar','أبنزل أوسيرهودن',106),(107,'ar','برن',107),(108,'ar','كانتون ريف بازل',108),(109,'ar','بازل شتات',109),(110,'ar','فرايبورغ',110),(111,'ar','Genf',111),(112,'ar','جلاروس',112),(113,'ar','غراوبوندن',113),(114,'ar','العصر الجوارسي أو الجوري',114),(115,'ar','لوزيرن',115),(116,'ar','في Neuenburg',116),(117,'ar','نيدوالدن',117),(118,'ar','أوبوالدن',118),(119,'ar','سانت غالن',119),(120,'ar','شافهاوزن',120),(121,'ar','سولوتورن',121),(122,'ar','شفيتس',122),(123,'ar','ثورجو',123),(124,'ar','تيتشينو',124),(125,'ar','أوري',125),(126,'ar','وادت',126),(127,'ar','اليس',127),(128,'ar','زوغ',128),(129,'ar','زيورخ',129),(130,'ar','Corunha',130),(131,'ar','ألافا',131),(132,'ar','الباسيتي',132),(133,'ar','اليكانتي',133),(134,'ar','الميريا',134),(135,'ar','أستورياس',135),(136,'ar','أفيلا',136),(137,'ar','بطليوس',137),(138,'ar','البليار',138),(139,'ar','برشلونة',139),(140,'ar','برغش',140),(141,'ar','كاسيريس',141),(142,'ar','كاديز',142),(143,'ar','كانتابريا',143),(144,'ar','كاستيلون',144),(145,'ar','سبتة',145),(146,'ar','سيوداد ريال',146),(147,'ar','قرطبة',147),(148,'ar','كوينكا',148),(149,'ar','جيرونا',149),(150,'ar','غرناطة',150),(151,'ar','غوادالاخارا',151),(152,'ar','بجويبوزكوا',152),(153,'ar','هويلفا',153),(154,'ar','هويسكا',154),(155,'ar','خاين',155),(156,'ar','لاريوخا',156),(157,'ar','لاس بالماس',157),(158,'ar','ليون',158),(159,'ar','يدا',159),(160,'ar','لوغو',160),(161,'ar','مدريد',161),(162,'ar','ملقة',162),(163,'ar','مليلية',163),(164,'ar','مورسيا',164),(165,'ar','نافارا',165),(166,'ar','أورينس',166),(167,'ar','بلنسية',167),(168,'ar','بونتيفيدرا',168),(169,'ar','سالامانكا',169),(170,'ar','سانتا كروز دي تينيريفي',170),(171,'ar','سيغوفيا',171),(172,'ar','اشبيلية',172),(173,'ar','سوريا',173),(174,'ar','تاراغونا',174),(175,'ar','تيرويل',175),(176,'ar','توليدو',176),(177,'ar','فالنسيا',177),(178,'ar','بلد الوليد',178),(179,'ar','فيزكايا',179),(180,'ar','زامورا',180),(181,'ar','سرقسطة',181),(182,'ar','عين',182),(183,'ar','أيسن',183),(184,'ar','اليي',184),(185,'ar','ألب البروفنس العليا',185),(186,'ar','أوتس ألب',186),(187,'ar','ألب ماريتيم',187),(188,'ar','ARDECHE',188),(189,'ar','Ardennes',189),(190,'ar','آردن',190),(191,'ar','أوب',191),(192,'ar','اود',192),(193,'ar','أفيرون',193),(194,'ar','بوكاس دو رون',194),(195,'ar','كالفادوس',195),(196,'ar','كانتال',196),(197,'ar','شارانت',197),(198,'ar','سيين إت مارن',198),(199,'ar','شير',199),(200,'ar','كوريز',200),(201,'ar','سود كورس-دو-',201),(202,'ar','هوت كورس',202),(203,'ar','كوستا دوركوريز',203),(204,'ar','كوتس دورمور',204),(205,'ar','كروز',205),(206,'ar','دوردوني',206),(207,'ar','دوبس',207),(208,'ar','DrômeFinistère',208),(209,'ar','أور',209),(210,'ar','أور ولوار',210),(211,'ar','فينيستير',211),(212,'ar','جارد',212),(213,'ar','هوت غارون',213),(214,'ar','الخيام',214),(215,'ar','جيروند',215),(216,'ar','هيرولت',216),(217,'ar','إيل وفيلان',217),(218,'ar','إندر',218),(219,'ar','أندر ولوار',219),(220,'ar','إيسر',220),(221,'ar','العصر الجوارسي أو الجوري',221),(222,'ar','اندز',222),(223,'ar','لوار وشير',223),(224,'ar','لوار',224),(225,'ar','هوت-لوار',225),(226,'ar','وار أتلانتيك',226),(227,'ar','لورا',227),(228,'ar','كثيرا',228),(229,'ar','الكثير غارون',229),(230,'ar','لوزر',230),(231,'ar','مين-إي-لوار',231),(232,'ar','المانش',232),(233,'ar','مارن',233),(234,'ar','هوت مارن',234),(235,'ar','مايين',235),(236,'ar','مورت وموزيل',236),(237,'ar','ميوز',237),(238,'ar','موربيهان',238),(239,'ar','موسيل',239),(240,'ar','نيفر',240),(241,'ar','نورد',241),(242,'ar','إيل دو فرانس',242),(243,'ar','أورن',243),(244,'ar','با-دو-كاليه',244),(245,'ar','بوي دي دوم',245),(246,'ar','البرانيس ​​الأطلسية',246),(247,'ar','أوتس-بيرينيهs',247),(248,'ar','بيرينيه-أورينتال',248),(249,'ar','بس رين',249),(250,'ar','أوت رين',250),(251,'ar','رون [3]',251),(252,'ar','هوت-سون',252),(253,'ar','سون ولوار',253),(254,'ar','سارت',254),(255,'ar','سافوا',255),(256,'ar','هاوت سافوي',256),(257,'ar','باريس',257),(258,'ar','سين البحرية',258),(259,'ar','سيين إت مارن',259),(260,'ar','إيفلين',260),(261,'ar','دوكس سفرس',261),(262,'ar','السوم',262),(263,'ar','تارن',263),(264,'ar','تارن وغارون',264),(265,'ar','فار',265),(266,'ar','فوكلوز',266),(267,'ar','تارن',267),(268,'ar','فيين',268),(269,'ar','هوت فيين',269),(270,'ar','الفوج',270),(271,'ar','يون',271),(272,'ar','تيريتوير-دي-بلفور',272),(273,'ar','إيسون',273),(274,'ar','هوت دو سين',274),(275,'ar','سين سان دوني',275),(276,'ar','فال دو مارن',276),(277,'ar','فال دواز',277),(278,'ar','ألبا',278),(279,'ar','اراد',279),(280,'ar','ARGES',280),(281,'ar','باكاو',281),(282,'ar','بيهور',282),(283,'ar','بيستريتا ناسود',283),(284,'ar','بوتوساني',284),(285,'ar','براشوف',285),(286,'ar','برايلا',286),(287,'ar','بوخارست',287),(288,'ar','بوزاو',288),(289,'ar','كاراس سيفيرين',289),(290,'ar','كالاراسي',290),(291,'ar','كلوج',291),(292,'ar','كونستانتا',292),(293,'ar','كوفاسنا',293),(294,'ar','دامبوفيتا',294),(295,'ar','دولج',295),(296,'ar','جالاتي',296),(297,'ar','Giurgiu',297),(298,'ar','غيورغيو',298),(299,'ar','هارغيتا',299),(300,'ar','هونيدوارا',300),(301,'ar','ايالوميتا',301),(302,'ar','ياشي',302),(303,'ar','إيلفوف',303),(304,'ar','مارامريس',304),(305,'ar','MEHEDINTI',305),(306,'ar','موريس',306),(307,'ar','نيامتس',307),(308,'ar','أولت',308),(309,'ar','براهوفا',309),(310,'ar','ساتو ماري',310),(311,'ar','سالاج',311),(312,'ar','سيبيو',312),(313,'ar','سوسيفا',313),(314,'ar','تيليورمان',314),(315,'ar','تيم هو',315),(316,'ar','تولسيا',316),(317,'ar','فاسلوي',317),(318,'ar','فالسيا',318),(319,'ar','فرانتشا',319),(320,'ar','Lappi',320),(321,'ar','Pohjois-Pohjanmaa',321),(322,'ar','كاينو',322),(323,'ar','Pohjois-كارجالا',323),(324,'ar','Pohjois-سافو',324),(325,'ar','Etelä-سافو',325),(326,'ar','Etelä-Pohjanmaa',326),(327,'ar','Pohjanmaa',327),(328,'ar','بيركنما',328),(329,'ar','ساتا كونتا',329),(330,'ar','كسكي-Pohjanmaa',330),(331,'ar','كسكي-سومي',331),(332,'ar','Varsinais-سومي',332),(333,'ar','Etelä-كارجالا',333),(334,'ar','Päijät-Häme',334),(335,'ar','كانتا-HAME',335),(336,'ar','أوسيما',336),(337,'ar','أوسيما',337),(338,'ar','كومنلاكسو',338),(339,'ar','Ahvenanmaa',339),(340,'ar','Harjumaa',340),(341,'ar','هيوما',341),(342,'ar','المؤسسة الدولية للتنمية فيروما',342),(343,'ar','جوغفما',343),(344,'ar','يارفا',344),(345,'ar','انيما',345),(346,'ar','اني فيريوما',346),(347,'ar','بولفاما',347),(348,'ar','بارنوما',348),(349,'ar','Raplamaa',349),(350,'ar','Saaremaa',350),(351,'ar','Tartumaa',351),(352,'ar','Valgamaa',352),(353,'ar','Viljandimaa',353),(354,'ar','روايات Salacgr novvas',354),(355,'ar','داوجافبيلس',355),(356,'ar','يلغافا',356),(357,'ar','يكاب',357),(358,'ar','يورمال',358),(359,'ar','يابايا',359),(360,'ar','ليباج أبريس',360),(361,'ar','ريزكن',361),(362,'ar','ريغا',362),(363,'ar','مقاطعة ريغا',363),(364,'ar','فالميرا',364),(365,'ar','فنتسبيلز',365),(366,'ar','روايات Aglonas',366),(367,'ar','Aizkraukles novads',367),(368,'ar','Aizkraukles novads',368),(369,'ar','Aknīstes novads',369),(370,'ar','Alojas novads',370),(371,'ar','روايات Alsungas',371),(372,'ar','ألكسنس أبريز',372),(373,'ar','روايات أماتاس',373),(374,'ar','قرود الروايات',374),(375,'ar','روايات أوسيس',375),(376,'ar','بابيت الروايات',376),(377,'ar','Baldones الروايات',377),(378,'ar','بالتينافاس الروايات',378),(379,'ar','روايات بالفو',379),(380,'ar','Bauskas الروايات',380),(381,'ar','Beverīnas novads',381),(382,'ar','Novads Brocēnu',382),(383,'ar','Novads Burtnieku',383),(384,'ar','Carnikavas novads',384),(385,'ar','Cesvaines novads',385),(386,'ar','Ciblas novads',386),(387,'ar','تسو أبريس',387),(388,'ar','Dagdas novads',388),(389,'ar','Daugavpils novads',389),(390,'ar','روايات دوبيليس',390),(391,'ar','ديربيس الروايات',391),(392,'ar','ديربيس الروايات',392),(393,'ar','يشرك الروايات',393),(394,'ar','Garkalnes novads',394),(395,'ar','Grobiņas novads',395),(396,'ar','غولبينيس الروايات',396),(397,'ar','إيكافاس روايات',397),(398,'ar','Ikškiles novads',398),(399,'ar','Ilūkstes novads',399),(400,'ar','روايات Inčukalna',400),(401,'ar','Jaunjelgavas novads',401),(402,'ar','Jaunpiebalgas novads',402),(403,'ar','روايات Jaunpiebalgas',403),(404,'ar','Jelgavas novads',404),(405,'ar','جيكابيلس أبريز',405),(406,'ar','روايات كاندافاس',406),(407,'ar','Kokneses الروايات',407),(408,'ar','Krimuldas novads',408),(409,'ar','Krustpils الروايات',409),(410,'ar','Krāslavas Apriņķis',410),(411,'ar','كولدوغاس أبريز',411),(412,'ar','Kārsavas novads',412),(413,'ar','روايات ييلفاريس',413),(414,'ar','ليمباو أبريز',414),(415,'ar','روايات لباناس',415),(416,'ar','روايات لودزاس',416),(417,'ar','مقاطعة ليجاتني',417),(418,'ar','مقاطعة ليفاني',418),(419,'ar','مادونا روايات',419),(420,'ar','Mazsalacas novads',420),(421,'ar','روايات مالبلز',421),(422,'ar','Mārupes novads',422),(423,'ar','نوفاو نوكشنو',423),(424,'ar','روايات نيريتاس',424),(425,'ar','روايات نيكاس',425),(426,'ar','أغنام الروايات',426),(427,'ar','أولينيس الروايات',427),(428,'ar','روايات Ozolnieku',428),(429,'ar','بريسيو أبرييس',429),(430,'ar','Priekules الروايات',430),(431,'ar','كوندادو دي بريكوي',431),(432,'ar','Pärgaujas novads',432),(433,'ar','روايات بافيلوستاس',433),(434,'ar','بلافيناس مقاطعة',434),(435,'ar','روناس روايات',435),(436,'ar','Riebiņu novads',436),(437,'ar','روجاس روايات',437),(438,'ar','Novads روباو',438),(439,'ar','روكافاس روايات',439),(440,'ar','روغاجو روايات',440),(441,'ar','رندلس الروايات',441),(442,'ar','Radzeknes novads',442),(443,'ar','Rūjienas novads',443),(444,'ar','بلدية سالاسغريفا',444),(445,'ar','روايات سالاس',445),(446,'ar','Salaspils novads',446),(447,'ar','روايات سالدوس',447),(448,'ar','Novuls Saulkrastu',448),(449,'ar','سيغولداس روايات',449),(450,'ar','Skrundas novads',450),(451,'ar','مقاطعة Skrīveri',451),(452,'ar','يبتسم الروايات',452),(453,'ar','روايات Stopiņu',453),(454,'ar','روايات Stren novu',454),(455,'ar','سجاس روايات',455),(456,'ar','روايات تالسو',456),(457,'ar','توكوما الروايات',457),(458,'ar','Tērvetes novads',458),(459,'ar','Vaiņodes novads',459),(460,'ar','فالكاس الروايات',460),(461,'ar','فالميراس الروايات',461),(462,'ar','مقاطعة فاكلاني',462),(463,'ar','Vecpiebalgas novads',463),(464,'ar','روايات Vecumnieku',464),(465,'ar','فنتسبيلس الروايات',465),(466,'ar','Viesītes Novads',466),(467,'ar','Viļakas novads',467),(468,'ar','روايات فيناو',468),(469,'ar','Vārkavas novads',469),(470,'ar','روايات زيلوبس',470),(471,'ar','مقاطعة أدازي',471),(472,'ar','مقاطعة Erglu',472),(473,'ar','مقاطعة كيغمس',473),(474,'ar','مقاطعة كيكافا',474),(475,'ar','Alytaus Apskritis',475),(476,'ar','كاونو ابكريتيس',476),(477,'ar','Klaipėdos apskritis',477),(478,'ar','Marijampol\'s apskritis',478),(479,'ar','Panevėžio apskritis',479),(480,'ar','uliaulių apskritis',480),(481,'ar','Taurag\'s apskritis',481),(482,'ar','Telšių apskritis',482),(483,'ar','Utenos apskritis',483),(484,'ar','فيلنياوس ابكريتيس',484),(485,'ar','فدان',485),(486,'ar','ألاغواس',486),(487,'ar','أمابا',487),(488,'ar','أمازوناس',488),(489,'ar','باهيا',489),(490,'ar','سيارا',490),(491,'ar','إسبيريتو سانتو',491),(492,'ar','غوياس',492),(493,'ar','مارانهاو',493),(494,'ar','ماتو جروسو',494),(495,'ar','ماتو جروسو دو سول',495),(496,'ar','ميناس جريس',496),(497,'ar','بارا',497),(498,'ar','بارايبا',498),(499,'ar','بارانا',499),(500,'ar','بيرنامبوكو',500),(501,'ar','بياوي',501),(502,'ar','ريو دي جانيرو',502),(503,'ar','ريو غراندي دو نورتي',503),(504,'ar','ريو غراندي دو سول',504),(505,'ar','روندونيا',505),(506,'ar','رورايما',506),(507,'ar','سانتا كاتارينا',507),(508,'ar','ساو باولو',508),(509,'ar','سيرغيبي',509),(510,'ar','توكانتينز',510),(511,'ar','وفي مقاطعة الاتحادية',511),(512,'ar','Zagrebačka زوبانيا',512),(513,'ar','Krapinsko-zagorska زوبانيا',513),(514,'ar','Sisačko-moslavačka زوبانيا',514),(515,'ar','كارلوفيتش شوبانيا',515),(516,'ar','فارادينسكا زوبانيجا',516),(517,'ar','Koprivničko-križevačka زوبانيجا',517),(518,'ar','بيلوفارسكو-بيلوجورسكا',518),(519,'ar','بريمورسكو غورانسكا سوبانيا',519),(520,'ar','ليكو سينيسكا زوبانيا',520),(521,'ar','Virovitičko-podravska زوبانيا',521),(522,'ar','Požeško-slavonska županija',522),(523,'ar','Brodsko-posavska županija',523),(524,'ar','زادارسكا زوبانيجا',524),(525,'ar','Osječko-baranjska županija',525),(526,'ar','شيبنسكو-كنينسكا سوبانيا',526),(527,'ar','Virovitičko-podravska زوبانيا',527),(528,'ar','Splitsko-dalmatinska زوبانيا',528),(529,'ar','Istarska زوبانيا',529),(530,'ar','Dubrovačko-neretvanska زوبانيا',530),(531,'ar','Međimurska زوبانيا',531),(532,'ar','غراد زغرب',532),(533,'ar','جزر أندامان ونيكوبار',533),(534,'ar','ولاية اندرا براديش',534),(535,'ar','اروناتشال براديش',535),(536,'ar','أسام',536),(537,'ar','بيهار',537),(538,'ar','شانديغار',538),(539,'ar','تشهاتيسجاره',539),(540,'ar','دادرا ونجار هافيلي',540),(541,'ar','دامان وديو',541),(542,'ar','دلهي',542),(543,'ar','غوا',543),(544,'ar','غوجارات',544),(545,'ar','هاريانا',545),(546,'ar','هيماشال براديش',546),(547,'ar','جامو وكشمير',547),(548,'ar','جهارخاند',548),(549,'ar','كارناتاكا',549),(550,'ar','ولاية كيرالا',550),(551,'ar','اكشادويب',551),(552,'ar','ماديا براديش',552),(553,'ar','ماهاراشترا',553),(554,'ar','مانيبور',554),(555,'ar','ميغالايا',555),(556,'ar','ميزورام',556),(557,'ar','ناجالاند',557),(558,'ar','أوديشا',558),(559,'ar','بودوتشيري',559),(560,'ar','البنجاب',560),(561,'ar','راجستان',561),(562,'ar','سيكيم',562),(563,'ar','تاميل نادو',563),(564,'ar','تيلانجانا',564),(565,'ar','تريبورا',565),(566,'ar','ولاية اوتار براديش',566),(567,'ar','أوتارانتشال',567),(568,'ar','البنغال الغربية',568),(569,'fa','آلاباما',1),(570,'fa','آلاسکا',2),(571,'fa','ساموآ آمریکایی',3),(572,'fa','آریزونا',4),(573,'fa','آرکانزاس',5),(574,'fa','نیروهای مسلح آفریقا',6),(575,'fa','Armed Forces America',7),(576,'fa','نیروهای مسلح کانادا',8),(577,'fa','نیروهای مسلح اروپا',9),(578,'fa','نیروهای مسلح خاورمیانه',10),(579,'fa','نیروهای مسلح اقیانوس آرام',11),(580,'fa','کالیفرنیا',12),(581,'fa','کلرادو',13),(582,'fa','کانکتیکات',14),(583,'fa','دلاور',15),(584,'fa','منطقه کلمبیا',16),(585,'fa','ایالات فدرال میکرونزی',17),(586,'fa','فلوریدا',18),(587,'fa','جورجیا',19),(588,'fa','گوام',20),(589,'fa','هاوایی',21),(590,'fa','آیداهو',22),(591,'fa','ایلینویز',23),(592,'fa','ایندیانا',24),(593,'fa','آیووا',25),(594,'fa','کانزاس',26),(595,'fa','کنتاکی',27),(596,'fa','لوئیزیانا',28),(597,'fa','ماین',29),(598,'fa','مای',30),(599,'fa','مریلند',31),(600,'fa',' ',32),(601,'fa','میشیگان',33),(602,'fa','مینه سوتا',34),(603,'fa','می سی سی پی',35),(604,'fa','میسوری',36),(605,'fa','مونتانا',37),(606,'fa','نبراسکا',38),(607,'fa','نواد',39),(608,'fa','نیوهمپشایر',40),(609,'fa','نیوجرسی',41),(610,'fa','نیومکزیکو',42),(611,'fa','نیویورک',43),(612,'fa','کارولینای شمالی',44),(613,'fa','داکوتای شمالی',45),(614,'fa','جزایر ماریانای شمالی',46),(615,'fa','اوهایو',47),(616,'fa','اوکلاهما',48),(617,'fa','اورگان',49),(618,'fa','پالائو',50),(619,'fa','پنسیلوانیا',51),(620,'fa','پورتوریکو',52),(621,'fa','رود آیلند',53),(622,'fa','کارولینای جنوبی',54),(623,'fa','داکوتای جنوبی',55),(624,'fa','تنسی',56),(625,'fa','تگزاس',57),(626,'fa','یوتا',58),(627,'fa','ورمونت',59),(628,'fa','جزایر ویرجین',60),(629,'fa','ویرجینیا',61),(630,'fa','واشنگتن',62),(631,'fa','ویرجینیای غربی',63),(632,'fa','ویسکانسین',64),(633,'fa','وایومینگ',65),(634,'fa','آلبرتا',66),(635,'fa','بریتیش کلمبیا',67),(636,'fa','مانیتوبا',68),(637,'fa','نیوفاندلند و لابرادور',69),(638,'fa','نیوبرانزویک',70),(639,'fa','نوا اسکوشیا',71),(640,'fa','سرزمینهای شمال غربی',72),(641,'fa','نوناووت',73),(642,'fa','انتاریو',74),(643,'fa','جزیره پرنس ادوارد',75),(644,'fa','کبک',76),(645,'fa','ساسکاتچوان',77),(646,'fa','قلمرو یوکان',78),(647,'fa','نیدرزاکسن',79),(648,'fa','بادن-وورتمبرگ',80),(649,'fa','بایرن',81),(650,'fa','برلین',82),(651,'fa','براندنبورگ',83),(652,'fa','برمن',84),(653,'fa','هامبور',85),(654,'fa','هسن',86),(655,'fa','مکلنبورگ-وورپومرن',87),(656,'fa','نوردراین-وستفالن',88),(657,'fa','راینلاند-پلاتینات',89),(658,'fa','سارلند',90),(659,'fa','ساچسن',91),(660,'fa','ساچسن-آنهالت',92),(661,'fa','شلسویگ-هولشتاین',93),(662,'fa','تورینگی',94),(663,'fa','وین',95),(664,'fa','اتریش پایین',96),(665,'fa','اتریش فوقانی',97),(666,'fa','سالزبورگ',98),(667,'fa','کارنتا',99),(668,'fa','Steiermar',100),(669,'fa','تیرول',101),(670,'fa','بورگنلن',102),(671,'fa','Vorarlber',103),(672,'fa','آرگ',104),(673,'fa','',105),(674,'fa','اپنزلسرهودن',106),(675,'fa','بر',107),(676,'fa','بازل-لندشفت',108),(677,'fa','بازل استاد',109),(678,'fa','فرایبورگ',110),(679,'fa','گنف',111),(680,'fa','گلاروس',112),(681,'fa','Graubünde',113),(682,'fa','ژورا',114),(683,'fa','لوزرن',115),(684,'fa','نوینبور',116),(685,'fa','نیدالد',117),(686,'fa','اوبولدن',118),(687,'fa','سنت گالن',119),(688,'fa','شافهاوز',120),(689,'fa','سولوتور',121),(690,'fa','شووی',122),(691,'fa','تورگاو',123),(692,'fa','تسسی',124),(693,'fa','اوری',125),(694,'fa','وادت',126),(695,'fa','والی',127),(696,'fa','ز',128),(697,'fa','زوریخ',129),(698,'fa','کورونا',130),(699,'fa','آلاوا',131),(700,'fa','آلبوم',132),(701,'fa','آلیکانت',133),(702,'fa','آلمریا',134),(703,'fa','آستوریا',135),(704,'fa','آویلا',136),(705,'fa','باداژوز',137),(706,'fa','ضرب و شتم',138),(707,'fa','بارسلون',139),(708,'fa','بورگو',140),(709,'fa','کاسر',141),(710,'fa','کادی',142),(711,'fa','کانتابریا',143),(712,'fa','کاستلون',144),(713,'fa','سوت',145),(714,'fa','سیوداد واقعی',146),(715,'fa','کوردوب',147),(716,'fa','Cuenc',148),(717,'fa','جیرون',149),(718,'fa','گراناد',150),(719,'fa','گوادالاجار',151),(720,'fa','Guipuzcoa',152),(721,'fa','هولوا',153),(722,'fa','هوسک',154),(723,'fa','جی',155),(724,'fa','لا ریوجا',156),(725,'fa','لاس پالماس',157),(726,'fa','لئو',158),(727,'fa','Lleid',159),(728,'fa','لوگ',160),(729,'fa','مادری',161),(730,'fa','مالاگ',162),(731,'fa','ملیلی',163),(732,'fa','مورسیا',164),(733,'fa','ناوار',165),(734,'fa','اورنس',166),(735,'fa','پالنسی',167),(736,'fa','پونتوودر',168),(737,'fa','سالامانک',169),(738,'fa','سانتا کروز د تنریفه',170),(739,'fa','سوگویا',171),(740,'fa','سوی',172),(741,'fa','سوریا',173),(742,'fa','تاراگونا',174),(743,'fa','ترئو',175),(744,'fa','تولدو',176),(745,'fa','والنسیا',177),(746,'fa','والادولی',178),(747,'fa','ویزکایا',179),(748,'fa','زامور',180),(749,'fa','ساراگوز',181),(750,'fa','عی',182),(751,'fa','آیز',183),(752,'fa','آلی',184),(753,'fa','آلپ-دو-هاوت-پرووانس',185),(754,'fa','هاوتس آلپ',186),(755,'fa','Alpes-Maritime',187),(756,'fa','اردچه',188),(757,'fa','آرد',189),(758,'fa','محاصر',190),(759,'fa','آبه',191),(760,'fa','Aud',192),(761,'fa','آویرون',193),(762,'fa','BOCAS DO Rhône',194),(763,'fa','نوعی عرق',195),(764,'fa','کانتینال',196),(765,'fa','چارنت',197),(766,'fa','چارنت-دریایی',198),(767,'fa','چ',199),(768,'fa','کور',200),(769,'fa','کرس دو ساد',201),(770,'fa','هاوت کورس',202),(771,'fa','کوستا دورکرز',203),(772,'fa','تخت دارمور',204),(773,'fa','درهم',205),(774,'fa','دوردگن',206),(775,'fa','دوب',207),(776,'fa','تعریف اول',208),(777,'fa','یور',209),(778,'fa','Eure-et-Loi',210),(779,'fa','فمینیست',211),(780,'fa','باغ',212),(781,'fa','اوت-گارون',213),(782,'fa','گر',214),(783,'fa','جیروند',215),(784,'fa','هیر',216),(785,'fa','هشدار داده می شود',217),(786,'fa','ایندور',218),(787,'fa','Indre-et-Loir',219),(788,'fa','ایزر',220),(789,'fa','یور',221),(790,'fa','لندز',222),(791,'fa','Loir-et-Che',223),(792,'fa','وام گرفتن',224),(793,'fa','Haute-Loir',225),(794,'fa','Loire-Atlantiqu',226),(795,'fa','لیرت',227),(796,'fa','لوط',228),(797,'fa','لوت و گارون',229),(798,'fa','لوزر',230),(799,'fa','ماین et-Loire',231),(800,'fa','مانچ',232),(801,'fa','مارن',233),(802,'fa','هاوت-مارن',234),(803,'fa','مایین',235),(804,'fa','مورته-et-Moselle',236),(805,'fa','مسخره کردن',237),(806,'fa','موربیان',238),(807,'fa','موزل',239),(808,'fa','Nièvr',240),(809,'fa','نورد',241),(810,'fa','اوی',242),(811,'fa','ارن',243),(812,'fa','پاس-کاله',244),(813,'fa','Puy-de-Dôm',245),(814,'fa','Pyrénées-Atlantiques',246),(815,'fa','Hautes-Pyrénée',247),(816,'fa','Pyrénées-Orientales',248),(817,'fa','بس راین',249),(818,'fa','هاوت-رین',250),(819,'fa','رو',251),(820,'fa','Haute-Saône',252),(821,'fa','Saône-et-Loire',253),(822,'fa','سارته',254),(823,'fa','ساووی',255),(824,'fa','هاو-ساووی',256),(825,'fa','پاری',257),(826,'fa','Seine-Maritime',258),(827,'fa','Seine-et-Marn',259),(828,'fa','ایولینز',260),(829,'fa','Deux-Sèvres',261),(830,'fa','سمی',262),(831,'fa','ضعف',263),(832,'fa','Tarn-et-Garonne',264),(833,'fa','وار',265),(834,'fa','ووکلوز',266),(835,'fa','وندیه',267),(836,'fa','وین',268),(837,'fa','هاوت-وین',269),(838,'fa','رأی دادن',270),(839,'fa','یون',271),(840,'fa','سرزمین-دو-بلفورت',272),(841,'fa','اسون',273),(842,'fa','هاوتز دی سی',274),(843,'fa','Seine-Saint-Deni',275),(844,'fa','والد مارن',276),(845,'fa','Val-d\'Ois',277),(846,'fa','آلبا',278),(847,'fa','آرا',279),(848,'fa','Argeș',280),(849,'fa','باکو',281),(850,'fa','بیهور',282),(851,'fa','بیستریا-نسوود',283),(852,'fa','بوتانی',284),(853,'fa','برازوف',285),(854,'fa','Brăila',286),(855,'fa','București',287),(856,'fa','بوز',288),(857,'fa','کارا- Severin',289),(858,'fa','کالیراسی',290),(859,'fa','كلوژ',291),(860,'fa','کنستانس',292),(861,'fa','کواسنا',293),(862,'fa','Dâmbovița',294),(863,'fa','دال',295),(864,'fa','گالشی',296),(865,'fa','جورجیو',297),(866,'fa','گور',298),(867,'fa','هارگیتا',299),(868,'fa','هوندهار',300),(869,'fa','ایالومیشا',301),(870,'fa','Iași',302),(871,'fa','Ilfo',303),(872,'fa','Maramureș',304),(873,'fa','Mehedinți',305),(874,'fa','Mureș',306),(875,'fa','Neamț',307),(876,'fa','اولت',308),(877,'fa','پرهوا',309),(878,'fa','ستو ماره',310),(879,'fa','سلاج',311),(880,'fa','سیبیو',312),(881,'fa','سوساو',313),(882,'fa','تلورمان',314),(883,'fa','تیمیچ',315),(884,'fa','تولسا',316),(885,'fa','واسلوئی',317),(886,'fa','Vâlcea',318),(887,'fa','ورانسا',319),(888,'fa','لاپی',320),(889,'fa','Pohjois-Pohjanmaa',321),(890,'fa','کائینو',322),(891,'fa','Pohjois-Karjala',323),(892,'fa','Pohjois-Savo',324),(893,'fa','اتل-ساوو',325),(894,'fa','کسکی-پوهانما',326),(895,'fa','Pohjanmaa',327),(896,'fa','پیرکانما',328),(897,'fa','ساتاکونتا',329),(898,'fa','کسکی-پوهانما',330),(899,'fa','کسکی-سوومی',331),(900,'fa','Varsinais-Suomi',332),(901,'fa','اتلی کرجالا',333),(902,'fa','Päijät-HAM',334),(903,'fa','کانتا-هوم',335),(904,'fa','یوسیما',336),(905,'fa','اوسیم',337),(906,'fa','کیمنلاکو',338),(907,'fa','آونوانما',339),(908,'fa','هارژوم',340),(909,'fa','سلا',341),(910,'fa','آیدا-ویروما',342),(911,'fa','Jõgevamaa',343),(912,'fa','جوروماا',344),(913,'fa','لونما',345),(914,'fa','لون-ویروما',346),(915,'fa','پالوماا',347),(916,'fa','پورنوما',348),(917,'fa','Raplama',349),(918,'fa','ساارما',350),(919,'fa','تارتوما',351),(920,'fa','والگام',352),(921,'fa','ویلجاندیم',353),(922,'fa','Võrumaa',354),(923,'fa','داگاوپیل',355),(924,'fa','جلگاو',356),(925,'fa','جکابیل',357),(926,'fa','جرمل',358),(927,'fa','لیپجا',359),(928,'fa','شهرستان لیپاج',360),(929,'fa','روژن',361),(930,'fa','راگ',362),(931,'fa','شهرستان ریگ',363),(932,'fa','والمییرا',364),(933,'fa','Ventspils',365),(934,'fa','آگلوناس نوادا',366),(935,'fa','تازه کاران آیزکرایکلس',367),(936,'fa','تازه واردان',368),(937,'fa','شهرستا',369),(938,'fa','نوازندگان آلوجاس',370),(939,'fa','تازه های آلسونگاس',371),(940,'fa','شهرستان آلوکس',372),(941,'fa','تازه کاران آماتاس',373),(942,'fa','میمون های تازه',374),(943,'fa','نوادا را آویز می کند',375),(944,'fa','شهرستان بابی',376),(945,'fa','Baldones novad',377),(946,'fa','نوین های بالتیناوا',378),(947,'fa','Balvu novad',379),(948,'fa','نوازندگان باسکاس',380),(949,'fa','شهرستان بورین',381),(950,'fa','شهرستان بروچن',382),(951,'fa','بوردنیکو نوآوران',383),(952,'fa','تازه کارنیکاوا',384),(953,'fa','نوازان سزوینس',385),(954,'fa','نوادگان Cibla',386),(955,'fa','شهرستان Cesis',387),(956,'fa','تازه های داگدا',388),(957,'fa','داوگاوپیلز نوادا',389),(958,'fa','دابل نوادی',390),(959,'fa','تازه کارهای دنداگاس',391),(960,'fa','نوباد دوربس',392),(961,'fa','مشغول تازه کارها است',393),(962,'fa','گرکالنس نواد',394),(963,'fa','یا شهرستان گروبی',395),(964,'fa','تازه های گلبنس',396),(965,'fa','Iecavas novads',397),(966,'fa','شهرستان ایسکل',398),(967,'fa','ایالت ایلکست',399),(968,'fa','کنددو د اینچوکالن',400),(969,'fa','نوجواد Jaunjelgavas',401),(970,'fa','تازه های Jaunpiebalgas',402),(971,'fa','شهرستان جونپیلس',403),(972,'fa','شهرستان جگلو',404),(973,'fa','شهرستان جکابیل',405),(974,'fa','شهرستان کنداوا',406),(975,'fa','شهرستان کوکنز',407),(976,'fa','شهرستان کریمولد',408),(977,'fa','شهرستان کرستپیل',409),(978,'fa','شهرستان کراسلاو',410),(979,'fa','کاندادو د کلدیگا',411),(980,'fa','کاندادو د کارساوا',412),(981,'fa','شهرستان لیولوارد',413),(982,'fa','شهرستان لیمباشی',414),(983,'fa','ای ولسوالی لوبون',415),(984,'fa','شهرستان لودزا',416),(985,'fa','شهرستان لیگات',417),(986,'fa','شهرستان لیوانی',418),(987,'fa','شهرستان مادونا',419),(988,'fa','شهرستان مازسال',420),(989,'fa','شهرستان مالپیلس',421),(990,'fa','شهرستان Mārupe',422),(991,'fa','ا کنددو د نوکشنی',423),(992,'fa','کاملاً یک شهرستان',424),(993,'fa','شهرستان نیکا',425),(994,'fa','شهرستان اوگر',426),(995,'fa','شهرستان اولین',427),(996,'fa','شهرستان اوزولنیکی',428),(997,'fa','شهرستان پرلیلی',429),(998,'fa','شهرستان Priekule',430),(999,'fa','Condado de Priekuļi',431),(1000,'fa','شهرستان در حال حرکت',432),(1001,'fa','شهرستان پاویلوستا',433),(1002,'fa','شهرستان Plavinas',4),(1003,'fa','شهرستان راونا',435),(1004,'fa','شهرستان ریبیشی',436),(1005,'fa','شهرستان روجا',437),(1006,'fa','شهرستان روپازی',438),(1007,'fa','شهرستان روساوا',439),(1008,'fa','شهرستان روگی',440),(1009,'fa','شهرستان راندل',441),(1010,'fa','شهرستان ریزکن',442),(1011,'fa','شهرستان روژینا',443),(1012,'fa','شهرداری Salacgriva',444),(1013,'fa','منطقه جزیره',445),(1014,'fa','شهرستان Salaspils',446),(1015,'fa','شهرستان سالدوس',447),(1016,'fa','شهرستان ساولکرستی',448),(1017,'fa','شهرستان سیگولدا',449),(1018,'fa','شهرستان Skrunda',450),(1019,'fa','شهرستان Skrīveri',451),(1020,'fa','شهرستان Smiltene',452),(1021,'fa','شهرستان ایستینی',453),(1022,'fa','شهرستان استرنشی',454),(1023,'fa','منطقه کاشت',455),(1024,'fa','شهرستان تالسی',456),(1025,'fa','توکومس',457),(1026,'fa','شهرستان تورت',458),(1027,'fa','یا شهرستان وایودود',459),(1028,'fa','شهرستان والکا',460),(1029,'fa','شهرستان Valmiera',461),(1030,'fa','شهرستان وارکانی',462),(1031,'fa','شهرستان Vecpiebalga',463),(1032,'fa','شهرستان وکومنیکی',464),(1033,'fa','شهرستان ونتسپیل',465),(1034,'fa','کنددو د بازدید',466),(1035,'fa','شهرستان ویلاکا',467),(1036,'fa','شهرستان ویلانی',468),(1037,'fa','شهرستان واركاوا',469),(1038,'fa','شهرستان زیلوپ',470),(1039,'fa','شهرستان آدازی',471),(1040,'fa','شهرستان ارگلو',472),(1041,'fa','شهرستان کگومس',473),(1042,'fa','شهرستان ککاوا',474),(1043,'fa','شهرستان Alytus',475),(1044,'fa','شهرستان Kaunas',476),(1045,'fa','شهرستان کلایپدا',477),(1046,'fa','شهرستان ماریجامپولی',478),(1047,'fa','شهرستان پانویسیز',479),(1048,'fa','شهرستان سیاولیا',480),(1049,'fa','شهرستان تاجیج',481),(1050,'fa','شهرستان تلشیا',482),(1051,'fa','شهرستان اوتنا',483),(1052,'fa','شهرستان ویلنیوس',484),(1053,'fa','جریب',485),(1054,'fa','حالت',486),(1055,'fa','آمپá',487),(1056,'fa','آمازون',488),(1057,'fa','باهی',489),(1058,'fa','سارا',490),(1059,'fa','روح القدس',491),(1060,'fa','برو',492),(1061,'fa','مارانهائ',493),(1062,'fa','ماتو گروسو',494),(1063,'fa','Mato Grosso do Sul',495),(1064,'fa','ایالت میناس گرایس',496),(1065,'fa','پار',497),(1066,'fa','حالت',498),(1067,'fa','پارانا',499),(1068,'fa','حال',500),(1069,'fa','پیازو',501),(1070,'fa','ریو دوژانیرو',502),(1071,'fa','ریو گراند دو نورته',503),(1072,'fa','ریو گراند دو سول',504),(1073,'fa','Rondôni',505),(1074,'fa','Roraim',506),(1075,'fa','سانتا کاتارینا',507),(1076,'fa','پ',508),(1077,'fa','Sergip',509),(1078,'fa','توکانتین',510),(1079,'fa','منطقه فدرال',511),(1080,'fa','شهرستان زاگرب',512),(1081,'fa','Condado de Krapina-Zagorj',513),(1082,'fa','شهرستان سیساک-موسلاوینا',514),(1083,'fa','شهرستان کارلوواک',515),(1084,'fa','شهرداری واراžدین',516),(1085,'fa','Condo de Koprivnica-Križevci',517),(1086,'fa','محل سکونت د بیلوار-بلوگورا',518),(1087,'fa','Condado de Primorje-Gorski kotar',519),(1088,'fa','شهرستان لیکا-سنج',520),(1089,'fa','Condado de Virovitica-Podravina',521),(1090,'fa','شهرستان پوژگا-اسلاونیا',522),(1091,'fa','Condado de Brod-Posavina',523),(1092,'fa','شهرستان زجر',524),(1093,'fa','Condado de Osijek-Baranja',525),(1094,'fa','Condo de Sibenik-Knin',526),(1095,'fa','Condado de Vukovar-Srijem',527),(1096,'fa','شهرستان اسپلیت-Dalmatia',528),(1097,'fa','شهرستان ایستیا',529),(1098,'fa','Condado de Dubrovnik-Neretva',530),(1099,'fa','شهرستان Međimurje',531),(1100,'fa','شهر زاگرب',532),(1101,'fa','جزایر آندامان و نیکوبار',533),(1102,'fa','آندرا پرادش',534),(1103,'fa','آروناچال پرادش',535),(1104,'fa','آسام',536),(1105,'fa','Biha',537),(1106,'fa','چاندیگار',538),(1107,'fa','چاتیسگار',539),(1108,'fa','دادرا و نگار هاولی',540),(1109,'fa','دامان و دیو',541),(1110,'fa','دهلی',542),(1111,'fa','گوا',543),(1112,'fa','گجرات',544),(1113,'fa','هاریانا',545),(1114,'fa','هیماچال پرادش',546),(1115,'fa','جامو و کشمیر',547),(1116,'fa','جهخند',548),(1117,'fa','کارناتاکا',549),(1118,'fa','کرال',550),(1119,'fa','لاکشادوپ',551),(1120,'fa','مادیا پرادش',552),(1121,'fa','ماهاراشترا',553),(1122,'fa','مانی پور',554),(1123,'fa','مگالایا',555),(1124,'fa','مزورام',556),(1125,'fa','ناگلند',557),(1126,'fa','ادیشا',558),(1127,'fa','میناکاری',559),(1128,'fa','پنجا',560),(1129,'fa','راجستان',561),(1130,'fa','سیکیم',562),(1131,'fa','تامیل نادو',563),(1132,'fa','تلنگانا',564),(1133,'fa','تریپورا',565),(1134,'fa','اوتار پرادش',566),(1135,'fa','اوتاراکند',567),(1136,'fa','بنگال غرب',568),(1137,'pt_BR','Alabama',1),(1138,'pt_BR','Alaska',2),(1139,'pt_BR','Samoa Americana',3),(1140,'pt_BR','Arizona',4),(1141,'pt_BR','Arkansas',5),(1142,'pt_BR','Forças Armadas da África',6),(1143,'pt_BR','Forças Armadas das Américas',7),(1144,'pt_BR','Forças Armadas do Canadá',8),(1145,'pt_BR','Forças Armadas da Europa',9),(1146,'pt_BR','Forças Armadas do Oriente Médio',10),(1147,'pt_BR','Forças Armadas do Pacífico',11),(1148,'pt_BR','California',12),(1149,'pt_BR','Colorado',13),(1150,'pt_BR','Connecticut',14),(1151,'pt_BR','Delaware',15),(1152,'pt_BR','Distrito de Columbia',16),(1153,'pt_BR','Estados Federados da Micronésia',17),(1154,'pt_BR','Florida',18),(1155,'pt_BR','Geórgia',19),(1156,'pt_BR','Guam',20),(1157,'pt_BR','Havaí',21),(1158,'pt_BR','Idaho',22),(1159,'pt_BR','Illinois',23),(1160,'pt_BR','Indiana',24),(1161,'pt_BR','Iowa',25),(1162,'pt_BR','Kansas',26),(1163,'pt_BR','Kentucky',27),(1164,'pt_BR','Louisiana',28),(1165,'pt_BR','Maine',29),(1166,'pt_BR','Ilhas Marshall',30),(1167,'pt_BR','Maryland',31),(1168,'pt_BR','Massachusetts',32),(1169,'pt_BR','Michigan',33),(1170,'pt_BR','Minnesota',34),(1171,'pt_BR','Mississippi',35),(1172,'pt_BR','Missouri',36),(1173,'pt_BR','Montana',37),(1174,'pt_BR','Nebraska',38),(1175,'pt_BR','Nevada',39),(1176,'pt_BR','New Hampshire',40),(1177,'pt_BR','Nova Jersey',41),(1178,'pt_BR','Novo México',42),(1179,'pt_BR','Nova York',43),(1180,'pt_BR','Carolina do Norte',44),(1181,'pt_BR','Dakota do Norte',45),(1182,'pt_BR','Ilhas Marianas do Norte',46),(1183,'pt_BR','Ohio',47),(1184,'pt_BR','Oklahoma',48),(1185,'pt_BR','Oregon',4),(1186,'pt_BR','Palau',50),(1187,'pt_BR','Pensilvânia',51),(1188,'pt_BR','Porto Rico',52),(1189,'pt_BR','Rhode Island',53),(1190,'pt_BR','Carolina do Sul',54),(1191,'pt_BR','Dakota do Sul',55),(1192,'pt_BR','Tennessee',56),(1193,'pt_BR','Texas',57),(1194,'pt_BR','Utah',58),(1195,'pt_BR','Vermont',59),(1196,'pt_BR','Ilhas Virgens',60),(1197,'pt_BR','Virginia',61),(1198,'pt_BR','Washington',62),(1199,'pt_BR','West Virginia',63),(1200,'pt_BR','Wisconsin',64),(1201,'pt_BR','Wyoming',65),(1202,'pt_BR','Alberta',66),(1203,'pt_BR','Colúmbia Britânica',67),(1204,'pt_BR','Manitoba',68),(1205,'pt_BR','Terra Nova e Labrador',69),(1206,'pt_BR','New Brunswick',70),(1207,'pt_BR','Nova Escócia',7),(1208,'pt_BR','Territórios do Noroeste',72),(1209,'pt_BR','Nunavut',73),(1210,'pt_BR','Ontario',74),(1211,'pt_BR','Ilha do Príncipe Eduardo',75),(1212,'pt_BR','Quebec',76),(1213,'pt_BR','Saskatchewan',77),(1214,'pt_BR','Território yukon',78),(1215,'pt_BR','Niedersachsen',79),(1216,'pt_BR','Baden-Wurttemberg',80),(1217,'pt_BR','Bayern',81),(1218,'pt_BR','Berlim',82),(1219,'pt_BR','Brandenburg',83),(1220,'pt_BR','Bremen',84),(1221,'pt_BR','Hamburgo',85),(1222,'pt_BR','Hessen',86),(1223,'pt_BR','Mecklenburg-Vorpommern',87),(1224,'pt_BR','Nordrhein-Westfalen',88),(1225,'pt_BR','Renânia-Palatinado',8),(1226,'pt_BR','Sarre',90),(1227,'pt_BR','Sachsen',91),(1228,'pt_BR','Sachsen-Anhalt',92),(1229,'pt_BR','Schleswig-Holstein',93),(1230,'pt_BR','Turíngia',94),(1231,'pt_BR','Viena',95),(1232,'pt_BR','Baixa Áustria',96),(1233,'pt_BR','Oberösterreich',97),(1234,'pt_BR','Salzburg',98),(1235,'pt_BR','Caríntia',99),(1236,'pt_BR','Steiermark',100),(1237,'pt_BR','Tirol',101),(1238,'pt_BR','Burgenland',102),(1239,'pt_BR','Vorarlberg',103),(1240,'pt_BR','Aargau',104),(1241,'pt_BR','Appenzell Innerrhoden',105),(1242,'pt_BR','Appenzell Ausserrhoden',106),(1243,'pt_BR','Bern',107),(1244,'pt_BR','Basel-Landschaft',108),(1245,'pt_BR','Basel-Stadt',109),(1246,'pt_BR','Freiburg',110),(1247,'pt_BR','Genf',111),(1248,'pt_BR','Glarus',112),(1249,'pt_BR','Grisons',113),(1250,'pt_BR','Jura',114),(1251,'pt_BR','Luzern',115),(1252,'pt_BR','Neuenburg',116),(1253,'pt_BR','Nidwalden',117),(1254,'pt_BR','Obwalden',118),(1255,'pt_BR','St. Gallen',119),(1256,'pt_BR','Schaffhausen',120),(1257,'pt_BR','Solothurn',121),(1258,'pt_BR','Schwyz',122),(1259,'pt_BR','Thurgau',123),(1260,'pt_BR','Tessin',124),(1261,'pt_BR','Uri',125),(1262,'pt_BR','Waadt',126),(1263,'pt_BR','Wallis',127),(1264,'pt_BR','Zug',128),(1265,'pt_BR','Zurique',129),(1266,'pt_BR','Corunha',130),(1267,'pt_BR','Álava',131),(1268,'pt_BR','Albacete',132),(1269,'pt_BR','Alicante',133),(1270,'pt_BR','Almeria',134),(1271,'pt_BR','Astúrias',135),(1272,'pt_BR','Avila',136),(1273,'pt_BR','Badajoz',137),(1274,'pt_BR','Baleares',138),(1275,'pt_BR','Barcelona',139),(1276,'pt_BR','Burgos',140),(1277,'pt_BR','Caceres',141),(1278,'pt_BR','Cadiz',142),(1279,'pt_BR','Cantábria',143),(1280,'pt_BR','Castellon',144),(1281,'pt_BR','Ceuta',145),(1282,'pt_BR','Ciudad Real',146),(1283,'pt_BR','Cordoba',147),(1284,'pt_BR','Cuenca',148),(1285,'pt_BR','Girona',149),(1286,'pt_BR','Granada',150),(1287,'pt_BR','Guadalajara',151),(1288,'pt_BR','Guipuzcoa',152),(1289,'pt_BR','Huelva',153),(1290,'pt_BR','Huesca',154),(1291,'pt_BR','Jaen',155),(1292,'pt_BR','La Rioja',156),(1293,'pt_BR','Las Palmas',157),(1294,'pt_BR','Leon',158),(1295,'pt_BR','Lleida',159),(1296,'pt_BR','Lugo',160),(1297,'pt_BR','Madri',161),(1298,'pt_BR','Málaga',162),(1299,'pt_BR','Melilla',163),(1300,'pt_BR','Murcia',164),(1301,'pt_BR','Navarra',165),(1302,'pt_BR','Ourense',166),(1303,'pt_BR','Palencia',167),(1304,'pt_BR','Pontevedra',168),(1305,'pt_BR','Salamanca',169),(1306,'pt_BR','Santa Cruz de Tenerife',170),(1307,'pt_BR','Segovia',171),(1308,'pt_BR','Sevilla',172),(1309,'pt_BR','Soria',173),(1310,'pt_BR','Tarragona',174),(1311,'pt_BR','Teruel',175),(1312,'pt_BR','Toledo',176),(1313,'pt_BR','Valencia',177),(1314,'pt_BR','Valladolid',178),(1315,'pt_BR','Vizcaya',179),(1316,'pt_BR','Zamora',180),(1317,'pt_BR','Zaragoza',181),(1318,'pt_BR','Ain',182),(1319,'pt_BR','Aisne',183),(1320,'pt_BR','Allier',184),(1321,'pt_BR','Alpes da Alta Provença',185),(1322,'pt_BR','Altos Alpes',186),(1323,'pt_BR','Alpes-Maritimes',187),(1324,'pt_BR','Ardèche',188),(1325,'pt_BR','Ardennes',189),(1326,'pt_BR','Ariege',190),(1327,'pt_BR','Aube',191),(1328,'pt_BR','Aude',192),(1329,'pt_BR','Aveyron',193),(1330,'pt_BR','BOCAS DO Rhône',194),(1331,'pt_BR','Calvados',195),(1332,'pt_BR','Cantal',196),(1333,'pt_BR','Charente',197),(1334,'pt_BR','Charente-Maritime',198),(1335,'pt_BR','Cher',199),(1336,'pt_BR','Corrèze',200),(1337,'pt_BR','Corse-du-Sud',201),(1338,'pt_BR','Alta Córsega',202),(1339,'pt_BR','Costa d\'OrCorrèze',203),(1340,'pt_BR','Cotes d\'Armor',204),(1341,'pt_BR','Creuse',205),(1342,'pt_BR','Dordogne',206),(1343,'pt_BR','Doubs',207),(1344,'pt_BR','DrômeFinistère',208),(1345,'pt_BR','Eure',209),(1346,'pt_BR','Eure-et-Loir',210),(1347,'pt_BR','Finistère',211),(1348,'pt_BR','Gard',212),(1349,'pt_BR','Haute-Garonne',213),(1350,'pt_BR','Gers',214),(1351,'pt_BR','Gironde',215),(1352,'pt_BR','Hérault',216),(1353,'pt_BR','Ille-et-Vilaine',217),(1354,'pt_BR','Indre',218),(1355,'pt_BR','Indre-et-Loire',219),(1356,'pt_BR','Isère',220),(1357,'pt_BR','Jura',221),(1358,'pt_BR','Landes',222),(1359,'pt_BR','Loir-et-Cher',223),(1360,'pt_BR','Loire',224),(1361,'pt_BR','Haute-Loire',22),(1362,'pt_BR','Loire-Atlantique',226),(1363,'pt_BR','Loiret',227),(1364,'pt_BR','Lot',228),(1365,'pt_BR','Lot e Garona',229),(1366,'pt_BR','Lozère',230),(1367,'pt_BR','Maine-et-Loire',231),(1368,'pt_BR','Manche',232),(1369,'pt_BR','Marne',233),(1370,'pt_BR','Haute-Marne',234),(1371,'pt_BR','Mayenne',235),(1372,'pt_BR','Meurthe-et-Moselle',236),(1373,'pt_BR','Meuse',237),(1374,'pt_BR','Morbihan',238),(1375,'pt_BR','Moselle',239),(1376,'pt_BR','Nièvre',240),(1377,'pt_BR','Nord',241),(1378,'pt_BR','Oise',242),(1379,'pt_BR','Orne',243),(1380,'pt_BR','Pas-de-Calais',244),(1381,'pt_BR','Puy-de-Dôme',24),(1382,'pt_BR','Pirineus Atlânticos',246),(1383,'pt_BR','Hautes-Pyrénées',247),(1384,'pt_BR','Pirineus Orientais',248),(1385,'pt_BR','Bas-Rhin',249),(1386,'pt_BR','Alto Reno',250),(1387,'pt_BR','Rhône',251),(1388,'pt_BR','Haute-Saône',252),(1389,'pt_BR','Saône-et-Loire',253),(1390,'pt_BR','Sarthe',25),(1391,'pt_BR','Savoie',255),(1392,'pt_BR','Alta Sabóia',256),(1393,'pt_BR','Paris',257),(1394,'pt_BR','Seine-Maritime',258),(1395,'pt_BR','Seine-et-Marne',259),(1396,'pt_BR','Yvelines',260),(1397,'pt_BR','Deux-Sèvres',261),(1398,'pt_BR','Somme',262),(1399,'pt_BR','Tarn',263),(1400,'pt_BR','Tarn-et-Garonne',264),(1401,'pt_BR','Var',265),(1402,'pt_BR','Vaucluse',266),(1403,'pt_BR','Compradora',267),(1404,'pt_BR','Vienne',268),(1405,'pt_BR','Haute-Vienne',269),(1406,'pt_BR','Vosges',270),(1407,'pt_BR','Yonne',271),(1408,'pt_BR','Território de Belfort',272),(1409,'pt_BR','Essonne',273),(1410,'pt_BR','Altos do Sena',274),(1411,'pt_BR','Seine-Saint-Denis',275),(1412,'pt_BR','Val-de-Marne',276),(1413,'pt_BR','Val-d\'Oise',277),(1414,'pt_BR','Alba',278),(1415,'pt_BR','Arad',279),(1416,'pt_BR','Arges',280),(1417,'pt_BR','Bacau',281),(1418,'pt_BR','Bihor',282),(1419,'pt_BR','Bistrita-Nasaud',283),(1420,'pt_BR','Botosani',284),(1421,'pt_BR','Brașov',285),(1422,'pt_BR','Braila',286),(1423,'pt_BR','Bucareste',287),(1424,'pt_BR','Buzau',288),(1425,'pt_BR','Caras-Severin',289),(1426,'pt_BR','Călărași',290),(1427,'pt_BR','Cluj',291),(1428,'pt_BR','Constanta',292),(1429,'pt_BR','Covasna',29),(1430,'pt_BR','Dambovita',294),(1431,'pt_BR','Dolj',295),(1432,'pt_BR','Galati',296),(1433,'pt_BR','Giurgiu',297),(1434,'pt_BR','Gorj',298),(1435,'pt_BR','Harghita',299),(1436,'pt_BR','Hunedoara',300),(1437,'pt_BR','Ialomita',301),(1438,'pt_BR','Iasi',302),(1439,'pt_BR','Ilfov',303),(1440,'pt_BR','Maramures',304),(1441,'pt_BR','Maramures',305),(1442,'pt_BR','Mures',306),(1443,'pt_BR','alemão',307),(1444,'pt_BR','Olt',308),(1445,'pt_BR','Prahova',309),(1446,'pt_BR','Satu-Mare',310),(1447,'pt_BR','Salaj',311),(1448,'pt_BR','Sibiu',312),(1449,'pt_BR','Suceava',313),(1450,'pt_BR','Teleorman',314),(1451,'pt_BR','Timis',315),(1452,'pt_BR','Tulcea',316),(1453,'pt_BR','Vaslui',317),(1454,'pt_BR','dale',318),(1455,'pt_BR','Vrancea',319),(1456,'pt_BR','Lappi',320),(1457,'pt_BR','Pohjois-Pohjanmaa',321),(1458,'pt_BR','Kainuu',322),(1459,'pt_BR','Pohjois-Karjala',323),(1460,'pt_BR','Pohjois-Savo',324),(1461,'pt_BR','Sul Savo',325),(1462,'pt_BR','Ostrobothnia do sul',326),(1463,'pt_BR','Pohjanmaa',327),(1464,'pt_BR','Pirkanmaa',328),(1465,'pt_BR','Satakunta',329),(1466,'pt_BR','Keski-Pohjanmaa',330),(1467,'pt_BR','Keski-Suomi',331),(1468,'pt_BR','Varsinais-Suomi',332),(1469,'pt_BR','Carélia do Sul',333),(1470,'pt_BR','Päijät-Häme',334),(1471,'pt_BR','Kanta-Häme',335),(1472,'pt_BR','Uusimaa',336),(1473,'pt_BR','Uusimaa',337),(1474,'pt_BR','Kymenlaakso',338),(1475,'pt_BR','Ahvenanmaa',339),(1476,'pt_BR','Harjumaa',340),(1477,'pt_BR','Hiiumaa',341),(1478,'pt_BR','Ida-Virumaa',342),(1479,'pt_BR','Condado de Jõgeva',343),(1480,'pt_BR','Condado de Järva',344),(1481,'pt_BR','Läänemaa',345),(1482,'pt_BR','Condado de Lääne-Viru',346),(1483,'pt_BR','Condado de Põlva',347),(1484,'pt_BR','Condado de Pärnu',348),(1485,'pt_BR','Raplamaa',349),(1486,'pt_BR','Saaremaa',350),(1487,'pt_BR','Tartumaa',351),(1488,'pt_BR','Valgamaa',352),(1489,'pt_BR','Viljandimaa',353),(1490,'pt_BR','Võrumaa',354),(1491,'pt_BR','Daugavpils',355),(1492,'pt_BR','Jelgava',356),(1493,'pt_BR','Jekabpils',357),(1494,'pt_BR','Jurmala',358),(1495,'pt_BR','Liepaja',359),(1496,'pt_BR','Liepaja County',360),(1497,'pt_BR','Rezekne',361),(1498,'pt_BR','Riga',362),(1499,'pt_BR','Condado de Riga',363),(1500,'pt_BR','Valmiera',364),(1501,'pt_BR','Ventspils',365),(1502,'pt_BR','Aglonas novads',366),(1503,'pt_BR','Aizkraukles novads',367),(1504,'pt_BR','Aizputes novads',368),(1505,'pt_BR','Condado de Akniste',369),(1506,'pt_BR','Alojas novads',370),(1507,'pt_BR','Alsungas novads',371),(1508,'pt_BR','Aluksne County',372),(1509,'pt_BR','Amatas novads',373),(1510,'pt_BR','Macacos novads',374),(1511,'pt_BR','Auces novads',375),(1512,'pt_BR','Babītes novads',376),(1513,'pt_BR','Baldones novads',377),(1514,'pt_BR','Baltinavas novads',378),(1515,'pt_BR','Balvu novads',379),(1516,'pt_BR','Bauskas novads',380),(1517,'pt_BR','Condado de Beverina',381),(1518,'pt_BR','Condado de Broceni',382),(1519,'pt_BR','Burtnieku novads',383),(1520,'pt_BR','Carnikavas novads',384),(1521,'pt_BR','Cesvaines novads',385),(1522,'pt_BR','Ciblas novads',386),(1523,'pt_BR','Cesis county',387),(1524,'pt_BR','Dagdas novads',388),(1525,'pt_BR','Daugavpils novads',389),(1526,'pt_BR','Dobeles novads',390),(1527,'pt_BR','Dundagas novads',391),(1528,'pt_BR','Durbes novads',392),(1529,'pt_BR','Engad novads',393),(1530,'pt_BR','Garkalnes novads',394),(1531,'pt_BR','O condado de Grobiņa',395),(1532,'pt_BR','Gulbenes novads',396),(1533,'pt_BR','Iecavas novads',397),(1534,'pt_BR','Ikskile county',398),(1535,'pt_BR','Ilūkste county',399),(1536,'pt_BR','Condado de Inčukalns',400),(1537,'pt_BR','Jaunjelgavas novads',401),(1538,'pt_BR','Jaunpiebalgas novads',402),(1539,'pt_BR','Jaunpils novads',403),(1540,'pt_BR','Jelgavas novads',404),(1541,'pt_BR','Jekabpils county',405),(1542,'pt_BR','Kandavas novads',406),(1543,'pt_BR','Kokneses novads',407),(1544,'pt_BR','Krimuldas novads',408),(1545,'pt_BR','Krustpils novads',409),(1546,'pt_BR','Condado de Kraslava',410),(1547,'pt_BR','Condado de Kuldīga',411),(1548,'pt_BR','Condado de Kārsava',412),(1549,'pt_BR','Condado de Lielvarde',413),(1550,'pt_BR','Condado de Limbaži',414),(1551,'pt_BR','O distrito de Lubāna',415),(1552,'pt_BR','Ludzas novads',416),(1553,'pt_BR','Ligatne county',417),(1554,'pt_BR','Livani county',418),(1555,'pt_BR','Madonas novads',419),(1556,'pt_BR','Mazsalacas novads',420),(1557,'pt_BR','Mālpils county',421),(1558,'pt_BR','Mārupe county',422),(1559,'pt_BR','O condado de Naukšēni',423),(1560,'pt_BR','Neretas novads',424),(1561,'pt_BR','Nīca county',425),(1562,'pt_BR','Ogres novads',426),(1563,'pt_BR','Olaines novads',427),(1564,'pt_BR','Ozolnieku novads',428),(1565,'pt_BR','Preiļi county',429),(1566,'pt_BR','Priekules novads',430),(1567,'pt_BR','Condado de Priekuļi',431),(1568,'pt_BR','Moving county',432),(1569,'pt_BR','Condado de Pavilosta',433),(1570,'pt_BR','Condado de Plavinas',434),(1571,'pt_BR','Raunas novads',435),(1572,'pt_BR','Condado de Riebiņi',436),(1573,'pt_BR','Rojas novads',437),(1574,'pt_BR','Ropazi county',438),(1575,'pt_BR','Rucavas novads',439),(1576,'pt_BR','Rugāji county',440),(1577,'pt_BR','Rundāle county',441),(1578,'pt_BR','Rezekne county',442),(1579,'pt_BR','Rūjiena county',443),(1580,'pt_BR','O município de Salacgriva',444),(1581,'pt_BR','Salas novads',445),(1582,'pt_BR','Salaspils novads',446),(1583,'pt_BR','Saldus novads',447),(1584,'pt_BR','Saulkrastu novads',448),(1585,'pt_BR','Siguldas novads',449),(1586,'pt_BR','Skrundas novads',450),(1587,'pt_BR','Skrīveri county',451),(1588,'pt_BR','Smiltenes novads',452),(1589,'pt_BR','Condado de Stopini',453),(1590,'pt_BR','Condado de Strenči',454),(1591,'pt_BR','Região de semeadura',455),(1592,'pt_BR','Talsu novads',456),(1593,'pt_BR','Tukuma novads',457),(1594,'pt_BR','Condado de Tērvete',458),(1595,'pt_BR','O condado de Vaiņode',459),(1596,'pt_BR','Valkas novads',460),(1597,'pt_BR','Valmieras novads',461),(1598,'pt_BR','Varaklani county',462),(1599,'pt_BR','Vecpiebalgas novads',463),(1600,'pt_BR','Vecumnieku novads',464),(1601,'pt_BR','Ventspils novads',465),(1602,'pt_BR','Condado de Viesite',466),(1603,'pt_BR','Condado de Vilaka',467),(1604,'pt_BR','Vilani county',468),(1605,'pt_BR','Condado de Varkava',469),(1606,'pt_BR','Zilupes novads',470),(1607,'pt_BR','Adazi county',471),(1608,'pt_BR','Erglu county',472),(1609,'pt_BR','Kegums county',473),(1610,'pt_BR','Kekava county',474),(1611,'pt_BR','Alytaus Apskritis',475),(1612,'pt_BR','Kauno Apskritis',476),(1613,'pt_BR','Condado de Klaipeda',477),(1614,'pt_BR','Marijampolė county',478),(1615,'pt_BR','Panevezys county',479),(1616,'pt_BR','Siauliai county',480),(1617,'pt_BR','Taurage county',481),(1618,'pt_BR','Telšiai county',482),(1619,'pt_BR','Utenos Apskritis',483),(1620,'pt_BR','Vilniaus Apskritis',484),(1621,'pt_BR','Acre',485),(1622,'pt_BR','Alagoas',486),(1623,'pt_BR','Amapá',487),(1624,'pt_BR','Amazonas',488),(1625,'pt_BR','Bahia',489),(1626,'pt_BR','Ceará',490),(1627,'pt_BR','Espírito Santo',491),(1628,'pt_BR','Goiás',492),(1629,'pt_BR','Maranhão',493),(1630,'pt_BR','Mato Grosso',494),(1631,'pt_BR','Mato Grosso do Sul',495),(1632,'pt_BR','Minas Gerais',496),(1633,'pt_BR','Pará',497),(1634,'pt_BR','Paraíba',498),(1635,'pt_BR','Paraná',499),(1636,'pt_BR','Pernambuco',500),(1637,'pt_BR','Piauí',501),(1638,'pt_BR','Rio de Janeiro',502),(1639,'pt_BR','Rio Grande do Norte',503),(1640,'pt_BR','Rio Grande do Sul',504),(1641,'pt_BR','Rondônia',505),(1642,'pt_BR','Roraima',506),(1643,'pt_BR','Santa Catarina',507),(1644,'pt_BR','São Paulo',508),(1645,'pt_BR','Sergipe',509),(1646,'pt_BR','Tocantins',510),(1647,'pt_BR','Distrito Federal',511),(1648,'pt_BR','Condado de Zagreb',512),(1649,'pt_BR','Condado de Krapina-Zagorje',513),(1650,'pt_BR','Condado de Sisak-Moslavina',514),(1651,'pt_BR','Condado de Karlovac',515),(1652,'pt_BR','Concelho de Varaždin',516),(1653,'pt_BR','Condado de Koprivnica-Križevci',517),(1654,'pt_BR','Condado de Bjelovar-Bilogora',518),(1655,'pt_BR','Condado de Primorje-Gorski kotar',519),(1656,'pt_BR','Condado de Lika-Senj',520),(1657,'pt_BR','Condado de Virovitica-Podravina',521),(1658,'pt_BR','Condado de Požega-Slavonia',522),(1659,'pt_BR','Condado de Brod-Posavina',523),(1660,'pt_BR','Condado de Zadar',524),(1661,'pt_BR','Condado de Osijek-Baranja',525),(1662,'pt_BR','Condado de Šibenik-Knin',526),(1663,'pt_BR','Condado de Vukovar-Srijem',527),(1664,'pt_BR','Condado de Split-Dalmácia',528),(1665,'pt_BR','Condado de Ístria',529),(1666,'pt_BR','Condado de Dubrovnik-Neretva',530),(1667,'pt_BR','Međimurska županija',531),(1668,'pt_BR','Grad Zagreb',532),(1669,'pt_BR','Ilhas Andaman e Nicobar',533),(1670,'pt_BR','Andhra Pradesh',534),(1671,'pt_BR','Arunachal Pradesh',535),(1672,'pt_BR','Assam',536),(1673,'pt_BR','Bihar',537),(1674,'pt_BR','Chandigarh',538),(1675,'pt_BR','Chhattisgarh',539),(1676,'pt_BR','Dadra e Nagar Haveli',540),(1677,'pt_BR','Daman e Diu',541),(1678,'pt_BR','Delhi',542),(1679,'pt_BR','Goa',543),(1680,'pt_BR','Gujarat',544),(1681,'pt_BR','Haryana',545),(1682,'pt_BR','Himachal Pradesh',546),(1683,'pt_BR','Jammu e Caxemira',547),(1684,'pt_BR','Jharkhand',548),(1685,'pt_BR','Karnataka',549),(1686,'pt_BR','Kerala',550),(1687,'pt_BR','Lakshadweep',551),(1688,'pt_BR','Madhya Pradesh',552),(1689,'pt_BR','Maharashtra',553),(1690,'pt_BR','Manipur',554),(1691,'pt_BR','Meghalaya',555),(1692,'pt_BR','Mizoram',556),(1693,'pt_BR','Nagaland',557),(1694,'pt_BR','Odisha',558),(1695,'pt_BR','Puducherry',559),(1696,'pt_BR','Punjab',560),(1697,'pt_BR','Rajasthan',561),(1698,'pt_BR','Sikkim',562),(1699,'pt_BR','Tamil Nadu',563),(1700,'pt_BR','Telangana',564),(1701,'pt_BR','Tripura',565),(1702,'pt_BR','Uttar Pradesh',566),(1703,'pt_BR','Uttarakhand',567),(1704,'pt_BR','Bengala Ocidental',568);
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,'US','AL','Alabama',244),(2,'US','AK','Alaska',244),(3,'US','AS','American Samoa',244),(4,'US','AZ','Arizona',244),(5,'US','AR','Arkansas',244),(6,'US','AE','Armed Forces Africa',244),(7,'US','AA','Armed Forces Americas',244),(8,'US','AE','Armed Forces Canada',244),(9,'US','AE','Armed Forces Europe',244),(10,'US','AE','Armed Forces Middle East',244),(11,'US','AP','Armed Forces Pacific',244),(12,'US','CA','California',244),(13,'US','CO','Colorado',244),(14,'US','CT','Connecticut',244),(15,'US','DE','Delaware',244),(16,'US','DC','District of Columbia',244),(17,'US','FM','Federated States Of Micronesia',244),(18,'US','FL','Florida',244),(19,'US','GA','Georgia',244),(20,'US','GU','Guam',244),(21,'US','HI','Hawaii',244),(22,'US','ID','Idaho',244),(23,'US','IL','Illinois',244),(24,'US','IN','Indiana',244),(25,'US','IA','Iowa',244),(26,'US','KS','Kansas',244),(27,'US','KY','Kentucky',244),(28,'US','LA','Louisiana',244),(29,'US','ME','Maine',244),(30,'US','MH','Marshall Islands',244),(31,'US','MD','Maryland',244),(32,'US','MA','Massachusetts',244),(33,'US','MI','Michigan',244),(34,'US','MN','Minnesota',244),(35,'US','MS','Mississippi',244),(36,'US','MO','Missouri',244),(37,'US','MT','Montana',244),(38,'US','NE','Nebraska',244),(39,'US','NV','Nevada',244),(40,'US','NH','New Hampshire',244),(41,'US','NJ','New Jersey',244),(42,'US','NM','New Mexico',244),(43,'US','NY','New York',244),(44,'US','NC','North Carolina',244),(45,'US','ND','North Dakota',244),(46,'US','MP','Northern Mariana Islands',244),(47,'US','OH','Ohio',244),(48,'US','OK','Oklahoma',244),(49,'US','OR','Oregon',244),(50,'US','PW','Palau',244),(51,'US','PA','Pennsylvania',244),(52,'US','PR','Puerto Rico',244),(53,'US','RI','Rhode Island',244),(54,'US','SC','South Carolina',244),(55,'US','SD','South Dakota',244),(56,'US','TN','Tennessee',244),(57,'US','TX','Texas',244),(58,'US','UT','Utah',244),(59,'US','VT','Vermont',244),(60,'US','VI','Virgin Islands',244),(61,'US','VA','Virginia',244),(62,'US','WA','Washington',244),(63,'US','WV','West Virginia',244),(64,'US','WI','Wisconsin',244),(65,'US','WY','Wyoming',244),(66,'CA','AB','Alberta',40),(67,'CA','BC','British Columbia',40),(68,'CA','MB','Manitoba',40),(69,'CA','NL','Newfoundland and Labrador',40),(70,'CA','NB','New Brunswick',40),(71,'CA','NS','Nova Scotia',40),(72,'CA','NT','Northwest Territories',40),(73,'CA','NU','Nunavut',40),(74,'CA','ON','Ontario',40),(75,'CA','PE','Prince Edward Island',40),(76,'CA','QC','Quebec',40),(77,'CA','SK','Saskatchewan',40),(78,'CA','YT','Yukon Territory',40),(79,'DE','NDS','Niedersachsen',88),(80,'DE','BAW','Baden-Württemberg',88),(81,'DE','BAY','Bayern',88),(82,'DE','BER','Berlin',88),(83,'DE','BRG','Brandenburg',88),(84,'DE','BRE','Bremen',88),(85,'DE','HAM','Hamburg',88),(86,'DE','HES','Hessen',88),(87,'DE','MEC','Mecklenburg-Vorpommern',88),(88,'DE','NRW','Nordrhein-Westfalen',88),(89,'DE','RHE','Rheinland-Pfalz',88),(90,'DE','SAR','Saarland',88),(91,'DE','SAS','Sachsen',88),(92,'DE','SAC','Sachsen-Anhalt',88),(93,'DE','SCN','Schleswig-Holstein',88),(94,'DE','THE','Thüringen',88),(95,'AT','WI','Wien',16),(96,'AT','NO','Niederösterreich',16),(97,'AT','OO','Oberösterreich',16),(98,'AT','SB','Salzburg',16),(99,'AT','KN','Kärnten',16),(100,'AT','ST','Steiermark',16),(101,'AT','TI','Tirol',16),(102,'AT','BL','Burgenland',16),(103,'AT','VB','Vorarlberg',16),(104,'CH','AG','Aargau',220),(105,'CH','AI','Appenzell Innerrhoden',220),(106,'CH','AR','Appenzell Ausserrhoden',220),(107,'CH','BE','Bern',220),(108,'CH','BL','Basel-Landschaft',220),(109,'CH','BS','Basel-Stadt',220),(110,'CH','FR','Freiburg',220),(111,'CH','GE','Genf',220),(112,'CH','GL','Glarus',220),(113,'CH','GR','Graubünden',220),(114,'CH','JU','Jura',220),(115,'CH','LU','Luzern',220),(116,'CH','NE','Neuenburg',220),(117,'CH','NW','Nidwalden',220),(118,'CH','OW','Obwalden',220),(119,'CH','SG','St. Gallen',220),(120,'CH','SH','Schaffhausen',220),(121,'CH','SO','Solothurn',220),(122,'CH','SZ','Schwyz',220),(123,'CH','TG','Thurgau',220),(124,'CH','TI','Tessin',220),(125,'CH','UR','Uri',220),(126,'CH','VD','Waadt',220),(127,'CH','VS','Wallis',220),(128,'CH','ZG','Zug',220),(129,'CH','ZH','Zürich',220),(130,'ES','A Coruсa','A Coruña',206),(131,'ES','Alava','Alava',206),(132,'ES','Albacete','Albacete',206),(133,'ES','Alicante','Alicante',206),(134,'ES','Almeria','Almeria',206),(135,'ES','Asturias','Asturias',206),(136,'ES','Avila','Avila',206),(137,'ES','Badajoz','Badajoz',206),(138,'ES','Baleares','Baleares',206),(139,'ES','Barcelona','Barcelona',206),(140,'ES','Burgos','Burgos',206),(141,'ES','Caceres','Caceres',206),(142,'ES','Cadiz','Cadiz',206),(143,'ES','Cantabria','Cantabria',206),(144,'ES','Castellon','Castellon',206),(145,'ES','Ceuta','Ceuta',206),(146,'ES','Ciudad Real','Ciudad Real',206),(147,'ES','Cordoba','Cordoba',206),(148,'ES','Cuenca','Cuenca',206),(149,'ES','Girona','Girona',206),(150,'ES','Granada','Granada',206),(151,'ES','Guadalajara','Guadalajara',206),(152,'ES','Guipuzcoa','Guipuzcoa',206),(153,'ES','Huelva','Huelva',206),(154,'ES','Huesca','Huesca',206),(155,'ES','Jaen','Jaen',206),(156,'ES','La Rioja','La Rioja',206),(157,'ES','Las Palmas','Las Palmas',206),(158,'ES','Leon','Leon',206),(159,'ES','Lleida','Lleida',206),(160,'ES','Lugo','Lugo',206),(161,'ES','Madrid','Madrid',206),(162,'ES','Malaga','Malaga',206),(163,'ES','Melilla','Melilla',206),(164,'ES','Murcia','Murcia',206),(165,'ES','Navarra','Navarra',206),(166,'ES','Ourense','Ourense',206),(167,'ES','Palencia','Palencia',206),(168,'ES','Pontevedra','Pontevedra',206),(169,'ES','Salamanca','Salamanca',206),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife',206),(171,'ES','Segovia','Segovia',206),(172,'ES','Sevilla','Sevilla',206),(173,'ES','Soria','Soria',206),(174,'ES','Tarragona','Tarragona',206),(175,'ES','Teruel','Teruel',206),(176,'ES','Toledo','Toledo',206),(177,'ES','Valencia','Valencia',206),(178,'ES','Valladolid','Valladolid',206),(179,'ES','Vizcaya','Vizcaya',206),(180,'ES','Zamora','Zamora',206),(181,'ES','Zaragoza','Zaragoza',206),(182,'FR','1','Ain',81),(183,'FR','2','Aisne',81),(184,'FR','3','Allier',81),(185,'FR','4','Alpes-de-Haute-Provence',81),(186,'FR','5','Hautes-Alpes',81),(187,'FR','6','Alpes-Maritimes',81),(188,'FR','7','Ardèche',81),(189,'FR','8','Ardennes',81),(190,'FR','9','Ariège',81),(191,'FR','10','Aube',81),(192,'FR','11','Aude',81),(193,'FR','12','Aveyron',81),(194,'FR','13','Bouches-du-Rhône',81),(195,'FR','14','Calvados',81),(196,'FR','15','Cantal',81),(197,'FR','16','Charente',81),(198,'FR','17','Charente-Maritime',81),(199,'FR','18','Cher',81),(200,'FR','19','Corrèze',81),(201,'FR','2A','Corse-du-Sud',81),(202,'FR','2B','Haute-Corse',81),(203,'FR','21','Côte-d\'Or',81),(204,'FR','22','Côtes-d\'Armor',81),(205,'FR','23','Creuse',81),(206,'FR','24','Dordogne',81),(207,'FR','25','Doubs',81),(208,'FR','26','Drôme',81),(209,'FR','27','Eure',81),(210,'FR','28','Eure-et-Loir',81),(211,'FR','29','Finistère',81),(212,'FR','30','Gard',81),(213,'FR','31','Haute-Garonne',81),(214,'FR','32','Gers',81),(215,'FR','33','Gironde',81),(216,'FR','34','Hérault',81),(217,'FR','35','Ille-et-Vilaine',81),(218,'FR','36','Indre',81),(219,'FR','37','Indre-et-Loire',81),(220,'FR','38','Isère',81),(221,'FR','39','Jura',81),(222,'FR','40','Landes',81),(223,'FR','41','Loir-et-Cher',81),(224,'FR','42','Loire',81),(225,'FR','43','Haute-Loire',81),(226,'FR','44','Loire-Atlantique',81),(227,'FR','45','Loiret',81),(228,'FR','46','Lot',81),(229,'FR','47','Lot-et-Garonne',81),(230,'FR','48','Lozère',81),(231,'FR','49','Maine-et-Loire',81),(232,'FR','50','Manche',81),(233,'FR','51','Marne',81),(234,'FR','52','Haute-Marne',81),(235,'FR','53','Mayenne',81),(236,'FR','54','Meurthe-et-Moselle',81),(237,'FR','55','Meuse',81),(238,'FR','56','Morbihan',81),(239,'FR','57','Moselle',81),(240,'FR','58','Nièvre',81),(241,'FR','59','Nord',81),(242,'FR','60','Oise',81),(243,'FR','61','Orne',81),(244,'FR','62','Pas-de-Calais',81),(245,'FR','63','Puy-de-Dôme',81),(246,'FR','64','Pyrénées-Atlantiques',81),(247,'FR','65','Hautes-Pyrénées',81),(248,'FR','66','Pyrénées-Orientales',81),(249,'FR','67','Bas-Rhin',81),(250,'FR','68','Haut-Rhin',81),(251,'FR','69','Rhône',81),(252,'FR','70','Haute-Saône',81),(253,'FR','71','Saône-et-Loire',81),(254,'FR','72','Sarthe',81),(255,'FR','73','Savoie',81),(256,'FR','74','Haute-Savoie',81),(257,'FR','75','Paris',81),(258,'FR','76','Seine-Maritime',81),(259,'FR','77','Seine-et-Marne',81),(260,'FR','78','Yvelines',81),(261,'FR','79','Deux-Sèvres',81),(262,'FR','80','Somme',81),(263,'FR','81','Tarn',81),(264,'FR','82','Tarn-et-Garonne',81),(265,'FR','83','Var',81),(266,'FR','84','Vaucluse',81),(267,'FR','85','Vendée',81),(268,'FR','86','Vienne',81),(269,'FR','87','Haute-Vienne',81),(270,'FR','88','Vosges',81),(271,'FR','89','Yonne',81),(272,'FR','90','Territoire-de-Belfort',81),(273,'FR','91','Essonne',81),(274,'FR','92','Hauts-de-Seine',81),(275,'FR','93','Seine-Saint-Denis',81),(276,'FR','94','Val-de-Marne',81),(277,'FR','95','Val-d\'Oise',81),(278,'RO','AB','Alba',185),(279,'RO','AR','Arad',185),(280,'RO','AG','Argeş',185),(281,'RO','BC','Bacău',185),(282,'RO','BH','Bihor',185),(283,'RO','BN','Bistriţa-Năsăud',185),(284,'RO','BT','Botoşani',185),(285,'RO','BV','Braşov',185),(286,'RO','BR','Brăila',185),(287,'RO','B','Bucureşti',185),(288,'RO','BZ','Buzău',185),(289,'RO','CS','Caraş-Severin',185),(290,'RO','CL','Călăraşi',185),(291,'RO','CJ','Cluj',185),(292,'RO','CT','Constanţa',185),(293,'RO','CV','Covasna',185),(294,'RO','DB','Dâmboviţa',185),(295,'RO','DJ','Dolj',185),(296,'RO','GL','Galaţi',185),(297,'RO','GR','Giurgiu',185),(298,'RO','GJ','Gorj',185),(299,'RO','HR','Harghita',185),(300,'RO','HD','Hunedoara',185),(301,'RO','IL','Ialomiţa',185),(302,'RO','IS','Iaşi',185),(303,'RO','IF','Ilfov',185),(304,'RO','MM','Maramureş',185),(305,'RO','MH','Mehedinţi',185),(306,'RO','MS','Mureş',185),(307,'RO','NT','Neamţ',185),(308,'RO','OT','Olt',185),(309,'RO','PH','Prahova',185),(310,'RO','SM','Satu-Mare',185),(311,'RO','SJ','Sălaj',185),(312,'RO','SB','Sibiu',185),(313,'RO','SV','Suceava',185),(314,'RO','TR','Teleorman',185),(315,'RO','TM','Timiş',185),(316,'RO','TL','Tulcea',185),(317,'RO','VS','Vaslui',185),(318,'RO','VL','Vâlcea',185),(319,'RO','VN','Vrancea',185),(320,'FI','Lappi','Lappi',80),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa',80),(322,'FI','Kainuu','Kainuu',80),(323,'FI','Pohjois-Karjala','Pohjois-Karjala',80),(324,'FI','Pohjois-Savo','Pohjois-Savo',80),(325,'FI','Etelä-Savo','Etelä-Savo',80),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa',80),(327,'FI','Pohjanmaa','Pohjanmaa',80),(328,'FI','Pirkanmaa','Pirkanmaa',80),(329,'FI','Satakunta','Satakunta',80),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa',80),(331,'FI','Keski-Suomi','Keski-Suomi',80),(332,'FI','Varsinais-Suomi','Varsinais-Suomi',80),(333,'FI','Etelä-Karjala','Etelä-Karjala',80),(334,'FI','Päijät-Häme','Päijät-Häme',80),(335,'FI','Kanta-Häme','Kanta-Häme',80),(336,'FI','Uusimaa','Uusimaa',80),(337,'FI','Itä-Uusimaa','Itä-Uusimaa',80),(338,'FI','Kymenlaakso','Kymenlaakso',80),(339,'FI','Ahvenanmaa','Ahvenanmaa',80),(340,'EE','EE-37','Harjumaa',74),(341,'EE','EE-39','Hiiumaa',74),(342,'EE','EE-44','Ida-Virumaa',74),(343,'EE','EE-49','Jõgevamaa',74),(344,'EE','EE-51','Järvamaa',74),(345,'EE','EE-57','Läänemaa',74),(346,'EE','EE-59','Lääne-Virumaa',74),(347,'EE','EE-65','Põlvamaa',74),(348,'EE','EE-67','Pärnumaa',74),(349,'EE','EE-70','Raplamaa',74),(350,'EE','EE-74','Saaremaa',74),(351,'EE','EE-78','Tartumaa',74),(352,'EE','EE-82','Valgamaa',74),(353,'EE','EE-84','Viljandimaa',74),(354,'EE','EE-86','Võrumaa',74),(355,'LV','LV-DGV','Daugavpils',125),(356,'LV','LV-JEL','Jelgava',125),(357,'LV','Jēkabpils','Jēkabpils',125),(358,'LV','LV-JUR','Jūrmala',125),(359,'LV','LV-LPX','Liepāja',125),(360,'LV','LV-LE','Liepājas novads',125),(361,'LV','LV-REZ','Rēzekne',125),(362,'LV','LV-RIX','Rīga',125),(363,'LV','LV-RI','Rīgas novads',125),(364,'LV','Valmiera','Valmiera',125),(365,'LV','LV-VEN','Ventspils',125),(366,'LV','Aglonas novads','Aglonas novads',125),(367,'LV','LV-AI','Aizkraukles novads',125),(368,'LV','Aizputes novads','Aizputes novads',125),(369,'LV','Aknīstes novads','Aknīstes novads',125),(370,'LV','Alojas novads','Alojas novads',125),(371,'LV','Alsungas novads','Alsungas novads',125),(372,'LV','LV-AL','Alūksnes novads',125),(373,'LV','Amatas novads','Amatas novads',125),(374,'LV','Apes novads','Apes novads',125),(375,'LV','Auces novads','Auces novads',125),(376,'LV','Babītes novads','Babītes novads',125),(377,'LV','Baldones novads','Baldones novads',125),(378,'LV','Baltinavas novads','Baltinavas novads',125),(379,'LV','LV-BL','Balvu novads',125),(380,'LV','LV-BU','Bauskas novads',125),(381,'LV','Beverīnas novads','Beverīnas novads',125),(382,'LV','Brocēnu novads','Brocēnu novads',125),(383,'LV','Burtnieku novads','Burtnieku novads',125),(384,'LV','Carnikavas novads','Carnikavas novads',125),(385,'LV','Cesvaines novads','Cesvaines novads',125),(386,'LV','Ciblas novads','Ciblas novads',125),(387,'LV','LV-CE','Cēsu novads',125),(388,'LV','Dagdas novads','Dagdas novads',125),(389,'LV','LV-DA','Daugavpils novads',125),(390,'LV','LV-DO','Dobeles novads',125),(391,'LV','Dundagas novads','Dundagas novads',125),(392,'LV','Durbes novads','Durbes novads',125),(393,'LV','Engures novads','Engures novads',125),(394,'LV','Garkalnes novads','Garkalnes novads',125),(395,'LV','Grobiņas novads','Grobiņas novads',125),(396,'LV','LV-GU','Gulbenes novads',125),(397,'LV','Iecavas novads','Iecavas novads',125),(398,'LV','Ikšķiles novads','Ikšķiles novads',125),(399,'LV','Ilūkstes novads','Ilūkstes novads',125),(400,'LV','Inčukalna novads','Inčukalna novads',125),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads',125),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads',125),(403,'LV','Jaunpils novads','Jaunpils novads',125),(404,'LV','LV-JL','Jelgavas novads',125),(405,'LV','LV-JK','Jēkabpils novads',125),(406,'LV','Kandavas novads','Kandavas novads',125),(407,'LV','Kokneses novads','Kokneses novads',125),(408,'LV','Krimuldas novads','Krimuldas novads',125),(409,'LV','Krustpils novads','Krustpils novads',125),(410,'LV','LV-KR','Krāslavas novads',125),(411,'LV','LV-KU','Kuldīgas novads',125),(412,'LV','Kārsavas novads','Kārsavas novads',125),(413,'LV','Lielvārdes novads','Lielvārdes novads',125),(414,'LV','LV-LM','Limbažu novads',125),(415,'LV','Lubānas novads','Lubānas novads',125),(416,'LV','LV-LU','Ludzas novads',125),(417,'LV','Līgatnes novads','Līgatnes novads',125),(418,'LV','Līvānu novads','Līvānu novads',125),(419,'LV','LV-MA','Madonas novads',125),(420,'LV','Mazsalacas novads','Mazsalacas novads',125),(421,'LV','Mālpils novads','Mālpils novads',125),(422,'LV','Mārupes novads','Mārupes novads',125),(423,'LV','Naukšēnu novads','Naukšēnu novads',125),(424,'LV','Neretas novads','Neretas novads',125),(425,'LV','Nīcas novads','Nīcas novads',125),(426,'LV','LV-OG','Ogres novads',125),(427,'LV','Olaines novads','Olaines novads',125),(428,'LV','Ozolnieku novads','Ozolnieku novads',125),(429,'LV','LV-PR','Preiļu novads',125),(430,'LV','Priekules novads','Priekules novads',125),(431,'LV','Priekuļu novads','Priekuļu novads',125),(432,'LV','Pārgaujas novads','Pārgaujas novads',125),(433,'LV','Pāvilostas novads','Pāvilostas novads',125),(434,'LV','Pļaviņu novads','Pļaviņu novads',125),(435,'LV','Raunas novads','Raunas novads',125),(436,'LV','Riebiņu novads','Riebiņu novads',125),(437,'LV','Rojas novads','Rojas novads',125),(438,'LV','Ropažu novads','Ropažu novads',125),(439,'LV','Rucavas novads','Rucavas novads',125),(440,'LV','Rugāju novads','Rugāju novads',125),(441,'LV','Rundāles novads','Rundāles novads',125),(442,'LV','LV-RE','Rēzeknes novads',125),(443,'LV','Rūjienas novads','Rūjienas novads',125),(444,'LV','Salacgrīvas novads','Salacgrīvas novads',125),(445,'LV','Salas novads','Salas novads',125),(446,'LV','Salaspils novads','Salaspils novads',125),(447,'LV','LV-SA','Saldus novads',125),(448,'LV','Saulkrastu novads','Saulkrastu novads',125),(449,'LV','Siguldas novads','Siguldas novads',125),(450,'LV','Skrundas novads','Skrundas novads',125),(451,'LV','Skrīveru novads','Skrīveru novads',125),(452,'LV','Smiltenes novads','Smiltenes novads',125),(453,'LV','Stopiņu novads','Stopiņu novads',125),(454,'LV','Strenču novads','Strenču novads',125),(455,'LV','Sējas novads','Sējas novads',125),(456,'LV','LV-TA','Talsu novads',125),(457,'LV','LV-TU','Tukuma novads',125),(458,'LV','Tērvetes novads','Tērvetes novads',125),(459,'LV','Vaiņodes novads','Vaiņodes novads',125),(460,'LV','LV-VK','Valkas novads',125),(461,'LV','LV-VM','Valmieras novads',125),(462,'LV','Varakļānu novads','Varakļānu novads',125),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads',125),(464,'LV','Vecumnieku novads','Vecumnieku novads',125),(465,'LV','LV-VE','Ventspils novads',125),(466,'LV','Viesītes novads','Viesītes novads',125),(467,'LV','Viļakas novads','Viļakas novads',125),(468,'LV','Viļānu novads','Viļānu novads',125),(469,'LV','Vārkavas novads','Vārkavas novads',125),(470,'LV','Zilupes novads','Zilupes novads',125),(471,'LV','Ādažu novads','Ādažu novads',125),(472,'LV','Ērgļu novads','Ērgļu novads',125),(473,'LV','Ķeguma novads','Ķeguma novads',125),(474,'LV','Ķekavas novads','Ķekavas novads',125),(475,'LT','LT-AL','Alytaus Apskritis',131),(476,'LT','LT-KU','Kauno Apskritis',131),(477,'LT','LT-KL','Klaipėdos Apskritis',131),(478,'LT','LT-MR','Marijampolės Apskritis',131),(479,'LT','LT-PN','Panevėžio Apskritis',131),(480,'LT','LT-SA','Šiaulių Apskritis',131),(481,'LT','LT-TA','Tauragės Apskritis',131),(482,'LT','LT-TE','Telšių Apskritis',131),(483,'LT','LT-UT','Utenos Apskritis',131),(484,'LT','LT-VL','Vilniaus Apskritis',131),(485,'BR','AC','Acre',31),(486,'BR','AL','Alagoas',31),(487,'BR','AP','Amapá',31),(488,'BR','AM','Amazonas',31),(489,'BR','BA','Bahia',31),(490,'BR','CE','Ceará',31),(491,'BR','ES','Espírito Santo',31),(492,'BR','GO','Goiás',31),(493,'BR','MA','Maranhão',31),(494,'BR','MT','Mato Grosso',31),(495,'BR','MS','Mato Grosso do Sul',31),(496,'BR','MG','Minas Gerais',31),(497,'BR','PA','Pará',31),(498,'BR','PB','Paraíba',31),(499,'BR','PR','Paraná',31),(500,'BR','PE','Pernambuco',31),(501,'BR','PI','Piauí',31),(502,'BR','RJ','Rio de Janeiro',31),(503,'BR','RN','Rio Grande do Norte',31),(504,'BR','RS','Rio Grande do Sul',31),(505,'BR','RO','Rondônia',31),(506,'BR','RR','Roraima',31),(507,'BR','SC','Santa Catarina',31),(508,'BR','SP','São Paulo',31),(509,'BR','SE','Sergipe',31),(510,'BR','TO','Tocantins',31),(511,'BR','DF','Distrito Federal',31),(512,'HR','HR-01','Zagrebačka županija',59),(513,'HR','HR-02','Krapinsko-zagorska županija',59),(514,'HR','HR-03','Sisačko-moslavačka županija',59),(515,'HR','HR-04','Karlovačka županija',59),(516,'HR','HR-05','Varaždinska županija',59),(517,'HR','HR-06','Koprivničko-križevačka županija',59),(518,'HR','HR-07','Bjelovarsko-bilogorska županija',59),(519,'HR','HR-08','Primorsko-goranska županija',59),(520,'HR','HR-09','Ličko-senjska županija',59),(521,'HR','HR-10','Virovitičko-podravska županija',59),(522,'HR','HR-11','Požeško-slavonska županija',59),(523,'HR','HR-12','Brodsko-posavska županija',59),(524,'HR','HR-13','Zadarska županija',59),(525,'HR','HR-14','Osječko-baranjska županija',59),(526,'HR','HR-15','Šibensko-kninska županija',59),(527,'HR','HR-16','Vukovarsko-srijemska županija',59),(528,'HR','HR-17','Splitsko-dalmatinska županija',59),(529,'HR','HR-18','Istarska županija',59),(530,'HR','HR-19','Dubrovačko-neretvanska županija',59),(531,'HR','HR-20','Međimurska županija',59),(532,'HR','HR-21','Grad Zagreb',59),(533,'IN','AN','Andaman and Nicobar Islands',106),(534,'IN','AP','Andhra Pradesh',106),(535,'IN','AR','Arunachal Pradesh',106),(536,'IN','AS','Assam',106),(537,'IN','BR','Bihar',106),(538,'IN','CH','Chandigarh',106),(539,'IN','CT','Chhattisgarh',106),(540,'IN','DN','Dadra and Nagar Haveli',106),(541,'IN','DD','Daman and Diu',106),(542,'IN','DL','Delhi',106),(543,'IN','GA','Goa',106),(544,'IN','GJ','Gujarat',106),(545,'IN','HR','Haryana',106),(546,'IN','HP','Himachal Pradesh',106),(547,'IN','JK','Jammu and Kashmir',106),(548,'IN','JH','Jharkhand',106),(549,'IN','KA','Karnataka',106),(550,'IN','KL','Kerala',106),(551,'IN','LD','Lakshadweep',106),(552,'IN','MP','Madhya Pradesh',106),(553,'IN','MH','Maharashtra',106),(554,'IN','MN','Manipur',106),(555,'IN','ML','Meghalaya',106),(556,'IN','MZ','Mizoram',106),(557,'IN','NL','Nagaland',106),(558,'IN','OR','Odisha',106),(559,'IN','PY','Puducherry',106),(560,'IN','PB','Punjab',106),(561,'IN','RJ','Rajasthan',106),(562,'IN','SK','Sikkim',106),(563,'IN','TN','Tamil Nadu',106),(564,'IN','TG','Telangana',106),(565,'IN','TR','Tripura',106),(566,'IN','UP','Uttar Pradesh',106),(567,'IN','UT','Uttarakhand',106),(568,'IN','WB','West Bengal',106);
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
INSERT INTO `country_translations` VALUES (1,'ar','أفغانستان',1),(2,'ar','جزر آلاند',2),(3,'ar','ألبانيا',3),(4,'ar','الجزائر',4),(5,'ar','ساموا الأمريكية',5),(6,'ar','أندورا',6),(7,'ar','أنغولا',7),(8,'ar','أنغيلا',8),(9,'ar','القارة القطبية الجنوبية',9),(10,'ar','أنتيغوا وبربودا',10),(11,'ar','الأرجنتين',11),(12,'ar','أرمينيا',12),(13,'ar','أروبا',13),(14,'ar','جزيرة الصعود',14),(15,'ar','أستراليا',15),(16,'ar','النمسا',16),(17,'ar','أذربيجان',17),(18,'ar','الباهاما',18),(19,'ar','البحرين',19),(20,'ar','بنغلاديش',20),(21,'ar','بربادوس',21),(22,'ar','روسيا البيضاء',22),(23,'ar','بلجيكا',23),(24,'ar','بليز',24),(25,'ar','بنين',25),(26,'ar','برمودا',26),(27,'ar','بوتان',27),(28,'ar','بوليفيا',28),(29,'ar','البوسنة والهرسك',29),(30,'ar','بوتسوانا',30),(31,'ar','البرازيل',31),(32,'ar','إقليم المحيط البريطاني الهندي',32),(33,'ar','جزر فيرجن البريطانية',33),(34,'ar','بروناي',34),(35,'ar','بلغاريا',35),(36,'ar','بوركينا فاسو',36),(37,'ar','بوروندي',37),(38,'ar','كمبوديا',38),(39,'ar','الكاميرون',39),(40,'ar','كندا',40),(41,'ar','جزر الكناري',41),(42,'ar','الرأس الأخضر',42),(43,'ar','الكاريبي هولندا',43),(44,'ar','جزر كايمان',44),(45,'ar','جمهورية افريقيا الوسطى',45),(46,'ar','سبتة ومليلية',46),(47,'ar','تشاد',47),(48,'ar','تشيلي',48),(49,'ar','الصين',49),(50,'ar','جزيرة الكريسماس',50),(51,'ar','جزر كوكوس (كيلينغ)',51),(52,'ar','كولومبيا',52),(53,'ar','جزر القمر',53),(54,'ar','الكونغو - برازافيل',54),(55,'ar','الكونغو - كينشاسا',55),(56,'ar','جزر كوك',56),(57,'ar','كوستاريكا',57),(58,'ar','ساحل العاج',58),(59,'ar','كرواتيا',59),(60,'ar','كوبا',60),(61,'ar','كوراساو',61),(62,'ar','قبرص',62),(63,'ar','التشيك',63),(64,'ar','الدنمارك',64),(65,'ar','دييغو غارسيا',65),(66,'ar','جيبوتي',66),(67,'ar','دومينيكا',67),(68,'ar','جمهورية الدومنيكان',68),(69,'ar','الإكوادور',69),(70,'ar','مصر',70),(71,'ar','السلفادور',71),(72,'ar','غينيا الإستوائية',72),(73,'ar','إريتريا',73),(74,'ar','استونيا',74),(75,'ar','أثيوبيا',75),(76,'ar','منطقة اليورو',76),(77,'ar','جزر فوكلاند',77),(78,'ar','جزر فاروس',78),(79,'ar','فيجي',79),(80,'ar','فنلندا',80),(81,'ar','فرنسا',81),(82,'ar','غيانا الفرنسية',82),(83,'ar','بولينيزيا الفرنسية',83),(84,'ar','المناطق الجنوبية لفرنسا',84),(85,'ar','الغابون',85),(86,'ar','غامبيا',86),(87,'ar','جورجيا',87),(88,'ar','ألمانيا',88),(89,'ar','غانا',89),(90,'ar','جبل طارق',90),(91,'ar','اليونان',91),(92,'ar','الأرض الخضراء',92),(93,'ar','غرينادا',93),(94,'ar','جوادلوب',94),(95,'ar','غوام',95),(96,'ar','غواتيمالا',96),(97,'ar','غيرنسي',97),(98,'ar','غينيا',98),(99,'ar','غينيا بيساو',99),(100,'ar','غيانا',100),(101,'ar','هايتي',101),(102,'ar','هندوراس',102),(103,'ar','هونج كونج SAR الصين',103),(104,'ar','هنغاريا',104),(105,'ar','أيسلندا',105),(106,'ar','الهند',106),(107,'ar','إندونيسيا',107),(108,'ar','إيران',108),(109,'ar','العراق',109),(110,'ar','أيرلندا',110),(111,'ar','جزيرة آيل أوف مان',111),(112,'ar','إسرائيل',112),(113,'ar','إيطاليا',113),(114,'ar','جامايكا',114),(115,'ar','اليابان',115),(116,'ar','جيرسي',116),(117,'ar','الأردن',117),(118,'ar','كازاخستان',118),(119,'ar','كينيا',119),(120,'ar','كيريباس',120),(121,'ar','كوسوفو',121),(122,'ar','الكويت',122),(123,'ar','قرغيزستان',123),(124,'ar','لاوس',124),(125,'ar','لاتفيا',125),(126,'ar','لبنان',126),(127,'ar','ليسوتو',127),(128,'ar','ليبيريا',128),(129,'ar','ليبيا',129),(130,'ar','ليختنشتاين',130),(131,'ar','ليتوانيا',131),(132,'ar','لوكسمبورغ',132),(133,'ar','ماكاو SAR الصين',133),(134,'ar','مقدونيا',134),(135,'ar','مدغشقر',135),(136,'ar','مالاوي',136),(137,'ar','ماليزيا',137),(138,'ar','جزر المالديف',138),(139,'ar','مالي',139),(140,'ar','مالطا',140),(141,'ar','جزر مارشال',141),(142,'ar','مارتينيك',142),(143,'ar','موريتانيا',143),(144,'ar','موريشيوس',144),(145,'ar','ضائع',145),(146,'ar','المكسيك',146),(147,'ar','ميكرونيزيا',147),(148,'ar','مولدوفا',148),(149,'ar','موناكو',149),(150,'ar','منغوليا',150),(151,'ar','الجبل الأسود',151),(152,'ar','مونتسيرات',152),(153,'ar','المغرب',153),(154,'ar','موزمبيق',154),(155,'ar','ميانمار (بورما)',155),(156,'ar','ناميبيا',156),(157,'ar','ناورو',157),(158,'ar','نيبال',158),(159,'ar','نيبال',159),(160,'ar','كاليدونيا الجديدة',160),(161,'ar','نيوزيلاندا',161),(162,'ar','نيكاراغوا',162),(163,'ar','النيجر',163),(164,'ar','نيجيريا',164),(165,'ar','نيوي',165),(166,'ar','جزيرة نورفولك',166),(167,'ar','كوريا الشماليه',167),(168,'ar','جزر مريانا الشمالية',168),(169,'ar','النرويج',169),(170,'ar','سلطنة عمان',170),(171,'ar','باكستان',171),(172,'ar','بالاو',172),(173,'ar','الاراضي الفلسطينية',173),(174,'ar','بناما',174),(175,'ar','بابوا غينيا الجديدة',175),(176,'ar','باراغواي',176),(177,'ar','بيرو',177),(178,'ar','الفلبين',178),(179,'ar','جزر بيتكيرن',179),(180,'ar','بولندا',180),(181,'ar','البرتغال',181),(182,'ar','بورتوريكو',182),(183,'ar','دولة قطر',183),(184,'ar','جمع شمل',184),(185,'ar','رومانيا',185),(186,'ar','روسيا',186),(187,'ar','رواندا',187),(188,'ar','ساموا',188),(189,'ar','سان مارينو',189),(190,'ar','سانت كيتس ونيفيس',190),(191,'ar','المملكة العربية السعودية',191),(192,'ar','السنغال',192),(193,'ar','صربيا',193),(194,'ar','سيشيل',194),(195,'ar','سيراليون',195),(196,'ar','سنغافورة',196),(197,'ar','سينت مارتن',197),(198,'ar','سلوفاكيا',198),(199,'ar','سلوفينيا',199),(200,'ar','جزر سليمان',200),(201,'ar','الصومال',201),(202,'ar','جنوب أفريقيا',202),(203,'ar','جورجيا الجنوبية وجزر ساندويتش الجنوبية',203),(204,'ar','كوريا الجنوبية',204),(205,'ar','جنوب السودان',205),(206,'ar','إسبانيا',206),(207,'ar','سيريلانكا',207),(208,'ar','سانت بارتيليمي',208),(209,'ar','سانت هيلانة',209),(210,'ar','سانت كيتس ونيفيس',210),(211,'ar','شارع لوسيا',211),(212,'ar','سانت مارتن',212),(213,'ar','سانت بيير وميكلون',213),(214,'ar','سانت فنسنت وجزر غرينادين',214),(215,'ar','السودان',215),(216,'ar','سورينام',216),(217,'ar','سفالبارد وجان ماين',217),(218,'ar','سوازيلاند',218),(219,'ar','السويد',219),(220,'ar','سويسرا',220),(221,'ar','سوريا',221),(222,'ar','تايوان',222),(223,'ar','طاجيكستان',223),(224,'ar','تنزانيا',224),(225,'ar','تايلاند',225),(226,'ar','تيمور',226),(227,'ar','توجو',227),(228,'ar','توكيلاو',228),(229,'ar','تونغا',229),(230,'ar','ترينيداد وتوباغو',230),(231,'ar','تريستان دا كونها',231),(232,'ar','تونس',232),(233,'ar','ديك رومي',233),(234,'ar','تركمانستان',234),(235,'ar','جزر تركس وكايكوس',235),(236,'ar','توفالو',236),(237,'ar','جزر الولايات المتحدة البعيدة',237),(238,'ar','جزر فيرجن الأمريكية',238),(239,'ar','أوغندا',239),(240,'ar','أوكرانيا',240),(241,'ar','الإمارات العربية المتحدة',241),(242,'ar','المملكة المتحدة',242),(243,'ar','الأمم المتحدة',243),(244,'ar','الولايات المتحدة الأمريكية',244),(245,'ar','أوروغواي',245),(246,'ar','أوزبكستان',246),(247,'ar','فانواتو',247),(248,'ar','مدينة الفاتيكان',248),(249,'ar','فنزويلا',249),(250,'ar','فيتنام',250),(251,'ar','واليس وفوتونا',251),(252,'ar','الصحراء الغربية',252),(253,'ar','اليمن',253),(254,'ar','زامبيا',254),(255,'ar','زيمبابوي',255),(256,'fa','افغانستان',1),(257,'fa','جزایر الند',2),(258,'fa','آلبانی',3),(259,'fa','الجزایر',4),(260,'fa','ساموآ آمریکایی',5),(261,'fa','آندورا',6),(262,'fa','آنگولا',7),(263,'fa','آنگولا',8),(264,'fa','جنوبگان',9),(265,'fa','آنتیگوا و باربودا',10),(266,'fa','آرژانتین',11),(267,'fa','ارمنستان',12),(268,'fa','آروبا',13),(269,'fa','جزیره صعود',14),(270,'fa','استرالیا',15),(271,'fa','اتریش',16),(272,'fa','آذربایجان',17),(273,'fa','باهاما',18),(274,'fa','بحرین',19),(275,'fa','بنگلادش',20),(276,'fa','باربادوس',21),(277,'fa','بلاروس',22),(278,'fa','بلژیک',23),(279,'fa','بلژیک',24),(280,'fa','بنین',25),(281,'fa','برمودا',26),(282,'fa','بوتان',27),(283,'fa','بولیوی',28),(284,'fa','بوسنی و هرزگوین',29),(285,'fa','بوتسوانا',30),(286,'fa','برزیل',31),(287,'fa','قلمرو اقیانوس هند انگلیس',32),(288,'fa','جزایر ویرجین انگلیس',33),(289,'fa','برونئی',34),(290,'fa','بلغارستان',35),(291,'fa','بورکینا فاسو',36),(292,'fa','بوروندی',37),(293,'fa','کامبوج',38),(294,'fa','کامرون',39),(295,'fa','کانادا',40),(296,'fa','جزایر قناری',41),(297,'fa','کیپ ورد',42),(298,'fa','کارائیب هلند',43),(299,'fa','Cayman Islands',44),(300,'fa','جمهوری آفریقای مرکزی',45),(301,'fa','سوتا و ملیلا',46),(302,'fa','چاد',47),(303,'fa','شیلی',48),(304,'fa','چین',49),(305,'fa','جزیره کریسمس',50),(306,'fa','جزایر کوکو (Keeling)',51),(307,'fa','کلمبیا',52),(308,'fa','کومور',53),(309,'fa','کنگو - برزاویل',54),(310,'fa','کنگو - کینشاسا',55),(311,'fa','جزایر کوک',56),(312,'fa','کاستاریکا',57),(313,'fa','ساحل عاج',58),(314,'fa','کرواسی',59),(315,'fa','کوبا',60),(316,'fa','کوراسائو',61),(317,'fa','قبرس',62),(318,'fa','چک',63),(319,'fa','دانمارک',64),(320,'fa','دیگو گارسیا',65),(321,'fa','جیبوتی',66),(322,'fa','دومینیکا',67),(323,'fa','جمهوری دومینیکن',68),(324,'fa','اکوادور',69),(325,'fa','مصر',70),(326,'fa','السالوادور',71),(327,'fa','گینه استوایی',72),(328,'fa','اریتره',73),(329,'fa','استونی',74),(330,'fa','اتیوپی',75),(331,'fa','منطقه یورو',76),(332,'fa','جزایر فالکلند',77),(333,'fa','جزایر فارو',78),(334,'fa','فیجی',79),(335,'fa','فنلاند',80),(336,'fa','فرانسه',81),(337,'fa','گویان فرانسه',82),(338,'fa','پلی‌نزی فرانسه',83),(339,'fa','سرزمین های جنوبی فرانسه',84),(340,'fa','گابن',85),(341,'fa','گامبیا',86),(342,'fa','جورجیا',87),(343,'fa','آلمان',88),(344,'fa','غنا',89),(345,'fa','جبل الطارق',90),(346,'fa','یونان',91),(347,'fa','گرینلند',92),(348,'fa','گرنادا',93),(349,'fa','گوادلوپ',94),(350,'fa','گوام',95),(351,'fa','گواتمالا',96),(352,'fa','گورنسی',97),(353,'fa','گینه',98),(354,'fa','گینه بیسائو',99),(355,'fa','گویان',100),(356,'fa','هائیتی',101),(357,'fa','هندوراس',102),(358,'fa','هنگ کنگ SAR چین',103),(359,'fa','مجارستان',104),(360,'fa','ایسلند',105),(361,'fa','هند',106),(362,'fa','اندونزی',107),(363,'fa','ایران',108),(364,'fa','عراق',109),(365,'fa','ایرلند',110),(366,'fa','جزیره من',111),(367,'fa','اسرائيل',112),(368,'fa','ایتالیا',113),(369,'fa','جامائیکا',114),(370,'fa','ژاپن',115),(371,'fa','پیراهن ورزشی',116),(372,'fa','اردن',117),(373,'fa','قزاقستان',118),(374,'fa','کنیا',119),(375,'fa','کیریباتی',120),(376,'fa','کوزوو',121),(377,'fa','کویت',122),(378,'fa','قرقیزستان',123),(379,'fa','لائوس',124),(380,'fa','لتونی',125),(381,'fa','لبنان',126),(382,'fa','لسوتو',127),(383,'fa','لیبریا',128),(384,'fa','لیبی',129),(385,'fa','لیختن اشتاین',130),(386,'fa','لیتوانی',131),(387,'fa','لوکزامبورگ',132),(388,'fa','ماکائو SAR چین',133),(389,'fa','مقدونیه',134),(390,'fa','ماداگاسکار',135),(391,'fa','مالاوی',136),(392,'fa','مالزی',137),(393,'fa','مالدیو',138),(394,'fa','مالی',139),(395,'fa','مالت',140),(396,'fa','جزایر مارشال',141),(397,'fa','مارتینیک',142),(398,'fa','موریتانی',143),(399,'fa','موریس',144),(400,'fa','گمشده',145),(401,'fa','مکزیک',146),(402,'fa','میکرونزی',147),(403,'fa','مولداوی',148),(404,'fa','موناکو',149),(405,'fa','مغولستان',150),(406,'fa','مونته نگرو',151),(407,'fa','مونتسرات',152),(408,'fa','مراکش',153),(409,'fa','موزامبیک',154),(410,'fa','میانمار (برمه)',155),(411,'fa','ناميبيا',156),(412,'fa','نائورو',157),(413,'fa','نپال',158),(414,'fa','هلند',159),(415,'fa','کالدونیای جدید',160),(416,'fa','نیوزلند',161),(417,'fa','نیکاراگوئه',162),(418,'fa','نیجر',163),(419,'fa','نیجریه',164),(420,'fa','نیو',165),(421,'fa','جزیره نورفولک',166),(422,'fa','کره شمالی',167),(423,'fa','جزایر ماریانای شمالی',168),(424,'fa','نروژ',169),(425,'fa','عمان',170),(426,'fa','پاکستان',171),(427,'fa','پالائو',172),(428,'fa','سرزمین های فلسطینی',173),(429,'fa','پاناما',174),(430,'fa','پاپوا گینه نو',175),(431,'fa','پاراگوئه',176),(432,'fa','پرو',177),(433,'fa','فیلیپین',178),(434,'fa','جزایر پیکریرن',179),(435,'fa','لهستان',180),(436,'fa','کشور پرتغال',181),(437,'fa','پورتوریکو',182),(438,'fa','قطر',183),(439,'fa','تجدید دیدار',184),(440,'fa','رومانی',185),(441,'fa','روسیه',186),(442,'fa','رواندا',187),(443,'fa','ساموآ',188),(444,'fa','سان مارینو',189),(445,'fa','سنت کیتس و نوویس',190),(446,'fa','عربستان سعودی',191),(447,'fa','سنگال',192),(448,'fa','صربستان',193),(449,'fa','سیشل',194),(450,'fa','سیرالئون',195),(451,'fa','سنگاپور',196),(452,'fa','سینت ماارتن',197),(453,'fa','اسلواکی',198),(454,'fa','اسلوونی',199),(455,'fa','جزایر سلیمان',200),(456,'fa','سومالی',201),(457,'fa','آفریقای جنوبی',202),(458,'fa','جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی',203),(459,'fa','کره جنوبی',204),(460,'fa','سودان جنوبی',205),(461,'fa','اسپانیا',206),(462,'fa','سری لانکا',207),(463,'fa','سنت بارتلی',208),(464,'fa','سنت هلنا',209),(465,'fa','سنت کیتز و نوویس',210),(466,'fa','سنت لوسیا',211),(467,'fa','سنت مارتین',212),(468,'fa','سنت پیر و میکلون',213),(469,'fa','سنت وینسنت و گرنادینها',214),(470,'fa','سودان',215),(471,'fa','سورینام',216),(472,'fa','اسوالبارد و جان ماین',217),(473,'fa','سوازیلند',218),(474,'fa','سوئد',219),(475,'fa','سوئیس',220),(476,'fa','سوریه',221),(477,'fa','تایوان',222),(478,'fa','تاجیکستان',223),(479,'fa','تانزانیا',224),(480,'fa','تایلند',225),(481,'fa','تیمور-لست',226),(482,'fa','رفتن',227),(483,'fa','توکلو',228),(484,'fa','تونگا',229),(485,'fa','ترینیداد و توباگو',230),(486,'fa','تریستان دا کانونا',231),(487,'fa','تونس',232),(488,'fa','بوقلمون',233),(489,'fa','ترکمنستان',234),(490,'fa','جزایر تورکس و کایکوس',235),(491,'fa','تووالو',236),(492,'fa','جزایر دور افتاده ایالات متحده آمریکا',237),(493,'fa','جزایر ویرجین ایالات متحده',238),(494,'fa','اوگاندا',239),(495,'fa','اوکراین',240),(496,'fa','امارات متحده عربی',241),(497,'fa','انگلستان',242),(498,'fa','سازمان ملل',243),(499,'fa','ایالات متحده',244),(500,'fa','اروگوئه',245),(501,'fa','ازبکستان',246),(502,'fa','وانواتو',247),(503,'fa','شهر واتیکان',248),(504,'fa','ونزوئلا',249),(505,'fa','ویتنام',250),(506,'fa','والیس و فوتونا',251),(507,'fa','صحرای غربی',252),(508,'fa','یمن',253),(509,'fa','زامبیا',254),(510,'fa','زیمبابوه',255),(511,'pt_BR','Afeganistão',1),(512,'pt_BR','Ilhas Åland',2),(513,'pt_BR','Albânia',3),(514,'pt_BR','Argélia',4),(515,'pt_BR','Samoa Americana',5),(516,'pt_BR','Andorra',6),(517,'pt_BR','Angola',7),(518,'pt_BR','Angola',8),(519,'pt_BR','Antártico',9),(520,'pt_BR','Antígua e Barbuda',10),(521,'pt_BR','Argentina',11),(522,'pt_BR','Armênia',12),(523,'pt_BR','Aruba',13),(524,'pt_BR','Ilha de escalada',14),(525,'pt_BR','Austrália',15),(526,'pt_BR','Áustria',16),(527,'pt_BR','Azerbaijão',17),(528,'pt_BR','Bahamas',18),(529,'pt_BR','Bahrain',19),(530,'pt_BR','Bangladesh',20),(531,'pt_BR','Barbados',21),(532,'pt_BR','Bielorrússia',22),(533,'pt_BR','Bélgica',23),(534,'pt_BR','Bélgica',24),(535,'pt_BR','Benin',25),(536,'pt_BR','Bermuda',26),(537,'pt_BR','Butão',27),(538,'pt_BR','Bolívia',28),(539,'pt_BR','Bósnia e Herzegovina',29),(540,'pt_BR','Botsuana',30),(541,'pt_BR','Brasil',31),(542,'pt_BR','Território Britânico do Oceano Índico',32),(543,'pt_BR','Ilhas Virgens Britânicas',33),(544,'pt_BR','Brunei',34),(545,'pt_BR','Bulgária',35),(546,'pt_BR','Burkina Faso',36),(547,'pt_BR','Burundi',37),(548,'pt_BR','Camboja',38),(549,'pt_BR','Camarões',39),(550,'pt_BR','Canadá',40),(551,'pt_BR','Ilhas Canárias',41),(552,'pt_BR','Cabo Verde',42),(553,'pt_BR','Holanda do Caribe',43),(554,'pt_BR','Ilhas Cayman',44),(555,'pt_BR','República Centro-Africana',45),(556,'pt_BR','Ceuta e Melilla',46),(557,'pt_BR','Chade',47),(558,'pt_BR','Chile',48),(559,'pt_BR','China',49),(560,'pt_BR','Ilha Christmas',50),(561,'pt_BR','Ilhas Cocos (Keeling)',51),(562,'pt_BR','Colômbia',52),(563,'pt_BR','Comores',53),(564,'pt_BR','Congo - Brazzaville',54),(565,'pt_BR','Congo - Kinshasa',55),(566,'pt_BR','Ilhas Cook',56),(567,'pt_BR','Costa Rica',57),(568,'pt_BR','Costa do Marfim',58),(569,'pt_BR','Croácia',59),(570,'pt_BR','Cuba',60),(571,'pt_BR','Curaçao',61),(572,'pt_BR','Chipre',62),(573,'pt_BR','Czechia',63),(574,'pt_BR','Dinamarca',64),(575,'pt_BR','Diego Garcia',65),(576,'pt_BR','Djibuti',66),(577,'pt_BR','Dominica',67),(578,'pt_BR','República Dominicana',68),(579,'pt_BR','Equador',69),(580,'pt_BR','Egito',70),(581,'pt_BR','El Salvador',71),(582,'pt_BR','Guiné Equatorial',72),(583,'pt_BR','Eritreia',73),(584,'pt_BR','Estônia',74),(585,'pt_BR','Etiópia',75),(586,'pt_BR','Zona Euro',76),(587,'pt_BR','Ilhas Malvinas',77),(588,'pt_BR','Ilhas Faroe',78),(589,'pt_BR','Fiji',79),(590,'pt_BR','Finlândia',80),(591,'pt_BR','França',81),(592,'pt_BR','Guiana Francesa',82),(593,'pt_BR','Polinésia Francesa',83),(594,'pt_BR','Territórios Franceses do Sul',84),(595,'pt_BR','Gabão',85),(596,'pt_BR','Gâmbia',86),(597,'pt_BR','Geórgia',87),(598,'pt_BR','Alemanha',88),(599,'pt_BR','Gana',89),(600,'pt_BR','Gibraltar',90),(601,'pt_BR','Grécia',91),(602,'pt_BR','Gronelândia',92),(603,'pt_BR','Granada',93),(604,'pt_BR','Guadalupe',94),(605,'pt_BR','Guam',95),(606,'pt_BR','Guatemala',96),(607,'pt_BR','Guernsey',97),(608,'pt_BR','Guiné',98),(609,'pt_BR','Guiné-Bissau',99),(610,'pt_BR','Guiana',100),(611,'pt_BR','Haiti',101),(612,'pt_BR','Honduras',102),(613,'pt_BR','Região Administrativa Especial de Hong Kong, China',103),(614,'pt_BR','Hungria',104),(615,'pt_BR','Islândia',105),(616,'pt_BR','Índia',106),(617,'pt_BR','Indonésia',107),(618,'pt_BR','Irã',108),(619,'pt_BR','Iraque',109),(620,'pt_BR','Irlanda',110),(621,'pt_BR','Ilha de Man',111),(622,'pt_BR','Israel',112),(623,'pt_BR','Itália',113),(624,'pt_BR','Jamaica',114),(625,'pt_BR','Japão',115),(626,'pt_BR','Jersey',116),(627,'pt_BR','Jordânia',117),(628,'pt_BR','Cazaquistão',118),(629,'pt_BR','Quênia',119),(630,'pt_BR','Quiribati',120),(631,'pt_BR','Kosovo',121),(632,'pt_BR','Kuwait',122),(633,'pt_BR','Quirguistão',123),(634,'pt_BR','Laos',124),(635,'pt_BR','Letônia',125),(636,'pt_BR','Líbano',126),(637,'pt_BR','Lesoto',127),(638,'pt_BR','Libéria',128),(639,'pt_BR','Líbia',129),(640,'pt_BR','Liechtenstein',130),(641,'pt_BR','Lituânia',131),(642,'pt_BR','Luxemburgo',132),(643,'pt_BR','Macau SAR China',133),(644,'pt_BR','Macedônia',134),(645,'pt_BR','Madagascar',135),(646,'pt_BR','Malawi',136),(647,'pt_BR','Malásia',137),(648,'pt_BR','Maldivas',138),(649,'pt_BR','Mali',139),(650,'pt_BR','Malta',140),(651,'pt_BR','Ilhas Marshall',141),(652,'pt_BR','Martinica',142),(653,'pt_BR','Mauritânia',143),(654,'pt_BR','Maurício',144),(655,'pt_BR','Maiote',145),(656,'pt_BR','México',146),(657,'pt_BR','Micronésia',147),(658,'pt_BR','Moldávia',148),(659,'pt_BR','Mônaco',149),(660,'pt_BR','Mongólia',150),(661,'pt_BR','Montenegro',151),(662,'pt_BR','Montserrat',152),(663,'pt_BR','Marrocos',153),(664,'pt_BR','Moçambique',154),(665,'pt_BR','Mianmar (Birmânia)',155),(666,'pt_BR','Namíbia',156),(667,'pt_BR','Nauru',157),(668,'pt_BR','Nepal',158),(669,'pt_BR','Holanda',159),(670,'pt_BR','Nova Caledônia',160),(671,'pt_BR','Nova Zelândia',161),(672,'pt_BR','Nicarágua',162),(673,'pt_BR','Níger',163),(674,'pt_BR','Nigéria',164),(675,'pt_BR','Niue',165),(676,'pt_BR','Ilha Norfolk',166),(677,'pt_BR','Coréia do Norte',167),(678,'pt_BR','Ilhas Marianas do Norte',168),(679,'pt_BR','Noruega',169),(680,'pt_BR','Omã',170),(681,'pt_BR','Paquistão',171),(682,'pt_BR','Palau',172),(683,'pt_BR','Territórios Palestinos',173),(684,'pt_BR','Panamá',174),(685,'pt_BR','Papua Nova Guiné',175),(686,'pt_BR','Paraguai',176),(687,'pt_BR','Peru',177),(688,'pt_BR','Filipinas',178),(689,'pt_BR','Ilhas Pitcairn',179),(690,'pt_BR','Polônia',180),(691,'pt_BR','Portugal',181),(692,'pt_BR','Porto Rico',182),(693,'pt_BR','Catar',183),(694,'pt_BR','Reunião',184),(695,'pt_BR','Romênia',185),(696,'pt_BR','Rússia',186),(697,'pt_BR','Ruanda',187),(698,'pt_BR','Samoa',188),(699,'pt_BR','São Marinho',189),(700,'pt_BR','São Cristóvão e Nevis',190),(701,'pt_BR','Arábia Saudita',191),(702,'pt_BR','Senegal',192),(703,'pt_BR','Sérvia',193),(704,'pt_BR','Seychelles',194),(705,'pt_BR','Serra Leoa',195),(706,'pt_BR','Cingapura',196),(707,'pt_BR','São Martinho',197),(708,'pt_BR','Eslováquia',198),(709,'pt_BR','Eslovênia',199),(710,'pt_BR','Ilhas Salomão',200),(711,'pt_BR','Somália',201),(712,'pt_BR','África do Sul',202),(713,'pt_BR','Ilhas Geórgia do Sul e Sandwich do Sul',203),(714,'pt_BR','Coréia do Sul',204),(715,'pt_BR','Sudão do Sul',205),(716,'pt_BR','Espanha',206),(717,'pt_BR','Sri Lanka',207),(718,'pt_BR','São Bartolomeu',208),(719,'pt_BR','Santa Helena',209),(720,'pt_BR','São Cristóvão e Nevis',210),(721,'pt_BR','Santa Lúcia',211),(722,'pt_BR','São Martinho',212),(723,'pt_BR','São Pedro e Miquelon',213),(724,'pt_BR','São Vicente e Granadinas',214),(725,'pt_BR','Sudão',215),(726,'pt_BR','Suriname',216),(727,'pt_BR','Svalbard e Jan Mayen',217),(728,'pt_BR','Suazilândia',218),(729,'pt_BR','Suécia',219),(730,'pt_BR','Suíça',220),(731,'pt_BR','Síria',221),(732,'pt_BR','Taiwan',222),(733,'pt_BR','Tajiquistão',223),(734,'pt_BR','Tanzânia',224),(735,'pt_BR','Tailândia',225),(736,'pt_BR','Timor-Leste',226),(737,'pt_BR','Togo',227),(738,'pt_BR','Tokelau',228),(739,'pt_BR','Tonga',229),(740,'pt_BR','Trinidad e Tobago',230),(741,'pt_BR','Tristan da Cunha',231),(742,'pt_BR','Tunísia',232),(743,'pt_BR','Turquia',233),(744,'pt_BR','Turquemenistão',234),(745,'pt_BR','Ilhas Turks e Caicos',235),(746,'pt_BR','Tuvalu',236),(747,'pt_BR','Ilhas periféricas dos EUA',237),(748,'pt_BR','Ilhas Virgens dos EUA',238),(749,'pt_BR','Uganda',239),(750,'pt_BR','Ucrânia',240),(751,'pt_BR','Emirados Árabes Unidos',241),(752,'pt_BR','Reino Unido',242),(753,'pt_BR','Nações Unidas',243),(754,'pt_BR','Estados Unidos',244),(755,'pt_BR','Uruguai',245),(756,'pt_BR','Uzbequistão',246),(757,'pt_BR','Vanuatu',247),(758,'pt_BR','Cidade do Vaticano',248),(759,'pt_BR','Venezuela',249),(760,'pt_BR','Vietnã',250),(761,'pt_BR','Wallis e Futuna',251),(762,'pt_BR','Saara Ocidental',252),(763,'pt_BR','Iêmen',253),(764,'pt_BR','Zâmbia',254),(765,'pt_BR','Zimbábue',255);
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (3,'BGN','Български лев','2021-02-16 09:43:03','2021-02-16 09:43:03','лв.');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'Guest',0,NULL,NULL,'guest'),(2,'General',0,NULL,NULL,'general'),(3,'Wholesale',0,NULL,NULL,'wholesale');
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'test1','test1','Male','1996-10-08','test@test.bg',1,'$2y$10$yWb6E0HdNGe5M5BsKU2dZeUs3C2pzdKtdMUkfxVn2Wg73ZjbM6CGe',NULL,2,0,NULL,'2021-02-16 13:25:05','2021-02-16 16:01:58',1,NULL,NULL,''),(2,'test','test',NULL,NULL,'asd@asd.bg',1,'$2y$10$L47I45kqxtkQQLUiGYolse9zEi7U6FyN11lNRToZ//xlJYAQebHZa',NULL,2,0,NULL,'2021-02-16 15:34:47','2021-02-16 15:34:47',1,NULL,NULL,NULL),(3,'asd','asd',NULL,NULL,'asd@asd.bgd',1,'$2y$10$l9zB8lblZ9HXamyY0HBI1OqasHuI6xqI63lZt/RRe7ZiCLeFZiNLC',NULL,2,0,NULL,'2021-02-17 15:43:36','2021-02-17 15:43:36',1,NULL,NULL,NULL),(4,'test','test',NULL,NULL,'asdqwe@asd.bg',1,'$2y$10$4srch0FK0z2I.tZnB/VIluuMvsdzRz3qF5o0qx/BpIolSUzq6u8Xq',NULL,2,0,NULL,'2021-02-17 15:45:10','2021-02-17 15:45:10',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'budobalkani','Склад на Будобалкани','','Склад на Будобалкани','office@budobalkani.bg','0878909184','','BG','SF','София','ул.Белимел 19Б','1756',0,42.69833,23.31994,1,NULL,'2021-02-16 09:44:44');
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (5,'bg','Български','2021-02-16 09:42:47','2021-02-16 09:42:47','ltr',NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Birthday','Birthday',NULL,NULL,NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_templates`
--

DROP TABLE IF EXISTS `marketing_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_templates`
--

LOCK TABLES `marketing_templates` WRITE;
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_24_083025_create_customer_addresses_table',1),(23,'2018_07_27_065727_create_products_table',1),(24,'2018_07_27_070011_create_product_attribute_values_table',1),(25,'2018_07_27_092623_create_product_reviews_table',1),(26,'2018_07_27_113941_create_product_images_table',1),(27,'2018_07_27_113956_create_product_inventories_table',1),(28,'2018_08_03_114203_create_sliders_table',1),(29,'2018_08_30_064755_create_tax_categories_table',1),(30,'2018_08_30_065042_create_tax_rates_table',1),(31,'2018_08_30_065840_create_tax_mappings_table',1),(32,'2018_09_05_150444_create_cart_table',1),(33,'2018_09_05_150915_create_cart_items_table',1),(34,'2018_09_11_064045_customer_password_resets',1),(35,'2018_09_19_092845_create_cart_address',1),(36,'2018_09_19_093453_create_cart_payment',1),(37,'2018_09_19_093508_create_cart_shipping_rates_table',1),(38,'2018_09_20_060658_create_core_config_table',1),(39,'2018_09_27_113154_create_orders_table',1),(40,'2018_09_27_113207_create_order_items_table',1),(41,'2018_09_27_113405_create_order_address_table',1),(42,'2018_09_27_115022_create_shipments_table',1),(43,'2018_09_27_115029_create_shipment_items_table',1),(44,'2018_09_27_115135_create_invoices_table',1),(45,'2018_09_27_115144_create_invoice_items_table',1),(46,'2018_10_01_095504_create_order_payment_table',1),(47,'2018_10_03_025230_create_wishlist_table',1),(48,'2018_10_12_101803_create_country_translations_table',1),(49,'2018_10_12_101913_create_country_states_table',1),(50,'2018_10_12_101923_create_country_state_translations_table',1),(51,'2018_11_15_153257_alter_order_table',1),(52,'2018_11_15_163729_alter_invoice_table',1),(53,'2018_11_16_173504_create_subscribers_list_table',1),(54,'2018_11_17_165758_add_is_verified_column_in_customers_table',1),(55,'2018_11_21_144411_create_cart_item_inventories_table',1),(56,'2018_11_26_110500_change_gender_column_in_customers_table',1),(57,'2018_11_27_174449_change_content_column_in_sliders_table',1),(58,'2018_12_05_132625_drop_foreign_key_core_config_table',1),(59,'2018_12_05_132629_alter_core_config_table',1),(60,'2018_12_06_185202_create_product_flat_table',1),(61,'2018_12_21_101307_alter_channels_table',1),(62,'2018_12_24_123812_create_channel_inventory_sources_table',1),(63,'2018_12_24_184402_alter_shipments_table',1),(64,'2018_12_26_165327_create_product_ordered_inventories_table',1),(65,'2018_12_31_161114_alter_channels_category_table',1),(66,'2019_01_11_122452_add_vendor_id_column_in_product_inventories_table',1),(67,'2019_01_25_124522_add_updated_at_column_in_product_flat_table',1),(68,'2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table',1),(69,'2019_01_31_164117_update_value_column_type_to_text_in_core_config_table',1),(70,'2019_02_21_145238_alter_product_reviews_table',1),(71,'2019_02_21_152709_add_swatch_type_column_in_attributes_table',1),(72,'2019_02_21_153035_alter_customer_id_in_product_reviews_table',1),(73,'2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table',1),(74,'2019_03_15_123337_add_display_mode_column_in_categories_table',1),(75,'2019_03_28_103658_add_notes_column_in_customers_table',1),(76,'2019_04_24_155820_alter_product_flat_table',1),(77,'2019_05_13_024320_remove_tables',1),(78,'2019_05_13_024321_create_cart_rules_table',1),(79,'2019_05_13_024322_create_cart_rule_channels_table',1),(80,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(81,'2019_05_13_024324_create_cart_rule_translations_table',1),(82,'2019_05_13_024325_create_cart_rule_customers_table',1),(83,'2019_05_13_024326_create_cart_rule_coupons_table',1),(84,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(85,'2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table',1),(86,'2019_05_23_113407_add_remaining_column_in_product_flat_table',1),(87,'2019_05_23_155520_add_discount_columns_in_invoice_items_table',1),(88,'2019_05_23_184029_rename_discount_columns_in_cart_table',1),(89,'2019_06_04_114009_add_phone_column_in_customers_table',1),(90,'2019_06_06_195905_update_custom_price_to_nullable_in_cart_items',1),(91,'2019_06_15_183412_add_code_column_in_customer_groups_table',1),(92,'2019_06_17_180258_create_product_downloadable_samples_table',1),(93,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(94,'2019_06_17_180325_create_product_downloadable_links_table',1),(95,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(96,'2019_06_19_162817_remove_unique_in_phone_column_in_customers_table',1),(97,'2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table',1),(98,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(99,'2019_07_02_180307_create_booking_products_table',1),(100,'2019_07_05_114157_add_symbol_column_in_currencies_table',1),(101,'2019_07_05_154415_create_booking_product_default_slots_table',1),(102,'2019_07_05_154429_create_booking_product_appointment_slots_table',1),(103,'2019_07_05_154440_create_booking_product_event_tickets_table',1),(104,'2019_07_05_154451_create_booking_product_rental_slots_table',1),(105,'2019_07_05_154502_create_booking_product_table_slots_table',1),(106,'2019_07_11_151210_add_locale_id_in_category_translations',1),(107,'2019_07_23_033128_alter_locales_table',1),(108,'2019_07_23_174708_create_velocity_contents_table',1),(109,'2019_07_23_175212_create_velocity_contents_translations_table',1),(110,'2019_07_29_142734_add_use_in_flat_column_in_attributes_table',1),(111,'2019_07_30_153530_create_cms_pages_table',1),(112,'2019_07_31_143339_create_category_filterable_attributes_table',1),(113,'2019_08_02_105320_create_product_grouped_products_table',1),(114,'2019_08_12_184925_add_additional_cloumn_in_wishlist_table',1),(115,'2019_08_20_170510_create_product_bundle_options_table',1),(116,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(117,'2019_08_20_170528_create_product_bundle_option_products_table',1),(118,'2019_08_21_123707_add_seo_column_in_channels_table',1),(119,'2019_09_11_184511_create_refunds_table',1),(120,'2019_09_11_184519_create_refund_items_table',1),(121,'2019_09_26_163950_remove_channel_id_from_customers_table',1),(122,'2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table',1),(123,'2019_10_21_105136_order_brands',1),(124,'2019_10_24_173358_change_postcode_column_type_in_order_address_table',1),(125,'2019_10_24_173437_change_postcode_column_type_in_cart_address_table',1),(126,'2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table',1),(127,'2019_11_21_194541_add_column_url_path_to_category_translations',1),(128,'2019_11_21_194608_add_stored_function_to_get_url_path_of_category',1),(129,'2019_11_21_194627_add_trigger_to_category_translations',1),(130,'2019_11_21_194648_add_url_path_to_existing_category_translations',1),(131,'2019_11_21_194703_add_trigger_to_categories',1),(132,'2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table',1),(133,'2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table',1),(134,'2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table',1),(135,'2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table',1),(136,'2019_12_03_175253_create_remove_catalog_rule_tables',1),(137,'2019_12_03_184613_create_catalog_rules_table',1),(138,'2019_12_03_184651_create_catalog_rule_channels_table',1),(139,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(140,'2019_12_06_101110_create_catalog_rule_products_table',1),(141,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(142,'2019_12_30_155256_create_velocity_meta_data',1),(143,'2020_01_02_201029_add_api_token_columns',1),(144,'2020_01_06_173505_alter_trigger_category_translations',1),(145,'2020_01_06_173524_alter_stored_function_url_path_category',1),(146,'2020_01_06_195305_alter_trigger_on_categories',1),(147,'2020_01_09_154851_add_shipping_discount_columns_in_orders_table',1),(148,'2020_01_09_202815_add_inventory_source_name_column_in_shipments_table',1),(149,'2020_01_10_122226_update_velocity_meta_data',1),(150,'2020_01_10_151902_customer_address_improvements',1),(151,'2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table',1),(152,'2020_01_13_155803_add_velocity_locale_icon',1),(153,'2020_01_13_192149_add_category_velocity_meta_data',1),(154,'2020_01_14_191854_create_cms_page_translations_table',1),(155,'2020_01_14_192206_remove_columns_from_cms_pages_table',1),(156,'2020_01_15_130209_create_cms_page_channels_table',1),(157,'2020_01_15_145637_add_product_policy',1),(158,'2020_01_15_152121_add_banner_link',1),(159,'2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table',1),(160,'2020_01_29_124748_alter_name_column_in_country_state_translations_table',1),(161,'2020_02_18_165639_create_bookings_table',1),(162,'2020_02_21_121201_create_booking_product_event_ticket_translations_table',1),(163,'2020_02_24_190025_add_is_comparable_column_in_attributes_table',1),(164,'2020_02_25_181902_propagate_company_name',1),(165,'2020_02_26_163908_change_column_type_in_cart_rules_table',1),(166,'2020_02_28_105104_fix_order_columns',1),(167,'2020_02_28_111958_create_customer_compare_products_table',1),(168,'2020_03_23_201431_alter_booking_products_table',1),(169,'2020_04_13_224524_add_locale_in_sliders_table',1),(170,'2020_04_16_130351_remove_channel_from_tax_category',1),(171,'2020_04_16_185147_add_table_addresses',1),(172,'2020_05_06_171638_create_order_comments_table',1),(173,'2020_05_21_171500_create_product_customer_group_prices_table',1),(174,'2020_06_08_161708_add_sale_prices_to_booking_product_event_tickets',1),(175,'2020_06_10_201453_add_locale_velocity_meta_data',1),(176,'2020_06_25_162154_create_customer_social_accounts_table',1),(177,'2020_06_25_162340_change_email_password_columns_in_customers_table',1),(178,'2020_06_30_163510_remove_unique_name_in_tax_categories_table',1),(179,'2020_07_31_142021_update_cms_page_translations_table_field_html_content',1),(180,'2020_08_01_132239_add_header_content_count_velocity_meta_data_table',1),(181,'2020_08_12_114128_removing_foriegn_key',1),(182,'2020_08_17_104228_add_channel_to_velocity_meta_data_table',1),(183,'2020_09_07_120413_add_unique_index_to_increment_id_in_orders_table',1),(184,'2020_09_07_195157_add_additional_to_category',1),(185,'2020_11_10_174816_add_product_number_column_in_product_flat_table',1),(186,'2020_11_19_112228_create_product_videos_table',1),(187,'2020_11_20_105353_add_columns_in_channels_table',1),(188,'2020_11_26_141455_create_marketing_templates_table',1),(189,'2020_11_26_150534_create_marketing_events_table',1),(190,'2020_11_26_150644_create_marketing_campaigns_table',1),(191,'2020_12_18_122826_add_is_tax_calculation_column_to_cart_shipping_rates_table',1),(192,'2020_12_21_000200_create_channel_translations_table',1),(193,'2020_12_21_140151_remove_columns_from_channels_table',1),(194,'2020_12_24_131004_add_customer_id_column_in_subscribers_list_table',1),(195,'2020_12_27_121950_create_jobs_table',1),(196,'2021_02_03_104907_add_adittional_data_to_order_payment_table',1),(197,'2021_02_04_150033_add_download_canceled_column_in_downloadable_link_purchased_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_brands`
--

DROP TABLE IF EXISTS `order_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `brand` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_brands_order_id_foreign` (`order_id`),
  KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  KEY `order_brands_product_id_foreign` (`product_id`),
  KEY `order_brands_brand_foreign` (`brand`),
  CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_brands`
--

LOCK TABLES `order_brands` WRITE;
/*!40000 ALTER TABLE `order_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (80,'bg','default','<p>Click the Pocket Button to save any article, video or page from Firefox.</p>',NULL,NULL,NULL,NULL,NULL,NULL,6,9),(81,'bg','default','<p>Click the Pocket Button to save any article, video or page from Firefox.</p>',NULL,NULL,NULL,NULL,NULL,NULL,6,10),(82,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,6,1),(83,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,6,2),(84,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,6,3),(85,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,6,4),(86,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,6,5),(87,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,6,6),(88,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,7),(89,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,6,8),(90,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,26),(91,NULL,NULL,'123',NULL,NULL,NULL,NULL,NULL,NULL,6,27),(92,'bg','default','',NULL,NULL,NULL,NULL,NULL,NULL,6,16),(93,'bg','default','',NULL,NULL,NULL,NULL,NULL,NULL,6,17),(94,'bg','default','',NULL,NULL,NULL,NULL,NULL,NULL,6,18),(95,NULL,NULL,NULL,NULL,NULL,22.0000,NULL,NULL,NULL,6,11),(96,NULL,NULL,NULL,NULL,NULL,14.0000,NULL,NULL,NULL,6,13),(97,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,14),(98,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,15),(99,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,19),(100,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,20),(101,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,22),(102,'bg','default','<p>In iste at vero. Eum ipsum reprehenderit explicabo labore officia deserunt beatae voluptatem. Quo dolore in nesciunt ipsam explicabo quia aperiam.</p>',NULL,NULL,NULL,NULL,NULL,NULL,7,9),(103,'bg','default','<p>Dolorem sed et est consequatur. Assumenda vitae tempore et ad. Ea qui rem tempore voluptatibus omnis molestias. Qui voluptas impedit quaerat. Ea a non et quidem quo aut.</p>',NULL,NULL,NULL,NULL,NULL,NULL,7,10),(104,NULL,NULL,'asdasd',NULL,NULL,NULL,NULL,NULL,NULL,7,1),(105,NULL,NULL,'Dana Kling MD',NULL,NULL,NULL,NULL,NULL,NULL,7,2),(106,NULL,NULL,'ou7scmgr0n',NULL,NULL,NULL,NULL,NULL,NULL,7,3),(107,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,5),(108,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,7,6),(109,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,7),(110,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,8),(111,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,26),(112,NULL,NULL,'Miss Sophia Parker PhD',NULL,NULL,NULL,NULL,NULL,NULL,7,27),(113,'bg','default','Voluptates maiores ipsa voluptate nobis. Aut quisquam eaque voluptate mollitia. Sunt sint modi ducimus doloribus fugit ut.',NULL,NULL,NULL,NULL,NULL,NULL,7,16),(114,'bg','default','Esse facere qui ad qui consequatur quos. Ullam rerum laboriosam eos ab in at.',NULL,NULL,NULL,NULL,NULL,NULL,7,17),(115,'bg','default','Ab dolor maxime quasi. Possimus alias non aperiam aut.',NULL,NULL,NULL,NULL,NULL,NULL,7,18),(116,NULL,NULL,NULL,NULL,NULL,23.0000,NULL,NULL,NULL,7,11),(117,NULL,NULL,NULL,NULL,NULL,10.0000,NULL,NULL,NULL,7,13),(118,NULL,'default',NULL,NULL,NULL,NULL,NULL,'2021-02-16',NULL,7,14),(119,NULL,'default',NULL,NULL,NULL,NULL,NULL,'2021-02-23',NULL,7,15),(120,NULL,NULL,'28',NULL,NULL,NULL,NULL,NULL,NULL,7,19),(121,NULL,NULL,'731',NULL,NULL,NULL,NULL,NULL,NULL,7,20),(122,NULL,NULL,'502',NULL,NULL,NULL,NULL,NULL,NULL,7,22),(123,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,7,4);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_bundle_option_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (6,3),(7,1);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `cost` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `color` int DEFAULT NULL,
  `color_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `size_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `width` decimal(12,4) DEFAULT NULL,
  `height` decimal(12,4) DEFAULT NULL,
  `depth` decimal(12,4) DEFAULT NULL,
  `brand` int DEFAULT NULL,
  `brand_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (6,'test','123','test','<p>Click the Pocket Button to save any article, video or page from Firefox.</p>','test',0,0,0,NULL,22.0000,NULL,14.0000,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,'2021-02-16 16:48:57','bg','default',6,'2021-02-16 16:48:57',NULL,1,14.0000,14.0000,'<p>Click the Pocket Button to save any article, video or page from Firefox.</p>','','','',0.0000,0.0000,NULL,NULL,NULL),(7,'asdasd','Miss Sophia Parker PhD','Dana Kling MD','<p>Dolorem sed et est consequatur. Assumenda vitae tempore et ad. Ea qui rem tempore voluptatibus omnis molestias. Qui voluptas impedit quaerat. Ea a non et quidem quo aut.</p>','ou7scmgr0n',1,0,1,NULL,23.0000,NULL,10.0000,'2021-02-16','2021-02-23',502.0000,NULL,NULL,NULL,NULL,'2021-02-16 17:11:22','bg','default',7,'2021-02-16 17:11:57',NULL,1,10.0000,10.0000,'<p>In iste at vero. Eum ipsum reprehenderit explicabo labore officia deserunt beatae voluptatem. Quo dolore in nesciunt ipsam explicabo quia aperiam.</p>','Voluptates maiores ipsa voluptate nobis. Aut quisquam eaque voluptate mollitia. Sunt sint modi ducimus doloribus fugit ut.','Esse facere qui ad qui consequatur quos. Ullam rerum laboriosam eos ab in at.','Ab dolor maxime quasi. Possimus alias non aperiam aut.',28.0000,731.0000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_grouped_products_product_id_foreign` (`product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (7,NULL,'product/6/Sy00PrKeQxYPdIm4euQfYvwLjtgzJrOc5W8uXE4J.png',6);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (5,4,6,1,0),(6,10,7,1,0);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_relations_parent_id_foreign` (`parent_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  KEY `product_reviews_customer_id_foreign` (`customer_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `product_super_attributes_product_id_foreign` (`product_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (6,'test','simple','2021-02-16 14:48:57','2021-02-16 14:48:57',NULL,1),(7,'asdasd','simple','2021-02-16 15:11:22','2021-02-16 15:11:57',NULL,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','Administrator role','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `shipments_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents`
--

DROP TABLE IF EXISTS `velocity_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents`
--

LOCK TABLES `velocity_contents` WRITE;
/*!40000 ALTER TABLE `velocity_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents_translations`
--

DROP TABLE IF EXISTS `velocity_contents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_contents_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_translations_content_id_foreign` (`content_id`),
  CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents_translations`
--

LOCK TABLES `velocity_contents_translations` WRITE;
/*!40000 ALTER TABLE `velocity_contents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_customer_compare_products`
--

DROP TABLE IF EXISTS `velocity_customer_compare_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_customer_compare_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_flat_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_customer_compare_products_product_flat_id_foreign` (`product_flat_id`),
  KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `velocity_customer_compare_products_product_flat_id_foreign` FOREIGN KEY (`product_flat_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_customer_compare_products`
--

LOCK TABLES `velocity_customer_compare_products` WRITE;
/*!40000 ALTER TABLE `velocity_customer_compare_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_customer_compare_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_meta_data`
--

DROP TABLE IF EXISTS `velocity_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `velocity_meta_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int NOT NULL DEFAULT '9',
  `featured_product_count` int NOT NULL DEFAULT '10',
  `new_products_count` int NOT NULL DEFAULT '10',
  `subscription_bar_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text COLLATE utf8mb4_unicode_ci,
  `locale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content_count` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_meta_data`
--

LOCK TABLES `velocity_meta_data` WRITE;
/*!40000 ALTER TABLE `velocity_meta_data` DISABLE KEYS */;
INSERT INTO `velocity_meta_data` VALUES (1,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/about-us\') !!}\">About Us</a></li><li><a href=\"{!! url(\'page/cutomer-service\') !!}\">Customer Service</a></li><li><a href=\"{!! url(\'page/whats-new\') !!}\">What&rsquo;s New</a></li><li><a href=\"{!! url(\'page/contact-us\') !!}\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/return-policy\') !!}\"> Order and Returns </a></li><li><a href=\"{!! url(\'page/payment-policy\') !!}\"> Payment Policy </a></li><li><a href=\"{!! url(\'page/shipping-policy\') !!}\"> Shipping Policy</a></li><li><a href=\"{!! url(\'page/privacy-policy\') !!}\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>',NULL,NULL,NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>','en','default','5'),(2,'','','',0,'[]',0,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>',NULL,'2021-02-16 10:07:26',NULL,'','bg','default','');
/*!40000 ALTER TABLE `velocity_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-17 18:57:54

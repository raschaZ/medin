/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: admin_medin
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abandoned_cart_rule_histories`
--

DROP TABLE IF EXISTS `abandoned_cart_rule_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_cart_rule_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cart_rule_id` int(10) unsigned DEFAULT NULL,
  `rule_action` enum('send_reminder','send_coupon') NOT NULL,
  `type` enum('auto','manual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'auto',
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abandoned_cart_rule_histories`
--

LOCK TABLES `abandoned_cart_rule_histories` WRITE;
/*!40000 ALTER TABLE `abandoned_cart_rule_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `abandoned_cart_rule_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abandoned_cart_rule_specification_items`
--

DROP TABLE IF EXISTS `abandoned_cart_rule_specification_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_cart_rule_specification_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abandoned_cart_rule_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `instructor_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rule_id_foreign` (`abandoned_cart_rule_id`),
  KEY `abandoned_cart_rule_specification_items_category_id_foreign` (`category_id`),
  KEY `abandoned_cart_rule_specification_items_instructor_id_foreign` (`instructor_id`),
  KEY `abandoned_cart_rule_specification_items_seller_id_foreign` (`seller_id`),
  KEY `abandoned_cart_rule_specification_items_webinar_id_foreign` (`webinar_id`),
  KEY `abandoned_cart_rule_specification_items_product_id_foreign` (`product_id`),
  KEY `abandoned_cart_rule_specification_items_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `abandoned_cart_rule_id_foreign` FOREIGN KEY (`abandoned_cart_rule_id`) REFERENCES `abandoned_cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abandoned_cart_rule_specification_items`
--

LOCK TABLES `abandoned_cart_rule_specification_items` WRITE;
/*!40000 ALTER TABLE `abandoned_cart_rule_specification_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `abandoned_cart_rule_specification_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abandoned_cart_rule_translations`
--

DROP TABLE IF EXISTS `abandoned_cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_cart_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abandoned_cart_rule_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rule_id_trans` (`abandoned_cart_rule_id`),
  KEY `abandoned_cart_rule_translations_locale_index` (`locale`),
  CONSTRAINT `abandoned_cart_rule_id_trans` FOREIGN KEY (`abandoned_cart_rule_id`) REFERENCES `abandoned_cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abandoned_cart_rule_translations`
--

LOCK TABLES `abandoned_cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `abandoned_cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `abandoned_cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abandoned_cart_rule_users_groups`
--

DROP TABLE IF EXISTS `abandoned_cart_rule_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_cart_rule_users_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abandoned_cart_rule_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rule_id` (`abandoned_cart_rule_id`),
  KEY `abandoned_cart_rule_users_groups_group_id_foreign` (`group_id`),
  KEY `abandoned_cart_rule_users_groups_user_id_foreign` (`user_id`),
  CONSTRAINT `abandoned_cart_rule_id` FOREIGN KEY (`abandoned_cart_rule_id`) REFERENCES `abandoned_cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abandoned_cart_rule_users_groups`
--

LOCK TABLES `abandoned_cart_rule_users_groups` WRITE;
/*!40000 ALTER TABLE `abandoned_cart_rule_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `abandoned_cart_rule_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abandoned_cart_rules`
--

DROP TABLE IF EXISTS `abandoned_cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_cart_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('all','courses','store_products','bundles','meetings') NOT NULL DEFAULT 'all',
  `target` varchar(255) DEFAULT NULL,
  `action` enum('send_reminder','send_coupon') NOT NULL,
  `discount_id` int(10) unsigned DEFAULT NULL,
  `action_cycle` int(10) unsigned NOT NULL,
  `repeat_action` tinyint(1) NOT NULL DEFAULT 0,
  `repeat_action_count` int(10) unsigned DEFAULT NULL,
  `minimum_cart_amount` double(15,2) unsigned DEFAULT NULL,
  `maximum_cart_amount` double(15,2) unsigned DEFAULT NULL,
  `start_at` bigint(20) unsigned DEFAULT NULL,
  `end_at` bigint(20) unsigned DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rules_discount_id_foreign` (`discount_id`),
  CONSTRAINT `abandoned_cart_rules_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abandoned_cart_rules`
--

LOCK TABLES `abandoned_cart_rules` WRITE;
/*!40000 ALTER TABLE `abandoned_cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `abandoned_cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting`
--

DROP TABLE IF EXISTS `accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `meeting_time_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `installment_payment_id` int(10) unsigned DEFAULT NULL,
  `installment_order_id` int(10) unsigned DEFAULT NULL COMMENT 'This field is filled in the seller''s financial document to find the installment order',
  `gift_id` int(10) unsigned DEFAULT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `tax` tinyint(1) NOT NULL DEFAULT 0,
  `amount` decimal(13,2) DEFAULT NULL,
  `type` enum('addiction','deduction') NOT NULL,
  `type_account` enum('income','asset','subscribe','promotion','registration_package','installment_payment') DEFAULT NULL,
  `store_type` enum('automatic','manual') NOT NULL DEFAULT 'automatic',
  `referred_user_id` int(10) unsigned DEFAULT NULL,
  `is_affiliate_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_affiliate_commission` tinyint(1) NOT NULL DEFAULT 0,
  `is_registration_bonus` tinyint(1) NOT NULL DEFAULT 0,
  `is_cashback` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `webinar_id` (`webinar_id`) USING BTREE,
  KEY `meeting_time_id` (`meeting_time_id`) USING BTREE,
  KEY `subscribe_id` (`subscribe_id`) USING BTREE,
  KEY `promotion_id` (`promotion_id`) USING BTREE,
  KEY `accounting_installment_payment_id_foreign` (`installment_payment_id`),
  CONSTRAINT `accounting_installment_payment_id_foreign` FOREIGN KEY (`installment_payment_id`) REFERENCES `installment_order_payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting`
--

LOCK TABLES `accounting` WRITE;
/*!40000 ALTER TABLE `accounting` DISABLE KEYS */;
INSERT INTO `accounting` VALUES
(2,1050,1051,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,5012.00,'addiction','asset','automatic',NULL,0,0,0,0,NULL,1597826952),
(837,1050,1051,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,5012.00,'addiction','income','automatic',NULL,0,0,0,0,NULL,1597826952),
(838,1050,NULL,722,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,57.20,'deduction','asset','automatic',NULL,0,0,0,0,'Paid form credit',1730818592),
(839,1050,NULL,722,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,5.20,'addiction','asset','automatic',NULL,0,0,0,0,'Tax form buyer',1730818594),
(840,1051,NULL,722,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,41.60,'addiction','income','automatic',NULL,0,0,0,0,'Sales income',1730818594),
(841,1051,NULL,722,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,10.40,'addiction','income','automatic',NULL,0,0,0,0,'Seller commission',1730818594),
(842,1050,NULL,725,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,55.00,'deduction','asset','automatic',NULL,0,0,0,0,'Paid form credit',1730890465),
(843,1050,NULL,725,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,5.00,'addiction','asset','automatic',NULL,0,0,0,0,'Tax form buyer',1730890466),
(844,1051,NULL,725,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40.00,'addiction','income','automatic',NULL,0,0,0,0,'Sales income',1730890466),
(845,1051,NULL,725,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,10.00,'addiction','income','automatic',NULL,0,0,0,0,'Seller commission',1730890466),
(846,1050,NULL,726,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,55.00,'deduction','asset','automatic',NULL,0,0,0,0,'Paid form credit',1730890648),
(847,1050,NULL,726,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,5.00,'addiction','asset','automatic',NULL,0,0,0,0,'Tax form buyer',1730890649),
(848,1051,NULL,726,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40.00,'addiction','income','automatic',NULL,0,0,0,0,'Sales income',1730890649),
(849,1051,NULL,726,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,10.00,'addiction','income','automatic',NULL,0,0,0,0,'Seller commission',1730890649),
(850,1050,NULL,728,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,0,0,55.00,'deduction','asset','automatic',NULL,0,0,0,0,'Paid form credit',1733734691),
(851,1050,NULL,728,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,0,1,5.00,'addiction','asset','automatic',NULL,0,0,0,0,'Tax form buyer',1733734692),
(852,NULL,NULL,728,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,1,0,50.00,'addiction','subscribe','automatic',NULL,0,0,0,0,'Item subscription income',1733734692),
(853,1051,NULL,NULL,2060,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,6.25,'addiction','income','automatic',NULL,0,0,0,0,'Paid using subscription',1733734723),
(854,1,NULL,NULL,2060,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,6.25,'deduction','asset','automatic',NULL,0,0,0,0,'Paid using subscription',1733734723),
(855,1051,NULL,NULL,2061,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,6.25,'addiction','income','automatic',NULL,0,0,0,0,'Paid using subscription',1733734924),
(856,1,NULL,NULL,2061,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,6.25,'deduction','asset','automatic',NULL,0,0,0,0,'Paid using subscription',1733734924),
(857,1050,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,250.00,'addiction','asset','automatic',NULL,0,0,0,0,'Offline payment approved',1737540224),
(858,1050,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,250.00,'addiction','asset','automatic',NULL,0,0,0,0,'Offline payment approved',1737545462),
(859,1049,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100.00,'addiction','asset','automatic',NULL,0,0,0,0,'Offline payment approved',1741424062),
(860,1073,1071,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,50.00,'addiction','asset','automatic',NULL,0,0,0,0,'Offline payment approved',1742215343),
(861,1073,1071,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,12.00,'addiction','asset','automatic',NULL,0,0,0,0,'Offline payment approved',1744035758),
(862,1051,1071,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,250.00,'addiction','asset','automatic',NULL,0,0,0,0,'Offline payment approved',1747473619);
/*!40000 ALTER TABLE `accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertising_banners`
--

DROP TABLE IF EXISTS `advertising_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertising_banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` enum('home1','home2','course','course_sidebar','product_show','bundle','bundle_sidebar') NOT NULL,
  `size` int(10) unsigned NOT NULL DEFAULT 12,
  `link` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising_banners`
--

LOCK TABLES `advertising_banners` WRITE;
/*!40000 ALTER TABLE `advertising_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertising_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertising_banners_translations`
--

DROP TABLE IF EXISTS `advertising_banners_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertising_banners_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `advertising_banner_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertising_banners_translations_advertising_banner_id_foreign` (`advertising_banner_id`),
  KEY `advertising_banners_translations_locale_index` (`locale`),
  CONSTRAINT `advertising_banners_translations_advertising_banner_id_foreign` FOREIGN KEY (`advertising_banner_id`) REFERENCES `advertising_banners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising_banners_translations`
--

LOCK TABLES `advertising_banners_translations` WRITE;
/*!40000 ALTER TABLE `advertising_banners_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertising_banners_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_user_id` int(10) unsigned NOT NULL,
  `referred_user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliates_affiliate_user_id_foreign` (`affiliate_user_id`),
  KEY `affiliates_referred_user_id_foreign` (`referred_user_id`),
  CONSTRAINT `affiliates_affiliate_user_id_foreign` FOREIGN KEY (`affiliate_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `affiliates_referred_user_id_foreign` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates`
--

LOCK TABLES `affiliates` WRITE;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliates_codes`
--

DROP TABLE IF EXISTS `affiliates_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliates_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliates_codes_code_unique` (`code`),
  KEY `affiliates_codes_user_id_foreign` (`user_id`),
  CONSTRAINT `affiliates_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates_codes`
--

LOCK TABLES `affiliates_codes` WRITE;
/*!40000 ALTER TABLE `affiliates_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliates_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agora_history`
--

DROP TABLE IF EXISTS `agora_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agora_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `start_at` int(10) unsigned NOT NULL,
  `end_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agora_history_session_id_foreign` (`session_id`),
  CONSTRAINT `agora_history_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agora_history`
--

LOCK TABLES `agora_history` WRITE;
/*!40000 ALTER TABLE `agora_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `agora_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_content_template_translations`
--

DROP TABLE IF EXISTS `ai_content_template_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_content_template_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ai_content_template_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  `prompt` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ai_content_template_id_trans` (`ai_content_template_id`),
  KEY `ai_content_template_translations_locale_index` (`locale`),
  CONSTRAINT `ai_content_template_id_trans` FOREIGN KEY (`ai_content_template_id`) REFERENCES `ai_content_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_content_template_translations`
--

LOCK TABLES `ai_content_template_translations` WRITE;
/*!40000 ALTER TABLE `ai_content_template_translations` DISABLE KEYS */;
INSERT INTO `ai_content_template_translations` VALUES
(1,1,'en','Course Title','Generate a text with the [keyword] subject in [language] language with less than [length] word for a course title.'),
(2,2,'en','Course Short Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words.'),
(3,3,'en','Course Long Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words.'),
(4,4,'en','Blog Title','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog title.'),
(5,5,'en','Blog Short Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog short description.'),
(6,6,'en','Blog Long Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog description.'),
(7,7,'en','Genrate Image','Generate an image with the [keyword] subject.'),
(8,8,'en','Course SEO Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a course SEO description.'),
(9,9,'en','Blog SEO Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog SEO description.'),
(10,10,'en','Upcoming Course Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for an upcoming course.'),
(11,11,'en','Quiz Question','Generate a question with the [keyword] subject in the [language] language with less than [length] words.'),
(12,12,'en','Generate FAQ','Generate a faq with the [keyword] subject in the [keyword] language.'),
(13,13,'en','Course Requirements','Generate requirements for a course with [keyword] subject in [language].'),
(14,14,'en','Form Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a form description.'),
(15,15,'en','Course Advertising Description','Generate a text with the [keyword] subject in [language] with less than [length] words for a course advertising description.'),
(16,16,'en','\"About Us\" Page Description','Generate a text with the [keyword] subject in [language] with less than [length] words for the \"About Us\" page description.'),
(17,17,'en','Generate Notice','Generate a text with the [keyword] subject in [language] with less than [length] words for notice.'),
(18,18,'en','Store Product Title','Generate a text with the [keyword] subject in [language] language with less than [length] word for a product title.'),
(19,19,'en','Store Product Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a store product description.'),
(20,20,'en','Store Product SEO Description','Generate a text with the [keyword] subject in the [language] language with less than [length] words for a store product  SEO description.');
/*!40000 ALTER TABLE `ai_content_template_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_content_templates`
--

DROP TABLE IF EXISTS `ai_content_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_content_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('text','image') NOT NULL,
  `enable_length` tinyint(1) NOT NULL DEFAULT 0,
  `length` int(10) unsigned DEFAULT NULL,
  `image_size` enum('256','512','1024') DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_content_templates`
--

LOCK TABLES `ai_content_templates` WRITE;
/*!40000 ALTER TABLE `ai_content_templates` DISABLE KEYS */;
INSERT INTO `ai_content_templates` VALUES
(1,'text',1,5,NULL,1,1694939030),
(2,'text',1,40,NULL,1,1694940999),
(3,'text',1,300,NULL,1,1694941070),
(4,'text',1,5,NULL,1,1694941199),
(5,'text',1,100,NULL,1,1694941500),
(6,'text',1,300,NULL,1,1694941560),
(7,'image',0,NULL,'512',1,1694942113),
(8,'text',1,160,NULL,1,1694942972),
(9,'text',1,160,NULL,1,1694970677),
(10,'text',1,300,NULL,1,1694970808),
(11,'text',1,150,NULL,1,1694971282),
(12,'text',0,NULL,NULL,1,1694994114),
(13,'text',0,NULL,NULL,1,1694994456),
(14,'text',1,200,NULL,1,1694994762),
(15,'text',1,200,NULL,1,1694995011),
(16,'text',1,300,NULL,1,1694995299),
(17,'text',1,100,NULL,1,1694995502),
(18,'text',1,5,NULL,1,1695024064),
(19,'text',1,300,NULL,1,1695024166),
(20,'text',1,160,NULL,1,1695024265);
/*!40000 ALTER TABLE `ai_content_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_contents`
--

DROP TABLE IF EXISTS `ai_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `service_type` enum('text','image') NOT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `prompt` text DEFAULT NULL,
  `result` text DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ai_contents_user_id_foreign` (`user_id`),
  KEY `ai_contents_service_id_foreign` (`service_id`),
  CONSTRAINT `ai_contents_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `ai_content_templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ai_contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_contents`
--

LOCK TABLES `ai_contents` WRITE;
/*!40000 ALTER TABLE `ai_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendees_user_id_foreign` (`user_id`),
  KEY `attendees_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `attendees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendees_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendees`
--

LOCK TABLES `attendees` WRITE;
/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
INSERT INTO `attendees` VALUES
(13,1049,2090,'2025-03-08 07:56:39','2025-03-08 07:56:39'),
(14,1051,2098,'2025-05-17 08:26:45','2025-05-17 08:26:45');
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_translations`
--

DROP TABLE IF EXISTS `badge_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `badge_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badge_translations_badge_id_foreign` (`badge_id`),
  KEY `badge_translations_locale_index` (`locale`),
  CONSTRAINT `badge_translations_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_translations`
--

LOCK TABLES `badge_translations` WRITE;
/*!40000 ALTER TABLE `badge_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `type` enum('register_date','course_count','course_rate','sale_count','support_rate','product_sale_count','make_topic','send_post_in_topic','instructor_blog') NOT NULL,
  `condition` varchar(128) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `badges_type_index` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `become_instructors`
--

DROP TABLE IF EXISTS `become_instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `become_instructors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role` enum('teacher','organization') NOT NULL,
  `package_id` int(10) unsigned DEFAULT NULL,
  `rib` varchar(255) DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `become_instructors_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `become_instructors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `become_instructors`
--

LOCK TABLES `become_instructors` WRITE;
/*!40000 ALTER TABLE `become_instructors` DISABLE KEYS */;
INSERT INTO `become_instructors` VALUES
(14,1073,'teacher',NULL,NULL,'/store/1072/EdanM3_I.jpg',NULL,'pending',1742210229),
(15,1050,'teacher',NULL,'/store/1050/offlinePayments/1737475764.png','/store/1050/offlinePayments/1737475764.png','Extra information','accept',1742913446);
/*!40000 ALTER TABLE `become_instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `visit_count` int(10) unsigned DEFAULT 0,
  `enable_comment` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('pending','publish') NOT NULL DEFAULT 'pending',
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `blog_category_id_foreign` (`category_id`) USING BTREE,
  KEY `slug` (`slug`) USING BTREE,
  CONSTRAINT `blog_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category_translations`
--

DROP TABLE IF EXISTS `blog_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_translations_blog_category_id_foreign` (`blog_category_id`),
  KEY `blog_category_translations_locale_index` (`locale`),
  CONSTRAINT `blog_category_translations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category_translations`
--

LOCK TABLES `blog_category_translations` WRITE;
/*!40000 ALTER TABLE `blog_category_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_translations`
--

DROP TABLE IF EXISTS `blog_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `meta_description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_translations_blog_id_locale_unique` (`blog_id`,`locale`),
  KEY `blog_translations_locale_index` (`locale`),
  CONSTRAINT `blog_translations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_translations`
--

LOCK TABLES `blog_translations` WRITE;
/*!40000 ALTER TABLE `blog_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_filter_option`
--

DROP TABLE IF EXISTS `bundle_filter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundle_filter_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_filter_option_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_filter_option_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `bundle_filter_option_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_filter_option`
--

LOCK TABLES `bundle_filter_option` WRITE;
/*!40000 ALTER TABLE `bundle_filter_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_filter_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_translations`
--

DROP TABLE IF EXISTS `bundle_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundle_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_translations_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_translations_locale_index` (`locale`),
  CONSTRAINT `bundle_translations_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_translations`
--

LOCK TABLES `bundle_translations` WRITE;
/*!40000 ALTER TABLE `bundle_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_webinars`
--

DROP TABLE IF EXISTS `bundle_webinars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundle_webinars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `bundle_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_webinars_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_webinars_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `bundle_webinars_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_webinars`
--

LOCK TABLES `bundle_webinars` WRITE;
/*!40000 ALTER TABLE `bundle_webinars` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_webinars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles`
--

DROP TABLE IF EXISTS `bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image_cover` varchar(255) NOT NULL,
  `video_demo` varchar(255) DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link','secure_host') DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `subscribe` tinyint(1) NOT NULL DEFAULT 0,
  `certificate` tinyint(1) NOT NULL DEFAULT 0,
  `access_days` int(10) unsigned DEFAULT NULL COMMENT 'Number of days to access the bundle',
  `message_for_reviewer` text DEFAULT NULL,
  `status` enum('active','pending','is_draft','inactive') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  `updated_at` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundles_creator_id_foreign` (`creator_id`),
  KEY `bundles_teacher_id_foreign` (`teacher_id`),
  KEY `bundles_category_id_foreign` (`category_id`),
  KEY `bundles_slug_index` (`slug`),
  CONSTRAINT `bundles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundles_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles`
--

LOCK TABLES `bundles` WRITE;
/*!40000 ALTER TABLE `bundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_classrooms`
--

DROP TABLE IF EXISTS `calendar_event_classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_classrooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_event_id` bigint(20) unsigned NOT NULL,
  `equipment_id` bigint(20) unsigned NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_event_classrooms_calendar_event_id_foreign` (`calendar_event_id`),
  KEY `calendar_event_classrooms_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `calendar_event_classrooms_calendar_event_id_foreign` FOREIGN KEY (`calendar_event_id`) REFERENCES `calendar_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calendar_event_classrooms_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_classrooms`
--

LOCK TABLES `calendar_event_classrooms` WRITE;
/*!40000 ALTER TABLE `calendar_event_classrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_equipment`
--

DROP TABLE IF EXISTS `calendar_event_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_equipment` (
  `calendar_event_id` bigint(20) unsigned NOT NULL,
  `equipment_id` bigint(20) unsigned NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  KEY `calendar_event_equipment_calendar_event_id_foreign` (`calendar_event_id`),
  KEY `calendar_event_equipment_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `calendar_event_equipment_calendar_event_id_foreign` FOREIGN KEY (`calendar_event_id`) REFERENCES `calendar_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calendar_event_equipment_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_equipment`
--

LOCK TABLES `calendar_event_equipment` WRITE;
/*!40000 ALTER TABLE `calendar_event_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `reserve_meeting_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `gift_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `special_offer_id` int(10) unsigned DEFAULT NULL,
  `product_discount_id` int(10) unsigned DEFAULT NULL,
  `installment_payment_id` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cart_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `cart_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `cart_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `cart_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  KEY `cart_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `cart_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `cart_special_offer_id_foreign` (`special_offer_id`),
  KEY `cart_product_order_id_foreign` (`product_order_id`),
  KEY `cart_product_discount_id_foreign` (`product_discount_id`),
  KEY `cart_bundle_id_foreign` (`bundle_id`),
  KEY `cart_installment_payment_id_foreign` (`installment_payment_id`),
  KEY `cart_gift_id_foreign` (`gift_id`),
  CONSTRAINT `cart_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_installment_payment_id_foreign` FOREIGN KEY (`installment_payment_id`) REFERENCES `installment_order_payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_product_discount_id_foreign` FOREIGN KEY (`product_discount_id`) REFERENCES `product_discounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cart_product_order_id_foreign` FOREIGN KEY (`product_order_id`) REFERENCES `product_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_special_offer_id_foreign` FOREIGN KEY (`special_offer_id`) REFERENCES `special_offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_discount_translations`
--

DROP TABLE IF EXISTS `cart_discount_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_discount_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_discount_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_discount_translations_cart_discount_id_foreign` (`cart_discount_id`),
  KEY `cart_discount_translations_locale_index` (`locale`),
  CONSTRAINT `cart_discount_translations_cart_discount_id_foreign` FOREIGN KEY (`cart_discount_id`) REFERENCES `cart_discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_discount_translations`
--

LOCK TABLES `cart_discount_translations` WRITE;
/*!40000 ALTER TABLE `cart_discount_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_discount_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_discounts`
--

DROP TABLE IF EXISTS `cart_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `show_only_on_empty_cart` tinyint(1) NOT NULL DEFAULT 0,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_discounts_discount_id_foreign` (`discount_id`),
  CONSTRAINT `cart_discounts_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_discounts`
--

LOCK TABLES `cart_discounts` WRITE;
/*!40000 ALTER TABLE `cart_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashback_rule_specification_items`
--

DROP TABLE IF EXISTS `cashback_rule_specification_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashback_rule_specification_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashback_rule_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `instructor_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashback_rule_specification_items_cashback_rule_id_foreign` (`cashback_rule_id`),
  KEY `cashback_rule_specification_items_category_id_foreign` (`category_id`),
  KEY `cashback_rule_specification_items_instructor_id_foreign` (`instructor_id`),
  KEY `cashback_rule_specification_items_seller_id_foreign` (`seller_id`),
  KEY `cashback_rule_specification_items_webinar_id_foreign` (`webinar_id`),
  KEY `cashback_rule_specification_items_product_id_foreign` (`product_id`),
  KEY `cashback_rule_specification_items_bundle_id_foreign` (`bundle_id`),
  KEY `cashback_rule_specification_items_subscribe_id_foreign` (`subscribe_id`),
  KEY `rules_registration_package_id` (`registration_package_id`),
  CONSTRAINT `cashback_rule_specification_items_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_cashback_rule_id_foreign` FOREIGN KEY (`cashback_rule_id`) REFERENCES `cashback_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rules_registration_package_id` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_rule_specification_items`
--

LOCK TABLES `cashback_rule_specification_items` WRITE;
/*!40000 ALTER TABLE `cashback_rule_specification_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashback_rule_specification_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashback_rule_translations`
--

DROP TABLE IF EXISTS `cashback_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashback_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashback_rule_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cashback_rule_translations_cashback_rule_id_foreign` (`cashback_rule_id`),
  KEY `cashback_rule_translations_locale_index` (`locale`),
  CONSTRAINT `cashback_rule_translations_cashback_rule_id_foreign` FOREIGN KEY (`cashback_rule_id`) REFERENCES `cashback_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_rule_translations`
--

LOCK TABLES `cashback_rule_translations` WRITE;
/*!40000 ALTER TABLE `cashback_rule_translations` DISABLE KEYS */;
INSERT INTO `cashback_rule_translations` VALUES
(5,5,'en','Christmas Cashback');
/*!40000 ALTER TABLE `cashback_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashback_rule_users_groups`
--

DROP TABLE IF EXISTS `cashback_rule_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashback_rule_users_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashback_rule_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashback_rule_users_groups_cashback_rule_id_foreign` (`cashback_rule_id`),
  KEY `cashback_rule_users_groups_group_id_foreign` (`group_id`),
  KEY `cashback_rule_users_groups_user_id_foreign` (`user_id`),
  CONSTRAINT `cashback_rule_users_groups_cashback_rule_id_foreign` FOREIGN KEY (`cashback_rule_id`) REFERENCES `cashback_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_rule_users_groups`
--

LOCK TABLES `cashback_rule_users_groups` WRITE;
/*!40000 ALTER TABLE `cashback_rule_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashback_rule_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashback_rules`
--

DROP TABLE IF EXISTS `cashback_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashback_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('all','courses','store_products','bundles','meetings','registration_packages','subscription_packages','recharge_wallet') NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `start_date` bigint(20) unsigned DEFAULT NULL,
  `end_date` bigint(20) unsigned DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `amount_type` enum('fixed_amount','percent') DEFAULT NULL,
  `apply_cashback_per_item` tinyint(1) NOT NULL DEFAULT 0,
  `max_amount` double(15,2) DEFAULT NULL,
  `min_amount` double(15,2) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_rules`
--

LOCK TABLES `cashback_rules` WRITE;
/*!40000 ALTER TABLE `cashback_rules` DISABLE KEYS */;
INSERT INTO `cashback_rules` VALUES
(5,'all',NULL,1672610400,NULL,10.00,'percent',0,NULL,NULL,0,1678921892);
/*!40000 ALTER TABLE `cashback_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `preparation_days` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `image_cover` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(612,'sample-category',NULL,NULL,'/store/1/default_images/categories_icons/anchor.png',NULL,NULL,1),
(613,'EPU',NULL,NULL,NULL,'/store/1/_DSC3532.JPG','/store/1/_DSC3532.JPG',2),
(614,'Master-Class',NULL,NULL,NULL,NULL,NULL,3),
(615,'Sminaire-Pdagogie',NULL,NULL,NULL,NULL,NULL,4),
(616,'Sminaire-Recherche',NULL,NULL,NULL,NULL,NULL,5),
(617,'Sminaire-Simulation',NULL,NULL,NULL,'/store/1/dashboard.png','/store/1/1.jpg',6),
(618,'wait',7,NULL,NULL,'/store/1/MedIn.png','/store/1/dashboard.png',7);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_translations_category_id_foreign` (`category_id`) USING BTREE,
  KEY `category_translations_locale_index` (`locale`) USING BTREE,
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES
(1,612,'en','Sample Category'),
(55,613,'fr','EPU'),
(56,614,'en','Master Class'),
(57,615,'fr','SÃ©minaire|PÃ©dagogie'),
(58,616,'fr','SÃ©minaire|Recherche'),
(59,617,'fr','SÃ©minaire|Simulation'),
(60,613,'en','EPU'),
(61,618,'en','category'),
(62,617,'en','Sminaire|Simulation');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_requests`
--

DROP TABLE IF EXISTS `certificate_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instructor_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `status` enum('waiting','done','reject') NOT NULL,
  `created_at` int(11) NOT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_requests_instructor_id_foreign` (`instructor_id`),
  KEY `certificate_requests_webinar_id_foreign` (`webinar_id`),
  KEY `certificate_requests_list_id_foreign` (`list_id`),
  CONSTRAINT `certificate_requests_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificate_requests_list_id_foreign` FOREIGN KEY (`list_id`) REFERENCES `teacher_webinar_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificate_requests_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_requests`
--

LOCK TABLES `certificate_requests` WRITE;
/*!40000 ALTER TABLE `certificate_requests` DISABLE KEYS */;
INSERT INTO `certificate_requests` VALUES
(7,1071,2098,'done',1747474286,2);
/*!40000 ALTER TABLE `certificate_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_template_translations`
--

DROP TABLE IF EXISTS `certificate_template_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_template_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `certificate_template_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `rtl` tinyint(4) DEFAULT NULL,
  `elements` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_template_id` (`certificate_template_id`),
  KEY `certificate_template_translations_locale_index` (`locale`),
  CONSTRAINT `certificate_template_id` FOREIGN KEY (`certificate_template_id`) REFERENCES `certificates_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_template_translations`
--

LOCK TABLES `certificate_template_translations` WRITE;
/*!40000 ALTER TABLE `certificate_template_translations` DISABLE KEYS */;
INSERT INTO `certificate_template_translations` VALUES
(11,9,'fr','master class','<div class=\"certificate-template-container\" style=\"background-image: url(&quot;http://127.0.0.1:8000/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION-1.png&quot;);\"><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"qr_code\" style=\"top: 439px; left: 367px; text-align: inherit; font-weight: inherit; width: 128px; height: 128px;\">[qr_code]</div><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"instructor_name\" style=\"top: 280px; left: 350px; font-size: 22px; color: rgb(47, 84, 150); text-align: center; font-weight: inherit;\">[instructor_name]</div><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"body\" style=\"top: 325px; left: 559px; font-size: 14px; color: rgb(0, 0, 0); text-align: inherit; font-weight: bold;\">&gt;&gt; Ã  la FacultÃ© de MÃ©decine de Monastir</div><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"course_name\" style=\"top: 326px; left: 387px; font-size: 16px; color: rgb(0, 0, 0); text-align: center; font-weight: bold;\">[course_name]</div><div class=\"draggable-element ui-draggable ui-draggable-handle ui-draggable-dragging\" data-name=\"date\" style=\"top: 368px; left: 405px; color: rgb(0, 0, 0); text-align: right; font-weight: bold;\">[date]</div><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"title\" style=\"top: 326px; left: 114px; font-size: 14px; color: rgb(0, 0, 0); text-align: inherit; font-weight: bold;\">a participÃ© Ã  la Master Class &lt;&lt;</div><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"subtitle\" style=\"top: 369px; left: 342px; font-size: 14px; color: rgb(0, 0, 0); text-align: inherit; font-weight: bold;\">tenue le </div></div>',NULL,'{\"title\":{\"content\":\"a particip\\u00e9 \\u00e0 la Master Class <<\",\"font_size\":\"14\",\"font_color\":\"#000000\",\"styles\":null,\"font_weight_bold\":\"on\",\"enable\":\"on\"},\"subtitle\":{\"content\":\"tenue le\",\"font_size\":\"14\",\"font_color\":\"#000000\",\"styles\":null,\"font_weight_bold\":\"on\",\"enable\":\"on\"},\"body\":{\"content\":\">> \\u00e0 la Facult\\u00e9 de M\\u00e9decine de Monastir\",\"font_size\":\"14\",\"font_color\":\"#000000\",\"styles\":null,\"font_weight_bold\":\"on\",\"enable\":\"on\"},\"date\":{\"display_date\":\"textual\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"font_weight_bold\":\"on\",\"text_right\":\"on\",\"enable\":\"on\",\"content\":\"[date]\"},\"qr_code\":{\"image_size\":\"128\",\"enable\":\"on\",\"content\":\"[qr_code]\"},\"hint\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"student_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[student_name]\"},\"instructor_name\":{\"font_size\":\"22\",\"font_color\":\"#2f5496\",\"styles\":\"Copperplate Gothic Bold\",\"text_center\":\"on\",\"enable\":\"on\",\"content\":\"[instructor_name]\"},\"platform_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[platform_name]\"},\"course_name\":{\"font_size\":\"16\",\"font_color\":\"#000000\",\"styles\":null,\"font_weight_bold\":\"on\",\"text_center\":\"on\",\"enable\":\"on\",\"content\":\"[course_name]\"},\"user_certificate_additional\":{\"content\":\"[user_certificate_additional]\"},\"instructor_signature\":{\"content\":\"[instructor_signature]\"},\"platform_signature\":{\"image\":null,\"image_size\":\"128\"},\"stamp\":{\"image\":null,\"image_size\":\"128\"}}'),
(12,9,'en','master class','<div class=\"certificate-template-container\" style=\"background-image: url(&quot;http://127.0.0.1:8000/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION-1 (1).png&quot;);\"><div class=\"draggable-element ui-draggable ui-draggable-handle ui-draggable-dragging\" data-name=\"body\" style=\"top: 231px; left: 87px; color: rgb(0, 0, 0); text-align: center; font-weight: inherit;\">a participÃ© au Master Class Â« :title Â» tenue le Â« :date Â» Ã  la FacultÃ© de MÃ©decine de Monastir.</div></div>',NULL,'{\"title\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"subtitle\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"body\":{\"content\":\"a particip\\u00e9 au Master Class \\u00ab :title \\u00bb tenue le \\u00ab :date \\u00bb \\u00e0 la Facult\\u00e9 de M\\u00e9decine de Monastir.\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"text_center\":\"on\",\"enable\":\"on\"},\"date\":{\"display_date\":\"textual\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[date]\"},\"qr_code\":{\"image_size\":\"128\",\"content\":\"[qr_code]\"},\"hint\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"student_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[student_name]\"},\"instructor_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[instructor_name]\"},\"platform_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[platform_name]\"},\"course_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[course_name]\"},\"user_certificate_additional\":{\"content\":\"[user_certificate_additional]\"},\"instructor_signature\":{\"content\":\"[instructor_signature]\"},\"platform_signature\":{\"image\":null,\"image_size\":\"128\"},\"stamp\":{\"image\":null,\"image_size\":\"128\"}}'),
(13,10,'en','master class','<div class=\"certificate-template-container\" style=\"background-image: url(&quot;http://127.0.0.1:8000/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION-1 (1).png&quot;);\"><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"qr_code\" style=\"top: 350px; left: 296px; text-align: inherit; font-weight: inherit; width: 128px; height: 128px;\">[qr_code]</div><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"body\" style=\"top: 222px; left: 66px; color: rgb(0, 0, 0); text-align: center; font-weight: inherit;\">a participÃ© au Master Class Â« :title Â» tenue le Â« :date Â» Ã  la FacultÃ© de MÃ©decine de Monastir.</div></div>',NULL,'{\"title\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"subtitle\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"body\":{\"content\":\"a particip\\u00e9 au Master Class \\u00ab :title \\u00bb tenue le \\u00ab :date \\u00bb \\u00e0 la Facult\\u00e9 de M\\u00e9decine de Monastir.\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"text_center\":\"on\",\"enable\":\"on\"},\"date\":{\"display_date\":\"textual\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[date]\"},\"qr_code\":{\"image_size\":\"128\",\"enable\":\"on\",\"content\":\"[qr_code]\"},\"hint\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"student_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[student_name]\"},\"instructor_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[instructor_name]\"},\"platform_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[platform_name]\"},\"course_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[course_name]\"},\"user_certificate_additional\":{\"content\":\"[user_certificate_additional]\"},\"instructor_signature\":{\"content\":\"[instructor_signature]\"},\"platform_signature\":{\"image\":null,\"image_size\":\"128\"},\"stamp\":{\"image\":null,\"image_size\":\"128\"}}'),
(14,11,'en','epu','<div class=\"certificate-template-container\" style=\"background-image: url(&quot;http://127.0.0.1:8000/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION.docx-1.PNG&quot;);\"><div class=\"draggable-element ui-draggable ui-draggable-handle\" data-name=\"body\" style=\"top: 226px; left: 0px; color: rgb(0, 0, 0); text-align: center; font-weight: inherit;\">A prÃ©sentÃ© une confÃ©rence intitulÃ©e Â« :title Â» dans le cadre de lâ€™EPU qui a eu lieu le Â« :date Â» Ã  la FacultÃ© de MÃ©decine de Monastir.</div></div>',NULL,'{\"title\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"subtitle\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"body\":{\"content\":\"A pr\\u00e9sent\\u00e9 une conf\\u00e9rence intitul\\u00e9e \\u00ab :title \\u00bb dans le cadre de l\\u2019EPU qui a eu lieu le \\u00ab :date \\u00bb \\u00e0 la Facult\\u00e9 de M\\u00e9decine de Monastir.\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"text_center\":\"on\",\"enable\":\"on\"},\"date\":{\"display_date\":\"textual\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[date]\"},\"qr_code\":{\"image_size\":\"128\",\"content\":\"[qr_code]\"},\"hint\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"student_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[student_name]\"},\"instructor_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[instructor_name]\"},\"platform_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[platform_name]\"},\"course_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[course_name]\"},\"user_certificate_additional\":{\"content\":\"[user_certificate_additional]\"},\"instructor_signature\":{\"content\":\"[instructor_signature]\"},\"platform_signature\":{\"image\":null,\"image_size\":\"128\"},\"stamp\":{\"image\":null,\"image_size\":\"128\"}}'),
(15,12,'en','simple','<div class=\"certificate-template-container\" style=\"background-image: url(&quot;http://127.0.0.1:8000/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION.docx-1.PNG&quot;);\"></div>',NULL,'{\"title\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"subtitle\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"body\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"date\":{\"display_date\":\"textual\",\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[date]\"},\"qr_code\":{\"image_size\":\"128\",\"content\":\"[qr_code]\"},\"hint\":{\"content\":null,\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null},\"student_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[student_name]\"},\"instructor_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[instructor_name]\"},\"platform_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[platform_name]\"},\"course_name\":{\"font_size\":null,\"font_color\":\"#000000\",\"styles\":null,\"content\":\"[course_name]\"},\"user_certificate_additional\":{\"content\":\"[user_certificate_additional]\"},\"instructor_signature\":{\"content\":\"[instructor_signature]\"},\"platform_signature\":{\"image\":null,\"image_size\":\"128\"},\"stamp\":{\"image\":null,\"image_size\":\"128\"}}');
/*!40000 ALTER TABLE `certificate_template_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned DEFAULT NULL,
  `quiz_result_id` int(10) unsigned DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `user_grade` int(10) unsigned DEFAULT NULL,
  `type` enum('quiz','course','bundle') NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `certificates_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `certificates_quiz_result_id_foreign` (`quiz_result_id`) USING BTREE,
  KEY `certificates_student_id_foreign` (`student_id`) USING BTREE,
  KEY `certificates_webinar_id_foreign` (`webinar_id`),
  KEY `certificates_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `certificates_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_quiz_result_id_foreign` FOREIGN KEY (`quiz_result_id`) REFERENCES `quizzes_results` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES
(22,NULL,NULL,1049,2097,NULL,NULL,'course',1744034777),
(23,NULL,NULL,1071,2097,NULL,NULL,'course',1744034980),
(24,NULL,NULL,1073,2097,NULL,NULL,'course',1744035558),
(25,NULL,NULL,1,2095,NULL,NULL,'course',1745852040),
(26,NULL,NULL,1050,2098,NULL,NULL,'course',1747469033),
(27,NULL,NULL,1051,2098,NULL,NULL,'course',1747474060),
(28,NULL,NULL,1071,2098,NULL,NULL,'course',1747473915);
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_templates`
--

DROP TABLE IF EXISTS `certificates_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('quiz','course','bundle','instructor') DEFAULT NULL,
  `position_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position_y` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `font_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('draft','publish') NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `certificates_templates_category_id_foreign` (`category_id`),
  CONSTRAINT `certificates_templates_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_templates`
--

LOCK TABLES `certificates_templates` WRITE;
/*!40000 ALTER TABLE `certificates_templates` DISABLE KEYS */;
INSERT INTO `certificates_templates` VALUES
(9,614,'/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION-1 (1).png','course',NULL,NULL,NULL,NULL,'publish',1732139152,NULL),
(10,614,'/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION-1 (1).png','quiz',NULL,NULL,NULL,NULL,'draft',1735580558,NULL),
(11,613,'/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION.docx-1.PNG','instructor',NULL,NULL,NULL,NULL,'publish',1735639006,NULL),
(12,612,'/store/1/MODELE ATTESATION MASTER CLASS PARTICIPATION.docx-1.PNG','course',NULL,NULL,NULL,NULL,'draft',1736269238,NULL);
/*!40000 ALTER TABLE `certificates_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `classrooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `review_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `upcoming_course_id` int(10) unsigned DEFAULT NULL,
  `blog_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_review_id` int(10) unsigned DEFAULT NULL,
  `reply_id` int(10) unsigned DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `status` enum('pending','active') NOT NULL,
  `report` tinyint(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `viewed_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `comments_user_id_foreign` (`user_id`) USING BTREE,
  KEY `comments_review_id_foreign` (`review_id`) USING BTREE,
  KEY `comments_reply_id_foreign` (`reply_id`) USING BTREE,
  KEY `comments_product_id_foreign` (`product_id`),
  KEY `comments_bundle_id_foreign` (`bundle_id`),
  KEY `blog_id` (`blog_id`),
  KEY `comments_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `comments_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `webinar_reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_reports`
--

DROP TABLE IF EXISTS `comments_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blog_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_reports_comment_id_foreign` (`comment_id`) USING BTREE,
  KEY `comments_reports_product_id_foreign` (`product_id`),
  CONSTRAINT `comments_reports_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_reports_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_reports`
--

LOCK TABLES `comments_reports` WRITE;
/*!40000 ALTER TABLE `comments_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `reply` text DEFAULT NULL,
  `status` enum('pending','replied') NOT NULL DEFAULT 'pending',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_delete_requests`
--

DROP TABLE IF EXISTS `content_delete_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_delete_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `targetable_id` int(10) unsigned NOT NULL,
  `targetable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_published_date` bigint(20) unsigned DEFAULT NULL,
  `customers_count` int(10) unsigned DEFAULT NULL,
  `sales` decimal(15,2) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_delete_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `content_delete_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_delete_requests`
--

LOCK TABLES `content_delete_requests` WRITE;
/*!40000 ALTER TABLE `content_delete_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_delete_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_forum_answers`
--

DROP TABLE IF EXISTS `course_forum_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_forum_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `resolved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_forum_answers_user_id_foreign` (`user_id`),
  KEY `course_forum_answers_forum_id_foreign` (`forum_id`),
  CONSTRAINT `course_forum_answers_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `course_forums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_forum_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_forum_answers`
--

LOCK TABLES `course_forum_answers` WRITE;
/*!40000 ALTER TABLE `course_forum_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_forum_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_forums`
--

DROP TABLE IF EXISTS `course_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_forums_webinar_id_foreign` (`webinar_id`),
  KEY `course_forums_user_id_foreign` (`user_id`),
  CONSTRAINT `course_forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_forums_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_forums`
--

LOCK TABLES `course_forums` WRITE;
/*!40000 ALTER TABLE `course_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_learning`
--

DROP TABLE IF EXISTS `course_learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_learning` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `text_lesson_id` int(10) unsigned DEFAULT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `session_id` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_learning_user_id_foreign` (`user_id`),
  KEY `course_learning_text_lesson_id_foreign` (`text_lesson_id`),
  KEY `course_learning_file_id_foreign` (`file_id`),
  KEY `course_learning_session_id_foreign` (`session_id`),
  CONSTRAINT `course_learning_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_learning`
--

LOCK TABLES `course_learning` WRITE;
/*!40000 ALTER TABLE `course_learning` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_learning_last_views`
--

DROP TABLE IF EXISTS `course_learning_last_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_learning_last_views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_type` enum('file','session','text_lesson','assignment','quiz') NOT NULL,
  `visited_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_learning_last_views_user_id_foreign` (`user_id`),
  KEY `course_learning_last_views_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `course_learning_last_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_last_views_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_learning_last_views`
--

LOCK TABLES `course_learning_last_views` WRITE;
/*!40000 ALTER TABLE `course_learning_last_views` DISABLE KEYS */;
INSERT INTO `course_learning_last_views` VALUES
(13,1072,2092,97,'file',1741950394),
(14,1073,2095,33,'text_lesson',1742215762);
/*!40000 ALTER TABLE `course_learning_last_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_noticeboard_status`
--

DROP TABLE IF EXISTS `course_noticeboard_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_noticeboard_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `noticeboard_id` int(10) unsigned NOT NULL,
  `seen_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_noticeboard_status_noticeboard_id_foreign` (`noticeboard_id`),
  CONSTRAINT `course_noticeboard_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `course_noticeboards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_noticeboard_status`
--

LOCK TABLES `course_noticeboard_status` WRITE;
/*!40000 ALTER TABLE `course_noticeboard_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_noticeboard_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_noticeboards`
--

DROP TABLE IF EXISTS `course_noticeboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_noticeboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `color` enum('warning','danger','neutral','info','success') NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_noticeboards_creator_id_foreign` (`creator_id`),
  KEY `course_noticeboards_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `course_noticeboards_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_noticeboards_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_noticeboards`
--

LOCK TABLES `course_noticeboards` WRITE;
/*!40000 ALTER TABLE `course_noticeboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_noticeboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_personal_notes`
--

DROP TABLE IF EXISTS `course_personal_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_personal_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `targetable_id` int(10) unsigned NOT NULL,
  `targetable_type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_personal_notes_user_id_foreign` (`user_id`),
  KEY `course_personal_notes_course_id_foreign` (`course_id`),
  CONSTRAINT `course_personal_notes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_personal_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_personal_notes`
--

LOCK TABLES `course_personal_notes` WRITE;
/*!40000 ALTER TABLE `course_personal_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_personal_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) NOT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') NOT NULL,
  `currency_separator` enum('dot','comma') NOT NULL,
  `currency_decimal` int(10) unsigned DEFAULT NULL,
  `exchange_rate` double(15,2) DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delete_account_requests`
--

DROP TABLE IF EXISTS `delete_account_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delete_account_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delete_account_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `delete_account_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delete_account_requests`
--

LOCK TABLES `delete_account_requests` WRITE;
/*!40000 ALTER TABLE `delete_account_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `delete_account_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_bundles`
--

DROP TABLE IF EXISTS `discount_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_bundles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `bundle_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_bundles_discount_id_foreign` (`discount_id`),
  KEY `discount_bundles_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `discount_bundles_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_bundles_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_bundles`
--

LOCK TABLES `discount_bundles` WRITE;
/*!40000 ALTER TABLE `discount_bundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_categories`
--

DROP TABLE IF EXISTS `discount_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_categories_discount_id_foreign` (`discount_id`),
  KEY `discount_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `discount_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_categories_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_categories`
--

LOCK TABLES `discount_categories` WRITE;
/*!40000 ALTER TABLE `discount_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_courses`
--

DROP TABLE IF EXISTS `discount_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_courses_discount_id_foreign` (`discount_id`),
  KEY `discount_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `discount_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_courses_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_courses`
--

LOCK TABLES `discount_courses` WRITE;
/*!40000 ALTER TABLE `discount_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_groups`
--

DROP TABLE IF EXISTS `discount_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_groups_discount_id_foreign` (`discount_id`),
  KEY `discount_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `discount_groups_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_groups`
--

LOCK TABLES `discount_groups` WRITE;
/*!40000 ALTER TABLE `discount_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_users`
--

DROP TABLE IF EXISTS `discount_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `discount_users_discount_id_foreign` (`discount_id`) USING BTREE,
  KEY `discount_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `discount_users_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_users`
--

LOCK TABLES `discount_users` WRITE;
/*!40000 ALTER TABLE `discount_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discount_type` enum('percentage','fixed_amount') NOT NULL,
  `source` enum('all','course','category','meeting','product','bundle') NOT NULL,
  `code` varchar(64) NOT NULL,
  `percent` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `max_amount` int(10) unsigned DEFAULT NULL,
  `minimum_order` int(10) unsigned DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `user_type` enum('all_users','special_users') NOT NULL,
  `product_type` enum('all','physical','virtual') DEFAULT NULL,
  `for_first_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','disable') NOT NULL DEFAULT 'active',
  `expired_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `discounts_code_unique` (`code`),
  KEY `discounts_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_translations`
--

DROP TABLE IF EXISTS `faq_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_translations_faq_id_foreign` (`faq_id`),
  KEY `faq_translations_locale_index` (`locale`),
  CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_translations`
--

LOCK TABLES `faq_translations` WRITE;
/*!40000 ALTER TABLE `faq_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `upcoming_course_id` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `faqs_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `faqs_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `faqs_bundle_id_foreign` (`bundle_id`),
  KEY `faqs_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `faqs_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `upcoming_course_id` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `favorites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `favorites_user_id_foreign` (`user_id`) USING BTREE,
  KEY `favorites_bundle_id_foreign` (`bundle_id`),
  KEY `favorites_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `favorites_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_webinar_translations`
--

DROP TABLE IF EXISTS `feature_webinar_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_webinar_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feature_webinar_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_webinar_translations_feature_webinar_id_foreign` (`feature_webinar_id`),
  KEY `feature_webinar_translations_locale_index` (`locale`),
  CONSTRAINT `feature_webinar_translations_feature_webinar_id_foreign` FOREIGN KEY (`feature_webinar_id`) REFERENCES `feature_webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_webinar_translations`
--

LOCK TABLES `feature_webinar_translations` WRITE;
/*!40000 ALTER TABLE `feature_webinar_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_webinar_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_webinars`
--

DROP TABLE IF EXISTS `feature_webinars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_webinars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `page` enum('categories','home','home_categories') NOT NULL,
  `status` enum('publish','pending') NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `feature_webinars_webinar_id_index` (`webinar_id`) USING BTREE,
  CONSTRAINT `feature_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_webinars`
--

LOCK TABLES `feature_webinars` WRITE;
/*!40000 ALTER TABLE `feature_webinars` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_webinars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_translations`
--

DROP TABLE IF EXISTS `file_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_translations_file_id_foreign` (`file_id`),
  KEY `file_translations_locale_index` (`locale`),
  CONSTRAINT `file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_translations`
--

LOCK TABLES `file_translations` WRITE;
/*!40000 ALTER TABLE `file_translations` DISABLE KEYS */;
INSERT INTO `file_translations` VALUES
(65,96,'en','programme',NULL),
(66,97,'en','clear some concepts','description for the presentation');
/*!40000 ALTER TABLE `file_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `accessibility` enum('free','paid') NOT NULL,
  `downloadable` tinyint(1) DEFAULT 0,
  `storage` enum('upload','youtube','vimeo','external_link','google_drive','dropbox','iframe','s3','upload_archive','secure_host') NOT NULL,
  `file` text NOT NULL,
  `volume` varchar(64) NOT NULL,
  `file_type` varchar(64) NOT NULL,
  `secure_host_upload_type` enum('direct','manual') DEFAULT NULL,
  `interactive_type` enum('adobe_captivate','i_spring','custom') DEFAULT NULL,
  `interactive_file_name` varchar(255) DEFAULT NULL,
  `interactive_file_path` varchar(255) DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `online_viewer` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `files_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `files_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `files_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `files_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(96,1047,2090,73,'free',1,'upload','/store/1047/Circulaire PR2I2025.pdf','0.44','pdf','direct',NULL,NULL,NULL,0,NULL,1,NULL,'active',1741421196,NULL,NULL),
(97,1072,2092,77,'free',1,'upload','/store/1072/20230705-IEEE-qkz0_6da702e2-4539-433f-83a4-d43fa3cea7d5.pdf','0.11','pdf','direct',NULL,NULL,NULL,0,NULL,0,NULL,'active',1741949905,1741950389,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_option_translations`
--

DROP TABLE IF EXISTS `filter_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_option_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_option_translations_filter_option_id_foreign` (`filter_option_id`),
  KEY `filter_option_translations_locale_index` (`locale`),
  CONSTRAINT `filter_option_translations_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_option_translations`
--

LOCK TABLES `filter_option_translations` WRITE;
/*!40000 ALTER TABLE `filter_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_options`
--

DROP TABLE IF EXISTS `filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filter_options_filter_id_foreign` (`filter_id`) USING BTREE,
  CONSTRAINT `filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_options`
--

LOCK TABLES `filter_options` WRITE;
/*!40000 ALTER TABLE `filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_translations`
--

DROP TABLE IF EXISTS `filter_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_translations_filter_id_foreign` (`filter_id`),
  KEY `filter_translations_locale_index` (`locale`),
  CONSTRAINT `filter_translations_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_translations`
--

LOCK TABLES `filter_translations` WRITE;
/*!40000 ALTER TABLE `filter_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filters_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1848 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floating_bar_translations`
--

DROP TABLE IF EXISTS `floating_bar_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `floating_bar_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `floating_bar_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `floating_bar_translations_floating_bar_id_foreign` (`floating_bar_id`),
  KEY `floating_bar_translations_locale_index` (`locale`),
  CONSTRAINT `floating_bar_translations_floating_bar_id_foreign` FOREIGN KEY (`floating_bar_id`) REFERENCES `floating_bars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floating_bar_translations`
--

LOCK TABLES `floating_bar_translations` WRITE;
/*!40000 ALTER TABLE `floating_bar_translations` DISABLE KEYS */;
INSERT INTO `floating_bar_translations` VALUES
(3,2,'en','New Years Day Celebration','Get all courses with 50 to 70% off without any limitation','View Courses');
/*!40000 ALTER TABLE `floating_bar_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floating_bars`
--

DROP TABLE IF EXISTS `floating_bars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `floating_bars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_at` bigint(20) DEFAULT NULL,
  `end_at` bigint(20) DEFAULT NULL,
  `title_color` varchar(255) DEFAULT NULL,
  `description_color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `background_color` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `btn_url` varchar(255) DEFAULT NULL,
  `btn_color` varchar(255) DEFAULT NULL,
  `btn_text_color` varchar(255) DEFAULT NULL,
  `bar_height` int(11) DEFAULT NULL,
  `position` enum('top','bottom') NOT NULL,
  `fixed` tinyint(1) NOT NULL DEFAULT 0,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floating_bars`
--

LOCK TABLES `floating_bars` WRITE;
/*!40000 ALTER TABLE `floating_bars` DISABLE KEYS */;
INSERT INTO `floating_bars` VALUES
(2,1678456800,1755727200,'#2d2d2d','#b3b3b3','/store/1/topnav_icon.svg','#1f3b64','/store/1/topnav_background.jpg','/classes?discount=on','#feb702','#ffffff',70,'top',1,0);
/*!40000 ALTER TABLE `floating_bars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('requested','accepted','rejected') NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `follows_follower_foreign` (`follower`) USING BTREE,
  KEY `follows_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `follows_follower_foreign` FOREIGN KEY (`follower`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES
(20,1051,1051,'accepted');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_option_translations`
--

DROP TABLE IF EXISTS `form_field_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_field_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_field_option_id_trans` (`form_field_option_id`),
  KEY `form_field_option_translations_locale_index` (`locale`),
  CONSTRAINT `form_field_option_id_trans` FOREIGN KEY (`form_field_option_id`) REFERENCES `form_field_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_option_translations`
--

LOCK TABLES `form_field_option_translations` WRITE;
/*!40000 ALTER TABLE `form_field_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_options`
--

DROP TABLE IF EXISTS `form_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_field_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(10) unsigned NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_field_options_form_field_id_foreign` (`form_field_id`),
  CONSTRAINT `form_field_options_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_options`
--

LOCK TABLES `form_field_options` WRITE;
/*!40000 ALTER TABLE `form_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_translations`
--

DROP TABLE IF EXISTS `form_field_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_field_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_field_translations_form_field_id_foreign` (`form_field_id`),
  KEY `form_field_translations_locale_index` (`locale`),
  CONSTRAINT `form_field_translations_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_translations`
--

LOCK TABLES `form_field_translations` WRITE;
/*!40000 ALTER TABLE `form_field_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_fields`
--

DROP TABLE IF EXISTS `form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `type` enum('input','number','upload','date_picker','toggle','textarea','dropdown','checkbox','radio') NOT NULL,
  `order` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `form_fields_form_id_foreign` (`form_id`),
  CONSTRAINT `form_fields_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_fields`
--

LOCK TABLES `form_fields` WRITE;
/*!40000 ALTER TABLE `form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_roles_users_groups`
--

DROP TABLE IF EXISTS `form_roles_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_roles_users_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_roles_users_groups_form_id_foreign` (`form_id`),
  KEY `form_roles_users_groups_role_id_foreign` (`role_id`),
  KEY `form_roles_users_groups_user_id_foreign` (`user_id`),
  KEY `form_roles_users_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `form_roles_users_groups_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_roles_users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_roles_users_groups_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_roles_users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_roles_users_groups`
--

LOCK TABLES `form_roles_users_groups` WRITE;
/*!40000 ALTER TABLE `form_roles_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_roles_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_submission_items`
--

DROP TABLE IF EXISTS `form_submission_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_submission_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int(10) unsigned NOT NULL,
  `form_field_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_submission_items_submission_id_foreign` (`submission_id`),
  KEY `form_submission_items_form_field_id_foreign` (`form_field_id`),
  CONSTRAINT `form_submission_items_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_submission_items_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `form_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_submission_items`
--

LOCK TABLES `form_submission_items` WRITE;
/*!40000 ALTER TABLE `form_submission_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_submission_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_submissions`
--

DROP TABLE IF EXISTS `form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_submissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_submissions_user_id_foreign` (`user_id`),
  KEY `form_submissions_form_id_foreign` (`form_id`),
  CONSTRAINT `form_submissions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_submissions`
--

LOCK TABLES `form_submissions` WRITE;
/*!40000 ALTER TABLE `form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_translations`
--

DROP TABLE IF EXISTS `form_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `heading_title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `welcome_message_title` varchar(255) DEFAULT NULL,
  `welcome_message_description` text DEFAULT NULL,
  `tank_you_message_title` varchar(255) DEFAULT NULL,
  `tank_you_message_description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_translations_form_id_foreign` (`form_id`),
  KEY `form_translations_locale_index` (`locale`),
  CONSTRAINT `form_translations_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_translations`
--

LOCK TABLES `form_translations` WRITE;
/*!40000 ALTER TABLE `form_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `enable_login` tinyint(1) NOT NULL DEFAULT 0,
  `enable_resubmission` tinyint(1) NOT NULL DEFAULT 0,
  `enable_welcome_message` tinyint(1) NOT NULL DEFAULT 0,
  `enable_tank_you_message` tinyint(1) NOT NULL DEFAULT 0,
  `welcome_message_image` varchar(255) DEFAULT NULL,
  `tank_you_message_image` varchar(255) DEFAULT NULL,
  `start_date` bigint(20) unsigned DEFAULT NULL,
  `end_date` bigint(20) unsigned DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forms_url_unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_featured_topics`
--

DROP TABLE IF EXISTS `forum_featured_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_featured_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned NOT NULL,
  `icon` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_featured_topics_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_featured_topics_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_featured_topics`
--

LOCK TABLES `forum_featured_topics` WRITE;
/*!40000 ALTER TABLE `forum_featured_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_featured_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_recommended_topic_items`
--

DROP TABLE IF EXISTS `forum_recommended_topic_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_recommended_topic_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recommended_topic_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_recommended_topic_items_recommended_topic_id_foreign` (`recommended_topic_id`),
  KEY `forum_recommended_topic_items_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_recommended_topic_items_recommended_topic_id_foreign` FOREIGN KEY (`recommended_topic_id`) REFERENCES `forum_recommended_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_recommended_topic_items_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_recommended_topic_items`
--

LOCK TABLES `forum_recommended_topic_items` WRITE;
/*!40000 ALTER TABLE `forum_recommended_topic_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_recommended_topic_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_recommended_topics`
--

DROP TABLE IF EXISTS `forum_recommended_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_recommended_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_recommended_topics`
--

LOCK TABLES `forum_recommended_topics` WRITE;
/*!40000 ALTER TABLE `forum_recommended_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_recommended_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_attachments`
--

DROP TABLE IF EXISTS `forum_topic_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topic_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_attachments_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_attachments_creator_id_foreign` (`creator_id`),
  CONSTRAINT `forum_topic_attachments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_attachments_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_attachments`
--

LOCK TABLES `forum_topic_attachments` WRITE;
/*!40000 ALTER TABLE `forum_topic_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_bookmarks`
--

DROP TABLE IF EXISTS `forum_topic_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topic_bookmarks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_bookmarks_user_id_foreign` (`user_id`),
  KEY `forum_topic_bookmarks_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_topic_bookmarks_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_bookmarks`
--

LOCK TABLES `forum_topic_bookmarks` WRITE;
/*!40000 ALTER TABLE `forum_topic_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_likes`
--

DROP TABLE IF EXISTS `forum_topic_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topic_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `topic_post_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_likes_user_id_foreign` (`user_id`),
  KEY `forum_topic_likes_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_likes_topic_post_id_foreign` (`topic_post_id`),
  CONSTRAINT `forum_topic_likes_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_likes_topic_post_id_foreign` FOREIGN KEY (`topic_post_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_likes`
--

LOCK TABLES `forum_topic_likes` WRITE;
/*!40000 ALTER TABLE `forum_topic_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_posts`
--

DROP TABLE IF EXISTS `forum_topic_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topic_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_posts_user_id_foreign` (`user_id`),
  KEY `forum_topic_posts_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_posts_parent_id_foreign` (`parent_id`),
  CONSTRAINT `forum_topic_posts_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `forum_topic_posts_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_posts`
--

LOCK TABLES `forum_topic_posts` WRITE;
/*!40000 ALTER TABLE `forum_topic_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_reports`
--

DROP TABLE IF EXISTS `forum_topic_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topic_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `topic_post_id` int(10) unsigned DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_reports_user_id_foreign` (`user_id`),
  KEY `forum_topic_reports_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_reports_topic_post_id_foreign` (`topic_post_id`),
  CONSTRAINT `forum_topic_reports_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_reports_topic_post_id_foreign` FOREIGN KEY (`topic_post_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_reports`
--

LOCK TABLES `forum_topic_reports` WRITE;
/*!40000 ALTER TABLE `forum_topic_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topics`
--

DROP TABLE IF EXISTS `forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `forum_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `close` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forum_topics_slug_unique` (`slug`),
  KEY `forum_topics_creator_id_foreign` (`creator_id`),
  KEY `forum_topics_forum_id_foreign` (`forum_id`),
  CONSTRAINT `forum_topics_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topics_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topics`
--

LOCK TABLES `forum_topics` WRITE;
/*!40000 ALTER TABLE `forum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_translations`
--

DROP TABLE IF EXISTS `forum_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_translations_forum_id_foreign` (`forum_id`),
  KEY `forum_translations_locale_index` (`locale`),
  CONSTRAINT `forum_translations_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_translations`
--

LOCK TABLES `forum_translations` WRITE;
/*!40000 ALTER TABLE `forum_translations` DISABLE KEYS */;
INSERT INTO `forum_translations` VALUES
(11,11,'en','forum','heroSectionData heroSectionData heroSectionData heroSectionDataheroSectionData heroSectionData');
/*!40000 ALTER TABLE `forum_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` enum('disabled','active') DEFAULT NULL,
  `close` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forums_slug_unique` (`slug`),
  KEY `forums_role_id_foreign` (`role_id`),
  KEY `forums_group_id_foreign` (`group_id`),
  CONSTRAINT `forums_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forums_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES
(11,'forum',NULL,NULL,NULL,'/store/1/favicon.png','active',0,NULL);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` bigint(20) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for show modal in recipient user panel',
  `status` enum('active','pending','cancel') DEFAULT 'pending',
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gifts_user_id_foreign` (`user_id`),
  KEY `gifts_webinar_id_foreign` (`webinar_id`),
  KEY `gifts_bundle_id_foreign` (`bundle_id`),
  KEY `gifts_product_id_foreign` (`product_id`),
  CONSTRAINT `gifts_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `group_users_group_id_foreign` (`group_id`) USING BTREE,
  KEY `group_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groups_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_registration_packages`
--

DROP TABLE IF EXISTS `groups_registration_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_registration_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `instructors_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `courses_capacity` int(11) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `meeting_count` int(11) DEFAULT NULL,
  `status` enum('disabled','active') NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_registration_packages_group_id_foreign` (`group_id`),
  CONSTRAINT `groups_registration_packages_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_registration_packages`
--

LOCK TABLES `groups_registration_packages` WRITE;
/*!40000 ALTER TABLE `groups_registration_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_registration_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_statistic_translations`
--

DROP TABLE IF EXISTS `home_page_statistic_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_page_statistic_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `home_page_statistic_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_page_statistic_id` (`home_page_statistic_id`),
  KEY `home_page_statistic_translations_locale_index` (`locale`),
  CONSTRAINT `home_page_statistic_id` FOREIGN KEY (`home_page_statistic_id`) REFERENCES `home_page_statistics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_statistic_translations`
--

LOCK TABLES `home_page_statistic_translations` WRITE;
/*!40000 ALTER TABLE `home_page_statistic_translations` DISABLE KEYS */;
INSERT INTO `home_page_statistic_translations` VALUES
(2,2,'en','Skillful Instructors','Start learning from experienced instructors.'),
(3,3,'en','Video Courses','Learn without any geographical & time limitations.'),
(4,4,'en','Live Classes','Improve your skills using live knowledge flow.'),
(5,5,'en','Happy Students','are available to help you by their knowledge');
/*!40000 ALTER TABLE `home_page_statistic_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_statistics`
--

DROP TABLE IF EXISTS `home_page_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_page_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_statistics`
--

LOCK TABLES `home_page_statistics` WRITE;
/*!40000 ALTER TABLE `home_page_statistics` DISABLE KEYS */;
INSERT INTO `home_page_statistics` VALUES
(2,'/store/1/default_images/trend_categories_icons/chess.png','#c95d63',20,1,1675870234),
(3,'/store/1/default_images/trend_categories_icons/palette.png','#496ddb',12,4,1675870276),
(4,'/store/1/default_images/trend_categories_icons/connection.png','#717ec3',16,3,1675870320),
(5,'/store/1/default_images/trend_categories_icons/family.png','#ae8799',78,2,1675870418);
/*!40000 ALTER TABLE `home_page_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_sections`
--

DROP TABLE IF EXISTS `home_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('featured_classes','latest_bundles','latest_classes','best_rates','trend_categories','full_advertising_banner','best_sellers','discount_classes','free_classes','store_products','testimonials','subscribes','find_instructors','reward_program','become_instructor','forum_section','video_or_image_section','instructors','half_advertising_banner','organizations','blog','upcoming_courses') NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_sections_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_sections`
--

LOCK TABLES `home_sections` WRITE;
/*!40000 ALTER TABLE `home_sections` DISABLE KEYS */;
INSERT INTO `home_sections` VALUES
(1,'latest_classes',1),
(32,'become_instructor',2);
/*!40000 ALTER TABLE `home_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_order_attachments`
--

DROP TABLE IF EXISTS `installment_order_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_order_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_order_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_order_id_attachment` (`installment_order_id`),
  CONSTRAINT `installment_order_id_attachment` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_order_attachments`
--

LOCK TABLES `installment_order_attachments` WRITE;
/*!40000 ALTER TABLE `installment_order_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_order_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_order_payments`
--

DROP TABLE IF EXISTS `installment_order_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_order_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_order_id` int(10) unsigned NOT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `type` enum('upfront','step') NOT NULL,
  `selected_installment_step_id` int(10) unsigned DEFAULT NULL,
  `amount` double(15,2) NOT NULL,
  `status` enum('paying','paid','canceled','refunded') NOT NULL DEFAULT 'paying',
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_order_id` (`installment_order_id`),
  KEY `installment_order_payments_sale_id_foreign` (`sale_id`),
  KEY `installment_order_payments_selected_installment_step_id_foreign` (`selected_installment_step_id`),
  CONSTRAINT `installment_order_id` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_order_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_order_payments_selected_installment_step_id_foreign` FOREIGN KEY (`selected_installment_step_id`) REFERENCES `selected_installment_steps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_order_payments`
--

LOCK TABLES `installment_order_payments` WRITE;
/*!40000 ALTER TABLE `installment_order_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_order_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_orders`
--

DROP TABLE IF EXISTS `installment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `item_price` double(15,2) NOT NULL DEFAULT 0.00,
  `status` enum('paying','open','rejected','pending_verification','canceled','refunded') NOT NULL DEFAULT 'paying',
  `created_at` bigint(20) unsigned NOT NULL,
  `refund_at` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_orders_installment_id_foreign` (`installment_id`),
  KEY `installment_orders_user_id_foreign` (`user_id`),
  KEY `installment_orders_webinar_id_foreign` (`webinar_id`),
  KEY `installment_orders_product_id_foreign` (`product_id`),
  KEY `installment_orders_bundle_id_foreign` (`bundle_id`),
  KEY `installment_orders_subscribe_id_foreign` (`subscribe_id`),
  KEY `installment_orders_registration_package_id_foreign` (`registration_package_id`),
  KEY `installment_product_order_id` (`product_order_id`),
  CONSTRAINT `installment_orders_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_registration_package_id_foreign` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_product_order_id` FOREIGN KEY (`product_order_id`) REFERENCES `product_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_orders`
--

LOCK TABLES `installment_orders` WRITE;
/*!40000 ALTER TABLE `installment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_reminders`
--

DROP TABLE IF EXISTS `installment_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `installment_order_id` int(10) unsigned NOT NULL,
  `installment_step_id` int(10) unsigned NOT NULL,
  `type` enum('before_due','due','after_due') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `installment_reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_reminders`
--

LOCK TABLES `installment_reminders` WRITE;
/*!40000 ALTER TABLE `installment_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_specification_items`
--

DROP TABLE IF EXISTS `installment_specification_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_specification_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `instructor_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_specification_items_installment_id_foreign` (`installment_id`),
  KEY `installment_specification_items_category_id_foreign` (`category_id`),
  KEY `installment_specification_items_instructor_id_foreign` (`instructor_id`),
  KEY `installment_specification_items_seller_id_foreign` (`seller_id`),
  KEY `installment_specification_items_webinar_id_foreign` (`webinar_id`),
  KEY `installment_specification_items_product_id_foreign` (`product_id`),
  KEY `installment_specification_items_bundle_id_foreign` (`bundle_id`),
  KEY `installment_specification_items_subscribe_id_foreign` (`subscribe_id`),
  KEY `installment_specification_items_registration_package_id_foreign` (`registration_package_id`),
  CONSTRAINT `installment_specification_items_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_registration_package_id_foreign` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_specification_items`
--

LOCK TABLES `installment_specification_items` WRITE;
/*!40000 ALTER TABLE `installment_specification_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_specification_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_step_translations`
--

DROP TABLE IF EXISTS `installment_step_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_step_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_step_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_step_translations_installment_step_id_foreign` (`installment_step_id`),
  KEY `installment_step_translations_locale_index` (`locale`),
  CONSTRAINT `installment_step_translations_installment_step_id_foreign` FOREIGN KEY (`installment_step_id`) REFERENCES `installment_steps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_step_translations`
--

LOCK TABLES `installment_step_translations` WRITE;
/*!40000 ALTER TABLE `installment_step_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_step_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_steps`
--

DROP TABLE IF EXISTS `installment_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int(10) unsigned NOT NULL,
  `deadline` int(10) unsigned DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `amount_type` enum('fixed_amount','percent') DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_steps_installment_id_foreign` (`installment_id`),
  CONSTRAINT `installment_steps_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_steps`
--

LOCK TABLES `installment_steps` WRITE;
/*!40000 ALTER TABLE `installment_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_translations`
--

DROP TABLE IF EXISTS `installment_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `main_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `verification_description` text DEFAULT NULL,
  `verification_banner` varchar(255) DEFAULT NULL,
  `verification_video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_translations_installment_id_foreign` (`installment_id`),
  KEY `installment_translations_locale_index` (`locale`),
  CONSTRAINT `installment_translations_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_translations`
--

LOCK TABLES `installment_translations` WRITE;
/*!40000 ALTER TABLE `installment_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_user_groups`
--

DROP TABLE IF EXISTS `installment_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installment_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_user_groups_installment_id_foreign` (`installment_id`),
  KEY `installment_user_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `installment_user_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_user_groups_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_user_groups`
--

LOCK TABLES `installment_user_groups` WRITE;
/*!40000 ALTER TABLE `installment_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `installment_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installments`
--

DROP TABLE IF EXISTS `installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('all','courses','store_products','bundles','meetings','registration_packages','subscription_packages') NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `start_date` bigint(20) unsigned DEFAULT NULL,
  `end_date` bigint(20) unsigned DEFAULT NULL,
  `verification` tinyint(1) NOT NULL DEFAULT 0,
  `request_uploads` tinyint(1) NOT NULL DEFAULT 0,
  `bypass_verification_for_verified_users` tinyint(1) NOT NULL DEFAULT 0,
  `upfront` double(15,2) DEFAULT NULL,
  `upfront_type` enum('fixed_amount','percent') DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installments`
--

LOCK TABLES `installments` WRITE;
/*!40000 ALTER TABLE `installments` DISABLE KEYS */;
/*!40000 ALTER TABLE `installments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_restrictions`
--

DROP TABLE IF EXISTS `ip_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_restrictions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('full_ip','ip_range','country') NOT NULL,
  `value` varchar(255) NOT NULL COMMENT 'full ip or ip range or country name',
  `reason` text NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_restrictions`
--

LOCK TABLES `ip_restrictions` WRITE;
/*!40000 ALTER TABLE `ip_restrictions` DISABLE KEYS */;
INSERT INTO `ip_restrictions` VALUES
(1,'full_ip','139.10.13.206','Spammer',1709534805),
(3,'country','CK','Testing Country Restriction',1709534952);
/*!40000 ALTER TABLE `ip_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jazzcash_transactions`
--

DROP TABLE IF EXISTS `jazzcash_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jazzcash_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `txn_ref_no` varchar(255) NOT NULL,
  `order` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Order data fields and values',
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Jazzcash request data fields and values',
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Jazzcash response data fields and values',
  `status` enum('pending','error','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jazzcash_transactions`
--

LOCK TABLES `jazzcash_transactions` WRITE;
/*!40000 ALTER TABLE `jazzcash_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jazzcash_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_times`
--

DROP TABLE IF EXISTS `meeting_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(10) unsigned NOT NULL,
  `meeting_type` enum('all','in_person','online') NOT NULL DEFAULT 'all',
  `day_label` enum('saturday','sunday','monday','tuesday','wednesday','thursday','friday') NOT NULL,
  `time` varchar(64) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `meeting_times_meeting_id_foreign` (`meeting_id`) USING BTREE,
  CONSTRAINT `meeting_times_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_times`
--

LOCK TABLES `meeting_times` WRITE;
/*!40000 ALTER TABLE `meeting_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `amount` double(15,2) unsigned DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `in_person` tinyint(1) NOT NULL DEFAULT 0,
  `in_person_amount` double(15,2) DEFAULT NULL,
  `group_meeting` tinyint(1) NOT NULL DEFAULT 0,
  `online_group_min_student` int(11) DEFAULT NULL,
  `online_group_max_student` int(11) DEFAULT NULL,
  `online_group_amount` double(15,2) DEFAULT NULL,
  `in_person_group_min_student` int(11) DEFAULT NULL,
  `in_person_group_max_student` int(11) DEFAULT NULL,
  `in_person_group_amount` double(15,2) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `meetings_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `meetings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2020_08_09_145553_create_roles_table',1),
(4,'2020_08_09_145834_create_sections_table',1),
(5,'2020_08_09_145926_create_permissions_table',1),
(6,'2020_08_24_163003_create_webinars_table',1),
(7,'2020_08_24_164823_create_webinar_partner_teacher_table',1),
(8,'2020_08_24_165658_create_tags_table',1),
(9,'2020_08_24_165835_create_webinar_tag_table',1),
(10,'2020_08_24_171611_create_categories_table',1),
(11,'2020_08_29_052437_create_filters_table',1),
(12,'2020_08_29_052900_create_filter_options_table',1),
(13,'2020_08_29_054455_add_category_id_in_webinar_table',1),
(14,'2020_09_01_174741_add_seo_description_and_start_end_time_in_webinar_table',1),
(15,'2020_09_02_180508_create_webinar_filter_option_table',1),
(16,'2020_09_02_193923_create_tickets_table',1),
(17,'2020_09_02_210447_create_sessions_table',1),
(18,'2020_09_02_212642_create_files_table',1),
(19,'2020_09_03_175543_create_faqs_table',1),
(20,'2020_09_08_175539_delete_webinar_tag_and_update_tag_table',1),
(21,'2020_09_09_154522_create_quizzes_table',1),
(22,'2020_09_09_174646_create_quizzes_questions_table',1),
(23,'2020_09_09_182726_create_quizzes_questions_answers_table',1),
(24,'2020_09_14_160028_create_prerequisites_table',1),
(25,'2020_09_14_183235_nullable_item_id_in_quizzes_table',1),
(26,'2020_09_14_190110_create_webinar_quizzes_table',1),
(27,'2020_09_16_163835_create_quizzes_results_table',1),
(28,'2020_09_24_102115_add_total_mark_in_quize_table',1),
(29,'2020_09_24_132242_create_comment_table',1),
(30,'2020_09_24_132639_create_favorites_table',1),
(31,'2020_09_26_181200_create_certificate_table',1),
(32,'2020_09_26_181444_create_certificates_templates_table',1),
(33,'2020_09_30_170451_add_slug_in_webinars_table',1),
(34,'2020_09_30_191202_create_purchases_table',1),
(35,'2020_10_02_063828_create_rating_table',1),
(36,'2020_10_02_094723_edit_table_and_add_foreign_key',1),
(37,'2020_10_08_055408_add_reviwes_table',1),
(38,'2020_10_08_084100_edit_status_comments_table',1),
(39,'2020_10_08_121041_create_meetings_table',2),
(40,'2020_10_08_121621_create_meeting_times_table',2),
(41,'2020_10_08_121848_create_meeting_requests_table',2),
(42,'2020_10_15_172913_add_about_and_head_line_in_users_table',2),
(43,'2020_10_15_173645_create_follow_table',2),
(46,'2020_10_17_100606_create_badges_table',3),
(47,'2020_10_08_121848_create_reserve_meetings_table',4),
(48,'2020_10_20_193013_update_users_table',5),
(50,'2020_10_18_220323_convert_creatore_user_id_to_creator_id',7),
(51,'2020_10_22_153502_create_cart_table',7),
(52,'2020_10_22_154636_create_orders_table',7),
(53,'2020_10_22_155930_create_order_items_table',7),
(54,'2020_10_23_204203_create_sales_table',7),
(55,'2020_10_23_211459_create_accounting_table',7),
(56,'2020_10_23_213515_create_discounts_table',7),
(57,'2020_10_23_213934_create_discount_users_table',7),
(58,'2020_10_23_235444_create_ticket_users_table',7),
(59,'2020_10_25_172331_create_groups_table',7),
(60,'2020_10_25_172523_create_group_users_table',7),
(62,'2020_11_02_202754_edit_email_in_users_table',8),
(63,'2020_11_03_200314_edit_some_tables',9),
(64,'2020_11_06_193300_create_settings_table',10),
(67,'2020_11_09_202533_create_feature_webinars_table',11),
(68,'2020_11_10_193459_edit_webinars_table',12),
(69,'2020_11_11_203344_create_trend_categories_table',13),
(72,'2020_11_11_222833_create_blog_categories_table',14),
(75,'2020_11_11_231204_create_blog_table',15),
(76,'2020_10_25_223247_add_sub_title_tickets_table',16),
(77,'2020_10_28_001340_add_count_in_discount_users_table',16),
(78,'2020_10_28_221509_create_payment_channels_table',16),
(79,'2020_11_01_120909_change_class_name_enum_payment_channels_table',16),
(80,'2020_11_07_233948_add_some_raw_in_order_items__table',16),
(81,'2020_11_10_061350_add_discount_id_in_order_items_table',16),
(82,'2020_11_10_071651_decimal_orders_order_items_sales_table',16),
(83,'2020_11_11_193138_change_reference_id_type_in_orders_tabel',16),
(84,'2020_11_11_222413_change_meeting_id_to_meeting_time_id_in_order_items_table',16),
(85,'2020_11_11_225421_add_locked_at_and_reserved_at_and_change_request_time_to_day_in_reserve_meetings_table',17),
(86,'2020_11_12_000116_add_type_in_orders_table',17),
(87,'2020_11_12_001912_change_meeting_id_to_meeting_time_id_in_accounting_table',17),
(88,'2020_11_12_133009_decimal_paid_amount_in_reserve_meetings_table',17),
(91,'2020_11_12_170109_add_blog_id_to_comments_table',18),
(98,'2020_11_14_201228_add_bio_and_ban_to_users_table',20),
(99,'2020_11_14_224447_create_users_badges_table',21),
(100,'2020_11_14_233319_create_payout_request_table',22),
(101,'2020_11_15_010622_change_byer_id_and_add_seller_id_in_sales_table',22),
(102,'2020_11_16_195009_create_supports_table',22),
(103,'2020_11_16_201814_create_support_departments_table',22),
(107,'2020_11_16_202254_create_supports_table',23),
(109,'2020_11_17_192744_create_support_conversations_table',24),
(110,'2020_11_17_072348_create_offline_payments_table',25),
(111,'2020_11_19_191943_add_replied_status_to_comments_table',25),
(114,'2020_11_20_215748_create_subscribes_table',26),
(115,'2020_11_21_185519_create_notification_templates_table',27),
(116,'2020_11_22_210832_create_promotions_table',28),
(118,'2020_11_23_194153_add_status_column_to_discounts_table',29),
(119,'2020_11_23_213532_create_users_occupations_table',30),
(120,'2020_11_30_220855_change_amount_in_payouts_table',31),
(121,'2020_11_30_231334_add_pay_date_in_offline_payments_table',31),
(122,'2020_11_30_233018_add_charge_enum_in_type_in_orders_table',31),
(123,'2020_12_01_193948_create_testimonials_table',32),
(124,'2020_12_02_202043_edit_and_add_types_to_webinars_table',33),
(128,'2020_12_04_204048_add_column_creator_id_to_some_tables',34),
(129,'2020_12_05_205320_create_text_lessons_table',35),
(130,'2020_12_05_210052_create_text_lessons_attachments_table',36),
(131,'2020_12_06_215701_add_order_column_to_webinar_items_tables',37),
(132,'2020_12_11_114844_add_column_storage_to_files_table',38),
(133,'2020_12_07_211009_add_subscribe_id_in_order_items_table',39),
(134,'2020_12_07_211657_nullable_payment_method_in_orders_table',39),
(135,'2020_12_07_212306_add_subscribe_enum__type_in_orders_table',39),
(136,'2020_12_07_223237_changes_in_sales_table',39),
(137,'2020_12_07_224925_add_subscribe_id_in_accounting_table',39),
(138,'2020_12_07_230200_create_subscribe_uses_table',39),
(139,'2020_12_11_123209_add_subscribe_type_account_in_accounting_table',39),
(140,'2020_12_11_132819_add_sale_id_in_subscribe_use_in_subscribe_uses_table',39),
(141,'2020_12_11_135824_add_subscribe_payment_method_in_sales_table',39),
(143,'2020_12_13_205751_create_advertising_banners_table',41),
(145,'2020_12_14_204251_create_become_instructors_table',42),
(146,'2020_11_12_232207_create_reports_table',43),
(147,'2020_11_12_232207_create_comments_reports_table',44),
(148,'2020_12_17_210822_create_webinar_reports_table',45),
(150,'2020_12_18_181551_create_notifications_table',46),
(151,'2020_12_18_195833_create_notifications_status_table',47),
(152,'2020_12_19_195152_add_status_column_to_payment_channels_table',48),
(154,'2020_12_20_231434_create_contacts_table',49),
(155,'2020_12_21_210345_edit_quizzes_table',50),
(156,'2020_12_24_221715_add_column_to_users_table',50),
(157,'2020_12_24_084728_create_special_offers_table',51),
(158,'2020_12_25_204545_add_promotion_enum_type_in_orders_table',51),
(159,'2020_12_25_205139_add_promotion_id_in_order_items_table',51),
(160,'2020_12_25_205811_add_promotion_id_in_accounting_table',51),
(161,'2020_12_25_210341_add_promotion_id_in_sales_table',51),
(162,'2020_12_25_212453_add_promotion_type_account_enum_in_accounting_table',51),
(163,'2020_12_25_231005_add_promotion_type_enum_in_sales_table',51),
(166,'2020_12_29_192943_add_column_reply_to_contacts_table',53),
(167,'2020_12_30_225001_create_payu_transactions_table',54),
(168,'2021_01_06_202649_edit_column_password_from_users_table',55),
(169,'2021_01_08_134022_add_api_column_to_sessions_table',56),
(170,'2021_01_10_215540_add_column_store_type_to_accounting',57),
(173,'2021_01_13_214145_edit_carts_table',58),
(174,'2021_01_13_230725_delete_column_type_from_orders_table',59),
(175,'2021_01_20_214653_add_discount_column_to_reserve_meetings_table',60),
(177,'2021_01_27_193915_add_foreign_key_to_support_conversations_table',61),
(178,'2021_02_02_203821_add_viewed_at_column_to_comments_table',62),
(180,'2021_02_12_134504_add_financial_approval_column_to_users_table',64),
(181,'2021_02_12_131916_create_verifications_table',65),
(182,'2021_02_15_221518_add_certificate_to_users_table',66),
(183,'2021_02_16_194103_add_cloumn_private_to_webinars_table',66),
(184,'2021_02_18_213601_edit_rates_column_webinar_reviews_table',67),
(188,'2021_02_27_212131_create_noticeboards_table',68),
(189,'2021_02_27_213940_create_noticeboards_status_table',68),
(191,'2021_02_28_195025_edit_groups_table',69),
(192,'2021_03_06_205221_create_newsletters_table',70),
(193,'2021_03_12_105526_add_is_main_column_to_roles_table',71),
(194,'2021_03_12_202441_add_description_column_to_feature_webinars_table',72),
(195,'2021_03_18_130248_edit_status_column_from_supports_table',73),
(196,'2021_03_19_113306_add_column_order_to_categories_table',74),
(197,'2021_03_19_115939_add_column_order_to_filter_options_table',75),
(199,'2021_03_24_100005_edit_discounts_table',76),
(200,'2021_03_27_204551_create_sales_status_table',77),
(202,'2021_03_28_182558_add_column_page_to_settings_table',78),
(206,'2021_03_31_195835_add_new_status_in_reserve_meetings_table',79),
(207,'2020_12_12_204705_create_course_learning_table',80),
(208,'2021_04_19_195452_add_meta_description_column_to_blog_table',81),
(209,'2021_04_21_200131_add_icon_column_to_categories_table',82),
(210,'2021_04_21_203746_add_is_popular_column_to_subscribes_table',83),
(211,'2021_04_25_203955_add_is_charge_account_column_to_order_items',84),
(212,'2021_04_25_203955_add_is_charge_account_column_to_orders',85),
(213,'2021_05_13_111720_add_moderator_secret_column_to_sessions_table',86),
(214,'2021_05_13_123920_add_zoom_id_column_to_sessions_table',87),
(215,'2021_05_14_182848_create_session_reminds_table',88),
(217,'2021_05_25_193743_create_users_zoom_api_table',89),
(218,'2021_05_25_205716_add_new_column_to_sessions_table',90),
(219,'2021_05_27_095128_add_user_id_to_newsletters_table',91),
(220,'2020_12_27_192459_create_pages_table',92),
(221,'2021_07_03_222439_add_special_offer_id_to_cart_table',93),
(222,'2021_09_02_101422_add_payment_data_to_orders_table',94),
(223,'2021_09_02_110519_add_sender_id_to_notifications_table',95),
(224,'2021_09_06_113524_create_webinar_chapters_table',96),
(228,'2021_09_06_114459_add_chapter_id_to_files_table',97),
(229,'2021_09_06_114532_add_chapter_id_to_text_lessons_table',97),
(230,'2021_09_06_114547_add_chapter_id_to_sessions_table',97),
(231,'2021_09_13_134659_add_chapter_id_to_quizzes_table',98),
(234,'2021_09_14_122505_create_affiliates_table',100),
(235,'2021_09_14_122117_create_affiliates_codes_table',101),
(239,'2021_09_14_142927_add_affiliate_column_to_users_table',105),
(241,'2021_09_14_142302_add_affiliate_column_to_accounting_table',106),
(244,'2021_09_18_155914_create_blog_translations_table',107),
(246,'2021_09_19_190400_create_page_translations_table',108),
(248,'2021_09_19_203526_create_setting_translations_table',109),
(250,'2021_09_20_140241_create_advertising_banners_translations_table',110),
(252,'2021_09_20_175518_create_category_translations_table',111),
(255,'2021_09_20_184724_create_filter_translations_table',112),
(256,'2021_09_20_185132_create_filter_option_translations_table',112),
(258,'2021_09_21_160650_create_subscribe_translations_table',113),
(260,'2021_09_21_162922_create_promotion_translations_table',114),
(262,'2021_09_21_164954_create_testimonial_translations_table',115),
(264,'2021_09_21_182251_create_feature_webinar_translations_table',116),
(266,'2021_09_21_184239_create_certificate_template_translations_table',117),
(268,'2021_09_21_195731_create_support_department_translations_table',118),
(270,'2021_09_21_201512_create_badge_translations_table',119),
(272,'2021_09_22_120723_create_webinar_translations_table',120),
(274,'2021_09_22_135518_create_ticket_translations_table',121),
(276,'2021_09_22_144342_create_webinar_chapter_translations_table',122),
(278,'2021_09_22_162502_create_session_translations_table',123),
(280,'2021_09_22_172309_create_file_translations_table',124),
(282,'2021_09_22_173500_create_faq_translations_table',125),
(284,'2021_09_23_094903_create_text_lesson_translations_table',126),
(286,'2021_09_27_194537_create_quiz_translations_table',127),
(288,'2021_09_28_112529_create_quiz_question_translations_table',128),
(290,'2021_09_28_122513_create_quizzes_questions_answer_translations_table',129),
(291,'2021_12_03_103010_add_agora_session_api_to_sessions_table',130),
(292,'2021_12_03_103558_add_agora_to_sessions_table',131),
(293,'2021_12_03_114009_create_agora_history_table',132),
(295,'2021_12_04_183524_create_regions_table',133),
(298,'2021_12_25_151304_add_new_column_to_meetings_table',135),
(299,'2021_12_26_142304_add_new_column_to_meeting_times_table',136),
(302,'2022_01_01_162247_add_new_column_to_reserve_meetings_table',137),
(305,'2022_01_02_142927_create_rewards_table',138),
(307,'2022_01_03_153517_create_rewards_accounting_table',139),
(308,'2022_01_04_161756_add_score_column_to_badges_table',140),
(309,'2022_01_04_165147_add_points_column_to_webinars_table',141),
(312,'2022_01_08_154504_edit_storage_column_and_add_new_value_to_files_table',142),
(313,'2022_01_11_162839_add_timezone_column_to_users_table',143),
(314,'2022_01_12_142238_add_timezone_column_to_webinars_table',144),
(315,'2022_01_15_131828_create_registration_packages_table',145),
(319,'2022_01_15_203133_edit_columns_in_accounting_table',146),
(320,'2022_01_16_102825_edit_columns_in_order_items_table',147),
(321,'2022_01_17_152605_add_registration_package_id_to_sales_table',148),
(322,'2022_01_18_103414_create_users_registration_packages_table',149),
(323,'2022_01_18_113331_create_groups_registration_packages_table',150),
(325,'2022_01_20_110119_add_become_instructor_id_column_to_order_items_table',152),
(326,'2022_01_18_160228_add_column_role_to_become_instructors_table',153),
(327,'2022_01_26_080434_add_reserve_date_columns_to_reserve_meetings_table',154),
(328,'2022_01_28_094259_edit_column_in_discounts_table',155),
(329,'2022_01_28_094515_create_discount_courses_table',155),
(330,'2022_01_28_094527_create_discount_groups_table',155),
(331,'2022_01_31_093231_add_column_description_to_meeting_times_table',156),
(332,'2022_01_31_093306_add_column_description_to_reserve_meetings_table',156),
(334,'2022_02_01_092922_create_newsletters_history_table',157),
(335,'2022_02_01_104529_create_discount_categories_table',158),
(337,'2022_02_02_092820_add_attachment_column_to_offline_payments_table',159),
(339,'2022_02_02_184235_add_column_video_demo_source_to_webinars_table',160),
(340,'2021_12_05_193333_add_new_column_to_users_table',161),
(341,'2022_02_27_072819_add_forign_key_for_region_to_users_table',162),
(347,'2022_03_05_123830_create_product_categories_table',163),
(348,'2022_03_05_125138_create_product_filters_table',163),
(350,'2022_03_06_091528_create_product_filter_options_table',163),
(351,'2022_03_07_081257_create_product_specifications_table',164),
(353,'2022_03_07_081808_create_product_specification_categories_table',165),
(357,'2022_03_05_125434_create_products_table',166),
(358,'2022_03_07_093128_create_product_discounts_table',166),
(362,'2022_03_08_101832_create_product_media_table',167),
(363,'2022_03_09_054031_create_product_selected_filter_options_table',168),
(364,'2022_03_09_083337_create_product_specification_meta_table',169),
(369,'2022_03_09_084108_create_product_selected_specifications_table',170),
(370,'2022_03_09_140558_create_product_faqs_table',171),
(374,'2022_03_11_180436_create_product_reviews_table',174),
(375,'2022_03_11_182715_add_product_id_to_comments_reports_table',175),
(376,'2022_03_08_094452_create_product_files_table',176),
(377,'2022_03_11_180746_add_product_id_to_comments_table',177),
(378,'2022_03_12_102233_add_new_position_to_advertising_banners_table',178),
(383,'2022_03_13_072108_add_product_id_to_sales_table',179),
(385,'2022_03_13_081212_create_product_orders_table',180),
(386,'2022_03_19_171559_create_product_selected_specification_translations_table',181),
(387,'2022_03_21_161055_add_create_store_column_to_users_table',182),
(388,'2022_03_26_065509_add_new_type_to_rewards_table',183),
(389,'2022_03_28_051949_add_product_count_column_to_registration_packages_table',184),
(391,'2022_03_28_054322_add_product_type_column_to_discounts_table',185),
(392,'2022_03_28_062248_edit_type_column_of_rewards_accounting_table',186),
(393,'2022_03_28_083906_edit_type_column_to_badges_table',187),
(394,'2022_04_02_051515_create_webinar_chapter_items_table',188),
(395,'2022_04_02_085059_remove_type_column_from_webinar_chapters_table',189),
(396,'2022_04_02_131352_add_check_sequence_content_fields_to_contents_tables',190),
(399,'2022_04_04_075541_add_assignment_type_to_webinar_chapter_items_table',192),
(400,'2022_04_04_071203_create_webinar_assignments_table',193),
(401,'2022_04_04_071303_create_webinar_assignment_attachments_table',193),
(405,'2022_04_05_053308_create_webinar_assignment_history_table',194),
(406,'2022_04_05_060030_create_webinar_assignment_history_messages_table',194),
(407,'2022_04_06_121240_add_new_type_passed_assignment_to_rewards_table',195),
(408,'2022_04_09_064609_add_access_content_column_to_users_table',196),
(409,'2022_04_10_073822_create_bundles_table',197),
(410,'2022_04_10_092348_create_bundle_filter_option_table',198),
(413,'2022_04_10_130733_create_bundle_webinars_table',200),
(421,'2022_04_10_093457_add_bundle_id_to_needle_tables',201),
(422,'2022_04_12_153052_add_access_time_to_webinars_table',202),
(423,'2022_04_13_053947_create_course_noticeboards_table',203),
(424,'2022_04_13_054536_create_course_noticeboard_status_table',203),
(425,'2022_04_13_130155_add_column_forum_to_webinars_table',204),
(427,'2022_04_14_060606_create_course_forums_table',205),
(428,'2022_04_14_063316_create_course_forum_answers_table',206),
(447,'2022_04_21_133513_add_new_type_in_rewards_table',216),
(448,'2022_04_21_135212_add_new_type_in_badges_table',217),
(449,'2022_04_24_081637_add_new_type_instructor_blog_in_rewards_table',218),
(450,'2022_04_24_082515_add_new_type_instructor_blog_in_badges_table',219),
(452,'2022_04_25_043945_create_users_cookie_security_table',220),
(453,'2022_04_25_143142_add_organization_price__column_to_webinars_table',221),
(454,'2022_04_25_165256_add_image_and_video_to_quizzes_questions_table',222),
(456,'2022_04_26_060018_edit_certificates_templates_table',223),
(458,'2022_04_26_082017_edit_certificates_table',224),
(459,'2022_04_26_155421_create_subscribe_reminds_table',225),
(460,'2022_04_26_163428_add_instructor_id_to_noticeboards_table',226),
(461,'2022_04_27_133655_add_unlimited_download_to_subscribes_table',227),
(462,'2022_04_27_133655_add_infinite_use_to_subscribes_table',228),
(463,'2022_04_27_140844_add_extra_time_to_join_to_sessions_table',229),
(464,'2022_04_28_052318_create_webinar_extra_description_table',230),
(466,'2022_05_09_125820_create_navbar_buttons_table',232),
(467,'2021_06_07_000000_create_payku_transactions_table',233),
(468,'2021_06_07_000001_create_payku_payments_table',233),
(469,'2021_11_30_122831_create_jazzcash_transactions_table',233),
(470,'2021_12_15_000000_add_new_columns_to_tables',233),
(471,'2022_05_23_081324_create_product_specification_multi_values_table',234),
(472,'2022_05_23_091527_create_product_selected_specification_multi_values_table',235),
(475,'2022_05_23_151601_add_product_delivery_fee_column_to_sales_table',236),
(476,'2022_04_18_103856_create_forums_table',237),
(477,'2022_04_18_152201_create_forum_topics_table',237),
(478,'2022_04_18_152845_create_forum_topic_attachments_table',237),
(479,'2022_04_19_071911_create_forum_topic_posts_table',237),
(480,'2022_04_19_123745_create_forum_topic_reports_table',237),
(481,'2022_04_19_135314_create_forum_topic_bookmarks_table',237),
(482,'2022_04_19_152929_create_forum_topic_likes_table',237),
(483,'2022_04_20_152756_create_forum_featured_topics_table',237),
(484,'2022_04_21_054043_create_forum_recommended_topics_table',237),
(485,'2022_04_21_054815_create_forum_recommended_topic_items_table',237),
(486,'2022_05_26_085212_change_some_column_varchar_to_text',238),
(487,'2022_05_27_142612_add_avarat_settings_to_users_table',239),
(489,'2022_05_01_151107_add_manual_added_column_to_sales_table',240),
(490,'2022_05_29_162315_create_delete_account_requests_table',241),
(491,'2020_10_20_211927_create_users_metas_table',242),
(492,'2022_05_31_133347_add_certificate_column_to_webinars_table',243),
(494,'2022_05_31_165839_add_online_viewer_column_to_files_table',244),
(495,'2022_06_08_071712_create_home_sections_table',245),
(496,'2022_10_14_074434_add_reserve_meeting_id_to_sessions_table',246),
(497,'2022_12_25_082946_add_logged_count_column_to_users_table',247),
(498,'2022_12_26_064214_add_new_column_to_quizzes_table',247),
(499,'2022_12_27_064800_add_column_url_to_categories_table',247),
(500,'2023_01_02_085731_create_upcoming_courses_table',248),
(501,'2023_01_09_065436_create_installments_table',249),
(502,'2023_01_14_144421_create_installment_orders_table',250),
(503,'2023_01_18_064141_create_floating_bars_table',251),
(504,'2023_01_18_145605_create_cashback_rules_table',252),
(505,'2023_01_21_075422_add_column_to_accounting_table',253),
(506,'2023_01_24_141128_create_currencies_table',254),
(507,'2023_01_25_090622_add_currency_column_to_users',254),
(508,'2023_01_25_104531_edit_price_column_tables',254),
(509,'2023_01_25_145647_add_column_to_payment_channels_table',254),
(510,'2023_01_29_074044_create_installment_reminders_table',255),
(511,'2023_02_06_135446_add_new_columns_to_special_offers_table',256),
(512,'2023_02_07_141617_create_discount_bundles_table',257),
(513,'2023_02_07_152101_add_new_columns_to_users_zoom_api_table',258),
(514,'2023_02_08_140023_create_home_page_statistics_table',259),
(515,'2023_02_11_135759_add_enable_waitlist_column_to_webinars_table',260),
(516,'2023_02_11_144743_create_waitlists_table',261),
(518,'2023_02_13_134648_create_offline_banks_table',262),
(520,'2023_02_14_144003_create_user_banks_table',263),
(523,'2023_02_15_140227_create_test_table',264),
(524,'2023_02_15_151458_add_new_storage_to_files_table',265),
(528,'2023_02_20_141047_create_gifts_table',266),
(529,'2023_02_27_065823_add_enable_registration_bonus_to_users_table',267),
(530,'2023_03_05_075231_add_installment_order_id_to_accounting_table',267),
(531,'2023_03_08_095345_edit_payouts_table',268),
(532,'2023_03_10_143238_edit_column_in_quizzes_table',269),
(533,'2023_03_12_110714_edit_column_in_order_items_table',270),
(534,'2023_03_13_120634_edit_price_column_in_promotions_table',271),
(535,'2023_03_13_135747_add_price_column_to_installment_orders_table',271),
(536,'2023_05_02_150757_create_selected_installments_table',272),
(537,'2023_06_09_072812_create_forms_table',273),
(538,'2023_06_09_084907_create_form_fields_table',273),
(539,'2023_06_11_123736_create_form_submissions_table',273),
(540,'2023_06_13_115235_create_user_form_fields_table',273),
(541,'2019_08_19_000000_create_failed_jobs_table',274),
(542,'2019_12_14_000001_create_personal_access_tokens_table',274),
(543,'2023_08_13_145531_create_ai_content_templates_table',274),
(544,'2023_08_17_065609_create_ai_contents_table',274),
(545,'2023_09_12_102852_add_ai_content_limitation_column_to_users_table',275),
(546,'2023_09_12_103623_add_ai_content_access_column_to_registration_packages_table',275),
(547,'2023_08_22_141556_add_sales_count_column_to_webinars_table',276),
(548,'2023_08_27_144854_create_related_courses_table',276),
(549,'2023_09_02_152318_create_purchase_notifications_table',276),
(550,'2023_09_13_164842_create_course_personal_notes_table',276),
(551,'2023_09_18_172303_create_content_delete_requests_table',276),
(552,'2023_09_19_155014_create_user_logs_table',276),
(553,'2023_09_23_141534_create_ip_restrictions_table',276),
(554,'2023_09_25_142632_create_product_badges_table',276),
(555,'2023_09_30_141640_create_cart_discounts_table',276),
(556,'2023_10_01_144952_create_abandoned_cart_rules_table',276),
(557,'2023_10_17_154000_edit_files_table',276),
(558,'2023_10_18_160122_create_blog_category_translations_table',276),
(559,'2023_10_19_151449_edit_sections_table',276),
(560,'2023_11_21_135049_create_course_learning_last_view_table',276),
(561,'2023_12_24_124451_edit_certificate_template_translations_table',276),
(562,'2023_12_24_124532_edit_certificate_template_translations_table',276),
(563,'2024_02_04_142556_create_abandoned_cart_rule_users_groups_table',276),
(564,'2024_02_04_143742_create_abandoned_cart_rule_specification_items_table',276),
(565,'2024_02_19_141912_create_abandoned_cart_rule_histories_table',276),
(566,'2024_02_28_436872_add_credentials_column_to_payment_channels_table',276),
(567,'2024_02_28_469813_remove_settings_column_from_payment_channels_table',276),
(568,'2023_07_11_165937_create_user_firebase_sessions',277),
(569,'2024_04_24_085747_add_new_column_to_course_learning_last_views_table',277),
(570,'2024_05_06_141610_create_user_commissions_table',277),
(571,'2024_05_06_142505_remove_commission_column_from_tables',277),
(572,'2024_05_11_122847_add_new_source_for_video_demo',277),
(573,'2024_05_19_131041_add_certificate_column_to_bundles_table',277),
(574,'2024_05_19_133542_add_bundle_to_certificates_table',277),
(575,'2024_11_11_095252_add_qr_code_to_webinars_table',278),
(576,'2024_11_11_142254_create_attendees_table',279),
(577,'2024_11_18_150318_add_in_days_to_webinar_table',280),
(578,'2024_11_25_125902_update_type_in_certificates_templates_table',281),
(579,'2024_11_27_113435_add_is_accepted_in_waitlists_table',282),
(580,'2024_11_27_132039_add_verification_token_to_waitlists_table',282),
(581,'2024_12_06_132038_create_calendar_events_table',283),
(582,'2024_12_06_132522_create_classrooms_table',283),
(583,'2024_12_06_132539_create_equipment_table',283),
(584,'2024_12_06_141943_create_calendar_event_classrooms_table',283),
(585,'2024_12_06_142039_create_calendar_event_equipment_table',283),
(586,'2025_01_06_142205_add_category_id_to_certificates_templates_table',284),
(587,'2025_01_16_152952_add_thumbnail_and_image_cover_to_categories_table',285),
(588,'2025_01_21_151616_add_webinar_id_to_offline_payments_table',286),
(591,'2025_01_27_094814_create_certificate_requests_table',287),
(601,'2025_01_30_100657_create_teachers_certificates_table',288),
(602,'2025_01_30_132052_create_teacher_webinar_lists_table',288),
(603,'2025_01_31_095506_add_list_id_to_certificate_requests',288),
(604,'2025_02_02_183037_add_list_id_to_teachers_certificates',288),
(605,'2025_02_07_220729_add_status_to_teacher_webinar_lists',288),
(606,'2025_03_11_140935_update_google_id_column_in_users_table',289),
(607,'2025_03_11_095625_add_grade_hopital_service_to_users_table',290),
(608,'2025_03_12_204019_add_preparation_days_to_categories_table',290),
(609,'2025_03_18_114828_create_webinar_contents_table',291),
(610,'2025_03_25_132614_add_rib_to_become_instructors_table',292);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbar_button_translations`
--

DROP TABLE IF EXISTS `navbar_button_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navbar_button_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navbar_button_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `navbar_button_translations_navbar_button_id_foreign` (`navbar_button_id`),
  KEY `navbar_button_translations_locale_index` (`locale`),
  CONSTRAINT `navbar_button_translations_navbar_button_id_foreign` FOREIGN KEY (`navbar_button_id`) REFERENCES `navbar_buttons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbar_button_translations`
--

LOCK TABLES `navbar_button_translations` WRITE;
/*!40000 ALTER TABLE `navbar_button_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `navbar_button_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbar_buttons`
--

DROP TABLE IF EXISTS `navbar_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navbar_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `for_guest` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `navbar_buttons_role_id_foreign` (`role_id`),
  CONSTRAINT `navbar_buttons_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbar_buttons`
--

LOCK TABLES `navbar_buttons` WRITE;
/*!40000 ALTER TABLE `navbar_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `navbar_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters_history`
--

DROP TABLE IF EXISTS `newsletters_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `send_method` enum('send_to_all','send_to_bcc','send_to_excel') NOT NULL,
  `bcc_email` varchar(255) DEFAULT NULL,
  `email_count` int(11) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters_history`
--

LOCK TABLES `newsletters_history` WRITE;
/*!40000 ALTER TABLE `newsletters_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboards`
--

DROP TABLE IF EXISTS `noticeboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticeboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organ_id` int(10) unsigned DEFAULT NULL,
  `instructor_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` enum('all','organizations','students','instructors','students_and_instructors') NOT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `noticeboards_organ_id_foreign` (`organ_id`),
  KEY `noticeboards_user_id_foreign` (`user_id`),
  KEY `noticeboards_instructor_id_foreign` (`instructor_id`),
  KEY `noticeboards_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `noticeboards_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_organ_id_foreign` FOREIGN KEY (`organ_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboards`
--

LOCK TABLES `noticeboards` WRITE;
/*!40000 ALTER TABLE `noticeboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticeboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboards_status`
--

DROP TABLE IF EXISTS `noticeboards_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticeboards_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `noticeboard_id` int(10) unsigned NOT NULL,
  `seen_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `noticeboards_status_noticeboard_id_foreign` (`noticeboard_id`),
  CONSTRAINT `noticeboards_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `noticeboards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboards_status`
--

LOCK TABLES `noticeboards_status` WRITE;
/*!40000 ALTER TABLE `noticeboards_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticeboards_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
INSERT INTO `notification_templates` VALUES
(2,'New badge awarded','<p>You received [u.b.title]&nbsp;badge</p>'),
(3,'User group change','<p>Your user group changed to [u.g.title]</p>'),
(4,'Course created','<p>You created a new course&nbsp;with title [c.title]</p>'),
(5,'Course approve','<p>Your course with title [c.title] approved</p>'),
(6,'Course rejection','<p>Your course with title [c.title] rejected</p>'),
(7,'New comment','<p>[u.name] left a new comment for [c.title] course</p>'),
(8,'New support message','<p>[u.name] sent a new support message for [c.title]&nbsp;course</p>'),
(9,'Support message replied','<p>New reply in [c.title] course support message&nbsp;</p>'),
(10,'New support for admin','<p>New support ticket received with title [s.t.title]</p>'),
(11,'Support ticket replied for admin','<p>New reply in support ticket with title&nbsp;[s.t.title]</p>'),
(12,'New financial document','<p>&nbsp;New financial document submitted for [c.title] with type [f.d.type] with amount [amount]</p>'),
(13,'Payout request','<p>New payout request submitted with amount [payout.amount]</p>'),
(14,'Payout processed','Your payout request with amount [payout.amount]&nbsp;&nbsp;proceed to [payout.account]'),
(15,'New sales','<p>Congratulations! New sale for [c.title]</p>'),
(16,'New purchase','<p>Congratulations! New purchase for [c.title]</p>'),
(17,'Rating (Feedback)','<p>New [rate.count] star feedback submitted for [c.title] by [student.name]</p>'),
(18,'Offline payment request','<p>The offline payment request with the amount [amount] submitted. It is under review and you will get informed by email.</p>'),
(19,'Offline payment approved','<p>Offline payment request with amount [amount]&nbsp;approved</p>'),
(20,'Offline payment rejected','<p>Offline payment request with amount [amount]&nbsp;rejected</p>'),
(21,'New subscription plan','<p>[s.p.name] subscription plan activated by [u.name]</p>'),
(22,'New meeting','<p>New meeting booked by [u.name] for [time.date] at [amount]</p>'),
(23,'New meeting link','<p>[instructor.name] defined the meeting link and you can join the meeting on [time.date] using the following link: [link]</p>'),
(24,'Meeting reminder','<p>You have a meeting on [time.date] please remember to join it on time.</p>'),
(25,'Meeting finished','<p>Your meeting finished with the following information</p><p>Instructor: [instructor.name]</p><p>Student: [student.name]</p><p>Meeting time: [time.date]</p>'),
(26,'New contact message','<p>New contact message received from [u.name] with title [c.u.title]</p><p><br></p>'),
(27,'Live class reminder','<p>Your live class session of the [c.title] will be conducted on [time.date]&nbsp;</p>'),
(28,'Promotion plan','<p>[p.p.name] promotion plan activated for [c.title] course</p>'),
(29,'Promotion plan for admin','<p>[p.p.name] promotion plan request submitted for [c.title]</p>'),
(30,'Certificate achieved','<p>You achieved a certificate for [c.title] course</p>'),
(31,'Waiting quiz (Instructor)','<p>[student.name] is waiting for [q.title] quiz result of the [c.title] course. Please review the quiz and submit the grade.</p>'),
(32,'Waiting quiz result','<p>Your [q.title] quiz of the [c.title] course rated by the instructor, and your quiz status is [q.result]</p>'),
(33,'Product new sale','<p>New sale for [p.title] product</p>'),
(34,'Product new purchase','<p>New purchase for [p.title] product</p>'),
(35,'Product new comment','<p>[u.name] left a new comment for [p.title] product</p>'),
(36,'Product tracking code','<p>[u.name] submitted tracking code for [p.title]</p>'),
(37,'Product rating (Feedback)','<p>[u.name] submitted a new [rate.count] stars rating for [p.title] product</p>'),
(38,'Product received','<p>[u.name] received [p.title] product.</p>'),
(39,'Product out of stock','<p>Your product [p.title] is out of stock</p>'),
(40,'Assignment submission (Instructor)','<p>[student.name] submitted an assignment for [c.title] course</p>'),
(41,'Instructor message in assignment','<p>[instructor.name] sent a message for [c.title] assignment</p>'),
(42,'Assignment grade','<p>Your assignment of [c.title] rated by [instructor.name] . Your grade is [assignment_grade]</p>'),
(43,'User access to content','<p>Your access to content is enabled.</p>'),
(44,'Send post in topic','<p>[u.name] sent a post in your topic with title [topic_title]&nbsp;</p>'),
(45,'Blog post published (Instructor)','<p>Your blog post with title [blog_title] published.</p>'),
(46,'New comment for blog post (Instructor)','<p>[u.name] leaft a new comment for your blog with title [blog_title]</p>'),
(47,'Meeting reminder','<p>You have a meeting on [time.date] with [instructor.name]</p>'),
(48,'Subscription expiry reminder','<p>Your subscription expires on [time.date]&nbsp;</p>'),
(49,'Course forum new question','<p>[u.name] registered a question in the [c.title]&nbsp;course forum.</p>'),
(50,'New answer in course forum','<p>[u.name] submitted an answer in the [c.title]&nbsp;course forum.</p>'),
(52,'You received a gift','<p>[u.name]&nbsp;sent you [gift_title] which is a [gift_type]&nbsp;as a gift with the following message: [gift_message]</p>'),
(53,'Gift submitted successfully','<p>Your gift request for [u.name]&nbsp;submitted successfully on [time.date]&nbsp;and the [gift_title] which is a [gift_type]&nbsp;at [amount]&nbsp;will be sent to the recipient on [time.date.2]&nbsp;with the following message: [gift_message]</p>'),
(54,'Gift sent to recipient','<p>We sent the gift request that you submitted on [time.date]&nbsp;for [u.name]. We sent [gift_title]&nbsp;which is a [gift_type]&nbsp;to the recipient with the following message on [time.date] . [gift_message]</p>'),
(55,'Gift request submitted (Admin)','<p>[u.name.2] submitted a gift request for [gift_title]&nbsp;which is a [gift_type]&nbsp;for [u.name]&nbsp;on [time.date]&nbsp;at [amount]&nbsp;and it will be sent to the recipient on [time.date.2]</p>'),
(56,'Gift sent to recipient (Admin)','<p>The system sent a [gift_title]&nbsp;which is a [gift_type]&nbsp;to [u.name]&nbsp;on [time.date.2]&nbsp;successfully. [u.name.2]&nbsp;submitted this request on [time.date]&nbsp;at [amount].</p>'),
(57,'You have an upcoming installment','<p>You have an installment for [installment_title] at [amount]&nbsp;on due date [time.date]</p>'),
(58,'You have an unpaid installment','<p>You have an installment for [installment_title]&nbsp;at [amount]&nbsp;for today. Please pay it as soon as possible.</p>'),
(59,'You have an overdue installment','<p>You have an overdue installment for [installment_title]&nbsp;at [amount]&nbsp;on due date [time.date].</p>'),
(60,'Installment verification request approved','<p>Your verification request for [installment_title]&nbsp;approved.</p>'),
(61,'Installment verification request rejected','<p>Your verification request for [installment_title]&nbsp;rejected.</p>'),
(62,'Installment paid successfully','<p>You paid [amount]&nbsp;for [installment_title]&nbsp;with due date [time.date]&nbsp;successfully.</p>'),
(63,'Installment paid successfully (Admin)','<p>[u.name] paid [amount]&nbsp;for [installment_title]&nbsp;with the due date [time.date]&nbsp;successfully.</p>'),
(64,'Installment upfront amount paid','<p>You paid [amount] as upfront for&nbsp;[installment_title].</p>'),
(65,'Installment verification request submitted','<p>We received your verification request for [installment_title]&nbsp;on [time.date]&nbsp;and the result will be informed to you soon.</p>'),
(66,'Installment verification request submitted (Admin)','<p>[u.name] submitted a verification request for [installment_title]&nbsp;on [time.date].</p>'),
(67,'Installment request submitted','<p>Your installment for [installment_title]&nbsp;at [amount]&nbsp;submitted successfully.</p>'),
(68,'Installment request submitted (Admin)','<p>[u.name] submitted an installment request for [installment_title]&nbsp;at [amount].</p>'),
(69,'New upcoming course submitted','<p>Your upcoming course [item_title]&nbsp;submitted successfully.</p>'),
(70,'New upcoming course submitted (Admin)','<p>[u.name] submitted an upcoming course with title [item_title].</p>'),
(71,'Upcoming course approved','<p>Your upcoming course [item_title]&nbsp;approved.</p>'),
(72,'Upcoming course rejected','<p>Your upcoming course [item_title] rejected.</p>'),
(73,'Your upcoming course published','<p>Your upcoming course [item_title]&nbsp;published.</p>'),
(74,'Your upcoming course followed','<p>[u.name] followed your upcoming course [item_title]</p>'),
(75,'Upcoming course published and is accessible','<p>The upcoming course [item_title] published now and you can check it.</p>'),
(76,'You got cashback!','<p>You got [amount]&nbsp;as cashback and this amount added to your account.</p>'),
(77,'User got cashback (Admin)','<p>[u.name] got [amount] as cashback and this amount charged to their account.</p>'),
(78,'Bundle submitted successfully','<p>Your bundle with the title [item_title]&nbsp;submitted successfully.</p>'),
(79,'Bundle submitted (Admin)','<p>[u.name] submitted a bundle with the title [item_title].</p>'),
(80,'Bundle published successfully','<p>Your bundle with title [item_title]&nbsp;published successfully.</p>'),
(81,'Bundle rejected','<p>Your bundle with title [item_title]&nbsp;rejected.</p>'),
(82,'New review for your bundle','<p>[u.name] submitted a [rate.count] star rating for your bundle [item_title].</p>'),
(83,'You got registration bonus','<p>You got [amount]&nbsp;as registration bonus.</p>'),
(84,'Registration bonus unlocked','<p>Your registration bonus [amount]&nbsp;unlocked. Happy with spending...</p>'),
(85,'Registration bonus unlocked (Admin)','<p>The registration bonus [amount] unlocked for [u.name].</p>'),
(86,'SaaS package activated successfully','<p>[item_title] activated for you until [time.date].</p>'),
(87,'SaaS package activated (Admin)','<p>[u.name] activated [item_title]&nbsp;registration plan until [time.date].</p>'),
(88,'Your contact message submitted','<p>We received your contact message with the subject [c.u.title]&nbsp;on [time.date].</p>'),
(89,'New contact message received','<p>New contact message received from [u.name] with subject [c.u.title] with message [c.u.message]</p>'),
(90,'You submitted to waitlist','<p>You submitted to [c.title]&nbsp;waitlist.</p>'),
(91,'User submitted in waitlist','<p>[u.name] submitted to [c.title]&nbsp;waitlist.</p>'),
(92,'New user registered with your affiliate code','<p>[u.name] registered with your affiliate code on [time.date].</p>'),
(93,'New quiz added to course','<p>New quiz with the title [q.title]&nbsp;added to the course [c.title].</p>'),
(94,'New reward point','<p>You collected [points]&nbsp;for [item_title]&nbsp;on [time.date]</p>'),
(95,'New notice','<p>You got a new notice with title [c.title]&nbsp;on [time.date]</p>'),
(96,'New course notice','<p>You got a new course notice for [c.title]&nbsp;with title [item_title]</p>'),
(97,'Your user role changed','<p>Your user role changed to [u.role]</p>'),
(98,'New user group','<p>You added to [u.g.title] user group.</p>'),
(99,'Become instructor/organization request approved','<p>Your become instructor/organization request is approved.</p>'),
(100,'Become instructor/organization request rejected','<p>Your instructor/organization request rejected</p>'),
(101,'New question in course forum','<p>[u.name] posted a new question in [c.title] forum.</p>'),
(102,'New answer in course forum','<p>[u.name] posted a new answer in [c.title] forum.</p>'),
(103,'Live meeting created','<p>[instructor.name] started a new live meeting. Please login to your account and join it now...</p>'),
(104,'New user registered','<p>[u.name] registered on the platform on [time.date]&nbsp;as [u.role]</p>'),
(105,'New instructor/organization request','<p>[u.name] submitted a user role change request on [time.date]</p>'),
(106,'New course enrollment','<p>[u.name] enrolled in [c.title]&nbsp;on [time.date]&nbsp;at [amount]</p>'),
(107,'New forum topic','<p>[u.name] created a new topic with title [topic_title]&nbsp;in [forum_title]&nbsp;forum.</p>'),
(108,'New report','<p>[u.name] reported a content for revising.</p>'),
(109,'New item created','<p>[u.name] created a new item with title [item_title]</p>'),
(110,'New store order','<p>New store order received from [u.name]&nbsp;at [amount]</p>'),
(111,'Subscription plan activated','<p>[u.name] purchased [s.p.name]&nbsp;at [amount]</p>'),
(112,'Content review request','<p>[u.name] sent a review request for [item_title]</p>'),
(113,'New user blog post','<p>[u.name] submitted a blog article with title [blog_title]</p>'),
(114,'New item review (Rating)','<p>[u.name] submitted a new rate for [item_title]</p>'),
(115,'New organization user','<p>[organization.name] submitted [u.name]&nbsp;as new [u.role]</p>'),
(116,'User wallet charge','<p>[u.name] charged their wallet for [amount]</p>'),
(117,'New payout request','<p>[u.name] submitted a new payout request at [amount]</p>'),
(118,'New offline payment request','<p>[u.name] submitted a new offline payment request at [amount]</p>'),
(119,'Content access approval','<p>Your content access request approved. You can access all courses now...</p>'),
(120,'Form submission by user','<p>[u.name] submitted form [form_title]</p>'),
(121,'Cart reminder','<div>We\'re excited to invite you to complete your purchase with us! Enjoy exclusive benefits and offers by finalizing your order now.</div>'),
(122,'Complete your purchase today with discount!','<div>Here\'s an exclusive [discount_amount] discount coupon to encourage you to finalize your purchase with us. Discount Code : [discount_code]</div>'),
(123,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>'),
(124,'You have been accepted','<p>You have been accepted in  [c.title] course .</p>'),
(125,'Certificate request approved','<p>Your Certificate request have been accepted in [c.title] course .</p>'),
(126,'Certificate request  rejected','<p>Your Certificate request have been rejected&nbsp; in [c.title] course .</p>'),
(127,'Certificate request send','<p>[u.name] submitted a certificate request for [c.title]</p>');
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `sender` enum('system','admin') DEFAULT 'system',
  `type` enum('single','all_users','students','instructors','organizations','group','course_students') NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_user_id_foreign` (`user_id`) USING BTREE,
  KEY `notifications_group_id_foreign` (`group_id`) USING BTREE,
  KEY `webinar_id` (`webinar_id`),
  CONSTRAINT `notifications_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2810 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES
(2718,1,NULL,NULL,NULL,'New user registered','<p>Ghada Ouni registered on the platform on 14/03/2025 11:17&nbsp;as Instructor</p>','system','single',1741947429),
(2719,1,NULL,NULL,NULL,'New item created','<p>Ghada Ouni created a new item with title New course</p>','system','single',1741947584),
(2720,1072,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title New course</p>','system','single',1741950654),
(2721,1,NULL,NULL,NULL,'Content review request','<p>Ghada Ouni sent a review request for New course</p>','system','single',1741950656),
(2722,1,NULL,NULL,NULL,'New item created','<p>Ghada Ouni created a new item with title test</p>','system','single',1741951022),
(2723,1072,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title test</p>','system','single',1741951081),
(2724,1,NULL,NULL,NULL,'Content review request','<p>Ghada Ouni sent a review request for test</p>','system','single',1741951082),
(2725,1072,NULL,NULL,NULL,'Course approve','<p>Your course with title New course approved</p>','system','single',1741951686),
(2726,1072,NULL,NULL,NULL,'Course approve','<p>Your course with title test approved</p>','system','single',1741951763),
(2727,1072,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title New course</p>','system','single',1741951927),
(2728,1,NULL,NULL,NULL,'Content review request','<p>Ghada Ouni sent a review request for New course</p>','system','single',1741951929),
(2729,1072,NULL,NULL,NULL,'Course approve','<p>Your course with title New-course approved</p>','system','single',1741951979),
(2730,1,NULL,NULL,NULL,'New instructor/organization request','<p>SmartLab FMM submitted a user role change request on 17/03/2025 12:17</p>','system','single',1742210229),
(2731,1,NULL,NULL,NULL,'New item created','<p>Racha Zaibi created a new item with title test</p>','system','single',1742210291),
(2732,1,NULL,NULL,NULL,'New item created','<p>Instructor created a new item with title demo</p>','system','single',1742213389),
(2733,1071,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title demo</p>','system','single',1742214002),
(2734,1,NULL,NULL,NULL,'Content review request','<p>Instructor sent a review request for demo</p>','system','single',1742214003),
(2735,1071,NULL,NULL,NULL,'Course approve','<p>Your course with title demo approved</p>','system','single',1742214100),
(2736,1,NULL,NULL,NULL,'User submitted in waitlist','<p>SmartLab FMM submitted to demo&nbsp;waitlist.</p>','system','single',1742214867),
(2737,1071,NULL,NULL,NULL,'User submitted in waitlist','<p>SmartLab FMM submitted to demo&nbsp;waitlist.</p>','system','single',1742214868),
(2738,1073,NULL,NULL,NULL,'You submitted to waitlist','<p>You submitted to demo&nbsp;waitlist.</p>','system','single',1742214869),
(2739,1073,NULL,NULL,NULL,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>','system','single',1742214936),
(2740,1073,NULL,NULL,NULL,'Offline payment request','<p>The offline payment request with the amount TND50 submitted. It is under review and you will get informed by email.</p>','system','single',1742215150),
(2741,1,NULL,NULL,NULL,'New offline payment request','<p>SmartLab FMM submitted a new offline payment request at TND50</p>','system','single',1742215153),
(2742,1071,NULL,NULL,NULL,'New offline payment request','<p>SmartLab FMM submitted a new offline payment request at TND50</p>','system','single',1742215155),
(2743,1073,NULL,NULL,NULL,'Offline payment approved','<p>Offline payment request with amount TND50&nbsp;approved</p>','system','single',1742215343),
(2744,1071,NULL,NULL,NULL,'You have been accepted','<p>You have been accepted in  demo course .</p>','system','single',1742215345),
(2745,1,NULL,NULL,NULL,'New item created','<p>Racha Zaibi created a new item with title test</p>','system','single',1742382188),
(2746,1049,NULL,NULL,NULL,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>','system','single',1742386689),
(2747,1,NULL,NULL,NULL,'New instructor/organization request','<p>RachaZaibi submitted a user role change request on 25/03/2025 15:36</p>','system','single',1742913379),
(2748,1050,NULL,NULL,NULL,'Become instructor/organization request approved','<p>Your become instructor/organization request is approved.</p>','system','single',1742913463),
(2749,1,NULL,NULL,NULL,'New user registered','<p>pakhaji registered on the platform on 4/04/2025 21:23&nbsp;as Student</p>','system','single',1743798232),
(2750,1,NULL,NULL,NULL,'New item created','<p>Instructor created a new item with title New courses</p>','system','single',1744034387),
(2751,1071,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title New courses</p>','system','single',1744034617),
(2752,1,NULL,NULL,NULL,'Content review request','<p>Instructor sent a review request for New courses</p>','system','single',1744034619),
(2753,1071,NULL,NULL,NULL,'Course approve','<p>Your course with title New courses approved</p>','system','single',1744034699),
(2754,1071,NULL,NULL,NULL,'Course approve','<p>Your course with title New courses 25 approved</p>','system','single',1744034764),
(2755,1049,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for New courses 25 course</p>','system','single',1744034777),
(2756,1,NULL,NULL,NULL,'User submitted in waitlist','<p>FMM TICE submitted to New courses 25&nbsp;waitlist.</p>','system','single',1744034880),
(2757,1071,NULL,NULL,NULL,'User submitted in waitlist','<p>FMM TICE submitted to New courses 25&nbsp;waitlist.</p>','system','single',1744034882),
(2758,1049,NULL,NULL,NULL,'You submitted to waitlist','<p>You submitted to New courses 25&nbsp;waitlist.</p>','system','single',1744034883),
(2759,1071,NULL,NULL,NULL,'Course approve','<p>Your course with title New courses 25 approved</p>','system','single',1744034966),
(2760,1071,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for New courses 25 course</p>','system','single',1744034980),
(2761,1049,NULL,NULL,NULL,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>','system','single',1744035278),
(2762,1049,NULL,NULL,NULL,'Offline payment request','<p>The offline payment request with the amount TND12 submitted. It is under review and you will get informed by email.</p>','system','single',1744035395),
(2763,1,NULL,NULL,NULL,'New offline payment request','<p>FMM TICE submitted a new offline payment request at TND12</p>','system','single',1744035397),
(2764,1071,NULL,NULL,NULL,'New offline payment request','<p>FMM TICE submitted a new offline payment request at TND12</p>','system','single',1744035397),
(2765,1073,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for New courses 25 course</p>','system','single',1744035558),
(2766,1,NULL,NULL,NULL,'User submitted in waitlist','<p>SmartLab FMM submitted to New courses 25&nbsp;waitlist.</p>','system','single',1744035563),
(2767,1071,NULL,NULL,NULL,'User submitted in waitlist','<p>SmartLab FMM submitted to New courses 25&nbsp;waitlist.</p>','system','single',1744035565),
(2768,1073,NULL,NULL,NULL,'You submitted to waitlist','<p>You submitted to New courses 25&nbsp;waitlist.</p>','system','single',1744035567),
(2769,1073,NULL,NULL,NULL,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>','system','single',1744035603),
(2770,1073,NULL,NULL,NULL,'Offline payment request','<p>The offline payment request with the amount TND12 submitted. It is under review and you will get informed by email.</p>','system','single',1744035722),
(2771,1,NULL,NULL,NULL,'New offline payment request','<p>SmartLab FMM submitted a new offline payment request at TND12</p>','system','single',1744035724),
(2772,1071,NULL,NULL,NULL,'New offline payment request','<p>SmartLab FMM submitted a new offline payment request at TND12</p>','system','single',1744035725),
(2773,1073,NULL,NULL,NULL,'Offline payment approved','<p>Offline payment request with amount TND12&nbsp;approved</p>','system','single',1744035758),
(2774,1071,NULL,NULL,NULL,'You have been accepted','<p>You have been accepted in  New-courses course .</p>','system','single',1744035760),
(2775,1055,NULL,NULL,NULL,'Your user role changed','<p>Your user role changed to Organization role</p>','system','single',1744112788),
(2776,1,NULL,NULL,NULL,'New user registered','<p>Danang registered on the platform on 17/04/2025 23:55&nbsp;as Student</p>','system','single',1744930500),
(2777,1,NULL,NULL,NULL,'New user registered','<p>Danang registered on the platform on 18/04/2025 00:05&nbsp;as Student</p>','system','single',1744931145),
(2778,1,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for demo course</p>','system','single',1745852040),
(2779,1,NULL,NULL,NULL,'New user registered','<p>nastar registered on the platform on 29/04/2025 11:12&nbsp;as Student</p>','system','single',1745921572),
(2780,1,NULL,NULL,NULL,'New user registered','<p>MAVIETA registered on the platform on 6/05/2025 14:22&nbsp;as Student</p>','system','single',1746537753),
(2781,1,NULL,NULL,NULL,'New user registered','<p>Charfeddine Amri registered on the platform on 10/05/2025 06:42&nbsp;as Instructor</p>','system','single',1746855772),
(2782,1,NULL,NULL,NULL,'New user registered','<p>Student registered on the platform on 10/05/2025 06:53&nbsp;as Student</p>','system','single',1746856438),
(2783,1073,NULL,NULL,NULL,'Your user role changed','<p>Your user role changed to Organization role</p>','system','single',1747431095),
(2784,1,NULL,NULL,NULL,'New item created','<p>Instructor created a new item with title test16052025</p>','system','single',1747432449),
(2785,1047,NULL,NULL,NULL,'New item created','<p>Instructor created a new item with title test16052025</p>','system','single',1747432450),
(2786,1071,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title test16052025</p>','system','single',1747432518),
(2787,1,NULL,NULL,NULL,'Content review request','<p>Instructor sent a review request for test16052025</p>','system','single',1747432519),
(2788,1047,NULL,NULL,NULL,'Content review request','<p>Instructor sent a review request for test16052025</p>','system','single',1747432519),
(2789,1071,NULL,NULL,NULL,'Course created','<p>You created a new course&nbsp;with title test16052025</p>','system','single',1747433413),
(2790,1,NULL,NULL,NULL,'Content review request','<p>Instructor sent a review request for test16052025</p>','system','single',1747433414),
(2791,1047,NULL,NULL,NULL,'Content review request','<p>Instructor sent a review request for test16052025</p>','system','single',1747433416),
(2792,1071,NULL,NULL,NULL,'Course approve','<p>Your course with title test16052025 approved</p>','system','single',1747433426),
(2793,1051,NULL,NULL,NULL,'Your user role changed','<p>Your user role changed to Student role</p>','system','single',1747468967),
(2794,1050,NULL,NULL,NULL,'Your user role changed','<p>Your user role changed to Student role</p>','system','single',1747468991),
(2795,1050,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for test16052025 course</p>','system','single',1747469033),
(2796,1051,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for test16052025 course</p>','system','single',1747469992),
(2797,1,NULL,NULL,NULL,'User submitted in waitlist','<p>Racha Zaibi submitted to test16052025&nbsp;waitlist.</p>','system','single',1747470229),
(2798,1071,NULL,NULL,NULL,'User submitted in waitlist','<p>Racha Zaibi submitted to test16052025&nbsp;waitlist.</p>','system','single',1747470230),
(2799,1051,NULL,NULL,NULL,'You submitted to waitlist','<p>You submitted to test16052025&nbsp;waitlist.</p>','system','single',1747470231),
(2800,1051,NULL,NULL,NULL,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>','system','single',1747470254),
(2801,1051,NULL,NULL,NULL,'Submit Verification Document for Payment','<div style=\"line-height: 19px;\">Submit Verification Document for Payment</div>','system','single',1747473432),
(2802,1051,NULL,NULL,NULL,'Offline payment request','<p>The offline payment request with the amount TND250 submitted. It is under review and you will get informed by email.</p>','system','single',1747473556),
(2803,1,NULL,NULL,NULL,'New offline payment request','<p>Racha Zaibi submitted a new offline payment request at TND250</p>','system','single',1747473557),
(2804,1071,NULL,NULL,NULL,'New offline payment request','<p>Racha Zaibi submitted a new offline payment request at TND250</p>','system','single',1747473558),
(2805,1051,NULL,NULL,NULL,'Offline payment approved','<p>Offline payment request with amount TND250&nbsp;approved</p>','system','single',1747473619),
(2806,1071,NULL,NULL,NULL,'You have been accepted','<p>You have been accepted in  test16052025 course .</p>','system','single',1747473621),
(2807,1071,NULL,NULL,NULL,'Certificate achieved','<p>You achieved a certificate for test16052025 course</p>','system','single',1747473915),
(2808,1,NULL,NULL,NULL,'Certificate request send','<p>Instructor submitted a certificate request for test16052025</p>','system','single',1747474286),
(2809,NULL,NULL,NULL,NULL,'Certificate request approved','<p>Your Certificate request have been accepted in [c.title] course .</p>','system','single',1747474316);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_status`
--

DROP TABLE IF EXISTS `notifications_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `seen_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_status_notification_id_foreign` (`notification_id`) USING BTREE,
  CONSTRAINT `notifications_status_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_status`
--

LOCK TABLES `notifications_status` WRITE;
/*!40000 ALTER TABLE `notifications_status` DISABLE KEYS */;
INSERT INTO `notifications_status` VALUES
(606,1,2721,1741950801),
(607,1072,2723,1741951250),
(608,1072,2720,1741951250),
(609,1,2734,1742214038);
/*!40000 ALTER TABLE `notifications_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_bank_specification_translations`
--

DROP TABLE IF EXISTS `offline_bank_specification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_bank_specification_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offline_bank_specification_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_bank_specification_id` (`offline_bank_specification_id`),
  KEY `locale` (`locale`) USING BTREE,
  CONSTRAINT `offline_bank_specification_id` FOREIGN KEY (`offline_bank_specification_id`) REFERENCES `offline_bank_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_bank_specification_translations`
--

LOCK TABLES `offline_bank_specification_translations` WRITE;
/*!40000 ALTER TABLE `offline_bank_specification_translations` DISABLE KEYS */;
INSERT INTO `offline_bank_specification_translations` VALUES
(20,17,'en','Card ID'),
(21,18,'en','Account ID'),
(22,19,'en','IBAN');
/*!40000 ALTER TABLE `offline_bank_specification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_bank_specifications`
--

DROP TABLE IF EXISTS `offline_bank_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_bank_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offline_bank_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_bank_specifications_offline_bank_id_foreign` (`offline_bank_id`),
  CONSTRAINT `offline_bank_specifications_offline_bank_id_foreign` FOREIGN KEY (`offline_bank_id`) REFERENCES `offline_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_bank_specifications`
--

LOCK TABLES `offline_bank_specifications` WRITE;
/*!40000 ALTER TABLE `offline_bank_specifications` DISABLE KEYS */;
INSERT INTO `offline_bank_specifications` VALUES
(17,6,'2578-4910-3682-6288'),
(18,6,'38152294372'),
(19,6,'QA66QUWW934528129454345775226');
/*!40000 ALTER TABLE `offline_bank_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_bank_translations`
--

DROP TABLE IF EXISTS `offline_bank_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_bank_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offline_bank_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_bank_translations_offline_bank_id_foreign` (`offline_bank_id`),
  KEY `offline_bank_translations_locale_index` (`locale`),
  CONSTRAINT `offline_bank_translations_offline_bank_id_foreign` FOREIGN KEY (`offline_bank_id`) REFERENCES `offline_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_bank_translations`
--

LOCK TABLES `offline_bank_translations` WRITE;
/*!40000 ALTER TABLE `offline_bank_translations` DISABLE KEYS */;
INSERT INTO `offline_bank_translations` VALUES
(7,6,'en','Qatar National Bank');
/*!40000 ALTER TABLE `offline_bank_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_banks`
--

DROP TABLE IF EXISTS `offline_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_banks`
--

LOCK TABLES `offline_banks` WRITE;
/*!40000 ALTER TABLE `offline_banks` DISABLE KEYS */;
INSERT INTO `offline_banks` VALUES
(6,'/store/1/default_images/offline_payments/Qatar National Bank.png',1678951755);
/*!40000 ALTER TABLE `offline_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_payments`
--

DROP TABLE IF EXISTS `offline_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `offline_bank_id` int(10) unsigned DEFAULT NULL,
  `reference_number` varchar(64) NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` enum('waiting','approved','reject') NOT NULL,
  `pay_date` varchar(64) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `offline_payments_user_id_foreign` (`user_id`) USING BTREE,
  KEY `offline_payments_offline_bank_id_foreign` (`offline_bank_id`),
  KEY `offline_payments_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `offline_payments_offline_bank_id_foreign` FOREIGN KEY (`offline_bank_id`) REFERENCES `offline_banks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `offline_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offline_payments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payments`
--

LOCK TABLES `offline_payments` WRITE;
/*!40000 ALTER TABLE `offline_payments` DISABLE KEYS */;
INSERT INTO `offline_payments` VALUES
(1,1049,100,6,'Au fgukj',2090,NULL,'approved','1741388400',1741424001),
(2,1073,50,6,'58744',2095,'1742215150.jpg','approved','1741942800',1742215150),
(3,1049,12,6,'356543',2097,NULL,'waiting','1743980400',1744035395),
(4,1073,12,6,'12456',2097,'1744035722.jpg','approved','1741942800',1744035722),
(5,1051,250,6,'46532',2098,NULL,'approved','1746831600',1747473556);
/*!40000 ALTER TABLE `offline_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `gift_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `installment_payment_id` int(10) unsigned DEFAULT NULL,
  `reserve_meeting_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `become_instructor_id` int(10) unsigned DEFAULT NULL,
  `amount` double(15,2) unsigned DEFAULT NULL,
  `tax` int(10) unsigned DEFAULT NULL,
  `tax_price` double(15,2) unsigned DEFAULT NULL,
  `commission` int(10) unsigned DEFAULT NULL,
  `commission_price` double(15,2) unsigned DEFAULT NULL,
  `discount` double(15,2) unsigned DEFAULT NULL,
  `total_amount` double(15,2) unsigned DEFAULT NULL,
  `product_delivery_fee` double(15,2) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_items_order_id_foreign` (`order_id`) USING BTREE,
  KEY `order_items_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `order_items_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `order_items_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  KEY `order_items_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `order_items_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `order_items_gift_id_foreign` (`gift_id`),
  CONSTRAINT `order_items_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=730 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES
(708,1050,710,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730806418),
(709,1050,711,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730814783),
(710,1050,712,2024,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730816130),
(711,1050,713,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730816807),
(712,1050,714,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730816907),
(713,1050,715,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730816955),
(714,1050,716,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730816981),
(715,1050,717,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817191),
(716,1050,718,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817242),
(717,1050,719,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817296),
(718,1050,720,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817346),
(719,1050,721,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817434),
(720,1050,722,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817449),
(721,1050,723,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730817482),
(722,1050,724,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730818579),
(723,1050,725,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,10,5.00,20,10.00,0.00,55.00,0.00,1730890282),
(724,1050,726,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,10,5.00,20,10.00,0.00,55.00,0.00,1730890395),
(725,1050,727,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,10,5.00,20,10.00,0.00,55.00,0.00,1730890456),
(726,1050,728,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,10,5.00,20,10.00,0.00,55.00,0.00,1730890636),
(727,1049,729,2024,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.00,10,5.20,20,10.40,0.00,57.20,0.00,1730968803),
(728,1050,730,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,10,5.00,0,0.00,NULL,55.00,NULL,1733734684),
(729,1050,731,2089,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,250.00,10,25.00,20,50.00,0.00,275.00,0.00,1737463838);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('pending','paying','paid','fail') NOT NULL,
  `payment_method` enum('credit','payment_channel') DEFAULT NULL,
  `is_charge_account` tinyint(1) NOT NULL DEFAULT 0,
  `amount` double(15,2) unsigned NOT NULL,
  `tax` decimal(13,2) unsigned DEFAULT NULL,
  `total_discount` decimal(13,2) unsigned DEFAULT NULL,
  `total_amount` decimal(13,2) unsigned DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) unsigned DEFAULT NULL,
  `reference_id` text DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orders_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(710,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730806418),
(711,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730814783),
(712,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730816130),
(713,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730816807),
(714,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730816907),
(715,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730816955),
(716,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730816981),
(717,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817191),
(718,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817242),
(719,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817296),
(720,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817346),
(721,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817433),
(722,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817449),
(723,1050,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730817482),
(724,1050,'paid','credit',0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730818579),
(725,1050,'pending',NULL,0,50.00,5.00,0.00,55.00,0.00,NULL,NULL,1730890282),
(726,1050,'pending',NULL,0,50.00,5.00,0.00,55.00,0.00,NULL,NULL,1730890395),
(727,1050,'paid','credit',0,50.00,5.00,0.00,55.00,0.00,NULL,NULL,1730890456),
(728,1050,'paid','credit',0,50.00,5.00,0.00,55.00,0.00,NULL,NULL,1730890636),
(729,1049,'pending',NULL,0,52.00,5.20,0.00,57.20,0.00,NULL,NULL,1730968802),
(730,1050,'paid','credit',0,50.00,5.00,NULL,55.00,NULL,NULL,NULL,1733734684),
(731,1050,'pending',NULL,0,250.00,25.00,0.00,275.00,0.00,NULL,NULL,1737463838);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_translations`
--

DROP TABLE IF EXISTS `page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_translations_page_id_foreign` (`page_id`),
  KEY `page_translations_locale_index` (`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_translations`
--

LOCK TABLES `page_translations` WRITE;
/*!40000 ALTER TABLE `page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `robot` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('publish','draft') NOT NULL DEFAULT 'draft',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_link_unique` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(3,'/about','About',1,'publish',1609088468),
(5,'/terms','Terms & rules',1,'publish',1646409295),
(6,'/reward_points_system','Reward Points System',1,'publish',1646398467);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES
('av18981848@gmail.com','cYTtJLR86NoxZ0whf465XoQa98hhxAxx2Q7t3zeaeTJRYoUMQwqqzb4rgqP2','2021-02-20 16:05:13'),
('conseillerdigital@gmail.com','tSjyXCE1ZEL1Fn0nWFBc0FPLbGcttBDLGnxr6BRfdiJl1OIqWM8JXoRLkyIj','2024-12-24 11:07:39');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payku_payments`
--

DROP TABLE IF EXISTS `payku_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payku_payments` (
  `transaction_id` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `media` varchar(255) NOT NULL,
  `verification_key` varchar(255) NOT NULL,
  `authorization_code` varchar(255) NOT NULL,
  `last_4_digits` int(10) unsigned DEFAULT NULL,
  `installments` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `additional_parameters` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_key` varchar(255) DEFAULT NULL,
  `transaction_key` varchar(255) DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL,
  UNIQUE KEY `payku_payments_transaction_id_unique` (`transaction_id`),
  CONSTRAINT `payku_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `payku_transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payku_payments`
--

LOCK TABLES `payku_payments` WRITE;
/*!40000 ALTER TABLE `payku_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payku_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payku_transactions`
--

DROP TABLE IF EXISTS `payku_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payku_transactions` (
  `id` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `notified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `payku_transactions_id_unique` (`id`),
  UNIQUE KEY `payku_transactions_order_unique` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payku_transactions`
--

LOCK TABLES `payku_transactions` WRITE;
/*!40000 ALTER TABLE `payku_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payku_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_channels`
--

DROP TABLE IF EXISTS `payment_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `credentials` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_channels`
--

LOCK TABLES `payment_channels` WRITE;
/*!40000 ALTER TABLE `payment_channels` DISABLE KEYS */;
INSERT INTO `payment_channels` VALUES
(19,'Paypal','Paypal','inactive','/store/1/default_images/payment gateways/paypal.png',NULL,'[\"USD\",\"EUR\"]','1654755044'),
(23,'Payu','Payu','inactive','/store/1/default_images/payment gateways/payu.png',NULL,'[\"USD\",\"EUR\",\"INR\"]','1654755044'),
(24,'Razorpay','Razorpay','inactive','/store/1/default_images/payment gateways/razorpay.png',NULL,'[\"USD\",\"EUR\"]','1654755044');
/*!40000 ALTER TABLE `payment_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payouts`
--

DROP TABLE IF EXISTS `payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_selected_bank_id` int(10) unsigned NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `status` enum('waiting','done','reject') NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payouts_user_id_foreign` (`user_id`) USING BTREE,
  KEY `payout_user_selected_bank_id` (`user_selected_bank_id`) USING BTREE,
  CONSTRAINT `payout_user_selected_bank_id` FOREIGN KEY (`user_selected_bank_id`) REFERENCES `user_selected_banks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payouts`
--

LOCK TABLES `payouts` WRITE;
/*!40000 ALTER TABLE `payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payu_transactions`
--

DROP TABLE IF EXISTS `payu_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payu_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `paid_for_id` bigint(20) unsigned DEFAULT NULL,
  `paid_for_type` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `gateway` text NOT NULL,
  `body` text NOT NULL,
  `destination` varchar(255) NOT NULL,
  `hash` text NOT NULL,
  `response` text DEFAULT NULL,
  `status` enum('pending','failed','successful','invalid') NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payu_transactions_transaction_id_unique` (`transaction_id`) USING BTREE,
  KEY `payu_transactions_status_index` (`status`) USING BTREE,
  KEY `payu_transactions_verified_at_index` (`verified_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payu_transactions`
--

LOCK TABLES `payu_transactions` WRITE;
/*!40000 ALTER TABLE `payu_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payu_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `section_id` int(10) unsigned DEFAULT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `permissions_role_id_index` (`role_id`) USING BTREE,
  KEY `permissions_section_id_index` (`section_id`) USING BTREE,
  CONSTRAINT `permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permissions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(17677,6,1,1),
(17678,6,2,1),
(17679,6,3,1),
(17680,6,4,1),
(17681,6,5,1),
(17682,6,6,1),
(17683,6,7,1),
(17684,6,8,1),
(17685,6,9,1),
(17686,6,10,1),
(17687,6,11,1),
(17688,6,12,1),
(17689,6,13,1),
(17690,6,14,1),
(17691,6,15,1),
(17692,6,16,1),
(17693,6,17,1),
(17694,6,700,1),
(17695,6,701,1),
(17696,6,702,1),
(17697,6,703,1),
(17698,6,704,1),
(17699,6,705,1),
(17700,6,706,1),
(17701,6,707,1),
(17702,6,708,1),
(18273,2,1,1),
(18274,2,2,1),
(18275,2,3,1),
(18276,2,4,1),
(18277,2,5,1),
(18278,2,6,1),
(18279,2,7,1),
(18280,2,8,1),
(18281,2,9,1),
(18282,2,10,1),
(18283,2,11,1),
(18284,2,12,1),
(18285,2,13,1),
(18286,2,14,1),
(18287,2,15,1),
(18288,2,16,1),
(18289,2,17,1),
(18290,2,25,1),
(18291,2,26,1),
(18292,2,50,1),
(18293,2,51,1),
(18294,2,52,1),
(18295,2,53,1),
(18296,2,54,1),
(18297,2,100,1),
(18298,2,101,1),
(18299,2,102,1),
(18300,2,103,1),
(18301,2,104,1),
(18302,2,105,1),
(18303,2,106,1),
(18304,2,107,1),
(18305,2,108,1),
(18306,2,109,1),
(18307,2,110,1),
(18308,2,111,1),
(18309,2,112,1),
(18310,2,113,1),
(18311,2,114,1),
(18312,2,115,1),
(18313,2,116,1),
(18314,2,117,1),
(18315,2,118,1),
(18316,2,150,1),
(18317,2,151,1),
(18318,2,152,1),
(18319,2,153,1),
(18320,2,154,1),
(18321,2,155,1),
(18322,2,156,1),
(18323,2,157,1),
(18324,2,158,1),
(18325,2,159,1),
(18326,2,160,1),
(18327,2,161,1),
(18328,2,162,1),
(18329,2,163,1),
(18330,2,164,1),
(18331,2,165,1),
(18332,2,166,1),
(18333,2,167,1),
(18334,2,200,1),
(18335,2,201,1),
(18336,2,202,1),
(18337,2,203,1),
(18338,2,204,1),
(18339,2,205,1),
(18340,2,206,1),
(18341,2,207,1),
(18342,2,208,1),
(18343,2,250,1),
(18344,2,251,1),
(18345,2,252,1),
(18346,2,253,1),
(18347,2,254,1),
(18348,2,300,1),
(18349,2,301,1),
(18350,2,302,1),
(18351,2,303,1),
(18352,2,304,1),
(18353,2,350,1),
(18354,2,351,1),
(18355,2,352,1),
(18356,2,353,1),
(18357,2,354,1),
(18358,2,355,1),
(18359,2,356,1),
(18360,2,357,1),
(18361,2,400,1),
(18362,2,401,1),
(18363,2,402,1),
(18364,2,403,1),
(18365,2,404,1),
(18366,2,405,1),
(18367,2,450,1),
(18368,2,451,1),
(18369,2,452,1),
(18370,2,453,1),
(18371,2,454,1),
(18372,2,455,1),
(18373,2,456,1),
(18374,2,457,1),
(18375,2,458,1),
(18376,2,459,1),
(18377,2,460,1),
(18378,2,461,1),
(18379,2,500,1),
(18380,2,501,1),
(18381,2,502,1),
(18382,2,503,1),
(18383,2,504,1),
(18384,2,505,1),
(18385,2,550,1),
(18386,2,551,1),
(18387,2,552,1),
(18388,2,553,1),
(18389,2,554,1),
(18390,2,555,1),
(18391,2,600,1),
(18392,2,601,1),
(18393,2,602,1),
(18394,2,603,1),
(18395,2,650,1),
(18396,2,651,1),
(18397,2,652,1),
(18398,2,653,1),
(18399,2,654,1),
(18400,2,655,1),
(18401,2,656,1),
(18402,2,657,1),
(18403,2,658,1),
(18404,2,700,1),
(18405,2,701,1),
(18406,2,702,1),
(18407,2,703,1),
(18408,2,704,1),
(18409,2,705,1),
(18410,2,706,1),
(18411,2,707,1),
(18412,2,708,1),
(18413,2,750,1),
(18414,2,751,1),
(18415,2,752,1),
(18416,2,753,1),
(18417,2,754,1),
(18418,2,800,1),
(18419,2,801,1),
(18420,2,802,1),
(18421,2,803,1),
(18422,2,850,1),
(18423,2,851,1),
(18424,2,852,1),
(18425,2,853,1),
(18426,2,854,1),
(18427,2,900,1),
(18428,2,901,1),
(18429,2,902,1),
(18430,2,903,1),
(18431,2,904,1),
(18432,2,950,1),
(18433,2,951,1),
(18434,2,952,1),
(18435,2,953,1),
(18436,2,954,1),
(18437,2,955,1),
(18438,2,956,1),
(18439,2,957,1),
(18440,2,958,1),
(18441,2,959,1),
(18442,2,1000,1),
(18443,2,1001,1),
(18444,2,1002,1),
(18445,2,1003,1),
(18446,2,1004,1),
(18447,2,1050,1),
(18448,2,1051,1),
(18449,2,1052,1),
(18450,2,1053,1),
(18451,2,1054,1),
(18452,2,1055,1),
(18453,2,1056,1),
(18454,2,1057,1),
(18455,2,1058,1),
(18456,2,1059,1),
(18457,2,1060,1),
(18458,2,1075,1),
(18459,2,1076,1),
(18460,2,1077,1),
(18461,2,1078,1),
(18462,2,1079,1),
(18463,2,1080,1),
(18464,2,1081,1),
(18465,2,1082,1),
(18466,2,1083,1),
(18467,2,1100,1),
(18468,2,1101,1),
(18469,2,1102,1),
(18470,2,1103,1),
(18471,2,1104,1),
(18472,2,1150,1),
(18473,2,1151,1),
(18474,2,1152,1),
(18475,2,1153,1),
(18476,2,1154,1),
(18477,2,1200,1),
(18478,2,1201,1),
(18479,2,1202,1),
(18480,2,1203,1),
(18481,2,1204,1),
(18482,2,1230,1),
(18483,2,1231,1),
(18484,2,1232,1),
(18485,2,1233,1),
(18486,2,1234,1),
(18487,2,1235,1),
(18488,2,1250,1),
(18489,2,1251,1),
(18490,2,1252,1),
(18491,2,1253,1),
(18492,2,1300,1),
(18493,2,1301,1),
(18494,2,1302,1),
(18495,2,1303,1),
(18496,2,1304,1),
(18497,2,1305,1),
(18498,2,1350,1),
(18499,2,1351,1),
(18500,2,1352,1),
(18501,2,1353,1),
(18502,2,1354,1),
(18503,2,1355,1),
(18504,2,1400,1),
(18505,2,1401,1),
(18506,2,1402,1),
(18507,2,1403,1),
(18508,2,1404,1),
(18509,2,1405,1),
(18510,2,1406,1),
(18511,2,1407,1),
(18512,2,1408,1),
(18513,2,1409,1),
(18514,2,1450,1),
(18515,2,1451,1),
(18516,2,1452,1),
(18517,2,1453,1),
(18518,2,1454,1),
(18519,2,1455,1),
(18520,2,1456,1),
(18521,2,1457,1),
(18522,2,1500,1),
(18523,2,1501,1),
(18524,2,1502,1),
(18525,2,1503,1),
(18526,2,1504,1),
(18527,2,1550,1),
(18528,2,1551,1),
(18529,2,1552,1),
(18530,2,1553,1),
(18531,2,1554,1),
(18532,2,1600,1),
(18533,2,1601,1),
(18534,2,1602,1),
(18535,2,1603,1),
(18536,2,1604,1),
(18537,2,1605,1),
(18538,2,1650,1),
(18539,2,1651,1),
(18540,2,1652,1),
(18541,2,1675,1),
(18542,2,1676,1),
(18543,2,1677,1),
(18544,2,1678,1),
(18545,2,1725,1),
(18546,2,1726,1),
(18547,2,1727,1),
(18548,2,1728,1),
(18549,2,1729,1),
(18550,2,1730,1),
(18551,2,1731,1),
(18552,2,1732,1),
(18553,2,1750,1),
(18554,2,1751,1),
(18555,2,1752,1),
(18556,2,1753,1),
(18557,2,1754,1),
(18558,2,1775,1),
(18559,2,1776,1),
(18560,2,1777,1),
(18561,2,1778,1),
(18562,2,1779,1),
(18563,2,1780,1),
(18564,2,1781,1),
(18565,2,1800,1),
(18566,2,1801,1),
(18567,2,1802,1),
(18568,2,1803,1),
(18569,2,1804,1),
(18570,2,1805,1),
(18571,2,1806,1),
(18572,2,1807,1),
(18573,2,1808,1),
(18574,2,1809,1),
(18575,2,1810,1),
(18576,2,1811,1),
(18577,2,1812,1),
(18578,2,1813,1),
(18579,2,1814,1),
(18580,2,1815,1),
(18581,2,1816,1),
(18582,2,1817,1),
(18583,2,1818,1),
(18584,2,1819,1),
(18585,2,1820,1),
(18586,2,1821,1),
(18587,2,1822,1),
(18588,2,1823,1),
(18589,2,1824,1),
(18590,2,1825,1),
(18591,2,1826,1),
(18592,2,1827,1),
(18593,2,1828,1),
(18594,2,1829,1),
(18595,2,1830,1),
(18596,2,1831,1),
(18597,2,1832,1),
(18598,2,1833,1),
(18599,2,1834,1),
(18600,2,1835,1),
(18601,2,1836,1),
(18602,2,1837,1),
(18603,2,1838,1),
(18604,2,1850,1),
(18605,2,1851,1),
(18606,2,1852,1),
(18607,2,1853,1),
(18608,2,1875,1),
(18609,2,1876,1),
(18610,2,1877,1),
(18611,2,1900,1),
(18612,2,1901,1),
(18613,2,1902,1),
(18614,2,1903,1),
(18615,2,1904,1),
(18616,2,1905,1),
(18617,2,1925,1),
(18618,2,1926,1),
(18619,2,1927,1),
(18620,2,1928,1),
(18621,2,1929,1),
(18622,2,1930,1),
(18623,2,1931,1),
(18624,2,1932,1),
(18625,2,1933,1),
(18626,2,1934,1),
(18627,2,1950,1),
(18628,2,1951,1),
(18629,2,1952,1),
(18630,2,1953,1),
(18631,2,1954,1),
(18632,2,1975,1),
(18633,2,1976,1),
(18634,2,1977,1),
(18635,2,1978,1),
(18636,2,1979,1),
(18637,2,2000,1),
(18638,2,2001,1),
(18639,2,2015,1),
(18640,2,2016,1),
(18641,2,2017,1),
(18642,2,2018,1),
(18643,2,2019,1),
(18644,2,2020,1),
(18645,2,2021,1),
(18646,2,2030,1),
(18647,2,2031,1),
(18648,2,2032,1),
(18649,2,2050,1),
(18650,2,2051,1),
(18651,2,2052,1),
(18652,2,2053,1),
(18653,2,2054,1),
(18654,2,2055,1),
(18655,2,2070,1),
(18656,2,2071,1),
(18657,2,2072,1),
(18658,2,2073,1),
(18659,2,2074,1),
(18660,2,2075,1),
(18661,2,2076,1),
(18662,2,2077,1),
(18663,2,2078,1),
(18664,2,2079,1),
(18665,2,2080,1),
(18666,2,2081,1),
(18667,2,2090,1),
(18668,2,2091,1),
(18669,2,2092,1),
(18670,2,2093,1),
(18671,2,3000,1),
(18672,2,3001,1),
(18673,2,3010,1),
(18674,2,3011,1),
(18675,2,3012,1),
(18676,2,3013,1),
(18677,2,3020,1),
(18678,2,3021,1),
(18679,2,3022,1),
(18680,2,3023,1),
(18681,2,3024,1),
(18682,2,3025,1),
(18683,2,3030,1),
(18684,2,3031,1),
(18685,2,3032,1),
(18686,2,3033,1),
(18687,2,3034,1),
(18688,2,3035,1),
(18689,2,3040,1),
(18690,2,3041,1),
(18691,2,3042,1),
(18692,2,3043,1),
(18693,2,3044,1),
(18694,2,3045,1),
(18695,2,3046,1),
(18696,2,3050,1),
(18697,2,3051,1),
(18698,2,3052,1),
(18699,2,3053,1),
(18700,2,3054,1),
(18701,2,3055,1),
(18702,2,3056,1),
(18703,2,3060,1),
(18704,2,3061,1),
(18705,2,3062,1),
(18706,2,3063,1),
(18707,2,3064,1),
(18708,2,3070,1),
(18709,2,3071,1),
(18710,2,3072,1),
(18711,2,3080,1),
(18712,2,3081,1),
(18713,2,3082,1),
(18714,2,3083,1),
(18715,2,3084,1),
(18716,2,3090,1),
(18717,2,3091,1),
(18718,2,3092,1),
(18719,2,3093,1),
(18720,2,3100,1),
(18721,2,3101,1),
(18722,2,3102,1),
(18723,2,3103,1),
(18724,2,3104,1),
(18725,2,3110,1),
(18726,2,3111,1),
(18727,2,3120,1),
(18728,2,3121,1),
(18729,2,3122,1),
(18730,2,3123,1),
(18731,2,3130,1),
(18732,2,3131,1),
(18733,3,100001,1),
(18734,3,100002,1),
(18735,3,100003,1),
(18736,3,100004,1),
(18737,3,100005,1),
(18738,3,100010,1),
(18739,3,100011,1),
(18740,3,100012,1),
(18741,3,100013,1),
(18742,3,100014,1),
(18743,3,100020,1),
(18744,3,100021,1),
(18745,3,100022,1),
(18746,3,100023,1),
(18747,3,100024,1),
(18748,3,100025,1),
(18749,3,100026,1),
(18750,3,100027,1),
(18751,3,100028,1),
(18752,3,100029,1),
(18753,3,100030,1),
(18754,3,100031,1),
(18755,3,100032,1),
(18756,3,100033,1),
(18757,3,100034,1),
(18758,3,100035,1),
(18759,3,100040,1),
(18760,3,100041,1),
(18761,3,100042,1),
(18762,3,100043,1),
(18763,3,100044,1),
(18764,3,100045,1),
(18765,3,100050,1),
(18766,3,100051,1),
(18767,3,100052,1),
(18768,3,100053,1),
(18769,3,100054,1),
(18770,3,100055,1),
(18771,3,100060,1),
(18772,3,100061,1),
(18773,3,100062,1),
(18774,3,100063,1),
(18775,3,100070,1),
(18776,3,100071,1),
(18777,3,100072,1),
(18778,3,100073,1),
(18779,3,100080,1),
(18780,3,100081,1),
(18781,3,100082,1),
(18782,3,100083,1),
(18783,3,100084,1),
(18784,3,100085,1),
(18785,3,100086,1),
(18786,3,100090,1),
(18787,3,100091,1),
(18788,3,100092,1),
(18789,3,100093,1),
(18790,3,100100,1),
(18791,3,100101,1),
(18792,3,100102,1),
(18793,3,100103,1),
(18794,3,100104,1),
(18795,3,100105,1),
(18796,3,100106,1),
(18797,3,100107,1),
(18798,3,100120,1),
(18799,3,100121,1),
(18800,3,100122,1),
(18801,3,100123,1),
(18802,3,100124,1),
(18803,3,100125,1),
(18804,3,100126,1),
(18805,3,100127,1),
(18806,3,100140,1),
(18807,3,100141,1),
(18808,3,100142,1),
(18809,3,100143,1),
(18810,3,100160,1),
(18811,3,100161,1),
(18812,3,100162,1),
(18813,3,100163,1),
(18814,3,100164,1),
(18815,3,100165,1),
(18816,3,100166,1),
(18817,3,100167,1),
(18818,3,100180,1),
(18819,3,100181,1),
(18820,3,100182,1),
(18821,3,100183,1),
(18822,3,100184,1),
(18823,3,100200,1),
(18824,3,100201,1),
(18825,3,100202,1),
(18826,3,100203,1),
(18827,3,100204,1),
(18828,3,100220,1),
(18829,3,100221,1),
(18830,3,100222,1),
(18831,3,100223,1),
(18832,3,100224,1),
(18833,3,100225,1),
(18834,3,100240,1),
(18835,3,100241,1),
(18836,3,100260,1),
(18837,3,100261,1),
(18838,3,100280,1),
(18839,3,100281,1),
(18840,3,100300,1),
(18841,3,100301,1),
(18842,3,100302,1),
(18843,3,100303,1),
(19607,9,1,1),
(19608,9,2,1),
(19609,9,3,1),
(19610,9,4,1),
(19611,9,5,1),
(19612,9,6,1),
(19613,9,7,1),
(19614,9,8,1),
(19615,9,9,1),
(19616,9,10,1),
(19617,9,11,1),
(19618,9,12,1),
(19619,9,13,1),
(19620,9,14,1),
(19621,9,15,1),
(19622,9,16,1),
(19623,9,17,1),
(19624,9,25,1),
(19625,9,26,1),
(19626,9,100,1),
(19627,9,101,1),
(19628,9,102,1),
(19629,9,103,1),
(19630,9,104,1),
(19631,9,105,1),
(19632,9,106,1),
(19633,9,107,1),
(19634,9,108,1),
(19635,9,109,1),
(19636,9,110,1),
(19637,9,111,1),
(19638,9,112,1),
(19639,9,113,1),
(19640,9,114,1),
(19641,9,115,1),
(19642,9,116,1),
(19643,9,117,1),
(19644,9,118,1),
(19645,9,150,1),
(19646,9,151,1),
(19647,9,152,1),
(19648,9,153,1),
(19649,9,154,1),
(19650,9,155,1),
(19651,9,156,1),
(19652,9,157,1),
(19653,9,158,1),
(19654,9,159,1),
(19655,9,160,1),
(19656,9,161,1),
(19657,9,162,1),
(19658,9,163,1),
(19659,9,164,1),
(19660,9,165,1),
(19661,9,166,1),
(19662,9,167,1),
(19663,9,200,1),
(19664,9,201,1),
(19665,9,202,1),
(19666,9,203,1),
(19667,9,204,1),
(19668,9,205,1),
(19669,9,206,1),
(19670,9,207,1),
(19671,9,208,1),
(19672,9,350,1),
(19673,9,351,1),
(19674,9,352,1),
(19675,9,353,1),
(19676,9,354,1),
(19677,9,355,1),
(19678,9,356,1),
(19679,9,357,1),
(19680,9,400,1),
(19681,9,401,1),
(19682,9,402,1),
(19683,9,403,1),
(19684,9,404,1),
(19685,9,405,1),
(19686,9,450,1),
(19687,9,451,1),
(19688,9,452,1),
(19689,9,453,1),
(19690,9,454,1),
(19691,9,455,1),
(19692,9,456,1),
(19693,9,457,1),
(19694,9,458,1),
(19695,9,459,1),
(19696,9,460,1),
(19697,9,461,1),
(19698,9,1850,1),
(19699,9,1851,1),
(19700,9,1852,1),
(19701,9,1853,1),
(19702,9,1925,1),
(19703,9,1926,1),
(19704,9,1927,1),
(19705,9,1928,1),
(19706,9,1929,1),
(19707,9,1930,1),
(19708,9,1931,1),
(19709,9,1932,1),
(19710,9,1933,1),
(19711,9,1934,1),
(19712,9,2015,1),
(19713,9,2016,1),
(19714,9,2017,1),
(19715,9,2018,1),
(19716,9,2019,1),
(19717,9,2020,1),
(19718,9,2021,1),
(19888,1,100001,1),
(19889,1,100002,1),
(19890,1,100010,1),
(19891,1,100011,1),
(19892,1,100020,1),
(19893,1,100021,1),
(19894,1,100024,1),
(19895,1,100025,1),
(19896,1,100026,1),
(19897,1,100027,1),
(19898,1,100028,1),
(19899,1,100029,1),
(19900,1,100030,1),
(19901,1,100031,1),
(19902,1,100034,1),
(19903,1,100035,1),
(19904,1,100060,1),
(19905,1,100061,1),
(19906,1,100062,1),
(19907,1,100063,1),
(19908,1,100080,1),
(19909,1,100081,1),
(19910,1,100082,1),
(19911,1,100083,1),
(19912,1,100084,1),
(19913,1,100085,1),
(19914,1,100086,1),
(19915,1,100090,1),
(19916,1,100091,1),
(19917,1,100092,1),
(19918,1,100093,1),
(19919,1,100120,1),
(19920,1,100121,1),
(19921,1,100122,1),
(19922,1,100123,1),
(19923,1,100124,1),
(19924,1,100140,1),
(19925,1,100141,1),
(19926,1,100180,1),
(19927,1,100181,1),
(19928,1,100182,1),
(19929,1,100183,1),
(19930,1,100184,1),
(19931,1,100220,1),
(19932,1,100221,1),
(19933,1,100222,1),
(19934,1,100223,1),
(19935,1,100224,1),
(19936,1,100225,1),
(19937,1,100280,1),
(19938,1,100281,1),
(19939,1,100300,1),
(19940,1,100301,1),
(19941,1,100303,1),
(20313,4,100020,1),
(20314,4,100021,1),
(20315,4,100022,1),
(20316,4,100023,1),
(20317,4,100024,1),
(20318,4,100025,1),
(20319,4,100026,1),
(20320,4,100027,1),
(20321,4,100028,1),
(20322,4,100029,1),
(20323,4,100030,1),
(20324,4,100031,1),
(20325,4,100032,1),
(20326,4,100033,1),
(20327,4,100034,1),
(20328,4,100035,1),
(20329,4,100080,1),
(20330,4,100081,1),
(20331,4,100082,1),
(20332,4,100083,1),
(20333,4,100084,1),
(20334,4,100085,1),
(20335,4,100086,1),
(20336,4,100090,1),
(20337,4,100091,1),
(20338,4,100092,1),
(20339,4,100093,1),
(20340,4,100120,1),
(20341,4,100121,1),
(20342,4,100122,1),
(20343,4,100140,1),
(20344,4,100141,1),
(20345,4,100142,1),
(20346,4,100143,1),
(20347,4,100180,1),
(20348,4,100181,1),
(20349,4,100182,1),
(20350,4,100183,1),
(20351,4,100184,1),
(20352,4,100280,1),
(20353,4,100281,1),
(20354,4,100300,1),
(20355,4,100301,1),
(20356,4,100302,1),
(20357,4,100303,1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `prerequisite_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `prerequisites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `prerequisite_id` (`prerequisite_id`),
  CONSTRAINT `prerequisite_id` FOREIGN KEY (`prerequisite_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prerequisites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_badge_contents`
--

DROP TABLE IF EXISTS `product_badge_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_badge_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_badge_id` int(10) unsigned NOT NULL,
  `targetable_id` int(10) unsigned NOT NULL,
  `targetable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_badge_contents_product_badge_id_foreign` (`product_badge_id`),
  CONSTRAINT `product_badge_contents_product_badge_id_foreign` FOREIGN KEY (`product_badge_id`) REFERENCES `product_badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_badge_contents`
--

LOCK TABLES `product_badge_contents` WRITE;
/*!40000 ALTER TABLE `product_badge_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_badge_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_badge_translations`
--

DROP TABLE IF EXISTS `product_badge_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_badge_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_badge_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_badge_translations_product_badge_id_foreign` (`product_badge_id`),
  KEY `product_badge_translations_locale_index` (`locale`),
  CONSTRAINT `product_badge_translations_product_badge_id_foreign` FOREIGN KEY (`product_badge_id`) REFERENCES `product_badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_badge_translations`
--

LOCK TABLES `product_badge_translations` WRITE;
/*!40000 ALTER TABLE `product_badge_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_badge_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_badges`
--

DROP TABLE IF EXISTS `product_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `start_at` bigint(20) unsigned DEFAULT NULL,
  `end_at` bigint(20) unsigned DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_badges`
--

LOCK TABLES `product_badges` WRITE;
/*!40000 ALTER TABLE `product_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_translations`
--

DROP TABLE IF EXISTS `product_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `product_category_translations_locale_index` (`locale`),
  CONSTRAINT `product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_translations`
--

LOCK TABLES `product_category_translations` WRITE;
/*!40000 ALTER TABLE `product_category_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_discounts`
--

DROP TABLE IF EXISTS `product_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percent` int(10) unsigned NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `start_date` int(10) unsigned NOT NULL,
  `end_date` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_discounts_creator_id_foreign` (`creator_id`),
  KEY `product_discounts_product_id_foreign` (`product_id`),
  CONSTRAINT `product_discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discounts`
--

LOCK TABLES `product_discounts` WRITE;
/*!40000 ALTER TABLE `product_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_faq_translations`
--

DROP TABLE IF EXISTS `product_faq_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_faq_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_faq_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_faq_id` (`product_faq_id`),
  KEY `product_faq_translations_locale_index` (`locale`),
  CONSTRAINT `product_faq_id` FOREIGN KEY (`product_faq_id`) REFERENCES `product_faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_faq_translations`
--

LOCK TABLES `product_faq_translations` WRITE;
/*!40000 ALTER TABLE `product_faq_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_faq_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_faqs`
--

DROP TABLE IF EXISTS `product_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_faqs_product_id_foreign` (`product_id`),
  KEY `product_faqs_creator_id_foreign` (`creator_id`),
  CONSTRAINT `product_faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_faqs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_faqs`
--

LOCK TABLES `product_faqs` WRITE;
/*!40000 ALTER TABLE `product_faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_file_translations`
--

DROP TABLE IF EXISTS `product_file_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_file_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_file_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_file_id` (`product_file_id`),
  KEY `product_file_translations_locale_index` (`locale`),
  CONSTRAINT `product_file_id` FOREIGN KEY (`product_file_id`) REFERENCES `product_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_file_translations`
--

LOCK TABLES `product_file_translations` WRITE;
/*!40000 ALTER TABLE `product_file_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_file_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_files`
--

DROP TABLE IF EXISTS `product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `online_viewer` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_product_id` (`product_id`),
  KEY `file_creator_id` (`creator_id`),
  CONSTRAINT `file_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_files`
--

LOCK TABLES `product_files` WRITE;
/*!40000 ALTER TABLE `product_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filter_option_translations`
--

DROP TABLE IF EXISTS `product_filter_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_filter_option_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_filter_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_option_id` (`product_filter_option_id`),
  KEY `product_filter_option_translations_locale_index` (`locale`),
  CONSTRAINT `product_filter_option_id` FOREIGN KEY (`product_filter_option_id`) REFERENCES `product_filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filter_option_translations`
--

LOCK TABLES `product_filter_option_translations` WRITE;
/*!40000 ALTER TABLE `product_filter_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filter_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filter_options`
--

DROP TABLE IF EXISTS `product_filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_filter_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_options_filter_id_foreign` (`filter_id`),
  CONSTRAINT `product_filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `product_filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filter_options`
--

LOCK TABLES `product_filter_options` WRITE;
/*!40000 ALTER TABLE `product_filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filter_translations`
--

DROP TABLE IF EXISTS `product_filter_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_filter_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_filter_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_id` (`product_filter_id`),
  KEY `product_filter_translations_locale_index` (`locale`),
  CONSTRAINT `product_filter_id` FOREIGN KEY (`product_filter_id`) REFERENCES `product_filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filter_translations`
--

LOCK TABLES `product_filter_translations` WRITE;
/*!40000 ALTER TABLE `product_filter_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filter_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filters`
--

DROP TABLE IF EXISTS `product_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filters_category_id_foreign` (`category_id`),
  CONSTRAINT `product_filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filters`
--

LOCK TABLES `product_filters` WRITE;
/*!40000 ALTER TABLE `product_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_media`
--

DROP TABLE IF EXISTS `product_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `type` enum('thumbnail','image','video') NOT NULL,
  `path` varchar(255) NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_product_id` (`product_id`),
  KEY `media_creator_id` (`creator_id`),
  CONSTRAINT `media_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_media`
--

LOCK TABLES `product_media` WRITE;
/*!40000 ALTER TABLE `product_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `seller_id` int(10) unsigned NOT NULL,
  `buyer_id` int(10) unsigned DEFAULT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `installment_order_id` int(10) unsigned DEFAULT NULL,
  `gift_id` int(10) unsigned DEFAULT NULL,
  `specifications` text DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `discount_id` int(10) unsigned DEFAULT NULL,
  `message_to_seller` text DEFAULT NULL,
  `tracking_code` varchar(255) DEFAULT NULL,
  `status` enum('pending','waiting_delivery','shipped','success','canceled') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_orders_installment_order_id_foreign` (`installment_order_id`),
  KEY `product_orders_gift_id_foreign` (`gift_id`),
  CONSTRAINT `product_orders_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_orders_installment_order_id_foreign` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `product_quality` int(10) unsigned NOT NULL,
  `purchase_worth` int(10) unsigned NOT NULL,
  `delivery_quality` int(10) unsigned NOT NULL,
  `seller_quality` int(10) unsigned NOT NULL,
  `rates` char(10) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `status` enum('pending','active') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_creator_id_foreign` (`creator_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_filter_options`
--

DROP TABLE IF EXISTS `product_selected_filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_selected_filter_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_filter_options_product_id_foreign` (`product_id`),
  KEY `product_selected_filter_options_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `product_selected_filter_options_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `product_filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_filter_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_filter_options`
--

LOCK TABLES `product_selected_filter_options` WRITE;
/*!40000 ALTER TABLE `product_selected_filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_specification_multi_values`
--

DROP TABLE IF EXISTS `product_selected_specification_multi_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_selected_specification_multi_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `selected_specification_id` int(10) unsigned NOT NULL,
  `specification_multi_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_specification_id` (`selected_specification_id`),
  KEY `specification_multi_value_id` (`specification_multi_value_id`),
  CONSTRAINT `selected_specification_id` FOREIGN KEY (`selected_specification_id`) REFERENCES `product_selected_specifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `specification_multi_value_id` FOREIGN KEY (`specification_multi_value_id`) REFERENCES `product_specification_multi_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_specification_multi_values`
--

LOCK TABLES `product_selected_specification_multi_values` WRITE;
/*!40000 ALTER TABLE `product_selected_specification_multi_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_specification_multi_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_specification_translations`
--

DROP TABLE IF EXISTS `product_selected_specification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_selected_specification_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_selected_specification_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_specification_id_translations` (`product_selected_specification_id`),
  KEY `product_selected_specification_translations_locale_index` (`locale`),
  CONSTRAINT `product_selected_specification_id_translations` FOREIGN KEY (`product_selected_specification_id`) REFERENCES `product_selected_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_specification_translations`
--

LOCK TABLES `product_selected_specification_translations` WRITE;
/*!40000 ALTER TABLE `product_selected_specification_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_specification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_specifications`
--

DROP TABLE IF EXISTS `product_selected_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_selected_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_specification_id` int(10) unsigned NOT NULL,
  `type` enum('textarea','multi_value') NOT NULL,
  `allow_selection` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_specifications_creator_id_foreign` (`creator_id`),
  KEY `product_selected_specifications_product_id_foreign` (`product_id`),
  KEY `product_selected_specifications_product_specification_id_foreign` (`product_specification_id`),
  CONSTRAINT `product_selected_specifications_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_specifications_product_specification_id_foreign` FOREIGN KEY (`product_specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_specifications`
--

LOCK TABLES `product_selected_specifications` WRITE;
/*!40000 ALTER TABLE `product_selected_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_categories`
--

DROP TABLE IF EXISTS `product_specification_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specification_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specification_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_categories_specification_id_foreign` (`specification_id`),
  KEY `product_specification_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_specification_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_specification_categories_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_categories`
--

LOCK TABLES `product_specification_categories` WRITE;
/*!40000 ALTER TABLE `product_specification_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_multi_value_translations`
--

DROP TABLE IF EXISTS `product_specification_multi_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specification_multi_value_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_specification_multi_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_multi_value_id` (`product_specification_multi_value_id`),
  KEY `product_specification_multi_value_translations_locale_index` (`locale`),
  CONSTRAINT `product_specification_multi_value_id` FOREIGN KEY (`product_specification_multi_value_id`) REFERENCES `product_specification_multi_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_multi_value_translations`
--

LOCK TABLES `product_specification_multi_value_translations` WRITE;
/*!40000 ALTER TABLE `product_specification_multi_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_multi_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_multi_values`
--

DROP TABLE IF EXISTS `product_specification_multi_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specification_multi_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_multi_values_specification_id_foreign` (`specification_id`),
  CONSTRAINT `product_specification_multi_values_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_multi_values`
--

LOCK TABLES `product_specification_multi_values` WRITE;
/*!40000 ALTER TABLE `product_specification_multi_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_multi_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_translations`
--

DROP TABLE IF EXISTS `product_specification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specification_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_specification_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_id` (`product_specification_id`),
  KEY `product_specification_translations_locale_index` (`locale`),
  CONSTRAINT `product_specification_id` FOREIGN KEY (`product_specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_translations`
--

LOCK TABLES `product_specification_translations` WRITE;
/*!40000 ALTER TABLE `product_specification_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specifications`
--

DROP TABLE IF EXISTS `product_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `input_type` enum('textarea','multi_value') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specifications`
--

LOCK TABLES `product_specifications` WRITE;
/*!40000 ALTER TABLE `product_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_translations`
--

DROP TABLE IF EXISTS `product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_description` text DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_translations_locale_index` (`locale`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translations`
--

LOCK TABLES `product_translations` WRITE;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `type` enum('virtual','physical') NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `price` double(15,2) unsigned DEFAULT NULL,
  `point` bigint(20) unsigned DEFAULT NULL,
  `unlimited_inventory` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` tinyint(1) NOT NULL DEFAULT 0,
  `inventory` int(10) unsigned DEFAULT NULL,
  `inventory_warning` int(10) unsigned DEFAULT NULL,
  `inventory_updated_at` bigint(20) unsigned DEFAULT NULL,
  `delivery_fee` double(15,2) unsigned DEFAULT NULL,
  `delivery_estimated_time` int(10) unsigned DEFAULT NULL,
  `message_for_reviewer` text DEFAULT NULL,
  `tax` int(10) unsigned DEFAULT NULL,
  `commission_type` enum('percent','fixed_amount') NOT NULL,
  `commission` int(10) unsigned DEFAULT NULL,
  `status` enum('active','pending','draft','inactive') NOT NULL,
  `updated_at` bigint(20) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_creator_id_foreign` (`creator_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_type_index` (`type`),
  KEY `products_slug_index` (`slug`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_translations`
--

DROP TABLE IF EXISTS `promotion_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_translations_promotion_id_foreign` (`promotion_id`),
  KEY `promotion_translations_locale_index` (`locale`),
  CONSTRAINT `promotion_translations_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_translations`
--

LOCK TABLES `promotion_translations` WRITE;
/*!40000 ALTER TABLE `promotion_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days` int(10) unsigned NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `icon` varchar(255) NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_notification_histories`
--

DROP TABLE IF EXISTS `purchase_notification_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_notification_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `purchase_notification_id` int(10) unsigned NOT NULL,
  `display_type` enum('overall','per_session') NOT NULL,
  `count_view` int(10) unsigned NOT NULL DEFAULT 0,
  `session_ended` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Get True After the user login, we update all the per_session records',
  PRIMARY KEY (`id`),
  KEY `purchase_notification_id_history` (`purchase_notification_id`),
  KEY `purchase_notification_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `purchase_notification_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_id_history` FOREIGN KEY (`purchase_notification_id`) REFERENCES `purchase_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_notification_histories`
--

LOCK TABLES `purchase_notification_histories` WRITE;
/*!40000 ALTER TABLE `purchase_notification_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_notification_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_notification_roles_groups_contents`
--

DROP TABLE IF EXISTS `purchase_notification_roles_groups_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_notification_roles_groups_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_notification_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_notification_id_role_group` (`purchase_notification_id`),
  KEY `purchase_notification_roles_groups_contents_role_id_foreign` (`role_id`),
  KEY `purchase_notification_roles_groups_contents_group_id_foreign` (`group_id`),
  KEY `purchase_notification_roles_groups_contents_webinar_id_foreign` (`webinar_id`),
  KEY `purchase_notification_roles_groups_contents_bundle_id_foreign` (`bundle_id`),
  KEY `purchase_notification_roles_groups_contents_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_notification_id_role_group` FOREIGN KEY (`purchase_notification_id`) REFERENCES `purchase_notifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_notification_roles_groups_contents`
--

LOCK TABLES `purchase_notification_roles_groups_contents` WRITE;
/*!40000 ALTER TABLE `purchase_notification_roles_groups_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_notification_roles_groups_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_notification_translations`
--

DROP TABLE IF EXISTS `purchase_notification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_notification_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_notification_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  `popup_title` varchar(255) NOT NULL,
  `popup_subtitle` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `times` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_notification_id_trans` (`purchase_notification_id`),
  KEY `purchase_notification_translations_locale_index` (`locale`),
  CONSTRAINT `purchase_notification_id_trans` FOREIGN KEY (`purchase_notification_id`) REFERENCES `purchase_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_notification_translations`
--

LOCK TABLES `purchase_notification_translations` WRITE;
/*!40000 ALTER TABLE `purchase_notification_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_notification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_notifications`
--

DROP TABLE IF EXISTS `purchase_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_at` bigint(20) DEFAULT NULL,
  `end_at` bigint(20) DEFAULT NULL,
  `popup_duration` int(10) unsigned DEFAULT NULL,
  `popup_delay` int(10) unsigned DEFAULT NULL,
  `maximum_purchase_amount` int(10) unsigned DEFAULT NULL,
  `maximum_community_age` int(10) unsigned DEFAULT NULL,
  `display_type` enum('overall','per_session') NOT NULL,
  `display_time` int(10) unsigned DEFAULT NULL,
  `display_for_logged_out_users` tinyint(1) NOT NULL DEFAULT 0,
  `enable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_notifications`
--

LOCK TABLES `purchase_notifications` WRITE;
/*!40000 ALTER TABLE `purchase_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchases_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `purchases_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_translations`
--

DROP TABLE IF EXISTS `quiz_question_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quizzes_question_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `correct` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_translations_quiz_question_id_foreign` (`quizzes_question_id`),
  KEY `quiz_question_translations_locale_index` (`locale`),
  CONSTRAINT `quiz_question_translations_quiz_question_id_foreign` FOREIGN KEY (`quizzes_question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_translations`
--

LOCK TABLES `quiz_question_translations` WRITE;
/*!40000 ALTER TABLE `quiz_question_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_translations`
--

DROP TABLE IF EXISTS `quiz_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_translations_quiz_id_foreign` (`quiz_id`),
  KEY `quiz_translations_locale_index` (`locale`),
  CONSTRAINT `quiz_translations_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_translations`
--

LOCK TABLES `quiz_translations` WRITE;
/*!40000 ALTER TABLE `quiz_translations` DISABLE KEYS */;
INSERT INTO `quiz_translations` VALUES
(24,47,'en','test');
/*!40000 ALTER TABLE `quiz_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `time` int(11) DEFAULT 0,
  `attempt` int(11) DEFAULT NULL,
  `pass_mark` int(11) NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `total_mark` int(10) unsigned DEFAULT NULL,
  `display_limited_questions` tinyint(1) NOT NULL DEFAULT 0,
  `display_number_of_questions` int(10) unsigned DEFAULT NULL,
  `display_questions_randomly` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_days` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `quizzes_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `quizzes_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `quizzes_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES
(47,2092,1072,NULL,30,3,2,1,'active',NULL,0,NULL,1,5,1741950604,NULL);
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions`
--

DROP TABLE IF EXISTS `quizzes_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `grade` varchar(255) NOT NULL,
  `type` enum('multiple','descriptive') NOT NULL,
  `image` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_questions_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `quizzes_questions_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `quizzes_questions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions`
--

LOCK TABLES `quizzes_questions` WRITE;
/*!40000 ALTER TABLE `quizzes_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions_answer_translations`
--

DROP TABLE IF EXISTS `quizzes_questions_answer_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_questions_answer_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quizzes_questions_answer_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_questions_answer_id` (`quizzes_questions_answer_id`),
  KEY `quizzes_questions_answer_translations_locale_index` (`locale`),
  CONSTRAINT `quizzes_questions_answer_id` FOREIGN KEY (`quizzes_questions_answer_id`) REFERENCES `quizzes_questions_answers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions_answer_translations`
--

LOCK TABLES `quizzes_questions_answer_translations` WRITE;
/*!40000 ALTER TABLE `quizzes_questions_answer_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_questions_answer_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions_answers`
--

DROP TABLE IF EXISTS `quizzes_questions_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_questions_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `image` text DEFAULT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_questions_answers_question_id_foreign` (`question_id`) USING BTREE,
  KEY `quizzes_questions_answers_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `quizzes_questions_answers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_questions_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions_answers`
--

LOCK TABLES `quizzes_questions_answers` WRITE;
/*!40000 ALTER TABLE `quizzes_questions_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_questions_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_results`
--

DROP TABLE IF EXISTS `quizzes_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `results` text DEFAULT NULL,
  `user_grade` int(11) DEFAULT NULL,
  `status` enum('passed','failed','waiting') NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_results_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `quizzes_results_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `quizzes_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_results`
--

LOCK TABLES `quizzes_results` WRITE;
/*!40000 ALTER TABLE `quizzes_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rating_user_id_foreign` (`user_id`) USING BTREE,
  KEY `rating_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `rating_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `rating_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `province_id` int(10) unsigned DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `geo_center` point DEFAULT NULL,
  `type` enum('country','province','city','district') NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regions_country_id_foreign` (`country_id`),
  KEY `regions_province_id_foreign` (`province_id`),
  KEY `regions_city_id_foreign` (`city_id`),
  CONSTRAINT `regions_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `regions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `regions_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_packages`
--

DROP TABLE IF EXISTS `registration_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days` int(10) unsigned NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `icon` varchar(255) NOT NULL,
  `role` enum('instructors','organizations') NOT NULL,
  `instructors_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `courses_capacity` int(11) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `meeting_count` int(11) DEFAULT NULL,
  `product_count` int(10) unsigned DEFAULT NULL,
  `ai_content_access` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('disabled','active') NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_packages_role_index` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_packages`
--

LOCK TABLES `registration_packages` WRITE;
/*!40000 ALTER TABLE `registration_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_packages_translations`
--

DROP TABLE IF EXISTS `registration_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_packages_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_package_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_package` (`registration_package_id`),
  KEY `registration_packages_translations_locale_index` (`locale`),
  CONSTRAINT `registration_package` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_packages_translations`
--

LOCK TABLES `registration_packages_translations` WRITE;
/*!40000 ALTER TABLE `registration_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_courses`
--

DROP TABLE IF EXISTS `related_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `targetable_id` int(10) unsigned NOT NULL,
  `targetable_type` varchar(255) NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_courses_creator_id_foreign` (`creator_id`),
  KEY `related_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `related_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_courses_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_courses`
--

LOCK TABLES `related_courses` WRITE;
/*!40000 ALTER TABLE `related_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_meetings`
--

DROP TABLE IF EXISTS `reserve_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve_meetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `meeting_time_id` int(10) unsigned NOT NULL,
  `day` varchar(10) NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `start_at` bigint(20) unsigned NOT NULL,
  `end_at` bigint(20) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `paid_amount` decimal(13,2) NOT NULL,
  `meeting_type` enum('in_person','online') NOT NULL DEFAULT 'online',
  `student_count` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','open','finished','canceled') NOT NULL,
  `created_at` int(11) NOT NULL,
  `locked_at` int(11) DEFAULT NULL,
  `reserved_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `reserve_meetings_meeting_time_id_foreign` (`meeting_time_id`) USING BTREE,
  KEY `reserve_meetings_user_id_foreign` (`user_id`) USING BTREE,
  KEY `reserve_meetings_sale_id_foreign` (`sale_id`),
  CONSTRAINT `reserve_meetings_meeting_time_id_foreign` FOREIGN KEY (`meeting_time_id`) REFERENCES `meeting_times` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reserve_meetings_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reserve_meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_meetings`
--

LOCK TABLES `reserve_meetings` WRITE;
/*!40000 ALTER TABLE `reserve_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('account_charge','create_classes','buy','pass_the_quiz','certificate','comment','register','review_courses','instructor_meeting_reserve','student_meeting_reserve','newsletters','badge','referral','learning_progress_100','charge_wallet','buy_store_product','pass_assignment','send_post_in_topic','make_topic','create_blog_by_instructor','comment_for_instructor_blog') NOT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `status` enum('active','disabled') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
INSERT INTO `rewards` VALUES
(3,'charge_wallet',50,'150','active',1641205067),
(4,'account_charge',50,'100','active',1641369989),
(5,'badge',NULL,NULL,'active',1641300755),
(6,'create_classes',50,NULL,'active',1641369921),
(7,'buy',50,'10','active',1641369938),
(8,'pass_the_quiz',50,NULL,'active',1641369947),
(9,'certificate',30,NULL,'active',1641369955),
(10,'comment',5,NULL,'active',1641369968),
(11,'register',5,NULL,'active',1641370008),
(12,'review_courses',15,NULL,'active',1641370016),
(13,'instructor_meeting_reserve',30,NULL,'active',1641370026),
(14,'student_meeting_reserve',30,NULL,'active',1641370036),
(15,'newsletters',10,NULL,'active',1641370050),
(16,'referral',5,NULL,'active',1641370059),
(18,'learning_progress_100',20,NULL,'active',1641372957),
(19,'buy_store_product',50,'26','active',1648277874),
(20,'pass_assignment',50,NULL,'active',1649247227),
(21,'make_topic',1,NULL,'active',1650548269),
(22,'send_post_in_topic',1,NULL,'active',1650548278),
(23,'create_blog_by_instructor',5,NULL,'active',1650788324),
(24,'comment_for_instructor_blog',3,NULL,'active',1650788336);
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards_accounting`
--

DROP TABLE IF EXISTS `rewards_accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards_accounting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `type` enum('account_charge','create_classes','buy','pass_the_quiz','certificate','comment','register','review_courses','instructor_meeting_reserve','student_meeting_reserve','newsletters','badge','referral','learning_progress_100','charge_wallet','withdraw','buy_store_product','pass_assignment','send_post_in_topic','make_topic','create_blog_by_instructor','comment_for_instructor_blog') NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `status` enum('addiction','deduction') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rewards_accounting_user_id_foreign` (`user_id`),
  CONSTRAINT `rewards_accounting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards_accounting`
--

LOCK TABLES `rewards_accounting` WRITE;
/*!40000 ALTER TABLE `rewards_accounting` DISABLE KEYS */;
INSERT INTO `rewards_accounting` VALUES
(1,1050,NULL,'account_charge',500,'addiction',1597826952),
(2,1050,NULL,'charge_wallet',500,'addiction',1597826952);
/*!40000 ALTER TABLE `rewards_accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `caption` varchar(64) NOT NULL,
  `users_count` int(10) unsigned NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'user','Student role',0,0,1604418504),
(2,'admin','Admin role',0,1,1604418504),
(3,'organization','Organization role',0,0,1604418504),
(4,'teacher','Instructor role',0,0,1604418504),
(6,'education','Author',0,1,1613370817),
(9,'LMS_staff','sub admin',0,1,1731662538);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `buyer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `meeting_id` int(10) unsigned DEFAULT NULL,
  `meeting_time_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `installment_payment_id` int(10) unsigned DEFAULT NULL,
  `gift_id` int(10) unsigned DEFAULT NULL,
  `payment_method` enum('credit','payment_channel','subscribe') DEFAULT NULL,
  `type` enum('webinar','meeting','subscribe','promotion','registration_package','product','bundle','installment_payment','gift') NOT NULL,
  `amount` decimal(13,2) unsigned NOT NULL,
  `tax` decimal(13,2) unsigned DEFAULT NULL,
  `commission` decimal(13,2) unsigned DEFAULT NULL,
  `discount` decimal(13,2) unsigned DEFAULT NULL,
  `total_amount` decimal(13,2) unsigned DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) unsigned DEFAULT NULL,
  `manual_added` tinyint(1) NOT NULL DEFAULT 0,
  `access_to_purchased_item` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` int(10) unsigned NOT NULL,
  `refund_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sales_order_id_foreign` (`order_id`) USING BTREE,
  KEY `sales_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `sales_meeting_id_foreign` (`meeting_id`) USING BTREE,
  KEY `sales_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `sales_buyer_id_foreign` (`buyer_id`) USING BTREE,
  KEY `sales_seller_id_foreign` (`seller_id`) USING BTREE,
  KEY `sales_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `sales_installment_payment_id_foreign` (`installment_payment_id`),
  CONSTRAINT `sales_installment_payment_id_foreign` FOREIGN KEY (`installment_payment_id`) REFERENCES `installment_order_payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES
(283,1051,1050,724,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',52.00,5.20,10.40,0.00,57.20,0.00,0,1,1730818586,NULL),
(284,1051,1050,727,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',50.00,5.00,10.00,0.00,55.00,0.00,0,1,1730890461,NULL),
(285,1051,1050,728,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',50.00,5.00,10.00,0.00,55.00,0.00,0,1,1730890644,NULL),
(286,1051,1050,NULL,2028,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,0,1,1730893814,NULL),
(287,1051,1054,NULL,2028,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730895925,NULL),
(288,1051,1054,NULL,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730899205,NULL),
(291,1051,1049,NULL,2028,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730907151,NULL),
(292,1051,1049,NULL,2026,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730908689,NULL),
(293,1051,1049,NULL,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730909295,NULL),
(294,1051,1049,NULL,2024,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730969736,NULL),
(295,1051,1049,NULL,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1730975347,NULL),
(296,1051,1054,NULL,2025,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731070338,NULL),
(297,1051,1054,NULL,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731328004,NULL),
(298,1051,1049,NULL,2046,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731328078,NULL),
(299,1051,1050,NULL,2046,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731490700,NULL),
(300,1051,1050,NULL,2051,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731594629,NULL),
(301,1051,1050,NULL,2052,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731597613,NULL),
(302,1051,1054,NULL,2052,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731599713,NULL),
(303,1051,1054,NULL,2053,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1731661864,NULL),
(304,1051,1049,NULL,2057,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1732139766,NULL),
(305,NULL,1050,730,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,'credit','subscribe',50.00,5.00,0.00,NULL,55.00,NULL,0,1,1733734691,NULL),
(306,1051,1050,NULL,2060,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,'subscribe','webinar',0.00,NULL,NULL,NULL,0.00,NULL,0,1,1733734723,NULL),
(307,1051,1050,NULL,2061,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,'subscribe','webinar',0.00,NULL,NULL,NULL,0.00,NULL,0,1,1733734924,NULL),
(308,1051,1050,NULL,2023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',52.00,NULL,NULL,NULL,52.00,NULL,1,1,1734094877,NULL),
(309,1051,1050,NULL,2067,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1734096091,NULL),
(310,1051,1050,NULL,2058,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',150.00,NULL,NULL,NULL,150.00,NULL,1,1,1734339178,NULL),
(311,1051,1050,NULL,2062,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1735651319,NULL),
(312,1051,1050,NULL,2059,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',45.00,NULL,NULL,NULL,45.00,NULL,1,1,1735651392,NULL),
(313,1051,1049,NULL,2052,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',303.00,NULL,NULL,NULL,303.00,NULL,1,1,1735654733,NULL),
(314,1051,1050,NULL,2078,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',50.00,NULL,NULL,NULL,50.00,NULL,1,1,1735655955,NULL),
(315,1051,1050,NULL,2030,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',0.00,NULL,NULL,NULL,0.00,NULL,1,1,1736456625,NULL),
(316,1051,1050,NULL,2081,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',52.00,NULL,NULL,NULL,52.00,NULL,1,1,1736457630,NULL),
(317,1051,1050,NULL,2082,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',52.00,NULL,NULL,NULL,52.00,NULL,1,1,1737021021,NULL),
(318,1051,1050,NULL,2083,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',20.00,NULL,NULL,NULL,20.00,NULL,1,1,1737023878,NULL),
(319,1051,1050,NULL,2088,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',200.00,NULL,NULL,NULL,200.00,NULL,1,1,1737448825,NULL),
(320,1051,1050,NULL,2089,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',250.00,NULL,NULL,NULL,250.00,NULL,1,1,1737540227,NULL),
(321,1047,1049,NULL,2090,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',100.00,NULL,NULL,NULL,100.00,NULL,1,1,1741424063,NULL),
(322,1071,1073,NULL,2095,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',50.00,NULL,NULL,NULL,50.00,NULL,1,1,1742215345,NULL),
(323,1071,1073,NULL,2097,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',12.00,NULL,NULL,NULL,12.00,NULL,1,1,1744035760,NULL),
(324,1071,1051,NULL,2098,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'credit','webinar',250.00,NULL,NULL,NULL,250.00,NULL,1,1,1747473621,NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_log`
--

DROP TABLE IF EXISTS `sales_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `viewed_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_status_sale_id_foreign` (`sale_id`),
  CONSTRAINT `sales_status_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_log`
--

LOCK TABLES `sales_log` WRITE;
/*!40000 ALTER TABLE `sales_log` DISABLE KEYS */;
INSERT INTO `sales_log` VALUES
(139,283,1730887045),
(140,286,1730895705),
(141,285,1730895705),
(142,284,1730895705),
(143,288,1730899205),
(144,287,1730899205),
(147,291,1730907151),
(148,292,1730908690),
(149,293,1730909296),
(150,294,1730969736),
(151,295,1730975347),
(152,296,1731070339),
(153,297,1731328004),
(154,298,1731328079),
(155,299,1731490701),
(156,300,1731594630),
(157,301,1731597613),
(158,302,1731599714),
(159,303,1731661864),
(160,304,1732139766),
(161,308,1734094877),
(162,307,1734094877),
(163,306,1734094877),
(164,309,1734096091),
(165,310,1734339179),
(166,313,1735654740),
(167,312,1735654740),
(168,311,1735654741),
(169,315,1736456627),
(170,314,1736456627),
(171,316,1736457633),
(172,317,1737021024),
(173,318,1737023881),
(174,319,1737448829),
(175,320,1737540229),
(176,321,1741424064);
/*!40000 ALTER TABLE `sales_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `section_group_id` int(10) unsigned DEFAULT NULL,
  `caption` varchar(128) NOT NULL,
  `type` enum('admin','panel') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100304 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES
(1,'admin_general_dashboard',NULL,'General Dashboard','admin'),
(2,'admin_general_dashboard_show',1,'General Dashboard page','admin'),
(3,'admin_general_dashboard_quick_access_links',1,'Quick access links in General Dashboard','admin'),
(4,'admin_general_dashboard_daily_sales_statistics',1,'Daily Sales Type Statistics Section','admin'),
(5,'admin_general_dashboard_income_statistics',1,'Income Statistics Section','admin'),
(6,'admin_general_dashboard_total_sales_statistics',1,'Total Sales Statistics Section','admin'),
(7,'admin_general_dashboard_new_sales',1,'New Sales Section','admin'),
(8,'admin_general_dashboard_new_comments',1,'New Comments Section','admin'),
(9,'admin_general_dashboard_new_tickets',1,'New Tickets Section','admin'),
(10,'admin_general_dashboard_new_reviews',1,'New Reviews Section','admin'),
(11,'admin_general_dashboard_sales_statistics_chart',1,'Sales Statistics Chart','admin'),
(12,'admin_general_dashboard_recent_comments',1,'Recent comments Section','admin'),
(13,'admin_general_dashboard_recent_tickets',1,'Recent tickets Section','admin'),
(14,'admin_general_dashboard_recent_webinars',1,'Recent webinars Section','admin'),
(15,'admin_general_dashboard_recent_courses',1,'Recent courses Section','admin'),
(16,'admin_general_dashboard_users_statistics_chart',1,'Users Statistics Chart','admin'),
(17,'admin_clear_cache',1,'Clear cache','admin'),
(25,'admin_marketing_dashboard',NULL,'Marketing Dashboard','admin'),
(26,'admin_marketing_dashboard_show',25,'Marketing Dashboard page','admin'),
(50,'admin_roles',NULL,'Roles','admin'),
(51,'admin_roles_list',50,'Roles List','admin'),
(52,'admin_roles_create',50,'Roles Create','admin'),
(53,'admin_roles_edit',50,'Roles Edit','admin'),
(54,'admin_roles_delete',50,'Roles Delete','admin'),
(100,'admin_users',NULL,'Users','admin'),
(101,'admin_staffs_list',100,'Staffs list','admin'),
(102,'admin_users_list',100,'Students list','admin'),
(103,'admin_instructors_list',100,'Instructors list','admin'),
(104,'admin_organizations_list',100,'Organizations list','admin'),
(105,'admin_users_create',100,'Users Create','admin'),
(106,'admin_users_edit',100,'Users Edit','admin'),
(107,'admin_users_delete',100,'Users Delete','admin'),
(108,'admin_users_export_excel',100,'List Export excel','admin'),
(109,'admin_users_badges',100,'Users Badges','admin'),
(110,'admin_users_badges_edit',100,'Badges edit','admin'),
(111,'admin_users_badges_delete',100,'Badges delete','admin'),
(112,'admin_users_impersonate',100,'users impersonate (login by users)','admin'),
(113,'admin_become_instructors_list',100,'Lists of requests for become instructors','admin'),
(114,'admin_become_instructors_reject',100,'Reject requests for become instructors','admin'),
(115,'admin_become_instructors_delete',100,'Delete requests for become instructors','admin'),
(116,'admin_update_user_registration_package',100,'Edit user registration package','admin'),
(117,'admin_update_user_meeting_settings',100,'Edit user meeting settings','admin'),
(118,'admin_update_user_role_in_edit_page',100,'Update User role in edit page','admin'),
(150,'admin_webinars',NULL,'Webinars','admin'),
(151,'admin_webinars_list',150,'Webinars List','admin'),
(152,'admin_webinars_create',150,'Webinars Create','admin'),
(153,'admin_webinars_edit',150,'Webinars Edit','admin'),
(154,'admin_webinars_delete',150,'Webinars Delete','admin'),
(155,'admin_webinars_export_excel',150,'Export excel webinars list','admin'),
(156,'admin_feature_webinars',150,'Feature webinars list','admin'),
(157,'admin_feature_webinars_create',150,'create feature webinar','admin'),
(158,'admin_feature_webinars_export_excel',150,'Feature webinar export excel','admin'),
(159,'admin_webinar_students_lists',150,'Webinar students Lists','admin'),
(160,'admin_webinar_students_delete',150,'Webinar students delete','admin'),
(161,'admin_webinar_notification_to_students',150,'Send notification to course students','admin'),
(162,'admin_webinar_statistics',150,'Course statistics','admin'),
(163,'admin_agora_history_list',150,'Agora history lists','admin'),
(164,'admin_agora_history_export',150,'Agora history export','admin'),
(165,'admin_course_question_forum_list',150,'Forum Question Lists','admin'),
(166,'admin_course_question_forum_answers',150,'Forum Answers Lists','admin'),
(167,'admin_course_personal_notes',150,'Course Personal Notes','admin'),
(200,'admin_categories',NULL,'Categories','admin'),
(201,'admin_categories_list',200,'Categories List','admin'),
(202,'admin_categories_create',200,'Categories Create','admin'),
(203,'admin_categories_edit',200,'Categories Edit','admin'),
(204,'admin_categories_delete',200,'Categories Delete','admin'),
(205,'admin_trending_categories',200,'Trends Categories List','admin'),
(206,'admin_create_trending_categories',200,'Create Trend Categories','admin'),
(207,'admin_edit_trending_categories',200,'Edit Trend Categories','admin'),
(208,'admin_delete_trending_categories',200,'Delete Trend Categories','admin'),
(250,'admin_tags',NULL,'Tags','admin'),
(251,'admin_tags_list',250,'Tags List','admin'),
(252,'admin_tags_create',250,'Tags Create','admin'),
(253,'admin_tags_edit',250,'Tags Edit','admin'),
(254,'admin_tags_delete',250,'Tags Delete','admin'),
(300,'admin_filters',NULL,'Filters','admin'),
(301,'admin_filters_list',300,'Filters List','admin'),
(302,'admin_filters_create',300,'Filters Create','admin'),
(303,'admin_filters_edit',300,'Filters Edit','admin'),
(304,'admin_filters_delete',300,'Filters Delete','admin'),
(350,'admin_quizzes',NULL,'Quizzes','admin'),
(351,'admin_quizzes_list',350,'Quizzes List','admin'),
(352,'admin_quizzes_create',350,'Create Quiz','admin'),
(353,'admin_quizzes_edit',350,'Edit Quiz','admin'),
(354,'admin_quizzes_delete',350,'Delete Quiz','admin'),
(355,'admin_quizzes_results',350,'Quizzes results','admin'),
(356,'admin_quizzes_results_delete',350,'Quizzes results delete','admin'),
(357,'admin_quizzes_lists_excel',350,'Quizzes export excel','admin'),
(400,'admin_quiz_result',NULL,'Quiz Result','admin'),
(401,'admin_quiz_result_list',400,'Quiz Result List','admin'),
(402,'admin_quiz_result_create',400,'Quiz Result Create','admin'),
(403,'admin_quiz_result_edit',400,'Quiz Result Edit','admin'),
(404,'admin_quiz_result_delete',400,'Quiz Result Delete','admin'),
(405,'admin_quiz_result_export_excel',400,'quiz result export excel','admin'),
(450,'admin_certificate',NULL,'Certificate','admin'),
(451,'admin_certificate_list',450,'Certificate List','admin'),
(452,'admin_certificate_create',450,'Certificate Create','admin'),
(453,'admin_certificate_edit',450,'Certificate Edit','admin'),
(454,'admin_certificate_delete',450,'Certificate Delete','admin'),
(455,'admin_certificate_template_list',450,'Certificate template lists','admin'),
(456,'admin_certificate_template_create',450,'Certificate template create','admin'),
(457,'admin_certificate_template_edit',450,'Certificate template edit','admin'),
(458,'admin_certificate_template_delete',450,'Certificate template delete','admin'),
(459,'admin_certificate_export_excel',450,'Certificates export excel','admin'),
(460,'admin_course_certificate_list',450,'Course Competition Certificates','admin'),
(461,'admin_certificate_settings',450,'Settings','admin'),
(500,'admin_discount_codes',NULL,'Discount codes','admin'),
(501,'admin_discount_codes_list',500,'Discount codes list','admin'),
(502,'admin_discount_codes_create',500,'Discount codes create','admin'),
(503,'admin_discount_codes_edit',500,'Discount codes edit','admin'),
(504,'admin_discount_codes_delete',500,'Discount codes delete','admin'),
(505,'admin_discount_codes_export',500,'Discount codes export excel','admin'),
(550,'admin_group',NULL,'Groups','admin'),
(551,'admin_group_list',550,'Groups List','admin'),
(552,'admin_group_create',550,'Groups Create','admin'),
(553,'admin_group_edit',550,'Groups Edit','admin'),
(554,'admin_group_delete',550,'Groups Delete','admin'),
(555,'admin_update_group_registration_package',550,'Update group registration package','admin'),
(600,'admin_payment_channel',NULL,'Payment Channels','admin'),
(601,'admin_payment_channel_list',600,'Payment Channels List','admin'),
(602,'admin_payment_channel_toggle_status',600,'active or inactive channel','admin'),
(603,'admin_payment_channel_edit',600,'Payment Channels Edit','admin'),
(650,'admin_settings',NULL,'settings','admin'),
(651,'admin_settings_general',650,'General settings','admin'),
(652,'admin_settings_financial',650,'Financial settings','admin'),
(653,'admin_settings_personalization',650,'Personalization settings','admin'),
(654,'admin_settings_notifications',650,'Notifications settings','admin'),
(655,'admin_settings_seo',650,'Seo settings','admin'),
(656,'admin_settings_customization',650,'Customization settings','admin'),
(657,'admin_settings_update_app',650,'Update App settings','admin'),
(658,'admin_settings_home_sections',650,'Home sections settings','admin'),
(700,'admin_blog',NULL,'Blog','admin'),
(701,'admin_blog_lists',700,'Blog lists','admin'),
(702,'admin_blog_create',700,'Blog create','admin'),
(703,'admin_blog_edit',700,'Blog edit','admin'),
(704,'admin_blog_delete',700,'Blog delete','admin'),
(705,'admin_blog_categories',700,'Blog categories list','admin'),
(706,'admin_blog_categories_create',700,'Blog categories create','admin'),
(707,'admin_blog_categories_edit',700,'Blog categories edit','admin'),
(708,'admin_blog_categories_delete',700,'Blog categories delete','admin'),
(750,'admin_sales',NULL,'Sales','admin'),
(751,'admin_sales_list',750,'Sales List','admin'),
(752,'admin_sales_refund',750,'Sales Refund','admin'),
(753,'admin_sales_invoice',750,'Sales invoice','admin'),
(754,'admin_sales_export',750,'Sales Export Excel','admin'),
(800,'admin_documents',NULL,'Balances','admin'),
(801,'admin_documents_list',800,'Balances List','admin'),
(802,'admin_documents_create',800,'Balances Create','admin'),
(803,'admin_documents_print',800,'Balances print','admin'),
(850,'admin_payouts',NULL,'Payout','admin'),
(851,'admin_payouts_list',850,'Payout List','admin'),
(852,'admin_payouts_reject',850,'Payout Reject','admin'),
(853,'admin_payouts_payout',850,'Payout accept','admin'),
(854,'admin_payouts_export_excel',850,'Payout export excel','admin'),
(900,'admin_offline_payments',NULL,'Offline Payments','admin'),
(901,'admin_offline_payments_list',900,'Offline Payments List','admin'),
(902,'admin_offline_payments_reject',900,'Offline Payments Reject','admin'),
(903,'admin_offline_payments_approved',900,'Offline Payments Approved','admin'),
(904,'admin_offline_payments_export_excel',900,'Offline Payments export excel','admin'),
(950,'admin_supports',NULL,'Supports','admin'),
(951,'admin_supports_list',950,'Supports List','admin'),
(952,'admin_support_send',950,'Send Support','admin'),
(953,'admin_supports_reply',950,'Supports reply','admin'),
(954,'admin_supports_delete',950,'Supports delete','admin'),
(955,'admin_support_departments',950,'Support departments lists','admin'),
(956,'admin_support_department_create',950,'Create support department','admin'),
(957,'admin_support_departments_edit',950,'Edit support departments','admin'),
(958,'admin_support_departments_delete',950,'Delete support department','admin'),
(959,'admin_support_course_conversations',950,'Course conversations','admin'),
(1000,'admin_subscribe',NULL,'Subscribes','admin'),
(1001,'admin_subscribe_list',1000,'Subscribes list','admin'),
(1002,'admin_subscribe_create',1000,'Subscribes create','admin'),
(1003,'admin_subscribe_edit',1000,'Subscribes edit','admin'),
(1004,'admin_subscribe_delete',1000,'Subscribes delete','admin'),
(1050,'admin_notifications',NULL,'Notifications','admin'),
(1051,'admin_notifications_list',1050,'Notifications list','admin'),
(1052,'admin_notifications_send',1050,'Send Notifications','admin'),
(1053,'admin_notifications_edit',1050,'Edit and details Notifications','admin'),
(1054,'admin_notifications_delete',1050,'Delete Notifications','admin'),
(1055,'admin_notifications_markAllRead',1050,'Mark All Read Notifications','admin'),
(1056,'admin_notifications_templates',1050,'Notifications templates','admin'),
(1057,'admin_notifications_template_create',1050,'Create notification template','admin'),
(1058,'admin_notifications_template_edit',1050,'Edit notification template','admin'),
(1059,'admin_notifications_template_delete',1050,'Delete notification template','admin'),
(1060,'admin_notifications_posted_list',1050,'Notifications Posted list','admin'),
(1075,'admin_noticeboards',NULL,'Noticeboards','admin'),
(1076,'admin_noticeboards_list',1075,'Noticeboards list','admin'),
(1077,'admin_noticeboards_send',1075,'Send Noticeboards','admin'),
(1078,'admin_noticeboards_edit',1075,'Edit Noticeboards','admin'),
(1079,'admin_noticeboards_delete',1075,'Delete Noticeboards','admin'),
(1080,'admin_course_noticeboards_list',1075,'Course Noticeboards list','admin'),
(1081,'admin_course_noticeboards_send',1075,'Send Course Noticeboards','admin'),
(1082,'admin_course_noticeboards_edit',1075,'Edit Course Noticeboards','admin'),
(1083,'admin_course_noticeboards_delete',1075,'Delete Course Noticeboards','admin'),
(1100,'admin_promotion',NULL,'Promotions','admin'),
(1101,'admin_promotion_list',1100,'Promotions list','admin'),
(1102,'admin_promotion_create',1100,'Promotion create','admin'),
(1103,'admin_promotion_edit',1100,'Promotion edit','admin'),
(1104,'admin_promotion_delete',1100,'Promotion delete','admin'),
(1150,'admin_testimonials',NULL,'testimonials','admin'),
(1151,'admin_testimonials_list',1150,'testimonials list','admin'),
(1152,'admin_testimonials_create',1150,'testimonials create','admin'),
(1153,'admin_testimonials_edit',1150,'testimonials edit','admin'),
(1154,'admin_testimonials_delete',1150,'testimonials delete','admin'),
(1200,'admin_advertising',NULL,'advertising','admin'),
(1201,'admin_advertising_banners',1200,'advertising banners list','admin'),
(1202,'admin_advertising_banners_create',1200,'create advertising banner','admin'),
(1203,'admin_advertising_banners_edit',1200,'edit advertising banner','admin'),
(1204,'admin_advertising_banners_delete',1200,'delete advertising banner','admin'),
(1230,'admin_newsletters',NULL,'Newsletters','admin'),
(1231,'admin_newsletters_lists',1230,'Newsletters lists','admin'),
(1232,'admin_newsletters_send',1230,'Send Newsletters','admin'),
(1233,'admin_newsletters_history',1230,'Newsletters histories','admin'),
(1234,'admin_newsletters_delete',1230,'Delete newsletters item','admin'),
(1235,'admin_newsletters_export_excel',1230,'Export excel newsletters item','admin'),
(1250,'admin_contacts',NULL,'Contacts','admin'),
(1251,'admin_contacts_lists',1250,'Contacts lists','admin'),
(1252,'admin_contacts_reply',1250,'Contacts reply','admin'),
(1253,'admin_contacts_delete',1250,'Contacts delete','admin'),
(1300,'admin_product_discount',NULL,'product discount','admin'),
(1301,'admin_product_discount_list',1300,'product discount list','admin'),
(1302,'admin_product_discount_create',1300,'create product discount','admin'),
(1303,'admin_product_discount_edit',1300,'edit product discount','admin'),
(1304,'admin_product_discount_delete',1300,'delete product discount','admin'),
(1305,'admin_product_discount_export',1300,'delete product export excel','admin'),
(1350,'admin_pages',NULL,'pages','admin'),
(1351,'admin_pages_list',1350,'pages list','admin'),
(1352,'admin_pages_create',1350,'pages create','admin'),
(1353,'admin_pages_edit',1350,'pages edit','admin'),
(1354,'admin_pages_toggle',1350,'pages toggle publish/draft','admin'),
(1355,'admin_pages_delete',1350,'pages delete','admin'),
(1400,'admin_comments',NULL,'Comments','admin'),
(1401,'admin_comments_edit',1400,'Comments edit','admin'),
(1402,'admin_comments_reply',1400,'Comments reply','admin'),
(1403,'admin_comments_delete',1400,'Comments delete','admin'),
(1404,'admin_comments_status',1400,'Comments status (active or pending)','admin'),
(1405,'admin_comments_reports',1400,'Reports','admin'),
(1406,'admin_webinar_comments',1400,'Classes comments','admin'),
(1407,'admin_blog_comments',1400,'Blog comments','admin'),
(1408,'admin_product_comments',1400,'Product comments','admin'),
(1409,'admin_bundle_comments',1400,'Bundle comments','admin'),
(1450,'admin_reports',NULL,'Reports','admin'),
(1451,'admin_webinar_reports',1450,'Classes reports','admin'),
(1452,'admin_webinar_comments_reports',1450,'Classes Comments reports','admin'),
(1453,'admin_webinar_reports_delete',1450,'Classes reports delete','admin'),
(1454,'admin_blog_comments_reports',1450,'Blog Comments reports','admin'),
(1455,'admin_report_reasons',1450,'Reports reasons','admin'),
(1456,'admin_product_comments_reports',1450,'Products Comments reports','admin'),
(1457,'admin_forum_topic_post_reports',1450,'Forum Topic Posts Reports','admin'),
(1500,'admin_additional_pages',NULL,'Additional Pages','admin'),
(1501,'admin_additional_pages_404',1500,'404 error page settings','admin'),
(1502,'admin_additional_pages_contact_us',1500,'Contact page settings','admin'),
(1503,'admin_additional_pages_footer',1500,'Footer settings','admin'),
(1504,'admin_additional_pages_navbar_links',1500,'Top Navbar links settings','admin'),
(1550,'admin_appointments',NULL,'Appointments','admin'),
(1551,'admin_appointments_lists',1550,'Appointments lists','admin'),
(1552,'admin_appointments_join',1550,'Appointments join','admin'),
(1553,'admin_appointments_send_reminder',1550,'Appointments send reminder','admin'),
(1554,'admin_appointments_cancel',1550,'Appointments cancel','admin'),
(1600,'admin_reviews',NULL,'Reviews','admin'),
(1601,'admin_reviews_lists',1600,'Reviews lists','admin'),
(1602,'admin_reviews_status_toggle',1600,'Reviews status toggle (publish or hidden)','admin'),
(1603,'admin_reviews_detail_show',1600,'Review details page','admin'),
(1604,'admin_reviews_reply',1600,'Review reply','admin'),
(1605,'admin_reviews_delete',1600,'Review delete','admin'),
(1650,'admin_consultants',NULL,'Consultants','admin'),
(1651,'admin_consultants_lists',1650,'Consultants lists','admin'),
(1652,'admin_consultants_export_excel',1650,'Consultants export excel','admin'),
(1675,'admin_referrals',NULL,'Referrals','admin'),
(1676,'admin_referrals_history',1675,'Referrals History','admin'),
(1677,'admin_referrals_users',1675,'Referrals users','admin'),
(1678,'admin_referrals_export',1675,'Export Referrals','admin'),
(1725,'admin_regions',NULL,'Regions','admin'),
(1726,'admin_regions_countries',1725,'countries lists','admin'),
(1727,'admin_regions_provinces',1725,'provinces lists','admin'),
(1728,'admin_regions_cities',1725,'cities lists','admin'),
(1729,'admin_regions_districts',1725,'districts lists','admin'),
(1730,'admin_regions_create',1725,'create item','admin'),
(1731,'admin_regions_edit',1725,'edit item','admin'),
(1732,'admin_regions_delete',1725,'delete item','admin'),
(1750,'admin_rewards',NULL,'Rewards','admin'),
(1751,'admin_rewards_history',1750,'Rewards history','admin'),
(1752,'admin_rewards_settings',1750,'Rewards settings','admin'),
(1753,'admin_rewards_items',1750,'Rewards items','admin'),
(1754,'admin_rewards_item_delete',1750,'Reward item delete','admin'),
(1775,'admin_registration_packages',NULL,'Registration packages','admin'),
(1776,'admin_registration_packages_lists',1775,'packages lists','admin'),
(1777,'admin_registration_packages_new',1775,'New package','admin'),
(1778,'admin_registration_packages_edit',1775,'Edit package','admin'),
(1779,'admin_registration_packages_delete',1775,'Delete package','admin'),
(1780,'admin_registration_packages_reports',1775,'Reports','admin'),
(1781,'admin_registration_packages_settings',1775,'Settings','admin'),
(1800,'admin_store',NULL,'Store','admin'),
(1801,'admin_store_products',1800,'Products lists','admin'),
(1802,'admin_store_new_product',1800,'Create New Product','admin'),
(1803,'admin_store_edit_product',1800,'Edit Product','admin'),
(1804,'admin_store_delete_product',1800,'Delete Product','admin'),
(1805,'admin_store_export_products',1800,'Export excel Products','admin'),
(1806,'admin_store_categories_list',1800,'Store Categories Lists','admin'),
(1807,'admin_store_categories_create',1800,'Create Store Category','admin'),
(1808,'admin_store_categories_edit',1800,'Edit Store Category','admin'),
(1809,'admin_store_categories_delete',1800,'Delete Store Category','admin'),
(1810,'admin_store_filters_list',1800,'Store Filters Lists','admin'),
(1811,'admin_store_filters_create',1800,'Create Store Filter','admin'),
(1812,'admin_store_filters_edit',1800,'Edit Store Filter','admin'),
(1813,'admin_store_filters_delete',1800,'Delete Store Filter','admin'),
(1814,'admin_store_specifications',1800,'Store Specifications','admin'),
(1815,'admin_store_specifications_create',1800,'Create New Store Specification','admin'),
(1816,'admin_store_specifications_edit',1800,'Edit Store Specification','admin'),
(1817,'admin_store_specifications_delete',1800,'Delete Store Specification','admin'),
(1818,'admin_store_discounts',1800,'Store Discounts Lists','admin'),
(1819,'admin_store_discounts_create',1800,'Create New Store discount','admin'),
(1820,'admin_store_discounts_edit',1800,'Edit Store discount','admin'),
(1821,'admin_store_discounts_delete',1800,'Delete Store discount','admin'),
(1822,'admin_store_products_orders',1800,'Products Orders','admin'),
(1823,'admin_store_products_orders_refund',1800,'Products Orders Refund','admin'),
(1824,'admin_store_products_orders_invoice',1800,'Products Orders View Invoice','admin'),
(1825,'admin_store_products_orders_export',1800,'Products Orders Export Excel','admin'),
(1826,'admin_store_products_orders_tracking_code',1800,'Products Orders Tracking code','admin'),
(1827,'admin_store_products_reviews',1800,'Reviews lists','admin'),
(1828,'admin_store_products_reviews_status_toggle',1800,'Reviews status toggle (publish or hidden)','admin'),
(1829,'admin_store_products_reviews_detail_show',1800,'Review details page','admin'),
(1830,'admin_store_products_reviews_delete',1800,'Review delete','admin'),
(1831,'admin_store_settings',1800,'Store settings','admin'),
(1832,'admin_store_in_house_products',1800,'In-house products','admin'),
(1833,'admin_store_in_house_orders',1800,'In-house Products Orders','admin'),
(1834,'admin_store_products_sellers',1800,'Products Sellers','admin'),
(1835,'admin_store_in_house_products_delete',1800,'In-house Products Delete','admin'),
(1836,'admin_store_in_house_products_export',1800,'In-house Products Export Excel','admin'),
(1837,'admin_store_in_house_orders',1800,'In-house Products Orders','admin'),
(1838,'admin_store_products_sellers',1800,'Products Sellers','admin'),
(1850,'admin_webinar_assignments',NULL,'Webinar assignments','admin'),
(1851,'admin_webinar_assignments_lists',1850,'Assignments lists','admin'),
(1852,'admin_webinar_assignments_students',1850,'Assignment students','admin'),
(1853,'admin_webinar_assignments_conversations',1850,'Assignment students conversations','admin'),
(1875,'admin_users_not_access_content',NULL,'Users do not have access to the content','admin'),
(1876,'admin_users_not_access_content_lists',1875,'Users lists','admin'),
(1877,'admin_users_not_access_content_toggle',1875,'Toggle active/inactive users to view content','admin'),
(1900,'admin_bundles',NULL,'Bundles','admin'),
(1901,'admin_bundles_list',1900,'Bundles Lists','admin'),
(1902,'admin_bundles_create',1900,'Create new Bundle','admin'),
(1903,'admin_bundles_edit',1900,'Edit bundle','admin'),
(1904,'admin_bundles_delete',1900,'Delete bundle','admin'),
(1905,'admin_bundles_export_excel',1900,'Export excel','admin'),
(1925,'admin_forum',NULL,'Forums','admin'),
(1926,'admin_forum_list',1925,'Forums Lists','admin'),
(1927,'admin_forum_create',1925,'Forums create','admin'),
(1928,'admin_forum_edit',1925,'Forums edit','admin'),
(1929,'admin_forum_delete',1925,'Forums delete','admin'),
(1930,'admin_forum_topics_lists',1925,'Forums topics lists','admin'),
(1931,'admin_forum_topics_create',1925,'Forums topics create','admin'),
(1932,'admin_forum_topics_delete',1925,'Forums topics delete','admin'),
(1933,'admin_forum_topics_posts',1925,'Forums topic posts','admin'),
(1934,'admin_forum_topics_create_posts',1925,'Forums topic store posts','admin'),
(1950,'admin_featured_topics',NULL,'Featured topics','admin'),
(1951,'admin_featured_topics_list',1950,'Featured topics Lists','admin'),
(1952,'admin_featured_topics_create',1950,'Featured topics create','admin'),
(1953,'admin_featured_topics_edit',1950,'Featured topics edit','admin'),
(1954,'admin_featured_topics_delete',1950,'Featured topics delete','admin'),
(1975,'admin_recommended_topics',NULL,'Recommended topics','admin'),
(1976,'admin_recommended_topics_list',1975,'Recommended topics Lists','admin'),
(1977,'admin_recommended_topics_create',1975,'Recommended topics create','admin'),
(1978,'admin_recommended_topics_edit',1975,'Recommended topics edit','admin'),
(1979,'admin_recommended_topics_delete',1975,'Recommended topics delete','admin'),
(2000,'admin_advertising_modal',NULL,'Advertising modal','admin'),
(2001,'admin_advertising_modal_config',2000,'Set Advertising modal','admin'),
(2015,'admin_enrollment',NULL,'Enrollment','admin'),
(2016,'admin_enrollment_history',2015,'Enrollment History','admin'),
(2017,'admin_enrollment_add_student_to_items',2015,'Enrollment Add Student To Items','admin'),
(2018,'admin_enrollment_block_access',2015,'Enrollment Block Access','admin'),
(2019,'admin_enrollment_enable_access',2015,'Enrollment Enable Access','admin'),
(2020,'admin_enrollment_export',2015,'Enrollment Export History','admin'),
(2021,'admin_enrollment_export',2015,'Enrollment Export History','admin'),
(2030,'admin_delete_account_requests',NULL,'Delete Account Requests','admin'),
(2031,'admin_delete_account_requests_lists',2030,'Delete Account Requests Lists','admin'),
(2032,'admin_delete_account_requests_confirm',2030,'Delete Account Requests Confirm','admin'),
(2050,'admin_upcoming_courses',NULL,'Upcoming Course','admin'),
(2051,'admin_upcoming_courses_list',2050,'Lists','admin'),
(2052,'admin_upcoming_courses_create',2050,'Create','admin'),
(2053,'admin_upcoming_courses_edit',2050,'Edit and Update','admin'),
(2054,'admin_upcoming_courses_delete',2050,'Delete','admin'),
(2055,'admin_upcoming_courses_followers',2050,'Followers','admin'),
(2070,'admin_installments',NULL,'Installments','admin'),
(2071,'admin_installments_list',2070,'Lists','admin'),
(2072,'admin_installments_create',2070,'Create','admin'),
(2073,'admin_installments_edit',2070,'Edit and Update','admin'),
(2074,'admin_installments_delete',2070,'Delete','admin'),
(2075,'admin_installments_settings',2070,'Settings','admin'),
(2076,'admin_installments_purchases',2070,'Purchases','admin'),
(2077,'admin_installments_overdue_lists',2070,'Overdue Installments','admin'),
(2078,'admin_installments_overdue_history',2070,'Overdue History','admin'),
(2079,'admin_installments_verification_requests',2070,'Verification Requests','admin'),
(2080,'admin_installments_verified_users',2070,'Verified Users','admin'),
(2081,'admin_installments_orders',2070,'Approve/Reject/Refund Requests','admin'),
(2090,'admin_registration_bonus',NULL,'Registration Bonus','admin'),
(2091,'admin_registration_bonus_history',2090,'History','admin'),
(2092,'admin_registration_bonus_settings',2090,'Settings','admin'),
(2093,'admin_registration_bonus_export_excel',2090,'Export Excel','admin'),
(3000,'admin_floating_bar',NULL,'Top/Bottom Floating Bar','admin'),
(3001,'admin_floating_bar_create',3000,'Create/Edit','admin'),
(3010,'admin_cashback',NULL,'Cashback','admin'),
(3011,'admin_cashback_rules',3010,'Rules','admin'),
(3012,'admin_cashback_transactions',3010,'Transactions','admin'),
(3013,'admin_cashback_history',3010,'History','admin'),
(3020,'admin_waitlists',NULL,'Waitlists','admin'),
(3021,'admin_waitlists_lists',3020,'Lists','admin'),
(3022,'admin_waitlists_users',3020,'Joined Users','admin'),
(3023,'admin_waitlists_exports',3020,'Export excel lists','admin'),
(3024,'admin_waitlists_clear_list',3020,'Clear lists','admin'),
(3025,'admin_waitlists_disable',3020,'Disable','admin'),
(3030,'admin_gift',NULL,'Gifts','admin'),
(3031,'admin_gift_history',3030,'History','admin'),
(3032,'admin_gift_send_reminder',3030,'Send Reminder','admin'),
(3033,'admin_gift_cancel',3030,'Cancel','admin'),
(3034,'admin_gift_settings',3030,'Settings','admin'),
(3035,'admin_gift_export',3030,'Export Excel','admin'),
(3040,'admin_forms',NULL,'Forms','admin'),
(3041,'admin_forms_lists',3040,'Lists','admin'),
(3042,'admin_forms_create',3040,'Create','admin'),
(3043,'admin_forms_edit',3040,'Edit','admin'),
(3044,'admin_forms_delete',3040,'Delete','admin'),
(3045,'admin_forms_export',3040,'Export','admin'),
(3046,'admin_forms_submissions',3040,'Submissions','admin'),
(3050,'admin_ai_contents',NULL,'AI Contents','admin'),
(3051,'admin_ai_contents_lists',3050,'Generated Contents Lists','admin'),
(3052,'admin_ai_contents_templates_lists',3050,'Template Lists','admin'),
(3053,'admin_ai_contents_templates_create',3050,'Template Create','admin'),
(3054,'admin_ai_contents_templates_edit',3050,'Template Edit','admin'),
(3055,'admin_ai_contents_templates_delete',3050,'Template Delete','admin'),
(3056,'admin_ai_contents_settings',3050,'Settings','admin'),
(3060,'admin_purchase_notifications',NULL,'Purchase Notifications','admin'),
(3061,'admin_purchase_notifications_lists',3060,'Lists','admin'),
(3062,'admin_purchase_notifications_create',3060,'Create','admin'),
(3063,'admin_purchase_notifications_edit',3060,'Edit','admin'),
(3064,'admin_purchase_notifications_delete',3060,'Delete','admin'),
(3070,'admin_content_delete_requests',NULL,'Content Delete Requests','admin'),
(3071,'admin_content_delete_requests_lists',3070,'Lists','admin'),
(3072,'admin_content_delete_requests_actions',3070,'Approve/Reject','admin'),
(3080,'admin_user_login_history',NULL,'User Login History','admin'),
(3081,'admin_user_login_history_lists',3080,'Lists','admin'),
(3082,'admin_user_login_history_delete',3080,'Delete','admin'),
(3083,'admin_user_login_history_end_session',3080,'End Session','admin'),
(3084,'admin_user_login_history_export',3080,'Export Excel','admin'),
(3090,'admin_user_ip_restriction',NULL,'User IP Restriction','admin'),
(3091,'admin_user_ip_restriction_lists',3090,'Lists','admin'),
(3092,'admin_user_ip_restriction_create',3090,'Create/Edit Restriction','admin'),
(3093,'admin_user_ip_restriction_delete',3090,'Delete','admin'),
(3100,'admin_product_badges',NULL,'Product Badges','admin'),
(3101,'admin_product_badges_lists',3100,'Lists','admin'),
(3102,'admin_product_badges_create',3100,'Create','admin'),
(3103,'admin_product_badges_edit',3100,'Edit','admin'),
(3104,'admin_product_badges_delete',3100,'Delete','admin'),
(3110,'admin_cart_discount',NULL,'Cart Discount','admin'),
(3111,'admin_cart_discount_controls',3110,'Controls','admin'),
(3120,'admin_abandoned_cart',NULL,'Abandoned Cart','admin'),
(3121,'admin_abandoned_cart_rules',3120,'Rules (Create/Edit/Delete)','admin'),
(3122,'admin_abandoned_cart_users',3120,'Users Cart','admin'),
(3123,'admin_abandoned_cart_settings',3120,'Settings','admin'),
(3130,'admin_translator',NULL,'Translator','admin'),
(3131,'admin_translator_actions',3130,'Actions (Create/Edit/Delete)','admin'),
(100001,'panel_organization_instructors',NULL,'Organization Instructors','panel'),
(100002,'panel_organization_instructors_lists',100001,'Lists','panel'),
(100003,'panel_organization_instructors_create',100001,'Create','panel'),
(100004,'panel_organization_instructors_edit',100001,'Edit','panel'),
(100005,'panel_organization_instructors_delete',100001,'Delete','panel'),
(100010,'panel_organization_students',NULL,'Organization Students','panel'),
(100011,'panel_organization_students_lists',100010,'Lists','panel'),
(100012,'panel_organization_students_create',100010,'Create','panel'),
(100013,'panel_organization_students_edit',100010,'Edit','panel'),
(100014,'panel_organization_students_delete',100010,'Delete','panel'),
(100020,'panel_webinars',NULL,'Webinars (Courses)','panel'),
(100021,'panel_webinars_lists',100020,'Lists','panel'),
(100022,'panel_webinars_create',100020,'Create/Edit','panel'),
(100023,'panel_webinars_delete',100020,'Delete','panel'),
(100024,'panel_webinars_learning_page',100020,'Learning Page','panel'),
(100025,'panel_webinars_invited_lists',100020,'Invited Class Lists','panel'),
(100026,'panel_webinars_organization_classes',100020,'My Organization classes','panel'),
(100027,'panel_webinars_my_purchases',100020,'My Purchases','panel'),
(100028,'panel_webinars_my_class_comments',100020,'My Class Comments','panel'),
(100029,'panel_webinars_comments',100020,'My Comments','panel'),
(100030,'panel_webinars_favorites',100020,'Favorites','panel'),
(100031,'panel_webinars_personal_course_notes',100020,'Personal Course Notes','panel'),
(100032,'panel_webinars_duplicate',100020,'Duplicate','panel'),
(100033,'panel_webinars_export_students_list',100020,'Export Students List','panel'),
(100034,'panel_webinars_invoice',100020,'Invoice','panel'),
(100035,'panel_webinars_statistics',100020,'Statistics','panel'),
(100040,'panel_upcoming_courses',NULL,'Upcoming Courses','panel'),
(100041,'panel_upcoming_courses_lists',100040,'Lists','panel'),
(100042,'panel_upcoming_courses_create',100040,'Create/Edit','panel'),
(100043,'panel_upcoming_courses_delete',100040,'Delete','panel'),
(100044,'panel_upcoming_courses_followings',100040,'Followings','panel'),
(100045,'panel_upcoming_courses_followers',100040,'Followers','panel'),
(100050,'panel_bundles',NULL,'Bundles','panel'),
(100051,'panel_bundles_lists',100050,'Lists','panel'),
(100052,'panel_bundles_create',100050,'Create/Edit','panel'),
(100053,'panel_bundles_delete',100050,'Delete','panel'),
(100054,'panel_bundles_export_students_list',100050,'Export Students List','panel'),
(100055,'panel_bundles_courses',100050,'Courses','panel'),
(100060,'panel_assignments',NULL,'Assignments','panel'),
(100061,'panel_assignments_lists',100060,'My Assignments Lists','panel'),
(100062,'panel_assignments_my_courses_assignments',100060,'My Courses Assignments','panel'),
(100063,'panel_assignments_students',100060,'Students Assignments','panel'),
(100070,'panel_meetings',NULL,'Meetings','panel'),
(100071,'panel_meetings_my_reservation',100070,'My Reservation','panel'),
(100072,'panel_meetings_requests',100070,'Requests','panel'),
(100073,'panel_meetings_settings',100070,'Settings','panel'),
(100080,'panel_quizzes',NULL,'Quizzes','panel'),
(100081,'panel_quizzes_lists',100080,'Lists','panel'),
(100082,'panel_quizzes_create',100080,'Create/Edit','panel'),
(100083,'panel_quizzes_delete',100080,'Delete','panel'),
(100084,'panel_quizzes_results',100080,'Results','panel'),
(100085,'panel_quizzes_my_results',100080,'My Results','panel'),
(100086,'panel_quizzes_not_participated',100080,'Not Participated Lists','panel'),
(100090,'panel_certificates',NULL,'Certificates','panel'),
(100091,'panel_certificates_lists',100090,'Lists','panel'),
(100092,'panel_certificates_achievements',100090,'Achievements','panel'),
(100093,'panel_certificates_course_certificates',100090,'Course Certificates','panel'),
(100100,'panel_products',NULL,'Products (Store)','panel'),
(100101,'panel_products_lists',100100,'Lists','panel'),
(100102,'panel_products_create',100100,'Create/Edit','panel'),
(100103,'panel_products_delete',100100,'Delete','panel'),
(100104,'panel_products_sales',100100,'Sales','panel'),
(100105,'panel_products_purchases',100100,'Purchases','panel'),
(100106,'panel_products_comments',100100,'Comments','panel'),
(100107,'panel_products_my_comments',100100,'My Comments','panel'),
(100120,'panel_financial',NULL,'Financial','panel'),
(100121,'panel_financial_sales_reports',100120,'Sales Reports','panel'),
(100122,'panel_financial_summary',100120,'Summary','panel'),
(100123,'panel_financial_payout',100120,'Payout','panel'),
(100124,'panel_financial_charge_account',100120,'Charge Account','panel'),
(100125,'panel_financial_subscribes',100120,'Subscribes','panel'),
(100126,'panel_financial_registration_packages',100120,'Registration Packages','panel'),
(100127,'panel_financial_installments',100120,'Installments','panel'),
(100140,'panel_support',NULL,'Support','panel'),
(100141,'panel_support_lists',100140,'Lists','panel'),
(100142,'panel_support_create',100140,'Create','panel'),
(100143,'panel_support_tickets',100140,'Tickets','panel'),
(100160,'panel_marketing',NULL,'Marketing','panel'),
(100161,'panel_marketing_special_offers',100160,'Special Offers','panel'),
(100162,'panel_marketing_promotions',100160,'Promotions','panel'),
(100163,'panel_marketing_affiliates',100160,'Affiliates','panel'),
(100164,'panel_marketing_registration_bonus',100160,'Registration Bonus','panel'),
(100165,'panel_marketing_coupons',100160,'Coupons','panel'),
(100166,'panel_marketing_new_coupon',100160,'Create Coupons','panel'),
(100167,'panel_marketing_delete_coupon',100160,'Delete Coupons','panel'),
(100180,'panel_forums',NULL,'Forums','panel'),
(100181,'panel_forums_new_topic',100180,'New Topic','panel'),
(100182,'panel_forums_my_topics',100180,'My Topics','panel'),
(100183,'panel_forums_my_posts',100180,'My Posts','panel'),
(100184,'panel_forums_bookmarks',100180,'Bookmarks','panel'),
(100200,'panel_blog',NULL,'Blog','panel'),
(100201,'panel_blog_new_article',100200,'New/Edit Article','panel'),
(100202,'panel_blog_my_articles',100200,'My Article','panel'),
(100203,'panel_blog_delete_article',100200,'Delete Article','panel'),
(100204,'panel_blog_comments',100200,'Comments','panel'),
(100220,'panel_noticeboard',NULL,'Noticeboard','panel'),
(100221,'panel_noticeboard_history',100220,'Noticeboard History','panel'),
(100222,'panel_noticeboard_create',100220,'Create/Edit Noticeboard','panel'),
(100223,'panel_noticeboard_delete',100220,'Delete Noticeboard','panel'),
(100224,'panel_noticeboard_course_notices',100220,'Course Notices','panel'),
(100225,'panel_noticeboard_course_notices_create',100220,'Create/Edit Course Notices','panel'),
(100240,'panel_rewards',NULL,'Rewards','panel'),
(100241,'panel_rewards_lists',100240,'Lists','panel'),
(100260,'panel_ai_contents',NULL,'AI Contents','panel'),
(100261,'panel_ai_contents_lists',100260,'Lists','panel'),
(100280,'panel_notifications',NULL,'Notifications','panel'),
(100281,'panel_notifications_lists',100280,'Lists','panel'),
(100300,'panel_others',NULL,'Others','panel'),
(100301,'panel_others_profile_setting',100300,'Profile Settings','panel'),
(100302,'panel_others_profile_url',100300,'Profile Url','panel'),
(100303,'panel_others_logout',100300,'Logout','panel');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_installment_steps`
--

DROP TABLE IF EXISTS `selected_installment_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `selected_installment_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `selected_installment_id` int(10) unsigned NOT NULL,
  `installment_step_id` int(10) unsigned NOT NULL,
  `deadline` int(10) unsigned DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `amount_type` enum('fixed_amount','percent') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_installment_steps_selected_installment_id_foreign` (`selected_installment_id`),
  KEY `selected_installment_steps_installment_step_id_foreign` (`installment_step_id`),
  CONSTRAINT `selected_installment_steps_installment_step_id_foreign` FOREIGN KEY (`installment_step_id`) REFERENCES `installment_steps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `selected_installment_steps_selected_installment_id_foreign` FOREIGN KEY (`selected_installment_id`) REFERENCES `selected_installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_installment_steps`
--

LOCK TABLES `selected_installment_steps` WRITE;
/*!40000 ALTER TABLE `selected_installment_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected_installment_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_installments`
--

DROP TABLE IF EXISTS `selected_installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `selected_installments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `installment_id` int(10) unsigned NOT NULL,
  `installment_order_id` int(10) unsigned NOT NULL,
  `start_date` bigint(20) unsigned DEFAULT NULL,
  `end_date` bigint(20) unsigned DEFAULT NULL,
  `upfront` double(15,2) DEFAULT NULL,
  `upfront_type` enum('fixed_amount','percent') DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_installments_user_id_foreign` (`user_id`),
  KEY `selected_installments_installment_id_foreign` (`installment_id`),
  KEY `selected_installments_installment_order_id_foreign` (`installment_order_id`),
  CONSTRAINT `selected_installments_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `selected_installments_installment_order_id_foreign` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `selected_installments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_installments`
--

LOCK TABLES `selected_installments` WRITE;
/*!40000 ALTER TABLE `selected_installments` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected_installments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_reminds`
--

DROP TABLE IF EXISTS `session_reminds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_reminds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_reminds_session_id_foreign` (`session_id`),
  KEY `session_reminds_user_id_foreign` (`user_id`),
  CONSTRAINT `session_reminds_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `session_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_reminds`
--

LOCK TABLES `session_reminds` WRITE;
/*!40000 ALTER TABLE `session_reminds` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_reminds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_translations`
--

DROP TABLE IF EXISTS `session_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_translations_session_id_foreign` (`session_id`),
  KEY `session_translations_locale_index` (`locale`),
  CONSTRAINT `session_translations_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_translations`
--

LOCK TABLES `session_translations` WRITE;
/*!40000 ALTER TABLE `session_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `reserve_meeting_id` int(10) unsigned DEFAULT NULL,
  `date` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `extra_time_to_join` int(10) unsigned DEFAULT NULL COMMENT 'Specifies that the user can see the join button up to a few minutes after the start time of the webinar.',
  `zoom_start_link` text DEFAULT NULL,
  `zoom_id` varchar(255) DEFAULT NULL,
  `session_api` enum('local','big_blue_button','zoom','agora','jitsi','google_meet') NOT NULL DEFAULT 'local',
  `api_secret` varchar(255) DEFAULT NULL,
  `moderator_secret` varchar(255) DEFAULT NULL,
  `agora_settings` text DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sessions_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `sessions_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `sessions_chapter_id_foreign` (`chapter_id`),
  KEY `sessions_reserve_meeting_id_foreign` (`reserve_meeting_id`),
  CONSTRAINT `sessions_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_translations`
--

DROP TABLE IF EXISTS `setting_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_translations_setting_id_foreign` (`setting_id`),
  KEY `setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_translations`
--

LOCK TABLES `setting_translations` WRITE;
/*!40000 ALTER TABLE `setting_translations` DISABLE KEYS */;
INSERT INTO `setting_translations` VALUES
(1,1,'en','{\"home\":{\"title\":\"Home\",\"description\":\"Home Page Description\",\"robot\":\"index\"},\"search\":{\"title\":\"Search\",\"description\":\"Search Page Description\",\"robot\":\"index\"},\"categories\":{\"title\":\"Category\",\"description\":\"Categories Page Description\",\"robot\":\"index\"},\"login\":{\"title\":\"Login\",\"description\":\"Login Page Description\",\"robot\":\"index\"},\"register\":{\"title\":\"Register\",\"description\":\"Register Page Description\",\"robot\":\"index\"},\"about\":{\"title\":\"about page title\",\"description\":\"about page Description\"},\"contact\":{\"title\":\"Contact\",\"description\":\"Contact Page Description\",\"robot\":\"index\"},\"certificate_validation\":{\"title\":\"Certificate validation\",\"description\":\"Certificate Validation Description\",\"robot\":\"index\"},\"classes\":{\"title\":\"Courses\",\"description\":\"Courses page Description\",\"robot\":\"index\"},\"blog\":{\"title\":\"Blog\",\"description\":\"Blog Page Description\",\"robot\":\"index\"},\"instructors\":{\"title\":\"Instructors\",\"description\":\"Instructors Page Description\",\"robot\":\"index\"},\"organizations\":{\"title\":\"Organizations\",\"description\":\"Organizations Page Description\",\"robot\":\"index\"},\"instructor_finder_wizard\":{\"title\":\"Instructor finder wizard\",\"description\":\"Tutor Finder Wizard Description\",\"robot\":\"noindex\"},\"instructor_finder\":{\"title\":\"Instructor finder\",\"description\":\"Tutor Finder Description\",\"robot\":\"index\"},\"reward_courses\":{\"title\":\"Reward courses\",\"description\":\"Reward Courses Description\",\"robot\":\"index\"},\"products_lists\":{\"title\":\"Store Products\",\"description\":\"Store Products Description\",\"robot\":\"noindex\"},\"reward_products\":{\"title\":\"Reward Products\",\"description\":\"Reward Products Description\",\"robot\":\"noindex\"},\"forum\":{\"title\":\"Forums\",\"description\":\"Forums Description\",\"robot\":\"noindex\"},\"upcoming_courses_lists\":{\"title\":\"Upcoming Course\",\"description\":\"Upcoming Courses Description\",\"robot\":\"noindex\"},\"tags\":{\"title\":\"Tags\",\"description\":\"Tags Page Description\",\"robot\":\"noindex\"}}'),
(2,2,'en','{\"Instagram\":{\"title\":\"Instagram\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/instagram.svg\",\"link\":\"https:\\/\\/www.instagram.com\\/\",\"order\":\"1\"},\"Whatsapp\":{\"title\":\"Whatsapp\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/whatsapp.svg\",\"link\":\"https:\\/\\/web.whatsapp.com\\/\",\"order\":\"2\"},\"Twitter\":{\"title\":\"Twitter\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/twitter.svg\",\"link\":\"https:\\/\\/twitter.com\\/\",\"order\":\"3\"},\"Facebook\":{\"title\":\"Facebook\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/facebook.svg\",\"link\":\"https:\\/\\/www.facebook.com\\/\",\"order\":\"4\"}}'),
(4,5,'en','{\"site_name\":\"MedInLMS\",\"site_email\":\"conseillerdigital@gmail.com\",\"site_phone\":\"11223344\",\"site_language\":\"EN\",\"register_method\":\"email\",\"default_time_zone\":\"Africa\\/Tunis\",\"date_format\":\"numerical\",\"time_format\":\"24_hours\",\"user_languages\":[\"AR\",\"EN\",\"FR\"],\"rtl_languages\":[\"AR\"],\"fav_icon\":\"\\/store\\/1\\/favicon medin.png\",\"logo\":\"\\/store\\/1\\/MedIn.png\",\"footer_logo\":\"\\/store\\/1\\/Medin Blanc.png\",\"rtl_layout\":\"0\",\"preloading\":\"1\",\"hero_section1\":\"1\",\"hero_section2\":\"0\",\"content_translate\":\"1\",\"app_debugbar\":\"0\"}'),
(5,6,'en','{\"tax\":\"10\",\"minimum_payout\":\"50\",\"price_display\":\"only_price\",\"hide_disabled_payment_gateways\":\"0\"}'),
(6,8,'en','{\"title\":\"Joy of learning & teaching...\",\"description\":\"Welcome\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\",\"is_video_background\":\"0\"}'),
(7,12,'en','{\"css\":null,\"js\":null}'),
(8,14,'en','{\"admin_login\":\"\\/store\\/1\\/default_images\\/admin_login.jpg\",\"admin_dashboard\":\"\\/store\\/1\\/default_images\\/admin_dashboard.jpg\",\"login\":\"\\/store\\/1\\/default_images\\/front_login.jpg\",\"register\":\"\\/store\\/1\\/default_images\\/front_register.jpg\",\"remember_pass\":\"\\/store\\/1\\/default_images\\/password_recovery.jpg\",\"verification\":\"\\/store\\/1\\/default_images\\/verification.jpg\",\"search\":\"\\/store\\/1\\/default_images\\/search_cover.png\",\"tags\":\"\\/store\\/1\\/default_images\\/search_cover.png\",\"categories\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"become_instructor\":\"\\/store\\/1\\/default_images\\/become_instructor.jpg\",\"certificate_validation\":\"\\/store\\/1\\/default_images\\/certificate_validation.jpg\",\"blog\":\"\\/store\\/1\\/default_images\\/blogs_cover.png\",\"instructors\":\"\\/store\\/1\\/default_images\\/instructors_cover.png\",\"organizations\":\"\\/store\\/1\\/default_images\\/organizations_cover.png\",\"dashboard\":\"\\/store\\/1\\/dashboard.png\",\"user_cover\":\"\\/store\\/1\\/default_images\\/default_cover.jpg\",\"instructor_finder_wizard\":\"\\/store\\/1\\/default_images\\/instructor_finder_wizard.jpg\",\"products_lists\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"upcoming_courses_lists\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"user_default_signature\":\"\\/store\\/1\\/default_images\\/default_signature.jpg\"}'),
(9,15,'en','{\"title\":\"Joy of learning & teaching...\",\"description\":\"Rocket LMS is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(10,20,'en','[\"Inappropriate Course Content\",\"Inappropriate Behavior\",\"Policy Violation\",\"Spammy Content\",\"Other\"]'),
(11,22,'en','{\"new_comment_admin\":\"7\",\"support_message_admin\":\"10\",\"support_message_replied_admin\":\"11\",\"promotion_plan_admin\":\"29\",\"new_contact_message\":\"26\",\"new_badge\":\"2\",\"change_user_group\":\"3\",\"course_created\":\"4\",\"course_approve\":\"5\",\"course_reject\":\"6\",\"new_comment\":\"7\",\"support_message\":\"8\",\"support_message_replied\":\"9\",\"new_rating\":\"17\",\"webinar_reminder\":\"27\",\"new_financial_document\":\"12\",\"payout_request\":\"13\",\"payout_proceed\":\"14\",\"offline_payment_request\":\"18\",\"offline_payment_approved\":\"19\",\"offline_payment_rejected\":\"20\",\"new_sales\":\"15\",\"new_purchase\":\"16\",\"new_subscribe_plan\":\"21\",\"promotion_plan\":\"28\",\"new_appointment\":\"22\",\"new_appointment_link\":\"23\",\"appointment_reminder\":\"24\",\"meeting_finished\":\"25\",\"new_certificate\":\"30\",\"waiting_quiz\":\"31\",\"waiting_quiz_result\":\"32\",\"payout_request_admin\":\"13\",\"product_new_sale\":\"33\",\"product_new_purchase\":\"34\",\"product_new_comment\":\"35\",\"product_tracking_code\":\"36\",\"product_new_rating\":\"37\",\"product_receive_shipment\":\"38\",\"product_out_of_stock\":\"39\",\"student_send_message\":\"40\",\"instructor_send_message\":\"41\",\"instructor_set_grade\":\"42\",\"send_post_in_topic\":\"44\",\"publish_instructor_blog_post\":\"45\",\"new_comment_for_instructor_blog_post\":\"46\",\"meeting_reserve_reminder\":\"47\",\"subscribe_reminder\":\"48\",\"reminder_gift_to_receipt\":\"52\",\"gift_sender_confirmation\":\"53\",\"gift_sender_notification\":\"54\",\"admin_gift_submission\":\"55\",\"admin_gift_sending_confirmation\":\"56\",\"reminder_installments_before_overdue\":\"57\",\"installment_due_reminder\":\"58\",\"reminder_installments_after_overdue\":\"59\",\"approve_installment_verification_request\":\"60\",\"reject_installment_verification_request\":\"61\",\"paid_installment_step\":\"62\",\"paid_installment_step_for_admin\":\"63\",\"paid_installment_upfront\":\"64\",\"installment_verification_request_sent\":\"65\",\"admin_installment_verification_request_sent\":\"66\",\"instalment_request_submitted\":\"67\",\"instalment_request_submitted_for_admin\":\"68\",\"upcoming_course_submission\":\"69\",\"upcoming_course_submission_for_admin\":\"70\",\"upcoming_course_approved\":\"71\",\"upcoming_course_rejected\":\"72\",\"upcoming_course_published\":\"73\",\"upcoming_course_followed\":\"74\",\"upcoming_course_published_for_followers\":\"75\",\"user_get_cashback\":\"76\",\"user_get_cashback_notification_for_admin\":\"77\",\"bundle_submission\":\"78\",\"bundle_submission_for_admin\":\"79\",\"bundle_approved\":\"80\",\"bundle_rejected\":\"81\",\"new_review_for_bundle\":\"82\",\"registration_bonus_achieved\":\"83\",\"registration_bonus_unlocked\":\"84\",\"registration_bonus_unlocked_for_admin\":\"85\",\"registration_package_activated\":\"86\",\"registration_package_activated_for_admin\":\"87\",\"registration_package_expired\":\"87\",\"contact_message_submission\":\"88\",\"contact_message_submission_for_admin\":\"89\",\"waitlist_submission\":\"90\",\"waitlist_submission_for_admin\":\"91\",\"new_referral_user\":\"92\",\"user_role_change\":\"97\",\"add_to_user_group\":\"98\",\"become_instructor_request_approved\":\"99\",\"become_instructor_request_rejected\":\"100\",\"new_question_in_forum\":\"101\",\"new_answer_in_forum\":\"102\",\"new_appointment_session\":\"103\",\"new_quiz\":\"93\",\"user_get_new_point\":\"94\",\"new_course_notice\":\"96\",\"new_registration\":\"104\",\"new_become_instructor_request\":\"105\",\"new_course_enrollment\":\"106\",\"new_forum_topic\":\"107\",\"new_report_item_for_admin\":\"108\",\"new_item_created\":\"109\",\"new_store_order\":\"110\",\"subscription_plan_activated\":\"111\",\"content_review_request\":\"112\",\"new_user_blog_post\":\"113\",\"new_user_item_rating\":\"114\",\"new_organization_user\":\"115\",\"user_wallet_charge\":\"116\",\"new_user_payout_request\":\"117\",\"new_offline_payment_request\":\"118\",\"user_access_to_content\":\"119\",\"submit_form_by_users\":\"120\",\"submit_verification_doc_payment\":\"123\",\"you_have_been_accepted\":\"124\",\"certificate_request_send\":\"127\",\"certificate_request_approved\":\"125\",\"certificate_request_rejected\":\"21\"}'),
(12,23,'en','{\"540\":{\"title\":\"Qatar National Bank\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/Qatar National Bank.png\",\"card_id\":\"2578-4910-3682-6288\",\"account_id\":\"38152294372\",\"iban\":\"QA66QUWW934528129454345775226\"},\"334\":{\"title\":\"State Bank of India\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/State Bank of India.png\",\"card_id\":\"6282-4518-1237-7641\",\"account_id\":\"56238341127\",\"iban\":\"IN37ABNA2422193788\"},\"jhgDW\":{\"title\":\"JPMorgan\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/jpmorgan.png\",\"card_id\":\"5012-4518-1772-8911\",\"account_id\":\"46237751125\",\"iban\":\"NL37ABNA2423554788\"}}'),
(13,24,'en','{\"background\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"latitude\":\"43.45905\",\"longitude\":\"11.87300\",\"map_zoom\":\"16\",\"phones\":\"415-716-1166 , 415-716-1167\",\"emails\":\"mail@lms.rocket-soft.org , info@lms.rocket-soft.org\",\"address\":\"4193 Roosevelt Street\\r\\nSan Francisco, CA 94103\"}'),
(14,25,'en','{\"latest_classes\":\"1\",\"best_sellers\":\"1\",\"free_classes\":\"1\",\"discount_classes\":\"1\",\"best_rates\":\"1\",\"trend_categories\":\"1\",\"testimonials\":\"1\",\"subscribes\":\"1\",\"blog\":\"1\",\"organizations\":\"1\",\"instructors\":\"1\",\"video_or_image_section\":\"1\",\"find_instructors\":\"1\",\"reward_program\":\"1\"}'),
(15,26,'en','{\"02nh9a\":{\"title\":\"Home\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"Courses\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"Instructors\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"Uo5b2v\":{\"title\":\"Store\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"Forums\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),
(16,27,'en','{\"link\":\"\\/classes\",\"title\":\"Start learning anywhere, anytime...\",\"description\":\"Use Rocket LMS to access high-quality education materials without any limitations in the easiest way.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(17,28,'en','{\"error_image\":\"\\/store\\/1\\/default_images\\/404.svg\",\"error_title\":\"Page not found!\",\"error_description\":\"Sorry, this page is not available...\"}'),
(18,29,'en','{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user.png\"}'),
(19,30,'en','{\"status\":\"0\",\"users_affiliate_status\":\"0\",\"affiliate_user_commission\":\"5\",\"store_affiliate_user_commission\":\"5\",\"affiliate_user_amount\":\"20\",\"referred_user_amount\":\"10\",\"referral_description\":\"You can share your affiliate URL you will get the above rewards when a user uses the platform.\"}'),
(20,4,'en','{\"first_column\":{\"title\":\"About US\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS is a fully-featured learning management system that helps you to run your education business in several hours. This platform helps instructors to create professional education materials and helps students to learn from the best instructors.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"Additional Links\",\"value\":\"<p><a href=\\\"\\/login\\\"><font color=\\\"#ffffff\\\">- Login<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/register\\\"><font color=\\\"#ffffff\\\">- Register<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\/blog\\\"><font color=\\\"#ffffff\\\">- Blog<\\/font><\\/a><\\/p><p><a href=\\\"\\/contact\\\"><font color=\\\"#ffffff\\\">- Contact us<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/certificate_validation\\\"><font color=\\\"#ffffff\\\">- Certificate validation<\\/font><\\/a><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/become-instructor\\\"><font color=\\\"#ffffff\\\">- Become instructor<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\/pages\\/terms\\\"><font color=\\\"#ffffff\\\">- Terms &amp; rules<\\/font><\\/a><\\/p><p><a href=\\\"\\/pages\\/about\\\"><font color=\\\"#ffffff\\\">- About us<\\/font><\\/a><br><\\/p>\"},\"third_column\":{\"title\":\"Similar Businesses\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Masterclass<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"Purchase Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),
(31,4,'ar','{\"first_column\":{\"title\":\"\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS \\u0647\\u0648 \\u0646\\u0638\\u0627\\u0645 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u062a\\u0639\\u0644\\u0645 \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f\\u0643 \\u0639\\u0644\\u0649 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u0623\\u0639\\u0645\\u0627\\u0644\\u0643 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0641\\u064a \\u0639\\u062f\\u0629 \\u0633\\u0627\\u0639\\u0627\\u062a. \\u062a\\u0633\\u0627\\u0639\\u062f \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a\\u0629 \\u0648\\u062a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0645\\u0646 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"\\u0631\\u0648\\u0627\\u0628\\u0637 \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629\",\"value\":\"<p><a href=\\\"\\/login\\\"><span style=\\\"color: #ffffff;\\\">- \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/register\\\"><span style=\\\"color: #ffffff;\\\">- \\u062a\\u0633\\u062c\\u064a\\u0644<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/blog\\\"><span style=\\\"color: #ffffff;\\\">- \\u0645\\u0642\\u0627\\u0644\\u0627\\u062a<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/contact\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/certificate_validation\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0645\\u0646 \\u0635\\u062d\\u0629 \\u0627\\u0644\\u0634\\u0647\\u0627\\u062f\\u0629<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/become-instructor\\\"><span style=\\\"color: #ffffff;\\\">- \\u0623\\u0635\\u0628\\u062d \\u0645\\u062f\\u0631\\u0628\\u0627<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/terms\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/about\\\"><span style=\\\"color: #ffffff;\\\">- \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627<\\/span><\\/a><\\/p>\"},\"third_column\":{\"title\":\"\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0645\\u0645\\u0627\\u062b\\u0644\\u0629\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u064a\\u0648\\u062f\\u0645\\u064a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0633\\u06a9\\u06cc\\u0644 \\u0634\\u06cc\\u0631<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0643\\u0631\\u0633 \\u0627\\u064a\\u0631\\u0627<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0644\\u06cc\\u0646\\u062f\\u0627<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0633\\u0643\\u064a\\u0644 \\u0633\\u0641\\u062a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0648\\u062f\\u0627\\u0633\\u064a\\u062a\\u064a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">\\u0627\\u062f\\u0643\\u0633<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0645\\u0633\\u062a\\u0631 \\u0643\\u0644\\u0633<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"\\u0642\\u0645 \\u0628\\u0634\\u0631\\u0627\\u0621 Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),
(32,31,'en','{\"agora_resolution\":null,\"agora_max_bitrate\":\"2260\",\"agora_min_bitrate\":\"1130\",\"agora_frame_rate\":\"15\",\"agora_live_streaming\":\"0\",\"agora_chat\":\"0\",\"agora_in_free_courses\":\"0\",\"agora_for_meeting\":\"0\",\"meeting_live_stream_type\":\"single\",\"course_live_stream_type\":\"single\",\"agora_app_id\":null,\"agora_app_certificate\":null,\"new_interactive_file\":\"0\",\"timezone_in_register\":\"1\",\"timezone_in_create_webinar\":\"1\",\"sequence_content_status\":\"0\",\"webinar_assignment_status\":\"0\",\"webinar_private_content_status\":\"0\",\"disable_view_content_after_user_register\":\"0\",\"course_forum_status\":\"0\",\"forums_status\":\"1\",\"direct_classes_payment_button_status\":\"1\",\"direct_bundles_payment_button_status\":\"1\",\"direct_products_payment_button_status\":\"1\",\"cookie_settings_status\":\"0\",\"mobile_app_status\":\"0\",\"maintenance_status\":\"0\",\"maintenance_access_key\":\"key\",\"extra_time_to_join_status\":\"1\",\"extra_time_to_join_default_value\":\"20\",\"show_other_register_method\":\"1\",\"show_certificate_additional_in_register\":\"0\",\"show_google_login_button\":\"1\",\"show_facebook_login_button\":\"1\",\"google_client_id\":\"536107898213-iq7dsrqasfj7k4r20hedf65v74joheo8.apps.googleusercontent.com\",\"google_client_secret\":\"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\",\"facebook_client_id\":\"1337757027596360\",\"facebook_client_secret\":\"37ab7a63789ff2882714a41cc3a060ab\",\"show_live_chat_widget\":\"0\",\"cashback_active\":\"0\",\"display_cashback_notice_in_the_product_page\":\"0\",\"display_minimum_amount_cashback_notices\":\"0\",\"available_session_apis\":[\"local\",\"zoom\"],\"available_sources\":[\"upload\",\"youtube\",\"vimeo\",\"external_link\",\"google_drive\",\"iframe\",\"s3\"],\"bunny_configs\":[],\"select_the_role_during_registration\":[\"teacher\",\"organization\"],\"waitlist_status\":\"0\",\"upcoming_courses_status\":\"0\",\"user_register_form\":null,\"instructor_register_form\":null,\"organization_register_form\":null,\"become_instructor_form\":null,\"become_organization_form\":null,\"frontend_coupons_status\":\"1\",\"frontend_coupons_display_type\":\"before_content\",\"course_notes_status\":\"0\",\"course_notes_attachment\":\"0\",\"zoom_client_id\":null,\"zoom_client_secret\":null,\"zoom_account_id\":null,\"bigbluebutton_server_base_url\":null,\"bigbluebutton_security_salt\":null,\"jitsi_live_url\":null}'),
(33,32,'en','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"Find the best instructor\",\"description\":\"Looking for an instructor? Find the best instructors according to different parameters like gender, skill level, price, meeting type, rating, etc.\\r\\nFind instructors on the map.\",\"button1\":{\"title\":\"Tutor Finder\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"Tutors on Map\",\"link\":\"\\/instructor-finder\"}}'),
(34,33,'en','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"Win Club Points\",\"description\":\"Use Rocket LMS and win club points according to different activities.\\r\\nYou will be able to use your club points to get free prizes and courses. Start using the system now and collect points!\",\"button1\":{\"title\":\"Rewards\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"Points Club\",\"link\":\"\\/panel\\/rewards\"}}'),
(35,34,'en','{\"status\":\"0\",\"exchangeable\":\"0\",\"exchangeable_unit\":null,\"want_more_points_link\":\"\\/pages\\/reward_points_system\"}'),
(38,37,'en','{\"status\":\"0\",\"show_packages_during_registration\":\"0\",\"force_user_to_select_a_package\":\"0\",\"enable_home_section\":\"0\"}'),
(39,38,'en','{\"status\":\"0\",\"courses_capacity\":\"20\",\"courses_count\":\"5\",\"meeting_count\":\"20\",\"product_count\":\"5\"}'),
(40,39,'en','{\"status\":\"0\",\"instructors_count\":\"5\",\"students_count\":\"30\",\"courses_capacity\":\"30\",\"courses_count\":\"10\",\"meeting_count\":\"40\",\"product_count\":\"10\"}'),
(41,40,'en','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"Become an instructor\",\"description\":\"Are you interested to be a part of our community?\\r\\nYou can be a part of our community by signing up as an instructor or organization.\",\"button1\":{\"title\":\"Become an Instructor\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"Registration Packages\",\"link\":\"become-instructor\\/packages\\/\"}}'),
(42,8,'ar','{\"title\":\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\",\"description\":\"Rocket LMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),
(43,8,'es','{\"title\":\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\",\"description\":\"Rocket LMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),
(44,15,'ar','{\"title\":\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\",\"description\":\"Rocket LMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(45,15,'es','{\"title\":\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\",\"description\":\"Rocket LMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(46,27,'ar','{\"link\":\"\\/classes\",\"title\":\"\\u0627\\u0628\\u062f\\u0623 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0641\\u064a \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a ...\",\"description\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Rocket LMS \\u0644\\u0644\\u0648\\u0635\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0639\\u0627\\u0644\\u064a\\u0629 \\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u062f\\u0648\\u0646 \\u0623\\u064a \\u0642\\u064a\\u0648\\u062f \\u0648\\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(47,27,'es','{\"link\":\"\\/classes\",\"title\":\"Empiece a aprender en cualquier lugar, en cualquier momento ...\",\"description\":\"Utilice Rocket LMS para acceder a materiales educativos de alta calidad sin limitaciones de la forma m\\u00e1s sencilla.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(48,29,'ar','{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user-ar.png\"}'),
(49,29,'es','{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user-sp.png\"}'),
(50,4,'es','{\"first_column\":{\"title\":\"Sobre Nosotras\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS es un sistema de gesti\\u00f3n de aprendizaje con todas las funciones que le ayuda a gestionar su negocio educativo en varias horas. Esta plataforma ayuda a los instructores a crear materiales educativos profesionales y ayuda a los estudiantes a aprender de los mejores instructores.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"Enlaces Adicionales\",\"value\":\"<p><a href=\\\"\\/login\\\"><span style=\\\"color: #ffffff;\\\">- Acceso<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/register\\\"><span style=\\\"color: #ffffff;\\\">- Registrarse<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/blog\\\"><span style=\\\"color: #ffffff;\\\">- Blog<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/contact\\\"><span style=\\\"color: #ffffff;\\\">- Contacta con nosotras<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/certificate_validation\\\"><span style=\\\"color: #ffffff;\\\">- Validaci\\u00f3n de certificado<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/become-instructor\\\"><span style=\\\"color: #ffffff;\\\">- Convi\\u00e9rtete en instructor<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/terms\\\"><span style=\\\"color: #ffffff;\\\">- T\\u00e9rminos y reglas<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/about\\\"><span style=\\\"color: #ffffff;\\\">- Sobre nosotras<\\/span><\\/a><\\/p>\"},\"third_column\":{\"title\":\"Negocios Similares\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Masterclass<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"Compra Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),
(51,26,'es','{\"02nh9a\":{\"title\":\"hogar\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"Cursos\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"Instructoras\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"VBxDrB\":{\"title\":\"Blog\",\"link\":\"\\/blog\",\"order\":\"4\"},\"Uo5b2v\":{\"title\":\"Tienda\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"Foros\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),
(52,26,'ar','{\"02nh9a\":{\"title\":\"\\u0627\\u0644\\u0635\\u0641\\u062d\\u0629 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"\\u0627\\u0644\\u062f\\u0648\\u0631\\u0627\\u062a\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"\\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"Uo5b2v\":{\"title\":\"\\u0645\\u062a\\u062c\\u0631\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"\\u0627\\u0644\\u0645\\u0646\\u062a\\u062f\\u064a\\u0627\\u062a\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),
(53,32,'ar','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"\\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u062f\\u0631\\u0628\",\"description\":\"\\u062a\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u061f \\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0645\\u0639\\u0627\\u064a\\u064a\\u0631 \\u0645\\u062e\\u062a\\u0644\\u0641\\u0629 \\u0645\\u062b\\u0644 \\u0627\\u0644\\u062c\\u0646\\u0633 \\u0648\\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u0647\\u0627\\u0631\\u0629 \\u0648\\u0627\\u0644\\u0633\\u0639\\u0631 \\u0648\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639 \\u0648\\u0627\\u0644\\u062a\\u0642\\u064a\\u064a\\u0645 \\u0648\\u0645\\u0627 \\u0625\\u0644\\u0649 \\u0630\\u0644\\u0643.\\r\\n\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629.\",\"button1\":{\"title\":\"\\u0627\\u0644\\u0628\\u0627\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"\\u0645\\u062f\\u0631\\u0633\\u0648\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629\",\"link\":\"\\/instructor-finder\"}}'),
(54,32,'es','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"Encuentra la mejor instructora\",\"description\":\"\\u00bfBuscas un instructor? Encuentre los mejores instructores seg\\u00fan diferentes par\\u00e1metros como g\\u00e9nero, nivel de habilidad, precio, tipo de reuni\\u00f3n, calificaci\\u00f3n, etc.\\r\\nEncuentra instructores en el mapa.\",\"button1\":{\"title\":\"Buscadora de tutores\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"Tutores en el mapa\",\"link\":\"\\/instructor-finder\"}}'),
(55,33,'ar','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a\",\"description\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Rocket LMS \\u0648\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0623\\u0646\\u0634\\u0637\\u0629 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629.\\r\\n\\u0633\\u062a\\u062a\\u0645\\u0643\\u0646 \\u0645\\u0646 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u062c\\u0648\\u0627\\u0626\\u0632 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0645\\u062c\\u0627\\u0646\\u064a\\u0629. \\u0627\\u0628\\u062f\\u0623 \\u0641\\u064a \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u0622\\u0646 \\u0648\\u0627\\u062c\\u0645\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637!\",\"button1\":{\"title\":\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0641\\u0622\\u062a\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\",\"link\":\"\\/panel\\/rewards\"}}'),
(56,33,'es','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"Gana puntos del club\",\"description\":\"Utilice Rocket LMS y gane puntos del club seg\\u00fan diferentes actividades.\\r\\nPodr\\u00e1s utilizar tus puntos del club para conseguir premios y cursos gratuitos. \\u00a1Comience a usar el sistema ahora y acumule puntos!\",\"button1\":{\"title\":\"Recompensas\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"club de puntos\",\"link\":\"\\/panel\\/rewards\"}}'),
(57,40,'ar','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064b\\u0627\",\"description\":\"\\u0647\\u0644 \\u0623\\u0646\\u062a \\u0645\\u0647\\u062a\\u0645 \\u0628\\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627\\u061f\\r\\n\\u064a\\u0645\\u0643\\u0646\\u0643 \\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0643\\u0645\\u062f\\u0631\\u0628 \\u0623\\u0648 \\u0645\\u0646\\u0638\\u0645\\u0629.\",\"button1\":{\"title\":\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0633\\u064b\\u0627\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"\\u062d\\u0632\\u0645 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644\",\"link\":\"become-instructor\\/packages\\/\"}}'),
(58,40,'es','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"Convi\\u00e9rtete en instructora\",\"description\":\"\\u00bfEst\\u00e1s interesado en ser parte de nuestra comunidad?\\r\\nPuedes ser parte de nuestra comunidad registr\\u00e1ndote como instructor u organizaci\\u00f3n.\",\"button1\":{\"title\":\"Convi\\u00e9rtete en instructora\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"Paquetes de registro\",\"link\":\"become-instructor\\/packages\\/\"}}'),
(59,42,'en','{\"primary\":\"#306fd7\",\"primary-border\":\"#306fd7\",\"primary-hover\":\"#303fd7\",\"primary-border-hover\":\"#303fd7\",\"primary-btn-shadow\":null,\"primary-btn-shadow-hover\":null,\"primary-btn-color\":null,\"primary-btn-color-hover\":null,\"secondary\":null,\"secondary-border\":null,\"secondary-hover\":null,\"secondary-border-hover\":null,\"secondary-btn-shadow\":null,\"secondary-btn-shadow-hover\":null,\"secondary-btn-color\":null,\"secondary-btn-color-hover\":null,\"front_body_background\":null,\"admin_primary\":\"#6777ef\"}'),
(60,44,'en','{\"cookie_settings_modal_message\":\"<p>When you visit any of our websites, it may store or retrieve information on your browser, mostly in the form of cookies. This information might be about you, your preferences or your device and is mostly used to make the site work as you expect it to. The information does not usually directly identify you, but it can give you a more personalized web experience. Because we respect your right to privacy, you can choose not to allow some types of cookies. Click on the different category headings to find out more and manage your preferences. Please note, that blocking some types of cookies may impact your experience of the site and the services we are able to offer.<\\/p>\",\"cookie_settings_modal_items\":{\"dDRjfkGvQfFzQJpa\":{\"title\":\"Strictly Necessary\",\"description\":\"These cookies are necessary for our website to function properly and cannot be switched off in our systems. They are usually only set in response to actions made by you that amount to a request for services, such as setting your privacy preferences, logging in or filling in forms, or where they\\u2019re essential to providing you with a service you have requested. You cannot opt out of these cookies. You can set your browser to block or alert you about these cookies, but if you do, some parts of the site will not then work. These cookies do not store any personally identifiable information.\",\"required\":\"1\"},\"mOzJowgvTnWFlRzz\":{\"title\":\"Performance Cookies\",\"description\":\"These cookies allow us to count visits and traffic sources so we can measure and improve the performance of our site. They help us to know which pages are the most and least popular and see how visitors move around the site, which helps us optimize your experience. All information these cookies collect is aggregated and therefore anonymous. If you do not allow these cookies we will not be able to use your data in this way.\",\"required\":\"0\"},\"XBMtdYaeSrqMicTH\":{\"title\":\"Functional Cookies\",\"description\":\"These cookies enable the website to provide enhanced functionality and personalization. They may be set by us or by third-party providers whose services we have added to our pages. If you do not allow these cookies then some or all of these services may not function properly.\",\"required\":\"0\"},\"XlLqzsvNpRqdcNWP\":{\"title\":\"Targeting Cookies\",\"description\":\"These cookies may be set through our site by our advertising partners. They may be used by those companies to build a profile of your interests and show you relevant adverts on other sites. They do not store directly personal information but are based on uniquely identifying your browser and internet device. If you do not allow these cookies, you will experience less targeted advertising.\",\"required\":\"0\"}}}'),
(61,41,'en','{\"status\":\"0\",\"virtual_product_commission\":\"20\",\"physical_product_commission\":\"10\",\"store_tax\":\"10\",\"possibility_create_virtual_product\":\"0\",\"possibility_create_physical_product\":\"0\",\"shipping_tracking_url\":\"https:\\/\\/www.tracking.my\\/\",\"activate_comments\":\"0\",\"show_address_selection_in_cart\":\"0\",\"take_address_selection_optional\":\"0\"}'),
(62,46,'en','{\"main\":{\"regular\":\"\\/store\\/1\\/fonts\\/montserrat-regular.woff2\",\"bold\":\"\\/store\\/1\\/fonts\\/montserrat-bold.woff2\",\"medium\":\"\\/store\\/1\\/fonts\\/montserrat-medium.woff2\"},\"rtl\":{\"regular\":\"\\/store\\/1\\/fonts\\/Vazir-Regular.woff2\",\"bold\":\"\\/store\\/1\\/fonts\\/Vazir-Bold.woff2\",\"medium\":\"\\/store\\/1\\/fonts\\/Vazir-Medium.woff2\"}}'),
(63,43,'en','{\"image\":\"\\/store\\/1\\/default_images\\/forums\\/forum_section.jpg\",\"title\":\"Have a Question? Ask it in forum and get answer\",\"description\":\"Our forums helps you to create your questions on different subjects and communicate with other forum users. Our users will help you to get the best answer!\",\"button1\":{\"title\":\"Create a new topic\",\"link\":\"\\/forums\\/create-topic\"},\"button2\":{\"title\":\"Browse forums\",\"link\":\"\\/forums\"}}'),
(64,45,'en','{\"mobile_app_hero_image\":\"\\/store\\/1\\/default_images\\/app_only.png\",\"mobile_app_description\":\"<div>Is an amazing, modern, and clean landing page for showcasing your app or anything else.<\\/div><div><br><\\/div><div>A mobile application or app is a computer program or software application designed to run on a mobile device such as a phone, tablet, or watch. Mobile applications often stand in contrast to desktop applications which are designed to run on desktop computers, and web applications which run in mobile web browsers rather than directly on the mobile device.<\\/div>\",\"mobile_app_buttons\":{\"htQgcSjzjLJlGRyY\":{\"title\":\"Download from Play Store\",\"link\":\"https:\\/\\/play.google.com\\/store\\/games\",\"icon\":\"\\/store\\/1\\/default_images\\/google-play.png\",\"color\":\"primary\"}}}'),
(65,48,'en','{\"image\":\"\\/store\\/1\\/default_images\\/ads_modal.png\",\"title\":\"Sales Campaign\",\"description\":\"We have a sales campaign on our promoted courses and products. You can purchase 150 products at a discounted price up to 50% discount.\",\"button1\":{\"title\":\"View Courses\",\"link\":\"\\/classes\"},\"button2\":{\"title\":\"View Products\",\"link\":\"\\/products\"}}'),
(66,52,'en','{\"show_guarantee_text\":\"1\",\"guarantee_text\":\"5 Days money back guarantee\",\"user_avatar_style\":\"ui_avatar\",\"default_user_avatar\":\"\\/store\\/1\\/default_images\\/default_profile.jpg\",\"platform_phone_and_email_position\":\"footer\"}'),
(67,47,'en','{\"webinar_reminder_schedule\":\"1\",\"meeting_reminder_schedule\":\"1\",\"subscribe_reminder_schedule\":\"48\"}'),
(68,61,'en','{\"offline_banks_status\":\"1\"}'),
(69,62,'en','{\"status\":\"0\",\"allow_sending_gift_for_courses\":\"0\",\"allow_sending_gift_for_bundles\":\"0\",\"allow_sending_gift_for_products\":\"0\"}'),
(70,63,'en','{\"status\":\"0\",\"unlock_registration_bonus_instantly\":\"0\",\"unlock_registration_bonus_with_referral\":\"0\",\"number_of_referred_users\":null,\"enable_referred_users_purchase\":\"0\",\"purchase_amount_for_unlocking_bonus\":null,\"registration_bonus_amount\":\"50\",\"bonus_wallet\":\"balance_wallet\"}'),
(71,57,'en','{\"enable_statistics\":\"1\",\"display_default_statistics\":\"1\"}'),
(72,56,'en','{\"currency\":\"TND\",\"currency_position\":\"left\",\"currency_separator\":\"dot\",\"currency_decimal\":\"2\",\"multi_currency\":\"0\"}'),
(73,53,'en','{\"login_device_limit\":\"0\",\"number_of_allowed_devices\":\"10\",\"captcha_for_admin_login\":\"0\",\"captcha_for_admin_forgot_pass\":\"0\",\"captcha_for_login\":\"0\",\"captcha_for_register\":\"0\",\"captcha_for_forgot_pass\":\"0\",\"admin_panel_url\":\"admin\"}'),
(74,54,'en','{\"status\":\"0\",\"disable_course_access_when_user_have_an_overdue_installment\":\"0\",\"disable_all_courses_access_when_user_have_an_overdue_installment\":\"0\",\"disable_instalments_when_the_user_have_an_overdue_installment\":\"0\",\"allow_cancel_verification\":\"0\",\"display_installment_button\":\"0\",\"overdue_interval_days\":\"3\",\"installment_plans_position\":\"top_of_page\",\"reminder_before_overdue_days\":\"3\",\"reminder_after_overdue_days\":\"2\"}'),
(75,58,'en','{\"title\":\"We are under maintenance!\",\"image\":\"\\/store\\/1\\/default_images\\/maintenance.png\",\"description\":\"We are working on the platform; It won\'t take a long time. We will try to back as soon as possible.\",\"maintenance_button\":{\"title\":\"Sample Button\",\"link\":\"\\/\"},\"end_date\":1740094200}'),
(76,64,'en','{\"term_image\":\"\\/store\\/1\\/default_images\\/registration bonus\\/banner.png\",\"items\":{\"DnrPr\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step1.svg\",\"title\":\"Sign up\",\"description\":\"Create an account on platform and get $50\"},\"eNMTB\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step2.svg\",\"title\":\"Refer your friends\",\"description\":\"Refer at least 5 users to the system using your affiliate URL\"},\"fdIUc\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step3.svg\",\"title\":\"Reach purchase target\",\"description\":\"Each referred user should purchase $100 on the platform\"},\"oeMZr\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step4.svg\",\"title\":\"Unlock your bonus\",\"description\":\"Your bonus will be unlocked! Enjoy spending...\"}}}'),
(77,55,'en','{\"terms_description\":\"<p>Welcome to our website! To ensure the best possible experience for all users, please review and agree to the following terms and rules before using our installment feature:<\\/p><p>Installment Payment Plan: Our website offers an installment payment plan for select courses. By selecting the installment payment option, you agree to pay the full course fee in multiple installments. Each installment payment will be automatically deducted from the payment method you provided on the scheduled dates until the full payment is completed.<\\/p><p>Payment Plan Fees: Our installment payment plan may include a small processing fee for each installment payment. The total processing fee will be disclosed to you before you select the installment payment option.<\\/p><p>Late Payment: If a payment is not received on the scheduled date, a late payment fee may be added to the next scheduled payment.<\\/p><p>Refunds: Once an installment payment is made, it is non-refundable. However, if you wish to cancel your enrollment in the course, you may be eligible for a partial refund according to our Refund Policy.<\\/p><p>Default: If you default on a payment or fail to complete the full payment plan, your access to the course will be revoked, and you may be subject to additional fees and collection efforts.<\\/p><p>Privacy: Your personal and payment information will be kept secure and confidential. We use industry-standard security measures to protect your information.<\\/p><p>Changes to Terms and Rules: We reserve the right to modify these terms and rules at any time. Any changes will be posted on our website and will become effective immediately upon posting.<\\/p><p>By using our installment payment plan, you agree to these terms and rules. If you have any questions or concerns, please contact our support team.<\\/p>\"}'),
(78,65,'en','{\"status\":\"0\",\"active_for_admin_panel\":\"0\",\"active_for_organization_panel\":\"0\",\"active_for_instructor_panel\":\"0\",\"secret_key\":null,\"activate_text_service_type\":\"0\",\"text_service_type\":\"gpt-3.5-turbo\",\"number_of_text_generated_per_request\":\"1\",\"max_tokens\":\"500\",\"activate_image_service_type\":\"0\",\"number_of_images_generated_per_request\":\"1\"}'),
(79,66,'en','{\"_token\":\"Vs87fzAsqf3B65jxoRr8f2ivsRcK85A3dSF9123H\",\"page\":\"general\",\"name\":\"certificate_settings\",\"locale\":\"en\",\"status\":\"0\",\"certificate_id\":\"CR\",\"ltr_font\":\"\\/store\\/1\\/fonts\\/montserrat-medium.woff2\",\"rtl_font\":\"\\/store\\/1\\/fonts\\/Vazir-Medium.woff2\",\"certificate_api_user_id\":null,\"certificate_api_key\":null}'),
(80,67,'en','{\"status\":\"0\",\"reset_cart_items\":\"0\",\"reset_hours\":null,\"default_cart_reminder\":\"121\",\"default_cart_coupon_template\":\"122\"}'),
(81,68,'en','{\"title\":\"Access Limited\",\"image\":\"\\/store\\/1\\/default_images\\/maintenance.png\",\"description\":\"Your IP is not allowed to access the website.\"}'),
(82,59,'en','{\"direct_publication_of_courses\":\"0\",\"direct_publication_of_comments\":\"0\",\"direct_publication_of_reviews\":\"0\",\"direct_publication_of_blog\":\"0\",\"allow_instructor_delete_content\":\"1\",\"content_delete_method\":\"delete_with_admin_approval\",\"disable_registration_verification_process\":null}'),
(83,69,'en','{\"courses\":{\"type\":\"percent\",\"value\":\"20\"},\"bundles\":{\"type\":\"percent\",\"value\":\"20\"},\"virtual_products\":{\"type\":\"percent\",\"value\":\"30\"},\"physical_products\":{\"type\":\"percent\",\"value\":\"10\"},\"meetings\":{\"type\":\"percent\",\"value\":\"30\"}}');
/*!40000 ALTER TABLE `setting_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` enum('general','financial','personalization','notifications','seo','customization','other') NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'seo','seo_metas',1709806236),
(2,'general','socials',1632121340),
(4,'other','footer',1632071275),
(5,'general','general',1741004150),
(6,'financial','financial',1737453542),
(8,'personalization','home_hero',1733676100),
(12,'customization','custom_css_js',1636119881),
(14,'personalization','page_background',1709889935),
(15,'personalization','home_hero2',1632223631),
(20,'other','report_reasons',1632235945),
(22,'notifications','notifications',1737988986),
(23,'financial','site_bank_accounts',1617002426),
(24,'other','contact_us',1664436566),
(25,'personalization','home_sections',1653226117),
(26,'other','navbar_links',1647616036),
(27,'personalization','home_video_or_image_box',1632226618),
(28,'other','404',1678950792),
(29,'personalization','panel_sidebar',1642355954),
(30,'financial','referral',1709912090),
(31,'general','features',1735035832),
(32,'personalization','find_instructors',1642530710),
(33,'personalization','reward_program',1645628594),
(34,'general','rewards_settings',1709911723),
(37,'financial','registration_packages_general',1709911736),
(38,'financial','registration_packages_instructors',1709911741),
(39,'financial','registration_packages_organizations',1709911746),
(40,'personalization','become_instructor_section',1742202650),
(41,'general','store_settings',1709911645),
(42,'personalization','theme_colors',1736332453),
(43,'personalization','forums_section',1733680007),
(44,'personalization','cookie_settings',1653487194),
(45,'personalization','mobile_app',1653489015),
(46,'personalization','theme_fonts',1677180546),
(47,'general','reminders',1650982581),
(48,'other','advertising_modal',1652000772),
(52,'personalization','others_personalization',1678148917),
(53,'general','security',1709912634),
(54,'general','installments_settings',1709911763),
(55,'general','installments_terms_settings',1679089417),
(56,'financial','currency_settings',1736948848),
(57,'personalization','statistics',1678151460),
(58,'personalization','maintenance_settings',1678873553),
(59,'general','general_options',1709710542),
(60,'financial','offline_banks_credits',1676303092),
(61,'financial','offline_banks',1737451629),
(62,'general','gifts_general_settings',1709911871),
(63,'general','registration_bonus_settings',1709911891),
(64,'general','registration_bonus_terms_settings',1678898719),
(65,'general','ai_contents_settings',1709911684),
(66,'general','certificate_settings',1709911596),
(67,'general','abandoned_cart_settings',1709911815),
(68,'personalization','restriction_settings',1709805826),
(69,'financial','commission_settings',1719762024);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_offers`
--

DROP TABLE IF EXISTS `special_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `percent` int(10) unsigned NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `from_date` int(10) unsigned NOT NULL,
  `to_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `special_offers_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `special_offers_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `special_offers_bundle_id_foreign` (`bundle_id`),
  KEY `special_offers_subscribe_id_foreign` (`subscribe_id`),
  KEY `special_offers_registration_package_id_foreign` (`registration_package_id`),
  CONSTRAINT `special_offers_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_registration_package_id_foreign` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_offers`
--

LOCK TABLES `special_offers` WRITE;
/*!40000 ALTER TABLE `special_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_reminds`
--

DROP TABLE IF EXISTS `subscribe_reminds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe_reminds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subscribe_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribe_reminds_subscribe_id_foreign` (`subscribe_id`),
  KEY `subscribe_reminds_user_id_foreign` (`user_id`),
  CONSTRAINT `subscribe_reminds_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_reminds`
--

LOCK TABLES `subscribe_reminds` WRITE;
/*!40000 ALTER TABLE `subscribe_reminds` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_reminds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_translations`
--

DROP TABLE IF EXISTS `subscribe_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscribe_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribe_translations_subscribe_id_foreign` (`subscribe_id`),
  KEY `subscribe_translations_locale_index` (`locale`),
  CONSTRAINT `subscribe_translations_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_translations`
--

LOCK TABLES `subscribe_translations` WRITE;
/*!40000 ALTER TABLE `subscribe_translations` DISABLE KEYS */;
INSERT INTO `subscribe_translations` VALUES
(10,7,'en','subscribe',NULL);
/*!40000 ALTER TABLE `subscribe_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_uses`
--

DROP TABLE IF EXISTS `subscribe_uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe_uses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subscribe_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `sale_id` int(10) unsigned NOT NULL,
  `installment_order_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subscribe_uses_user_id_foreign` (`user_id`) USING BTREE,
  KEY `subscribe_uses_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `subscribe_uses_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `subscribe_uses_sale_id_foreign` (`sale_id`) USING BTREE,
  KEY `subscribe_uses_bundle_id_foreign` (`bundle_id`),
  KEY `subscribe_uses_installment_order_id_foreign` (`installment_order_id`),
  CONSTRAINT `subscribe_uses_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_installment_order_id_foreign` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_uses`
--

LOCK TABLES `subscribe_uses` WRITE;
/*!40000 ALTER TABLE `subscribe_uses` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribes`
--

DROP TABLE IF EXISTS `subscribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usable_count` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `icon` varchar(255) NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `infinite_use` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribes`
--

LOCK TABLES `subscribes` WRITE;
/*!40000 ALTER TABLE `subscribes` DISABLE KEYS */;
INSERT INTO `subscribes` VALUES
(7,8,5,0.00,'/store/1/MedIn.png',0,0,1733735516);
/*!40000 ALTER TABLE `subscribes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_conversations`
--

DROP TABLE IF EXISTS `support_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_conversations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `support_id` int(10) unsigned NOT NULL,
  `supporter_id` int(10) unsigned DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `support_conversations_support_id_foreign` (`support_id`) USING BTREE,
  KEY `support_conversations_sender_id_foreign` (`sender_id`) USING BTREE,
  KEY `support_conversations_supporter_id_foreign` (`supporter_id`) USING BTREE,
  CONSTRAINT `support_conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_conversations_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_conversations`
--

LOCK TABLES `support_conversations` WRITE;
/*!40000 ALTER TABLE `support_conversations` DISABLE KEYS */;
INSERT INTO `support_conversations` VALUES
(64,35,1,NULL,'https://github.com/','gj but can u please check this link and consider it as plus for ur course.',1741951236),
(65,36,1,NULL,'https://github.com/','second test',1741951383);
/*!40000 ALTER TABLE `support_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_department_translations`
--

DROP TABLE IF EXISTS `support_department_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_department_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `support_department_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_department_id` (`support_department_id`),
  KEY `support_department_translations_locale_index` (`locale`),
  CONSTRAINT `support_department_id` FOREIGN KEY (`support_department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_department_translations`
--

LOCK TABLES `support_department_translations` WRITE;
/*!40000 ALTER TABLE `support_department_translations` DISABLE KEYS */;
INSERT INTO `support_department_translations` VALUES
(10,8,'en','class');
/*!40000 ALTER TABLE `support_department_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_departments`
--

DROP TABLE IF EXISTS `support_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_departments`
--

LOCK TABLES `support_departments` WRITE;
/*!40000 ALTER TABLE `support_departments` DISABLE KEYS */;
INSERT INTO `support_departments` VALUES
(8,1741951209);
/*!40000 ALTER TABLE `support_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('open','close','replied','supporter_replied') NOT NULL DEFAULT 'open',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supports_user_id_foreign` (`user_id`) USING BTREE,
  KEY `supports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `supports_department_id_foreign` (`department_id`) USING BTREE,
  CONSTRAINT `supports_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
INSERT INTO `supports` VALUES
(35,1072,NULL,8,'annonce','open',1741951236,1741951236),
(36,1072,NULL,8,'annonce','open',1741951383,1741951383);
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `upcoming_course_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tags_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `tags_bundle_id_foreign` (`bundle_id`),
  KEY `tags_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `tags_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6731 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(6728,'chu ',2092,NULL,NULL),
(6729,'med',2092,NULL,NULL),
(6730,'gh',2092,NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_webinar_lists`
--

DROP TABLE IF EXISTS `teacher_webinar_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_webinar_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `instructor_id` int(10) unsigned NOT NULL,
  `status` enum('draft','waiting','done','reject') NOT NULL DEFAULT 'draft',
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_webinar_lists_webinar_id_foreign` (`webinar_id`),
  KEY `teacher_webinar_lists_instructor_id_foreign` (`instructor_id`),
  CONSTRAINT `teacher_webinar_lists_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_webinar_lists_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_webinar_lists`
--

LOCK TABLES `teacher_webinar_lists` WRITE;
/*!40000 ALTER TABLE `teacher_webinar_lists` DISABLE KEYS */;
INSERT INTO `teacher_webinar_lists` VALUES
(2,2098,1071,'done',1747474268);
/*!40000 ALTER TABLE `teacher_webinar_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_certificates`
--

DROP TABLE IF EXISTS `teachers_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers_certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('draft','waiting','done','reject') NOT NULL DEFAULT 'draft',
  `created_at` int(11) NOT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teachers_certificates_webinar_id_foreign` (`webinar_id`),
  KEY `teachers_certificates_list_id_foreign` (`list_id`),
  CONSTRAINT `teachers_certificates_list_id_foreign` FOREIGN KEY (`list_id`) REFERENCES `teacher_webinar_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_certificates_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_certificates`
--

LOCK TABLES `teachers_certificates` WRITE;
/*!40000 ALTER TABLE `teachers_certificates` DISABLE KEYS */;
INSERT INTO `teachers_certificates` VALUES
(4,2098,'racha','Rasha.zaibi@gmail.com','draft',1747474271,2);
/*!40000 ALTER TABLE `teachers_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial_translations`
--

DROP TABLE IF EXISTS `testimonial_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonial_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_bio` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonial_translations_testimonial_id_foreign` (`testimonial_id`),
  KEY `testimonial_translations_locale_index` (`locale`),
  CONSTRAINT `testimonial_translations_testimonial_id_foreign` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial_translations`
--

LOCK TABLES `testimonial_translations` WRITE;
/*!40000 ALTER TABLE `testimonial_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonial_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_avatar` varchar(255) NOT NULL,
  `rate` varchar(5) NOT NULL DEFAULT '0',
  `status` enum('active','disable') NOT NULL DEFAULT 'disable',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_lesson_translations`
--

DROP TABLE IF EXISTS `text_lesson_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `text_lesson_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text_lesson_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text_lesson_id` (`text_lesson_id`),
  KEY `text_lesson_translations_locale_index` (`locale`),
  CONSTRAINT `text_lesson_id` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_lesson_translations`
--

LOCK TABLES `text_lesson_translations` WRITE;
/*!40000 ALTER TABLE `text_lesson_translations` DISABLE KEYS */;
INSERT INTO `text_lesson_translations` VALUES
(22,30,'en','CHU','CHU students','<p>fjghkdfnskc,nw jzfgoqJSDLQ&nbsp;</p>'),
(23,31,'en','PG1','GETTING STARTING','<p>THIS IS A STARTER POINT</p>'),
(24,32,'en','sdcqsd','DFGHJKLKJNBV','<p>FGHJKL.?NBVB</p>'),
(25,33,'en','Public','ghjk','<p>fghjklxw</p>'),
(26,34,'en','sdfsq','dfsdfds','<p>qsdqfdsq</p>');
/*!40000 ALTER TABLE `text_lesson_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_lessons`
--

DROP TABLE IF EXISTS `text_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `text_lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `study_time` int(10) unsigned DEFAULT NULL,
  `accessibility` enum('free','paid') NOT NULL DEFAULT 'free',
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `text_lessons_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `text_lessons_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `text_lessons_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `text_lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_lessons`
--

LOCK TABLES `text_lessons` WRITE;
/*!40000 ALTER TABLE `text_lessons` DISABLE KEYS */;
INSERT INTO `text_lessons` VALUES
(30,1072,2092,78,'/store/1072/Screenshot_1737991509.png',30,'free',0,NULL,1,'active',1741950041,NULL),
(31,1072,2092,79,NULL,60,'free',0,NULL,2,'active',1741950104,NULL),
(32,1071,2095,86,NULL,33,'free',0,NULL,1,'active',1742213660,NULL),
(33,1071,2095,87,NULL,45,'free',0,NULL,2,'active',1742213730,NULL),
(34,1071,2095,88,NULL,22,'free',0,NULL,3,'active',1742213964,NULL);
/*!40000 ALTER TABLE `text_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_lessons_attachments`
--

DROP TABLE IF EXISTS `text_lessons_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `text_lessons_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text_lesson_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `text_lessons_attachments_text_lesson_id_foreign` (`text_lesson_id`) USING BTREE,
  KEY `text_lessons_attachments_file_id_foreign` (`file_id`) USING BTREE,
  CONSTRAINT `text_lessons_attachments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_attachments_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_lessons_attachments`
--

LOCK TABLES `text_lessons_attachments` WRITE;
/*!40000 ALTER TABLE `text_lessons_attachments` DISABLE KEYS */;
INSERT INTO `text_lessons_attachments` VALUES
(31,30,97,1741950041),
(32,31,97,1741950104);
/*!40000 ALTER TABLE `text_lessons_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_translations`
--

DROP TABLE IF EXISTS `ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_translations_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_translations_locale_index` (`locale`),
  CONSTRAINT `ticket_translations_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_translations`
--

LOCK TABLES `ticket_translations` WRITE;
/*!40000 ALTER TABLE `ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_users`
--

DROP TABLE IF EXISTS `ticket_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ticket_users_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `ticket_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `ticket_users_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_users`
--

LOCK TABLES `ticket_users` WRITE;
/*!40000 ALTER TABLE `ticket_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `start_date` int(10) unsigned DEFAULT NULL,
  `end_date` int(10) unsigned DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tickets_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `tickets_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `tickets_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `tickets_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trend_categories`
--

DROP TABLE IF EXISTS `trend_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trend_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `icon` varchar(255) NOT NULL,
  `color` varchar(32) NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `trend_categories_category_id_index` (`category_id`) USING BTREE,
  CONSTRAINT `trend_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trend_categories`
--

LOCK TABLES `trend_categories` WRITE;
/*!40000 ALTER TABLE `trend_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `trend_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_course_filter_option`
--

DROP TABLE IF EXISTS `upcoming_course_filter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_course_filter_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_filter_option_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_filter_option_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `upcoming_course_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_course_filter_option_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_course_filter_option`
--

LOCK TABLES `upcoming_course_filter_option` WRITE;
/*!40000 ALTER TABLE `upcoming_course_filter_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `upcoming_course_filter_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_course_followers`
--

DROP TABLE IF EXISTS `upcoming_course_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_course_followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_followers_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_followers_user_id_foreign` (`user_id`),
  CONSTRAINT `upcoming_course_followers_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_course_followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_course_followers`
--

LOCK TABLES `upcoming_course_followers` WRITE;
/*!40000 ALTER TABLE `upcoming_course_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `upcoming_course_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_course_reports`
--

DROP TABLE IF EXISTS `upcoming_course_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_course_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_reports_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_reports_user_id_foreign` (`user_id`),
  CONSTRAINT `upcoming_course_reports_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_course_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_course_reports`
--

LOCK TABLES `upcoming_course_reports` WRITE;
/*!40000 ALTER TABLE `upcoming_course_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `upcoming_course_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_course_translations`
--

DROP TABLE IF EXISTS `upcoming_course_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_course_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_translations_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_translations_locale_index` (`locale`),
  CONSTRAINT `upcoming_course_translations_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_course_translations`
--

LOCK TABLES `upcoming_course_translations` WRITE;
/*!40000 ALTER TABLE `upcoming_course_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `upcoming_course_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_courses`
--

DROP TABLE IF EXISTS `upcoming_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL COMMENT 'when assigned a course',
  `type` enum('webinar','course','text_lesson') NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image_cover` varchar(255) NOT NULL,
  `video_demo` varchar(255) DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link','secure_host') DEFAULT NULL,
  `publish_date` bigint(20) unsigned DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `points` int(10) unsigned DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `sections` int(10) unsigned DEFAULT NULL,
  `parts` int(10) unsigned DEFAULT NULL,
  `course_progress` int(10) unsigned DEFAULT NULL,
  `support` tinyint(1) NOT NULL DEFAULT 0,
  `certificate` tinyint(1) NOT NULL DEFAULT 0,
  `include_quizzes` tinyint(1) NOT NULL DEFAULT 0,
  `downloadable` tinyint(1) NOT NULL DEFAULT 0,
  `forum` tinyint(1) NOT NULL DEFAULT 0,
  `message_for_reviewer` text DEFAULT NULL,
  `status` enum('active','pending','is_draft','inactive') NOT NULL DEFAULT 'is_draft',
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upcoming_courses_slug_unique` (`slug`),
  KEY `upcoming_courses_creator_id_foreign` (`creator_id`),
  KEY `upcoming_courses_teacher_id_foreign` (`teacher_id`),
  KEY `upcoming_courses_category_id_foreign` (`category_id`),
  KEY `upcoming_courses_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `upcoming_courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_courses_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_courses_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_courses_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_courses`
--

LOCK TABLES `upcoming_courses` WRITE;
/*!40000 ALTER TABLE `upcoming_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `upcoming_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bank_specification_translations`
--

DROP TABLE IF EXISTS `user_bank_specification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bank_specification_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_bank_specification_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_specification_id` (`user_bank_specification_id`),
  KEY `user_bank_specification_translations_locale_index` (`locale`),
  CONSTRAINT `user_bank_specification_id` FOREIGN KEY (`user_bank_specification_id`) REFERENCES `user_bank_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bank_specification_translations`
--

LOCK TABLES `user_bank_specification_translations` WRITE;
/*!40000 ALTER TABLE `user_bank_specification_translations` DISABLE KEYS */;
INSERT INTO `user_bank_specification_translations` VALUES
(15,10,'en','Account Holder'),
(16,11,'en','Email'),
(17,12,'en','Account Holder'),
(18,13,'en','Account ID');
/*!40000 ALTER TABLE `user_bank_specification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bank_specifications`
--

DROP TABLE IF EXISTS `user_bank_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bank_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_bank_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_specifications_user_bank_id_foreign` (`user_bank_id`),
  CONSTRAINT `user_bank_specifications_user_bank_id_foreign` FOREIGN KEY (`user_bank_id`) REFERENCES `user_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bank_specifications`
--

LOCK TABLES `user_bank_specifications` WRITE;
/*!40000 ALTER TABLE `user_bank_specifications` DISABLE KEYS */;
INSERT INTO `user_bank_specifications` VALUES
(10,4),
(11,4),
(12,5),
(13,5);
/*!40000 ALTER TABLE `user_bank_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bank_translations`
--

DROP TABLE IF EXISTS `user_bank_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bank_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_bank_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_translations_user_bank_id_foreign` (`user_bank_id`),
  KEY `user_bank_translations_locale_index` (`locale`),
  CONSTRAINT `user_bank_translations_user_bank_id_foreign` FOREIGN KEY (`user_bank_id`) REFERENCES `user_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bank_translations`
--

LOCK TABLES `user_bank_translations` WRITE;
/*!40000 ALTER TABLE `user_bank_translations` DISABLE KEYS */;
INSERT INTO `user_bank_translations` VALUES
(6,4,'en','Paypal'),
(7,5,'en','Stripe');
/*!40000 ALTER TABLE `user_bank_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_banks`
--

DROP TABLE IF EXISTS `user_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_banks`
--

LOCK TABLES `user_banks` WRITE;
/*!40000 ALTER TABLE `user_banks` DISABLE KEYS */;
INSERT INTO `user_banks` VALUES
(4,'/store/1/default_images/payment gateways/paypal.png',1678874235),
(5,'/store/1/default_images/payment gateways/stripe.png',1679090196);
/*!40000 ALTER TABLE `user_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_commissions`
--

DROP TABLE IF EXISTS `user_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_commissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_group_id` int(10) unsigned DEFAULT NULL,
  `source` enum('courses','bundles','virtual_products','physical_products','meetings') NOT NULL,
  `type` enum('percent','fixed_amount') NOT NULL,
  `value` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_commissions_user_id_foreign` (`user_id`),
  KEY `user_commissions_user_group_id_foreign` (`user_group_id`),
  CONSTRAINT `user_commissions_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_commissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_commissions`
--

LOCK TABLES `user_commissions` WRITE;
/*!40000 ALTER TABLE `user_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_firebase_sessions`
--

DROP TABLE IF EXISTS `user_firebase_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_firebase_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` text NOT NULL,
  `fcm_token` text DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_firebase_sessions_user_id_foreign` (`user_id`),
  CONSTRAINT `user_firebase_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_firebase_sessions`
--

LOCK TABLES `user_firebase_sessions` WRITE;
/*!40000 ALTER TABLE `user_firebase_sessions` DISABLE KEYS */;
INSERT INTO `user_firebase_sessions` VALUES
(60,1051,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjE2LjEwLjE1Njo4MDAwL2FwaS9kZXZlbG9wbWVudC9sb2dpbiIsImlhdCI6MTczNDYyNDUzNywibmJmIjoxNzM0NjI0NTM3LCJqdGkiOiJjWUZQY21ncUNNbUpyVVJUIiwic3ViIjoiMTA1MSIsInBydiI6IjQwYTk3ZmNhMmQ0MjRlNzc4YTA3YTBhMmYxMmRjNTE3YTg1Y2JkYzEifQ.mRDYZMmQx0d0_6OG4ojMVXnt29sonjedGDyPZfR_RuI','fvlemfdqRlKuTNFMsNQ87G:APA91bECDw7Yg0Wd5tRSCpCB0ieyYM4S23jDjDADaWX35Z-csRrLW6sPW-7H7zxR-WldjJ3sKABYvbZSbspRPgZ2GAf9hY0drt49tBQ-yAv1ZbGp95oVy_g','172.16.10.156','2024-12-19 15:08:57','2024-12-19 15:08:59'),
(61,1051,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjE2LjEwLjE1Njo4MDAwL2FwaS9kZXZlbG9wbWVudC9sb2dpbiIsImlhdCI6MTczNDY4OTQ2NywibmJmIjoxNzM0Njg5NDY3LCJqdGkiOiJ6czM4UDQ3NlVlM0xnME9JIiwic3ViIjoiMTA1MSIsInBydiI6IjQwYTk3ZmNhMmQ0MjRlNzc4YTA3YTBhMmYxMmRjNTE3YTg1Y2JkYzEifQ.no9kH7L61uFzkaSELGhAvdvJ49Wgq1mCOnFVu07-Dnw','eYm_1uSPSzK076nGFHBOtS:APA91bEzrXZ9pFn1qty6YnUaghJSsBAim8ZReL5cCd0V6X4hUASxdcxQ74YGXQ_UfFM0AvBeP_wF-PSzNy_PjqSkigJmPDQeuaPELK0o5bgs4Xy4o5BcYdU','172.16.10.156','2024-12-20 09:11:07','2024-12-20 09:11:08'),
(62,1051,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjE2LjEwLjE1Njo4MDAwL2FwaS9kZXZlbG9wbWVudC9sb2dpbiIsImlhdCI6MTczNDcwMzU3MCwibmJmIjoxNzM0NzAzNTcwLCJqdGkiOiJSVzhKM0g2dXE0bmNZMU5ZIiwic3ViIjoiMTA1MSIsInBydiI6IjQwYTk3ZmNhMmQ0MjRlNzc4YTA3YTBhMmYxMmRjNTE3YTg1Y2JkYzEifQ.Mdl1_KlV_2q6GURI1Xgp_GFBMubCTtvLZTT8FnitnXQ','cYT5DFngQ3iUE74PbmRmJu:APA91bFDJVEXdiKJmLAHrHmOGe06xbh0DGAssxKKuGmPK1QfsF2WNOXOmB4HNupNfrDgrUUvOmqHTdsnW2ny5er7YI-nt9XAkvm4bbsbZ7bqbN75YP2-wxk','172.16.10.189','2024-12-20 13:06:10','2024-12-20 13:06:11'),
(89,1050,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjY6ODAwMC9hcGkvZGV2ZWxvcG1lbnQvbG9naW4iLCJpYXQiOjE3MzU1ODQ4NTEsIm5iZiI6MTczNTU4NDg1MSwianRpIjoid3JCVjhsVndPYlJLVjZPTyIsInN1YiI6IjEwNTAiLCJwcnYiOiI0MGE5N2ZjYTJkNDI0ZTc3OGEwN2EwYTJmMTJkYzUxN2E4NWNiZGMxIn0.MWaN_dndlJ6XPP8vHks4PUkk-Rsb4vSl4SNth1OfjGc','cAn_xLn8SQ-XaD4F4UIgQk:APA91bEA_B_le8roPeDo0yuD5-F85YxFN3j5yCJtUNrhUS8wccKuE71dqkzVIVcyDMbhmEqYdW-COloBTVkzievUywC2tLFo07_lURiAFd43mqllTCFknBA','192.168.1.9','2024-12-30 17:54:11','2024-12-30 17:54:19'),
(92,1051,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjc6ODAwMC9hcGkvZGV2ZWxvcG1lbnQvZ29vZ2xlL2NhbGxiYWNrIiwiaWF0IjoxNzM5MzA2MTY4LCJuYmYiOjE3MzkzMDYxNjgsImp0aSI6IjRLV25memV6S2ZIOGFER0IiLCJzdWIiOiIxMDUxIiwicHJ2IjoiNDBhOTdmY2EyZDQyNGU3NzhhMDdhMGEyZjEyZGM1MTdhODVjYmRjMSJ9.Pzg4V2E-Z7Po5imRZvKbiJSgxS4MOAfpbiNgPydFn8U','f-Oj-QZfSSqTfr_w9cixMG:APA91bHzAk_GrnPSraJeoVN67mt6HvQs9n45dOay_2O7DnRudX8F1Py5BL-hRbDQ7nUh31qELmCqji_Sa_IA6POSBh1IuYOZus54tscX4bppVGJG9qXW3nY','192.168.1.6','2025-02-11 19:36:08','2025-02-11 19:37:31'),
(95,1050,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21lZGluLnRuL2FwaS9kZXZlbG9wbWVudC9sb2dpbiIsImlhdCI6MTc0MTY4ODE0MywibmJmIjoxNzQxNjg4MTQzLCJqdGkiOiJUckVEUDJqeVoyRFNaaTUwIiwic3ViIjoiMTA1MCIsInBydiI6IjQwYTk3ZmNhMmQ0MjRlNzc4YTA3YTBhMmYxMmRjNTE3YTg1Y2JkYzEifQ.TGnzbPAQa4vntpmpjELna-pTxC2sNIsXvPz3I9xBya0','cNnBZ4lUTX-UgpuG3aoxs9:APA91bEeKIJ2IKDTFfedXIkdEvQX5vdBJl3lVl3a4-1-11BYbJJ4QcPUFECdTXlqrenzcURzpYzcwQb8nFd08yrWwkRLaJMepGFEV_jOWY02pFEgytbr9xQ','51.178.141.233','2025-03-11 09:15:43','2025-03-11 09:15:44'),
(99,1051,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21lZGluLnRuL2FwaS9kZXZlbG9wbWVudC9nb29nbGUvY2FsbGJhY2siLCJpYXQiOjE3NDE4MTAzNTcsIm5iZiI6MTc0MTgxMDM1NywianRpIjoiSExkTlE4dHBFWThnUjgxcSIsInN1YiI6IjEwNTEiLCJwcnYiOiI0MGE5N2ZjYTJkNDI0ZTc3OGEwN2EwYTJmMTJkYzUxN2E4NWNiZGMxIn0.gAd6w0w9dQ3ExRqlQ1mwFWGOGjHBNOEf0W3C7s5dgX4','epbcIMIySCKDAjia4BB7YB:APA91bFO0WRxOWX6B7blZvsuijU1deovSLqnTRsutQH4sA0-jZlEXfUH1K2Obz9zpBgf6NHBC_CSPZyW5lxUuiDn8X4Ka20zdJllgIsVgYvOgUm33RmBNoY','41.225.210.184','2025-03-12 19:12:37','2025-03-12 19:12:39'),
(102,1051,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21lZGluLnRuL2FwaS9kZXZlbG9wbWVudC9nb29nbGUvY2FsbGJhY2siLCJpYXQiOjE3NDQwMzQ3OTUsIm5iZiI6MTc0NDAzNDc5NSwianRpIjoicTlwTUdBdXpzUE4xWEJ4NyIsInN1YiI6IjEwNTEiLCJwcnYiOiI0MGE5N2ZjYTJkNDI0ZTc3OGEwN2EwYTJmMTJkYzUxN2E4NWNiZGMxIn0.nLiL0t1-Wi6mr6VBrOcivW-dtbMkUZDf0jfajCOJqO8','f48sxiw-Q4GjlaimXhilRs:APA91bGKVNpr9qJ3Mnk5K_7ybDpESZcxB10cvU77vb1PtgE5OuFwnke2PLrbR5uNscwUfMX6qTYGehKDYfzNlJIY_LtAhqrAhbnOVUU58iXhIeqLm8sqd1c','41.229.253.90','2025-04-07 13:06:35','2025-04-07 13:06:35'),
(104,1071,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21lZGluLnRuL2FwaS9kZXZlbG9wbWVudC9sb2dpbiIsImlhdCI6MTc0NzQ3NDIxMCwibmJmIjoxNzQ3NDc0MjEwLCJqdGkiOiJ0ZHJkQ1pXQ3JNbExkblJrIiwic3ViIjoiMTA3MSIsInBydiI6IjQwYTk3ZmNhMmQ0MjRlNzc4YTA3YTBhMmYxMmRjNTE3YTg1Y2JkYzEifQ.vh2aLL0i1KgXyvIIPvPVkrUuHJ98zgKmYf_obSdoHSE','f48sxiw-Q4GjlaimXhilRs:APA91bG0yYF80c2QUyU04crQ5-hr3IYIid3o3L4UXIHbMXaxrxIppSptrekiF8nd2bbUdbJkJYkaEEuQkIKWm6SBuuwfQelxKhcxKk5xpiDZDvJz6p-IVbc','41.229.253.82','2025-05-17 08:30:10','2025-05-17 08:30:11');
/*!40000 ALTER TABLE `user_firebase_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_form_fields`
--

DROP TABLE IF EXISTS `user_form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_form_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `become_instructor_id` int(10) unsigned DEFAULT NULL,
  `form_field_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_form_fields_user_id_foreign` (`user_id`),
  KEY `user_form_fields_become_instructor_id_foreign` (`become_instructor_id`),
  KEY `user_form_fields_form_field_id_foreign` (`form_field_id`),
  CONSTRAINT `user_form_fields_become_instructor_id_foreign` FOREIGN KEY (`become_instructor_id`) REFERENCES `become_instructors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_form_fields_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_form_fields_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_form_fields`
--

LOCK TABLES `user_form_fields` WRITE;
/*!40000 ALTER TABLE `user_form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_histories`
--

DROP TABLE IF EXISTS `user_login_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `location` point DEFAULT NULL,
  `session_id` text NOT NULL,
  `session_start_at` bigint(20) unsigned DEFAULT NULL,
  `session_end_at` bigint(20) unsigned DEFAULT NULL,
  `end_session_type` enum('default','by_admin','by_user') DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_login_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `user_login_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_histories`
--

LOCK TABLES `user_login_histories` WRITE;
/*!40000 ALTER TABLE `user_login_histories` DISABLE KEYS */;
INSERT INTO `user_login_histories` VALUES
(25,1047,'Safari','desktop','OS X-10_15_7','165.51.40.188','Tunisia','Ben Gardane','\0\0\0\0\0\0\0Ä±.n£‘@@ÆÜµ„|p&@','icjSdB3ZVVVbEpPeCuaM52YpBxBcBdWqGDBt9VVv',1726449315,NULL,NULL,1726449315),
(26,1049,'Safari','desktop','OS X-10_15_7','165.51.40.188','Tunisia','Ben Gardane','\0\0\0\0\0\0\0Ä±.n£‘@@ÆÜµ„|p&@','iJ0L6u183dJfdaNmWZFVkzVdlYoLJFXxafK2X8bO',1726449693,NULL,NULL,1726449693),
(27,1,'Chrome','desktop','Windows-10.0','41.225.76.13','Tunisia','Tunis','\0\0\0\0\0\0\0šž^iB@eâXW$@','m2CZ4eaQcavk3F47lZCrEQv5YLGkcJLjiZauS3mb',1726468916,1726469615,'default',1726468916),
(28,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'HBs1dQjbLcWhs076mz1UiF9s1pNo9cuCaGdYjknV',1730799326,1730811049,'default',1730799326),
(29,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'lczZWLNckFMXtdExba3cXAOxTy192SuVZehi0nin',1730806503,NULL,NULL,1730806503),
(30,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'QORHKWLYzhIJYBkw0YwfOgVtt3I6iVjKIPK6TBYK',1730809700,NULL,NULL,1730809700),
(31,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'PdJD78C7IrKQP2JtHq7rNttJvoULnPI10H7Ysfmg',1730811080,1730814852,'default',1730811080),
(32,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'7q7TUD8bPHXPlqj9Dl3Pu5lHwlyt9Nz4pdDU15ls',1730811253,1730811286,'default',1730811253),
(33,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'210jkBKEaKWPUJiAqVZreQBIfIi14gOIPWZ7lE9h',1730811333,1730891720,'default',1730811333),
(34,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'H6vw9npn0GT4SLm5EZNuRT4U6zlxPRxvTuGsCuAv',1730811725,NULL,NULL,1730811725),
(35,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'yVa1U7WNdN2J2SICnovpHQf7Ne7lheVvLLUSnaLF',1730814062,NULL,NULL,1730814062),
(36,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'41yJlzQC40W11l5LIPiDX6qN0l35AZLUdpdzVNe1',1730814868,NULL,NULL,1730814868),
(37,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'yOtpl3vlNzitQDTSfUHXSzNPLbWCOD1OD6ATD6oZ',1730884335,NULL,NULL,1730884335),
(38,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'VRVD1D0YTeO4w8DZpooB1iuwk9W6VMNlcZehuqGB',1730890031,NULL,NULL,1730890031),
(39,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'xXvTSA1WPFZTkG17gRmqgtPF2Sw2Wxt5iXkCkIeB',1730891680,NULL,NULL,1730891680),
(40,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'8wWu0HtMNERbd5HFrgeBVZkb1cGbKUPZWBD5WTWJ',1730891732,1730891751,'default',1730891732),
(41,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'Va6tDECsyJi6YVze8woLaR1z6dAABAuG2CAX4oZA',1730891766,1730891833,'default',1730891766),
(42,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'FxeSZO1sbouop26PUowLdq6NLmep8UWynmSiDbi1',1730892661,1732903772,'default',1730892661),
(43,1054,'Edge','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'rSj2bsvKvGDgCt0SaXkFuFfoQopQwgVRDUrNcRrA',1730894417,NULL,NULL,1730894417),
(44,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'K4vSObjBVq6HjOJfqHOFStLYKHbKACpCisXWMv9j',1730904323,1735147983,'default',1730904323),
(45,1049,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'jgyRfxWBclcHu1bFxwgG7Jw9h6m8Z40zAm64wwCO',1730905985,1732903821,'default',1730905985),
(46,1049,'0','desktop','-',NULL,NULL,NULL,NULL,'HeZaEEA8iqjJqt9licZrvzZi9a8fZU5f8M6h4vNE',1730973005,NULL,NULL,1730973005),
(47,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'NfNERsLtiQrkCm9LUzbbh2Gduspp39Ts1Du0wd6N',1730974889,NULL,NULL,1730974889),
(48,1049,'0','desktop','-',NULL,NULL,NULL,NULL,'9bAThRtCJQRNmite78slPPRrbXGn7RX9RvCANJr9',1731059154,NULL,NULL,1731059154),
(49,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'NOOwo74Tp6hzQKLhl6erYNm0xBfPeowg3J9v2x6n',1731059208,NULL,NULL,1731059208),
(50,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'rvSFDAnnxU7lznt6A2R6CtY0ZCl7cOfsVB1q7Cxx',1731314558,NULL,NULL,1731314558),
(51,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'8Zaw0GHE5nHrsrK7QBtPmBpMJ6TZWHwkpKtd0e3I',1731340227,NULL,NULL,1731340227),
(52,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'aX8Chas0YvxgUPyVId2jc4dNqzFr1J9G6kXxT4wp',1731420131,NULL,NULL,1731420131),
(53,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'Knw7HGnIl8RHCsXSYAiQUH6ICuHdnQuWbQNC2jYZ',1731599658,NULL,NULL,1731599658),
(54,1055,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'yH15r4tpSa6kX4DvQCUwJi2x8iPnbP7eB5Sv5fHT',1731662371,1732903798,'default',1731662371),
(55,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'FBrFkBCezCFMHjtgwkOKjpjqtklGlC1yDkYjU6iV',1731683197,NULL,NULL,1731683197),
(56,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'SB1la8QN7Gg44tq1x633GFo4idYQbRxLBtKtxTkV',1731699518,NULL,NULL,1731699518),
(57,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'59K5V8uzGLhFGwni5uXWHt6GSGXARJhuhNl9HksZ',1731699717,NULL,NULL,1731699717),
(58,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'j2UQjceLkYWLrAeeEHrvu5gZIUYHo2lJKprco2j8',1731700138,NULL,NULL,1731700138),
(59,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'0z8ybDDTCOCJ8IHJtqwfyhhAxz93Oap0f5RFJtOD',1731700639,NULL,NULL,1731700639),
(60,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'MpTqLVphzesW2hmWpdtolg0LiWHvvQb4FFZNRnls',1731700685,NULL,NULL,1731700685),
(61,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'UwUzoVvSnXbv2L95IyLFtlaFGMO3qBvEJLFlo08K',1731701001,NULL,NULL,1731701001),
(62,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'eukdK9kUG6jeblTvFJKEZf1O4gaYnyqZhvtG7paY',1731701537,NULL,NULL,1731701537),
(63,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'1KRTums7ezMNzZOKwJ4zWeJi07XbkbRenNImN6lD',1731701940,NULL,NULL,1731701940),
(64,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'WvQOjuXbtQ9DnbrJNFLrWXg3FKOeoBKepYyxOCoL',1731702005,NULL,NULL,1731702005),
(65,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'PSGHYJ4CYzMKzqKdWBDsmhXHA18RftyxdfXYZQmS',1731702110,NULL,NULL,1731702110),
(66,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'RtdvbrU2LnZTGgUIjLyBGz1q00qxpr1Bb94Kfnh4',1731702275,NULL,NULL,1731702275),
(67,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'4ySmclQ5cwKf5kYZN1FeA1Pw8lztHHypVgGaxtU5',1731870403,NULL,NULL,1731870403),
(68,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'YtTEyasOj3RCl1s9mjYBdIKrDE99V4NaiBP1hr6U',1731871043,NULL,NULL,1731871043),
(69,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'3otD5FRdGoDw5AQ0vgunlM8c1vEGXq1a2fPGW7Xq',1731871127,NULL,NULL,1731871127),
(70,1054,'0','desktop','-',NULL,NULL,NULL,NULL,'j4anfXiMJfILaBxIq58lSX0exBa2CmQbmpRw8FYj',1731871362,NULL,NULL,1731871362),
(71,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'8jR8GIjtZpL4eb2n0hMLxRNoBUO5esS5Paxx8ydz',1732903137,1735147938,'default',1732903137),
(72,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'cqm6TNnm01JK1bKInfd5SXNpNhCB3An9usaAZhxB',1732903782,NULL,NULL,1732903782),
(73,1055,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'7y8eVXbgHh1V5zUNYGcRWxek4dGJfhOJn1gC0tB6',1732903809,1735148061,'default',1732903809),
(74,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'RQVvVJ2d6VBbySGIPw1r1l8rP624aoLz9jAXF4aO',1732903834,1735033358,'default',1732903834),
(75,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'lYyojtKYE9Lh3sjx5Ikr9Gw0bIFToVHm9WLkflia',1732903923,1735037301,'default',1732903923),
(76,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'vYJroaBT5sIU2h2NAu90Lz2lsGezrZrtZBSx0yl8',1732911849,NULL,NULL,1732911849),
(77,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'gG1jXNQd6M484DlXEKaLGqs9JkDQXgifR0qCbpAH',1733596364,NULL,NULL,1733596364),
(78,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'so7N1LS8KArrZZt0OWu7q79KyarW5igcX2zCM6i4',1733673429,NULL,NULL,1733673429),
(79,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'kFyUtUcu4e4TolzGbO4tANplrgqityjhebaThBX3',1733734021,NULL,NULL,1733734021),
(80,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'s1bFdvfoEZWYxf8kmhi5tJpjcKTzgi5vH1jVlzn3',1733914160,1734609709,'default',1733914160),
(81,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'ZsiolGDnZr5HCNViPcwa9wKckbGE43lDtGTyU3CD',1734093033,NULL,NULL,1734093033),
(82,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'FGhBNjK25jHZyBFyaIeco9MzjiprPfDfmJfYNXNd',1734093144,NULL,NULL,1734093144),
(83,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'1mHMFRlJJsUOuvpqrpaiwSEBaPdA1a9MzghlYznp',1734346962,NULL,NULL,1734346962),
(84,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'IyE3jB0LHg806GkPnJ3s5B4cekq3B9E10fWcdBJi',1734363986,NULL,NULL,1734363986),
(85,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'TSBVWW3eFdL1T6Z1LXiE6wlK3eTB2UyNm52tZNRQ',1734534847,NULL,NULL,1734534847),
(86,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'vrdqz0qu099kzToSOiFpAnFdGZ4zdBOahyuBEY1V',1734535823,NULL,NULL,1734535823),
(87,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'1SQJufLekqthIoJf3skS3ZZ1oipCwncJ5oF25LMA',1734609323,NULL,NULL,1734609323),
(88,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'VJCnF0LCWPLgZFwn5DSAdvIZBWuJkfMdMD00m6Wf',1734609717,NULL,NULL,1734609717),
(89,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'BwyglfhFRzBgU0CJ23ZFHEvsEB7DcCesHcFrqA8U',1734610896,NULL,NULL,1734610896),
(90,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'Z76BqwNWA37tZiD0onDsrr5axT6VOpgZw3fsNlAW',1734611329,NULL,NULL,1734611329),
(91,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'Cbk5RSAzTelB8nsTMgWB7JnDMxKyW9EwOESxGoT0',1734611635,NULL,NULL,1734611635),
(92,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'cZNGNiCM5zehtFpk3gewS6q6GLlLts7lGIQt9vlj',1734611840,NULL,NULL,1734611840),
(93,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'tVhQswGMOhTADQOU1R9t0K38rk8PHpBBRPHg5A8x',1734612977,NULL,NULL,1734612977),
(94,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'JmAVTovP30QjY3PxBBXuhBXG6qCZmin6HpLmhJfY',1734613242,NULL,NULL,1734613242),
(95,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'GB3mUJgbvOmLjun3iFIo1EDL9xkScobFMX5SzX8z',1734613761,NULL,NULL,1734613761),
(96,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'cOQ8ZOAVv9rSTZcZbs20FRF0K3LTtOKScMa7DWa9',1734613899,NULL,NULL,1734613899),
(97,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'TbjhlGLhFqwvG4YSBCeMRbc8Cb0UjYzw1VTeerQ7',1734614283,NULL,NULL,1734614283),
(98,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'5bZz7CW5kTfT10sqOFk6UEA2tWeHRIanHuhg8WwQ',1734614574,NULL,NULL,1734614574),
(99,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'9X43oLtAFCTA14omPaZ3bYAOEYkU1HeX8Ar7IPT3',1734614686,NULL,NULL,1734614686),
(100,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'L2C40ZUlWPc10JoH47udsW1MR1JqALfIRTPXUfqR',1734615511,NULL,NULL,1734615511),
(101,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'CwaHri10eF1OPAk3Q01mwD6K1Js7sUwV3QIEQiZo',1734616146,NULL,NULL,1734616146),
(102,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'OY9f6ptwnUz9MTpqWa1uTRmbmCR1NltJhF24Ucio',1734616406,NULL,NULL,1734616406),
(103,1051,'0','robot','-',NULL,NULL,NULL,NULL,'doUrKhv4ga47z7L2u3yI4RDmS2zZY5Ha4itGr3bF',1734616560,NULL,NULL,1734616560),
(104,1051,'0','robot','-',NULL,NULL,NULL,NULL,'ozXxSXmpNVFb4BHMridrtIF8NA5udyN21w8gLyVZ',1734616622,NULL,NULL,1734616622),
(105,1051,'0','robot','-',NULL,NULL,NULL,NULL,'E3uzTwK4p7ipic4wV7m53BVgTdPAdWVqKh5nCKzx',1734617024,NULL,NULL,1734617024),
(106,1051,'0','robot','-',NULL,NULL,NULL,NULL,'TQmSrdwnl8AfNO3d5iNCBJ3z0lUuIQagctmU177d',1734617522,NULL,NULL,1734617522),
(107,1051,'0','robot','-',NULL,NULL,NULL,NULL,'ocd0he9fUmI73EmkzDuxjNCCPQJr8JEz0MVDEMTq',1734617548,NULL,NULL,1734617548),
(108,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'oL2rBXUQ0qt6QF9S6vrngbtcM2e1a2nGERwLRpgN',1734617601,NULL,NULL,1734617601),
(109,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'0DR0pKwWcrcvtKAUsLdLAylBsgkBAt6BbytvdZCJ',1734620251,NULL,NULL,1734620251),
(110,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'wHhXsUHXsagVqgI2w4s8g57nUPmCl604IbnGRqs4',1734624539,NULL,NULL,1734624539),
(111,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'MX2Qemqrot1xmkLwOlJSCIYfaIdKiuwpZWpSkkpt',1734688719,1735033948,'default',1734688719),
(112,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'Ndccw9lhdfv9Q3GMwFVPzrA9wGYUgCcJb5NEsb9k',1734689467,NULL,NULL,1734689467),
(113,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'OZUx5Db7SIKAOzBw7hZSmSNjNW1GLQCeHvwvjx6O',1734703570,NULL,NULL,1734703570),
(114,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'WIWk7XJsNDVCxGB0aKKNduWdhoIdWrUjMsVvgNFV',1734988517,NULL,NULL,1734988517),
(115,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'cstkRyu71jCExyPFpREtnm5ztz12JF7mw1xQBOB0',1734988651,NULL,NULL,1734988651),
(116,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'yRweWbf5tCyVxDNjBjj5t0Z2nWbZrUKyp1H7GIhl',1734989369,NULL,NULL,1734989369),
(117,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'2YKuLs34lFxCHJeFoLZ5m6c5woaMGeMkmPGFgVIW',1734990335,NULL,NULL,1734990335),
(118,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'DVpgvdu0o7r79554eGJ20LCycGoiYQyBxC97vU2Z',1735035644,NULL,NULL,1735035644),
(119,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'cnHbFTdUvNFNEewhLPO4tnmI7vPDii8V5XYQKupg',1735035663,NULL,NULL,1735035663),
(120,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'8KJpRqb23i4hCrEX8aCsW8d2NgfAoxUXzad1tB6h',1735041623,NULL,NULL,1735041623),
(121,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'evaZetGoNpOxqLBuvUagc6gkHTE4Do07vD0lLChT',1735041647,NULL,NULL,1735041647),
(122,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'HCdYXJmIzTyaj70KsAc5iJUnxCJblr385r9lloyW',1735041897,NULL,NULL,1735041897),
(123,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'x6xBBxDkGFtyya0rGJqjwxnddCmdjDXdcANz47fz',1735041912,NULL,NULL,1735041912),
(124,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'mtl8zPycj1Vc6g5uoJRMYksZskspcCQg0ylAJZdh',1735041957,NULL,NULL,1735041957),
(125,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'GGe1cOy19mi2CojeQeUGAPTnjchntzzGAdrKHqtB',1735042173,NULL,NULL,1735042173),
(126,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'d8VK05odt36u4A4KogLM4w1ibwS3FpndyQwmRp6T',1735042487,NULL,NULL,1735042487),
(127,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'WBuzweGajptrcVRk8fU019ySNyQX8nQeZabduhod',1735042501,NULL,NULL,1735042501),
(128,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'PUm9C3DOkZReA8NIYXx6TKyXGRbiW5IvULDAleVd',1735042520,NULL,NULL,1735042520),
(129,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'PaGWUYKUZUHUGz32Lzbnbcs3w4zPX3CTxFrVsYBG',1735042684,NULL,NULL,1735042684),
(130,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'GURAZ1FDnTWbbXboze8ZsaFTdJiiC8ZLeCWWfjmu',1735042723,NULL,NULL,1735042723),
(131,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'qvfDkutHhVUd9o6S6Yn5QixtxwmRmBYz2Ab9WGS1',1735055705,1736261312,'default',1735055705),
(132,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'ggUfdpm0vgGVq7Q0pJv9D371mx031KX7Qo8DZbhh',1735200890,NULL,NULL,1735200890),
(133,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'1D7JR5BTqr82UMJMjLFl0qsoRZS4IiPswFNZ4R9R',1735202250,NULL,NULL,1735202250),
(134,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'31pHDsl1ZKiM7Uktgh3ympPEfXyusHrUy4zNmmDX',1735204249,NULL,NULL,1735204249),
(135,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'2Z3dOD2RE6iSrID1gV0wtWoxdDpShGmHngI9qZWA',1735204582,NULL,NULL,1735204582),
(136,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'G6DNrZGgaXlejRwmmXakBbvp33ulMBmk9qFu8Bl9',1735210452,1735210484,'default',1735210452),
(137,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'pigRhXAlseyUsMkxoNQjlh3Fls6NXs8aD2BqCxVV',1735210502,NULL,NULL,1735210502),
(138,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'gQvG5X8B9FavAs0mzxmhEMf0CE9SZMuQLdJkWhtr',1735229125,NULL,NULL,1735229125),
(139,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'ykKbprAzDUf4w3APcOMI2C2rSqCggTfe9GCeZYXO',1735297844,NULL,NULL,1735297844),
(140,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'MylcG33w2Wd65pKBADYp7jz6zylpBnUA0w0MGgz6',1735297995,NULL,NULL,1735297995),
(141,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'sFi14gQnKFNd2b1OUvS2gHwpYO8ijTBGJpvLyeD9',1735298089,NULL,NULL,1735298089),
(142,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'080KkZ8ZWwDUUYfPpOMnAW58gx02MsVxarZ8c850',1735298176,NULL,NULL,1735298176),
(143,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'PbCbnuIqi1Q5pAyx5jO5bs96UUW8BTRFuT8i1kFE',1735298440,NULL,NULL,1735298440),
(144,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'kc9hbkTbbhwg8JJvZ0FAMej3ObHYQazmFyIKdEM6',1735298595,NULL,NULL,1735298595),
(145,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'wKRPK3pJ8cTCoyz7IQMlBxNhyGx1dugkoxVtonyD',1735298675,NULL,NULL,1735298675),
(146,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'QTaroJp2UWmCFGPVyicrTE6bz89rI1YzpSV37EfH',1735298798,NULL,NULL,1735298798),
(147,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'HhklgeyMaut2CAZQeAe4CcgVSG4jaCgYpdcIrqDc',1735298934,NULL,NULL,1735298934),
(148,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'Qao3U3VVA0FRrqhTNxeCSQuB64FlcGMcu9DGq89g',1735299037,NULL,NULL,1735299037),
(149,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'La0QYQN10EJiU9STMKpvt5v6jf2TMXt588DLlzBr',1735299415,NULL,NULL,1735299415),
(150,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'MPqro6XFNhwlpHhJooITe8BpGz52wMkGtcxeiKj7',1735299644,NULL,NULL,1735299644),
(151,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'H0dnfztxH7X0z3tw3uKjooyAQM8dkFmhope7g0rE',1735300250,NULL,NULL,1735300250),
(152,1051,'0','desktop','-',NULL,NULL,NULL,NULL,'pqvfHTQKs8XXNlRywc7b5f09Vs7PXY4fnuJQLk6v',1735300335,NULL,NULL,1735300335),
(153,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'VYKPzcjCxtiFfDPesJCMSdTte5dUGX0wQiBnLkkO',1735555715,1735555730,'default',1735555715),
(154,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'BtlgM0oVDgTsqpw0P2KM8IW04eSAfF0rJ5iI0ATn',1735555746,1736462236,'default',1735555746),
(155,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'hzZcb9vjEbVSD3vxwv2o4gKC2P4tnB7tsnXwwOIP',1735576974,NULL,NULL,1735576974),
(156,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'WOk0n970F8LJq2s8Opnf5fB39rQEUShtU2QOz0Pa',1735584851,NULL,NULL,1735584851),
(157,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'w85qEKHAab6xc7zEPzeVBNGoL0VgfFDhr4PwnTit',1735654574,NULL,NULL,1735654574),
(158,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'H738ebneJDFn1mIkyCIma7iSqNhYovj0UeEcmV6z',1736261322,NULL,NULL,1736261322),
(159,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'ImO14O2ZKhlNpLD11YRIxTCjEk3jIrVN5vfyhKRW',1736322880,NULL,NULL,1736322880),
(160,1,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'5TMUaeSy84SkKZ5heGoQge3RVA6USY2rAqFF0Ck8',1736456473,NULL,NULL,1736456473),
(161,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'m7kTqgvwB1QMoalZbSFjFAJENOwxAjers7TTLMVP',1736462261,1736462273,'default',1736462261),
(162,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'MeWSLGR9PbjcTBzPAuB9Jb3AnavZBsZGRpb8X9eS',1736462289,NULL,NULL,1736462289),
(163,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'EjR8Z8v0uQVQGF7hvCwrjykb6NqMfq48Wpmq41S9',1737020806,1737020914,'default',1737020806),
(164,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'DuFr0DzT5IZWOfshYniFvgBtcHYShszQ5q8beKjP',1737020925,NULL,NULL,1737020925),
(165,1055,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'eDOC1fbrPU96WHKxF3JMMZ0X7UgaRyoFfIcwuAEC',1737050396,1737050449,'default',1737050396),
(166,1055,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'3FLXX2T6tguGdTiRFTKKPql6fV09kXmKIKF9LyXe',1737050477,1737050483,'default',1737050477),
(167,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'yCPcOxWtAEVZ0oHCfc7FAATMWvMB1JltmmWgIzBd',1737050500,1737050527,'default',1737050500),
(168,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'yqGxGfH8LWVfEF512yerKL08MWVmtx63AWA27b9j',1737050542,NULL,NULL,1737050542),
(169,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'SeeHRow2lrTmQr0i8d5Vryecl5QdLc9vDFc7IOep',1737104906,1737104924,'default',1737104906),
(170,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'hZr380zVs89sOOXYNLznlCxYvQyySMkpjbmH53aU',1737104932,1737131176,'default',1737104932),
(171,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'5hnThMEZUZSSVAivzzj9SbWuKo5JJTdgiSLTfTTI',1737131149,NULL,NULL,1737131149),
(172,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'4nYpALomWONESSss25G0wOvbfBox5phpEcgW3kI4',1737131225,NULL,NULL,1737131225),
(173,1050,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'52yAxSWY7HERLkPsunZOw3whbz7i9KdYCCB09wEB',1737136379,NULL,NULL,1737136379),
(174,1050,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'mpagmieZlhuJp4LxfxgRPm7SwktCx5Dr3NDgkKdS',1737137085,NULL,NULL,1737137085),
(175,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'7FA8hAMHwvlzCKrzKHOhIizw07ZQXk3OHNeKZAr2',1737140170,NULL,NULL,1737140170),
(176,1050,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'fvmQcRclakmDhoPAV4QPAsQpOFdIMB8mEdMHAiRE',1737366010,NULL,NULL,1737366010),
(177,1050,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'T40Eus9evi48FFSAzGsHByB4gFRdqLZVbJge4ndN',1737386342,NULL,NULL,1737386342),
(178,1050,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'zTvjOMqoqvhoRlx1A0D9EE5i91Z2HZXtynxjEh2H',1737386474,NULL,NULL,1737386474),
(179,1051,'Chrome','desktop','Windows-10.0',NULL,NULL,NULL,NULL,'zkCHmkOqgCTqw3QpZCpKdvquPVkUKHlmBGKSL7Eg',1737447944,1742414086,'default',1737447944),
(180,1051,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'Djh0pt5H32g27bg4wOxgT2yLYpR38UI19uV9mQTx',1737976436,NULL,NULL,1737976436),
(181,1051,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'ziVjAU8ZofLpe0SGGLqC8ohYpV8cCcUQumjFomkv',1738587428,NULL,NULL,1738587428),
(182,1051,'Chrome','phone','AndroidOS-10',NULL,NULL,NULL,NULL,'AU9h82mNXAtwIfIoVzi7WnKwySucWOyfl7PmZU94',1738588461,NULL,NULL,1738588461),
(183,1050,'0','desktop','-',NULL,NULL,NULL,NULL,'knuAEe6JBvEdSzCh1E4i4bRyslOTjR1lOiC9UV3r',1739305763,NULL,NULL,1739305763),
(184,1,'Chrome','desktop','Windows-10.0','41.225.210.184','Tunisia','Tebourba','\0\0\0\0\0\0\0}?5^ºiB@­iÞqŠ®#@','hbVvDP95vGqE0inrfHDQbpmCYee0kLIpSlT1CprO',1741004117,NULL,NULL,1741004117),
(185,1,'Safari','desktop','OS X-10_15_7','196.235.18.157','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','wdqzMSJdJcnTubAimO1XGiNXgn8koASgd2DKyMgK',1741036642,NULL,NULL,1741036642),
(186,1,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','v1KofGYJhJqNcpcXHUM7vJSLhpIcL0eL1kHuUZJB',1741075434,NULL,NULL,1741075434),
(187,1050,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','vWN7FZOwva9Dj9wvYb5nYZLMIYTDYOgIX18yGh4Z',1741075531,NULL,NULL,1741075531),
(188,1051,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','OGhRdbSUtcF6Ppjn9esnhNesXLVNQx7zOAoQ2Rd1',1741075598,NULL,NULL,1741075598),
(189,1,'Chrome','desktop','OS X-10_15_7','165.51.67.87','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','XjbeDu2h9PRctRTN7eaWBbXHvV7x6yywFo9kGmhw',1741420278,1741420288,'default',1741420278),
(190,1047,'Safari','desktop','OS X-10_15_7','165.51.67.87','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','uBWIMyMc2in8wWR3CZttdCDbRmc3Pz5zsYvyjxwL',1741420337,NULL,NULL,1741420337),
(191,1049,'Safari','desktop','OS X-10_15_7','165.51.67.87','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','vfzxRKsTuKb1uCiWh4MZAjkBGdGDY8uULMDho2dY',1741420452,NULL,NULL,1741420452),
(192,1071,'Safari','desktop','OS X-10_15_7','165.51.67.87','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','k7EvEFdESEe5XINs0LLFnxIChFEQaUS5r7dBs9pw',1741420726,NULL,NULL,1741420726),
(193,1049,'Safari','phone','iOS-18_1_1','196.235.246.137','Tunisia','Bizerte','\0\0\0\0\0\0\0ˆôÛ×£B@rŠŽäò¿#@','UcylG1KI5OMatWGwV5I7X78uMeULoADQc8ji0RAq',1741422596,NULL,NULL,1741422596),
(194,1049,'0','desktop','-','196.235.246.137','Tunisia','Bizerte','\0\0\0\0\0\0\0ˆôÛ×£B@rŠŽäò¿#@','jtXKYHlqr6PT3DF1szdf9IDZrP9GXUbZycPWaB8v',1741423169,NULL,NULL,1741423169),
(195,1,'Safari','desktop','OS X-10_15_7','196.235.55.181','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','WF4ssVPUhoydv7NqkiA5hwgE3SdZ5QeHk0mdM6mh',1741530688,NULL,NULL,1741530688),
(196,1,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','rfEXXXIrsKUcdvncsurNjY7uncRItxl568R7RpJv',1741598766,NULL,NULL,1741598766),
(197,1047,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','CsbXO7lXTqib5nr5P2srh5O2kKBAKhoBWmQz2ub4',1741599124,NULL,NULL,1741599124),
(198,1071,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','PWvA5qlEgipxoDuX4XSICojkpbtOYWbX4Q7VlPRA',1741599191,NULL,NULL,1741599191),
(199,1049,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','bN1sjEgJor7gD2CYaVJbozaTQ3IfyM3fZBVJdGpv',1741599295,NULL,NULL,1741599295),
(200,1071,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','lJQBlgHAGT8HnaD5oNkA5HkegpdEPcM0OuB1cvtY',1741599396,NULL,NULL,1741599396),
(201,1050,'0','desktop','-','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','ZvXVGGfjpZjf92TmoCLyi3gCyb5KtgXwHt43P5Us',1741600786,NULL,NULL,1741600786),
(202,1050,'0','desktop','-','51.178.141.233','France','Gravelines','\0\0\0\0\0\0\0µ¦yI@ÿìGŠÈð\0@','cljNq6a4q7x1mBs6lv8xaFKwcLihT6PWs8w075yX',1741688143,NULL,NULL,1741688143),
(203,1050,'0','desktop','-','51.178.138.218','France','Gravelines','\0\0\0\0\0\0\0µ¦yI@ÿìGŠÈð\0@','qHsovkfnyGagwXvhpfQHc6MAxSfMfrdaQDiw609E',1741721950,NULL,NULL,1741721950),
(204,1050,'0','desktop','-','51.178.138.218','France','Gravelines','\0\0\0\0\0\0\0µ¦yI@ÿìGŠÈð\0@','YUCKm4sRkvyMgiklT5L7NxVpsRSYBD25vytA7Kjs',1741722865,NULL,NULL,1741722865),
(205,1,'Chrome','desktop','Windows-10.0','41.225.210.184','Tunisia','Tebourba','\0\0\0\0\0\0\0}?5^ºiB@­iÞqŠ®#@','XAWUhyfvRKBBHS678jsNZZZww5iXUvTPxeX4azKd',1741810389,1741869479,'default',1741810389),
(206,1,'Edge','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','moxCpVja0zXKEdaVgcRCXZ8alPlKoo63FtVn0nRD',1741947079,NULL,NULL,1741947079),
(207,1050,'0','desktop','-','102.106.53.253','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','oRTZStYR6CDnTRRWzRxThUu1oJgmOa9Hj2XoltbE',1741947423,NULL,NULL,1741947423),
(208,1072,'Opera','desktop','Windows-10.0','102.106.53.253','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','jXh3aQcAWVyuKz2ultFw3wDO5VEJur4kaSOycUZN',1741947479,NULL,NULL,1741947479),
(209,1,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','1AbJnRseYHMYKo1PJUtCChZVJ62eCSMSgcEjxWqy',1742202380,NULL,NULL,1742202380),
(210,1050,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','dn8jkJA5QfLufYkwWWlywla1gvXGu5neJugeptoG',1742210262,1742210271,'default',1742210262),
(211,1051,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','9Czc6x8hpuDdeNDgsqjUemcJtlgQx4Y33iEYC6sm',1742210276,1742215361,'default',1742210276),
(212,1071,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','VNR5D5vsiSNGQNlpFdwe3JLL2VV1rDgV3rNHcwHF',1742212234,NULL,NULL,1742212234),
(213,1047,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','cmhLfTzf77rVLFth5oFHR0OjcWYx8cLieYe0vC1f',1742212262,NULL,NULL,1742212262),
(214,1,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','zON9KkhF6B00t75dMYWhTcWw7NB1D7tqHKVUpKII',1742212295,1742215266,'default',1742212295),
(215,1071,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','04yozd0nfczl05Adp6N7BVgh8FMA514o8xbGU69F',1742215310,1742386857,'default',1742215310),
(216,1047,'Chrome','desktop','Windows-10.0','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','Vum6l0Qlz7uD1MMO1Jy4IVBOAKiWhtS1HOrSEFoo',1742215455,1742215528,'default',1742215455),
(217,1051,'Chrome','desktop','Windows-10.0','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','LTkfM2bMfP457qCrblQKI6VArjiSIO9YVpl6UfVC',1742215642,1742215807,'default',1742215642),
(218,1050,'Chrome','desktop','Windows-10.0','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','5wvsW00wpyne2qidEzRGyCJKcvVClcE1Jgm9UjPN',1742215822,NULL,NULL,1742215822),
(219,1,'Chrome','desktop','Windows-10.0','41.225.210.184','Tunisia','Tebourba','\0\0\0\0\0\0\0}?5^ºiB@­iÞqŠ®#@','p3ccoOtzTGMx5BgjqgcgslO2VUmRkmkRbMEao0qh',1742291485,1744034037,'default',1742291485),
(220,1051,'Chrome','desktop','Windows-10.0','41.225.210.184','Tunisia','Tebourba','\0\0\0\0\0\0\0}?5^ºiB@­iÞqŠ®#@','cuYQv353BtjlW7KjG19nwLgUr17pLSNN8ZtFyTJN',1742316064,1742386872,'default',1742316064),
(221,1,'Edge','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','uv0hXsARARa86tRUoC05WGmnEkgt4v9lBLzrvtLq',1742373536,NULL,NULL,1742373536),
(222,1051,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','Mz7AODbOe6XjYJVM18b53NfVCySP5E2m0XTXaItQ',1742811411,1742811418,'default',1742811411),
(223,1050,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','wlJ4o2jDQ0Cf3HWnXjO1xuTYSxEXx0EJIYkb3L5F',1742811446,NULL,NULL,1742811446),
(224,1075,'Chrome','desktop','Windows-10.0','38.9.155.188','Indonesia','Medan','\0\0\0\0\0\0\0Å1w­@-!ôlªX@','xfhprfnNurGEYaSEY8zwI4639FtMJl0x4JJiEyTe',1743798257,NULL,NULL,1743798257),
(225,1075,'Chrome','desktop','Windows-10.0','103.231.61.87','Cambodia','Phnom Penh','\0\0\0\0\0\0\0¦\nF%u\"\'@š™™™™9Z@','hDhtXXTH1p7EzD7LDLCcbZaY2Nfk4CkmmEhC9AWv',1743798279,NULL,NULL,1743798279),
(226,1047,'Safari','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','rXuYDDSSl5xj3Pd55OS7iErY4apzqkJfuHNrCaXJ',1744034107,NULL,NULL,1744034107),
(227,1071,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','QZzY1Wg1spUJpDs8QRaGqasgYLbJ2rXOAEMdChJL',1744034136,NULL,NULL,1744034136),
(228,1,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','fChyvsx59UUZIupu7S9XhEGdw12woqK0DKU4llQa',1744034151,NULL,NULL,1744034151),
(229,1,'Chrome','desktop','Windows-10.0','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','teZls18XGZDWttonhPJBH4RFaW648LTXpzUeYEWk',1744034178,1744979244,'default',1744034178),
(230,1047,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','E5muLPyCyKm0emrjM9DWiYiLjcZfcfZTWqgsn2H0',1744034239,NULL,NULL,1744034239),
(231,1049,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','XgsrBPKPuXQCYkDZpQto9C2oVW1jsHfKNnD3Quye',1744034327,NULL,NULL,1744034327),
(232,1077,'Chrome','phone','AndroidOS-10','101.128.108.88','Indonesia','Palembang','\0\0\0\0\0\0\02U0*©	À,Ôšæ\'Z@','28jjPJZob8XwBjQ5OFpSwbBTBkESyAiryS1TTwPe',1744931207,NULL,NULL,1744931207),
(233,1077,'Chrome','phone','AndroidOS-14','101.128.108.88','Indonesia','Palembang','\0\0\0\0\0\0\02U0*©	À,Ôšæ\'Z@','gT9lfnrjFgzpgVFhlhPDTcJXQrc1UntYgxXZ0um4',1744931284,NULL,NULL,1744931284),
(234,1,'Chrome','desktop','Windows-10.0','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','E5tuDmZZce4pWHzsn8zT9j9uOis0V8QNGd8xneq8',1744979256,NULL,NULL,1744979256),
(235,1,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','5GaqqVQacch2KWp6J8QZJDGOPfq1Bdjz0k0fYhku',1745834943,1747432044,'default',1745834943),
(236,1078,'Chrome','desktop','Windows-10.0','114.10.74.236','Indonesia','Jakarta','\0\0\0\0\0\0\0ŠcîZÂÀ`åÐ\"ÛµZ@','nv68NNW7BG5USRhRd2Qk0qKoCX9tfsyseasnwIFv',1745921625,1745921649,'default',1745921625),
(237,1078,'Chrome','desktop','Windows-10.0','103.10.59.251','Indonesia','Depok','\0\0\0\0\0\0\0†=íð×„ÀÍÌÌÌÌ´Z@','xHI1v7QFVm2Y5lj1iCGCnpIQZbbBaGq9nD5xvaYy',1745965238,NULL,NULL,1745965238),
(238,1,'Chrome','desktop','OS X-10_15_7','165.51.15.194','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','ZdsP9aykNqXQQTSjgZCOjxFyWfXBPOIvguuVni3U',1746364685,NULL,NULL,1746364685),
(239,1080,'Chrome','desktop','Windows-10.0','118.67.205.39','Cambodia','Phnom Penh','\0\0\0\0\0\0\0®¶bÙ\'@Ÿ«­Ø_:Z@','Ywzv22CVVNWBJ4u0Ark2kZ5Ir0Pc7gElxQRNFedV',1746537777,NULL,NULL,1746537777),
(240,1081,'Chrome','desktop','OS X-10_15_7','165.51.28.171','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','5z33TRsWX2nYM3TKZTCAc8ktIslyJMA5A8U3nXbv',1746856047,NULL,NULL,1746856047),
(241,1082,'Safari','desktop','OS X-10_15_7','165.51.28.171','Tunisia','Tunis','\0\0\0\0\0\0\0›UŸ«­hB@ioð…ÉT$@','HOkcCBm7CfqqvMsHSZVreBTYuArkIqcl98Y4XA4a',1746856529,NULL,NULL,1746856529),
(242,1,'Chrome','desktop','OS X-10_15_7','41.229.253.90','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','pUFSshJPK4xGXWqAGMKHR18WwW0MW0u1gzkqoeIX',1746874265,NULL,NULL,1746874265),
(243,1,'Safari','phone','iOS-18_4_1','102.30.183.68','Tunisia','Nabeul','\0\0\0\0\0\0\0QÚ|a:B@(µ¦y%@','FNgsltzvqKcVnOhmIUxIc8Zilm495TPcuXiHpGxv',1747043224,NULL,NULL,1747043224),
(244,1047,'Chrome','desktop','Windows-10.0','197.26.37.85','Tunisia','Monastir','\0\0\0\0\0\0\0\\Âõ(äA@Ò\0Þ	ª%@','kFl16OQM9PwgqVqvXT9hRPjU4eY8sRqu9BAzTJ6X',1747432066,1747432285,'default',1747432066),
(245,1,'Chrome','desktop','Windows-10.0','197.26.37.85','Tunisia','Monastir','\0\0\0\0\0\0\0\\Âõ(äA@Ò\0Þ	ª%@','OB2AMT4biRKjiw2dAjLaQPymVBIWETYi6Xyc12kO',1747432357,1747432603,'default',1747432357),
(246,1071,'Chrome','desktop','Windows-10.0','197.26.37.85','Tunisia','Monastir','\0\0\0\0\0\0\0\\Âõ(äA@Ò\0Þ	ª%@','yxl5lsX8vm0JftpsnrKuI3vF0mCh39YNBxtojsiF',1747432391,NULL,NULL,1747432391),
(247,1047,'Chrome','desktop','Windows-10.0','197.26.37.85','Tunisia','Monastir','\0\0\0\0\0\0\0\\Âõ(äA@Ò\0Þ	ª%@','26IbJPNUGVFh1V1HmmPAGl5tgfFzvmcevcUnmy1v',1747432649,NULL,NULL,1747432649),
(248,1047,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','1PDv3N6V29sIwVCiSJD9HUOR4mC7Yl29PGAe8DyK',1747466863,1747468902,'default',1747466863),
(249,1050,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','o7JvWXeabS1GtJTJVnDDZzMEChuFkbRTrtGMNn8B',1747466883,1747468839,'default',1747466883),
(250,1071,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','JvwPAg8xtZCwtHr4RZP6JIvdDI4OQoEieJDoT23W',1747466996,1747473723,'default',1747466996),
(251,1051,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','7LCkQ1fbFHFNrcZKDSzhciPDODIWDyNH5EDcV7P8',1747468865,1747468874,'default',1747468865),
(252,1,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','hx4iLBrzDVb1Xq1iCGRNqSI88SLmy9fqaia9xVou',1747468912,1747469048,'default',1747468912),
(253,1050,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','yIUYf0pajLImoBIU2Bn8ALgKaUagBExLyZ4eLGZa',1747469012,1747473699,'default',1747469012),
(254,1047,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','ztwZVkfBo9hvbWDKGAqHfD2xbQiO0nFsh9YaD7gk',1747469069,NULL,NULL,1747469069),
(255,1051,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','N0Uke7LyguQJE11vse9e314W1fCrsihoNemeZfAw',1747469985,NULL,NULL,1747469985),
(256,1047,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','4pbYmDcA9VtpL68lF7H75cZuCeTOJvHWD4wXfLkv',1747470111,1747470117,'default',1747470111),
(257,1,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','gGbqq977Cu3x6InAFi1HY0wxRs0pnx6jC61HMm5l',1747470127,NULL,NULL,1747470127),
(258,1051,'Chrome','phone','AndroidOS-10','51.158.202.202','The Netherlands','Haarlem','\0\0\0\0\0\0\0›UŸ«­0J@ýöuàœ‘@','khrap6kn1qokFFYHOB9j8ujmB0T6tQnPIcIc1kUA',1747470329,NULL,NULL,1747470329),
(259,1047,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','a7mEP0wBIm2yol1C8bcG732jicXFYoWNRTctsxC0',1747472806,NULL,NULL,1747472806),
(260,1051,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','SKRJPUx6Hrz6cLUuPXAcqwhoDpg4DePkzM0ZOEoh',1747473707,NULL,NULL,1747473707),
(261,1050,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','0cYwSP5UagUVfzIjgPB1BsGCTP2KgRJImtG0gwLJ',1747473744,1747473902,'default',1747473744),
(262,1051,'0','desktop','-','51.158.202.202','The Netherlands','Haarlem','\0\0\0\0\0\0\0›UŸ«­0J@ýöuàœ‘@','r9hU6ELRLQTMjSHEAGNKobjb5KuyY8uNRJQHQZLu',1747473860,NULL,NULL,1747473860),
(263,1071,'Chrome','desktop','Windows-10.0','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','CnDKvvMtl7kqcPcOYD9MQESEMcbrUNkp2YcQr4P0',1747473907,NULL,NULL,1747473907),
(264,1071,'0','desktop','-','41.229.253.82','Tunisia','Sidi Bou Said','\0\0\0\0\0\0\0ç§èHnB@\0‘~û:°$@','HeQ77Lnazqq28iqwXcRNHqIvlTMBSA85KzZW8ZhH',1747474210,NULL,NULL,1747474210),
(265,1077,'Chrome','phone','AndroidOS-10','114.10.99.17','Indonesia','Palembang','\0\0\0\0\0\0\0½Ê‰vUÀ9´Èv¾/Z@','tAvWO9Rrc0xw8WE0wBxRXbgrzD6CeMyNdHd3nLOp',1747604980,NULL,NULL,1747604980);
/*!40000 ALTER TABLE `user_login_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selected_bank_specifications`
--

DROP TABLE IF EXISTS `user_selected_bank_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_selected_bank_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_selected_bank_id` int(10) unsigned NOT NULL,
  `user_bank_specification_id` int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_selected_bank_id_specifications` (`user_selected_bank_id`),
  KEY `user_bank_specification_id_specifications` (`user_bank_specification_id`),
  CONSTRAINT `user_bank_specification_id_specifications` FOREIGN KEY (`user_bank_specification_id`) REFERENCES `user_bank_specifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_selected_bank_id_specifications` FOREIGN KEY (`user_selected_bank_id`) REFERENCES `user_selected_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_selected_bank_specifications`
--

LOCK TABLES `user_selected_bank_specifications` WRITE;
/*!40000 ALTER TABLE `user_selected_bank_specifications` DISABLE KEYS */;
INSERT INTO `user_selected_bank_specifications` VALUES
(1,1,12,'smart'),
(2,1,13,'123545674');
/*!40000 ALTER TABLE `user_selected_bank_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selected_banks`
--

DROP TABLE IF EXISTS `user_selected_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_selected_banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_bank_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_selected_banks_user_bank_id_foreign` (`user_bank_id`),
  KEY `user_selected_banks_user_id_foreign` (`user_id`),
  CONSTRAINT `user_selected_banks_user_bank_id_foreign` FOREIGN KEY (`user_bank_id`) REFERENCES `user_banks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_selected_banks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_selected_banks`
--

LOCK TABLES `user_selected_banks` WRITE;
/*!40000 ALTER TABLE `user_selected_banks` DISABLE KEYS */;
INSERT INTO `user_selected_banks` VALUES
(1,1073,5);
/*!40000 ALTER TABLE `user_selected_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(128) DEFAULT NULL,
  `role_name` varchar(64) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `organ_id` int(11) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `hospital` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `bio` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` text DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `logged_count` int(10) unsigned NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `financial_approval` tinyint(1) NOT NULL DEFAULT 0,
  `installment_approval` tinyint(1) DEFAULT 0,
  `enable_installments` tinyint(1) DEFAULT 1,
  `disable_cashback` tinyint(1) DEFAULT 0,
  `enable_registration_bonus` tinyint(1) NOT NULL DEFAULT 0,
  `registration_bonus_amount` double(15,2) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_settings` varchar(255) DEFAULT NULL,
  `cover_img` varchar(255) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `province_id` int(10) unsigned DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `district_id` int(10) unsigned DEFAULT NULL,
  `location` point DEFAULT NULL,
  `level_of_training` bit(3) DEFAULT NULL,
  `meeting_type` enum('all','in_person','online') NOT NULL DEFAULT 'all',
  `status` enum('active','pending','inactive') NOT NULL DEFAULT 'active',
  `access_content` tinyint(1) NOT NULL DEFAULT 1,
  `enable_ai_content` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `public_message` tinyint(1) NOT NULL DEFAULT 0,
  `identity_scan` varchar(128) DEFAULT NULL,
  `certificate` varchar(128) DEFAULT NULL,
  `affiliate` tinyint(1) NOT NULL DEFAULT 1,
  `can_create_store` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Despite disabling the store feature in the settings, we can enable this feature for that user through the edit page of a user and turning on the store toggle.',
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `ban_start_at` int(10) unsigned DEFAULT NULL,
  `ban_end_at` int(10) unsigned DEFAULT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT 0,
  `offline_message` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `users_mobile_unique` (`mobile`) USING BTREE,
  KEY `users_country_id_foreign` (`country_id`),
  KEY `users_province_id_foreign` (`province_id`),
  KEY `users_city_id_foreign` (`city_id`),
  KEY `users_district_id_foreign` (`district_id`),
  CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1084 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin',2,NULL,'00000000','conseillerdigital@gmail.com',NULL,NULL,NULL,'Senior MedIn','$2y$10$nCXJSfnJkVvXCTqb.4ZGzuqfYq0kDoZZqcP8uZora12yHDtWcPUQW','103413764013790557843',NULL,'3Ge6kkkww485eMFP21ON9Q5AtOehHVgHxAH4oEDQLyO0k7wxt4np8eIekqkd',21,1,0,0,1,0,0,NULL,'/store/1/favicon medin.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,1,'EN',NULL,'Africa/Tunis',0,0,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1597826952,1597826952,NULL),
(1047,'TiceaMed','organization',3,NULL,NULL,'ticeamed@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$nCXJSfnJkVvXCTqb.4ZGzuqfYq0kDoZZqcP8uZora12yHDtWcPUQW',NULL,NULL,'BwblTblLfbHOhjq4Ky93LvbJHb77KFCwFNIhSXsuWD3fg5LhAloZCF7FNzuL',8,1,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"4caf50\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1726449170,NULL,NULL),
(1049,'FMM TICE','user',1,NULL,'98954095','fmm.tice@gmail.com','PHU','Monastir','Med Trav',NULL,'$2y$10$vEjWkq9oHrHtoSwsE1kE6OslYEdo2XEcb6G17EfGoAQgKDNGpxdvi',NULL,NULL,'iCaljTPITFCMU2D5EeAvFVXrWsbihhtTzeKJ7Qge1PQH3JBi2f9DcBcDDGgi',5,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"3d5afe\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,'EN',NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1726449631,NULL,NULL),
(1050,'RachaZaibi','user',1,NULL,'22164390','rasha.zaibi@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$NjCudzzj7ngoe8JJ8HcnRuqVXEpmel/pFaBSpjOCJIL72PGFHwzPG','ya29.a0ARW5m75rwbLx66uylXqPc7aCvnIGMmTVr1qxYamVF6XMNGC1TIWhnTaos0Ry1uPQqoB11yUzOXph_0-m74r84cmeFLFYW6YJQ1mrRCNc1UHE4fNvArslabujlru01QrwPT5ZOXXLsl8u6YS9xzPiXpgXFVDdbXV0ARuKyo3LaCgYKAa4SARESFQHGX2Mi2i7bmdIn7EOd67QCUo2FpA0175',NULL,'G93Hs1A34B7MzgFrrMxX6VONkJSafpkRM47XMg4IWtumGW7gH67a30vnoOZc',20,1,1,0,1,0,1,1500.00,NULL,'{\"color\":\"000000\",\"background\":\"ff9e80\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,'EN',NULL,'Africa/Tunis',0,0,'/store/1050/offlinePayments/1737475764.png','/store/1050/offlinePayments/1737475764.png',0,0,0,NULL,NULL,0,NULL,1730801426,NULL,NULL),
(1051,'Racha Zaibi','user',1,NULL,NULL,'rachazaibi27051997@gmail.com','grade','hospital','service',NULL,'$2y$10$NjCudzzj7ngoe8JJ8HcnRuqVXEpmel/pFaBSpjOCJIL72PGFHwzPG','ya29.a0AZYkNZgl-untCtcQo9eCxM3pk2DVth68vRCEFitY4jKxXvQWb_l-GH4AcEaxg287mRSBlnkw__7p10fmtELtbygXCQcR-NLKQ5nH7SA-0sEz613ohzVZq1bknBexKkbeE1x6daCvknE16lT9vJZwnx4P19onXFhyIN3bsNtcGqIiqfGIaNm9PlYSlkzxT4PUJKX3RjR3WZUSAjP4NndFJf8LJbStt5VLXwt30Bep9ZauaKY3mXdFZNuYTjPwfsoj6J4_YAN3as_9RYFsgPSa9UlOAZoahZWi4VUboQ8OfzA5Uad-A7mFxnqkZe-REgL8z_dZDQaCgYKAaESARESFQHGX2MiVTuAxYEZ3E-1l6dIkGM98g0333',NULL,'UqMyWyq5IjKL7UQpemprvGyW2BYazWSZ71B1xtEsQ3cLf11E2XRH7BeGG6PV',14,1,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"64ffda\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,'EN',NULL,NULL,0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1730805756,NULL,NULL),
(1054,'aneti','user',1,NULL,'21622164390','racha.zaibi@aneti.tn',NULL,NULL,NULL,NULL,'$2y$10$NjCudzzj7ngoe8JJ8HcnRuqVXEpmel/pFaBSpjOCJIL72PGFHwzPG',NULL,NULL,NULL,13,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"FFFFFF\",\"background\":\"37474f\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,'EN',NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1730894379,NULL,NULL),
(1055,'Staff','organization',3,NULL,NULL,'staff@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$TL2XS4NxoUw6BUT98vDQ/eTLi6ilTLDOj0VqlVdI6671BzDub6J6m',NULL,NULL,'vSc4GjagTxdaslhsMZuUuwEu747TS4P3V65SPeI85QPrb3UCFRr2l86hU3ru',2,1,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"a7ffeb\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1731662073,NULL,NULL),
(1070,'Test Name','user',1,NULL,NULL,'test@example.com',NULL,NULL,NULL,NULL,NULL,NULL,'12345',NULL,0,1,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"e1f5fe\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1735123762,NULL,NULL),
(1071,'Instructor','teacher',4,1047,NULL,'charfeddine.amri@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$nCXJSfnJkVvXCTqb.4ZGzuqfYq0kDoZZqcP8uZora12yHDtWcPUQW',NULL,NULL,'CNkIGep07topFX6tEQLXmKBTnaeU0UgmD2x9mmpTAeO2Ton71fCrYjdrxeKS',8,1,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"dcedc8\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,'EN',NULL,NULL,0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1741420620,NULL,NULL),
(1072,'Ghada Ouni','teacher',4,NULL,NULL,'ghadaouni3@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$ZhLWQ/8QPTb5mGm5hYzIze.QpOyRt0zs6Nbr.SoaeFmIrnzMtHcDC',NULL,NULL,NULL,1,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"FFFFFF\",\"background\":\"F44336\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1741947429,NULL,NULL),
(1073,'SmartLab FMM','organization',3,NULL,'2757997','smartlab.fmm@gmail.com','Pr','hfbm','chu',NULL,NULL,'113043185916059734452',NULL,NULL,0,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"84ffff\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,'/store/1072/huntleigh-sc300-diagram.jpg','/store/1072/EdanM3_I.jpg',1,0,0,NULL,NULL,0,NULL,1742201913,NULL,NULL),
(1074,'FacultÃ© de MÃ©decine Monastir FMM','user',1,NULL,NULL,'fmmdecanat@gmail.com',NULL,NULL,NULL,NULL,NULL,'112833600883479338693',NULL,NULL,0,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"81c784\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1742213056,NULL,NULL),
(1075,'pakhaji','user',1,NULL,'21621214124213','lasflores.gob.ar@gmail.com','sadsadasd','dsadasd','asdasdasd',NULL,'$2y$10$ErHdD1jaN2OsrueT8ujsauiOWUYzyJcAMqSap1dHUv4/AJ93Sfnk2',NULL,NULL,'QLEq11q7ZrrKOdax4s2DGUHuHDCKtURCe0KlQ9TRJzV5IUwtcC76YwLcCTbC',2,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"fafafa\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1743798232,NULL,NULL),
(1076,'Danang','user',1,NULL,NULL,'toweyev292@clubemp.com','A','bunda','anak anak',NULL,'$2y$10$Ohxp53RCsk9MLBrPnS/q.uCPu1fcObvNoSTbpuoBZ7M.KeAtgusLK',NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"FFEBEE\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1744930500,NULL,NULL),
(1077,'Danang','user',1,NULL,NULL,'mopas54230@agiuse.com','A','bunda','anak anak',NULL,'$2y$10$8eUExKbsXcjFody7fHWE3OIufqdkrncWP.NVFbR4gN1nAu7DEkhtS',NULL,NULL,'XPUH50buKveffmx8A4csULqKAjuHAmp71qA4GHHJHzSmiIcdXyGJfCCZhQzF',3,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"eeeeee\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1744931145,NULL,NULL),
(1078,'nastar','user',1,NULL,NULL,'palinali@thetechnext.net','nastar','nastar','nastar',NULL,'$2y$10$smxIXI2jvg1uxsX00Rx9DewBSTECSOr.fDg0TcRlV2dP81sa9H5TG',NULL,NULL,'i40NCogrrb1Si6GAhhXniI1oR8Y3N35SjfPyU5AtJc2My6vpYk4hb3MXm5Bq',1,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"4fc3f7\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1745921572,NULL,NULL),
(1079,'Yucaerin Yucaerun','user',1,NULL,NULL,'caesarapf@gmail.com',NULL,NULL,NULL,NULL,NULL,'109599466818716058675',NULL,NULL,0,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"FFFFFF\",\"background\":\"004d40\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1746317752,NULL,NULL),
(1080,'MAVIETA','user',1,NULL,NULL,'mavietateore@gmail.com','ASDASD','ASDASD','ASD',NULL,'$2y$10$nqydF4rfo99dMJ8FCPWLH.pG0oXBOXrCR.ogX9rlZscEWObnBSmla',NULL,NULL,NULL,1,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"c5cae9\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1746537753,NULL,NULL),
(1081,'Charfeddine Amri','teacher',4,NULL,'21698954095','dentaire.medtrav@gmail.com','PHU','Mir','MedTrav',NULL,'$2y$10$fQ8zUWpbovD8a.HEggUMoOPKwptRIvZyAX3RS9I.f8L/RjzXTCsV.',NULL,NULL,NULL,1,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"FFFFFF\",\"background\":\"1b5e20\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1746855772,NULL,NULL),
(1082,'Student','user',1,NULL,'21697257021','coursfmm@gmail.com','Resident','Monastir','MedTrav',NULL,'$2y$10$K7CM/cHEx2qqQGiAA4E/vO2ryLkSqIcnkO1Orffeloi2LVh5hucCS',NULL,NULL,NULL,1,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"d4e157\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,'Africa/Tunis',0,0,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1746856438,NULL,NULL),
(1083,'TICE AI','user',1,NULL,NULL,'ticeamed.ai@gmail.com',NULL,NULL,NULL,NULL,NULL,'109623034789446011272',NULL,NULL,0,0,0,0,1,0,0,NULL,NULL,'{\"color\":\"000000\",\"background\":\"f1f8e9\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,0,NULL,NULL,NULL,0,0,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1747470049,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_badges`
--

DROP TABLE IF EXISTS `users_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_badges_user_id_foreign` (`user_id`) USING BTREE,
  KEY `users_badges_badge_id_foreign` (`badge_id`) USING BTREE,
  CONSTRAINT `users_badges_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_badges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_badges`
--

LOCK TABLES `users_badges` WRITE;
/*!40000 ALTER TABLE `users_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_cookie_security`
--

DROP TABLE IF EXISTS `users_cookie_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cookie_security` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('all','customize') NOT NULL,
  `settings` text DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cookie_security_user_id_foreign` (`user_id`),
  CONSTRAINT `users_cookie_security_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cookie_security`
--

LOCK TABLES `users_cookie_security` WRITE;
/*!40000 ALTER TABLE `users_cookie_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_cookie_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_manual_purchase`
--

DROP TABLE IF EXISTS `users_manual_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_manual_purchase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `access` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_manual_purchase`
--

LOCK TABLES `users_manual_purchase` WRITE;
/*!40000 ALTER TABLE `users_manual_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_manual_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_metas`
--

DROP TABLE IF EXISTS `users_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_metas_user_id_foreign` (`user_id`),
  CONSTRAINT `users_metas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_metas`
--

LOCK TABLES `users_metas` WRITE;
/*!40000 ALTER TABLE `users_metas` DISABLE KEYS */;
INSERT INTO `users_metas` VALUES
(75,1049,'signature','/store/1/default_images/default_signature.jpg');
/*!40000 ALTER TABLE `users_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_occupations`
--

DROP TABLE IF EXISTS `users_occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_occupations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_occupations_user_id_foreign` (`user_id`) USING BTREE,
  KEY `users_occupations_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `users_occupations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_occupations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_occupations`
--

LOCK TABLES `users_occupations` WRITE;
/*!40000 ALTER TABLE `users_occupations` DISABLE KEYS */;
INSERT INTO `users_occupations` VALUES
(1071,1073,612),
(1072,1073,613),
(1073,1073,616),
(1074,1073,617),
(1075,1073,618),
(1078,1050,613),
(1079,1050,617);
/*!40000 ALTER TABLE `users_occupations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_registration_packages`
--

DROP TABLE IF EXISTS `users_registration_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_registration_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `instructors_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `courses_capacity` int(11) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `meeting_count` int(11) DEFAULT NULL,
  `status` enum('disabled','active') NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_registration_packages_user_id_foreign` (`user_id`),
  CONSTRAINT `users_registration_packages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_registration_packages`
--

LOCK TABLES `users_registration_packages` WRITE;
/*!40000 ALTER TABLE `users_registration_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_registration_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_zoom_api`
--

DROP TABLE IF EXISTS `users_zoom_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_zoom_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `jwt_token` text DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `api_secret` text DEFAULT NULL,
  `account_id` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_zoom_api_user_id_foreign` (`user_id`),
  CONSTRAINT `users_zoom_api_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_zoom_api`
--

LOCK TABLES `users_zoom_api` WRITE;
/*!40000 ALTER TABLE `users_zoom_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_zoom_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifications`
--

DROP TABLE IF EXISTS `verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `verifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `mobile` char(16) DEFAULT NULL,
  `email` char(64) DEFAULT NULL,
  `code` char(6) NOT NULL,
  `verified_at` int(10) unsigned DEFAULT NULL,
  `expired_at` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `verifications_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifications`
--

LOCK TABLES `verifications` WRITE;
/*!40000 ALTER TABLE `verifications` DISABLE KEYS */;
INSERT INTO `verifications` VALUES
(86,1049,NULL,'fmm.tice@gmail.com','25694',1726449693,1726449743,1726449632),
(87,1050,NULL,'rasha.zaibi@gmail.com','30118',1730805443,1730805493,1730805397),
(89,1054,NULL,'racha.zaibi@aneti.tn','78662',1730894417,1730894467,1730894381),
(90,1072,NULL,'ghadaouni3@gmail.com','25386',1741947479,1741947529,1741947430),
(91,1075,NULL,'lasflores.gob.ar@gmail.com','33639',1743798257,1743798307,1743798234),
(92,1076,NULL,'toweyev292@clubemp.com','67822',NULL,1744934102,1744930502),
(93,1077,NULL,'mopas54230@agiuse.com','89457',1744931206,1744931256,1744931147),
(94,1078,NULL,'palinali@thetechnext.net','83768',1745921625,1745921675,1745921573),
(95,1080,NULL,'mavietateore@gmail.com','85220',1746537777,1746537827,1746537754),
(96,1081,NULL,'dentaire.medtrav@gmail.com','13588',1746856047,1746856097,1746855773),
(97,1082,NULL,'coursfmm@gmail.com','20970',1746856529,1746856579,1746856440);
/*!40000 ALTER TABLE `verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlists`
--

DROP TABLE IF EXISTS `waitlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_accepted` tinyint(1) DEFAULT NULL,
  `verification_token` varchar(64) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waitlists_verification_token_unique` (`verification_token`),
  KEY `waitlists_webinar_id_foreign` (`webinar_id`),
  KEY `waitlists_user_id_foreign` (`user_id`),
  CONSTRAINT `waitlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `waitlists_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlists`
--

LOCK TABLES `waitlists` WRITE;
/*!40000 ALTER TABLE `waitlists` DISABLE KEYS */;
INSERT INTO `waitlists` VALUES
(40,2091,1049,1,'ia0iRpGyk5ABgF3oBwfrZ3GV18cI0nOa','FMM TICE',NULL,NULL,1741600094),
(42,2097,1049,1,'8eLxndGcSTm750qMW3iPQDoV0UUTgRjz',NULL,NULL,NULL,1744034880);
/*!40000 ALTER TABLE `waitlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_attachments`
--

DROP TABLE IF EXISTS `webinar_assignment_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_assignment_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `assignment_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `attach` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_attachments_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `webinar_assignment_attachments_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_attachments`
--

LOCK TABLES `webinar_assignment_attachments` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_history`
--

DROP TABLE IF EXISTS `webinar_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_assignment_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instructor_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `assignment_id` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  `status` enum('pending','passed','not_passed','not_submitted') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_history_instructor_id_foreign` (`instructor_id`),
  KEY `webinar_assignment_history_student_id_foreign` (`student_id`),
  KEY `webinar_assignment_history_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `webinar_assignment_history_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignment_history_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignment_history_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_history`
--

LOCK TABLES `webinar_assignment_history` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_history_messages`
--

DROP TABLE IF EXISTS `webinar_assignment_history_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_assignment_history_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment_history_id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_history_id` (`assignment_history_id`),
  CONSTRAINT `webinar_assignment_history_id` FOREIGN KEY (`assignment_history_id`) REFERENCES `webinar_assignment_history` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_history_messages`
--

LOCK TABLES `webinar_assignment_history_messages` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_history_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_history_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_translations`
--

DROP TABLE IF EXISTS `webinar_assignment_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_assignment_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL,
  `webinar_assignment_id` int(10) unsigned NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_id_translate_foreign` (`webinar_assignment_id`),
  KEY `webinar_assignment_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_assignment_id_translate_foreign` FOREIGN KEY (`webinar_assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_translations`
--

LOCK TABLES `webinar_assignment_translations` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignments`
--

DROP TABLE IF EXISTS `webinar_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  `pass_grade` int(10) unsigned DEFAULT NULL,
  `deadline` int(10) unsigned DEFAULT NULL,
  `attempts` int(10) unsigned DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignments_creator_id_foreign` (`creator_id`),
  KEY `webinar_assignments_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_assignments_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `webinar_assignments_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignments`
--

LOCK TABLES `webinar_assignments` WRITE;
/*!40000 ALTER TABLE `webinar_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_chapter_items`
--

DROP TABLE IF EXISTS `webinar_chapter_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_chapter_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `type` enum('file','session','text_lesson','quiz','assignment') NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapter_items_chapter_id_foreign` (`chapter_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_chapter_items_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_chapter_items`
--

LOCK TABLES `webinar_chapter_items` WRITE;
/*!40000 ALTER TABLE `webinar_chapter_items` DISABLE KEYS */;
INSERT INTO `webinar_chapter_items` VALUES
(223,1047,73,96,'file',1,1741421196),
(224,1072,77,97,'file',1,1741949905),
(225,1072,78,30,'text_lesson',1,1741950041),
(226,1072,79,31,'text_lesson',1,1741950104),
(227,1071,86,32,'text_lesson',1,1742213660),
(228,1071,87,33,'text_lesson',1,1742213730),
(229,1071,88,34,'text_lesson',1,1742213964);
/*!40000 ALTER TABLE `webinar_chapter_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_chapter_translations`
--

DROP TABLE IF EXISTS `webinar_chapter_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_chapter_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_chapter_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapter_id` (`webinar_chapter_id`),
  KEY `webinar_chapter_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_chapter_id` FOREIGN KEY (`webinar_chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_chapter_translations`
--

LOCK TABLES `webinar_chapter_translations` WRITE;
/*!40000 ALTER TABLE `webinar_chapter_translations` DISABLE KEYS */;
INSERT INTO `webinar_chapter_translations` VALUES
(72,71,'en','Objectives'),
(73,72,'en','Target Audience'),
(74,73,'en','Program'),
(75,74,'en','Objectives'),
(76,75,'en','Target Audience'),
(77,76,'en','Program'),
(78,77,'en','Objectives'),
(79,78,'en','Target Audience'),
(80,79,'en','Program'),
(81,80,'en','Objectives'),
(82,81,'en','Target Audience'),
(83,82,'en','Program'),
(84,83,'en','Objectives'),
(85,84,'en','Target Audience'),
(86,85,'en','Program'),
(87,86,'en','Objectives'),
(88,87,'en','Target Audience'),
(89,88,'en','Program'),
(90,89,'en','sec1');
/*!40000 ALTER TABLE `webinar_chapter_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_chapters`
--

DROP TABLE IF EXISTS `webinar_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_chapters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `check_all_contents_pass` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapters_user_id_foreign` (`user_id`),
  KEY `webinar_chapters_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `webinar_chapters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_chapters_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_chapters`
--

LOCK TABLES `webinar_chapters` WRITE;
/*!40000 ALTER TABLE `webinar_chapters` DISABLE KEYS */;
INSERT INTO `webinar_chapters` VALUES
(71,1047,2090,NULL,0,'active',1741420835),
(72,1047,2090,NULL,0,'active',1741420835),
(73,1047,2090,NULL,0,'active',1741420835),
(74,1071,2091,NULL,0,'active',1741599434),
(75,1071,2091,NULL,0,'active',1741599434),
(76,1071,2091,NULL,0,'active',1741599434),
(77,1072,2092,NULL,0,'active',1741947584),
(78,1072,2092,NULL,0,'active',1741947584),
(79,1072,2092,NULL,0,'active',1741947584),
(80,1072,2093,NULL,0,'active',1741951022),
(81,1072,2093,NULL,0,'active',1741951022),
(82,1072,2093,NULL,0,'active',1741951022),
(83,1051,2094,NULL,0,'active',1742210291),
(84,1051,2094,NULL,0,'active',1742210291),
(85,1051,2094,NULL,0,'active',1742210291),
(86,1071,2095,NULL,0,'active',1742213389),
(87,1071,2095,NULL,0,'active',1742213389),
(88,1071,2095,NULL,0,'active',1742213389),
(89,1051,2096,NULL,0,'active',1742382230);
/*!40000 ALTER TABLE `webinar_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_contents`
--

DROP TABLE IF EXISTS `webinar_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `objectives` text NOT NULL,
  `target_audience` text NOT NULL,
  `program` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_contents_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `webinar_contents_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_contents`
--

LOCK TABLES `webinar_contents` WRITE;
/*!40000 ALTER TABLE `webinar_contents` DISABLE KEYS */;
INSERT INTO `webinar_contents` VALUES
(1,2097,'obj1','etudiants','gfklh\r\njhvjl','/store/1071/societeArabe.pdf',1744034598),
(2,2098,'objct','Target Audiences','Program','/store/1071/societeArabe.pdf',1747432508);
/*!40000 ALTER TABLE `webinar_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_extra_description_translations`
--

DROP TABLE IF EXISTS `webinar_extra_description_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_extra_description_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_extra_description_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_extra_description_id_foreign` (`webinar_extra_description_id`),
  KEY `webinar_extra_description_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_extra_description_id_foreign` FOREIGN KEY (`webinar_extra_description_id`) REFERENCES `webinar_extra_descriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_extra_description_translations`
--

LOCK TABLES `webinar_extra_description_translations` WRITE;
/*!40000 ALTER TABLE `webinar_extra_description_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_extra_description_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_extra_descriptions`
--

DROP TABLE IF EXISTS `webinar_extra_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_extra_descriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `upcoming_course_id` int(10) unsigned DEFAULT NULL,
  `type` enum('learning_materials','company_logos','requirements') NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_extra_descriptions_creator_id_foreign` (`creator_id`),
  KEY `webinar_extra_descriptions_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_extra_descriptions_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `webinar_extra_descriptions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_extra_descriptions_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_extra_descriptions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_extra_descriptions`
--

LOCK TABLES `webinar_extra_descriptions` WRITE;
/*!40000 ALTER TABLE `webinar_extra_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_extra_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_filter_option`
--

DROP TABLE IF EXISTS `webinar_filter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_filter_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_filter_option_filter_option_id_foreign` (`filter_option_id`) USING BTREE,
  KEY `webinar_filter_option_webinar_id_foreign` (`webinar_id`) USING BTREE,
  CONSTRAINT `webinar_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_filter_option_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11718 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_filter_option`
--

LOCK TABLES `webinar_filter_option` WRITE;
/*!40000 ALTER TABLE `webinar_filter_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_filter_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_partner_teacher`
--

DROP TABLE IF EXISTS `webinar_partner_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_partner_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_partner_teacher_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `webinar_partner_teacher_teacher_id_foreign` (`teacher_id`) USING BTREE,
  CONSTRAINT `webinar_partner_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_partner_teacher_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_partner_teacher`
--

LOCK TABLES `webinar_partner_teacher` WRITE;
/*!40000 ALTER TABLE `webinar_partner_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_partner_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_reports`
--

DROP TABLE IF EXISTS `webinar_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_reports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  CONSTRAINT `webinar_reports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_reports`
--

LOCK TABLES `webinar_reports` WRITE;
/*!40000 ALTER TABLE `webinar_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_reviews`
--

DROP TABLE IF EXISTS `webinar_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `content_quality` int(10) unsigned NOT NULL,
  `instructor_skills` int(10) unsigned NOT NULL,
  `purchase_worth` int(10) unsigned NOT NULL,
  `support_quality` int(10) unsigned NOT NULL,
  `rates` char(10) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `status` enum('pending','active') NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_reviews_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `webinar_reviews_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `webinar_reviews_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `webinar_reviews_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_reviews_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_reviews`
--

LOCK TABLES `webinar_reviews` WRITE;
/*!40000 ALTER TABLE `webinar_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_translations`
--

DROP TABLE IF EXISTS `webinar_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinar_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_translations_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_translations_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_translations`
--

LOCK TABLES `webinar_translations` WRITE;
/*!40000 ALTER TABLE `webinar_translations` DISABLE KEYS */;
INSERT INTO `webinar_translations` VALUES
(222,2090,'en','Test 8mars',NULL,'<p>cxc xxcxc cxw</p><p>x wx</p>'),
(223,2091,'en','cous test',NULL,'<p>fvdxwfwdxcvxcv</p>'),
(224,2092,'en','New course','new, hkj , ggg','<p>This course is a presentation and a starting point to discover the world of medical topics.</p>'),
(225,2093,'en','test',NULL,'<p>test</p>'),
(226,2094,'en','test',NULL,'<p>&nbsp;test</p>'),
(227,2095,'en','demo',NULL,'<p>qsdsqdc</p><p>swxdqsdcxqswdx</p><p>qsdcqs</p>'),
(228,2096,'en','test',NULL,'<p>test</p>'),
(229,2097,'en','New courses 25',NULL,'<p>qsfcsqf</p><p>swfdqsfd</p>'),
(230,2098,'en','test16052025',NULL,'<p>charfeddine.amri@gmail.com</p>');
/*!40000 ALTER TABLE `webinar_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinars`
--

DROP TABLE IF EXISTS `webinars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webinars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `type` enum('webinar','course','text_lesson') NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `in_days` tinyint(1) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `image_cover` varchar(255) DEFAULT NULL,
  `video_demo` varchar(255) DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link','secure_host') DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `sales_count_number` int(10) unsigned DEFAULT NULL,
  `price` double(15,2) unsigned DEFAULT NULL,
  `organization_price` double(15,2) unsigned DEFAULT NULL,
  `support` tinyint(1) DEFAULT 0,
  `certificate` tinyint(1) NOT NULL DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `partner_instructor` tinyint(1) DEFAULT 0,
  `subscribe` tinyint(1) DEFAULT 0,
  `forum` tinyint(1) NOT NULL DEFAULT 0,
  `enable_waitlist` tinyint(1) NOT NULL DEFAULT 0,
  `access_days` int(10) unsigned DEFAULT NULL COMMENT 'Number of days to access the course',
  `points` int(11) DEFAULT NULL,
  `message_for_reviewer` text DEFAULT NULL,
  `status` enum('active','pending','is_draft','inactive') NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `webinars_slug_unique` (`slug`) USING BTREE,
  KEY `webinars_teacher_id_foreign` (`teacher_id`) USING BTREE,
  KEY `webinars_category_id_foreign` (`category_id`) USING BTREE,
  KEY `webinars_slug_index` (`slug`) USING BTREE,
  KEY `webinars_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `webinars_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinars_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinars_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2099 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinars`
--

LOCK TABLES `webinars` WRITE;
/*!40000 ALTER TABLE `webinars` DISABLE KEYS */;
INSERT INTO `webinars` VALUES
(2090,1047,1047,615,'text_lesson',0,'Test-8mars',1744239600,1,0,'Africa/Tunis','/store/1/default_images/thumbnail.png','/store/1/default_images/cover_courses.png',NULL,NULL,20,NULL,100.00,50.00,0,1,0,0,0,0,1,NULL,NULL,NULL,'active',1741420834,1741421243,NULL,'store/qrcodes/2090.png'),
(2091,1071,1071,613,'text_lesson',0,'cous-test',1744758000,1,0,'Africa/Tunis','/store/1/_DSC3532.JPG','/store/1/_DSC3532.JPG',NULL,NULL,20,NULL,100.00,NULL,0,1,0,0,0,0,1,NULL,NULL,NULL,'active',1741599434,1741599851,NULL,'store/qrcodes/2091.png'),
(2092,1072,1072,613,'text_lesson',0,'New-course',1741993200,30,0,'Africa/Tunis','/store/1/_DSC3532.JPG','/store/1/_DSC3532.JPG','https://www.youtube.com/','youtube',10,4,NULL,NULL,1,1,1,1,0,1,1,5,3,'please accept my demand as soon as possible','active',1741947584,1741951927,NULL,'store/qrcodes/2092.png'),
(2093,1072,1072,616,'text_lesson',0,'test',1742166000,30,0,'Africa/Tunis','/store/1/default_images/thumbnail.png','/store/1/default_images/cover_courses.png',NULL,NULL,2,NULL,NULL,NULL,0,1,0,0,0,0,1,NULL,NULL,NULL,'inactive',1741951022,1741951081,NULL,'store/qrcodes/2093.png'),
(2094,1051,1051,618,'text_lesson',0,'test-9',1742943600,3,1,'Africa/Tunis','/store/1/MedIn.png','/store/1/dashboard.png',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,'is_draft',1742210291,1742211145,NULL,'store/qrcodes/2094.png'),
(2095,1071,1071,613,'text_lesson',0,'demo',1742425200,1,1,'Africa/Tunis','/store/1/_DSC3532.JPG','/store/1/_DSC3532.JPG',NULL,NULL,20,NULL,50.00,NULL,0,1,0,0,0,0,1,NULL,NULL,'qsdsqdf','active',1742213389,1742214002,NULL,'store/qrcodes/2095.png'),
(2096,1051,1051,613,'text_lesson',0,'test-10',NULL,NULL,NULL,NULL,'/store/1/default_images/thumbnail.png','/store/1/default_images/cover_courses.png',NULL,'upload',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,NULL,NULL,NULL,'is_draft',1742382188,1742386401,NULL,'store/qrcodes/2096.png'),
(2097,1071,1071,613,'text_lesson',0,'New-courses',1744066800,1,1,'Africa/Tunis','/store/1/default_images/thumbnail.png','/store/1/default_images/cover_courses.png',NULL,NULL,20,NULL,12.00,NULL,0,1,0,0,0,0,1,NULL,NULL,NULL,'active',1744034387,1744034966,NULL,'store/qrcodes/2097.png'),
(2098,1071,1071,614,'text_lesson',0,'test16052025',1748214000,3,1,'Africa/Tunis','/store/1/default_images/thumbnail.png','/store/1/default_images/cover_courses.png',NULL,'upload',NULL,NULL,250.00,NULL,0,1,0,0,0,0,1,NULL,NULL,NULL,'active',1747432449,1747433413,NULL,'store/qrcodes/2098.png');
/*!40000 ALTER TABLE `webinars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'admin_medin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 10:34:16

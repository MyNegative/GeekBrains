-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: tipa_kinopoisk
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `height` float DEFAULT NULL,
  `birthday` date NOT NULL,
  `birthplace` varchar(20) NOT NULL,
  `family_status` enum('Married','Divorced','Never married','No info') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (7000,'Tom Hanks',1.83,'1956-07-09','USA','Married'),(7001,'Brad Pitt',1.8,'1963-12-18','USA','Divorced'),(7002,'Morgan Freeman',1.88,'1937-06-01','USA','Divorced'),(7003,'Matthew McConaughey',1.82,'1969-11-04','USA','Married'),(7004,'Leonardo DiCaprio',1.83,'1974-11-11','USA','No info'),(7005,'Anne Hathaway',1.73,'1982-11-12','USA','Married'),(7006,'Uma Thurman',1.81,'1970-04-29','USA','Divorced'),(7007,'Keanu Reeves',1.86,'1964-09-02','Lebanon','No info'),(7008,'Hugo Weaving',1.9,'1960-04-04','Nigeria','Married'),(7009,'Scarlett Johansson',1.6,'1984-11-22','USA','Married');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `birthplace` varchar(20) NOT NULL,
  `family_status` enum('Married','Divorced','Never married') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (9000,'Robert Lee Zemekis','1952-05-14','USA','Married'),(9001,'George Walton Lucas, Jr.','1944-05-14','USA','Married'),(9002,'Denis Villeneuve','1967-10-03','Canada','Married'),(9003,'James Gunn','1966-08-05','USA','Divorced'),(9004,'Frank Darabont','1959-01-28','France','Married'),(9005,'Christopher Nolan','1970-07-30','UK','Married'),(9006,'Guy Ritchie','1968-09-10','UK','Married'),(9007,'Quentin Tarantino','1963-03-27','USA','Married'),(9008,'Martin Scorsese','1942-11-17','USA','Married'),(9009,'David Fincher','1962-08-28','USA','Divorced');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `number` tinyint NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`type`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,'Non eos officia quia repellat.',1,'http://keebler.net/'),(2,2,'Nisi tempore minus excepturi asperiores libero blanditiis.',2,'http://www.beer.com/'),(3,3,'Quia magnam magnam iure nihil esse vel atque exercitationem.',3,'http://www.ritchiekilback.net/'),(4,4,'Omnis fugiat dolores dolores enim alias placeat explicabo.',4,'http://eichmann.biz/'),(5,5,'Dolor omnis est facere atque magnam voluptatem.',5,'http://emardflatley.com/'),(6,6,'Laborum distinctio veritatis molestias laboriosam soluta quam odio.',1,'http://fritsch.biz/'),(7,7,'Inventore cumque aliquid pariatur ut nemo est reprehenderit.',2,'http://www.denesikmills.com/'),(8,8,'Sunt a ut at a sit voluptatem.',3,'http://conroy.biz/'),(9,9,'Harum non cupiditate officiis quis maiores maxime consequuntur ipsam.',4,'http://gusikowski.info/'),(10,10,'Quia suscipit assumenda dolores consequatur tempora asperiores voluptatem.',5,'http://lakin.info/'),(11,1,'Non autem quibusdam odit qui earum enim velit.',1,'http://www.beattyrussel.com/'),(12,2,'Ipsam amet ut sapiente illo blanditiis quibusdam.',2,'http://batz.info/'),(13,3,'Et sit nam fuga voluptates omnis.',3,'http://hoeger.org/'),(14,4,'Illum facere et accusamus corrupti.',4,'http://turner.com/'),(15,5,'Qui eum modi ea.',5,'http://www.markskonopelski.com/'),(16,6,'Sit quibusdam magni fuga ipsa et.',1,'http://cassin.biz/'),(17,7,'Non minima perspiciatis ut maxime voluptatem.',2,'http://www.reichel.org/'),(18,8,'Voluptatem repellat nihil iusto ullam eligendi.',3,'http://www.mayert.com/'),(19,9,'Et dolor aut nam dignissimos.',4,'http://www.flatley.com/'),(20,10,'Sed laborum odit harum sed ipsa.',5,'http://www.hackettgrady.com/');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'Teaser'),(2,'Trailer'),(3,'BTS'),(4,'TV-Spot'),(5,'Image');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_page`
--

DROP TABLE IF EXISTS `movie_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_page` (
  `movie_id` int unsigned NOT NULL,
  `slogan` text,
  `main_actor_1` int unsigned NOT NULL,
  `main_actor_2` int unsigned NOT NULL,
  `producer` varchar(50) DEFAULT NULL,
  `composer` varchar(50) DEFAULT NULL,
  `budget_usd` int unsigned NOT NULL,
  `box_office_us` int unsigned DEFAULT NULL,
  `box_office_world` int unsigned DEFAULT NULL,
  `restriction_rus` enum('0+','6+','12+','16+','18+') DEFAULT NULL,
  `MPAA` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  `duration_min` int unsigned NOT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `main_actor_1` (`main_actor_1`),
  KEY `main_actor_2` (`main_actor_2`),
  CONSTRAINT `movie_page_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movie_page_ibfk_2` FOREIGN KEY (`main_actor_1`) REFERENCES `actors` (`id`),
  CONSTRAINT `movie_page_ibfk_3` FOREIGN KEY (`main_actor_2`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_page`
--

LOCK TABLES `movie_page` WRITE;
/*!40000 ALTER TABLE `movie_page` DISABLE KEYS */;
INSERT INTO `movie_page` VALUES (1,'Soluta reprehenderit illo quidem aliquam.',7000,7000,'Mrs. Jakayla McGlynn Sr.','Evalyn Crist',32291,46765387,338450643,'12+','PG-13',16),(2,'Delectus consectetur reprehenderit consequatur nostrum nihil incidunt.',7001,7001,'Estel Howell','Quincy Sporer',356443,1656656,6872,'16+','PG-13',14),(3,'A dolores veniam earum laboriosam dolor iusto occaecati.',7002,7002,'Marta O\'Kon V','Nicole Marvin',13708,103805,7292612,'12+','NC-17',20),(4,'Modi rerum aut accusamus reprehenderit perspiciatis vitae.',7003,7003,'Miss Marilyne Cronin DVM','Ezra Littel',5,21731768,5334523,'12+','G',9),(5,'In ut esse praesentium aut esse.',7004,7004,'Kennedy Harris','Prof. Alta Feest DDS',0,61,7551592,'0+','PG',23),(6,'Dolore qui sit ab maiores id expedita est.',7005,7005,'Dr. Bertram Harber Jr.','Tremaine Fisher',100,89537719,28,'18+','NC-17',7),(7,'Reiciendis eius corporis omnis soluta.',7006,7006,'Taylor Bernhard','Zion O\'Conner',184,0,15,'0+','R',0),(8,'Non corporis non possimus et.',7007,7007,'Noah Homenick','Ms. Brigitte Hayes',13,800768,245604,'6+','G',10),(9,'Nemo et omnis ipsum est officia assumenda.',7008,7008,'Mrs. Gerda Gaylord DDS','Agustin D\'Amore',59159790,2194853,69,'0+','PG-13',1),(10,'Doloribus id aut aut nam aut molestiae est.',7009,7009,'Mrs. Emmy Bernier Jr.','Dr. Valerie Greenfelder V',0,0,7204683,'6+','R',15);
/*!40000 ALTER TABLE `movie_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `director` int unsigned NOT NULL,
  `year` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `director` (`director`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`director`) REFERENCES `directors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Green Mile',9004,1999),(2,'The Shawshank Redemption',9004,1994),(3,'Forrest Gump',9000,1994),(4,'Interstellar',9005,2014),(5,'Lock, Stock and Two Smoking Barrels',9006,1998),(6,'Pulp Fiction',9007,1994),(7,'Inception',9005,2010),(8,'Back to the Future',9000,1985),(9,'Shutter Island',9008,2010),(10,'Fight Club',9009,1999);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int unsigned DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'Temporibus amet sit similique. Quos ullam cupiditate repellat quos. Modi eos ea odio placeat nemo voluptatem. Provident et natus omnis totam sint id eligendi.'),(2,2,'Vitae et iste deleniti qui. Unde consequatur molestiae itaque consequatur.'),(3,3,'Quae rerum quia molestiae soluta consequatur quia. Delectus est magnam nemo repudiandae sit saepe labore.'),(4,4,'Molestias dolorum nulla totam provident optio et tenetur illo. Non sapiente ratione voluptatibus pariatur. Rerum ipsam deleniti ut architecto.'),(5,5,'Minus aspernatur tenetur magnam laboriosam at alias a. Magni vitae quisquam ea sint quia accusamus.'),(6,6,'Ratione aut eum reiciendis dolores nam. Voluptas ut cum non a. Aut doloremque odio dolorem repellat placeat ea cumque. Commodi qui perspiciatis qui quaerat.'),(7,7,'Voluptatem in est fugiat quia sapiente rerum ipsam molestiae. Voluptas aut repellendus ullam sint. Sapiente reiciendis voluptatem et repudiandae facilis debitis.'),(8,8,'Adipisci porro error qui similique sed. Minus voluptas hic facilis distinctio ut. Vel et a officiis at nulla quos.'),(9,9,'Ad eaque necessitatibus natus libero autem itaque soluta. Nostrum aut eaque iusto hic repudiandae. Dolorem cum quo quia et.'),(10,10,'Molestiae eum dolore accusamus voluptatem quos eius. Voluptatum ipsum sit nisi iste perferendis. Excepturi quo quia qui dolorum fuga soluta dolorem. Ut nulla voluptatem sed esse quia.'),(11,1,'Laboriosam qui sit sint et ipsa laborum nesciunt et. Fugit qui sint totam dicta velit. Voluptate ratione et eos quam eos.'),(12,2,'Deleniti reiciendis aut quisquam nihil voluptate. Quos maxime voluptate provident quo. Officiis eum sint esse modi eligendi illo.'),(13,3,'Natus maxime vitae ducimus soluta ut. Velit soluta dolores tenetur repellat sunt debitis ab. Omnis harum accusamus adipisci nesciunt aut aut officia. Non non est atque delectus.'),(14,4,'Deleniti rerum accusantium iusto. Quia mollitia aperiam itaque voluptatibus ratione consequatur laborum. Sed ab saepe impedit non. Maxime earum eum ad cum quia qui.'),(15,5,'Ad voluptates non dolorem sunt. Officiis quos animi harum temporibus aspernatur aut est. Consequuntur voluptate dolores quo ut beatae. Distinctio incidunt doloribus nihil fugit eos ex quasi.'),(16,6,'Rerum et nulla non rerum. Ut nemo at et velit vitae est praesentium. Aliquam laudantium ut et autem. Suscipit velit autem repellat eveniet dolorem.'),(17,7,'Est itaque et ducimus minus eaque doloremque voluptas. Qui molestias illo optio fugit at quidem quia. Magni enim saepe sed quaerat est adipisci temporibus.'),(18,8,'Iusto earum similique aliquam qui eum sit debitis hic. Ut sed possimus perferendis vero asperiores quam. Est et id occaecati excepturi delectus vitae.'),(19,9,'Soluta suscipit autem magni modi. Tempore ex vitae laborum culpa aspernatur sunt porro quidem. Aperiam voluptate harum voluptatem molestiae qui veniam perspiciatis. Natus inventore eos quo cumque.'),(20,10,'Odio totam blanditiis perferendis quod quia voluptas quisquam qui. Sit ut et error animi velit non. Quae voluptas asperiores voluptates itaque voluptate dolore.'),(21,1,'Deserunt ullam repudiandae nulla itaque nam est ut. Cupiditate minima perferendis in deleniti. Enim et aut deleniti architecto adipisci pariatur non.'),(22,2,'Quidem consequatur architecto iste doloribus recusandae quis. Ea quaerat ut exercitationem dignissimos vel. Repellendus perferendis eveniet et exercitationem esse ut.'),(23,3,'Pariatur quas reprehenderit id. Sit qui autem quas ratione. Ut quo quis doloribus explicabo aut perferendis enim. Perferendis ex tempore consectetur aliquid.'),(24,4,'Nisi quam molestiae ad voluptate. Natus et mollitia eaque debitis laboriosam. Dolor harum corrupti cum a mollitia vero rerum.'),(25,5,'Placeat praesentium aut et mollitia dolores. Nemo sint aliquid voluptatem delectus aliquam architecto adipisci. Temporibus sed et repellendus autem.'),(26,6,'Velit quo dolores aut. Est aut quaerat veritatis repudiandae fuga quo officiis. Officiis eveniet praesentium aliquam animi ea. Deleniti expedita illum ut molestias aliquid enim alias nihil.'),(27,7,'Fugiat quasi pariatur dolores voluptas architecto est. Cumque consequatur impedit odio dolores. Aut perferendis rerum veniam laboriosam blanditiis esse. Quia odio eos quod incidunt nam.'),(28,8,'Quod aut soluta assumenda rerum aut id modi molestias. Eaque cum modi deserunt eum ab iusto. Nemo omnis itaque quia et quis nostrum dolore sint. Porro ipsa a nisi.'),(29,9,'Atque voluptatem ipsum laudantium rerum. Eius vel mollitia rerum quidem. Nemo laboriosam sapiente sint sint et soluta quam rerum. Rerum vel in non ut dolore eum.'),(30,10,'Quisquam accusamus recusandae officia. Accusantium impedit perspiciatis quia ad. Velit earum dolorem sequi ut libero omnis consectetur qui.');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user` int unsigned NOT NULL,
  `to_movie` int unsigned NOT NULL,
  `body` text,
  `grade` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user` (`from_user`),
  KEY `to_movie` (`to_movie`),
  KEY `grade` (`grade`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`to_movie`) REFERENCES `movies` (`id`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`grade`) REFERENCES `grades` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,'Consequatur nihil nobis qui veniam doloremque tenetur. Sed facilis illum in libero. Exercitationem earum suscipit ipsum aut maiores ut hic. Nemo sunt delectus nemo odit facere soluta et aut.',5),(2,2,2,'Commodi aut quas id adipisci cupiditate nihil aut. Accusantium praesentium fuga asperiores voluptatem sit consequuntur dolor. Fuga repudiandae reiciendis voluptatibus enim non sint ea. Consequatur dignissimos iure mollitia sed provident quis voluptate.',5),(3,3,3,'Natus nostrum dicta similique. Ut accusamus quaerat hic rem iusto corporis in ut. Corrupti provident voluptatem et atque at iste explicabo. Voluptatibus quia dolores placeat doloremque exercitationem dolor ad.',6),(4,4,4,'Ratione quam temporibus commodi deserunt libero necessitatibus error. Magni rerum optio ut. Veritatis qui non consequuntur.',8),(5,5,5,'Corporis eaque laborum magnam. Corporis quo laudantium incidunt ratione. Voluptatem excepturi reprehenderit repellendus ut temporibus iure.',4),(6,6,6,'Et aut delectus voluptatum sed saepe consectetur. Quasi qui est aut. Est doloremque et laudantium minus laborum. Voluptatem saepe necessitatibus ducimus eum a.',9),(7,7,7,'Quo eius quidem quos. Eos aut culpa ipsam quo rerum vel doloribus. Velit voluptate similique quis velit. Minus minima ab mollitia et.',7),(8,8,8,'Veritatis rem et totam vel optio natus nobis. A quia similique non modi. Quod eos ad debitis et ut. Voluptas occaecati ullam sit aut minus cupiditate.',3),(9,9,9,'Deleniti hic voluptatibus sit pariatur quia et quidem. Provident commodi doloremque repellendus laudantium.',4),(10,10,10,'Et animi et tenetur illum deleniti veritatis qui. Omnis quia consequuntur nihil illum illum ullam. Deserunt perspiciatis corporis aut quia sed.',7),(11,11,1,'Quis ut ut fuga officia earum. Voluptas quae incidunt excepturi quibusdam architecto ut beatae aliquam. Ut cumque deserunt nobis harum quae.',6),(12,12,2,'Cumque quia placeat unde ut asperiores sapiente. Mollitia commodi et blanditiis laborum aliquam est velit. Consequatur neque nobis ipsam et.',0),(13,13,3,'Perferendis laboriosam et enim vero earum est voluptates. Voluptas totam exercitationem voluptatum molestias quo sint. Consequatur voluptatem adipisci rerum perferendis. Exercitationem praesentium delectus temporibus qui omnis praesentium.',3),(14,14,4,'Atque quis quo dolorem maxime adipisci. Mollitia tempore et consequatur fuga adipisci quia tempore in. Perferendis provident praesentium corporis laudantium.',6),(15,15,5,'Voluptates quam distinctio reiciendis repellendus consectetur est quisquam quisquam. Ea amet aliquid molestiae aliquam molestiae. Eligendi dolorem ut et sint aperiam iusto ipsa. Eos enim placeat rerum eum.',4),(16,16,6,'Voluptate ullam qui eveniet est dolores labore. Est voluptatibus dolor optio non.',0),(17,17,7,'Veritatis ut sed corrupti ex. Non consequuntur provident reiciendis eius. Et quod ut consequatur eligendi. Est sapiente deserunt quia reiciendis error cum. Non voluptas et architecto quia beatae molestiae.',5),(18,18,8,'Eum ex ut delectus quod. Nihil libero commodi voluptas quaerat laboriosam quis. Maiores quidem porro maxime voluptatem. Architecto sed rem et sed magni.',8),(19,19,9,'Minus ea nam animi nesciunt aliquid. Temporibus rerum sit laudantium labore animi atque qui corrupti. Id aut hic perspiciatis quis. Sed adipisci quidem delectus voluptatem sed dolorem. Unde voluptate quibusdam velit aut accusantium impedit tempore.',0),(20,20,10,'Cumque ut illo voluptatem numquam. Accusamus occaecati officiis natus. Eveniet accusantium est nobis non eaque et ducimus. Et perferendis dolorem et est est. Illo quis iusto nostrum explicabo.',7),(21,21,1,'Esse sed totam est rem aut facere non. Ut dicta voluptate eaque sit illum necessitatibus. Maiores alias doloribus totam accusamus.',3),(22,22,2,'Temporibus dignissimos neque sunt. A molestiae alias in nihil eos ipsum non. Doloribus est officiis in culpa. Esse incidunt doloremque dignissimos consequuntur sit. Et qui soluta accusamus praesentium.',4),(23,23,3,'Quo consequatur beatae officiis exercitationem. Est eum at fugiat earum enim molestiae aliquam. Unde et vel pariatur consequatur.',0),(24,24,4,'Qui sed quidem molestiae aperiam occaecati. Sed atque voluptates iusto incidunt consequuntur dolores. Similique sit sit ipsam quas explicabo.',0),(25,25,5,'Sed error nesciunt repellat quas corporis fuga labore. Veritatis impedit in sunt qui architecto iure.',9),(26,26,6,'Est voluptatum esse non numquam omnis. Odio eaque ad ut et consectetur cupiditate.',4),(27,27,7,'Consequuntur reprehenderit sit ipsam ut omnis qui facere pariatur. Voluptatum voluptatem neque ducimus ex veniam debitis. Consectetur minima qui facere autem dolorem excepturi dolorem.',8),(28,28,8,'Voluptas sed ut sequi voluptate explicabo. Labore est non sunt ut et aspernatur. Itaque impedit pariatur blanditiis vel.',2),(29,29,9,'Ipsam ut in vel blanditiis sed velit id maxime. Ipsum qui vitae totam eius. Vero dolorem impedit nesciunt rerum.',4),(30,30,10,'In molestias expedita labore nemo qui ex amet. Dolores nisi fugit ut non ad illum rerum. Vero autem expedita ut dicta. Non fugit officia autem sint recusandae possimus quod.',2);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `birthday` date NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Carlee','Ledner','M','2003-05-17','Saint Helena'),(2,'Jaden','Nikolaus','F','1994-04-20','New Zealand'),(3,'Einar','Harvey','M','1997-11-20','South Africa'),(4,'Shania','Leuschke','F','1989-11-01','Guinea-Bissau'),(5,'Tiana','Graham','F','1988-07-24','Australia'),(6,'Adeline','Paucek','M','2005-03-17','Aruba'),(7,'Queen','Batz','F','1992-04-26','Poland'),(8,'Garfield','Jakubowski','F','1972-07-18','Argentina'),(9,'Allan','Langosh','F','1990-07-26','Slovakia (Slovak Rep'),(10,'Andre','Pollich','M','2003-01-09','Denmark'),(11,'Rita','Kunze','F','1983-11-07','Palau'),(12,'Forrest','Jenkins','M','2007-12-30','Western Sahara'),(13,'Derick','Schroeder','F','2002-05-27','Pakistan'),(14,'Jovani','Price','F','1994-09-14','Cyprus'),(15,'Pinkie','Ruecker','M','2007-03-08','Somalia'),(16,'Vanessa','Williamson','M','1972-10-18','Saudi Arabia'),(17,'Meghan','Nikolaus','F','1975-07-30','Montserrat'),(18,'Randy','Schumm','F','1985-02-11','India'),(19,'Fritz','DuBuque','F','2018-10-09','Pakistan'),(20,'Ariel','Price','F','1971-03-22','Timor-Leste'),(21,'Ali','Hirthe','F','1982-12-15','Antigua and Barbuda'),(22,'Sarina','O\'Keefe','F','2016-01-19','Micronesia'),(23,'Willa','Botsford','M','2007-08-02','Haiti'),(24,'Elvera','Aufderhar','F','1978-04-22','Tunisia'),(25,'Gerda','Mann','F','2020-05-11','Macedonia'),(26,'Jada','Gerlach','F','2010-09-02','Bahamas'),(27,'Andres','Leuschke','M','2009-04-20','Somalia'),(28,'Dannie','Corkery','F','2010-06-26','Western Sahara'),(29,'Brandt','Stracke','F','1996-12-05','Cook Islands'),(30,'Elroy','Gerhold','F','2000-07-01','Greece'),(31,'Wilhelmine','Schmitt','F','2009-08-05','Malta'),(32,'Amparo','Beier','F','1980-06-26','Uruguay'),(33,'Burdette','Berge','M','2001-06-29','Nepal'),(34,'Christina','Satterfield','M','1992-07-07','Malawi'),(35,'Ricardo','O\'Reilly','F','2012-01-31','Bermuda'),(36,'Vicenta','Bradtke','M','2010-12-18','Brunei Darussalam'),(37,'Brendan','Parisian','F','2021-06-07','Saint Barthelemy'),(38,'Milo','Kris','F','2021-05-23','Fiji'),(39,'Brandt','Stracke','M','1987-07-24','Uzbekistan'),(40,'Kendrick','Schoen','F','2008-03-17','Aruba'),(41,'Justine','Abbott','M','1979-11-29','Nepal'),(42,'Estrella','Kub','M','1970-05-17','Barbados'),(43,'Mina','Russel','F','1986-03-27','Andorra'),(44,'Blaze','Renner','F','1991-02-23','American Samoa'),(45,'Bethany','Haag','F','2017-02-14','Netherlands Antilles'),(46,'Lavinia','Spencer','F','1987-04-03','Costa Rica'),(47,'Savannah','Fadel','M','1985-12-20','Bhutan'),(48,'Arielle','Harris','F','2012-07-11','Egypt'),(49,'Benton','Jaskolski','F','1974-10-13','Tajikistan'),(50,'Charity','Durgan','M','1997-10-25','Turkey');
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

-- Dump completed on 2021-10-06 12:06:34

-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tomatodb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plots`
--

LOCK TABLES `plots` WRITE;
/*!40000 ALTER TABLE `plots` DISABLE KEYS */;
INSERT INTO `plots` VALUES (1,1,'hydroponic','indoor hydroponics	',100,0,'Admin Tester'),(2,1,'hydroponic','indoor hydroponics	',1000,0,'Admin Tester'),(3,1,'healthy soil','covered hoop house	',200,0,'Admin Tester'),(4,2,'rocky soil','traditional outdoor	',400,0,'	Man Jay'),(5,3,'woody soil','covered hoop house	',72,0,'	Joe Pera'),(6,1,'sandy soil	','traditional outdoor	',30,0,'Admin Tester'),(7,4,'hydroponic','indoor hydroponics	',30,0,'Cory Quirk	'),(8,4,'woody soil	','covered hoop house	',20,0,'	Cory Quirk	'),(9,5,'healthy soil','outdoor raised beds	',50,0,'Nick Drake'),(10,6,'sandy soil	','traditional outdoor	',120,0,'Kate Bush	'),(11,7,'healthy soil','traditional outdoor	',50,0,'Connor O\'Malley	'),(16,5,'hydroponic','indoor hydroponics	',9,0,'Nick Drake'),(17,20,'hydroponic','indoor hydroponics	',7,0,'Miguel Sano	'),(18,7,'healthy soil','	traditional open air',500,0,'Connor O\'Malley	'),(19,7,'healthy soil','	traditional open air',200,0,'Connor O\'Malley	'),(20,6,'rocky soil','traditional outdoor	',10,0,'Kate Bush'),(21,7,'sandy soil	','covered hoop house	',40,0,'Conner O\'Malley');
/*!40000 ALTER TABLE `plots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plots_plants`
--

LOCK TABLES `plots_plants` WRITE;
/*!40000 ALTER TABLE `plots_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `plots_plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (34,21,'USER','2022-04-19 19:55:36'),(35,19,'USER','2022-04-19 19:55:36'),(36,7,'USER','2022-04-19 19:55:36'),(37,4,'USER','2022-04-19 19:55:36'),(38,3,'USER','2022-04-19 19:55:36'),(39,6,'USER','2022-04-19 19:55:36'),(40,20,'USER','2022-04-19 19:55:36'),(41,5,'USER','2022-04-19 19:55:36'),(42,1,'USER','2022-04-19 19:55:36'),(43,2,'USER','2022-04-19 19:55:36'),(53,1,'ADMIN','2022-04-19 20:21:05'),(54,2,'ADMIN','2022-04-19 20:22:43'),(56,4,'ADMIN','2022-04-19 20:22:50');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Tester','test123@email.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:03:41'),(2,'Man','Jay','testemail123@email.com','$2a$10$5GQO5NTzgkqAtvwe9H4jz.i2innHmBnEBPnFkRCnYeU0iX2XriWFG','2022-04-11 01:03:41'),(3,'Joe','Pera','joetoematoe@test.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(4,'Cory','Quirk','coryquirk@ymail.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(5,'Nick','Drake','test@email.net','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(6,'Kate','Bush','kate@gmail.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(7,'Conner','O\'Malley','conner@melsky.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(19,'Carlos','Correa','ccorrea@twins.com','$2a$10$ZazCZ.REm726neubkU5AnuxzKzQAJ8CxVKOHUsCPZt57bZrHtCOFS','2022-04-17 23:20:50'),(20,'Miguel','Sano','msano@twins.com','$2a$10$a9L2awptpQEw4tCOA5CQveHk.UfosElsFnzMlinEO/ycQHOQizmm.','2022-04-17 23:27:16'),(21,'Mac','DeMarco','blueboy@mac.com','$2a$10$c/Wnc7JmDLxJvVK6cSZIEuXhbhpE1NZp9fb1Vlf2a6SitDZt4lLCy','2022-04-18 02:45:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `varieties`
--

LOCK TABLES `varieties` WRITE;
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;
INSERT INTO `varieties` VALUES (1,'aunt ruby’s german','beefsteak','green','https://www.seedsavers.org/site/img/seo-images/0249-aunt-rubys-german-green-tomato-organic.jpg'),(2,'amish paste','canning','red','https://www.seedsavers.org/site/img/seo-images/0107A-amish-paste-tomato-organic.jpg'),(3,'austin\'s red','pear','red','https://www.seedsavers.org/site/img/seo-images/1227C-austins-red-pear-tomato.jpg'),(4,'baker family','heirloom','red-orange','https://www.seedsavers.org/site/img/seo-images/0335-baker-family-heirloom-tomato-organic.jpg'),(5,'beam\'s yellow','pear','yellow','https://www.seedsavers.org/site/img/seo-images/0661-beams-yellow-pear-tomato.jpg'),(6,'black cherry','cherry','black','https://www.seedsavers.org/site/img/seo-images/1609-black-cherry-tomato-organic.jpg'),(7,'black from tula','heirloom','black','https://www.seedsavers.org/site/img/seo-images/0251-black-from-tula-tomato.jpg'),(8,'black krim','heirloom','black','https://www.seedsavers.org/site/img/seo-images/0662-black-krim-tomato.jpg'),(9,'black plum','plum','black','https://www.seedsavers.org/site/img/seo-images/0018-black-plum-tomato.jpg'),(10,'black sea man','heirloom','black','https://www.seedsavers.org/site/img/seo-images/0019-black-sea-man-tomato-organic.jpg'),(11,'blondkopfchen','cherry','gold','https://www.seedsavers.org/site/img/seo-images/1228-blondkopfchen-tomato-organic.jpg'),(12,'brandywine','slicer','red','https://www.seedsavers.org/site/img/seo-images/0427-brandywine-sudduths-strain-tomato.jpg'),(13,'cherokee purple','heirloom','purple','https://www.seedsavers.org/site/img/seo-images/0253-cherokee-purple-tomato-organic.jpg'),(14,'cherry roma','cherry','red','https://www.seedsavers.org/site/img/seo-images/0974A-cherry-roma-tomato-organic.jpg'),(15,'cream sausage','roma','red','https://www.seedsavers.org/site/img/seo-images/1314-tomato-cream-sausage.jpg'),(16,'david davidson’s','slicer','yellow','https://www.seedsavers.org/site/img/seo-images/0027-david-davidsons-tomato-organic.jpg'),(17,'crynkovic yugoslavian','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0663-crnkovic-yugoslavian-tomato.jpg'),(18,'dester','heirloom','red','https://www.seedsavers.org/site/img/seo-images/1552-dester-tomato-organic.jpg'),(19,'dr. wyche\'s','beefsteak','yellow','https://www.seedsavers.org/site/img/seo-images/0975C-dr-wyche\'s-yellow-tomato.jpg'),(20,'earliana','slicer','red','https://www.seedsavers.org/site/img/seo-images/1451-earliana-tomato-organic.jpg'),(21,'eva purple ball','slicer','red','https://www.seedsavers.org/site/img/seo-images/1387-eva-purple-ball-tomato.jpg'),(22,'federle','canning','red','https://www.seedsavers.org/site/img/seo-images/0439-federle-tomato.jpg'),(23,'german pink','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0440A-german-pink-tomato-organic.jpg'),(24,'gold medal','heirloom','gold','https://www.seedsavers.org/site/img/seo-images/0825-gold-medal-tomato.jpg'),(25,'gold rush currant','cherry','gold','https://www.seedsavers.org/site/img/seo-images/1229-gold-rush-currant-tomato-organic.jpg'),(26,'green grape','grape','green','https://www.seedsavers.org/site/img/seo-images/1231-gree-grape-tomato.jpg'),(27,'green zebra','heirloom','green','https://www.seedsavers.org/site/img/seo-images/0443C-tomato-green-zebra.jpg'),(28,'hartman\'s yellow gooseberry','cherry','yellow','https://www.seedsavers.org/site/img/seo-images/1481-hartmans-yellow-gooseberry-tomato-organic.jpg'),(29,'hungarian heart','canning','orange','https://www.seedsavers.org/site/img/seo-images/0444-hungarian-heart-tomato.jpg'),(30,'hillbilly potato leaf','beefsteak','yellow','https://www.seedsavers.org/site/img/seo-images/0979-hillbilly-potato-leaf-tomato.jpg'),(31,'igleheart','cherry','yellow','https://www.seedsavers.org/site/img/seo-images/0118-igleheart-yellow-cherry-tomato-organic.jpg'),(32,'isis candy cherry','cherry','red-orange','https://www.seedsavers.org/site/img/seo-images/1232-isis-candy-cherry-tomato.jpg'),(33,'italian heirloom','canning','red','https://www.seedsavers.org/site/img/seo-images/0826-italian-heirloom-tomato-organic.jpg'),(34,'japanese trifele black','slicer','black','https://www.seedsavers.org/site/img/seo-images/1460A-japanese-trifele-black-tomato-organic.jpg'),(35,'jaune flamme','slicer','red','https://www.seedsavers.org/site/img/seo-images/0827-jaune-flamme-tomato-organic.jpg'),(36,'john baer','slicer','red','https://www.seedsavers.org/site/img/seo-images/1435-john-baer-tomato-organic.jpg'),(37,'kanner hoell','canning','red','https://www.seedsavers.org/site/img/seo-images/0011-kanner-hoell-tomato-organic.jpg'),(38,'kellogg\'s breakfast','beefsteak','orange','https://www.seedsavers.org/site/img/seo-images/1057-kelloggs-breakfast-tomato-organic.jpg'),(39,'kolb','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/1482-tomato-kolb.jpg'),(40,'large red cherrry','cherry','red','https://www.seedsavers.org/site/img/seo-images/0828-large-red-cherry-tomato-organic.jpg'),(41,'lemon drop','cherry','yellow','https://www.seedsavers.org/site/img/seo-images/1233-lemon-drop-tomato-organic.jpg'),(42,'livingston\'s paragon','slicer','red','https://www.seedsavers.org/site/img/seo-images/0144-livingstons-paragon-tomato-organic.jpg'),(43,'mamie brown\'s pink','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/1611-mamie-browns-pink-tomato-organic.jpg'),(44,'martino\'s roma','roma','red','https://www.seedsavers.org/site/img/seo-images/0259-martinos-roma-tomato-organic.jpg'),(45,'missouri pink love apple','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0117-missouri-pink-love-apple-tomato-organic.jpg'),(46,'moonglow','slicer','orange','https://www.seedsavers.org/site/img/seo-images/0446-moonglow-tomato-organic.jpg'),(47,'mortgage lifter (halladay\'s)','beefsteak','red','https://www.seedsavers.org/site/img/seo-images/1380-mortgage-lifter-halladays-tomato.jpg'),(48,'nebraska wedding','beefsteak','orange','https://www.seedsavers.org/site/img/seo-images/0261-nebraska-wedding-tomato-organic.jpg'),(49,'nyagous','heirloom','brown-red','https://www.seedsavers.org/site/img/seo-images/1237-nyagous-tomato-organic.jpg'),(50,'oma\'s orange','beefsteak','orange','https://www.seedsavers.org/site/img/seo-images/0289-omas-orange-tomato.jpg'),(51,'oma\'s pink','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0290-omas-pink-tomato.jpg'),(52,'opalka','canning','pink','https://www.seedsavers.org/site/img/seo-images/0447A-opalka-tomato-organic.jpg'),(53,'paul robeson','slicer','red','https://www.seedsavers.org/site/img/seo-images/1604A-paul-robeson-tomato-organic.jpg'),(54,'peach blow sutton','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/1572-peach-blow-sutton-tomato-organic.jpg'),(55,'powers heirloom','heirloom','yellow','https://www.seedsavers.org/site/img/seo-images/1453-tomato-powers-heirloom.jpg'),(56,'principe borghese','grape','red','https://www.seedsavers.org/site/img/seo-images/0823C-principe-borghese-tomato.jpg'),(57,'red fig','pear','red','https://www.seedsavers.org/site/img/seo-images/1235-red-fig-tomato-organic.jpg'),(58,'red zebra','heirloom','red-orange','https://www.seedsavers.org/site/img/seo-images/1317A-red-zebra-tomato-organic.jpg'),(59,'redfield beauty','slicer','red','https://www.seedsavers.org/site/img/seo-images/1483-redfield-beauty-tomato-organic.jpg'),(60,'riesentraube','plum','red','https://www.seedsavers.org/site/img/seo-images/0263A-riesentraube-tomato.jpg'),(61,'rosso sicilian','beefsteak','red','https://www.seedsavers.org/site/img/seo-images/1530-rosso-sicilian-tomato-organic.jpg'),(62,'sheboygan','canning','red','https://www.seedsavers.org/site/img/seo-images/1484-sheboygan-tomato-organic.jpg'),(63,'siberian','slicer','red','https://www.seedsavers.org/site/img/seo-images/1236-siberian-tomato-organic.jpg'),(64,'silvery fir tree','beefsteak','red-orange','https://www.seedsavers.org/site/img/seo-images/0029-silvery-fir-tree-tomato-organic.jpg'),(65,'speckled roman','roma','red-orange','https://www.seedsavers.org/site/img/seo-images/0981A-speckled-roma-tomato-organic.jpg'),(66,'stupice','cocktail','red','https://www.seedsavers.org/site/img/seo-images/0667-stupice-tomato-organic.jpg'),(67,'sweet pea currant','cherry','red','https://www.seedsavers.org/site/img/seo-images/1230-sweet-pea-currant-tomato-organic.jpg'),(68,'tasty evergreen','beefsteak','green','https://www.seedsavers.org/site/img/seo-images/0434-tasty-evergreen-tomato-organic.jpg'),(69,'tommy toe','cherry','red','https://www.seedsavers.org/site/img/seo-images/0265-tommy-toe-tomato.jpg'),(70,'trophy','slicer','red','https://www.seedsavers.org/site/img/seo-images/1183-trophy-tomato.jpg'),(71,'trucker\'s favorite pink ','slicer','pink','https://www.seedsavers.org/site/img/seo-images/1485-truckers-favorite-tomato-organic.jpg'),(72,'ukranian purple','plum','purple','https://www.seedsavers.org/site/img/seo-images/1234-ukrainian-purple-tomato.jpg'),(73,'varigated','slicer','various','https://www.seedsavers.org/site/img/seo-images/1318-tomato-variegated.jpg'),(74,'velvet red','cherry','red','https://www.seedsavers.org/site/img/seo-images/1226-velvet-red-tomato-organic.jpg'),(75,'wapsipinicon peach','slicer','yellow','https://www.seedsavers.org/site/img/seo-images/1058-wapsipinicon-peach-tomato.jpg'),(76,'white cherry','cherry','yellow-white','https://www.seedsavers.org/site/img/seo-images/1610-white-cherry-tomato-organic.jpg'),(77,'white tomesol','slicer','yellow-white','https://www.seedsavers.org/site/img/seo-images/1620-white-tomesol-tomato.jpg'),(78,'whittemore heirloom','beefsteak','red','https://www.seedsavers.org/site/img/seo-images/0181-whittemore-heirloom-tomato-organic.jpg'),(79,'wisconsin 55','canning','pink','https://www.seedsavers.org/site/img/seo-images/1059-wisconsin-55-tomato-organic.jpg'),(80,'wisconsin chief','canning','red','https://www.seedsavers.org/site/img/seo-images/0224-wisconsin-chief-tomato-organic.jpg');
/*!40000 ALTER TABLE `varieties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-20  0:27:47

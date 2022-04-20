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
INSERT INTO `plots` VALUES (1,20,'hydroponic','indoor hydroponics	',100,0,NULL),(2,1,'hydroponic','indoor hydroponics	',1000,0,NULL),(3,2,'healthy soil','covered hoop house	',200,0,NULL),(4,2,'rocky soil','traditional outdoor	',400,0,NULL),(5,3,'woody soil','covered hoop house	',72,0,NULL),(6,3,'sandy soil	','traditional outdoor	',30,0,NULL),(7,4,'hydroponic','indoor hydroponics	',30,0,NULL),(8,4,'woody soil	','covered hoop house	',20,0,NULL),(9,5,'healthy soil','outdoor raised beds	',50,0,NULL),(10,6,'sandy soil	','traditional outdoor	',120,0,NULL),(11,7,'healthy soil','traditional outdoor	',50,0,NULL),(16,5,'hydroponic','indoor hydroponics	',9,0,NULL),(17,1,'healthy soil','	traditional open air',7,0,NULL),(18,7,'healthy soil','	traditional open air',500,0,NULL),(19,7,'healthy soil','	traditional open air',200,0,NULL),(20,6,'rocky soil','traditional outdoor	',10,0,NULL);
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
INSERT INTO `users` VALUES (1,'Admin','Tester','test123@email.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:03:41'),(2,'Man','Jay','testemail123@email.com','$2a$10$5GQO5NTzgkqAtvwe9H4jz.i2innHmBnEBPnFkRCnYeU0iX2XriWFG','2022-04-11 01:03:41'),(3,'Joe','Pera','joetoematoe@test.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(4,'Cory','Quirk','coryquirk@ymail.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(5,'Nick','Drake','test@email.net','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(6,'Kate','Bush','kate@gmail.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(7,'Connor','O\'Malley','connor@laughattack.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(19,'Carlos','Correa','ccorrea@twins.com','$2a$10$ZazCZ.REm726neubkU5AnuxzKzQAJ8CxVKOHUsCPZt57bZrHtCOFS','2022-04-17 23:20:50'),(20,'Miguel','Sano','msano@twins.com','$2a$10$a9L2awptpQEw4tCOA5CQveHk.UfosElsFnzMlinEO/ycQHOQizmm.','2022-04-17 23:27:16'),(21,'Mac','DeMarco','blueboy@mac.com','$2a$10$c/Wnc7JmDLxJvVK6cSZIEuXhbhpE1NZp9fb1Vlf2a6SitDZt4lLCy','2022-04-18 02:45:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `varieties`
--

LOCK TABLES `varieties` WRITE;
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;
INSERT INTO `varieties` VALUES (1,'dr. wyche\'s','beefsteak','yellow'),(2,'german pink','beefsteak','pink'),(3,'hillbilly potato leaf','beefsteak','yellow'),(4,'kellogg\'s breakfast','beefsteak','orange'),(5,'kolb','beefsteak','pink'),(6,'mamie brown\'s pink','beefsteak','pink'),(7,'missouri pink love apple','beefsteak','pink'),(8,'mortgage lifter (halladay\'s)','beefsteak','red'),(9,'nebraska wedding','beefsteak','orange'),(10,'oma\'s orange','beefsteak','orange'),(11,'oma\'s pink','beefsteak','pink'),(12,'peach blow sutton','beefsteak','pink'),(13,'redfield beauty','beefsteak','red'),(14,'rosso sicilian','beefsteak','red'),(15,'silvery fir tree','beefsteak','red-orange'),(16,'tasty evergreen','beefsteak','green'),(17,'whittemore heirloom','beefsteak','red'),(18,'crynkovic yugoslavian','beefsteak','pink'),(19,'amish paste','canning','red'),(20,'kanner hoell','canning','red'),(21,'opalka','canning','pink'),(22,'sheboygan','canning','red'),(23,'wisconsin 55','canning','pink'),(24,'wisconsin chief','canning','red'),(25,'federle','canning','red'),(26,'black cherry','cherry','black'),(27,'blondkopfchen','cherry','gold'),(28,'cherry roma','cherry','red'),(29,'hartman\'s yellow gooseberry','cherry','yellow'),(30,'isis candy cherry','cherry','red-orange'),(31,'large red cherrry','cherry','red'),(32,'lemon drop','cherry','yellow'),(33,'tommy toe','cherry','red'),(34,'velvet red','cherry','red'),(35,'white cherry','cherry','yellow-white'),(36,'stupice','cocktail','red'),(37,'gold rush','currant','gold'),(38,'sweet pea','currant','red'),(39,'green grape','grape','green'),(40,'principe borghese','grape','red'),(41,'black from tula','heirloom','black'),(42,'black krim','heirloom','black'),(43,'black sea man','heirloom','black'),(44,'cherokee purple','heirloom','purple'),(45,'dester','heirloom','red'),(46,'gold medal','heirloom','gold'),(47,'green zebra','heirloom','green'),(48,'italian heirloom','heirloom','red'),(49,'nyagous','heirloom','brown-red'),(50,'powers heirloom','heirloom','yellow'),(51,'red zebra','heirloom','red-orange'),(52,'austin\'s red','pear','red'),(53,'beam\'s yellow','pear','yellow'),(54,'red fig','pear','red'),(55,'black plum','plum','black'),(57,'riesentraube','plum','red'),(58,'ukranian purple','plum','purple'),(59,'cream sausage','roma','red'),(60,'martino\'s roma','roma','red'),(61,'salvaterra\'s select','roma','red'),(62,'speckled roman','roma','red-orange'),(63,'moonglow','slicer','orange'),(64,'brandywine','slicer','red'),(65,'eva purple ball','slicer','purple'),(66,'japanese trifele black','slicer','black'),(67,'jaune flamme','slicer','red'),(68,'john baer','slicer','red'),(69,'livingston\'s paragon','slicer','red'),(70,'paul robeson','slicer','red'),(71,'siberian','slicer','red'),(72,'trophy','slicer','red'),(73,'tucker\'s favorite pink ','slicer','pink'),(74,'varigated','slicer','various'),(75,'wapsipinicon peach','slicer','yellow'),(76,'white tomesol','slicer','yellow-white'),(78,'red delicious','heirloom','red'),(79,'purple people eater','grape','purple'),(80,'blue boy','grape','purple'),(81,'green man','pear','green'),(83,'red flannel','cherry',''),(84,'crimson flavor','slicer','red');
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

-- Dump completed on 2022-04-19 20:49:29

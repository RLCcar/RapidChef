CREATE DATABASE  IF NOT EXISTS `senf22g7` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `senf22g7`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: dcm.uhcl.edu    Database: senf22g7
-- ------------------------------------------------------
-- Server version	8.0.17

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
  `userID` int(11) NOT NULL,
  `recipeID` int(11) NOT NULL,
  KEY `recipeid1_idx` (`recipeID`),
  KEY `userid_idx` (`userID`),
  CONSTRAINT `recipeid1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredientsID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ingredientsID`,`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'chicken','meat'),(3,'celery','vegetable'),(4,'apple','fruit'),(5,'cucumber','vegetable'),(6,'beef','meat'),(7,'turkey','meat'),(8,'bread','wheat'),(9,'tomato','vegetable'),(10,'cheese','dairy'),(63,'bok choy','vegetable'),(64,'snake beans','vegetable'),(65,'spinach','vegetable'),(66,'tomatoes','vegetable'),(67,'cherry tomatoes','vegetable'),(68,'zucchini','vegetable'),(69,'broccoli','vegetable'),(70,'asparagus','vegetable'),(71,'cucmber','vegetable'),(72,'green bell pepper','vegetable'),(73,'red bell pepper','vegetable'),(74,'squash','vegetable'),(75,'sweet corn','vegetable'),(76,'green onion','vegetable'),(77,'white onion','vegetable'),(78,'sweet onion','vegetable'),(79,'cauliflower','vegetable'),(80,'lettuce','vegetable'),(81,'red onion','vegetable'),(82,'orange bell pepper','vegetable'),(83,'roma tomatoes','vegetable'),(84,'garlic','vegetable'),(85,'jalapeno peppers','vegetable'),(86,'yellow bell pepper','vegetable'),(87,'potato','vegetable'),(88,'watermelon','fruit'),(97,'egg','dairy'),(98,'milk','dairy'),(99,'sour cream','dairy'),(100,'butter','dairy'),(101,'shredded cheese','dairy'),(102,'cream cheese','dairy'),(103,'half & half','dairy'),(104,'heavy whipping cream','dairy'),(105,'cottge cheese','dairy'),(106,'parmesan cheese','dairy'),(107,'whipped cream','dairy'),(108,'creamer','dairy'),(109,'mozzarella cheese','dairy'),(110,'velveeta cheese','dairy'),(111,'chicken breast','meat'),(112,'chicken thigh','meat'),(113,'whole chicken','meat'),(114,'shredded chicken','meat'),(115,'ground chicken','meat'),(130,'mandarin','fruit'),(131,'banana','fruit'),(132,'mango','fruit'),(133,'papaya','fruit'),(134,'kiwi','fruit'),(135,'lemon','fruit'),(136,'lime','fruit'),(137,'orange','fruit'),(138,'pear','fruit'),(139,'pineapple','fruit'),(140,'grapefruit','fruit'),(141,'strawberry','fruit'),(142,'grape','fruit'),(143,'plum','fruit'),(144,'bay leaf','spice'),(145,'basil','spice'),(146,'bergamot','spice'),(147,'black pepper','spice'),(148,'cardamom','spice'),(149,'caynne pepper','spice'),(150,'cumin','spice'),(151,'ginger','spice'),(152,'horseradish','spice'),(153,'lemon balm','spice'),(154,'licorice','spice'),(155,'rosemary','spice'),(156,'sesame','spice'),(157,'tumeric','spice'),(158,'vanilla','spice'),(159,'thyme','spice'),(170,'barely ','grain'),(171,'brown rice','grain'),(172,'bulgur','grain'),(173,'oats','grain'),(174,'pasta','grain'),(175,'rice','grain'),(176,'corn','grain'),(177,'millet','grain'),(178,'wheat','grain'),(179,'farro','grain'),(180,'quinoa','grain'),(181,'olive oil','other'),(182,'flour','other'),(183,'sugar','other'),(184,'Garlic Powder','spice'),(185,'canola oil','other'),(186,'toasted sesame','other'),(187,'balsamic vinegar','other'),(188,'kethcup','other'),(189,'tuna','meat'),(190,'salmon','meat'),(191,'mackrel','meat'),(204,'chicken sausage','meat'),(213,'catfish','meat'),(214,'cod','meat'),(215,'crab','meat'),(216,'halibut','meat'),(217,'lobster','meat'),(218,'oysters','meat'),(219,'shrimp','meat'),(220,'tilapia','meat'),(221,'chicken legs','meat'),(222,'baking powder','other'),(223,'baking soda','other'),(224,'bread crumbs','other'),(225,'condensed milk','other'),(226,'cornmeal','other'),(227,'cornstarch','other'),(228,'frosting','other'),(229,'yeast','other'),(230,'kidney beans','other'),(231,'black beans','other'),(232,'white beans','other'),(233,'garbanzo','other'),(234,'pumpkin','vegetable'),(255,'lentils','other'),(256,'almonds','other'),(257,'peanuts','other'),(258,'walnuts','other'),(259,'salsa','other'),(260,'spagetti sauce','other'),(261,'tortillas','other'),(262,'cereal','other'),(263,'pepper','other'),(264,'popcorn','other'),(265,'okra','vegetable'),(266,'mushrooms','vegetable'),(267,'squalsh','vegetable'),(294,'artichoke','vegetable'),(295,'palm hearts','vegetable'),(296,'aubergene','vegetable'),(297,'cabbage','vegetable'),(298,'chard','vegetable'),(299,'jicama','vegetable'),(300,'leeks','vegetable'),(301,'arugula','vegetable'),(302,'bean sprouts','vegetable'),(303,'snap sugar peas','vegetable'),(304,'snow peas','vegetable'),(305,'butternut squash','vegetable'),(306,'beets','vegetable'),(307,'green beans','vegetable'),(308,'currants','fruit'),(309,'dates','fruit'),(310,'dragon fruit','fruit'),(311,'durian','fruit'),(312,'gooseberry','fruit'),(313,'blood orange','fruit'),(314,'passion fruit','fruit'),(315,'pinapple','fruit'),(316,'apricot','fruit'),(326,'cranberry','fruit'),(327,'figs','fruit'),(328,'honeydew melon','fruit'),(329,'kumquat','fruit'),(330,'guava','fruit'),(331,'nance','fruit'),(332,'jack fruit','fruit'),(333,'jujube','fruit'),(334,'grapes','fruit'),(335,'burrata','dairy'),(336,'mascarpone','dairy'),(337,'halloumi','dairy'),(338,'gruyere','dairy'),(339,'camembert','dairy'),(340,'grana padano','dairy'),(341,'pecorino romano','dairy'),(342,'emmental ','dairy'),(343,'cottage cheese','dairy'),(344,'buttermilk','dairy'),(345,'yogurt','dairy'),(346,'whey','dairy'),(347,'eggnog','dairy'),(362,'udon','grain'),(363,'rye','grain'),(364,'roux','grain'),(365,'wild rice','grain'),(366,'orzo','grain'),(367,'graham','grain'),(368,'couscous','grain'),(369,'polenta','grain'),(370,'muesli','grain'),(371,'seiatn','grain'),(372,'panko','grain'),(373,'corn flakes','grain'),(374,'matzo','grain'),(375,'groats','grain'),(394,'chicken stock','other'),(395,'vegeatble stock','other'),(396,'diced tomatoes','vegetable'),(397,'kosher salt','spice'),(398,'cayenne pepper','spice'),(399,'crushed tomatoes','vegetable'),(400,'oregano','spice'),(401,'parsley','vegeatble'),(402,'long-grain rice','vegetable'),(403,'potatoes','vegetable');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permissionid` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipeID` int(11) NOT NULL AUTO_INCREMENT,
  `recipeName` varchar(45) NOT NULL,
  `postedByuser` int(11) DEFAULT NULL,
  `datePosted` varchar(20) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `directions` varchar(1000) NOT NULL,
  `tag1` int(11) DEFAULT NULL,
  `tag2` int(11) DEFAULT NULL,
  `tag3` int(11) DEFAULT NULL,
  `Ingredient1` varchar(45) NOT NULL,
  `Ingredient2` varchar(45) DEFAULT NULL,
  `Ingredient3` varchar(45) DEFAULT NULL,
  `Ingredient4` varchar(45) DEFAULT NULL,
  `Ingredient5` varchar(45) DEFAULT NULL,
  `Ingredient6` varchar(45) DEFAULT NULL,
  `Ingredient7` varchar(45) DEFAULT NULL,
  `Ingredient8` varchar(45) DEFAULT NULL,
  `Ingredient9` varchar(45) DEFAULT NULL,
  `Ingredient10` varchar(45) DEFAULT NULL,
  `Ingredient11` varchar(45) DEFAULT NULL,
  `Ingredient12` varchar(45) DEFAULT NULL,
  `Ingredient13` varchar(45) DEFAULT NULL,
  `Ingredient14` varchar(45) DEFAULT NULL,
  `Ingredient15` varchar(45) DEFAULT NULL,
  `recipecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recipeID`),
  KEY `tag1` (`tag1`),
  KEY `tag2` (`tag2`),
  KEY `tag3` (`tag3`),
  KEY `user3_idx` (`postedByuser`),
  CONSTRAINT `tag1` FOREIGN KEY (`tag1`) REFERENCES `tag` (`tagID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tag2` FOREIGN KEY (`tag2`) REFERENCES `tag` (`tagID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tag3` FOREIGN KEY (`tag3`) REFERENCES `tag` (`tagID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='					';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (4,'Sandwhich',1003,'2022-10-28','Sandwhiches are always an easy meal to make for quick lunches or when you\'re not feeling as hungry. You can throw in an assortment of different meats, veggies, and condiments, and get a variety of delicous sandwhiches!','Grab two slices of bread. First, spread the condiments on either side of the bread, then lay on the ham and sliced tomatoes.',NULL,NULL,NULL,'bread','tomato','turkey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' '),(16,'Potato Pancakes',888,'2022-11-06','This recipe was generated using AI',' peel and grate potato. melt butter or margarine in frying pan. add grated potato and fry until golden brown on both sides. beat egg and pour over potato mixture. cook until egg is set.',NULL,NULL,NULL,'potato','butter','margarine','eggs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' '),(38,'Cheesy chicken',888,'2022-11-11','This recipe was generated using AI',' heat oven to 400 degrees f. coat chicken with flour. place in 13x9 inch baking dish sprayed with cooking spray. top with velveeta. bake 20 min. or until chicken is done 165 degrees f .',NULL,NULL,NULL,'chicken','cheese','flour',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'Spinach and feta stuffed chicken breasts',888,'2022-11-11','This recipe was generated using AI',' preheat oven to 350 f. place chicken between 2 sheets of plastic wrap and pound to 1/4 inch thickness using a meat mallet or rolling pin. in a small bowl, combine feta and spinach. spread spinach mixture evenly over each chicken breast. roll up and secure with toothpicks. place seam side down in a baking dish. bake for 30 minutes or until chicken is cooked through.',NULL,NULL,NULL,'chicken','feta','spinach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'Cheesy onion chicken',888,'2022-11-13','This recipe was generated using AI',' cut the chicken breast into bite sized pieces. chop the green and white onions. put the chicken in a frying pan with a little bit of olive oil. cook on medium heat. when the chicken is cooked through, add the chopped onions. cook until the onions are soft. add the shredded cheese. stir until the cheese is melted.',NULL,NULL,NULL,'chicken','green onion','white onion','cheese',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'Mandarin chicken salad',888,'2022-11-17','This recipe was generated using AI',' mix all ingredients together. chill. serve on lettuce leaf.',NULL,NULL,NULL,'chicken','tomato','white onion','mandarin','egg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Cream Cheese Frosting',1003,'2011-11-21','Dessert','4 oz Margarine or Butter                 1 lb Powdered sugar       8 oz Cream cheese                        Blend softened cheese and margarine in mixer. Blend and whip in the   sugar. Ready to spread.',1,NULL,NULL,'Butter','Cream cheese',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'Tex-Mex Dip',1002,'2022-11-21','Appetizer','2 T  Lemon juice                        21 oz Bean dip; plain or jalepeno     1/2 t  Salt                                1 c  Green onions; chopped       3 ea Avocadoes, medium size              3 ea Tomatoes; seeded and chopped     1/4 t  Pepper                              7 oz Olives; chopped       1 c  Sour cream                          8 oz Sharp cheddar cheese; grated     1/2 c  Mayonnaise                          1 x  Tortilla chips       1 ea Taco Seasoning Mix packet           Peel, pit and mash avocadoes in medium bowl. Add lemon juice, salt and   pepper. In separate bowl, combine sour cream, mayonnaise, and taco   seasoning. To assemble, spread bean dip on a large, shallow platter.   Top with avocado mixture. Put on sour ccream and taco mixture.    Sprinkle wit chopped onions, tomatoes, and olives.    Cover with shredded cheese.',8,NULL,NULL,'Bean Dip','Lemon juice','Salt','Avocadoes','Pepper','Sour Cream','Mayonnaise','Taco Seasoning','Green Onions','Tomatoes','Olives','Sharp Cheddar Cheese','Tortilla chips','Celery','green pepper',NULL),(51,'Pop-Up Pizza',1003,'2022-11-21','Main dish, Cheese/eggs, Bread','FILLING: 1 1/2 lb Hamburger  1 ds Salt 1 c  Onion; chopped  1/2 c  Water   1 c  Green pepper; chopped 1/8 t  Hot pepper sauce       1 ea Garlic clove 1 pk Spaghetti sauce mix (1.5oz)  1/2 t  Oregano BATTER:        1 c  Milk 2 ea Eggs 1 c  Flour   1/2 t  Salt   1 T  Oil  MISC:  7 oz Jack/Mozz. cheese slices 1/2 c  Parmesan cheese; grated Pre-heat oven to 400f.   *** FILLING ***   In large skillet, brown hamburger and drain. Stir in onion, green   pepper, garlic, oregano, salt, water, hot pepper sauce, tomato sauce   and sauce mix;simmer about 10 min stirring occassionally.   *** BATTER ***   In a bowl, combine milk, oil and eggs; beat 1 min on medium speed. Add   flour and salt; beat 2 min or until smooth.   *** ASSEMBLY *** Pour hot meat mixture into 13x9 pan; top with cheese slices. Pour  batter over cheese, covering filling completely; sprinkle with   parmesan cheese. Bake at 400f for 25-30 min or until puffed and brown.',2,NULL,NULL,'onion','green pepper','garlic clove','oregano','salt','water','flour','spaghetti sauce','milk','oil','hamburger','eggs','pepper sauce','water',NULL,NULL),(53,'Sesame green beans',888,'2022-11-27','This recipe was generated using AI',' wash and trim green beans. place in a large pot and cover with water. add sesame seeds, garlic powder and onion powder. bring to a boil. reduce heat and simmer for 10 minutes or until beans are tender.',NULL,NULL,NULL,'green beans','sesame seeds','garlic','onion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Egg drop soup',888,'2022-11-27','This recipe was generated using AI',' bring chicken stock to a boil. add egg and bread cubes. cook until egg is set.',NULL,NULL,NULL,'chicken','stock','egg','bread',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'Corned beef',888,'2022-11-27','This recipe was generated using AI',' cut corned beef into bite size pieces. place in crock pot. add enough water to cover. cook on low for 6 to 8 hours.',NULL,NULL,NULL,'beef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,' Potato Pancakes',888,'2022-11-27','This recipe was generated using AI',' peel and grate potato. beat egg and add to grated potato. mix well. drop by spoonfuls onto hot greased griddle. brown on both sides.',NULL,NULL,NULL,'egg','potato','','','','','','','','','','','','','',NULL),(58,'Kale Aalad',888,'2022-11-27','This recipe was generated using AI',' wash and dry the kale. shred the carrot and apple. add to the kale. add the bouillon cube. mix well.',NULL,NULL,NULL,'Kale','carrot','apple','chicken','','','','','','','','','','','',NULL),(59,'Corn and Cheese Casserole',888,'2022-11-27','This recipe was generated using AI',' mix corn and cheese together. put in casserole dish. top with mashed potato. bake at 350 for 30 minutes.',NULL,NULL,NULL,'Corn','cheese','potato','','','','','','','','','','','','',NULL),(63,'Chicken and Pasta',888,'2022-11-27','This recipe was generated using AI',' boil chicken until done. cook pasta according to package directions. when chicken is done, remove from bone and cut into bite size pieces. add chicken to pasta. mix well and serve.',NULL,NULL,NULL,'Chicken','Pasta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,' orange chicken',888,'2022-11-27','This recipe was generated using AI',' cut chicken into bite sized pieces. cut broccoli into bite sized pieces. cut orange in half and squeeze juice into a bowl. add olive oil, flour, and sugar to the bowl. mix well. add chicken, broccoli, and orange juice to the bowl. mix well. add shredded cheese. mix well. cover and refrigerate for 30 minutes. preheat oven to 350f. spray a baking dish with cooking spray. pour chicken mixture into baking dish. bake for 30 minutes.',NULL,NULL,NULL,'chicken','breast','broccoli','orange','shredded','cheese','olive','oil','flour','sugar','','','','','',NULL),(75,' horse raddish chicken',888,'2022-11-27','This recipe was generated using AI',' preheat oven to 350 degrees. place chicken in a baking dish. spread horse raddish on top of chicken. bake for 30 minutes.',NULL,NULL,NULL,'chicken breast',' horse raddish',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,' chicken and corn',888,'2022-11-27','This recipe was generated using AI',' preheat oven to 350 degrees. place chicken in a 9x13 baking dish. pour creamed corn over chicken. bake for 30 minutes or until chicken is done.',NULL,NULL,NULL,'Chicken breast',' corn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,' apple and corn salad',888,'2022-11-27','This recipe was generated using AI',' peel and core apple. cut into bite size pieces. add corn and toss.',NULL,NULL,NULL,'Apple',' corn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,' chicken broccoli casserole',888,'2022-11-27','This recipe was generated using AI',' preheat oven to 350f. boil chicken in water until done. remove chicken from water and let cool. shred chicken and set aside. cut broccoli and asparagus into bite sized pieces. peel and slice kiwi. combine chicken, broccoli, asparagus, kiwi, cheese, cream, corn, wheat, caynnne pepper, ginger, and sugar in a large bowl. pour into a 9x13 baking dish. top with bread crumbs. bake for 30 minutes.',NULL,NULL,NULL,'whole chicken',' broccoli',' asparagus',' kiwi',' shredded cheese',' heavy whipping cream',' corn',' wheat',' caynne pepper',' ginger',' sugar',' bread crumbs',' ',' ',' ',NULL),(79,' kiwi chicken pasta',888,'2022-11-27','This recipe was generated using AI',' preheat oven to 350f. cook pasta according to package directions. while pasta is cooking, brown ground chicken in a large skillet over medium high heat. once chicken is browned, drain off any excess fat. chop bell pepper and kiwi into small pieces. add bell pepper, kiwi, and cream to the chicken. stir to combine. add caynne pepper to taste. stir to combine. pour chicken mixture into a 9x13 baking dish. top with bread crumbs. bake for 30 minutes.',NULL,NULL,NULL,'ground chicken',' orange bell pepper',' kiwi',' heavy whipping cream',' pasta',' caynne pepper',' bread crumbs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,' sweet corn pasta',888,'2022-11-27','This recipe was generated using AI',' cook pasta according to package directions. drain and set aside. in a sauce pan, add corn, sugar, cardamom, and caynne pepper. bring to a boil. reduce heat and simmer for 5 minutes. add the cream and bring back to a boil. add the rest of the ingredients and simmer for another 5 minutes. add the pasta and mix well. serve and enjoy',NULL,NULL,NULL,'green bell pepper',' red bell pepper',' sweet corn',' gooseberry',' cranberry',' honeydew melon',' half & half',' heavy whipping cream',' parmesan cheese',' pasta',' corn',' cardamom',' caynne pepper',' sugar',' ',NULL),(81,' lobster and gooseberry pasta',888,'2022-11-27','This recipe was generated using AI',' cook pasta according to package directions. while pasta is cooking, saute garlic in olive oil until fragrant. add tomatoes and gooseberries and cook until tomatoes are soft. add lobster meat and cook until heated through. add burrata and mascarpone and stir to combine. serve over pasta and garnish with bergamot.',NULL,NULL,NULL,'lobster',' roma tomatoes',' garlic',' gooseberry',' burrata',' mascarpone',' pasta',' bergamot',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,' halibut and wild rice casserole',888,'2022-11-27','This recipe was generated using AI',' preheat oven to 350f. cut halibut into cubes and place in a baking dish. bake for 20 minutes. while the halibut is baking, prepare the wild rice according to the directions on the box. when the halibut is done, remove it from the oven and let it cool. while the halibut is cooling, prepare the rest of the ingredients. slice the halloumi into cubes and place in a bowl. add the condensed milk, cumin, licorice, and bread crumbs. mix well. once the halibut has cooled, add it to the bowl with the wild rice. add the green onions, tomatoes, grapefruit, and dragon fruit. mix well. add the whipped cream and mix well. pour the mixture into a casserole dish and bake for 30 minutes.',NULL,NULL,NULL,'halibut',' sweet corn',' green onion',' roma tomatoes',' grapefruit',' dragon fruit',' whipped cream',' halloumi',' wild rice',' graham',' cumin',' licorice',' bread crumbs',' condensed milk',' ',NULL),(83,' ginger chicken with red peppers',888,'2022-11-27','This recipe was generated using AI',' heat a large nonstick skillet over medium high heat. add chicken and cook, turning once, until browned and cooked through, about 5 minutes. transfer chicken to a plate. add bell pepper and ginger to skillet and cook, stirring, until softened, about 3 minutes. add stock and bring to a boil. return chicken to skillet and cook, stirring, until heated through, about 2 minutes.',NULL,NULL,NULL,'chicken breast',' red bell pepper',' ginger',' chicken stock',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,' ginger chicken with red peppers',888,'2022-11-27','This recipe was generated using AI',' heat a large nonstick skillet over medium high heat. add chicken and cook, turning once, until browned and cooked through, about 5 minutes. transfer chicken to a plate. add bell pepper and ginger to skillet and cook, stirring, until softened, about 3 minutes. add stock and bring to a boil. return chicken to skillet and cook, stirring, until heated through, about 2 minutes.',NULL,NULL,NULL,'chicken breast',' red bell pepper',' ginger',' chicken stock',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'Mashed Potatoes',1033,'2022-11-28','Creamy Mashed Potatoes','Peel the potatoes, smashed them, then add milk and butter to taste',2,NULL,NULL,'potatoes','milk','butter',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `recipeID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `stars` int(11) NOT NULL,
  `tagID` int(11) DEFAULT NULL,
  PRIMARY KEY (`recipeID`,`userID`),
  KEY `tagID_idx` (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tagID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Keto','Keto Diet'),(2,'Kids-Friendly','KIDS'),(3,'Under 30 min','On average under 30 minutes'),(4,'Vegetarian','Vegetarian Dish'),(5,'Vegan','Vegan Dish'),(6,'Spicy','Spicy Dish'),(7,'Gluten-Free','Gluten-Free recipe'),(8,'Favorite','Customer Favorite'),(9,'High Rating',NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT 'Active',
  `user_type` varchar(45) NOT NULL DEFAULT 'Registred User',
  `registrationDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `type_idx2` (`user_type`),
  CONSTRAINT `type1` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1034 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (888,'AI','AI','AI@AI.com','123','Active','Registred User','11/6/2022'),(1000,'Sam','Smith','ssmith@yahoo.com','123','Active','Administrator','10/16/2022'),(1001,'Jack','Doe','jdoe@gmail.com','1234','Active','Moderator','10/15/2022'),(1002,'Harry','Potter','hpotter@hogwards.com','123','Active','Registred User','10/14/2022'),(1003,'Shawn','Benoit','benoitsd@gmail.com','1234','Active','Moderator','11/21/2022'),(1005,'Lebron','James','lebronjames@gmail.com','5678','Active','Registred User','11/25/2022'),(1008,'Eric','Thibodeaux','eric@gmail.com','6992','Active','Registred User','11/27/2022'),(1033,'James','Ramsey','jramsey@gmail.com','123','Active','Registred User','11/28/2022');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `typeID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `permissionsDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`typeID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'moderator','Block users'),(2,'administrator','Administative'),(3,'registred user','Add recipies');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'senf22g7'
--

--
-- Dumping routines for database 'senf22g7'
--
/*!50003 DROP PROCEDURE IF EXISTS `user_favorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`senf22g7`@`%` PROCEDURE `user_favorites`(ID int(11))
BEGIN
SELECT * FROM FAVORITES WHERE userID = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 23:40:46

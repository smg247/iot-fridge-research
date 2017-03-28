# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: SmartFridge
# Generation Time: 2017-03-28 00:09:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table GeneralProduct
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GeneralProduct`;

CREATE TABLE `GeneralProduct` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `GeneralProduct` WRITE;
/*!40000 ALTER TABLE `GeneralProduct` DISABLE KEYS */;

INSERT INTO `GeneralProduct` (`id`, `name`)
VALUES
	(1669,'agave nectar'),
	(1778,'almond extract'),
	(685,'american cheese'),
	(1814,'apple'),
	(1796,'avocado'),
	(616,'bacon'),
	(1800,'baking powder'),
	(711,'barbecue sauce'),
	(641,'basil'),
	(695,'basil leaves'),
	(742,'bean sprouts'),
	(728,'beef bones'),
	(1827,'beef bouillon'),
	(628,'beef broth'),
	(729,'beef meat'),
	(1823,'beef roast'),
	(1739,'beef shank'),
	(668,'beef stock'),
	(1694,'black beans'),
	(1715,'black olives'),
	(735,'bowls'),
	(1677,'breadcrumbs'),
	(636,'breakfast sausage'),
	(725,'broth'),
	(713,'buns'),
	(626,'butter'),
	(1745,'cabbage'),
	(1656,'cannellini beans'),
	(1689,'canola oil'),
	(1742,'carrot'),
	(664,'carrots'),
	(1788,'cayenne'),
	(1744,'chayotes'),
	(623,'cheddar cheese'),
	(1731,'chicken breasts'),
	(1684,'chili beans'),
	(1667,'chili powder'),
	(1729,'chipotle paste'),
	(1772,'chocolate'),
	(661,'chuck roast'),
	(1661,'cilantro'),
	(1768,'cinnamon'),
	(1776,'coffee liqueur'),
	(737,'cooked beef'),
	(1706,'coriander'),
	(1727,'corn'),
	(1666,'cotija'),
	(643,'cottage cheese'),
	(1642,'cream'),
	(1662,'cumin'),
	(703,'egg'),
	(1756,'enchilada sauce'),
	(1674,'espresso'),
	(696,'fennel seeds'),
	(733,'fish sauce'),
	(1767,'flour'),
	(618,'garlic'),
	(727,'ginger'),
	(1654,'grated cheese'),
	(1808,'green chiles'),
	(1824,'green chilies'),
	(1787,'ground allspice'),
	(615,'ground beef'),
	(631,'gruyere cheese'),
	(1699,'guacamole'),
	(1773,'half-and-half'),
	(743,'hoisin sauce'),
	(1815,'hot cocoa mix'),
	(1718,'hot sauce'),
	(714,'italian sausage'),
	(718,'italian seasoning'),
	(712,'jalapeno'),
	(1795,'jalapenos'),
	(625,'ketchup'),
	(1676,'kidney beans'),
	(647,'lasagna noodles'),
	(1659,'lemon juice'),
	(1813,'lettuce'),
	(1665,'lime'),
	(621,'mayonnaise'),
	(1755,'mexican cheese blend'),
	(1736,'milk'),
	(739,'mint'),
	(1737,'monterey jack cheese'),
	(720,'mostaciolli'),
	(622,'mozzarella'),
	(633,'mushrooms'),
	(1644,'nutmeg'),
	(662,'olive oil'),
	(617,'onion'),
	(1785,'oregano'),
	(1734,'ounces chorizo sausage'),
	(645,'parmesan cheese'),
	(634,'parsley'),
	(1811,'pepitas'),
	(680,'pepper'),
	(731,'pho spices'),
	(676,'pickle relish'),
	(1716,'pico de gallo'),
	(1725,'pinto beans'),
	(1693,'poblano chiles'),
	(1760,'pork loin'),
	(652,'potato'),
	(1640,'pumpkin'),
	(1703,'quinoa'),
	(1748,'radishes'),
	(1779,'ramekins'),
	(1726,'ranch-style salad dressing'),
	(1708,'refried beans'),
	(1762,'rice'),
	(721,'ricotta cheese'),
	(670,'rosemary'),
	(660,'rye bread'),
	(1680,'salsa'),
	(1660,'salt'),
	(1812,'shrimp'),
	(744,'sriracha hot sauce'),
	(738,'steak'),
	(1781,'stewing beef'),
	(677,'sugar'),
	(1780,'sunflower oil'),
	(659,'swiss cheese'),
	(1643,'syrup'),
	(1709,'tabasco sauce'),
	(1719,'taco seasoning'),
	(669,'thyme'),
	(1688,'tomato'),
	(1794,'tortilla chips'),
	(1771,'vanilla'),
	(672,'vegetable oil'),
	(730,'water'),
	(710,'whiskey'),
	(678,'white vinegar'),
	(630,'wine'),
	(624,'worcestershire sauce'),
	(1765,'yeast'),
	(684,'yellow mustard'),
	(1707,'yogurt');

/*!40000 ALTER TABLE `GeneralProduct` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Ingredient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ingredient`;

CREATE TABLE `Ingredient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) unsigned NOT NULL,
  `recipe` int(11) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `recipe` (`recipe`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`product`) REFERENCES `Product` (`id`),
  CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`recipe`) REFERENCES `Recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;

INSERT INTO `Ingredient` (`id`, `product`, `recipe`, `amount`)
VALUES
	(754,615,63,261),
	(755,616,63,122),
	(756,617,63,415),
	(757,618,63,353),
	(758,1642,63,401),
	(760,621,63,492),
	(761,622,63,80),
	(762,623,63,360),
	(763,624,63,307),
	(764,625,63,60),
	(765,626,64,399),
	(766,617,64,328),
	(767,628,64,54),
	(768,624,64,456),
	(769,630,64,276),
	(770,631,64,370),
	(771,617,64,444),
	(772,633,64,408),
	(773,634,64,274),
	(774,615,65,267),
	(775,636,65,110),
	(776,618,65,96),
	(777,1688,65,167),
	(778,1688,65,110),
	(779,634,65,88),
	(780,641,65,190),
	(781,617,65,400),
	(782,643,65,449),
	(783,703,65,87),
	(784,645,65,397),
	(785,634,65,405),
	(786,617,65,22),
	(787,622,65,37),
	(788,647,65,481),
	(789,617,65,189),
	(790,615,66,471),
	(791,617,66,18),
	(792,1727,66,206),
	(793,652,66,231),
	(794,626,66,487),
	(795,628,66,14),
	(796,624,66,294),
	(797,617,66,463),
	(798,626,67,105),
	(799,617,67,140),
	(800,615,67,40),
	(801,617,67,131),
	(802,624,67,105),
	(803,659,67,136),
	(804,660,67,429),
	(805,661,68,323),
	(806,662,68,277),
	(807,617,68,160),
	(808,664,68,310),
	(810,680,68,418),
	(811,630,68,124),
	(812,668,68,15),
	(813,669,68,478),
	(814,670,68,65),
	(815,661,69,116),
	(816,672,69,476),
	(817,617,69,390),
	(818,617,69,93),
	(819,621,69,128),
	(820,625,69,104),
	(821,676,69,154),
	(822,677,69,418),
	(823,678,69,304),
	(824,713,69,340),
	(825,680,69,297),
	(826,1794,69,156),
	(827,1688,69,467),
	(828,1813,69,417),
	(829,684,69,346),
	(830,685,69,439),
	(831,714,70,461),
	(832,615,70,246),
	(833,617,70,198),
	(834,618,70,338),
	(835,1688,70,147),
	(836,1688,70,377),
	(837,1688,70,101),
	(838,730,70,355),
	(839,677,70,16),
	(840,695,70,204),
	(841,696,70,176),
	(842,718,70,305),
	(844,680,70,59),
	(845,634,70,85),
	(846,647,70,149),
	(847,721,70,172),
	(848,703,70,145),
	(850,622,70,128),
	(851,645,70,421),
	(852,615,71,329),
	(854,626,71,143),
	(855,617,71,211),
	(856,710,71,39),
	(857,711,71,189),
	(858,712,71,393),
	(859,713,71,491),
	(860,662,72,43),
	(861,618,72,347),
	(862,617,72,32),
	(863,714,72,248),
	(864,615,72,74),
	(865,1688,72,376),
	(866,1688,72,15),
	(867,718,72,11),
	(868,680,72,255),
	(869,617,72,122),
	(870,720,72,362),
	(871,721,72,489),
	(872,622,72,367),
	(873,645,72,297),
	(874,703,72,456),
	(875,634,72,263),
	(876,725,73,223),
	(877,617,73,227),
	(878,727,73,45),
	(879,728,73,125),
	(880,729,73,10),
	(881,730,73,299),
	(882,731,73,277),
	(884,733,73,330),
	(885,677,73,300),
	(886,735,73,288),
	(887,1762,73,249),
	(888,737,73,433),
	(889,738,73,213),
	(890,739,73,452),
	(891,1665,73,346),
	(892,680,73,393),
	(893,742,73,474),
	(894,743,73,74),
	(895,744,73,143),
	(902,680,74,110),
	(906,615,74,137),
	(907,617,74,240),
	(918,617,74,20),
	(922,672,75,293),
	(923,617,75,294),
	(927,1688,75,254),
	(929,634,75,160),
	(934,618,75,350),
	(937,662,76,239),
	(939,617,76,87),
	(943,617,76,318),
	(947,730,76,28),
	(953,617,77,60),
	(954,624,77,308),
	(955,730,77,268),
	(959,718,78,423),
	(960,617,78,273),
	(961,730,78,114),
	(962,680,78,274),
	(966,617,78,119),
	(967,618,78,398),
	(971,730,78,446),
	(975,662,79,362),
	(979,617,79,256),
	(980,618,79,219),
	(981,1688,79,418),
	(984,677,79,253),
	(987,634,79,27),
	(994,617,79,22),
	(995,680,80,341),
	(996,1642,80,196),
	(997,615,80,109),
	(1001,713,80,478),
	(1003,1688,80,295),
	(1005,615,81,442),
	(1007,617,81,288),
	(1011,618,81,33),
	(1016,625,81,208),
	(1018,624,81,87),
	(1019,1688,81,432),
	(1023,622,81,198),
	(1027,713,81,287),
	(1030,662,82,471),
	(1038,703,82,106),
	(1040,618,83,308),
	(1041,672,83,471),
	(1043,730,83,493),
	(1045,617,83,257),
	(1046,680,83,31),
	(1047,1688,83,273),
	(1049,677,83,378),
	(1050,617,83,170),
	(1051,615,84,487),
	(1053,730,84,229),
	(1054,1642,84,260),
	(1056,621,84,92),
	(1059,623,84,287),
	(1061,1688,84,469),
	(1065,617,85,26),
	(1066,615,85,459),
	(1068,703,85,149),
	(1070,680,85,443),
	(1072,625,85,178),
	(1073,730,85,165),
	(1074,624,85,427),
	(1077,617,86,52),
	(1078,615,86,65),
	(1082,622,86,169),
	(1083,645,86,372),
	(1085,617,87,497),
	(1086,618,87,343),
	(1087,615,87,198),
	(1089,1688,87,293),
	(1100,680,88,91),
	(1102,662,88,332),
	(1103,617,88,248),
	(1104,618,88,149),
	(1105,615,88,82),
	(1107,1688,88,11),
	(1109,680,88,86),
	(1110,625,88,360),
	(1114,617,89,261),
	(1117,618,89,288),
	(1118,713,89,409),
	(1119,662,89,181),
	(1121,680,89,386),
	(1122,662,90,207),
	(1124,617,90,389),
	(1128,680,90,400),
	(1135,1688,90,255),
	(1140,618,90,354),
	(1143,662,91,477),
	(1144,617,91,202),
	(1145,618,91,201),
	(1152,617,92,342),
	(1156,703,92,199),
	(1157,615,92,336),
	(1158,615,92,355),
	(1160,615,92,467),
	(1161,615,92,495),
	(1162,680,92,92),
	(1172,1642,93,216),
	(1175,626,94,474),
	(1177,617,94,193),
	(1180,618,94,496),
	(1191,677,95,65),
	(1197,617,96,293),
	(1201,662,97,248),
	(1202,626,97,258),
	(1203,680,97,177),
	(1204,680,97,448),
	(1205,617,97,331),
	(1206,618,97,173),
	(1207,1688,97,151),
	(1211,680,97,406),
	(1212,680,97,223),
	(1214,634,97,492),
	(1217,617,98,307),
	(1218,662,98,135),
	(1219,626,98,368),
	(1220,617,98,495),
	(1221,618,98,256),
	(1223,1688,98,438),
	(1224,677,98,231),
	(1225,634,98,397),
	(1226,645,98,294),
	(1230,730,99,130),
	(1233,618,99,489),
	(1234,615,99,292),
	(1236,680,99,377),
	(1240,662,99,434),
	(1243,662,100,380),
	(1246,618,100,438),
	(1248,662,100,227),
	(1249,617,100,84),
	(1250,680,100,85),
	(1251,680,100,49),
	(1252,618,100,422),
	(1253,1688,100,347),
	(1255,1688,100,320),
	(1256,730,100,140),
	(1264,617,100,348),
	(1271,662,101,305),
	(1272,617,101,266),
	(1274,618,101,403),
	(1276,1688,101,203),
	(1279,680,101,347),
	(1280,634,101,203),
	(1281,617,102,243),
	(1290,680,102,461),
	(1292,626,103,267),
	(1293,662,103,467),
	(1299,617,103,209),
	(1300,615,103,451),
	(1311,634,103,397),
	(1313,617,104,24),
	(1317,1688,104,284),
	(1319,1688,104,177),
	(1326,662,105,310),
	(1327,626,105,245),
	(1328,618,105,350),
	(1334,617,105,401),
	(1335,672,106,98),
	(1338,680,106,24),
	(1340,618,106,237),
	(1341,617,106,275),
	(1342,680,106,397),
	(1345,680,107,65),
	(1347,662,107,113),
	(1348,617,107,324),
	(1350,1688,107,332),
	(1361,634,108,223),
	(1367,680,109,366),
	(1376,617,110,219),
	(1377,617,110,165),
	(1379,680,110,226),
	(1380,615,110,184),
	(1381,634,110,123),
	(1382,703,110,428),
	(1384,615,111,309),
	(1386,617,111,28),
	(1389,618,111,17),
	(1390,615,111,78),
	(1392,1688,111,21),
	(1400,615,112,430),
	(1401,617,112,13),
	(1403,618,112,449),
	(1405,615,112,96),
	(1409,713,112,122),
	(1412,617,112,155),
	(1417,617,113,154),
	(1418,626,113,279),
	(1419,662,113,346),
	(1420,618,113,307),
	(1424,1688,113,361),
	(1425,645,113,22),
	(1427,626,114,263),
	(1429,617,114,51),
	(1430,618,114,73),
	(1435,645,114,262),
	(1436,634,114,28),
	(1438,617,115,474),
	(1441,618,115,487),
	(1442,662,115,151),
	(1444,680,115,327),
	(1446,713,115,52),
	(1451,680,116,194),
	(1452,618,116,345),
	(1454,615,116,452),
	(1455,617,116,395),
	(1456,680,116,292),
	(1458,713,116,453),
	(1461,1688,116,43),
	(1473,662,118,491),
	(1477,617,119,302),
	(1478,615,119,53),
	(1481,626,119,283),
	(1482,617,119,339),
	(1483,618,119,54),
	(1486,1688,119,477),
	(1487,677,119,426),
	(1493,680,119,176),
	(1502,617,121,164),
	(1504,680,121,84),
	(1505,680,121,74),
	(1506,680,121,209),
	(1507,618,121,204),
	(1508,617,121,103),
	(1510,680,122,126),
	(1519,617,123,107),
	(1521,617,123,213),
	(1523,1688,123,455),
	(1529,617,124,114),
	(1535,662,125,123),
	(1536,617,125,338),
	(1538,618,125,209),
	(1542,634,125,325),
	(1545,703,125,286),
	(1548,617,126,451),
	(1557,617,127,122),
	(1558,618,127,322),
	(1563,680,127,295),
	(1564,1688,127,421),
	(1575,617,129,323),
	(1577,624,129,213),
	(1584,662,130,20),
	(1586,622,130,233),
	(1587,1688,130,494),
	(1595,677,132,20),
	(1596,677,132,198),
	(1597,703,132,466),
	(1601,617,132,312),
	(1605,677,132,244),
	(1607,677,132,280),
	(1614,622,133,288),
	(1616,645,133,179),
	(1620,703,135,317),
	(1625,713,135,94),
	(1628,621,136,155),
	(1629,618,136,451),
	(1631,662,136,98),
	(1632,680,136,156),
	(1634,617,136,198),
	(1644,677,137,30),
	(1645,677,137,39),
	(1646,703,137,192),
	(1652,677,137,218),
	(1654,677,138,245),
	(1656,703,138,64),
	(1661,677,138,249),
	(1664,677,138,222),
	(1665,713,139,99),
	(1667,622,139,125),
	(1668,621,139,284),
	(1669,617,139,159),
	(1674,617,139,301),
	(1675,617,140,369),
	(1678,680,140,477),
	(1679,680,140,208),
	(1680,677,140,386),
	(1682,626,140,353),
	(1687,621,140,375),
	(1689,677,140,218),
	(1691,680,140,194),
	(1693,618,141,144),
	(1694,621,141,237),
	(1695,680,141,499),
	(1696,617,141,282),
	(1701,680,141,281),
	(1705,672,141,173),
	(1709,615,142,332),
	(1711,618,142,88),
	(1713,680,142,371),
	(1715,662,142,15),
	(1716,617,142,299),
	(1721,703,143,373),
	(1728,703,144,237),
	(1738,1688,145,181),
	(1741,617,145,97),
	(1742,713,145,181),
	(1743,703,146,122),
	(1744,621,146,273),
	(1746,617,146,228),
	(1752,617,146,350),
	(1754,1688,146,351),
	(1770,713,148,117),
	(1773,617,148,309),
	(1774,1688,148,181),
	(1780,626,149,380),
	(1787,1688,151,94),
	(1789,617,151,289),
	(1790,680,151,455),
	(1791,618,151,361),
	(1792,730,151,343),
	(1796,617,151,73),
	(1797,680,151,264),
	(1802,672,151,242),
	(1807,617,152,142),
	(1808,618,152,435),
	(1816,730,153,379),
	(1821,617,153,172),
	(1823,1688,153,75),
	(1829,617,154,34),
	(1833,634,154,365),
	(1841,617,155,179),
	(1850,680,155,157),
	(1852,634,155,358),
	(1855,617,156,485),
	(1857,680,156,58),
	(1858,618,156,44),
	(1860,626,156,396),
	(1866,624,156,483),
	(1870,662,157,259),
	(1871,714,157,251),
	(1872,617,157,136),
	(1875,618,157,327),
	(1876,617,157,182),
	(1877,680,157,418),
	(1880,1688,157,448),
	(1881,730,157,345),
	(1882,680,157,228),
	(1885,662,158,497),
	(1887,617,158,272),
	(1888,618,158,115),
	(1889,615,158,287),
	(1890,615,158,254),
	(1892,680,158,338),
	(1895,662,158,247),
	(1897,615,158,475),
	(1901,730,158,461),
	(1903,662,158,20),
	(1906,634,158,324),
	(1908,1688,159,210),
	(1909,617,159,362),
	(1911,618,159,238),
	(1912,662,159,27),
	(1919,714,160,103),
	(1920,617,160,480),
	(1921,618,160,274),
	(1922,680,160,449),
	(1925,1688,160,106),
	(1926,1688,160,337),
	(1932,645,160,185),
	(1933,622,160,220),
	(1936,617,161,204),
	(1939,680,161,270),
	(1940,618,161,422),
	(1948,624,161,47),
	(1954,617,161,116),
	(1955,677,161,398),
	(1957,730,161,375),
	(1958,730,161,164),
	(1960,677,161,235),
	(1961,703,161,403),
	(1967,617,162,285),
	(1968,615,162,113),
	(1972,713,162,339),
	(1975,662,163,497),
	(1976,617,163,418),
	(1979,615,163,233),
	(1980,615,163,357),
	(1982,1688,163,416),
	(1984,703,163,308),
	(1989,730,164,486),
	(1992,662,165,390),
	(1993,617,165,402),
	(1998,680,165,93),
	(1999,703,165,41),
	(2002,662,165,487),
	(2003,714,166,322),
	(2004,662,166,456),
	(2005,617,166,460),
	(2006,618,166,264),
	(2007,680,166,421),
	(2009,680,166,296),
	(2011,1688,166,425),
	(2016,672,167,61),
	(2017,617,167,155),
	(2019,730,167,269),
	(2022,680,167,149),
	(2026,703,167,113),
	(2027,634,167,352),
	(2029,617,168,404),
	(2039,617,169,411),
	(2041,730,169,296),
	(2044,680,169,227),
	(2045,626,169,234),
	(2050,662,170,54),
	(2056,662,171,489),
	(2058,1688,171,36),
	(2060,713,171,326),
	(2064,703,172,297),
	(2066,730,172,147),
	(2103,1640,179,226),
	(2104,1731,179,391),
	(2105,1642,179,460),
	(2106,1643,179,41),
	(2107,1644,179,447),
	(2108,1660,179,199),
	(2109,1642,179,465),
	(2110,1727,180,491),
	(2111,617,180,111),
	(2112,618,180,119),
	(2113,1662,180,189),
	(2114,1667,180,204),
	(2115,712,180,478),
	(2116,1688,180,377),
	(2117,1694,180,453),
	(2118,1785,180,97),
	(2119,680,180,78),
	(2120,1661,180,270),
	(2121,703,180,395),
	(2122,1654,180,473),
	(2123,1694,181,465),
	(2124,1676,181,445),
	(2125,1656,181,72),
	(2126,680,181,21),
	(2127,680,181,352),
	(2128,1727,181,232),
	(2129,617,181,310),
	(2130,662,181,250),
	(2131,630,181,324),
	(2132,1665,181,483),
	(2133,1659,181,295),
	(2134,677,181,227),
	(2135,1660,181,122),
	(2136,618,181,216),
	(2137,1661,181,176),
	(2138,1662,181,437),
	(2139,680,181,159),
	(2140,680,181,477),
	(2141,1667,181,417),
	(2142,626,182,373),
	(2143,1727,182,287),
	(2144,712,182,138),
	(2145,621,182,141),
	(2146,618,182,403),
	(2147,617,182,367),
	(2148,1661,182,167),
	(2149,1665,182,243),
	(2150,1666,182,249),
	(2151,1667,182,321),
	(2152,1736,183,81),
	(2153,1669,183,189),
	(2154,1772,183,154),
	(2155,1768,183,152),
	(2156,1660,183,194),
	(2157,1642,183,72),
	(2158,1674,183,26),
	(2159,1771,183,127),
	(2160,1676,184,104),
	(2161,1677,184,401),
	(2162,1667,184,72),
	(2163,1706,184,345),
	(2164,703,184,125),
	(2165,1680,184,12),
	(2166,1707,184,493),
	(2167,1665,184,132),
	(2168,713,184,203),
	(2169,615,185,98),
	(2170,1680,185,402),
	(2171,1684,185,293),
	(2172,1794,185,489),
	(2173,1642,185,115),
	(2174,1715,185,240),
	(2175,617,185,116),
	(2176,1688,185,119),
	(2177,623,185,343),
	(2178,1689,186,155),
	(2179,1762,186,466),
	(2180,1731,186,225),
	(2181,634,186,229),
	(2182,1661,186,74),
	(2183,1693,186,407),
	(2184,617,186,289),
	(2185,618,186,380),
	(2186,1660,186,402),
	(2187,672,187,118),
	(2188,652,187,343),
	(2189,680,187,280),
	(2190,672,187,208),
	(2191,615,187,230),
	(2192,1694,187,280),
	(2193,1719,187,155),
	(2194,730,187,455),
	(2195,623,187,440),
	(2196,1813,187,240),
	(2197,1688,187,13),
	(2198,1642,187,325),
	(2199,1699,187,197),
	(2200,662,188,496),
	(2201,617,188,419),
	(2202,680,188,35),
	(2203,1729,188,456),
	(2204,1688,188,465),
	(2205,1731,188,197),
	(2206,1703,188,387),
	(2207,1731,188,113),
	(2208,1725,188,383),
	(2209,1706,188,212),
	(2210,1665,188,149),
	(2211,677,188,256),
	(2212,1707,188,468),
	(2213,1708,189,482),
	(2214,1709,189,164),
	(2215,1824,189,403),
	(2216,1662,189,249),
	(2217,623,189,214),
	(2218,1642,189,326),
	(2219,1699,189,184),
	(2220,1737,189,111),
	(2221,1715,189,14),
	(2222,1716,189,221),
	(2223,662,190,379),
	(2224,661,190,218),
	(2225,1660,190,35),
	(2226,680,190,313),
	(2227,617,190,328),
	(2228,680,190,398),
	(2229,1718,190,378),
	(2230,1719,190,444),
	(2231,1667,190,382),
	(2232,680,190,357),
	(2233,618,190,379),
	(2234,672,191,228),
	(2235,1762,191,66),
	(2236,618,191,316),
	(2237,1662,191,23),
	(2238,617,191,72),
	(2239,1688,191,321),
	(2240,725,191,49),
	(2241,1727,192,32),
	(2242,680,192,10),
	(2243,1725,192,387),
	(2244,1726,192,331),
	(2245,680,192,118),
	(2246,1727,192,25),
	(2247,1688,192,233),
	(2248,616,192,57),
	(2249,623,192,249),
	(2250,617,192,426),
	(2251,672,193,230),
	(2252,617,193,358),
	(2253,618,193,130),
	(2254,677,193,362),
	(2255,1729,193,13),
	(2256,1688,193,348),
	(2257,1731,193,360),
	(2258,617,193,210),
	(2259,1706,193,134),
	(2260,1727,193,323),
	(2261,1734,194,90),
	(2262,1727,194,333),
	(2263,703,194,392),
	(2264,1736,194,34),
	(2265,680,194,435),
	(2266,1660,194,433),
	(2267,1737,194,177),
	(2268,680,194,179),
	(2269,1680,194,210),
	(2270,1739,195,186),
	(2271,672,195,436),
	(2272,1660,195,318),
	(2273,680,195,339),
	(2274,617,195,38),
	(2275,1688,195,79),
	(2276,628,195,276),
	(2277,730,195,132),
	(2278,1742,195,453),
	(2279,1661,195,312),
	(2280,652,195,302),
	(2281,1727,195,430),
	(2282,1744,195,218),
	(2283,1745,195,466),
	(2285,712,195,73),
	(2286,617,195,265),
	(2287,1661,195,167),
	(2288,1665,195,343),
	(2289,1748,195,20),
	(2290,1762,196,306),
	(2291,725,196,475),
	(2292,1688,196,414),
	(2293,617,196,108),
	(2294,618,196,88),
	(2295,626,196,488),
	(2296,1662,196,238),
	(2297,1725,196,403),
	(2298,615,196,448),
	(2299,1680,196,186),
	(2300,1767,196,73),
	(2301,1755,196,53),
	(2302,1756,196,157),
	(2303,1727,196,78),
	(2304,1642,196,139),
	(2305,1661,196,155),
	(2306,661,197,487),
	(2307,1660,197,56),
	(2308,680,197,48),
	(2309,662,197,97),
	(2310,617,197,32),
	(2311,680,197,51),
	(2312,1667,197,115),
	(2313,680,197,149),
	(2314,680,197,385),
	(2315,618,197,488),
	(2316,1760,198,402),
	(2317,1660,198,438),
	(2318,680,198,455),
	(2319,618,198,299),
	(2320,1729,198,487),
	(2321,730,198,120),
	(2322,1762,198,297),
	(2323,1665,198,105),
	(2324,1661,198,405),
	(2325,1765,199,229),
	(2326,730,199,61),
	(2327,1736,199,240),
	(2328,677,199,128),
	(2329,1660,199,318),
	(2330,626,199,244),
	(2331,703,199,138),
	(2332,1767,199,458),
	(2333,1768,199,199),
	(2335,677,199,134),
	(2336,626,199,426),
	(2337,1767,199,117),
	(2338,1768,199,352),
	(2339,1771,199,41),
	(2340,677,200,105),
	(2341,1772,200,276),
	(2342,1773,200,161),
	(2343,1736,200,138),
	(2344,1768,200,307),
	(2345,703,200,12),
	(2346,1776,200,178),
	(2347,1771,200,415),
	(2348,1778,200,241),
	(2349,1779,200,347),
	(2350,1780,201,206),
	(2351,1781,201,374),
	(2352,617,201,187),
	(2353,1729,201,200),
	(2354,618,201,287),
	(2355,727,201,479),
	(2356,1662,201,379),
	(2357,1768,201,367),
	(2358,1767,201,320),
	(2359,668,201,386),
	(2360,1688,201,275),
	(2361,1785,201,167),
	(2362,1676,201,369),
	(2363,617,202,38),
	(2364,618,202,306),
	(2365,725,202,388),
	(2366,1787,202,412),
	(2367,1768,202,224),
	(2368,1785,202,483),
	(2369,1662,202,301),
	(2370,1788,202,205),
	(2371,1661,202,443),
	(2372,1665,202,483),
	(2373,1731,202,490),
	(2374,680,202,47),
	(2375,1665,202,421),
	(2376,1737,202,295),
	(2377,1794,202,255),
	(2378,1795,202,475),
	(2379,1796,202,72),
	(2380,1665,202,166),
	(2381,626,203,235),
	(2382,677,203,41),
	(2383,703,203,366),
	(2384,1642,203,194),
	(2385,680,203,100),
	(2386,1737,203,453),
	(2387,623,203,433),
	(2388,1767,203,342),
	(2389,1727,203,37),
	(2390,1800,203,33),
	(2391,1660,203,189),
	(2392,1731,204,337),
	(2393,1680,204,110),
	(2394,623,204,364),
	(2395,618,204,144),
	(2396,1660,204,378),
	(2397,680,204,394),
	(2398,1662,204,136),
	(2399,1731,205,491),
	(2400,617,205,29),
	(2401,618,205,385),
	(2402,626,205,171),
	(2403,1731,205,399),
	(2404,730,205,118),
	(2405,1662,205,204),
	(2406,1642,205,215),
	(2407,1737,205,144),
	(2408,1642,205,490),
	(2409,1808,205,295),
	(2410,680,205,417),
	(2411,1688,205,257),
	(2412,1661,205,459),
	(2413,1811,206,111),
	(2414,1812,206,128),
	(2415,680,206,109),
	(2416,662,206,226),
	(2417,680,206,189),
	(2418,630,206,424),
	(2419,624,206,78),
	(2420,680,206,497),
	(2421,618,206,106),
	(2422,1813,206,24),
	(2423,1814,206,86),
	(2424,617,206,72),
	(2425,1815,207,90),
	(2426,680,207,138),
	(2427,1768,207,137),
	(2428,1642,207,292),
	(2429,1731,208,247),
	(2430,664,208,25),
	(2431,617,208,64),
	(2432,1660,208,233),
	(2433,1762,208,298),
	(2434,680,208,274),
	(2435,1796,208,405),
	(2436,1661,208,421),
	(2437,1665,208,475),
	(2438,1823,209,315),
	(2439,680,209,378),
	(2440,617,209,77),
	(2441,1824,209,407),
	(2442,1667,209,89),
	(2443,680,209,374),
	(2444,618,209,101),
	(2445,1662,209,144),
	(2446,680,209,417),
	(2447,1827,209,69);

/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL,
  `general_product` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `general_product` (`general_product`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`general_product`) REFERENCES `GeneralProduct` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;

INSERT INTO `Product` (`id`, `name`, `weight`, `general_product`)
VALUES
	(615,'ground beef',904,615),
	(616,'bacon',800,616),
	(617,'onion',999,617),
	(618,'garlic',286,618),
	(621,'mayonnaise',142,621),
	(622,'mozzarella',950,622),
	(623,'cheddar cheese',203,623),
	(624,'worcestershire sauce',934,624),
	(625,'ketchup',537,625),
	(626,'butter',549,626),
	(628,'beef broth',95,628),
	(630,'wine',232,630),
	(631,'gruyere cheese',241,631),
	(633,'mushrooms',677,633),
	(634,'parsley',260,634),
	(636,'breakfast sausage',923,636),
	(641,'basil',745,641),
	(643,'cottage cheese',375,643),
	(645,'parmesan cheese',101,645),
	(647,'lasagna noodles',203,647),
	(652,'potato',286,652),
	(659,'swiss cheese',385,659),
	(660,'rye bread',966,660),
	(661,'chuck roast',668,661),
	(662,'olive oil',496,662),
	(664,'carrots',401,664),
	(668,'beef stock',953,668),
	(669,'thyme',237,669),
	(670,'rosemary',901,670),
	(672,'vegetable oil',437,672),
	(676,'pickle relish',801,676),
	(677,'sugar',52,677),
	(678,'white vinegar',860,678),
	(680,'pepper',293,680),
	(684,'yellow mustard',297,684),
	(685,'american cheese',308,685),
	(695,'basil leaves',820,695),
	(696,'fennel seeds',764,696),
	(703,'egg',437,703),
	(710,'whiskey',435,710),
	(711,'barbecue sauce',629,711),
	(712,'jalapeno',256,712),
	(713,'buns',792,713),
	(714,'italian sausage',175,714),
	(718,'italian seasoning',817,718),
	(720,'mostaciolli',935,720),
	(721,'ricotta cheese',839,721),
	(725,'broth',437,725),
	(727,'ginger',356,727),
	(728,'beef bones',602,728),
	(729,'beef meat',683,729),
	(730,'water',865,730),
	(731,'pho spices',149,731),
	(733,'fish sauce',661,733),
	(735,'bowls',267,735),
	(737,'cooked beef',135,737),
	(738,'steak',523,738),
	(739,'mint',677,739),
	(742,'bean sprouts',740,742),
	(743,'hoisin sauce',872,743),
	(744,'sriracha hot sauce',138,744),
	(1640,'pumpkin',834,1640),
	(1642,'cream',593,1642),
	(1643,'syrup',226,1643),
	(1644,'nutmeg',534,1644),
	(1654,'grated cheese',261,1654),
	(1656,'cannellini beans',887,1656),
	(1659,'lemon juice',643,1659),
	(1660,'salt',193,1660),
	(1661,'cilantro',190,1661),
	(1662,'cumin',923,1662),
	(1665,'lime',216,1665),
	(1666,'cotija',66,1666),
	(1667,'chili powder',841,1667),
	(1669,'agave nectar',602,1669),
	(1674,'espresso',63,1674),
	(1676,'kidney beans',837,1676),
	(1677,'breadcrumbs',907,1677),
	(1680,'salsa',956,1680),
	(1684,'chili beans',330,1684),
	(1688,'tomato',604,1688),
	(1689,'canola oil',405,1689),
	(1693,'poblano chiles',655,1693),
	(1694,'black beans',961,1694),
	(1699,'guacamole',856,1699),
	(1703,'quinoa',139,1703),
	(1706,'coriander',250,1706),
	(1707,'yogurt',243,1707),
	(1708,'refried beans',51,1708),
	(1709,'tabasco sauce',846,1709),
	(1715,'black olives',843,1715),
	(1716,'pico de gallo',541,1716),
	(1718,'hot sauce',479,1718),
	(1719,'taco seasoning',790,1719),
	(1725,'pinto beans',329,1725),
	(1726,'ranch-style salad dressing',395,1726),
	(1727,'corn',543,1727),
	(1729,'chipotle paste',690,1729),
	(1731,'chicken breasts',982,1731),
	(1734,'ounces chorizo sausage',327,1734),
	(1736,'milk',710,1736),
	(1737,'monterey jack cheese',662,1737),
	(1739,'beef shank',946,1739),
	(1742,'carrot',640,1742),
	(1744,'chayotes',216,1744),
	(1745,'cabbage',368,1745),
	(1748,'radishes',516,1748),
	(1755,'mexican cheese blend',579,1755),
	(1756,'enchilada sauce',817,1756),
	(1760,'pork loin',589,1760),
	(1762,'rice',546,1762),
	(1765,'yeast',86,1765),
	(1767,'flour',621,1767),
	(1768,'cinnamon',103,1768),
	(1771,'vanilla',413,1771),
	(1772,'chocolate',802,1772),
	(1773,'half-and-half',877,1773),
	(1776,'coffee liqueur',983,1776),
	(1778,'almond extract',340,1778),
	(1779,'ramekins',532,1779),
	(1780,'sunflower oil',772,1780),
	(1781,'stewing beef',604,1781),
	(1785,'oregano',70,1785),
	(1787,'ground allspice',885,1787),
	(1788,'cayenne',669,1788),
	(1794,'tortilla chips',221,1794),
	(1795,'jalapenos',68,1795),
	(1796,'avocado',401,1796),
	(1800,'baking powder',833,1800),
	(1808,'green chiles',979,1808),
	(1811,'pepitas',548,1811),
	(1812,'shrimp',937,1812),
	(1813,'lettuce',338,1813),
	(1814,'apple',374,1814),
	(1815,'hot cocoa mix',278,1815),
	(1823,'beef roast',981,1823),
	(1824,'green chilies',993,1824),
	(1827,'beef bouillon',132,1827);

/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Recipe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Recipe`;

CREATE TABLE `Recipe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;

INSERT INTO `Recipe` (`id`, `name`)
VALUES
	(163,'A Simple Tomato Soup'),
	(203,'Absolute Mexican Cornbread'),
	(156,'Ale and Cheddar Soup'),
	(194,'Authentic Mexican Breakfast Tacos'),
	(63,'Bacon Double Cheese Burger Dip'),
	(81,'Bacon Double Cheeseburger Soup'),
	(143,'Bacon Jam and Avocado Grilled Cheese Sandwich'),
	(144,'Bacon Jam Breakfast Sandwich with Fried Egg and Avocado'),
	(80,'Bacon Wrapped Jalapeno Popper Burgers'),
	(93,'Bacon Wrapped Jalapeno Popper Stuffed Chicken'),
	(99,'Baked Chicken and Spinach Flautas'),
	(108,'Baked Honey Mustard Chicken'),
	(72,'Baked Ziti'),
	(86,'Baked Ziti I'),
	(91,'Beef Brisket Pot Roast'),
	(82,'Beef Wellington'),
	(161,'Beer Mac n Cheese Soup'),
	(114,'Bowtie Chicken Alfredo'),
	(107,'Braised Balsamic Chicken'),
	(102,'Broccoli Cheese Soup'),
	(111,'Buffalo Chicken Chili'),
	(94,'Buffalo Chicken Chowder'),
	(148,'Buffalo Chicken Club Sandwich'),
	(124,'Buffalo Chicken Grilled Cheese Sandwich'),
	(97,'Cajun Chicken Pasta'),
	(195,'Caldo de Res (Mexican Beef Soup)'),
	(136,'California Grilled Veggie Sandwich'),
	(130,'Caprese Grilled Cheese Sandwich'),
	(158,'carrot soup with tahini and crisped chickpeas'),
	(154,'Cauliflower Soup'),
	(197,'Charley\'s Slow Cooker Mexican Style Meat'),
	(112,'Cheddar Jalapeno Chicken Burgers with Guacamole'),
	(103,'Chicken and Dumplings'),
	(113,'Chicken Florentine Pasta'),
	(167,'chicken noodle soup'),
	(98,'Chicken Parmigiana'),
	(100,'Chicken Tortilla Soup'),
	(105,'Chicken with Mustard Cream Sauce'),
	(132,'Chocolate Chip Cookie Dough Sandwiches'),
	(118,'Classic Baked Chicken'),
	(138,'Classic Victoria sandwich'),
	(153,'Coconut Red Lentil Soup'),
	(199,'Conchas (Mexican Sweet Bread)'),
	(129,'Corned Beef Grilled Cheese Sandwich with Guinness Caramelized Onions'),
	(165,'Creamy asparagus soup with a poached egg on toast'),
	(88,'Dad&#8217;s Stuffed Bell Peppers'),
	(169,'Delicious Ham and Potato Soup'),
	(185,'Easy Mexican Casserole'),
	(66,'Easy Shepherd&#8217;s Pie'),
	(135,'Egg Salad Sandwich (the only one I'),
	(182,'Esquites (Mexican Corn Salad)'),
	(64,'French Onion Soup Stuffed Mushrooms'),
	(141,'Fried Chicken Sandwiches with Slaw and Spicy Mayo'),
	(172,'Ginger Coconut Milk Soup'),
	(145,'Grilled Chicken Club Sandwich with Avocado and Chipotle Caramelized Onions'),
	(127,'Guacamole Grilled Cheese Sandwich'),
	(101,'Home'),
	(110,'Homemade Chicken and Noodles'),
	(139,'Hot Roast Beef Sandwiches'),
	(69,'In-N-Out\'s Double-Double, Animal Style'),
	(78,'Italian Drip Beef'),
	(166,'Italian Sausage Tortellini Soup'),
	(122,'Jalapeno Popper Grilled Cheese Sandwich'),
	(90,'Joolss favourite beef stew'),
	(159,'Kale and Roasted Vegetable Soup'),
	(209,'Kris\' Amazing Shredded Mexican Beef'),
	(160,'Lasagna Soup'),
	(146,'Leftover Easter Sandwich'),
	(157,'lentil soup with sausage, chard and garlic'),
	(180,'Mexican Baked Eggs'),
	(184,'Mexican bean burgers with lime yogurt &amp; salsa'),
	(181,'Mexican Bean Salad'),
	(201,'Mexican beef chilli'),
	(205,'Mexican Chicken Corn Chowder'),
	(208,'Mexican Chicken Soup'),
	(193,'Mexican chicken stew'),
	(188,'Mexican chicken stew with quinoa &amp; beans'),
	(183,'Mexican Chocolate Ice Cream'),
	(192,'Mexican Cornbread Salad'),
	(186,'Mexican Green Rice'),
	(206,'Mexican Grilled Shrimp Caesar Salad'),
	(189,'Mexican Layer Dip'),
	(190,'Mexican Pot Roast'),
	(187,'Mexican Potato Nachos'),
	(191,'Mexican Rice II'),
	(207,'Mexican Spiced Hot Cocoa'),
	(198,'Mexican Style Shredded Pork'),
	(142,'Mini Meatball Sandwiches'),
	(200,'Modern Mexican Chocolate Flan'),
	(125,'Mushroom Grilled Cheese Sandwich (aka The Mushroom Melt)'),
	(133,'Parmesan Crusted Pesto Grilled Cheese Sandwich'),
	(119,'Pastor Ryan’s Chicken Tikka Masala'),
	(196,'Pastor Ryan’s Mexican Lasagna'),
	(67,'Patty Melts'),
	(137,'Peanut Butter Oatmeal Sandwich Cookies'),
	(155,'Perfect Potato Soup'),
	(89,'Perfect roast beef'),
	(115,'Perfect roast chicken'),
	(76,'Pork Roast with Apples and Onions'),
	(140,'Pork Sandwiches with Cilantro-Jalapeno Slaw'),
	(68,'Pot Roast'),
	(168,'Pumpkin and Rice Soup'),
	(179,'Pumpkin Soup'),
	(204,'Quick And Easy Mexican Chicken'),
	(109,'Ranch Style Chicken'),
	(162,'Red Lentil Soup with Lemon'),
	(75,'Red Wine-Braised Short Ribs'),
	(96,'Roast Chicken'),
	(121,'Roast Sticky Chicken Rotisserie Style'),
	(152,'Roasted Cauliflower and Aged White Cheddar Soup'),
	(85,'Salisbury Steak'),
	(74,'Simple, Perfect Enchiladas!'),
	(77,'Slow Cooker Beef Stroganoff'),
	(149,'Slow Cooker Buffalo Chicken Sandwiches'),
	(104,'Slow Cooker Chicken Taco Soup'),
	(151,'Slow Cooker Chicken Tortilla Soup'),
	(83,'Slow Cooker Pepper Steak'),
	(123,'Smashed Chickpea & Avocado Salad Sandwich'),
	(202,'Sopa de lima (Mexican lime soup) recipe'),
	(170,'Spiced carrot &amp; lentil soup'),
	(71,'Spicy Whiskey BBQ Sliders'),
	(79,'Sunday Night Stew'),
	(92,'Swedish Meatballs'),
	(84,'Taco Dip'),
	(87,'Taco Stuffed Shells'),
	(116,'Tequila Lime Grilled Chicken Club Sandwich with Guacamole and Roasted Jalapeno Mayo'),
	(164,'Thai-spiced Pumpkin Soup'),
	(65,'The Best Lasagna Ever'),
	(126,'The Marlboro Man Sandwich'),
	(73,'Vietnamese Pho: Beef Noodle Soup Recipe'),
	(171,'Winter Lentil Soup'),
	(70,'World?s Best Lasagna'),
	(106,'Yummy Honey Chicken Kabobs'),
	(95,'Zesty Slow Cooker Chicken Barbeque');

/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table UserProduct
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserProduct`;

CREATE TABLE `UserProduct` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) unsigned NOT NULL,
  `weight_left` int(11) NOT NULL,
  `x_loc` int(11) NOT NULL,
  `y_loc` int(11) NOT NULL,
  `shelf` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  CONSTRAINT `userproduct_ibfk_1` FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
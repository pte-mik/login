-- 2020-05-15T16:50:45+02:00 - mysql:host=127.0.0.1;dbname=mik-login;port=3306;charset=utf8
SET FOREIGN_KEY_CHECKS = 0;

-- Table structure for table `app`

DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `return` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table `app`

LOCK TABLES `app` WRITE;
INSERT INTO `app` VALUES (1,'wiki','http://{{site}}.wiki.mik.test/auth/{{token}}','Wiki');
INSERT INTO `app` VALUES (2,'subject','http://tanterv.mik.test/auth/{{token}}','Tanterv');
UNLOCK TABLES;

-- Table structure for table `app_permission`

DROP TABLE IF EXISTS `app_permission`;
CREATE TABLE `app_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) DEFAULT NULL,
  `appId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`permission`,`appId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table `app_permission`

LOCK TABLES `app_permission` WRITE;
INSERT INTO `app_permission` VALUES (1,'admin',1);
INSERT INTO `app_permission` VALUES (4,'admin',2);
INSERT INTO `app_permission` VALUES (3,'manager',1);
INSERT INTO `app_permission` VALUES (2,'user',1);
UNLOCK TABLES;

-- Table structure for table `user`

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` char(64) DEFAULT NULL,
  `displayNameHu` varchar(255) DEFAULT NULL,
  `displayNameEn` varchar(255) DEFAULT NULL,
  `neptun` varchar(255) DEFAULT NULL,
  `groups` set('admin','user') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- Dumping data for table `user`

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (14,'Storcz Tamás László','storcz.tamas@gmail.com','sttuaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (15,'Laborci Gergely','gergely.laborci@mik.pte.hu','lagdab.p.jpte','Laborci Gergely','Gergely Laborci',NULL,'admin','$2y$10$7tdLZM0PyNxfS2G8qNGQL.tA7tsLPH/dNs/EN/X16E6L2dTqIotsS');
INSERT INTO `user` VALUES (16,'Iványi Péter','ivanyi.peter@pmmik.pte.hu','ivpoaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (17,'Szentei Balázs','axa@pmmik.pte.hu','szbpaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (18,'Gaszler Balázs','gaszler.balazs@pte.hu','gabeaa.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (27,'Koczka Barna','barna@mik.pte.hu','kobmadp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (28,'Regőczi Péterné','regoczine.ildiko@pmmik.pte.hu','repmaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (29,'Jancskárné Anweiler Ildikó','jancskarne.ildiko@pmmik.pte.hu','jaafacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (30,'Pilgermájer Ákos','pilgermajer@mik.pte.hu','piaaab.t.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (31,'Végh-Dombai Ágnes','agi.dombai@gmail.com','doaiaab.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (32,'Fülöp Attila','afulop.pollack@gmail.com','fuamaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (33,'Gyurcsek István','gyurcsek.istvan@mik.pte.hu','gyivaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (34,'Kukai Annamária','kukai.annamaria@mik.pte.hu','kuaeaa.b.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (35,'Szabó Anita','szabo.anita@pmmik.pte.hu','szawaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (36,'Perjésiné Hámori Ildikó Viktória','perjesi@mik.pte.hu','pehfabp.pte','','','','user',NULL);
INSERT INTO `user` VALUES (37,'Iványi Miklósné','','ivmmaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (38,'Pethőné Vendel Terézia','vendel@mik.pte.hu','pevfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (39,'Megyeri Péter','megyeri@vili.pmmf.hu','mepfabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (40,'Szabó Imre Gábor','szaboig@freemail.hu','szihaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (41,'Pál-Schreiner Judit','judit.schreiner@gmail.com','pasfabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (42,'Szubotics Eszter','eszter.szubotics@aok.pte.hu','szefau.a.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (43,'Regdon Marianna','regdon@mik.pte.hu','remhabf.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (44,'Lehoczky Rózsa','rozsa@mik.pte.hu','lerhaaf.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (45,'Gyurák Gábor','gyurak@mik.pte.hu','gyggaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (46,'Solymár Klára','solymar.klara@pmmik.pte.hu','sokhaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (47,'Ács Anett','acs.anett@pmmik.pte.hu','acaaac.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (48,'Gerzson Miklós','','gemfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (49,'Kocsis Lajos','kocsis@pmmik.pte.hu','kolgagp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (50,'Jászó Andrea','jaszo@pmmik.pte.hu','jaszo','','','','user',NULL);
INSERT INTO `user` VALUES (51,'Várady Géza György','varadi.geza@pte.hu','vagoadp.pte','','','','user',NULL);
INSERT INTO `user` VALUES (52,'Schiffer Ádám','schiffer.adam@mik.pte.hu','scagabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (53,'Perényi László','perenyil@pmmik.pte.hu','pelfabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (54,'Bachmann Erzsébet',NULL,'baepahp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (55,'Vasvári Gyula Ferenc','vasvari.gyula@pte.hu','nd04ke',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (56,'Dinnyés Enikő','edinnyes@hotmail.com','dietaai.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (57,'Molnár Tamás',NULL,'mothabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (58,'Grozdics Anett','','grasabk.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (59,'Hutter Nóra','hutter.nora@pmmik.pte.hu','hunnaaf.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (60,'Dittrich Ernő','dittrich@witch.pmmf.hu','diefab.k.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (61,'Várszegi Péter Gyula','','vapaad.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (62,'Poór Kinga','nyelvvizsgacentrum@witch.pmmf.hu','poork',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (63,'Kittkáné Bódi Katalin','katalin.kittka@aok.pte.hu','kibfab.f.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (64,'Maxim Anita','maxim.anita@pte.hu','maasabt.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (65,'Kollár Tibor','kollar.tibor@pte.hu','kotfabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (66,'Orbán Ferenc','','orffacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (67,'Müller Péter János','muller.peter@mik.pte.hu','mupqaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (68,'Gyöngyösi Tamás','gytamas@witch.pmmf.hu','gytfaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (70,'Kovács-Andor Krisztián','','kokaad.t.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (71,'Rétfalvi Donát','','redaaa.p.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (72,'Heidecker Adél','','heaaab.p.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (73,'Halada Miklós','','hamgaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (74,'Eördöghné Miklós Mária','','eomraap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (75,'Len Adél','len.adel@mik.pte.hu','xfyg6q',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (76,'Csonka Dávid','','i6hiwf',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (77,'Stampfer Mihály','','stmfaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (78,'Danka Sándor','danka.sandor@ktk.pte.hu','dasnaak.pte','','','','user',NULL);
INSERT INTO `user` VALUES (79,'Török Júlia Bernadett','torokj@pmmk.pte.hu','tojfadp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (80,'Szendrői Etelka','','szefaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (81,'Szabó Levente I','137grey@gmail.com','szldaa.t.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (82,'Fülöp László','','fulfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (83,'Tamás Anna Mária','tamasanna108@gmail.com','taafaa.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (84,'Vörös László','','volfadp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (85,'Turi Tamás','','tutgaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (86,'Horváth Magdolna','','homeac.p.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (87,'Tímár András','','tianabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (88,'Novák Péter','novakpetya@yahoo.co.uk','nopgaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (89,'Vér Csaba','ver.csaba@mik.pte.hu','vecfaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (90,'Zoltán Erzsébet Szeréna','','zoeiaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (91,'Schaffer Zsolt','schefister@gmail.com','sczhaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (92,'Csébfalvi Anikó Borbála','csebfalvi@mik.pte.hu','csafaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (93,'Patyi Szabolcs','','pasoaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (94,'Füredi Balázs','','furedib',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (95,'Ferenczy Gábor','','fegdab.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (96,'Kósa Balázs','kosa.balazs@pte.hu','kobiaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (97,'Juhász Miklós','','dufxvs',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (98,'Orbán József','orbanj@pmmk.pte.hu','orjfadp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (99,'Széll Attila','szellmuvek@hotmail.com','szafacp.pte','','','','user','$2y$10$b1xeJriWh0Vcy4LZLUPkYOr3o5i8TpMZh7aZdJFIcUEtQ8b0wbTEu');
INSERT INTO `user` VALUES (100,'Helmich József','helmich@mik.pte.hu','hejfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (101,'Al-Hilal Safáa','alhilal@pmmk.pte.hu','alsfaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (102,'Füzi János','fuzi@szfki.hu','fujsabp.pte','','','','user',NULL);
INSERT INTO `user` VALUES (103,'Zsebe Tamás','zst04@freemail.hu','zstmaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (104,'Pomezanski Vanda Olimpia','vanda@pmmik.pte.hu','povpaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (105,'Fenyvesi Sándor','','fespacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (106,'Meiszterics Zoltán','meiszter@witch.pmmf.hu','mezfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (107,'Sári Zoltán','','sazaab.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (108,'Vizvári Zoltán Ákos','zenel@freemail.hu','viziabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (109,'Meskó András','mesb@minicomp.hu','meafaep.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (110,'Klincsik Mihály','klincsik@pmmk.pte.hu','klmfabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (111,'Varga Andrea','andreia.varga@gmail.com','vaafabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (112,'Györök Tímea','','gytaac.b.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (113,'Nyitray Gergely','nyitray@vili.pmmf.hu','loo5koo','','','','user',NULL);
INSERT INTO `user` VALUES (114,'Baranyai Bálint','baranyaibalint@gmail.com','babtakp.pte','','','','user',NULL);
INSERT INTO `user` VALUES (115,'Pécz Tibor','regruta@gamma.ttk.pte.hu','petbaa.t.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (116,'Elmer György','elmer@vili.pmmf.hu','elgfabp.pte','','','','user',NULL);
INSERT INTO `user` VALUES (117,'Bakai Nándor','bakai.nandi@gmail.com','bansaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (118,'Kárpáti Kinga','','kakmaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (119,'Cs.Nagy Géza','','csnmaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (120,'Vajda József','','vajfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (121,'Orbán Zoltán','','orzfacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (122,'Tamás Katalin','tamaska@witch.pmmf.hu','takfaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (123,'Rák Olivér','','raoraap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (124,'Háber István Ervin','ihaber@mik.pte.hu','haieab.t.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (125,'László István','','laihacp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (126,'Baracsi Viktória','','bavdaa.p.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (127,'Pintér Tamás','','pitoaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (128,'Nyers Árpád','','bmk8mv',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (129,'Szűcs Krisztián','christian.szucs@gmail.com','szkhaep.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (130,'Zilahi Péter','zilahi.peter@gmail.com','zipnaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (131,'Sisa József','','sijtaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (132,'Aradi László','laradi@mik.pte.hu','arlfaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (133,'Bakó Tibor','bakot@witch.pmmf.hu','batoabb.pte','','','','user',NULL);
INSERT INTO `user` VALUES (134,'Mosonyi Dóra','mosonyi.dora@pte.hu','modfaa.b.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (135,'Somfai Réka','rekahei@pmmik.pte.hu','hermaab.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (136,'Bekker Anna','bekkerannabianka@yahoo.com','beagabp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (137,'Etlinger József','','etjgaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (138,'Sztranyák Gergely','gsztranyak@yahoo.de','szghalp.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (139,'Krámli Márta','kramlim@freemail.hu','krmaac.m.jpte','','','','user',NULL);
INSERT INTO `user` VALUES (140,'Martonné Gyurász Zsuzsanna','martonzs@to.pmmf.hu','martonzs','','','ejkgk9','user',NULL);
INSERT INTO `user` VALUES (141,'Gyergyák János','dongianni@freemail.hu','gyjiaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (142,'Zseni Andrea','','zsaaaa.m.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (143,'Budulski László','budulskil@freemail.hu','buloaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (144,'Nagyváradi Anett','nagyvaradi.anett@pte.hu','naamaap.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (145,'Achs Ágnes',NULL,'acafabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (146,'Bagdán Viktor',NULL,'bavmaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (147,'Baumann Mihály',NULL,'bamfaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (148,'Bonnyai Zsolt',NULL,'bozfab.k.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (149,'Borbélyné Regőczi Márta',NULL,'borfabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (150,'Borsos Ágnes',NULL,'boagagp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (151,'Brenner Csaba',NULL,'brciaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (152,'Cakó Balázs',NULL,'cabraap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (153,'Dévényi Sándor',NULL,'dessaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (154,'Dolgosné Kovács Anita',NULL,'koafajp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (155,'Ecsedi Péter',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (156,'Ercsey Zsolt',NULL,'erztaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (157,'Gulyás András',NULL,'guatabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (158,'Harczi Róbert',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (159,'Horváth Ildikó',NULL,'vrhhaae.pte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user` VALUES (160,'Hübner Mátyás',NULL,'humfadp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (161,'Iványi M. Miklós',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (162,'Józsa Vendel',NULL,'jovxaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (163,'Juhász Tamás',NULL,'jutmaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (164,'Katona Tamás János',NULL,'kattae0.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (165,'Kisander Zsolt',NULL,'kizqaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (166,'Zidarics Zoltán',NULL,'zizfabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (167,'Kvasznicza Zoltán',NULL,'kvzfabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (168,'Máthé Kálmán',NULL,'makfadp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (169,'Tukora Balázs',NULL,'tubfabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (170,'Lénárt Anett',NULL,'leahaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (171,'Lindenbach Ágnes',NULL,'liaraap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (172,'László Lenkovics',NULL,'lelgacp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (173,'Kovács Éva',NULL,'koegab.b.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (174,'Polics György',NULL,'pogeaa.p.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (175,'Mészáros Bernadett',NULL,'mebaaa.k.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (176,'Vasváry-Nádor Norbert Balázs',NULL,'vanuaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (177,'Németh Pál',NULL,'nepfabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (178,'Veres Gábor',NULL,'vegdaa.p.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (179,'Medvegy Gabriella',NULL,'megdaa.p.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (180,'Szabó Éva',NULL,'szefafp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (181,'Kiss Tibor',NULL,'kitpaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (182,'Kovács Orsolya',NULL,'koofabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (183,'Kistelegdi István',NULL,'kiimacp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (184,'Kondor Tamás',NULL,'kotaac.p.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (185,'Zoboki Gábor',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (186,'Szűcs István',NULL,'szieac.k.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (188,'Getto Tamás','getnacp.pte',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (189,'Hutter Ákos',NULL,'huaeaa.p.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (190,'Bachmann Bálint',NULL,'babdae.p.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (191,'Kertész András',NULL,'keaxabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (192,'Jancskár Lajos',NULL,'jalhaat.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (193,'Ivelics Ramón',NULL,'ivrtaa0.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (194,'Várhegyi András',NULL,'vaafacp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (195,'Gorjánácz Zorán',NULL,'goztab0.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (196,'Ikotinné Huszár Jolán',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (197,'Hauer János',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (198,'Bagossy László',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (199,'Pintér Szilvia',NULL,'pisiaaa.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (200,'Kosaras Attila',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (201,'Urbán Ernő',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (202,'Balogh István','','baiqaap.pte','','','hvdnwi','user',NULL);
INSERT INTO `user` VALUES (203,'Dormány András','','doauabp.pte','','','d549or','user',NULL);
INSERT INTO `user` VALUES (204,'Juby Marcus Christopher','','jumsabp.pte','','','amoc0u','user',NULL);
INSERT INTO `user` VALUES (205,'Kokas Balázs','','kobhaat.pte','','','m93tpr','user',NULL);
INSERT INTO `user` VALUES (206,'Palkovics Péter','','papwaat.pte','','','hiye20','user',NULL);
INSERT INTO `user` VALUES (207,'Rácz Tamás','','rattaap.pte','','','lrqmfq','user',NULL);
INSERT INTO `user` VALUES (208,'Sárközi Réka','','sarraap.pte','','','fi1dhf','user',NULL);
INSERT INTO `user` VALUES (209,'Udvardi Péter','','udphaaf.pte','','','cs80ka','user',NULL);
INSERT INTO `user` VALUES (210,'Vida Csaba Béla','','vicfabp.pte','','','ukekzz','user',NULL);
INSERT INTO `user` VALUES (211,'Weinreich Zoltán','','wezwaa0.pte','','','whhbyf','user',NULL);
INSERT INTO `user` VALUES (212,'Bognár Adrienn','','boataat.pte','','','cxoh2g','user',NULL);
INSERT INTO `user` VALUES (214,'Kilián Imre Zoltán','','-','','','',NULL,NULL);
INSERT INTO `user` VALUES (215,'Moser Melinda','','momiacb.pte','','','','user',NULL);
INSERT INTO `user` VALUES (216,'Szvitacs István','','sx49g9','','','','user',NULL);
INSERT INTO `user` VALUES (217,'Murai Barbara','murai.barbara@mik.pte.hu','mubtaaf.pte','Murai Barbara','Barbara Murai','ui0igu','user',NULL);
INSERT INTO `user` VALUES (218,'Vörös Erika','voros.erika@mik.pte.hu','voeiaap.pte','','','','user',NULL);
INSERT INTO `user` VALUES (219,'Szegő Dóra','szego.dora@mik.pte.hu','szdract.pte','Szegő Dóra','Dóra Szegő','epkahg','user',NULL);
INSERT INTO `user` VALUES (220,'Petike Petra','petike.petra@mik.pte.hu','petpet','Petike Petra','Petra Petike','py3wvf','user',NULL);
INSERT INTO `user` VALUES (221,'Rinnenbach  Péter','rinnenbach.peter@gmail.com','ripwaap.pte','','','awufnt','user',NULL);
INSERT INTO `user` VALUES (222,'Szajcsán Szabolcs','szaj.szabolcs@gmail.com','q500kx','','','q500kx',NULL,NULL);
INSERT INTO `user` VALUES (223,'Izsák Tamás','izsak.tamas@appworks.hu','','','','yuqtyl',NULL,NULL);
INSERT INTO `user` VALUES (225,'Elter Patrik','elter.patrik@mik.pte.hu','elpwaap.pte','','','',NULL,NULL);
UNLOCK TABLES;

-- Table structure for table `user_copy`

DROP TABLE IF EXISTS `user_copy`;
CREATE TABLE `user_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` char(64) DEFAULT NULL,
  `displayNameHu` varchar(255) DEFAULT NULL,
  `displayNameEn` varchar(255) DEFAULT NULL,
  `neptun` varchar(255) DEFAULT NULL,
  `groups` set('admin','user') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- Dumping data for table `user_copy`

LOCK TABLES `user_copy` WRITE;
INSERT INTO `user_copy` VALUES (14,'Storcz Tamás László','storcz.tamas@gmail.com','STTUAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (15,'Laborci Gergely','gergely.laborci@mik.pte.hu','LAGDAB.P.JPTE','Laborci Gergely','Gergely Laborci',NULL,'admin','$2y$10$7tdLZM0PyNxfS2G8qNGQL.tA7tsLPH/dNs/EN/X16E6L2dTqIotsS');
INSERT INTO `user_copy` VALUES (16,'Iványi Péter','ivanyi.peter@pmmik.pte.hu','IVPOAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (17,'Szentei Balázs','axa@pmmik.pte.hu','SZBPAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (18,'Gaszler Balázs','gaszler.balazs@pte.hu','GABEAA.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (27,'Koczka Barna','barna@mik.pte.hu','KOBMADP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (28,'Regőczi Péterné','regoczine.ildiko@pmmik.pte.hu','REPMAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (29,'Jancskárné Anweiler Ildikó','jancskarne.ildiko@pmmik.pte.hu','JAAFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (30,'Pilgermájer Ákos','pilgermajer@mik.pte.hu','PIAAAB.T.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (31,'Végh-Dombai Ágnes','agi.dombai@gmail.com','DOAIAAB.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (32,'Fülöp Attila','afulop.pollack@gmail.com','FUAMAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (33,'Gyurcsek István','gyurcsek.istvan@mik.pte.hu','GYIVAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (34,'Kukai Annamária','kukai.annamaria@mik.pte.hu','KUAEAA.B.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (35,'Szabó Anita','szabo.anita@pmmik.pte.hu','SZAWAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (36,'Perjésiné Hámori Ildikó Viktória','perjesi@mik.pte.hu','PEHFABP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (37,'Iványi Miklósné','','IVMMAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (38,'Pethőné Vendel Terézia','vendel@mik.pte.hu','PEVFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (39,'Megyeri Péter','megyeri@vili.pmmf.hu','MEPFABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (40,'Szabó Imre Gábor','szaboig@freemail.hu','SZIHAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (41,'Pál-Schreiner Judit','judit.schreiner@gmail.com','PASFABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (42,'Szubotics Eszter','eszter.szubotics@aok.pte.hu','SZEFAU.A.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (43,'Regdon Marianna','regdon@mik.pte.hu','REMHABF.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (44,'Lehoczky Rózsa','rozsa@mik.pte.hu','LERHAAF.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (45,'Gyurák Gábor','gyurak@mik.pte.hu','GYGGAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (46,'Solymár Klára','solymar.klara@pmmik.pte.hu','SOKHAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (47,'Ács Anett','acs.anett@pmmik.pte.hu','ACAAAC.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (48,'Gerzson Miklós','','GEMFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (49,'Kocsis Lajos','kocsis@pmmik.pte.hu','KOLGAGP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (50,'Jászó Andrea','jaszo@pmmik.pte.hu','jaszo','','','','user',NULL);
INSERT INTO `user_copy` VALUES (51,'Várady Géza György','varadi.geza@pte.hu','VAGOADP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (52,'Schiffer Ádám','schiffer.adam@mik.pte.hu','SCAGABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (53,'Perényi László','perenyil@pmmik.pte.hu','PELFABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (54,'Bachmann Erzsébet',NULL,'BAEPAHP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (55,'Vasvári Gyula Ferenc','vasvari.gyula@pte.hu','ND04KE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (56,'Dinnyés Enikő','edinnyes@hotmail.com','DIETAAI.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (57,'Molnár Tamás',NULL,'MOTHABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (58,'Grozdics Anett','','GRASABK.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (59,'Hutter Nóra','hutter.nora@pmmik.pte.hu','HUNNAAF.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (60,'Dittrich Ernő','dittrich@witch.pmmf.hu','DIEFAB.K.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (61,'Várszegi Péter Gyula','','VAPAAD.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (62,'Poór Kinga','nyelvvizsgacentrum@witch.pmmf.hu','POORK',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (63,'Kittkáné Bódi Katalin','katalin.kittka@aok.pte.hu','KIBFAB.F.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (64,'Maxim Anita','maxim.anita@pte.hu','MAASABT.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (65,'Kollár Tibor','kollar.tibor@pte.hu','KOTFABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (66,'Orbán Ferenc','','ORFFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (67,'Müller Péter János','muller.peter@mik.pte.hu','MUPQAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (68,'Gyöngyösi Tamás','gytamas@witch.pmmf.hu','GYTFAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (70,'Kovács-Andor Krisztián','','KOKAAD.T.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (71,'Rétfalvi Donát','','REDAAA.P.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (72,'Heidecker Adél','','HEAAAB.P.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (73,'Halada Miklós','','HAMGAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (74,'Eördöghné Miklós Mária','','EOMRAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (75,'Len Adél','len.adel@mik.pte.hu','XFYG6Q',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (76,'Csonka Dávid','','I6HIWF',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (77,'Stampfer Mihály','','STMFAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (78,'Danka Sándor','danka.sandor@ktk.pte.hu','DASNAAK.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (79,'Török Júlia Bernadett','torokj@pmmk.pte.hu','TOJFADP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (80,'Szendrői Etelka','','SZEFAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (81,'Szabó Levente I','137grey@gmail.com','SZLDAA.T.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (82,'Fülöp László','','FULFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (83,'Tamás Anna Mária','tamasanna108@gmail.com','TAAFAA.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (84,'Vörös László','','VOLFADP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (85,'Turi Tamás','','TUTGAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (86,'Horváth Magdolna','','HOMEAC.P.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (87,'Tímár András','','TIANABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (88,'Novák Péter','novakpetya@yahoo.co.uk','NOPGAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (89,'Vér Csaba','ver.csaba@mik.pte.hu','VECFAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (90,'Zoltán Erzsébet Szeréna','','ZOEIAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (91,'Schaffer Zsolt','schefister@gmail.com','SCZHAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (92,'Csébfalvi Anikó Borbála','csebfalvi@mik.pte.hu','CSAFAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (93,'Patyi Szabolcs','','PASOAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (94,'Füredi Balázs','','FUREDIB',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (95,'Ferenczy Gábor','','FEGDAB.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (96,'Kósa Balázs','kosa.balazs@pte.hu','KOBIAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (97,'Juhász Miklós','','DUFXVS',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (98,'Orbán József','orbanj@pmmk.pte.hu','ORJFADP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (99,'Széll Attila','szellmuvek@hotmail.com','SZAFACP.PTE','','','','user','$2y$10$b1xeJriWh0Vcy4LZLUPkYOr3o5i8TpMZh7aZdJFIcUEtQ8b0wbTEu');
INSERT INTO `user_copy` VALUES (100,'Helmich József','helmich@mik.pte.hu','HEJFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (101,'Al-Hilal Safáa','alhilal@pmmk.pte.hu','ALSFAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (102,'Füzi János','fuzi@szfki.hu','FUJSABP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (103,'Zsebe Tamás','zst04@freemail.hu','ZSTMAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (104,'Pomezanski Vanda Olimpia','vanda@pmmik.pte.hu','POVPAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (105,'Fenyvesi Sándor','','FESPACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (106,'Meiszterics Zoltán','meiszter@witch.pmmf.hu','MEZFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (107,'Sári Zoltán','','SAZAAB.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (108,'Vizvári Zoltán Ákos','zenel@freemail.hu','VIZIABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (109,'Meskó András','MesB@minicomp.hu','MEAFAEP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (110,'Klincsik Mihály','klincsik@pmmk.pte.hu','KLMFABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (111,'Varga Andrea','andreia.varga@gmail.com','VAAFABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (112,'Györök Tímea','','GYTAAC.B.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (113,'Nyitray Gergely','nyitray@vili.pmmf.hu','loo5koo','','','','user',NULL);
INSERT INTO `user_copy` VALUES (114,'Baranyai Bálint','baranyaibalint@gmail.com','BABTAKP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (115,'Pécz Tibor','regruta@gamma.ttk.pte.hu','PETBAA.T.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (116,'Elmer György','elmer@vili.pmmf.hu','ELGFABP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (117,'Bakai Nándor','bakai.nandi@gmail.com','BANSAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (118,'Kárpáti Kinga','','KAKMAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (119,'Cs.Nagy Géza','','CSNMAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (120,'Vajda József','','VAJFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (121,'Orbán Zoltán','','ORZFACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (122,'Tamás Katalin','tamaska@witch.pmmf.hu','TAKFAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (123,'Rák Olivér','','RAORAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (124,'Háber István Ervin','ihaber@mik.pte.hu','HAIEAB.T.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (125,'László István','','LAIHACP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (126,'Baracsi Viktória','','BAVDAA.P.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (127,'Pintér Tamás','','PITOAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (128,'Nyers Árpád','','BMK8MV',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (129,'Szűcs Krisztián','christian.szucs@gmail.com','SZKHAEP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (130,'Zilahi Péter','zilahi.peter@gmail.com','ZIPNAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (131,'Sisa József','','SIJTAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (132,'Aradi László','laradi@mik.pte.hu','ARLFAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (133,'Bakó Tibor','bakot@witch.pmmf.hu','BATOABB.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (134,'Mosonyi Dóra','mosonyi.dora@pte.hu','MODFAA.B.JPTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (135,'Somfai Réka','rekahei@pmmik.pte.hu','HERMAAB.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (136,'Bekker Anna','bekkerannabianka@yahoo.com','BEAGABP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (137,'Etlinger József','','ETJGAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (138,'Sztranyák Gergely','gsztranyak@yahoo.de','SZGHALP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (139,'Krámli Márta','kramlim@freemail.hu','KRMAAC.M.JPTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (140,'Martonné Gyurász Zsuzsanna','martonzs@to.pmmf.hu','martonzs','','','ejkgk9','user',NULL);
INSERT INTO `user_copy` VALUES (141,'Gyergyák János','dongianni@freemail.hu','GYJIAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (142,'Zseni Andrea','','zsaaaa.m.jpte',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (143,'Budulski László','budulskil@freemail.hu','BULOAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (144,'Nagyváradi Anett','nagyvaradi.anett@pte.hu','NAAMAAP.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (145,'Achs Ágnes',NULL,'ACAFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (146,'Bagdán Viktor',NULL,'BAVMAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (147,'Baumann Mihály',NULL,'BAMFAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (148,'Bonnyai Zsolt',NULL,'BOZFAB.K.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (149,'Borbélyné Regőczi Márta',NULL,'BORFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (150,'Borsos Ágnes',NULL,'BOAGAGP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (151,'Brenner Csaba',NULL,'BRCIAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (152,'Cakó Balázs',NULL,'CABRAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (153,'Dévényi Sándor',NULL,'DESSAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (154,'Dolgosné Kovács Anita',NULL,'KOAFAJP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (155,'Ecsedi Péter',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (156,'Ercsey Zsolt',NULL,'ERZTAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (157,'Gulyás András',NULL,'guatabp.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (158,'Harczi Róbert',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (159,'Horváth Ildikó',NULL,'VRHHAAE.PTE',NULL,NULL,NULL,'user',NULL);
INSERT INTO `user_copy` VALUES (160,'Hübner Mátyás',NULL,'HUMFADP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (161,'Iványi M. Miklós',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (162,'Józsa Vendel',NULL,'JOVXAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (163,'Juhász Tamás',NULL,'jutmaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (164,'Katona Tamás János',NULL,'KATTAE0.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (165,'Kisander Zsolt',NULL,'kizqaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (166,'Zidarics Zoltán',NULL,'ZIZFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (167,'Kvasznicza Zoltán',NULL,'KVZFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (168,'Máthé Kálmán',NULL,'MAKFADP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (169,'Tukora Balázs',NULL,'TUBFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (170,'Lénárt Anett',NULL,'LEAHAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (171,'Lindenbach Ágnes',NULL,'LIARAAP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (172,'László Lenkovics',NULL,'LELGACP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (173,'Kovács Éva',NULL,'KOEGAB.B.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (174,'Polics György',NULL,'POGEAA.P.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (175,'Mészáros Bernadett',NULL,'mebaaa.k.jpte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (176,'Vasváry-Nádor Norbert Balázs',NULL,'vanuaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (177,'Németh Pál',NULL,'NEPFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (178,'Veres Gábor',NULL,'VEGDAA.P.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (179,'Medvegy Gabriella',NULL,'MEGDAA.P.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (180,'Szabó Éva',NULL,'SZEFAFP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (181,'Kiss Tibor',NULL,'kitpaap.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (182,'Kovács Orsolya',NULL,'KOOFABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (183,'Kistelegdi István',NULL,'KIIMACP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (184,'Kondor Tamás',NULL,'KOTAAC.P.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (185,'Zoboki Gábor',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (186,'Szűcs István',NULL,'SZIEAC.K.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (188,'Getto Tamás','GETNACP.PTE',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (189,'Hutter Ákos',NULL,'HUAEAA.P.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (190,'Bachmann Bálint',NULL,'BABDAE.P.JPTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (191,'Kertész András',NULL,'KEAXABP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (192,'Jancskár Lajos',NULL,'JALHAAT.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (193,'Ivelics Ramón',NULL,'ivrtaa0.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (194,'Várhegyi András',NULL,'VAAFACP.PTE',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (195,'Gorjánácz Zorán',NULL,'goztab0.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (196,'Ikotinné Huszár Jolán',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (197,'Hauer János',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (198,'Bagossy László',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (199,'Pintér Szilvia',NULL,'pisiaaa.pte',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (200,'Kosaras Attila',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (201,'Urbán Ernő',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_copy` VALUES (202,'Balogh István','','BAIQAAP.PTE','','','HVDNWI','user',NULL);
INSERT INTO `user_copy` VALUES (203,'Dormány András','','DOAUABP.PTE','','','D549OR','user',NULL);
INSERT INTO `user_copy` VALUES (204,'Juby Marcus Christopher','','JUMSABP.PTE','','','AMOC0U','user',NULL);
INSERT INTO `user_copy` VALUES (205,'Kokas Balázs','','KOBHAAT.PTE','','','M93TPR','user',NULL);
INSERT INTO `user_copy` VALUES (206,'Palkovics Péter','','PAPWAAT.PTE','','','HIYE20','user',NULL);
INSERT INTO `user_copy` VALUES (207,'Rácz Tamás','','RATTAAP.PTE','','','LRQMFQ','user',NULL);
INSERT INTO `user_copy` VALUES (208,'Sárközi Réka','','SARRAAP.PTE','','','FI1DHF','user',NULL);
INSERT INTO `user_copy` VALUES (209,'Udvardi Péter','','UDPHAAF.PTE','','','CS80KA','user',NULL);
INSERT INTO `user_copy` VALUES (210,'Vida Csaba Béla','','VICFABP.PTE','','','UKEKZZ','user',NULL);
INSERT INTO `user_copy` VALUES (211,'Weinreich Zoltán','','WEZWAA0.PTE','','','WHHBYF','user',NULL);
INSERT INTO `user_copy` VALUES (212,'Bognár Adrienn','','boataat.pte','','','CXOH2G','user',NULL);
INSERT INTO `user_copy` VALUES (214,'Kilián Imre Zoltán','','-','','','',NULL,NULL);
INSERT INTO `user_copy` VALUES (215,'Moser Melinda','','MOMIACB.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (216,'Szvitacs István','','SX49G9','','','','user',NULL);
INSERT INTO `user_copy` VALUES (217,'Murai Barbara','murai.barbara@mik.pte.hu','mubtaaf.pte','Murai Barbara','Barbara Murai','ui0igu','user',NULL);
INSERT INTO `user_copy` VALUES (218,'Vörös Erika','voros.erika@mik.pte.hu','VOEIAAP.PTE','','','','user',NULL);
INSERT INTO `user_copy` VALUES (219,'Szegő Dóra','szego.dora@mik.pte.hu','szdract.pte','Szegő Dóra','Dóra Szegő','epkahg','user',NULL);
INSERT INTO `user_copy` VALUES (220,'Petike Petra','petike.petra@mik.pte.hu','petpet','Petike Petra','Petra Petike','PY3WVF','user',NULL);
INSERT INTO `user_copy` VALUES (221,'Rinnenbach  Péter','rinnenbach.peter@gmail.com','ripwaap.pte','','','awufnt','user',NULL);
INSERT INTO `user_copy` VALUES (222,'Szajcsán Szabolcs','szaj.szabolcs@gmail.com','q500kx','','','q500kx',NULL,NULL);
INSERT INTO `user_copy` VALUES (223,'Izsák Tamás','izsak.tamas@appworks.hu','','','','YUQTYL',NULL,NULL);
INSERT INTO `user_copy` VALUES (225,'Elter Patrik','elter.patrik@mik.pte.hu','ELPWAAP.PTE','','','',NULL,NULL);
UNLOCK TABLES;

-- Table structure for table `user_permission`

DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `permissionId` int(11) unsigned DEFAULT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  UNIQUE KEY `permissionId` (`permissionId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table `user_permission`

LOCK TABLES `user_permission` WRITE;
INSERT INTO `user_permission` VALUES (1,15);
INSERT INTO `user_permission` VALUES (2,15);
INSERT INTO `user_permission` VALUES (3,15);
INSERT INTO `user_permission` VALUES (4,15);
UNLOCK TABLES;

-- Structure for view `permission`

DROP VIEW IF EXISTS `permission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `permission` AS select 1 AS `id`,`user_permission`.`userId` AS `userId`,`user_permission`.`permissionId` AS `permissionId`,`app_permission`.`appId` AS `appId`,`app_permission`.`permission` AS `permission`,`app`.`name` AS `app` from ((`user_permission` join `app_permission` on((`user_permission`.`permissionId` = `app_permission`.`id`))) join `app` on((`app_permission`.`appId` = `app`.`id`)));
SET FOREIGN_KEY_CHECKS = 1;

-- Completed on: 2020-05-15T16:50:45+02:00

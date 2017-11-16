START TRANSACTION;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP DATABASE IF EXISTS `blog`;
CREATE DATABASE `blog` DEFAULT CHARSET UTF8;
USE `blog`;

/**************************
 -- Deletions of tables
**************************/
DROP TABLE IF EXISTS `articles`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `tags`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `comments`;

/**************************
 -- Generate tables
**************************/
CREATE TABLE IF NOT EXISTS `articles`
(
  `idArticle` INT UNSIGNED AUTO_INCREMENT,
  `titleArticle` VARCHAR(300),
  `contentArticle` LONGTEXT,
  `createdDateArticle` DATETIME,
  `publishDateArticle` DATETIME,
  `updateDateArticle` DATETIME,
  `statusArticle` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `user_id` INT UNSIGNED,
  `category_id` INT UNSIGNED,
  PRIMARY KEY (`idArticle`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `users`
(
  `idUser` INT UNSIGNED AUTO_INCREMENT,
  `firstnameUser` VARCHAR(100) NOT NULL,
  `lastnameUser` VARCHAR(100) NOT NULL,
  `mailUser` VARCHAR(255) NOT NULL,
  `passwordUser` VARCHAR(32) NOT NULL,
  `statusUser` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY (`mailUser`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tags`
(
  `idTag` INT UNSIGNED AUTO_INCREMENT,
  `labelTag` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idTag`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `categories`
(
  `idCategory` INT UNSIGNED AUTO_INCREMENT,
  `labelCategory` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCategory`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `comments`
(
  `idComment` INT UNSIGNED AUTO_INCREMENT,
  `mailComment` VARCHAR(255) NOT NULL,
  `contentComment` LONGTEXT NOT NULL,
  `createdDateComment` DATETIME,
  `publishedDateComment` DATETIME,
  `statusComment` TINYINT NOT NULL DEFAULT 0,
  `article_id` INT UNSIGNED,
  PRIMARY KEY (`idComment`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tags_has_articles`
(
  `tags_idTag` INT UNSIGNED,
  `articles_idArticle` INT UNSIGNED,
  PRIMARY KEY (`tags_idTag`, `articles_idArticle`)
)ENGINE=InnoDB;

/**************************
 -- Foreign keys
**************************/
ALTER TABLE `comments` ADD CONSTRAINT `FK_CommentsArticles` FOREIGN KEY (`article_id`) REFERENCES `articles` (`idArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `articles` ADD CONSTRAINT `FK_ArticlesUsers` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `articles` ADD CONSTRAINT `FK_ArticlesCategories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tags_has_articles` ADD CONSTRAINT `FK_tagsArticles_Articles` FOREIGN KEY (`articles_idArticle`) REFERENCES `articles` (`idArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `tags_has_articles` ADD CONSTRAINT `FK_tagsArticles_Tags` FOREIGN KEY (`tags_idTag`) REFERENCES `tags` (`idTag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/**************************
 -- Filling tables
 -- https://www.mockaroo.com/
 -- http://www.generatedata.com/
**************************/
INSERT INTO `users` (`idUser`,`firstnameUser`,`lastnameUser`,`mailUser`,`passwordUser`,`statusUser`) VALUES
  (NULL,'Daniel','Leclerc','et.madis@malesuadafamesac.ca','1487D3B2A201A816129606EFFCA83ECA',0),
  (NULL,'Ivan','Blanchard','purus.mauris.a@eusem.net','D6B84558748E98154E9D4EF1676667EF',1),
  (NULL,'Octavia','Morel','augue.eu.tellus@idblanditat.co.uk','3A335E5CE85DDB7AC5FA5649E2B82F84',0),
  (NULL,'Benjamin','Girard','erat.semper@lacus.edu','758613FBD069837D1F74374EF6CE87FB',0),
  (NULL,'Lucian','Bernard','dolor@Fusce.org','EDFA5C890639B152F37195170BD9D6D5',1),
  (NULL,'Austin','Girard','et.lacinia@erosnectellus.co.uk','6591175E169261B3B388E9B59B2106C8',0),
  (NULL,'Ebony','Guyot','arcu.Sed@risus.ca','3CEA950776B1B4CF3D2447C4B79A08CB',1),
  (NULL,'Cruz','Aubert','aliquam@amet.org','430C645C6887C0D2DAD2A73A496BC9C1',1),
  (NULL,'Illana','Millet','eget.nisi@Duissitamet.co.uk','627A50E1B4772B5FE8724FC5041E9108',1),
  (NULL,'Julian','Girard','vestibulum.nec@pedemada.org','375CE64F8E13B274634EF4E2E879B6C9',0),
  (NULL,'Lila','Schmitt','in.hendrerit.consectetuer@Vivamuseuismod.edu','0371B1634DE0A8B39BEA9D3169956A62',0),
  (NULL,'Lane','Guillaume','Quisque@Quisque.co.uk','BDE349992ED7165671A65F5431DAA144',0),
  (NULL,'Clementine','Deschamps','et.risus@sit.net','9D46DBABB21278526F46504A8AC0BFA0',0),
  (NULL,'Nola','Boulanger','est@nonsapien.org','8CD1CA015B928B3D0A41D46D76909E36',0),
  (NULL,'Wing','Menard','mauris.sit.amet@egestas.edu','018EBC38602ACFCB953F5AB79C18B6DA',1),
  (NULL,'Nadine','Huet','ornare.elit.elit@Phasellusdapibusquam.co.uk','1445C564244B6C085B474CDA9186A0F1',1),
  (NULL,'Zelda','Gonzalez','quis.accumsan@euismod.net','7F7549512B5B6CF137D4CF443ED9EF76',1),
  (NULL,'Hedda','Laurent','nunc.ullamcorper@cursusetmagna.co.uk','518107AD76C19625C0482D2DCE815F99',1),
  (NULL,'Cody','Petit','facilisis.lorem@AeneanmassaInteger.ca','A025AF41AFB7FA15B6B64C3902DCF2F8',0),
  (NULL,'Quamar','Girard','Aenean.massa.Integer@molestieorci.ca','EFC9AFB43B26F758842368F57C9E68BF',1),
  (NULL,'Mannix','Berger','adipiscing.Mauris.molestie@Vivamusnibhdolor.ca','1D54305ED13FC3600398F6D16EF1F895',0),
  (NULL,'Emi','Carpentier','Nunc@eget.edu','2792A4A9280C769D5603C551573F8B40',1),
  (NULL,'Mona','Meunier','Ut.nec@fringillaeuismodenim.edu','A9CA6D22AECC1C0C426651A886426AE5',0),
  (NULL,'Tallulah','Nguyen','convallis.erat@aliquameu.net','9B914E7B8903444D0418F01CA22B9FC1',1),
  (NULL,'Tallulah','Guillot','nunc@eratnonummyultricies.net','4C9DEECF1976FC03B75EA32E680EBB7B',1),
  (NULL,'Anastasia','Noel','lacus.Quisque@auguescelerisquemollis.edu','8D98B1A56DEB7833DA26D4800170D508',0),
  (NULL,'Amela','Moreau','mauris@cursusnonegestas.co.uk','86AD1F184E929B72B99ED95A03E280AC',0),
  (NULL,'Prescott','Faure','Nulla.temue@mauris.edu','873559C344C81093BB0BA22241F56E2B',1),
  (NULL,'Garth','Clement','tristique.neque.venenatis@Morbi.edu','3B72917A258C06DCCA8DE77E2F82874D',0),
  (NULL,'Brandon','Huet','vel.faucibus.id@amet.ca','03A94B65546CD7DE09714AA4A2EFEC6C',1),
  (NULL,'Philip','Marechal','interdum.Nunc@Suspendissealiquetsem.co.uk','917D80C16E4830DDF00BDA1904C13650',1),
  (NULL,'Addison','Nicolas','eu@temporeratneque.edu','30A81CB1F6D56F5251D407D4867A9ED0',0),
  (NULL,'Abbot','Rolland','lorem.auctor.quis@Donectempor.co.uk','51A11F0AFBCCDF14A5334BDE183B86AD',1),
  (NULL,'Ivan','Carpentier','senectus.et@velit.co.uk','0AE2C670F4EFB2052CB4947C7208AE9D',1),
  (NULL,'Medge','Roussel','interdum.feugiat.Sed@dolorQuisquetincidunt.co.uk','1AF7A4334A0541BABE4887F21613ADB9',0),
  (NULL,'Indigo','Fleury','ornare.elit.elit@tinciduntpede.org','FF5829598F09B899AF7B2E1BE89ADA64',0),
  (NULL,'Colette','Fournier','malesuada@felisorciadipiscing.com','FD9252A0808C3DA64B1BCE38CE390675',1),
  (NULL,'Dieter','Duval','ligula@eratnonummy.com','22A6AA1DA2BAD01D9C8A08E6ABB7465A',1),
  (NULL,'Colt','Masson','ipsum@Maecenas.ca','851DFAEFF7901A5D04EB76F74EAD2D48',1),
  (NULL,'Sawyer','Royer','molestie.tortor@risusquis.ca','A8861B9DD6721B062109B586C4BD9E8A',0),
  (NULL,'Astra','Collet','sagittis@augueutlacus.co.uk','D4E0378FF8F9F85131420CE2D611E88B',0),
  (NULL,'Wyatt','Durand','tortor.Nunc@seddictumeleifend.co.uk','DC97CDF53956ADEE77A58E5B7F5ACE3C',0),
  (NULL,'Veronica','Henry','Proin@mattis.co.uk','F9F7D996D4FD07FDA58EE7961131C06D',1),
  (NULL,'Hector','Marchand','arcu.Curabitur.ut@urnaetarcu.org','86AA96568111F01C334A9A9CE779D804',0),
  (NULL,'Nero','Robin','fames@quamCurabiturvel.ca','C4775697183F7E9629F9FD6512D4BFAA',0),
  (NULL,'Katelyn','Chevalier','convallis@ut.net','28A7EC2466C30D5C3ADC6F67EDE3446A',0),
  (NULL,'May','Germain','nunc.sed.libero@velpedeblandit.com','49184F9BFFE2C996933E04988B12DDF2',0),
  (NULL,'Conan','Renard','Cras.dolor.dolor@ligula.com','FF01FD8D205FDC77BE3C3ACC33BC419C',0),
  (NULL,'Tatum','Carpentier','sem@interdumfeugiatSed.org','6581CC6256DA177DAC62CF0F2E264206',0),
  (NULL,'Melissa','Leveque','amet.luctus.vulputate@enim.net','AFFA4B499197AA36DB3B899AC7BEA6AC',1);

INSERT INTO `categories` (`idCategory`, `labelCategory`) values
  (NULL, 'Tools'),
  (NULL, 'Cooking'),
  (NULL, 'Games'),
  (NULL, 'Astronomy'),
  (NULL, 'Computers'),
  (NULL, 'Movies'),
  (NULL, 'Clothing'),
  (NULL, 'Garden'),
  (NULL, 'Sports'),
  (NULL, 'Photography'),
  (NULL, 'Toys'),
  (NULL, 'Fishing'),
  (NULL, 'Movies'),
  (NULL, 'Fashion'),
  (NULL, 'Automotive'),
  (NULL, 'Toys'),
  (NULL, 'Outdoors'),
  (NULL, 'Electronics'),
  (NULL, 'Jewelery'),
  (NULL, 'Garden');

INSERT INTO `articles` (`idArticle`,`titleArticle`,`contentArticle`,`createdDateArticle`,`publishDateArticle`,`updateDateArticle`,`statusArticle`,`user_id`,`category_id`) VALUES
  (NULL,'Donec tempor, est ac mattis','nulla magna, malesuada vel, convallis in, cursus et, eros.','2015-09-20 09:57:22','2013-01-14 11:07:20','2005-10-11 04:11:28',0,40,20),
  (NULL,'laoreet,','eget, dictum placerat, augue. Sed molestie. Sed id','2014-11-25 22:08:30','2008-09-11 16:52:35','2016-09-23 19:26:28',0,6,10),
  (NULL,'tempus non, lacinia at, iaculis quis, pede. Praesent eu dui.','libero. Proin sed turpis nec','2007-08-11 04:27:59','2006-09-24 17:34:27','2008-12-24 18:15:36',1,50,10),
  (NULL,'Phasellus elit pede, malesuada vel, venenatis vel, faucibus','adipiscing','2002-10-09 00:41:12','2014-11-13 15:29:27','2009-03-15 15:12:44',1,38,11),
  (NULL,'malesuada. Integer id magna et ipsum','fermentum arcu. Vestibulum ante ipsum primis','2007-12-04 03:58:55','2005-03-05 10:07:49','2010-01-20 14:13:45',1,48,12),
  (NULL,'semper erat, in consectetuer','ligula. Aenean euismod mauris eu','2010-04-09 10:28:39','2004-08-11 00:29:19','2016-07-03 21:47:37',0,17,9),
  (NULL,'sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero','interdum. Curabitur dictum.','2002-01-27 16:35:26','2016-09-15 14:06:37','2006-08-07 23:21:45',1,47,17),
  (NULL,'est. Nunc ullamcorper, velit in aliquet','ac','2002-01-05 13:36:26','2015-04-09 04:47:55','2015-07-16 18:53:09',1,14,13),
  (NULL,'mollis. Duis sit amet diam eu dolor','Proin nisl sem, consequat nec, mollis vitae, posuere at,','2004-06-23 04:46:30','2005-08-06 14:13:22','2004-03-25 22:42:53',0,29,18),
  (NULL,'netus','dis','2006-05-06 15:33:04','2006-08-18 05:23:36','2012-04-18 01:23:22',0,48,14),
  (NULL,'Donec at arcu. Vestibulum ante ipsum primis in faucibus','id nunc interdum feugiat.','2003-10-17 17:53:55','2011-08-23 18:32:45','2006-11-15 08:11:11',0,29,12),
  (NULL,'Nunc mauris. Morbi non sapien','turpis. Nulla aliquet. Proin velit. Sed malesuada','2002-10-03 05:15:56','2011-12-11 08:22:27','2013-03-01 21:35:43',0,28,15),
  (NULL,'magna a tortor. Nunc','tempor','2001-03-29 20:17:34','2009-03-25 20:27:24','2011-08-02 05:33:38',1,15,6),
  (NULL,'ultricies','morbi tristique senectus et netus et malesuada','2012-08-30 02:06:25','2007-02-23 21:44:09','2009-07-14 02:03:21',0,42,7),
  (NULL,'adipiscing, enim mi tempor lorem,','lorem fringilla ornare placerat, orci lacus vestibulum lorem,','2006-12-01 09:50:21','2001-11-21 10:20:55','2016-03-25 18:13:26',0,12,10),
  (NULL,'Duis gravida. Praesent eu nulla','et nunc. Quisque ornare tortor at risus. Nunc ac','2008-03-16 09:17:03','2014-04-27 22:05:32','2008-12-09 16:48:48',0,48,14),
  (NULL,'Sed diam lorem, auctor quis, tristique ac, eleifend vitae,','rhoncus id, mollis nec,','2004-08-30 16:31:25','2009-09-28 18:54:57','2007-10-20 18:26:05',1,29,10),
  (NULL,'per','est','2016-12-02 19:51:11','2016-12-28 06:24:14','2003-06-19 10:47:36',0,10,7),
  (NULL,'ipsum ac mi eleifend egestas. Sed pharetra, felis eget','lectus quis massa. Mauris vestibulum, neque sed dictum','2010-08-21 23:21:25','2004-10-20 05:46:02','2013-04-09 22:01:22',1,10,12),
  (NULL,'sem molestie sodales. Mauris','natoque penatibus et magnis','2006-09-17 12:31:06','2002-10-13 14:51:55','2004-03-03 11:04:41',0,43,4),
  (NULL,'Aenean eget magna. Suspendisse tristique neque','eleifend non, dapibus rutrum, justo.','2006-03-01 12:19:01','2008-04-07 19:46:09','2015-06-16 04:16:49',1,19,5),
  (NULL,'massa rutrum magna.','habitant morbi tristique senectus et','2016-05-21 08:55:32','2016-12-15 04:29:16','2015-03-09 16:18:39',0,42,19),
  (NULL,'erat','Morbi non sapien molestie','2016-04-01 03:24:40','2004-01-18 23:25:17','2014-02-21 00:24:02',0,13,16),
  (NULL,'at','sit amet ornare lectus justo eu','2009-05-29 05:40:15','2005-06-11 05:32:54','2002-10-08 02:32:01',0,2,11),
  (NULL,'nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,','in, dolor.','2013-08-02 04:46:15','2017-05-14 18:07:40','2011-07-03 00:25:13',0,13,11),
  (NULL,'vel est tempor bibendum.','ut erat. Sed nunc est, mollis','2010-01-16 03:06:37','2010-04-29 04:53:36','2002-10-07 23:36:33',0,25,12),
  (NULL,'at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem','Quisque imperdiet,','2009-06-28 12:53:18','2014-10-12 14:11:39','2017-08-30 22:22:38',1,23,4),
  (NULL,'aliquam eros turpis non enim. Mauris quis turpis vitae','In ornare sagittis','2006-11-02 03:21:48','2003-02-20 08:53:34','2006-03-06 06:43:02',0,11,12),
  (NULL,'ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor','ut eros non enim commodo hendrerit. Donec','2017-07-09 14:28:39','2015-12-16 20:00:45','2006-02-15 08:43:35',0,5,2),
  (NULL,'posuere, enim nisl elementum purus,','lacus. Quisque','2010-08-18 01:58:30','2005-03-17 06:57:55','2012-05-14 14:02:00',1,24,16),
  (NULL,'vehicula risus.','nunc risus varius orci,','2014-08-01 11:40:09','2003-03-06 10:53:49','2007-02-09 06:44:28',0,11,15),
  (NULL,'vel, mauris. Integer','non dui nec urna suscipit','2007-03-28 04:18:46','2013-06-04 20:30:18','2013-08-29 02:33:05',1,28,8),
  (NULL,'imperdiet ornare. In faucibus. Morbi','Quisque fringilla euismod enim. Etiam gravida','2005-05-07 17:40:24','2010-05-03 10:50:13','2007-10-14 15:04:29',1,35,5),
  (NULL,'diam nunc, ullamcorper eu, euismod ac,','turpis egestas.','2005-05-27 22:56:41','2004-10-10 07:26:40','2010-12-13 21:33:42',0,31,15),
  (NULL,'lobortis, nisi nibh','ut','2012-01-05 01:28:50','2008-12-23 01:12:38','2012-02-28 01:48:37',1,46,10),
  (NULL,'egestas blandit. Nam nulla magna, malesuada','in faucibus','2005-08-18 11:19:56','2003-01-02 08:15:13','2015-10-21 06:47:15',0,5,16),
  (NULL,'augue ac ipsum. Phasellus vitae mauris sit amet lorem semper','Donec porttitor tellus non magna. Nam','2014-01-23 04:06:14','2010-01-06 01:19:12','2009-10-19 07:39:02',1,50,3),
  (NULL,'pharetra sed, hendrerit','a neque. Nullam ut nisi a odio','2002-05-06 19:06:49','2016-02-11 04:13:13','2001-06-05 19:39:03',1,3,20),
  (NULL,'dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est','libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit','2017-06-17 00:34:16','2017-06-26 06:45:11','2008-04-03 19:11:42',1,47,9);

INSERT INTO `tags` (idTag, labelTag) VALUES
  (NULL, 'PHP'),
  (NULL, 'HTML'),
  (NULL, 'CSS'),
  (NULL, 'Javascript'),
  (NULL, 'Atom'),
  (NULL, 'SQL'),
  (NULL, 'MySQL'),
  (NULL, 'Angular'),
  (NULL, 'React'),
  (NULL, 'NodeJS'),
  (NULL, 'jQuery'),
  (NULL, 'Windows'),
  (NULL, 'Linux'),
  (NULL, 'Mac'),
  (NULL, 'Android'),
  (NULL, 'iOS'),
  (NULL, 'Google'),
  (NULL, 'Apple');

INSERT INTO `comments` (`idComment`,`mailComment`,`contentComment`,`createdDateComment`,`publishedDateComment`,`statusComment`,`article_id`) VALUES
  (NULL,'dictum.eleifend@tempusmauriserat.net','non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras','2017-05-09 21:57:43','2016-12-10 04:31:24',1,30),
  (NULL,'Etiam.bibendum@semper.co.uk','dignissim. Maecenas ornare egestas ligula.','2017-05-25 18:36:04','2017-04-13 16:23:13',1,1),
  (NULL,'sagittis.lobortis.mauris@Proindolor.co.uk','vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus','2017-01-31 22:13:42','2017-02-21 06:38:34',1,16),
  (NULL,'Nulla.facilisis.Suspendisse@vitae.net','ipsum ac mi eleifend egestas. Sed pharetra,','2017-06-29 11:37:59','2017-04-11 23:23:28',1,6),
  (NULL,'dictum.cursus.Nunc@tristique.com','lectus pede, ultrices a, auctor non, feugiat','2017-02-17 11:58:07','2017-11-15 09:26:16',0,15),
  (NULL,'feugiat.Lorem.ipsum@tristiquepellentesquetellus.net','Phasellus at augue id','2016-12-01 20:33:53','2017-06-20 08:16:03',0,33),
  (NULL,'sagittis@orciluctuset.net','scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.','2017-01-29 10:41:48','2016-11-18 00:28:36',0,35),
  (NULL,'dapibus@venenatisvelfaucibus.ca','Duis ac','2017-09-12 02:24:23','2017-07-10 09:12:47',1,36),
  (NULL,'lectus.quis.massa@ultriciesligulaNullam.edu','urna suscipit','2016-12-14 08:53:36','2017-08-20 05:00:38',0,9),
  (NULL,'Phasellus.in.felis@acturpis.com','nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque','2016-11-27 14:53:45','2017-04-20 15:22:38',0,13),
  (NULL,'a@Loremipsumdolor.net','facilisis non, bibendum sed, est. Nunc laoreet','2016-11-22 23:04:06','2016-11-28 10:03:59',0,14),
  (NULL,'Proin.non.massa@tellusNunclectus.edu','dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod','2017-02-09 12:15:40','2017-04-13 02:38:28',1,29),
  (NULL,'mattis.ornare.lectus@pellentesquetellus.ca','neque et nunc. Quisque ornare tortor at risus. Nunc ac','2017-08-12 01:38:10','2017-09-18 03:07:26',0,5),
  (NULL,'ac.eleifend@gravidasagittisDuis.edu','nulla. In tincidunt congue turpis. In','2016-11-21 12:20:19','2017-07-21 10:22:44',0,18),
  (NULL,'eu.dolor@Quisqueimperdieterat.net','non,','2017-03-23 09:30:45','2017-05-18 22:24:54',0,16),
  (NULL,'fringilla.ornare@egetipsumDonec.net','eros. Nam consequat dolor','2017-04-30 18:02:00','2016-11-22 18:30:35',1,25),
  (NULL,'quis.pede.Suspendisse@anteMaecenasmi.co.uk','egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue','2017-02-25 20:57:36','2017-03-30 11:15:53',1,34),
  (NULL,'nibh.lacinia.orci@scelerisquesed.ca','lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut','2016-12-05 06:49:50','2017-08-25 01:52:14',0,35),
  (NULL,'risus.Nunc@lectusNullam.co.uk','ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,','2016-11-27 04:26:17','2017-05-16 05:21:47',1,8),
  (NULL,'non.arcu.Vivamus@sagittis.net','Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede','2017-08-21 09:48:23','2016-11-17 09:13:25',1,24),
  (NULL,'ipsum.dolor.sit@euturpisNulla.org','ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus.','2017-05-24 21:48:44','2017-07-24 10:39:42',0,21),
  (NULL,'eu.elit@malesuada.co.uk','feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula.','2017-01-27 19:16:52','2017-02-14 17:37:55',0,33),
  (NULL,'Proin.sed.turpis@cursusnon.edu','feugiat','2017-04-22 05:49:56','2017-05-29 01:01:46',1,38),
  (NULL,'diam.luctus@loremluctus.net','accumsan laoreet ipsum. Curabitur','2017-07-19 11:52:02','2017-08-23 12:49:49',1,10),
  (NULL,'auctor@Curabitur.org','bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus','2017-02-18 22:02:23','2017-07-06 04:16:05',0,11),
  (NULL,'ac@rhoncus.com','et arcu imperdiet ullamcorper. Duis at lacus.','2017-01-31 21:08:41','2017-01-15 21:51:02',0,31),
  (NULL,'sem.vitae@id.org','Curabitur dictum. Phasellus in','2017-02-04 01:48:12','2017-03-27 07:07:25',0,10),
  (NULL,'ornare.sagittis@Donectemporest.org','arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed','2017-04-24 13:17:11','2017-08-05 10:30:41',0,25),
  (NULL,'Phasellus.vitae.mauris@Maecenasornareegestas.co.uk','enim. Etiam gravida molestie arcu.','2017-02-23 00:51:18','2016-12-26 16:53:13',1,38),
  (NULL,'ornare.sagittis@in.ca','dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec','2016-12-26 04:47:17','2017-08-06 21:49:30',1,28),
  (NULL,'sapien.Nunc.pulvinar@lobortisrisusIn.org','diam. Duis mi enim,','2017-07-29 16:59:37','2017-08-16 01:39:38',1,25),
  (NULL,'mauris@dictumultricies.org','Curae; Phasellus ornare. Fusce mollis. Duis','2017-09-20 12:03:55','2016-11-27 22:07:49',1,39),
  (NULL,'placerat.Cras@vitaealiquameros.ca','convallis, ante lectus convallis est, vitae sodales nisi magna','2017-09-08 18:07:57','2016-12-25 16:27:03',1,34),
  (NULL,'nonummy.ultricies.ornare@Nullatempor.net','Donec dignissim magna a tortor. Nunc commodo auctor velit.','2017-03-19 09:01:24','2017-07-19 04:45:42',1,8),
  (NULL,'id.libero@nec.org','eget mollis lectus pede et risus.','2017-06-28 13:15:05','2017-04-06 09:31:41',0,11),
  (NULL,'dignissim.magna@ullamcorpervelitin.co.uk','eu tempor erat neque non quam. Pellentesque','2017-08-05 11:17:27','2016-11-19 17:37:49',0,38),
  (NULL,'semper@augue.co.uk','lacus, varius et,','2017-01-07 13:47:08','2017-01-28 01:14:47',1,31),
  (NULL,'Nunc@velturpis.net','Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend','2017-08-16 21:29:21','2016-12-05 05:32:46',1,10),
  (NULL,'nascetur.ridiculus.mus@amet.com','orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae','2017-05-05 00:23:03','2017-02-22 04:36:38',1,12),
  (NULL,'Proin.eget@Loremipsum.ca','bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla','2017-09-12 14:41:35','2017-01-28 02:41:05',0,9),
  (NULL,'et@hendreritconsectetuercursus.co.uk','feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus','2017-04-26 18:28:58','2017-10-19 07:31:09',1,17),
  (NULL,'purus@sed.edu','Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus','2017-05-14 11:53:51','2016-12-27 03:31:43',1,35),
  (NULL,'magna.Sed.eu@elementum.net','sit amet, faucibus ut,','2017-11-04 04:42:48','2017-09-19 15:33:37',1,25),
  (NULL,'ante.ipsum@netus.com','Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.','2017-07-24 14:03:46','2016-12-05 16:30:08',1,39),
  (NULL,'tincidunt.dui.augue@apurus.co.uk','ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit','2016-12-22 04:36:47','2017-09-14 23:25:18',0,11),
  (NULL,'Nunc.lectus@montesnascetur.com','magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla.','2017-04-30 19:13:16','2017-08-02 12:48:40',1,15),
  (NULL,'faucibus.leo@egetlacus.co.uk','ut mi. Duis risus odio, auctor vitae, aliquet nec,','2017-10-22 08:10:38','2017-03-11 15:32:48',0,29),
  (NULL,'cursus.et.magna@Aeneangravida.co.uk','sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros.','2017-10-30 11:43:51','2017-05-17 11:40:04',0,13),
  (NULL,'nibh.enim@dapibusquam.co.uk','imperdiet dictum magna. Ut tincidunt','2017-09-23 23:02:20','2017-06-06 22:44:57',0,30),
  (NULL,'ad@Morbivehicula.net','ac ipsum. Phasellus vitae mauris sit amet','2017-08-06 14:37:36','2017-03-20 03:42:13',0,2),
  (NULL,'quis.turpis@loremeget.co.uk','sed dictum eleifend, nunc','2017-11-03 10:39:29','2017-09-14 19:49:41',0,22),
  (NULL,'amet.luctus@mauriselitdictum.ca','ac facilisis facilisis, magna','2017-06-17 09:48:22','2017-03-31 22:45:20',1,13),
  (NULL,'aliquet.odio.Etiam@nascetur.edu','fringilla. Donec feugiat metus sit amet ante. Vivamus','2017-08-27 15:34:48','2017-07-23 20:27:43',1,31),
  (NULL,'mus@ipsumleo.com','sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum','2017-05-19 20:13:35','2017-02-21 18:31:14',0,4),
  (NULL,'cursus@augueut.org','ornare lectus justo eu arcu.','2017-06-13 08:38:19','2017-05-29 09:41:45',0,11),
  (NULL,'commodo.auctor.velit@Seddiam.com','fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci','2017-06-15 17:11:32','2016-12-15 06:59:39',1,16),
  (NULL,'dui.Suspendisse@duiquis.net','Sed et libero. Proin','2017-01-02 03:03:00','2017-02-17 02:10:48',0,21),
  (NULL,'orci.Donec@volutpat.com','dolor quam, elementum','2017-01-20 17:12:25','2017-10-08 19:41:15',0,4),
  (NULL,'iaculis.enim@pede.ca','sapien. Nunc pulvinar arcu et','2017-01-08 01:59:04','2017-07-10 09:55:45',0,37),
  (NULL,'sodales@ornareegestas.com','magnis dis parturient','2017-10-27 14:27:11','2017-07-26 08:21:44',0,9),
  (NULL,'lectus.rutrum@ametrisus.net','porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum,','2017-10-22 20:13:44','2017-09-16 17:06:28',1,7),
  (NULL,'consequat.auctor@ametconsectetueradipiscing.co.uk','lacus. Mauris non dui nec urna suscipit nonummy. Fusce','2017-01-18 04:18:18','2017-03-13 10:38:45',1,14),
  (NULL,'eu.nulla@pedeet.ca','penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu','2017-04-28 11:40:27','2017-07-04 18:55:21',0,28),
  (NULL,'Integer@luctussitamet.net','id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede.','2017-05-31 00:31:46','2017-10-04 09:04:52',1,12),
  (NULL,'mi@CrasinterdumNunc.org','nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim,','2016-11-29 18:21:59','2017-03-23 11:26:16',0,10),
  (NULL,'eu@mauriserat.ca','aliquet.','2017-02-19 14:44:27','2017-03-19 18:36:11',0,37),
  (NULL,'Proin.non.massa@diamDuis.co.uk','consequat enim diam vel arcu. Curabitur ut odio vel est','2017-10-23 08:07:40','2017-02-28 22:19:42',0,9),
  (NULL,'Integer.in@montes.edu','Integer in','2017-06-29 04:46:56','2017-05-29 23:00:14',0,7),
  (NULL,'placerat.orci.lacus@sed.net','turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie','2017-05-14 04:40:29','2017-07-29 19:10:20',1,34),
  (NULL,'tristique.senectus@purusNullam.net','neque. Nullam nisl. Maecenas malesuada fringilla','2017-06-13 19:22:19','2017-08-28 14:18:55',0,12),
  (NULL,'sit.amet@dapibus.co.uk','dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa.','2017-03-15 11:34:39','2017-10-20 19:00:37',1,8),
  (NULL,'nunc.sed.pede@Suspendisseacmetus.net','sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla','2016-12-16 19:50:42','2016-11-26 12:04:32',1,3),
  (NULL,'ornare@semNulla.org','eu erat semper rutrum.','2017-08-04 17:16:39','2016-12-18 22:51:21',1,2),
  (NULL,'nisl.Nulla@Nullam.ca','ornare tortor at risus. Nunc ac sem ut','2017-04-11 01:30:21','2017-10-19 15:16:09',0,6),
  (NULL,'semper.pretium.neque@utcursusluctus.com','justo. Proin non massa non','2017-09-19 10:03:45','2017-02-02 16:00:36',1,7),
  (NULL,'Donec.est.mauris@necante.edu','erat volutpat.','2017-08-19 01:20:25','2016-11-26 16:47:20',0,39),
  (NULL,'Nullam.ut@nisi.com','auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero','2017-10-06 08:35:37','2017-07-30 18:01:45',1,30),
  (NULL,'augue.ut@leoelementumsem.org','Aliquam adipiscing lobortis risus. In','2016-12-16 14:52:50','2016-12-27 05:35:18',1,11),
  (NULL,'accumsan@quamCurabiturvel.net','viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat.','2017-01-02 20:22:21','2016-11-16 22:22:21',1,27),
  (NULL,'at.pretium@vitaenibh.co.uk','gravida sagittis. Duis gravida.','2017-06-15 07:22:08','2017-08-07 11:16:00',1,26),
  (NULL,'ante.bibendum.ullamcorper@Mauris.co.uk','aliquet magna a neque. Nullam ut nisi a','2017-01-16 03:28:12','2017-08-17 00:21:10',0,2),
  (NULL,'augue@nec.com','ipsum dolor sit amet, consectetuer adipiscing elit.','2017-01-26 03:31:25','2017-11-10 20:27:52',0,37),
  (NULL,'molestie.in@mauris.net','ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus','2017-04-19 16:06:15','2016-11-17 21:23:06',0,34),
  (NULL,'pede.sagittis@justoPraesent.co.uk','in, hendrerit consectetuer, cursus','2017-05-01 01:17:32','2016-11-25 03:14:09',0,39),
  (NULL,'elementum.sem.vitae@Pellentesquetincidunt.edu','magna. Suspendisse tristique neque venenatis lacus.','2017-06-11 21:34:25','2017-09-17 15:21:45',1,22),
  (NULL,'semper.auctor@Donec.edu','sed','2017-01-06 23:51:18','2016-11-23 13:04:05',1,5),
  (NULL,'lacus.Ut@laoreet.ca','elit','2017-04-09 08:40:08','2017-10-04 15:14:04',0,4),
  (NULL,'quis@pretium.org','Duis ac','2017-06-09 07:37:27','2017-02-24 22:35:42',1,17),
  (NULL,'libero.et.tristique@scelerisqueneque.com','id','2017-03-11 16:25:16','2017-09-04 12:15:13',1,7),
  (NULL,'sit@a.net','dictum sapien. Aenean massa. Integer vitae nibh.','2017-10-08 01:32:05','2017-03-17 13:33:57',0,26),
  (NULL,'magna.a@Sedmalesuadaaugue.org','vulputate, risus','2016-12-22 14:59:22','2017-10-27 00:20:30',0,4),
  (NULL,'Mauris.magna.Duis@sodaleselit.org','risus. In mi','2017-11-13 17:12:21','2017-02-09 02:04:19',0,37),
  (NULL,'metus.facilisis@augueeutellus.ca','tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique','2017-06-01 13:55:17','2017-10-15 16:46:13',0,38),
  (NULL,'tortor.Nunc.commodo@Morbivehicula.ca','sapien. Aenean massa. Integer vitae','2016-12-23 11:30:44','2017-02-21 00:18:26',1,21),
  (NULL,'magna@auctorveliteget.ca','ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus.','2017-08-05 20:26:18','2017-04-29 03:26:39',1,24),
  (NULL,'non@ac.edu','molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit','2017-03-19 01:35:30','2017-04-24 21:42:47',0,10),
  (NULL,'primis@posuere.org','dolor','2017-10-24 06:04:37','2016-12-18 20:25:13',0,27),
  (NULL,'dis@CrasinterdumNunc.co.uk','Vestibulum ante ipsum','2017-06-22 09:11:30','2017-03-30 16:37:05',1,36),
  (NULL,'quam.Curabitur.vel@Nullam.ca','Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec','2017-07-09 12:03:11','2017-03-31 15:31:52',1,6),
  (NULL,'eros.Proin.ultrices@aodiosemper.net','nunc','2017-11-06 02:41:13','2017-01-22 09:57:29',0,20);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

COMMIT;
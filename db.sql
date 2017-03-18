DROP DATABASE IF EXISTS `kagoyume_db`;
CREATE DATABASE kagoyume_db;
-- GRANT ALL ON kagoyume_db.* TO 'Niwata'@'localhost';
-- GRANT ALL ON kagoyume_db.* TO 'hayashi'@'localhost';
USE kagoyume_db;

DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `name` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `address` text,
  `total` int(11) DEFAULT NULL,
  `newDate` datetime NOT NULL,
  `deleteFlg` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `buy_t`;
CREATE TABLE `buy_t` (
  `buyID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `itemCode` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `buyDate` datetime NOT NULL,
  PRIMARY KEY (`buyID`),
  KEY `userID` (`userID`),
  CONSTRAINT `buy_t_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_t` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- mysql -u root < パス\kagoyume_db.sql
-- mysqldump -u root データベース > 名前.sql
-- 
-- Statements actually I used: 
-- CREATE TABLE user_t (
--     userID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     name varchar(255) NOT NULL,
--     password varchar(255) NOT NULL,
--     mail varchar(255) NOT NULL,
--     address text,
--     total int,
--     newDate Datetime NOT NULL,
--     deleteFlg int NOT NULL DEFAULT 0
-- );
-- CREATE TABLE buy_t (
--     buyID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     userID int,
--     itemCode varchar(255),
--     type int,
--     buyDate datetime,
--     FOREIGN KEY(userID) REFERENCES user_t(userID)
-- );
-- 外部キー制約があるのにNOT NULLを指定してなかったのでテーブルごと作り直すはめになった
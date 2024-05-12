/* Create TaskManagementSystem schema */

CREATE DATABASE IF NOT EXISTS `TaskManagementSystem`

USE `TaskManagementSystem`;

CREATE TABLE IF NOT EXISTS `tblTasks` (
  `fldTask_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `fldName` VARCHAR(128) DEFAULT NULL,
  `fldStatus` VARCHAR(100) DEFAULT "Unassigned",
  `fldUserId` INT(11) DEFAULT NULL,
  `fldCreatedDate` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `fldModifiedDate` DATETIME DEFAULT NULL,
  `fldActive` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`fldTask_Id`)
);

CREATE TABLE IF NOT EXISTS `tblUser` (
  `fldUser_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `fldName` VARCHAR(128) DEFAULT NULL,
  `fldActive` TINYINT(1) NOT NULL DEFAULT 1,
  `fldCreatedDate` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `fldModifiedDate` DATETIME DEFAULT NULL,
  PRIMARY KEY (`fldUser_Id`)
);
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`order-Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order-Parts204` (
  `P_No204` INT NOT NULL,
  `P_Name204` VARCHAR(45) NULL,
  `P_CurrentPrice204` INT NULL,
  `P_QOH204` INT NULL,
  PRIMARY KEY (`P_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`0rder-Clients204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`0rder-Clients204` (
  `C_ID204` INT NOT NULL,
  `C_Name204` VARCHAR(45) NULL,
  `C_City204` VARCHAR(45) NULL,
  `C_Password204` VARCHAR(45) NULL,
  `C_MoneyOwed204` INT NULL,
  PRIMARY KEY (`C_ID204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order-POs204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order-POs204` (
  `POs_PoNo204` INT NOT NULL,
  `POs_ClientCompID` INT NOT NULL,
  `POs_DateofPO` VARCHAR(45) NULL,
  `POs_Status` VARCHAR(45) NULL,
  PRIMARY KEY (`POs_PoNo204`, `POs_ClientCompID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order-Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order-Line204` (
  `L_PoNo204` INT NOT NULL,
  `L_LineNo204` VARCHAR(45) NULL,
  `L_PartNo204` INT NULL,
  `L_QTY204` INT NULL,
  `L_PriceOrdered204` FLOAT(2) NULL,
  PRIMARY KEY (`L_PoNo204`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

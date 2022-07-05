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
-- Table `mydb`.`x-order-Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`x-order-Parts204` (
  `P_No204` INT NOT NULL,
  `P_Name204` VARCHAR(45) NULL,
  `P_CurrentPrice204` INT NULL,
  `P_QOH204` INT NULL,
  PRIMARY KEY (`P_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`x-order-Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`x-order-Line204` (
  `L_PoNo204` INT NOT NULL,
  `L_LineNo204` VARCHAR(45) NULL,
  `L_PartNo204` INT NULL,
  `L_QTY204` INT NULL,
  `L_PriceOrdered204` FLOAT(2) NULL,
  `order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`L_PoNo204`, `order-Parts204_P_No204`),
  INDEX `fk_order-Line204_order-Parts204_idx` (`order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_order-Line204_order-Parts204`
    FOREIGN KEY (`order-Parts204_P_No204`)
    REFERENCES `mydb`.`x-order-Parts204` (`P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`x-order-POs204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`x-order-POs204` (
  `POs_PoNo204` INT NOT NULL,
  `POs_ClientCompID` INT NOT NULL,
  `POs_DateofPO` VARCHAR(45) NULL,
  `POs_Status` VARCHAR(45) NULL,
  `order-Line204_L_PoNo204` INT NOT NULL,
  `order-Line204_order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`POs_PoNo204`, `POs_ClientCompID`, `order-Line204_L_PoNo204`, `order-Line204_order-Parts204_P_No204`),
  INDEX `fk_order-POs204_order-Line2041_idx` (`order-Line204_L_PoNo204` ASC, `order-Line204_order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_order-POs204_order-Line2041`
    FOREIGN KEY (`order-Line204_L_PoNo204` , `order-Line204_order-Parts204_P_No204`)
    REFERENCES `mydb`.`x-order-Line204` (`L_PoNo204` , `order-Parts204_P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`x-order-Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`x-order-Clients` (
  `C_ID204` INT NOT NULL,
  `C_Name204` VARCHAR(45) NULL,
  `C_City204` VARCHAR(45) NULL,
  `C_Password204` VARCHAR(45) NULL,
  `C_MoneyOwed204` INT NULL,
  `order-POs204_POs_PoNo204` INT NOT NULL,
  `order-POs204_POs_ClientCompID` INT NOT NULL,
  `order-POs204_order-Line204_L_PoNo204` INT NOT NULL,
  `order-POs204_order-Line204_order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`C_ID204`, `order-POs204_POs_PoNo204`, `order-POs204_POs_ClientCompID`, `order-POs204_order-Line204_L_PoNo204`, `order-POs204_order-Line204_order-Parts204_P_No204`),
  INDEX `fk_0rder-Clients204_order-POs2041_idx` (`order-POs204_POs_PoNo204` ASC, `order-POs204_POs_ClientCompID` ASC, `order-POs204_order-Line204_L_PoNo204` ASC, `order-POs204_order-Line204_order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_0rder-Clients204_order-POs2041`
    FOREIGN KEY (`order-POs204_POs_PoNo204` , `order-POs204_POs_ClientCompID` , `order-POs204_order-Line204_L_PoNo204` , `order-POs204_order-Line204_order-Parts204_P_No204`)
    REFERENCES `mydb`.`x-order-POs204` (`POs_PoNo204` , `POs_ClientCompID` , `order-Line204_L_PoNo204` , `order-Line204_order-Parts204_P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`y-order-Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`y-order-Parts204` (
  `P_No204` INT NOT NULL,
  `P_Name204` VARCHAR(45) NULL,
  `P_CurrentPrice204` INT NULL,
  `P_QOH204` INT NULL,
  PRIMARY KEY (`P_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`y-order-Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`y-order-Line204` (
  `L_PoNo204` INT NOT NULL,
  `L_LineNo204` VARCHAR(45) NULL,
  `L_PartNo204` INT NULL,
  `L_QTY204` INT NULL,
  `L_PriceOrdered204` FLOAT(2) NULL,
  `order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`L_PoNo204`, `order-Parts204_P_No204`),
  INDEX `fk_order-Line204_order-Parts204_idx` (`order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_order-Line204_order-Parts2040`
    FOREIGN KEY (`order-Parts204_P_No204`)
    REFERENCES `mydb`.`y-order-Parts204` (`P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`y-order-POs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`y-order-POs` (
  `POs_PoNo204` INT NOT NULL,
  `POs_ClientCompID` INT NOT NULL,
  `POs_DateofPO` VARCHAR(45) NULL,
  `POs_Status` VARCHAR(45) NULL,
  `order-Line204_L_PoNo204` INT NOT NULL,
  `order-Line204_order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`POs_PoNo204`, `POs_ClientCompID`, `order-Line204_L_PoNo204`, `order-Line204_order-Parts204_P_No204`),
  INDEX `fk_order-POs204_order-Line2041_idx` (`order-Line204_L_PoNo204` ASC, `order-Line204_order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_order-POs204_order-Line20410`
    FOREIGN KEY (`order-Line204_L_PoNo204` , `order-Line204_order-Parts204_P_No204`)
    REFERENCES `mydb`.`y-order-Line204` (`L_PoNo204` , `order-Parts204_P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`y-order-Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`y-order-Clients` (
  `C_ID204` INT NOT NULL,
  `C_Name204` VARCHAR(45) NULL,
  `C_City204` VARCHAR(45) NULL,
  `C_Password204` VARCHAR(45) NULL,
  `C_MoneyOwed204` INT NULL,
  `order-POs204_POs_PoNo204` INT NOT NULL,
  `order-POs204_POs_ClientCompID` INT NOT NULL,
  `order-POs204_order-Line204_L_PoNo204` INT NOT NULL,
  `order-POs204_order-Line204_order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`C_ID204`, `order-POs204_POs_PoNo204`, `order-POs204_POs_ClientCompID`, `order-POs204_order-Line204_L_PoNo204`, `order-POs204_order-Line204_order-Parts204_P_No204`),
  INDEX `fk_0rder-Clients204_order-POs2041_idx` (`order-POs204_POs_PoNo204` ASC, `order-POs204_POs_ClientCompID` ASC, `order-POs204_order-Line204_L_PoNo204` ASC, `order-POs204_order-Line204_order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_0rder-Clients204_order-POs20410`
    FOREIGN KEY (`order-POs204_POs_PoNo204` , `order-POs204_POs_ClientCompID` , `order-POs204_order-Line204_L_PoNo204` , `order-POs204_order-Line204_order-Parts204_P_No204`)
    REFERENCES `mydb`.`y-order-POs` (`POs_PoNo204` , `POs_ClientCompID` , `order-Line204_L_PoNo204` , `order-Line204_order-Parts204_P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`z-order-Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`z-order-Parts204` (
  `P_No204` INT NOT NULL,
  `P_Name204` VARCHAR(45) NULL,
  `P_CurrentPrice204` INT NULL,
  `P_QOH204` INT NULL,
  PRIMARY KEY (`P_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`z-order-Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`z-order-Line204` (
  `L_PoNo204` INT NOT NULL,
  `L_LineNo204` VARCHAR(45) NULL,
  `L_PartNo204` INT NULL,
  `L_QTY204` INT NULL,
  `L_PriceOrdered204` FLOAT(2) NULL,
  `order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`L_PoNo204`, `order-Parts204_P_No204`),
  INDEX `fk_order-Line204_order-Parts204_idx` (`order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_order-Line204_order-Parts20400`
    FOREIGN KEY (`order-Parts204_P_No204`)
    REFERENCES `mydb`.`z-order-Parts204` (`P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`z-order-POs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`z-order-POs` (
  `POs_PoNo204` INT NOT NULL,
  `POs_ClientCompID` INT NOT NULL,
  `POs_DateofPO` VARCHAR(45) NULL,
  `POs_Status` VARCHAR(45) NULL,
  `order-Line204_L_PoNo204` INT NOT NULL,
  `order-Line204_order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`POs_PoNo204`, `POs_ClientCompID`, `order-Line204_L_PoNo204`, `order-Line204_order-Parts204_P_No204`),
  INDEX `fk_order-POs204_order-Line2041_idx` (`order-Line204_L_PoNo204` ASC, `order-Line204_order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_order-POs204_order-Line204100`
    FOREIGN KEY (`order-Line204_L_PoNo204` , `order-Line204_order-Parts204_P_No204`)
    REFERENCES `mydb`.`z-order-Line204` (`L_PoNo204` , `order-Parts204_P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`z-order-Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`z-order-Clients` (
  `C_ID204` INT NOT NULL,
  `C_Name204` VARCHAR(45) NULL,
  `C_City204` VARCHAR(45) NULL,
  `C_Password204` VARCHAR(45) NULL,
  `C_MoneyOwed204` INT NULL,
  `order-POs204_POs_PoNo204` INT NOT NULL,
  `order-POs204_POs_ClientCompID` INT NOT NULL,
  `order-POs204_order-Line204_L_PoNo204` INT NOT NULL,
  `order-POs204_order-Line204_order-Parts204_P_No204` INT NOT NULL,
  PRIMARY KEY (`C_ID204`, `order-POs204_POs_PoNo204`, `order-POs204_POs_ClientCompID`, `order-POs204_order-Line204_L_PoNo204`, `order-POs204_order-Line204_order-Parts204_P_No204`),
  INDEX `fk_0rder-Clients204_order-POs2041_idx` (`order-POs204_POs_PoNo204` ASC, `order-POs204_POs_ClientCompID` ASC, `order-POs204_order-Line204_L_PoNo204` ASC, `order-POs204_order-Line204_order-Parts204_P_No204` ASC) VISIBLE,
  CONSTRAINT `fk_0rder-Clients204_order-POs204100`
    FOREIGN KEY (`order-POs204_POs_PoNo204` , `order-POs204_POs_ClientCompID` , `order-POs204_order-Line204_L_PoNo204` , `order-POs204_order-Line204_order-Parts204_P_No204`)
    REFERENCES `mydb`.`z-order-POs` (`POs_PoNo204` , `POs_ClientCompID` , `order-Line204_L_PoNo204` , `order-Line204_order-Parts204_P_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema assignment3_396
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema  assignment3_396
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment3_396` DEFAULT CHARACTER SET utf8 ;
USE `assignment3_396` ;

-- -----------------------------------------------------
-- Table `assignment3_396`.`x_Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`x_Parts204` (
  `X_No204` INT NOT NULL,
  `X_Name204` VARCHAR(45) NULL,
  `X_CurrentPrice204` INT NULL,
  `X_QOH204` INT NULL,
  PRIMARY KEY (`X_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ` assignment3_396`.`x_Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`x_Line204` (
  `X_PoNo204` INT NOT NULL,
  `X_LineNo204` VARCHAR(45) NULL,
  `X_PartNo204` INT NULL,
  `X_QTY204` INT NULL,
  `X_PriceOrdered204` FLOAT(2) NULL,
  `x_Parts204_X_No204` INT NOT NULL,
  PRIMARY KEY (`X_PoNo204`, `x_Parts204_X_No204`),
  INDEX `fk_x_Line204_x_Parts204_idx` (`x_Parts204_X_No204` ASC) VISIBLE,
  CONSTRAINT `fk_x_Line204_x_Parts204`
    FOREIGN KEY (`x_Parts204_X_No204`)
    REFERENCES `assignment3_396`.`x_Parts204` (`X_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`x_POs204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`x_POs204` (
  `XPOs_PoNo204` INT NOT NULL,
  `XPOs_ClientCompID204` INT NOT NULL,
  `XPOs_DateofPO204` VARCHAR(45) NULL,
  `XPOs_Status204` VARCHAR(45) NULL,
  `x_Line204_X_PoNo204` INT NULL,
  `x_Line204_x_Parts204_X_No204` INT NULL,
  PRIMARY KEY (`XPOs_PoNo204`, `XPOs_ClientCompID204`),
  INDEX `fk_x_POs204_x_Line2041_idx` (`x_Line204_X_PoNo204` ASC, `x_Line204_x_Parts204_X_No204` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`x_Clients204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`x_Clients204` (
  `XC_ID204` INT NOT NULL,
  `XC_Name204` VARCHAR(45) NULL,
  `XC_City204` VARCHAR(45) NULL,
  `XC_Password204` VARCHAR(45) NULL,
  `XC_MoneyOwed204` INT NULL,
  `x_POs204_XPOs_PoNo204` INT NOT NULL,
  `x_POs204_XPOs_ClientCompID204` INT NOT NULL,
  `x_POs204_x_Line204_X_PoNo204` INT NOT NULL,
  `x_POs204_x_Line204_x_Parts204_X_No204` INT NOT NULL,
  PRIMARY KEY (`XC_ID204`, `x_POs204_XPOs_PoNo204`, `x_POs204_XPOs_ClientCompID204`),
  INDEX `fk_x_Clients204_x_POs2041_idx` (`x_POs204_XPOs_PoNo204` ASC, `x_POs204_XPOs_ClientCompID204` ASC, `x_POs204_x_Line204_X_PoNo204` ASC, `x_POs204_x_Line204_x_Parts204_X_No204` ASC) VISIBLE,
  CONSTRAINT `fk_x_Clients204_x_POs2041`
    FOREIGN KEY (`x_POs204_XPOs_PoNo204` , `x_POs204_XPOs_ClientCompID204`)
    REFERENCES `assignment3_396`.`x_POs204` (`XPOs_PoNo204` , `XPOs_ClientCompID204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`y_Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`y_Parts204` (
  `Y_No204` INT NOT NULL,
  `Y_Name204` VARCHAR(45) NULL,
  `Y_CurrentPrice204` INT NULL,
  `Y_QOH204` INT NULL,
  PRIMARY KEY (`Y_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`y_Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`y_Line204` (
  `Y_PoNo204` INT NOT NULL,
  `Y_LineNo204` VARCHAR(45) NULL,
  `Y_PartNo204` INT NULL,
  `Y_QTY204` INT NULL,
  `Y_PriceOrdered204` FLOAT(2) NULL,
  `y_Parts204_Y_No204` INT NOT NULL,
  PRIMARY KEY (`Y_PoNo204`, `y_Parts204_Y_No204`),
  INDEX `fk_y_Line204_y_Parts204_idx` (`y_Parts204_Y_No204` ASC) VISIBLE,
  CONSTRAINT `fk_y_Line204_y_Parts204`
    FOREIGN KEY (`y_Parts204_Y_No204`)
    REFERENCES `assignment3_396`.`y_Parts204` (`Y_No204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`y_POs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`y_POs204` (
  `YPOs_PoNo204` INT NOT NULL,
  `YPOs_ClientCompID204` INT NOT NULL,
  `YPOs_DateofPO204` VARCHAR(45) NULL,
  `YPOs_Status204` VARCHAR(45) NULL,
  `y_Line204_Y_PoNo204` INT NULL,
  `y_Line204_y_Parts204_Y_No204` INT NULL,
  PRIMARY KEY (`YPOs_PoNo204`, `YPOs_ClientCompID204`),
  INDEX `fk_y_POs204_y_Line204_idx` (`y_Line204_Y_PoNo204` ASC, `y_Line204_y_Parts204_Y_No204` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`y_Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`y_Clients204` (
  `YC_ID204` INT NOT NULL,
  `YC_Name204` VARCHAR(45) NULL,
  `YC_City204` VARCHAR(45) NULL,
  `YC_Password204` VARCHAR(45) NULL,
  `YC_MoneyOwed204` INT NULL,
  `y_POs204_YPOs_PoNo204` INT NOT NULL,
  `y_POs204_YPOs_ClientCompID204` INT NOT NULL,
  `y_POs204_y_Line204_Y_PoNo204` INT NOT NULL,
  `y_POs204_y_Line204_y_Parts204_Y_No204` INT NOT NULL,
  PRIMARY KEY (`YC_ID204`, `y_POs204_YPOs_PoNo204`, `y_POs204_YPOs_ClientCompID204`),
  INDEX `fk_y_Clients204_y_POs204_idx` (`y_POs204_YPOs_PoNo204` ASC, `y_POs204_YPOs_ClientCompID204` ASC, `y_POs204_y_Line204_Y_PoNo204` ASC, `y_POs204_y_Line204_y_Parts204_Y_No204` ASC) VISIBLE,
  CONSTRAINT `fk_y_Clients204_y_POs204`
    FOREIGN KEY (`y_POs204_YPOs_PoNo204` , `y_POs204_YPOs_ClientCompID204`)
    REFERENCES `assignment3_396`.`y_POs` (`YPOs_PoNo204` , `YPOs_ClientCompID204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`z_Parts204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`z_Parts204` (
  `Z_No204` INT NOT NULL,
  `Z_Name204` VARCHAR(45) NULL,
  `Z_CurrentPrice204` INT NULL,
  `Z_QOH204` INT NULL,
  PRIMARY KEY (`Z_No204`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`z_Line204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`z_Line204` (
  `Z_PoNo204` INT NOT NULL,
  `Z_LineNo204` INT NOT NULL AUTO_INCREMENT,
  `Z_PartNo204` INT NULL,
  `Z_QTY204` INT NULL,
  `Z_From204` VARCHAR(11) NULL,
  `Z_PriceOrdered204` FLOAT(2) NULL,
  `z_Parts204_Z_No204` INT NULL,
  PRIMARY KEY (`Z_PoNo204`),
  KEY (`Z_LineNo204`),
  INDEX `fk_z_Line204_z_Parts204_idx` (`z_Parts204_Z_No204` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`z_POs204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`z_POs204` (
  `ZPOs_PoNo204` INT NOT NULL,
  `ZPOs_ClientCompID204` INT NOT NULL,
  `ZPOs_DateofPO204` VARCHAR(45) NULL,
  `ZPOs_Status204` VARCHAR(45) NULL,
  `z_Line204_Z_PoNo204` INT NULL,
  `z_Line204_z_Parts204_Z_No204` INT NULL,
  PRIMARY KEY (`ZPOs_PoNo204`, `ZPOs_ClientCompID204`),
  INDEX `fk_z_POs204_z_Line204_idx` (`z_Line204_Z_PoNo204` ASC, `z_Line204_z_Parts204_Z_No204` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment3_396`.`z_Clients204`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment3_396`.`z_Clients204` (
  `ZC_ID204` INT NOT NULL,
  `ZC_Name204` VARCHAR(45) NOT NULL,
  `ZC_City204` VARCHAR(45) NOT NULL,
  `ZC_Password204` VARCHAR(45) NOT NULL,
  `ZC_MoneyOwed204` INT NOT NULL,
  `z_POs204_ZPOs_PoNo204` INT NULL,
  `z_POs204_ZPOs_ClientCompID204` INT NULL,
  `z_POs204_z_Line204_Z_PoNo204` INT NULL,
  `z_POs204_z_Line204_z_Parts204_Z_No204` INT NULL,
  PRIMARY KEY (`ZC_ID204`),
  INDEX `fk_z_Clients204_z_POs204_idx` (`z_POs204_ZPOs_PoNo204` ASC, `z_POs204_ZPOs_ClientCompID204` ASC, `z_POs204_z_Line204_Z_PoNo204` ASC, `z_POs204_z_Line204_z_Parts204_Z_No204` ASC) VISIBLE,
  CONSTRAINT `fk_z_Clients204_z_POs204`
    FOREIGN KEY (`z_POs204_ZPOs_PoNo204` , `z_POs204_ZPOs_ClientCompID204`)
    REFERENCES `assignment3_396`.`z_POs` (`ZPOs_PoNo204` , `ZPOs_ClientCompID204`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

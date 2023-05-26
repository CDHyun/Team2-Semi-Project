-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jazz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jazz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jazz` DEFAULT CHARACTER SET utf8 ;
USE `jazz` ;

-- -----------------------------------------------------
-- Table `jazz`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jazz`.`user` (
  `uid` VARCHAR(14) NOT NULL,
  `uPassword` VARCHAR(20) NULL,
  `uName` VARCHAR(20) NULL,
  `uPhone` VARCHAR(15) NULL,
  `uAddress` VARCHAR(45) NULL,
  `uEmail` VARCHAR(30) NULL,
  `uInsertDate` DATETIME NULL,
  `uUpdateDate` DATETIME NULL,
  `uSecessionStatus` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jazz`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jazz`.`product` (
  `pCode` INT NOT NULL AUTO_INCREMENT,
  `pName` VARCHAR(45) NULL,
  `pBrandName` VARCHAR(20) NULL,
  `pPrice` INT NULL,
  `pInsertDate` DATETIME NULL,
  `pUpdateDate` DATETIME NULL,
  `pDeleteDate` DATETIME NULL,
  `pImageName` VARCHAR(45) NULL,
  `pImage` LONGBLOB NULL,
  PRIMARY KEY (`pCode`),
  UNIQUE INDEX `pCode_UNIQUE` (`pCode` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jazz`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jazz`.`purchase` (
  `pcNo` INT NOT NULL AUTO_INCREMENT,
  `uid` VARCHAR(14) NOT NULL,
  `pCode` INT NOT NULL,
  `pcInsertDate` DATETIME NULL,
  `pcDeleteDate` DATETIME NULL,
  `pcQty` INT NULL,
  INDEX `fk_user_has_product_product1_idx` (`pCode` ASC) VISIBLE,
  INDEX `fk_user_has_product_user_idx` (`uid` ASC) VISIBLE,
  PRIMARY KEY (`pcNo`, `uid`, `pCode`),
  UNIQUE INDEX `pcNo_UNIQUE` (`pcNo` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_product_user`
    FOREIGN KEY (`uid`)
    REFERENCES `jazz`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_product_product1`
    FOREIGN KEY (`pCode`)
    REFERENCES `jazz`.`product` (`pCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jazz`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jazz`.`cart` (
  `cNo` INT NOT NULL AUTO_INCREMENT,
  `uid` VARCHAR(14) NOT NULL,
  `pCode` INT NOT NULL,
  `cQty` INT NULL,
  PRIMARY KEY (`cNo`, `uid`, `pCode`),
  INDEX `fk_user_has_product_product2_idx` (`pCode` ASC) VISIBLE,
  INDEX `fk_user_has_product_user1_idx` (`uid` ASC) VISIBLE,
  UNIQUE INDEX `cNo_UNIQUE` (`cNo` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_product_user1`
    FOREIGN KEY (`uid`)
    REFERENCES `jazz`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_product_product2`
    FOREIGN KEY (`pCode`)
    REFERENCES `jazz`.`product` (`pCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jazz`.`productOption`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jazz`.`productOption` (
  `pCode` INT NOT NULL AUTO_INCREMENT,
  `pSize` VARCHAR(5) NOT NULL,
  `pStock` INT NULL,
  PRIMARY KEY (`pCode`, `pSize`),
  UNIQUE INDEX `pSize_UNIQUE` (`pSize` ASC) VISIBLE,
  UNIQUE INDEX `pCode_UNIQUE` (`pCode` ASC) VISIBLE,
  CONSTRAINT `fk_productOption_product1`
    FOREIGN KEY (`pCode`)
    REFERENCES `jazz`.`product` (`pCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jazz`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jazz`.`admin` (
  `aid` VARCHAR(20) NOT NULL,
  `aPassword` VARCHAR(20) NULL,
  PRIMARY KEY (`aid`),
  UNIQUE INDEX `aid_UNIQUE` (`aid` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

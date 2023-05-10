-- MySQL Script generated by MySQL Workbench
-- mar 09 may 2023 15:08:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema egamesSQL
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `egamesSQL` ;

-- -----------------------------------------------------
-- Schema egamesSQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `egamesSQL` DEFAULT CHARACTER SET utf8mb4 ;
USE `egamesSQL` ;

-- -----------------------------------------------------
-- Table `egamesSQL`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`games` (
  `idgame` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) NULL,
  `release_date` DATE NULL,
  `cover` VARCHAR(1000) NULL DEFAULT 'https://www.idsplus.net/wp-content/uploads/default-placeholder.png',
  PRIMARY KEY (`idgame`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`users` (
  `iduser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`status` (
  `idstatus` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idstatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`orders` (
  `idorder` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `iduser` INT UNSIGNED NOT NULL,
  `idstatus` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idorder`, `iduser`, `idstatus`),
  INDEX `fk_orders_users1_idx` (`iduser` ASC),
  INDEX `fk_orders_status1_idx` (`idstatus` ASC),
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`iduser`)
    REFERENCES `egamesSQL`.`users` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_status1`
    FOREIGN KEY (`idstatus`)
    REFERENCES `egamesSQL`.`status` (`idstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`userInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`userInfo` (
  `iduser` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(200) NOT NULL,
  `phoneNumber` VARCHAR(20) NULL,
  INDEX `fk_userInfo_users_idx` (`iduser` ASC),
  PRIMARY KEY (`iduser`),
  CONSTRAINT `fk_userInfo_users`
    FOREIGN KEY (`iduser`)
    REFERENCES `egamesSQL`.`users` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`stock` (
  `stock` VARCHAR(45) NULL,
  `platform` VARCHAR(45) NOT NULL,
  `price` INT UNSIGNED NULL,
  `idgame` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idgame`, `platform`),
  INDEX `fk_stock_games1_idx` (`idgame` ASC),
  CONSTRAINT `fk_stock_games1`
    FOREIGN KEY (`idgame`)
    REFERENCES `egamesSQL`.`games` (`idgame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`orders_has_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`orders_has_stock` (
  `idorder` INT UNSIGNED NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  `idgame` INT UNSIGNED NOT NULL,
  `platform` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idorder`, `idgame`, `platform`),
  INDEX `fk_orders_has_stock_orders1_idx` (`idorder` ASC),
  INDEX `fk_orders_has_stock_stock1_idx` (`idgame` ASC, `platform` ASC),
  CONSTRAINT `fk_orders_has_stock_orders1`
    FOREIGN KEY (`idorder`)
    REFERENCES `egamesSQL`.`orders` (`idorder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_stock_stock1`
    FOREIGN KEY (`idgame` , `platform`)
    REFERENCES `egamesSQL`.`stock` (`idgame` , `platform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `egamesSQL`.`stockHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `egamesSQL`.`stockHistory` (
  `stock` VARCHAR(45) NULL,
  `platform` VARCHAR(45) NOT NULL,
  `idgame` INT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` INT UNSIGNED NULL,
  PRIMARY KEY (`idgame`, `date`, `platform`))
ENGINE = InnoDB;

USE `egamesSQL`;

DELIMITER $$
USE `egamesSQL`$$
CREATE DEFINER = CURRENT_USER TRIGGER `egamesSQL`.`stock_AFTER_INSERT` AFTER INSERT ON `stock` FOR EACH ROW
BEGIN
	INSERT INTO stockHistory (idgame,stock,platform,price)
    VALUES (NEW.idgame, NEW.stock, NEW.platform, NEW.price);
END$$

USE `egamesSQL`$$
CREATE DEFINER = CURRENT_USER TRIGGER `egamesSQL`.`stock_AFTER_UPDATE` AFTER UPDATE ON `stock` FOR EACH ROW
BEGIN
	INSERT INTO stockHistory (idgame,stock,platform,price)
    VALUES (NEW.idgame, NEW.stock, NEW.platform, NEW.price);
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema app_english
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema app_english
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `app_english` DEFAULT CHARACTER SET utf8 ;
USE `app_english` ;

-- -----------------------------------------------------
-- Table `app_english`.`detail_kiemtra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`detail_kiemtra` (
  `id_detail_ktra` INT(11) NOT NULL AUTO_INCREMENT,
  `ma_detail_ktra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_detail_ktra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `app_english`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`user` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `ten_user` VARCHAR(200) NOT NULL,
  `tuoi` INT(10) NOT NULL,
  `gioi_tinh` VARCHAR(20) NOT NULL,
  `so_thich` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `app_english`.`bai_kiem_tra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`bai_kiem_tra` (
  `id_bai_ktra` INT(11) NOT NULL AUTO_INCREMENT,
  `ma_bai_ktra` VARCHAR(45) NOT NULL,
  `noi_dung` VARCHAR(500) NOT NULL,
  `loi_giai` VARCHAR(500) NOT NULL,
  `thong_bao` VARCHAR(100) NOT NULL,
  `id_detail_ktra` INT(11) NOT NULL,
  `id_user` INT(11) NOT NULL,
  PRIMARY KEY (`id_bai_ktra`),
  INDEX `fk_bai_kiem_tra_detail_kiemtra1_idx` (`id_detail_ktra` ASC),
  INDEX `fk_bai_kiem_tra_user1_idx` (`id_user` ASC),
  CONSTRAINT `fk_bai_kiem_tra_detail_kiemtra1`
    FOREIGN KEY (`id_detail_ktra`)
    REFERENCES `app_english`.`detail_kiemtra` (`id_detail_ktra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bai_kiem_tra_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `app_english`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `app_english`.`giao_dien_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`giao_dien_user` (
  `id_giao_dien` INT(11) NOT NULL AUTO_INCREMENT,
  `ma_giao_dien` VARCHAR(45) NOT NULL,
  `hinh_anh` VARCHAR(45) NOT NULL,
  `noi_dung` VARCHAR(45) NOT NULL,
  `id_user` INT(11) NOT NULL,
  PRIMARY KEY (`id_giao_dien`),
  INDEX `fk_giao_dien_user_user1_idx` (`id_user` ASC),
  CONSTRAINT `fk_giao_dien_user_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `app_english`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `app_english`.`thong_bao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`thong_bao` (
  `id_thong_bao` INT(11) NOT NULL AUTO_INCREMENT,
  `ma_thong_bao` VARCHAR(45) NOT NULL,
  `ten_thong_bao` VARCHAR(45) NOT NULL,
  `user_id_user` INT(11) NOT NULL,
  PRIMARY KEY (`id_thong_bao`),
  INDEX `fk_thong_bao_user1_idx` (`user_id_user` ASC),
  CONSTRAINT `fk_thong_bao_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `app_english`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `app_english`.`truyen_songngu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`truyen_songngu` (
  `id_truyen` INT(11) NOT NULL AUTO_INCREMENT,
  `ma_truyen` VARCHAR(45) NOT NULL,
  `noi_dung_truyen` VARCHAR(3000) NOT NULL,
  `hinh_anh` VARCHAR(45) NOT NULL,
  `user_id_user` INT(11) NOT NULL,
  PRIMARY KEY (`id_truyen`),
  INDEX `fk_truyen_songngu_user1_idx` (`user_id_user` ASC),
  CONSTRAINT `fk_truyen_songngu_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `app_english`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `app_english`.`kho_tu_moi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app_english`.`kho_tu_moi` (
  `id_tu_moi` INT(11) NOT NULL AUTO_INCREMENT,
  `tu_moi` VARCHAR(100) NOT NULL,
  `phien_am` VARCHAR(100) NOT NULL,
  `hinh_anh` VARCHAR(100) NOT NULL,
  `chu_thich` VARCHAR(500) NOT NULL,
  `tk_user_id_tk` INT(11) NOT NULL,
  `detail_kiemtra_id_detail_ktra` INT(11) NOT NULL,
  `user_id_user` INT(11) NOT NULL,
  `thong_bao_id_thong_bao` INT(11) NOT NULL,
  `truyen_songngu_id_truyen` INT(11) NOT NULL,
  PRIMARY KEY (`id_tu_moi`),
  INDEX `fk_kho_tu_moi_tk_user_idx` (`tk_user_id_tk` ASC),
  INDEX `fk_kho_tu_moi_detail_kiemtra1_idx` (`detail_kiemtra_id_detail_ktra` ASC),
  INDEX `fk_kho_tu_moi_user1_idx` (`user_id_user` ASC),
  INDEX `fk_kho_tu_moi_thong_bao1_idx` (`thong_bao_id_thong_bao` ASC),
  INDEX `fk_kho_tu_moi_truyen_songngu1_idx` (`truyen_songngu_id_truyen` ASC),
  CONSTRAINT `fk_kho_tu_moi_detail_kiemtra1`
    FOREIGN KEY (`detail_kiemtra_id_detail_ktra`)
    REFERENCES `app_english`.`detail_kiemtra` (`id_detail_ktra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kho_tu_moi_thong_bao1`
    FOREIGN KEY (`thong_bao_id_thong_bao`)
    REFERENCES `app_english`.`thong_bao` (`id_thong_bao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kho_tu_moi_tk_user`
    FOREIGN KEY (`tk_user_id_tk`)
    REFERENCES `app_english`.`tk_user` (`id_tk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kho_tu_moi_truyen_songngu1`
    FOREIGN KEY (`truyen_songngu_id_truyen`)
    REFERENCES `app_english`.`truyen_songngu` (`id_truyen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kho_tu_moi_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `app_english`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8  COLLATE=utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

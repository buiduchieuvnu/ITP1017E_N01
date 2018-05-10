-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop_thoitrang` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema shop_thoitrang
-- -----------------------------------------------------
USE `shop_thoitrang` ;

-- -----------------------------------------------------
-- Table `mydb`.`CHUYEN_MUC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`CHUYEN_MUC` (
  `id_CHUYEN_MUC` INT NOT NULL AUTO_INCREMENT,
  `ma_chuyen_muc` VARCHAR(100) NOT NULL,
  `ten_chuyen_muc` VARCHAR(300) NOT NULL,
  `id_chuyen_muc_cha` INT(11) NOT NULL,
  `hinh_anh` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`id_CHUYEN_MUC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TAI_KHOAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`TAI_KHOAN` (
  `id_TAI_KHOAN` INT NOT NULL AUTO_INCREMENT,
  `tai_khoan` VARCHAR(300) NOT NULL,
  `mat_khau` VARCHAR(300) NOT NULL,
  `ho_ten` VARCHAR(300) NOT NULL,
  `ngay_dang_ky` TIME NOT NULL,
  `trang_thai` CHAR(1) NULL DEFAULT 'A',
  PRIMARY KEY (`id_TAI_KHOAN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SAN_PHAM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`SAN_PHAM` (
  `id_SAN_PHAM` INT NOT NULL AUTO_INCREMENT,
  `id_CHUYEN_MUC` INT NOT NULL,
  `id_TAI_KHOAN` INT NOT NULL,
  `ma_san_pham` VARCHAR(45) NOT NULL,
  `ten_san_pham` VARCHAR(200) NOT NULL,
  `hinh_anh` VARCHAR(200) NOT NULL,
  `gia_ban` VARCHAR(300) NOT NULL,
  `trang_thai` CHAR(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_SAN_PHAM`),
  INDEX `fk_SAN_PHAM_CHUYEN_MUC1_idx` (`id_CHUYEN_MUC` ASC),
  INDEX `fk_SAN_PHAM_TAI_KHOAN1_idx` (`id_TAI_KHOAN` ASC),
  CONSTRAINT `fk_SAN_PHAM_CHUYEN_MUC1`
    FOREIGN KEY (`id_CHUYEN_MUC`)
    REFERENCES `shop_thoitrang`.`CHUYEN_MUC` (`id_CHUYEN_MUC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SAN_PHAM_TAI_KHOAN1`
    FOREIGN KEY (`id_TAI_KHOAN`)
    REFERENCES `shop_thoitrang`.`TAI_KHOAN` (`id_TAI_KHOAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DON_HANG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`DON_HANG` (
  `id_DON_HANG` INT NOT NULL AUTO_INCREMENT,
  `id_TAI_KHOAN` INT NOT NULL,
  `ma_don_hang` VARCHAR(100) NOT NULL,
  `ten_don_hang` VARCHAR(300) NOT NULL,
  `tinh_trang` CHAR(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_DON_HANG`),
  INDEX `fk_DON_HANG_TAI_KHOAN1_idx` (`id_TAI_KHOAN` ASC),
  CONSTRAINT `fk_DON_HANG_TAI_KHOAN1`
    FOREIGN KEY (`id_TAI_KHOAN`)
    REFERENCES `shop_thoitrang`.`TAI_KHOAN` (`id_TAI_KHOAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DH_SANPHAM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`DH_SANPHAM` (
  `id_DH_SANPHAM` INT NOT NULL AUTO_INCREMENT,
  `id_DON_HANG` INT NOT NULL,
  `id_SAN_PHAM` INT NOT NULL,
  `so_luong` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`id_DH_SANPHAM`),
  INDEX `fk_DH_SANPHAM_DON_HANG_idx` (`id_DON_HANG` ASC),
  INDEX `fk_DH_SANPHAM_SAN_PHAM1_idx` (`id_SAN_PHAM` ASC),
  CONSTRAINT `fk_DH_SANPHAM_DON_HANG`
    FOREIGN KEY (`id_DON_HANG`)
    REFERENCES `shop_thoitrang`.`DON_HANG` (`id_DON_HANG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DH_SANPHAM_SAN_PHAM1`
    FOREIGN KEY (`id_SAN_PHAM`)
    REFERENCES `shop_thoitrang`.`SAN_PHAM` (`id_SAN_PHAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIN_TUC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`TIN_TUC` (
  `id_TIN_TUC` INT NOT NULL AUTO_INCREMENT,
  `id_TAI_KHOAN` INT NOT NULL,
  `thong_tin_tk` TEXT NOT NULL,
  `san_pham_moi` VARCHAR(500) NOT NULL,
  `san_pham_km` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_TIN_TUC`),
  INDEX `fk_TIN_TUC_TAI_KHOAN1_idx` (`id_TAI_KHOAN` ASC),
  CONSTRAINT `fk_TIN_TUC_TAI_KHOAN1`
    FOREIGN KEY (`id_TAI_KHOAN`)
    REFERENCES `shop_thoitrang`.`TAI_KHOAN` (`id_TAI_KHOAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`KHUYEN_MAI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`KHUYEN_MAI` (
  `id_KHUYEN_MAI` INT NOT NULL AUTO_INCREMENT,
  `ma_khuyenmai` VARCHAR(45) NOT NULL,
  `tien_khuyenmai` VARCHAR(500) NOT NULL,
  `sanpham_khuyenmai` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_KHUYEN_MAI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`KM_SANPHAM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_thoitrang`.`KM_SANPHAM` (
  `id_KM_SANPHAM` INT NOT NULL AUTO_INCREMENT,
  `id_KHUYEN_MAI` INT NOT NULL,
  `id_SAN_PHAM` INT NOT NULL,
  `so_luong` VARCHAR(100) NOT NULL,
  `thoi_gian` TIME NOT NULL,
  `phan_tram_km` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_KM_SANPHAM`),
  INDEX `fk_KM_SANPHAM_KHUYEN_MAI1_idx` (`id_KHUYEN_MAI` ASC),
  INDEX `fk_KM_SANPHAM_SAN_PHAM1_idx` (`id_SAN_PHAM` ASC),
  CONSTRAINT `fk_KM_SANPHAM_KHUYEN_MAI1`
    FOREIGN KEY (`id_KHUYEN_MAI`)
    REFERENCES `shop_thoitrang`.`KHUYEN_MAI` (`id_KHUYEN_MAI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KM_SANPHAM_SAN_PHAM1`
    FOREIGN KEY (`id_SAN_PHAM`)
    REFERENCES `shop_thoitrang`.`SAN_PHAM` (`id_SAN_PHAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Synchronization
-- Generated: 2025-04-18 14:18
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Enrique

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `CarRentalX` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `CarRentalX`.`Clientes` (
  `idCliente` INT(10) NOT NULL,
  `nombreCliente` VARCHAR(45) NULL DEFAULT NULL,
  `apellidoCliente` VARCHAR(45) NULL DEFAULT NULL,
  `emailCliente` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoCliente` INT(15) NULL DEFAULT NULL,
  `tipoIdentificadorCliente` ENUM('dni', 'pasaporte') NULL DEFAULT NULL,
  `identificadorCliente` VARCHAR(10) NULL DEFAULT NULL,
  `licenciaConduccion` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `CarRentalX`.`Vehiculos` (
  `idVehiculo` INT(10) NOT NULL,
  `matricula` VARCHAR(10) NULL DEFAULT NULL,
  `kilometraje` INT(10) NULL DEFAULT NULL,
  `tipoVehiculo` VARCHAR(45) NULL DEFAULT NULL,
  `estadoVehiculo` ENUM('disponible', 'reservado', 'alquilado', 'mantenimiento') NULL DEFAULT NULL,
  `precioDiario` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `CarRentalX`.`Reservas` (
  `idReserva` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATETIME NULL DEFAULT NULL,
  `fechaFinal` DATETIME NULL DEFAULT NULL,
  `estadoReserva` ENUM('tramitando', 'confirmada', 'cancelada', 'finalizada') NULL DEFAULT NULL,
  `idCliente` INT(10) NOT NULL,
  `idVehiculo` INT(10) NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reservas_Clientes_idx` (`idCliente` ASC),
  INDEX `fk_Reservas_Vehiculos1_idx` (`idVehiculo` ASC),
  CONSTRAINT `fk_Reservas_Clientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `CarRentalX`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservas_Vehiculos1`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `CarRentalX`.`Vehiculos` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

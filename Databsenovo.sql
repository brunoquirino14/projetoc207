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
CREATE SCHEMA IF NOT EXISTS `mydbb` DEFAULT CHARACTER SET utf8 ;
USE `mydbb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Treinador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbb`.`Treinador` (
  `idTreinador` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTreinador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pokémon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbb`.`Pokémon` (
  `idPokémon` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Treinador_idTreinador` INT NOT NULL,
  PRIMARY KEY (`idPokémon`, `Treinador_idTreinador`),
  INDEX `fk_Pokémon_Treinador_idx` (`Treinador_idTreinador` ASC),
  CONSTRAINT `fk_Pokémon_Treinador`
    FOREIGN KEY (`Treinador_idTreinador`)
    REFERENCES `mydb`.`Treinador` (`idTreinador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pokédex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbb`.`Pokédex` (
  `idPokédex` INT NOT NULL AUTO_INCREMENT,
  `Nome de dono` VARCHAR(45) NOT NULL,
  `Informações do dono` VARCHAR(45) NOT NULL,
  `Treinador_idTreinador` INT NOT NULL,
  PRIMARY KEY (`idPokédex`, `Treinador_idTreinador`),
  INDEX `fk_Pokédex_Treinador1_idx` (`Treinador_idTreinador` ASC),
  CONSTRAINT `fk_Pokédex_Treinador1`
    FOREIGN KEY (`Treinador_idTreinador`)
    REFERENCES `mydb`.`Treinador` (`idTreinador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atributos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbb`.`Atributos` (
  `idAtributos` INT NOT NULL AUTO_INCREMENT,
  `Ataque` VARCHAR(45) NOT NULL,
  `Defesa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAtributos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pokémon_tem_Habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydbb`.`Pokémon_tem_Habilidades` (
  `Pokémon_idPokémon` INT NOT NULL,
  `Pokémon_Treinador_idTreinador` INT NOT NULL,
  `Atributos_idAtributos` INT NOT NULL,
  PRIMARY KEY (`Pokémon_idPokémon`, `Pokémon_Treinador_idTreinador`, `Atributos_idAtributos`),
  INDEX `fk_Pokémon_has_Habilidades_Habilidades1_idx` (`Atributos_idAtributos` ASC),
  INDEX `fk_Pokémon_has_Habilidades_Pokémon1_idx` (`Pokémon_idPokémon` ASC, `Pokémon_Treinador_idTreinador` ASC),
  CONSTRAINT `fk_Pokémon_has_Habilidades_Pokémon1`
    FOREIGN KEY (`Pokémon_idPokémon` , `Pokémon_Treinador_idTreinador`)
    REFERENCES `mydb`.`Pokémon` (`idPokémon` , `Treinador_idTreinador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokémon_has_Habilidades_Habilidades1`
    FOREIGN KEY (`Atributos_idAtributos`)
    REFERENCES `mydb`.`Atributos` (`idAtributos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

alter table pokémon add MovimentoZ varchar(50) not null;
alter table pokémon drop column MovimentoZ;

insert into treinador(idTreinador,Nome,Endereco) values('1','Bruno','Rua Abacaxi, cidade de Pallet');
insert into treinador(Nome,Endereco) values('Sheldon','Rua da evolucao, cidade de Cerulean');
insert into treinador(Nome,Endereco) values('Carlos','Rua Flores de sakura, cidade de Viridian');
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Mudkip','Àgua',1);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Pachirisu','Elétrico',1);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Pikachu','Elétrico',2);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Bulbasauro','Grama',2);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Aipom','Normal',1);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Lucário','Lutador/Aço',3);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Blaziken','Lutador/Fogo',3);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Urshifu','Lutador/[Trevas/Àgua]',3);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Garchomp','Dragão/Terrestre',3);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Metagross','Aço/Psíquico',3);
insert into pokémon(Nome,Tipo,Treinador_idTreinador) values('Tyranitar','Pedra/Trevas, ',3);

update pokémon
set Tipo = "Normal"
where Treinador_idTreinador = "2";

delete from pokémon
where Treinador_idTreinador=3;

select Nome from Pokémon
where Treinador_idTreinador=2;

select t.Nome AS 'Nome treinador', p.Nome AS 'Nome Pokémon'
from treinador AS t, pokémon AS p
Where t.idTreinador = p.Treinador_idTreinador;

select * from treinador;

select * from pokémon;

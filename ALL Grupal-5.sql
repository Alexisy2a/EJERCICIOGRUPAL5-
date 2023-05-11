CREATE SCHEMA `ejercicio_grupal_5` ;

CREATE TABLE `ejercicio_grupal_5`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `zona_horaria` VARCHAR(45) NOT NULL DEFAULT 'UTC-3',
  `genero` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`));

CREATE TABLE `ejercicio_grupal_5`.`ingreso` (
  `id_ingreso` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `fecha-hora_ingreso` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_ingreso`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
	FOREIGN KEY (`id_usuario`)
	REFERENCES `ejercicio_grupal_5`.`usuario` (`id_usuario`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION);

alter table usuario MODIFY zona_horaria VARCHAR(45) DEFAULT 'UTC-2';

insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (1, 'Sigfried', 'Fulop', 'l42rMf3FySvB', 'UTC-2', 'Male', '8589485554'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (2, 'Gelya', 'Haberfield', 'pGODMu', 'UTC-2', 'Female', '9947205780'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (3, 'Pippa', 'Jodlowski', 'nFthPE', 'UTC-2', 'Female', '4179823834'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (4, 'Cass', 'Harkess', 'OYJ8uZX', 'UTC-2', 'Male', '3196584348'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (5, 'Heall', 'Glabach', 'prpcaf', 'UTC-2', 'Male', '3884460430'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (6, 'Pinchas', 'Bosley', 'fAqUf7jHsgSN', 'UTC-2', 'Male', '2324456458'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (7, 'Guenna', 'Kitchin', 'eKSS6cj', 'UTC-2', 'Female', '3453072757'); 
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_horaria, genero, telefono) values (8, 'Jaymee', 'Eates', '7w7vHOwbYcF', 'UTC-2', 'Female', '2653240262');

INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (1, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (2, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (6, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (8, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (5, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (7, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (4, NOW());
INSERT INTO ingreso (id_usuario, fechahora_ingreso) VALUES (3, NOW());

create table contacto as
SELECT telefono FROM ejercicio_grupal_5.usuario;

ALTER TABLE `ejercicio_grupal_5`.`contacto`
ADD COLUMN `mail` VARCHAR(45) NULL AFTER `telefono`,
ADD PRIMARY KEY (`telefono`),
ADD UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE;

ALTER TABLE `ejercicio_grupal_5`.`usuario`
ADD INDEX `telefono_idx` (`telefono` ASC) VISIBLE;
;
ALTER TABLE `ejercicio_grupal_5`.`usuario`
ADD CONSTRAINT `telefono`
  FOREIGN KEY (`telefono`)
  REFERENCES `ejercicio_grupal_5`.`contacto` (`telefono`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



USE tienda_libros;

-- -----------------------------------------------------
-- Table `tienda_libros`.`nuevo_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_libros`.`nuevo_usuario` (
  `fecha` DATETIME)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

CREATE TRIGGER usuarios_ai AFTER INSERT ON usuario FOR EACH ROW
INSERT INTO tienda_libros.nuevo_usuario (fecha)
VALUES (NOW());

SELECT * FROM nuevo_usuario;
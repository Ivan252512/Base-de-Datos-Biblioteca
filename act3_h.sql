USE tienda_libros;

DROP PROCEDURE IF EXISTS act3h;

DELIMITER //

CREATE PROCEDURE act3h(nombre VARCHAR(45), contrasenia VARCHAR(45))
BEGIN
	INSERT INTO usuario (`idusuario`, `nombre`, `contrasenia`)
	SELECT * FROM (SELECT NULL, nombre, contrasenia) AS tmp
	WHERE NOT EXISTS (
		SELECT nombre FROM usuario WHERE usuario.nombre = nombre
	) LIMIT 1;
END //

CALL act3h("Pepe","unrui4dn");

SELECT * FROM usuario;
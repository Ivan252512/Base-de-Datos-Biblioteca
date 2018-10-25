USE tienda_libros;        

DROP TABLE IF EXISTS tmpserie;
DROP PROCEDURE IF EXISTS act3c;

CREATE TEMPORARY TABLE IF NOT EXISTS tmpserie(usuarios VARCHAR(45),  libros VARCHAR(45));

delimiter //
CREATE PROCEDURE act3c(IN istart INT , IN iend INT)
BEGIN
  WHILE istart < iend DO
    INSERT INTO `tmpserie` (usuarios, libros)
	SELECT 
		usuario.nombre,
        libro.titulo
	FROM
		libro,
		usuario
	WHERE
		libro.idusuario = usuario.idusuario
			AND usuario.idusuario = istart;
    SET istart = istart + 1;
  END WHILE;
END //

CALL act3c(1,21);

SELECT * FROM tmpserie;
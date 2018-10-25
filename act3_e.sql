USE tienda_libros;

DROP TABLE IF EXISTS tmpserie;
DROP PROCEDURE IF EXISTS act3e;

CREATE TEMPORARY TABLE IF NOT EXISTS tmpserie(usuarios VARCHAR(45),  cantLibros INT);

delimiter //
CREATE PROCEDURE act3e(IN istart INT , IN iend INT)
BEGIN
  WHILE istart < iend DO
    INSERT INTO `tmpserie` (usuarios, cantLibros)
	SELECT 
		usuario.nombre,
        COUNT(libro.titulo)
	FROM
		libro,
		usuario
	WHERE
		libro.idusuario = usuario.idusuario
			AND usuario.idusuario = istart;
    SET istart = istart + 1;
  END WHILE;
END //

CALL act3e(1,21);

SELECT * FROM tmpserie;
USE tienda_libros;        

DROP TABLE IF EXISTS tmpserie;
DROP PROCEDURE IF EXISTS act3d;

CREATE TEMPORARY TABLE IF NOT EXISTS tmpserie(subcategoria VARCHAR(45),
                                              cant INT);

delimiter //
CREATE PROCEDURE act3d(IN istart INT , IN iend INT)
BEGIN
  WHILE istart < iend DO
    INSERT INTO `tmpserie` (subcategoria, cant)
	SELECT 
        subcategoria.subcategoria,
        COUNT(subcategoria.subcategoria)
	FROM
		libro,
		usuario,
        libro_has_subcategoria,
        subcategoria
	WHERE
		libro.idusuario = usuario.idusuario
            AND libro_has_subcategoria.idlibro = libro.idlibro
            AND libro_has_subcategoria.idsubcategoria = subcategoria.idsubcategoria
            AND subcategoria.idsubcategoria = istart;
    SET istart = istart + 1;
  END WHILE;
END //

CALL act3d(1,21);

SELECT * FROM tmpserie ORDER BY cant LIMIT 10;
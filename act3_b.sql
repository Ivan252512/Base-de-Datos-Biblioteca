USE tienda_libros;        

DROP TABLE IF EXISTS tmpserie;
DROP PROCEDURE IF EXISTS act3b;

CREATE TEMPORARY TABLE IF NOT EXISTS tmpserie(subcat VARCHAR(45),  cant INT);

delimiter //
CREATE PROCEDURE act3b(IN istart INT , IN iend INT)
BEGIN
  WHILE istart < iend DO
    INSERT INTO `tmpserie` (subcat, cant)
	SELECT 
		subcategoria.subcategoria,
        COUNT(*)
	FROM
		libro,
		libro_has_subcategoria,
		subcategoria
	WHERE
		libro.idlibro = libro_has_subcategoria.idlibro
			AND libro_has_subcategoria.idsubcategoria = subcategoria.idsubcategoria
			AND subcategoria.idsubcategoria = istart;
    
    SET istart = istart + 1;
  END WHILE;
END //

CALL act3b(1,21);

SELECT subcat AS Subcategoría, cant AS Cantidad FROM tmpserie;
USE tienda_libros;

DROP FUNCTION IF EXISTS act3g;

CREATE TEMPORARY TABLE IF NOT EXISTS tmpserie(subcat VARCHAR(45),  cant INT);

DELIMITER //
CREATE FUNCTION act3g(nombre VARCHAR(45), cant INT) RETURNS VARCHAR(45)
BEGIN
	DECLARE istart INT;
	SET istart = 1;   
	WHILE istart < cant DO
	INSERT INTO `tmpserie` (subcat, cant)
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
    SET @catMasVis = ( SELECT subcat FROM tmpserie ORDER BY cant LIMIT 1);
    RETURN @catMasVis;
END //

SELECT act3g("Carlos", 21) AS "Subcategoría más visitada";
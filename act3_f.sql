USE tienda_libros;
SELECT 
    usuario.idusuario AS Identificador,
    usuario.nombre AS Usuario,
    categoria.categoria AS Categoría,
    subcategoria.subcategoria AS Subcategoría 
FROM
	usuario,
    libro,
    libro_has_subcategoria,
    subcategoria,
    categoria
WHERE
	usuario.idusuario = libro.idusuario
		AND libro.idlibro = libro_has_subcategoria.idlibro
        AND libro_has_subcategoria.idsubcategoria = subcategoria.idsubcategoria
        AND subcategoria.idcategoria = categoria.idcategoria
ORDER BY 
	usuario.idusuario;
	
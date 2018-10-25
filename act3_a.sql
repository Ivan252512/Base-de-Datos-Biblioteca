USE tienda_libros;
SELECT 
    libro.idlibro AS Identificador,
    libro.titulo AS Titulo,
    categoria.categoria AS Categoria
FROM
    libro,
    libro_has_subcategoria,
    subcategoria,
    categoria
WHERE
    libro.idlibro = libro_has_subcategoria.idlibro
        AND libro_has_subcategoria.idsubcategoria = subcategoria.idsubcategoria
        AND subcategoria.idcategoria = categoria.idcategoria
	
	
/*SQL Playground - Tienda*/

-- Consultas sencillas
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto
WHERE precio <= 120;

-- 4. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio >= 400;

-- 5. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio < 400;

-- 6. Lista todos los productos que tengan un precio entre 80€ y 300€.
SELECT * FROM producto
WHERE precio BETWEEN 80 AND 300;

-- 7. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto
WHERE precio > 200
AND codigo_fabricante = 6;

-- 8. Lista todos los productos donde el código de fabricante sea 1, 3 o 5.
SELECT * FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

SELECT * FROM producto
WHERE codigo_fabricante IN (1,3,5);

-- 9. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio).
SELECT nombre, precio * 100 FROM producto;

-- 10. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante
WHERE nombre LIKE 'S%';

-- 11. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e';

-- 12. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%';

-- 13. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante
WHERE nombre LIKE '____'; 

-- 14. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;
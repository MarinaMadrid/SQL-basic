/*SQL Playground - Tienda*/

-- Base de datos
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- Consultas sencillas sobre una tabla
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

-- 5. Lista el nombre de los productos que no tienen un precio menor o igual a 400€.
SELECT nombre FROM producto
WHERE precio < 400;

-- 6. Lista todos los productos que tengan un precio entre 80€ y 300€.
SELECT * FROM producto
WHERE precio BETWEEN 80 AND 300;

-- 7. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto
WHERE precio > 200
AND codigo_fabricante = 6;

-- 8.  Lista todos los productos donde el código de fabricante sea 1, 3 o 5.
-- Sin operador IN
SELECT * FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- Otra forma sin operador IN
SELECT * FROM producto
WHERE codigo_fabricante = 1 <> 3 <> 5;

-- Con operador IN
SELECT * FROM producto
WHERE codigo_fabricante IN (1,3,5);

-- 9.  Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio).
-- Sin alias
SELECT nombre, precio * 100 FROM producto;

-- Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 as 'céntimos' FROM producto;

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

/* 15. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
La cuarta fila también se debe incluir en la respuesta.*/
SELECT * FROM fabricante LIMIT 3, 2;

-- 16. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante 
ORDER BY nombre ASC;

-- 17. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante 
ORDER BY nombre DESC;

-- 18.  Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto 
ORDER BY nombre ASC, precio DESC;

/* 19. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).*/
SELECT nombre, precio FROM producto 
WHERE precio>=180 
ORDER BY precio DESC, nombre ASC;

-- 20. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(nombre) FROM producto;

-- 21. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT codigo_fabricante) FROM producto;

-- 22. Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM producto;

-- 23. Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM producto;

-- 24. Calcula el precio más caro de todos los productos.
SELECT MAX(precio) FROM producto;

-- 25. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio FROM producto 
ORDER BY precio ASC LIMIT 1;

-- 26. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto 
ORDER BY precio DESC LIMIT 1;

-- 27. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto; 

-- 28. Calcula la media del precio de todos los productos que tengan un código de fabricante igual a 1.
SELECT AVG(precio) FROM producto 
WHERE codigo_fabricante = 1;

-- 29. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tienen un código de fabricante igual a 6.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(nombre) FROM producto 
WHERE codigo_fabricante = 6;

/* 30. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos para cada uno de los fabricantes. 
No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente. */
SELECT codigo_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM producto 
GROUP BY codigo_fabricante;

/* 31. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente. */
SELECT codigo_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM producto
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200;

-- 32. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(nombre) FROM producto 
WHERE precio >= 180;

-- 33. Lista todas las columnas de la tabla PRODUCTO;
SELECT * FROM producto;

-- 34. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- Sin redondear
SELECT nombre, precio as '€', precio / 0.89 as 'USD' FROM producto;

-- Redondeando
SELECT nombre, precio as '€', ROUND(precio / 0.89, 2) as 'USD' FROM producto;

/* 35. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/
SELECT nombre as 'nombre de producto', precio as 'euros', precio / 0.89 as 'dólares' FROM producto;

-- 36. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;

-- 37. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;

-- 38. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) as siglas
FROM fabricante;

-- 39. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio, 2) FROM producto;

-- 40. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- 41.Lista el código de los fabricantes que tienen productos en la tabla producto.


-- 42. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

-- 43. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

-- 44. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

-- 45. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.

-- 46. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

-- 47. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

-- 48. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

-- 49. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

-- 50. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT DISTINCT COUNT(nombre) FROM fabricante;

-- 51. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

-- 52. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(nombre) FROM producto 
WHERE codigo_fabricante = 1;

-- 53. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) FROM producto 
WHERE codigo_fabricante = 1;

-- 54. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) FROM producto 
WHERE codigo_fabricante = 1;

-- 55. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) FROM producto 
WHERE codigo_fabricante = 1;

-- 56. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) FROM producto 
WHERE codigo_fabricante = 1;

-- 57. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(nombre) FROM producto
WHERE codigo_fabricante = 6;

-- Consultas multitabla (Composición interna)
-- 1. Devuelve una lista el nombre del producto, precio y nombre de fabricante para todos los productos de la base de datos.
SELECT producto.nombre, precio, fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo;

-- 2. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(precio), fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;

-- 3. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT AVG(precio), fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING AVG(precio) >= 150;

-- 4. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

-- 5. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.

-- 6. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

-- 7. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

-- 8. Devuelve una lista de todos los productos del fabricante Lenovo.

-- 9. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

-- 10. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

-- 11. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

-- 12.  Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

-- 13. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

-- 14. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

-- 15. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

-- 16. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.


-- Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.


-- Subconsultas
-- Con operadores básicos de comparación

-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

-- 6.Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

-- Con ALL y ANY
-- 1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

-- 2. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

-- 3. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

-- 4. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).

-- Con IN y NOT IN
-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

-- Con EXISTS y NOT EXISTS

-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

-- Correlacionadas
-- 1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio =
(SELECT MAX(precio)
FROM producto
WHERE codigo_fabricante = fabricante.codigo);

-- 2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

-- 3. ista el nombre del producto más caro del fabricante Lenovo.

-- Con HAVING
-- 1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.


-- Resumen
/*Muestra el número total de productos que tiene cada uno de los fabricantes.
El listado también debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
Ordene el resultado descendentemente por el número de productos.*/

/*Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.*/

/*Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€.
No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.*/

/*Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
Es necesario mostrar el nombre del fabricante.*/

-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.


/*Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.*/

/*Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ 
deberá aparecer en el listado con un valor igual a 0 en el número de productos.*/

-- Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

-- Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.



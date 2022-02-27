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

-- Consultas sencillas
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3.1. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto
WHERE precio <= 120;

-- 3.2. Lista todas las columnas de la tabla PRODUCTO;
SELECT * FROM producto;

-- 4.1. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio >= 400;

-- 4.2. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

-- 5.1. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio < 400;

/* 5.2. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/

-- 6.1. Lista todos los productos que tengan un precio entre 80€ y 300€.
SELECT * FROM producto
WHERE precio BETWEEN 80 AND 300;

-- 6.2. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

-- 7.1. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto
WHERE precio > 200
AND codigo_fabricante = 6;

-- 7.2. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

-- 8.1.  Lista todos los productos donde el código de fabricante sea 1, 3 o 5.
SELECT * FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

SELECT * FROM producto
WHERE codigo_fabricante IN (1,3,5);

-- 8.2. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

-- 9.1.  Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio).
SELECT nombre, precio * 100 FROM producto;

-- 9.2. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

-- 10.1. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante
WHERE nombre LIKE 'S%';

-- 10.2. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

-- 11.1. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e';

-- 11.2.Lista el código de los fabricantes que tienen productos en la tabla producto.

-- 12.1. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%';

-- 12.2. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

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

-- 18.1.  Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto 
ORDER BY nombre ASC, precio DESC;

-- 18.2. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

-- 19.1. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto 
WHERE precio>=180 
ORDER BY precio DESC, nombre ASC;

-- 19.2. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

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


-- Consultas multitabla
-- 1. Lista el nombre del producto, precio y nombre de fabricante para todos los productos de la base de datos.
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


-- Subconsulta
-- Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio =
(SELECT MAX(precio)
FROM producto
WHERE codigo_fabricante = fabricante.codigo);
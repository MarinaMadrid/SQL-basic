/*SQL Playground - Empleados*/

-- Base de datos
DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT UNSIGNED,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

-- Consultas sencillas sobre una tabla
-- 1. Lista el primer apellido de todos los empleados.
SELECT apellido1 FROM  empleado;

-- 2. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT * FROM empleado 
WHERE apellido2 IS NULL;

-- 3. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT * FROM empleado 
WHERE apellido2 IS NOT NULL;

-- 4. Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT * FROM empleado 
WHERE apellido2 = 'López';

-- 5. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno.
SELECT * FROM empleado 
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

-- 6. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT nombre, apellido1, apellido2, nif FROM empleado 
WHERE codigo_departamento = 3;

-- 7. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT nombre, apellido1, apellido2 , nif FROM empleado 
WHERE codigo_departamento IN (2,4,5);

-- 8. Calcula la suma del presupuesto de todos los departamentos.
SELECT SUM(presupuesto) FROM departamento;

-- 9. Calcula la media del presupuesto de todos los departamentos.
SELECT AVG(presupuesto) FROM departamento;

-- 10. Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT MIN(presupuesto) FROM departamento;

-- 11. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.

-- 12. Calcula el valor máximo del presupuesto de todos los departamentos.

-- 13. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.

-- 14. Calcula el número total de empleados que hay en la tabla empleado.

-- 15. Calcula el número de empleados que no tienen NULL en su segundo apellido.

-- 16. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el código del departamento y otra con el número de empleados que tiene asignados.

-- 17. Calcula los códigos de los departamentos que tienen más de 2 empleados.

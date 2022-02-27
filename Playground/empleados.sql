-- Empleados

-- Consultas sencillas
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

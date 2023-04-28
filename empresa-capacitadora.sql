-- CREAMOS BASE DE DATOS
CREATE DATABASE empresa_capacitadora;

-- EJECUTAMOS BASE DE DATOS
USE empresa_capacitadora;

-- CREAMOS LAS TABLAS:
-- Creamos la tabla OPERADORES
CREATE TABLE OPERADORES (
  RUN VARCHAR(12) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  correo_electronico VARCHAR(50) NOT NULL,
  fecha_creacion DATE NOT NULL,
  PRIMARY KEY (RUN)
);

-- Creamos la tabla USUARIOS
CREATE TABLE USUARIOS (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  correo_electronico VARCHAR(50) NOT NULL,
  telefono VARCHAR(12) NOT NULL,
  fecha_creacion DATE NOT NULL,
  PRIMARY KEY (id)
);

-- Creamos la tabla CAPACITACION
CREATE TABLE CAPACITACION (
  codigo_curso INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  horario VARCHAR(50) NOT NULL,
  costo_realizacion INT NOT NULL,
  fecha_realizacion DATE NOT NULL,
  PRIMARY KEY (codigo_curso)
);

-- INSERTAMOS 10 REGISTROS EN LA TABLA OPERADORES
INSERT INTO OPERADORES (RUN, nombre, apellido, direccion, correo_electronico, fecha_creacion)
VALUES
('21563790-3', 'Juan', 'Pérez', 'Calle Falsa 173', 'juan.perez@gmail.com', '2023-04-01'),
('19596784-5', 'María', 'García', 'Avenida Siempreviva 456', 'maria.garcia@hotmail.com', '2023-04-01'),
('15839214-7', 'Pedro', 'González', 'Calle telovendo 789', 'pedro.gonzalez@yahoo.com', '2023-04-01'),
('25957264-0', 'Ana', 'Fernández', 'Avenida Cuatro alamos 012', 'ana.fernandez@gmail.com', '2023-04-01'),
('16843957-3', 'Javier', 'Sánchez', 'Calle Memes 145', 'javier.sanchez@hotmail.com', '2023-04-01'),
('15394633-2', 'Carolina', 'López', 'Siemprealegre 334', 'carolina.lopez@yahoo.com', '2023-04-02'),
('18633232-1', 'Andrés', 'Martínez', 'Calle verdadera 221', 'andres.martinez@gmail.com', '2023-04-02'),
('12465832-6', 'Laura', 'Pérez', 'Avenida Las Condes 234', 'laura.perez@hotmail.com', '2023-04-02'),
('11985743-7', 'Diego', 'García', 'Calle el Mono 567', 'diego.garcia@yahoo.com', '2023-04-02'),
('13986745-4', 'Isabel', 'Fernández', 'El Simon 890', 'isabel.fernandez@gmail.com', '2023-04-02');

-- INSERTAMOS 10 REGISTROS EN LA TABLA USUARIOS
INSERT INTO USUARIOS (nombre, apellido, correo_electronico, telefono, fecha_creacion)
VALUES
('María', 'González', 'maria.gonzalez@gmail.com', '912345685', '2023-01-18'),
('Carlos', 'Pérez', 'carlos.perez@yahoo.com', '912345686', '2023-01-19'),
('Laura', 'Gutiérrez', 'laura.gutierrez@hotmail.com', '912345687', '2023-01-20'),
('Diego', 'Ruiz', 'diego.ruiz@gmail.com', '912345688', '2023-01-21'),
('Ana', 'Sánchez', 'ana.sanchez@yahoo.com', '912345689', '2023-02-22'),
('Javier', 'García', 'javier.garcia@hotmail.com', '912345690', '2023-02-23'),
('Sofía', 'Rodríguez', 'sofia.rodriguez@gmail.com', '912345691', '2023-02-24'),
('Miguel', 'Hernández', 'miguel.hernandez@yahoo.com', '912345692', '2023-03-25'),
('Paula', 'Fernández', 'paula.fernandez@hotmail.com', '912345693', '2023-03-26'),
('Ricardo', 'González', 'ricardo.gonzalez@gmail.com', '912345694', '2023-03-27');

-- INSERTAMOS 10 REGISTROS EN LA TABLA CAPACITACION
INSERT INTO CAPACITACION (codigo_curso, nombre, horario, costo_realizacion, fecha_realizacion)
VALUES
('0001', 'Programación en Java', 'Lunes a viernes de 9:00 a 13:00', 30000, '2023-05-01'),
('0002','Marketing Digital', 'Martes y jueves de 19:00 a 21:00', 12000, '2023-05-05'),
('0003','Gestión de Proyectos', 'Sábados de 10:00 a 14:00', 10000, '2023-05-10'),
('0004','Inglés para negocios', 'Lunes y miércoles de 17:00 a 19:00', 10000, '2023-05-12'),
('0005','Diseño gráfico', 'Lunes y miércoles de 19:00 a 21:00', 10000, '2023-05-15'),
('0006','Finanzas', 'Martes de 19:00 a 21:00', 5000, '2023-05-20'),
('0007','Liderazgo y trabajo en equipo', 'Jueves de 18:00 a 20:00', 7000, '2023-05-23'),
('0008','Programación en JavaScript', 'Lunes a viernes de 15:00 a 19:00', 30000, '2023-05-28'),
('0009','Actividades para Abuelos', 'Miércoles de 17:00 a 19:00', 1000, '2023-05-05'),
('0010','Actividades para Jóvenes', 'Sábados de 16:00 a 20:00', 1000, '2023-05-10');

-- costo de realización de todos los cursos de capacitación registrados.
SELECT SUM(costo_realizacion) CostoTotal FROM CAPACITACION;

-- Muestre los 5 operadores más recientemente registrados.
SELECT nombre, apellido, fecha_creacion
FROM OPERADORES
ORDER BY fecha_creacion DESC
LIMIT 5;

-- Muestre los 5 usuarios más recientemente registrados.
SELECT nombre, apellido, fecha_creacion
FROM USUARIOS
ORDER BY fecha_creacion DESC
LIMIT 5;

-- Calcule cuántos días han transcurrido desde que se registró a operadores y clientes. 
-- Indague en la función DATEDIFF() de MySQL.
-- OPERADORES:
SELECT DATEDIFF(CURDATE(), fecha_creacion) AS dias_transcurridos FROM OPERADORES;
-- USUARIOS:
SELECT DATEDIFF(CURDATE(), fecha_creacion) AS dias_transcurridos FROM USUARIOS;

-- Calcule cuántos días transcurrieron desde que se realizó el último curso de capacitación.
SELECT DATEDIFF(CURDATE(), MAX(fecha_realizacion)) AS dias_desde_ultimo_curso FROM CAPACITACION;
-- Esta consulta entrega un nro negativo (o sea, dias a futuro), ya que aun no se ha realizado la capacitación.

-- Indique cuál fue el curso de capacitación más costoso y el menos costoso.
-- Más costoso
SELECT nombre AS curso_mas_costoso, costo_realizacion AS monto_maximo 
FROM CAPACITACION 
WHERE costo_realizacion = (SELECT MAX(costo_realizacion) FROM CAPACITACION);
-- Menos costoso
SELECT nombre AS curso_menos_costoso, costo_realizacion AS monto_minimo 
FROM CAPACITACION 
WHERE costo_realizacion = (SELECT MIN(costo_realizacion) FROM CAPACITACION);

-- COMPROBAMOS UNA TABLA
SELECT * FROM CAPACITACION;

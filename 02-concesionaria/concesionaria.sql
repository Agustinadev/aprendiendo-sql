CREATE DATABASE IF NOT EXISTS concesionaria;
CREATE TABLE autos(
id int(10) auto_increment NOT NULL,
modelo varchar(100) NOT NULL,
marca varchar(50),
precio int(20) NOT NULL,
stock int(255) NOT NULL,
CONSTRAINT pk_coches PRIMARY KEY(id)
)ENGINE=InnoDB; 

CREATE TABLE grupos(
id int(10) auto_increment NOT NULL,
nombre varchar(100) NOT NULL,
ciudad varchar(100),
CONSTRAINT pk_grupos PRIMARY KEY(id)
)ENGINE=InnoDB; 

CREATE TABLE vendedores(
id int(10) auto_increment NOT NULL,
grupo_id int(10) NOT NULL,
jefe int(10),
nombre varchar(100) NOT NULL,
apellido varchar(100) NOT NULL,
cargo varchar(150),
fecha date,
sueldo float(20, 2),
comision float(10, 2),
CONSTRAINT pk_vendedores PRIMARY KEY(id),
CONSTRAINT fk_vendedor_grupo foreign key(grupo_id) REFERENCES grupos(id),
CONSTRAINT fk_vendedor_jefe foreign key(jefe) REFERENCES vendedores(id)
)ENGINE=InnoDB; 




CREATE TABLE clientes(
id int(10) auto_increment NOT NULL,
vendedor_id int(10),
nombre varchar(100) NOT NULL,
ciudad varchar(100),
gastado float(50,2),
fecha date,
CONSTRAINT pk_clientes PRIMARY KEY(id),
CONSTRAINT fk_cliente_vendedor foreign key(vendedor_id) REFERENCES vendedores(id)
)ENGINE=InnoDB; 


CREATE TABLE encargos(
id int(10) auto_increment NOT NULL,
cliente_id int(10) NOT NULL,
auto_id int(10) NOT NULL,
cantidad int(100),
fecha date,
CONSTRAINT pk_cencargos PRIMARY KEY(id),
CONSTRAINT fk_encargo_cliente foreign key(cliente_id) REFERENCES clientes(id),
CONSTRAINT fk_encargo_auto foreign key(auto_id) REFERENCES autos(id)
)ENGINE=InnoDB;





##----------------------------------------------------AUTOS
INSERT INTO autos VALUES (null, 'Clio', 'Renault', 12000, 130);
INSERT INTO autos VALUES (null, 'Laguna', 'Renault', 10000, 230);

INSERT INTO autos VALUES (null, '207', 'Peugeot', 14000, 150);
INSERT INTO autos VALUES (null, '408', 'Peugeot', 16000, 350);

INSERT INTO autos VALUES (null, 'Echosport', 'Ford', 20000, 550);
INSERT INTO autos VALUES (null, 'Kuga', 'Ford', 17000, 150);

INSERT INTO autos VALUES (null, 'Corolla', 'Toyota', 21000, 400);
INSERT INTO autos VALUES (null, 'Camry', 'Toyota', 11000, 243);

INSERT INTO autos VALUES (null, 'Onix', 'Chevrolet', 12560, 20);
INSERT INTO autos VALUES (null, 'Cruze', 'Chevrolet', 16200, 640);

##------------------------------------------------------------------GRUPOS
INSERT INTO grupos VALUES (null, 'Vendedores A', 'Córdoba');
INSERT INTO grupos VALUES (null, 'Vendedores B', 'Buenos Aires');
INSERT INTO grupos VALUES (null, 'Vendedores C', 'San Juan');
INSERT INTO grupos VALUES (null, 'Vendedores A', 'Catamarca');
INSERT INTO grupos VALUES (null, 'Vendedores B', 'Córdoba');
INSERT INTO grupos VALUES (null, 'Vendedores C', 'Santa Fe');
INSERT INTO grupos VALUES (null, 'Directores mecánicos', 'Buenos Aires');
INSERT INTO grupos VALUES (null, 'Directores mecánicos', 'Córdoba');

##----------------------------------------------------------------VENDEDORES
INSERT INTO vendedores VALUES (null, 1, null, 'David', 'Herrera', 'Responsable de tienda', CURDATE(), 30000, 4);
INSERT INTO vendedores VALUES (null, 1, 1, 'Martina', 'Campos', 'Ayudante de tienda', CURDATE(), 25000, 4);
INSERT INTO vendedores VALUES (null, 2, null, 'Claudio', 'Lopez', 'Responsable de tienda', CURDATE(), 30000, 4);
INSERT INTO vendedores VALUES (null, 2, 3, 'Cristian', 'Valentin', 'Mecánico Jefe', CURDATE(), 20000, 4);
INSERT INTO vendedores VALUES (null, 3, null, 'Jorge', 'Valentin', 'Vendedor de Recambio', CURDATE(), 18000, 4);
INSERT INTO vendedores VALUES (null, 4, null, 'Pedro', 'Loyola', 'Vendedor experto', CURDATE(), 24000, 4);
INSERT INTO vendedores VALUES (null, 5, null, 'Sergio', 'Álvarez', 'Ejecutivo de cuentas', CURDATE(), 40000, 4);
INSERT INTO vendedores VALUES (null, 6, null, 'Esperanza', 'Maenza', 'Ayudante de tienda', CURDATE(), 25000, 4);
INSERT INTO vendedores VALUES (null, 6, 8, 'Lucia', 'Vianco', 'Mecánico experto', CURDATE(), 28000, 4);

SELECT * FROM encargos;
##--------------------------------------------------------------------CLIENTES
##Numero del cliente, quién le vendió, nombre del comprador, ciudad, gasto total, fecha de compra
INSERT INTO clientes VALUES (null, 1, 'Construcciones Diaz', 'Córdoba', '14000', CURDATE());
INSERT INTO clientes VALUES (null, 2, 'Máximo Lopez', 'Buenos Aires', '32000', CURDATE());
INSERT INTO clientes VALUES (null, 6, 'Mariano Ramos', 'Santa Fe', '21000', CURDATE());
INSERT INTO clientes VALUES (null, 5, 'Imprenta de Córdoba', 'Córdoba', '12560', CURDATE());
INSERT INTO clientes VALUES (null, 3, 'Imprenta de San Juan', 'San Juan', '20000', CURDATE());
INSERT INTO clientes VALUES (null, 4, 'Sol Perez', 'Catamarca', '20000', CURDATE());
INSERT INTO clientes VALUES (null, 4, 'Ciruela', 'Buenos Aires', '28000', CURDATE());
INSERT INTO clientes VALUES (null, 6, 'Romi', 'Buenos Aires', '28000', CURDATE());

##-------------------------------------------------------------ENCARGO
##--null, cliente, tipo de auto, y cuantos compró
INSERT INTO encargos VALUES (null, 1, 1, 1, CURDATE());
INSERT INTO encargos VALUES (null, 2, 4, 2, CURDATE());
INSERT INTO encargos VALUES (null, 3, 7, 1, CURDATE());
INSERT INTO encargos VALUES (null, 4, 9, 1, CURDATE());
INSERT INTO encargos VALUES (null, 5, 5, 1, CURDATE());
INSERT INTO encargos VALUES (null, 6, 5, 1, CURDATE());
INSERT INTO encargos VALUES (null, 7, 3, 2, CURDATE());
INSERT INTO encargos VALUES (null, 1, 2, 2, CURDATE());

##EJERCICIOS 
##modificar la comision de los vendedores y ponerla al 2% cuando ganen más de 25.000
SELECT * FROM vendedores;
UPDATE vendedores SET comision = 2 WHERE sueldo >= 25000;

##aumentar en un 2% el precio de los autos
UPDATE autos SET precio = precio*1.05;
SELECT * FROM autos;

##sacar a todos los vendedores cuya fecha de alta sea posterior al 20 de mayo de 2021
##cambiar fecha para hacer el ejercicio más entendible
UPDATE vendedores SET fecha = '2021-6-28' WHERE id = 1;
UPDATE vendedores SET fecha = '2021-3-14' WHERE id = 4;
SELECT fecha, nombre FROM vendedores WHERE fecha >= '2021-5-20';

##mostrar todos los vendedores con su nombre y el numero de dias que llevan en la concesionaria
SELECT nombre,  DATEDIFF(CURDATE(),fecha) FROM vendedores;


##actualizar el nombre y apellido de los vendedores en una misma columna, su fecha de registro y el dia de la semana en que se registraron
SELECT CONCAT(nombre , ' ' , apellido) AS 'nombre y apellido', fecha, DAYNAME(fecha) AS 'dia de la semana' FROM vendedores;

##mostrar el nombre y el salario de los vendedores con el cargo de ayudante de tienda
SELECT nombre, sueldo FROM vendedores WHERE cargo LIKE 'Ayudante de tienda';
SELECT nombre, sueldo FROM vendedores WHERE cargo =  'Ayudante de tienda';

##visualizar todos los coches en cuya marca exista la letra A y cuyo modelo empiece en C
SELECT modelo, marca FROM autos WHERE modelo LIKE '%c%' AND marca LIKE '%a%';

##mostrar todos los vendedores del grupo numero dos ordenados por salario de mayor a menor
SELECT nombre, grupo_id, sueldo FROM vendedores WHERE grupo_id = 2 ORDER BY sueldo desc; 

##apellidos de los vendedores, fecha y numero de grupo, ordenado por fecha desc, mostrar los 4 ultimos
SELECT apellido, fecha, grupo_id FROM vendedores ORDER BY fecha desc LIMIT 4;

##todos los cargos y decir cuantos hay de cada uno
SELECT cargo, COUNT(cargo) AS 'cuantos hay de cada uno' FROM vendedores GROUP BY cargo;

##conseguir la masa salarial (todos los salarios juntos)
SELECT SUM(sueldo) FROM vendedores;

##sacar la media de los sueldos de los vendedores por grupo
SELECT ROUND(AVG(sueldo)), grupo_id FROM vendedores GROUP BY grupo_id;
##el mismo pero mostrando el nombre de cada grupo
SELECT ROUND(AVG(sueldo)), grupo_id, g.nombre FROM vendedores
INNER JOIN grupos g ON grupo_id = g.id
 GROUP BY grupo_id;
 
 
 ##visualizar las unidades totales vendidas de cada coche a cada cliente, mostrando el nombre del producto, nombre del cliente y suma de unidades
 SELECT cantidad, SUM(cantidad) AS 'suma de cant', auto_id, a.modelo, c.nombre FROM encargos e
 INNER JOIN autos a ON auto_id = a.id
 INNER JOIN clientes c ON cliente_id = c.id
 GROUP BY e.auto_id;
 
 ##mostar los clientes que más pedidos han hecho y mostrar cuantos hicieron
 SELECT cliente_id, SUM(cantidad) FROM encargos GROUP BY cliente_id ORDER BY cantidad DESC;
 
##obtener listado de clientes atendidos por cristian
SELECT nombre FROM clientes WHERE vendedor_id = 4; 

SELECT nombre FROM clientes WHERE vendedor_id IN 
(SELECT id FROM vendedores WHERE nombre = 'cristian' AND apellido = 'valentin'); 
 
 
 ##obtener listados con los encargos del cliente
SELECT e.cliente_id, e.cantidad, c.nombre, a.modelo FROM encargos e 
INNER JOIN clientes c ON e.cliente_id = c.id
INNER JOIN autos a ON e.auto_id = a.id
 WHERE cliente_id IN(SELECT id FROM clientes WHERE nombre = 'Construcciones diaz'); 

 
##listar los clientes que hayan encargado un auto Corolla
SELECT * FROM encargos WHERE auto_id IN(SELECT id FROM autos WHERE modelo = 'Corolla');


##obtener los vendedores con dos o más clientes
SELECT nombre FROM vendedores WHERE id IN(SELECT vendedor_id FROM clientes 
GROUP BY vendedor_id HAVING COUNT(vendedor_id) > 1); 



##obtener los nombres y ciudades de los clientes con encargos con 2 unidades
SELECT id, nombre, ciudad FROM clientes WHERE id IN (SELECT cliente_id FROM encargos WHERE cantidad = 2);


##mostrar listado de clientes (numero de cliente y el nombre) numero de vendedor y su nombre
SELECT c.id, c.nombre, c.vendedor_id, v.nombre AS 'nombre de vendedor' FROM clientes c
INNER JOIN vendedores v ON c.vendedor_id =  v.id; 

##listar todos los encargos realizados con la marca y el nombre del cliente
SELECT e.id, a.marca, c.nombre FROM encargos e 
INNER JOIN autos a ON e.auto_id = a.id
INNER JOIN clientes c ON e.cliente_id = c.id;


##listar los encargos con el nombre del coche, el del cliente y el de la ciudad, pero solo si son de cordoba
SELECT e.id, a.modelo, c.nombre, c.ciudad FROM encargos e 
INNER JOIN autos a ON e.auto_id = a.id
INNER JOIN clientes c ON e.cliente_id = c.id WHERE c.ciudad = 'Córdoba';


##obtener una lista de los nombres de los clientes con el importe de sus encargos acumulados
SELECT c.nombre, c.gastado FROM clientes c;

SELECT ci.nombre, SUM(precio*cantidad), ci.gastado FROM clientes ci
INNER JOIN encargos en ON ci.id = en.cliente_id 
INNER JOIN autos au ON en.auto_id = au.id
GROUP BY ci.nombre;

##sacar vendedores que tienen jefe y sacar nombre del jefe
SELECT v.nombre AS 'nombre vendedor', j.nombre AS 'nombre jefe' FROM vendedores v
INNER JOIN vendedores j ON j.jefe = v.id;


##visitar los nombres de los clientes y la cantidad de encargos realizados, 
##incluyendo los que no hayan realizado encargos
SELECT nombre, COUNT(e.cliente_id) FROM clientes c
LEFT JOIN encargos e ON e.cliente_id = c.id
GROUP BY e.cliente_id;


##listar los vendedores y el numero de clientes. se deben mostrar tengan o no clientes
SELECT v.id, v.nombre, v.apellido, COUNT(c.id) FROM vendedores v
LEFT JOIN clientes c ON c.vendedor_id = v.id
GROUP BY v.nombre;


##una vista llamada vendedores a que incluira todos los vendedores del grupo vendedores a
CREATE VIEW vendedoresA AS
SELECT * FROM vendedores WHERE grupo_id IN(SELECT id FROM grupos WHERE nombre = 'Vendedores A') ;
SELECT * FROM vendedoresA;

##mostrar los datos del vendedor con mas antiguedad en la concesionaria
SELECT * FROM vendedores WHERE DATEDIFF(fecha, CURDATE()) ORDER BY fecha LIMIT 1; 


##30 plus OBTENER EL COCHE CON MAS UNIDADES VENDIDAS
SELECT a.id, a.modelo, MAX(e.cantidad)  FROM autos a
INNER JOIN encargos e ON e.auto_id = a.id
 WHERE a.id IN(SELECT auto_id FROM encargos WHERE cantidad IN(SELECT MAX(cantidad) FROM encargos)) GROUP BY a.id;

SELECT * FROM encargos;

##FIN DE LOS EJERCICIOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
##OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
##OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
##OOOOOOOS


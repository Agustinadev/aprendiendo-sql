CREATE TABLE usuarios(
  id int(15) auto_increment not null,
  nombre varchar(40) not null,
  apellido varchar(40) not null,
  email varchar(50) not null,
  contraseña varchar(30) not null,
  CONSTRAINT pk_usuarios PRIMARY KEY(id),
  CONSTRAINT u_email UNIQUE(email)
)
ALTER TABLE usuarios ADD fecha date null;


CREATE TABLE categorias(
  id int(15) auto_increment not null,
  nombre varchar(40) not null,
  CONSTRAINT pk_categorias PRIMARY KEY(id)
);

--entrada que contiene los id de usuarios y categorias
CREATE TABLE entradas(
  id int(15) auto_increment not null,
  usuarios_id int(15) not null,
  categorias_id int(15) not null,
  descripcion varchar(40)  null,
  CONSTRAINT pk_entradas PRIMARY KEY(id),
  CONSTRAINT pk_entradas_usuarios FOREIGN KEY(usuarios_id) REFERENCES usuarios(id),
  CONSTRAINT pk_entradas_categorias FOREIGN KEY(categorias_id) REFERENCES categorias(id)
  --para que se actualicen
  --CONSTRAINT pk_entradas_categorias FOREIGN KEY(categorias_id) ON UPDATE CASCADE
)

---constraint agregadas
ALTER TABLE entradas ADD CONSTRAINT pk_entradas_categ_casc FOREIGN KEY(categorias_id) REFERENCES categorias(id) ON DELETE CASCADE



--para ver los registros de la tabla
SELECT * FROM usuarios;


--llenar los campos de un registro
INSERT INTO usuarios VALUES(null, "nanicho", "picho", "nanicho@picho", "contraseñapichisima2", "2004-02-10");
INSERT INTO usuarios VALUES(null, "ciruela", "picho", "ciruela@ciruela", "contraseñapichisimadeciruela", "2021-05-21");
INSERT INTO usuarios VALUES(null, "fiona", "pilla", "fiona@fiona", "contraseñapichisimadefiona", "2013-05-14");
INSERT INTO usuarios VALUES(null, "romi", "pilla", "romi@romi", "contraseñapichisimaderomi", "2015-09-21");
INSERT INTO usuarios VALUES(null, "alguien", "muydoco", "doco@a", "1223", "2013-09-21");
-- INSERT INTO categorias VALUES(null, "Ciencias")
-- INSERT INTO entradas VALUES(null, "usuarios_id", "categorias_id", "descripciokm")
-- INSERT INTO usuarios(id, nombre) VALUES(null, "usuarios_id")


--operadores aritmeticos
SELECT email , (4+5) AS "operacionmate" FROM usuarios;
SELECT (4+5) AS "operacionmate" FROM usuarios;
--alterar los valores
SELECT id, email , (id+5) AS "operacionmate" FROM usuarios ORDER BY id ASC;
--que te redondee un punto flotante y el 2 es la cant de numeros decimales
SELECT email, ROUND(2.3932, 2) AS "operacionmate" FROM usuarios;
--que te redondee un punto flotante para arriba
SELECT email, CEIL(2.4) AS "operacionmate" FROM usuarios;
--que te redondee un punto flotante para abajo
SELECT email, FLOOR(2.4) AS "operacionmate" FROM usuarios;
--NUMERO ALEATORIO
SELECT email, RAND() AS "operacionmate" FROM usuarios;
--PI
SELECT email, PI() AS "operacionmate" FROM usuarios;
--valor absoluto
SELECT ABS(3.454) AS "operacionmate" FROM usuarios;
--esto sirve para elegir la cant de decimales
SELECT TRUNCATE(3.454, 1) AS "operacionmate" FROM usuarios;



--operadores de texto
--para pasar a mayusculas 
SELECT nombre, UPPER(nombre) AS "upper" FROM usuarios;
--para concatenar los valores
SELECT nombre, apellido, CONCAT(nombre , ' ' , apellido) AS "concatenar" FROM usuarios;
--para sacar longitud
SELECT  LENGTH(CONCAT(nombre , ' ' , apellido)) AS "concatenar" FROM usuarios;
--elmina o no toma en cuenta los espacios en blanco, el trim
SELECT  TRIM(CONCAT('   ' , nombre,  '  ' , apellido,'   ')) AS "concatenar" FROM usuarios;
--sacar fecha actual
SELECT  CURDATE() AS "concatenar" FROM usuarios;
--sacar resta del dia que puso el usuario y el dia actual
SELECT  DATEDIFF(fecha, CURDATE()) AS "datediff" FROM usuarios;
--sacar nombre del dia
SELECT  DAYNAME(fecha) AS "dayname" FROM usuarios;
--sacar nombre del mes
SELECT  DAYOFMONTH(fecha) AS "dayofmonth" FROM usuarios;
--sacar numero de la semana
SELECT  DAYOFWEEK(fecha) AS "dayofweek" FROM usuarios;
--sacar numero de la semana
SELECT  MONTH(fecha) AS "MONTH" FROM usuarios;
--sacar numero de la semana
SELECT  YEAR(fecha) AS "YEAR" FROM usuarios;
--sacar numero de la semana
SELECT  DAY(fecha) AS "DAY" FROM usuarios;
--TAMBIEN HAY DE MINUTOS Y SEGUNDOS, CURTIME TE SACA LA HORA ACTUAL.
--SYSDATE(hora actual del sistema) 
--DATE_FORMAT(es para cambiar el formato quedaria: fecha, "%d-%m-%y")

--devuelve 0 como false y 1 como true, si esta null o no
SELECT  ISNULL(fecha) AS "DAY" FROM usuarios;
--pregunta si son diferentes, al ser iguales devuelve 0
SELECT  STRCMP('HOLA', 'HOLA') AS "HOLA, HOLA" FROM usuarios;

--VERSION() solo para sacar la version y tiene que estar dentro de consultas si o si
 
--te saca el usuario
SELECT  USER() AS "users" FROM usuarios;
--y si son iguales, te saca solo uno
SELECT  DISTINCT USER() AS "user" FROM usuarios;
--saca base de datos
SELECT  DISTINCT DATABASE() AS "user" FROM usuarios;
--si esta vacio el campo, aparece un mensaje 
SELECT  IFNULL(fecha, 'este campo esta vacio') AS "vacio" FROM usuarios;

--operadores condicionales BETWEEN, IN, IS NOT NULL, LIKE, NOT LIKE
SELECT * FROM usuarios WHERE email = "agustina@valentin.com";


--EJEMPLOS
--1- sacar los nombres y apellidos de los registros que se hayan registrado en 2004
SELECT nombre, apellido FROM usuarios WHERE YEAR(fecha) = 2004;
--1- sacar los nombres y apellidos de los registros que NO se hayan registrado en 2004 o que presenten una fecha nula
SELECT nombre, apellido FROM usuarios WHERE YEAR(fecha) != 2004 OR ISNULL(fecha);
--mostrar email de los usuarios que en sus apellidos aparaca la letra A y contraseña 1234
SELECT email FROM usuarios WHERE apellido LIKE '%a%';
SELECT email FROM usuarios WHERE apellido LIKE '%a%' AND contraseña = "contraseñapilla";
SELECT email FROM usuarios WHERE (YEAR(fecha)%2 = 0);
--COMODINES PARA LIKE: 
--cualquier cantidad de caracteres (%),
--caracter desconocido (_),


--cuaundo nombre tenga mas de 5 letras y que su fecha sea menor a 2020
SELECT UPPER(nombre) AS 'nombre' FROM usuarios WHERE LENGTH(nombre) > 5 AND YEAR (fecha) < 2020;
--usando limit y order by
SELECT nombre FROM usuarios LIMIT 2, 4;


--actualizar
UPDATE usuarios SET apellido = 'godoy' WHERE nombre = 'fiona';
--borrar
DELETE FROM usuarios WHERE contraseña = 'doco';





INSERT INTO categorias VALUES(null, 'cocina');
INSERT INTO categorias VALUES(null, 'terror');
INSERT INTO categorias VALUES(null, 'sinentradas');


INSERT INTO entradas VALUES(null, 1, 1, 'una tortaaa');
INSERT INTO entradas VALUES(null, 1, 2, 'un fantasma');
INSERT INTO entradas VALUES(null, 2, 1, 'un flan');
INSERT INTO entradas VALUES(null, 2, 2, 'un monstruo');
INSERT INTO entradas VALUES(null, 3, 1, 'un alfajor');
INSERT INTO entradas VALUES(null, 3, 2, 'un cocodriloo');

INSERT INTO entradas VALUES(null, 3, 3, 'terrordeverdas');




--AGRUPAMIENTO
--AVG = promedio
SELECT AVG(id) FROM entradas;
--SUM = suma
SELECT SUM(id) FROM entradas;
--MAX = numero maximo 
SELECT MAX(id) AS 'max', descripcion FROM entradas;
SELECT id, descripcion FROM entradas WHERE id = (SELECT MAX(id) FROM entradas);
--MIN = numero minimo
SELECT MIN(id) AS 'min', descripcion FROM entradas;
--COUNT = un conteo
SELECT count(descripcion), categorias_id FROM entradas GROUP BY categorias_id HAVING COUNT(descripcion) = 2;
--La instruccion HAVING es como un WHERE pero de peticiones de agrupamiento

--una subconsulta es una consulta dentro de otra, se puede usar si tenes WHERE o HAVING
SELECT nombre FROM usuarios WHERE id IN (SELECT usuarios_id FROM entradas);
SELECT usuarios_id FROM entradas

--mostrar todos los usuarios que tengan en su titulo "ta"
SELECT nombre, apellido FROM usuarios WHERE id IN (SELECT usuarios_id FROM entradas WHERE descripcion LIKE '%ta%');

--sacar todos los usuarios de categoria cocina
SELECT descripcion, usuarios_id, categorias_id FROM entradas WHERE categorias_id IN (SELECT id FROM categorias WHERE nombre LIKE 'cocina');

--mostrar las categorias con mas de 3 entradas
SELECT nombre FROM categorias WHERE id IN (SELECT categorias_id FROM entradas GROUP BY categorias_id HAVING COUNT(categorias_id) > 1);

--mostrar usuarios que crearon una entrada un dia martes
SELECT nombre, id FROM usuarios WHERE id IN (SELECT usuarios_id FROM entradas WHERE DAYNAME(fecha) LIKE 'tuesday');

--mostrar nombre del usuario con mas entradas
SELECT nombre FROM usuarios WHERE id =(
SELECT usuarios_id FROM entradas GROUP BY usuarios_id ORDER BY COUNT(usuarios_id) desc LIMIT 1);

--mostrar categorais sin entradas
SELECT nombre FROM categorias
  WHERE id NOT IN 
  (SELECT categorias_id FROM entradas);


--CONSULTAS MULTITABLAS
SELECT e.usuarios_id, u.id, e.id AS 'enumerar entradas', e.descripcion, u.nombre AS 'autor', c.nombre AS 'categoria' 
FROM entradas e, usuarios u, categorias c
WHERE e.usuarios_id = u.id AND e.categorias_id = c.id;

--INNER JOIN (para optimizar el codigo)
SELECT e.usuarios_id, u.id, e.id AS 'enumerar entradas', e.descripcion, u.nombre AS 'autor', c.nombre AS 'categoria' 
FROM entradas e
INNER JOIN usuarios u ON e.usuarios_id = u.id
INNER JOIN categorias c ON e.categorias_id = c.id






--mostra elnombre de las categorias y cauntas entradas tienen
SELECT c.nombre, COUNT(e.categorias_id) FROM categorias c, entradas e WHERE e.categorias_id = c.id GROUP BY e.categorias_id;

--mostrar el email de los usuarios y al lado cuantas entradas tienen
SELECT u.email, COUNT(e.usuarios_id) FROM usuarios u, entradas e WHERE e.usuarios_id = u.id GROUP BY e.usuarios_id;


--LEFT JOIN
SELECT c.nombre, COUNT(e.id) FROM categorias c LEFT JOIN entradas e ON categorias_id = c.id GROUP BY e.categorias_id;

--si o si tienen que tener un ON 

--RIGHT JOIN
SELECT c.nombre, e.id FROM entradas e RIGHT JOIN categorias c ON e.categorias_id = c.id;
Fionaromi11#

--vistas: referencia o tabla virtual de una consulta que se actualiza sola 7 se llama como una 
CREATE VIEW primera_vista AS 
SELECT c.nombre, COUNT(e.id) FROM categorias c LEFT JOIN entradas e ON categorias_id = c.id GROUP BY e.categorias_id;











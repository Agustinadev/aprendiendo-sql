CREATE TABLE usuarios (
  id int(15) auto_increment not null,
  names varchar(60) not null,
  surnames  varchar(60) not null,
  email varchar(100)not null,
  passwords varchar(50) not null,
  CONSTRAINT pk_usuarios PRIMARY KEY(id),
  CONSTRAINT u_email  UNIQUE(email)
);

-- alter tables
--para cambiarle el nombre a la tabla
ALTER TABLE usuarios RENAME TO users;

--para agregar una columna
ALTER TABLE users ADD website varchar(50) not null;

--para cambiarle el nombre y los valores a las columnas
ALTER TABLE users CHANGE website websites varchar(50) null;

--para cambiarle las propiedades (no nombre) a las columnas
ALTER TABLE users MODIFY websites varchar(35);

--para borrar columnas
ALTER TABLE users ADD age int(3) null;
ALTER TABLE users DROP age;


--quise crear de nuevo "age"
ALTER TABLE users ADD age int(3) null;


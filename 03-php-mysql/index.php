<?php
// Conectar a la base de dato
$conexion = mysqli_connect('localhost', 'root', '', 'php-mysql');

//Comprobar si la conexión es correcta
if(mysqli_connect_errno()){
  echo 'La conexión a la base de datos ha fallado :'.mysqli_connect_error();
}else {
  echo "Conexión lograda correctamente";
}

//Consulta para configurar la codificacion de caracteres (BASICAMENTE PARA TENER Ñ o tildes)
mysqli_query($conexion, "SET NAMES 'utf8'");

//Consulta SELECT desde PHP
$query = mysqli_query($conexion, "SELECT * FROM notas");



while ($nota = mysqli_fetch_assoc($query)) {
  var_dump($nota);
  echo $nota['color'];
}

//como insertar en php sql
$insert = mysqli_query($conexion, "INSERT INTO notas VALUES(null, 'I dont like the sports', 'I hate them', 'violet')");

if ($insert) {
 echo 'enviado correctamente';
} else {
  echo 'error: ' . mysqli_error($conexion);
}





?>
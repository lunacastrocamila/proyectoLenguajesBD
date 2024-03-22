<?php
$servername = "localhost"; 
$usuario = "ufidelitas2024"; 
$contraseña = "12345"; 
$database = "Base_Datos"; 

$conn = new mysqli($servername, $usuario, $contraseña, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} else {
    echo "Conexión exitosa";
}

$conn->close();
?>
 
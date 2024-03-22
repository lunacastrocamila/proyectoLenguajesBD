<?php
$tns = "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SID=SID)))";
$usuario = "ufidelitas2024";
$contraseña = "12345";

$conn = oci_connect($usuario, $contraseña, $tns);

if (!$conn) {
    $error = oci_error();
    die("Error de conexión: " . $error['message']);
} else {
    echo "Conexión exitosa";
}

?>
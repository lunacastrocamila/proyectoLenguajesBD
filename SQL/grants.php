<?php
require_once 'conexionBD.php';

$sqlStructure = file_get_contents('BD.sql');
if ($conn->multi_query($sqlStructure) === TRUE) {
    echo "Base de datos ejecutada correctamente";
} else {
    echo "Error al ejecutar la base de datos: " . $conn->error;
}

$sqlPrivileges = file_get_contents('grants.sql');
if ($conn->multi_query($sqlPrivileges) === TRUE) {
    echo "Grants ejecutados correctamente";
} else {
    echo "Error al ejecutar grants: " . $conn->error;
}


$conn->close();
?>

<?php
require_once 'conexion.php'; 

$sqlStructure = file_get_contents('BD.sql');
if ($conn->multi_query($sqlStructure) === TRUE) {
    echo "Base de datos ejecutada correctamente";
} else {
    echo "Error al ejecutar base de datos: " . $conn->error;
}

$sqlPrivileges = file_get_contents('grants.sql');
if (oci_parse($conn, $sqlPrivileges)) {
    oci_execute($sqlPrivileges);
    echo "Grants ejecutados correctamente";
} else {
    echo "Error al ejecutar grants: " . oci_error($conn);
}


oci_close($conn);
?>

<?php

require_once 'conexion.php';

$tns = "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SID=SID)))";
$usuario = "ufidelitas2024";
$contraseña = "12345";
$connOracle = oci_connect($usuario, $contraseña, $tns);

if (!$connOracle) {
    $error = oci_error();
    die("Error de conexión Oracle: " . $error['message']);
}

$sqlStructure = file_get_contents('BD.sql');
$statementStructure = oci_parse($connOracle, $sqlStructure);
if (oci_execute($statementStructure)) {
    echo "Base de datos ejecutada correctamente";
} else {
    echo "Error al ejecutar base de datos: " . oci_error($statementStructure);
}

$sqlPrivileges = file_get_contents('grants.sql');
$statementPrivileges = oci_parse($connOracle, $sqlPrivileges);
if (oci_execute($statementPrivileges)) {
    echo "Grants ejecutado correctamente";
} else {
    echo "Error al ejecutar grants: " . oci_error($statementPrivileges);
}

oci_close($connOracle);
?>

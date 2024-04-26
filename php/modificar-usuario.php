<?php
session_start();

// URL de la API local
$api_url = 'http://localhost:5000/consultar_oracle';

// Función para hacer la solicitud a la API
function call_api($url) {
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($curl);
    curl_close($curl);
    return json_decode($response, true);
}

// Verificar si se están enviando datos a través de POST y si se proporcionó el ID del usuario
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['usuario']) && isset($_POST['nombre']) && isset($_POST['apellido1']) && isset($_POST['apellido2']) && isset($_POST['contrasena']) && isset($_POST['rol'])) {
    // Obtener datos del formulario
    $id = $_POST['usuario'];
    $nombre = $_POST['nombre'];
    $apellido1 = $_POST['apellido1'];
    $apellido2 = $_POST['apellido2'];
    $contrasena = $_POST['contrasena'];
    $rol = $_POST['rol'];

    // Construir la consulta UPDATE para modificar el usuario existente, incluyendo la contraseña
    $query_sql = "UPDATE Usuario SET USUARIO = '$nombre', APELLIDO1USER = '$apellido1', APELLIDO2USER = '$apellido2', CONTRASEÑA = '$contrasena', ID_ROL = '$rol' WHERE usuario = '$id'";

    // Realizar la modificación del usuario directamente desde la consulta SQL
    $url_modificar_usuario = $api_url . '?query=' . urlencode($query_sql);
    $response_modificar_usuario = call_api($url_modificar_usuario);

    // Verificar la respuesta de la API
    if ($response_modificar_usuario && !isset($response_modificar_usuario['error'])) {
        // Usuario modificado correctamente, redirigir al usuario a la página de administración de usuarios
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al modificar el usuario, imprimir el mensaje de error
        if (isset($response_modificar_usuario['error'])) {
            echo "Error al modificar el usuario: " . $response_modificar_usuario['error'];
        } else {
            echo "Error desconocido al modificar el usuario.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se proporcionaron todos los datos necesarios
    echo "No se proporcionaron todos los datos necesarios.";
    exit;
}
?>

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

// Verificar si se están enviando datos del formulario a través de POST
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nombre']) && isset($_POST['apellido1']) && isset($_POST['apellido2']) && isset($_POST['contrasena']) && isset($_POST['rol'])) {
    // Obtener datos del formulario
    $nombre = $_POST['nombre'];
    $apellido1 = $_POST['apellido1'];
    $apellido2 = $_POST['apellido2'];
    $contrasena = $_POST['contrasena'];
    $rol = $_POST['rol'];

    // Construir la consulta INSERT utilizando la secuencia correspondiente para ID_USUARIO
    $query_sql = "INSERT INTO Usuario (USUARIO, APELLIDO1USER, APELLIDO2USER, CONTRASEÑA, ID_ROL) VALUES ('$nombre', '$apellido1', '$apellido2', '$contrasena', '$rol')";

    // Realizar la inserción del usuario directamente desde la consulta SQL
    $url_agregar_usuario = $api_url . '?query=' . urlencode($query_sql);
    $response_agregar_usuario = call_api($url_agregar_usuario);

    // Verificar la respuesta de la API
    if ($response_agregar_usuario && !isset($response_agregar_usuario['error'])) {
        // Usuario agregado correctamente, redirigir al usuario a la página de administración de usuarios
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al agregar el usuario, imprimir el mensaje de error
        if (isset($response_agregar_usuario['error'])) {
            echo "Error al agregar el usuario: " . $response_agregar_usuario['error'];
        } else {
            echo "Error desconocido al agregar el usuario.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    // header('Location: ../?error=true');
    exit;
}
?>

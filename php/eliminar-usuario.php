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

// Verificar si se están enviando datos a través de GET y si se proporcionó el usuario del usuario
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['usuario'])) {
    // Obtener el usuario del usuario a eliminar
    $usuario = $_GET['usuario'];

    // Construir la consulta DELETE para eliminar el usuario
    $query_sql = "DELETE FROM Usuario WHERE USUARIO = '$usuario'";

    // Realizar la eliminación del usuario directamente desde la consulta SQL
    $url_eliminar_usuario = $api_url . '?query=' . urlencode($query_sql);
    $response_eliminar_usuario = call_api($url_eliminar_usuario);

    // Verificar la respuesta de la API
    if ($response_eliminar_usuario) {
        // Usuario eliminado correctamente, mostrar mensaje de éxito
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al eliminar el usuario, mostrar mensaje de error
        echo "Error al eliminar el usuario.";
    }
} else {
    // Mostrar mensaje de error si no se proporcionó el usuario del usuario
    echo "No se proporcionó el usuario del usuario.";
}
?>

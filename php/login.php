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

// Verificar si se ha enviado el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $usuario = $_POST['user'];
    $contra = $_POST['password'];

    // Construir el query SQL para autenticar al usuario
    $sql_query = "SELECT Usuario, Apellido1User, Apellido2User FROM Usuario WHERE Usuario = '$usuario' AND Contraseña = '$contra'";

    // Codificar el query SQL en la URL
    $url = $api_url . '?query=' . urlencode($sql_query);
    
    // Realizar la solicitud a la API
    $response = call_api($url);

    // Verificar la respuesta de la API
    if ($response && isset($response[0]['USUARIO'])) {
        // Almacenar datos del usuario en la sesión
        $_SESSION['usuario'] = $response[0]['USUARIO'];
        $_SESSION['apellido1'] = $response[0]['APELLIDO1USER'];
        $_SESSION['apellido2'] = $response[0]['APELLIDO2USER'];

        // Redirigir al usuario a la página de inicio
        header('Location: ../');
        exit;
    } else {
        // Mostrar mensaje de error si la autenticación falla
        $error_message = "Usuario o contraseña incorrectos.";
        header('Location: ../login?error=true');
    }
}
?>

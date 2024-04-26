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

// Verificar si se están enviando datos del formulario a través de GET
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id']) && isset($_GET['nombre']) && isset($_GET['apellido1']) && isset($_GET['apellido2']) && isset($_GET['especialidad'])) {
    // Obtener datos del formulario
    $id = $_GET['id'];
    $nombre = $_GET['nombre'];
    $apellido1 = $_GET['apellido1'];
    $apellido2 = $_GET['apellido2'];
    $especialidad = $_GET['especialidad'];

    // Construir la consulta UPDATE para modificar el doctor existente
    $query_sql = "UPDATE Doctores SET NOMBREDOCTOR = '$nombre', APELLIDO1DOCTOR = '$apellido1', APELLIDO2DOCTOR = '$apellido2', ID_ESPECIALIDAD = '$especialidad' WHERE ID_DOCTORES = '$id'";

    // Realizar la modificación del doctor directamente desde la consulta SQL
    $url_modificar_doctor = $api_url . '?query=' . urlencode($query_sql);
    $response_modificar_doctor = call_api($url_modificar_doctor);

    // Verificar la respuesta de la API
    if ($response_modificar_doctor && !isset($response_modificar_doctor['error'])) {
        // Doctor modificado correctamente, redirigir al usuario a la página de administración de doctores
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al modificar el doctor, imprimir el mensaje de error
        if (isset($response_modificar_doctor['error'])) {
            echo "Error al modificar el doctor: " . $response_modificar_doctor['error'];
        } else {
            echo "Error desconocido al modificar el doctor.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    // header('Location: ../?error=true');
    exit;
}
?>

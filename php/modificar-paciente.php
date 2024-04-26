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
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id']) && isset($_GET['nombre']) && isset($_GET['apellido1']) && isset($_GET['apellido2'])) {
    // Obtener datos del formulario
    $id = $_GET['id'];
    $nombre = $_GET['nombre'];
    $apellido1 = $_GET['apellido1'];
    $apellido2 = $_GET['apellido2'];

    // Construir la consulta UPDATE para modificar el paciente existente
    $query_sql = "UPDATE Pacientes SET NOMBREPACIENTE = '$nombre', APELLIDO1PACIENTE = '$apellido1', APELLIDO2PACIENTE = '$apellido2' WHERE ID_PACIENTE = '$id'";

    // Realizar la modificación del paciente directamente desde la consulta SQL
    $url_modificar_paciente = $api_url . '?query=' . urlencode($query_sql);
    $response_modificar_paciente = call_api($url_modificar_paciente);

    // Verificar la respuesta de la API
    if ($response_modificar_paciente && !isset($response_modificar_paciente['error'])) {
        // Paciente modificado correctamente, redirigir al usuario a la página de administración de pacientes
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al modificar el paciente, imprimir el mensaje de error
        if (isset($response_modificar_paciente['error'])) {
            echo "Error al modificar el paciente: " . $response_modificar_paciente['error'];
        } else {
            echo "Error desconocido al modificar el paciente.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    // header('Location: ../?error=true');
    exit;
}
?>

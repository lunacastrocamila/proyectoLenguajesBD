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
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id']) && isset($_GET['paciente']) && isset($_GET['area_clinica']) && isset($_GET['fecha']) && isset($_GET['hora'])) {
    // Obtener datos del formulario
    $id = $_GET['id'];
    $paciente = $_GET['paciente'];
    $area_clinica = $_GET['area_clinica'];
    $fecha = $_GET['fecha'];
    $hora = $_GET['hora'];

    // Construir la consulta UPDATE para modificar la cita existente
    $query_sql = "UPDATE Citas SET ID_PACIENTE = '$paciente', ID_ESPECIALIDAD = '$area_clinica', FECHA = '$fecha', HORA = '$hora' WHERE ID_CITAS = '$id'";

    // Realizar la modificación de la cita directamente desde la consulta SQL
    $url_modificar_cita = $api_url . '?query=' . urlencode($query_sql);
    $response_modificar_cita = call_api($url_modificar_cita);

    // Verificar la respuesta de la API
    if ($response_modificar_cita && !isset($response_modificar_cita['error'])) {
        // Cita modificada correctamente, redirigir al usuario a la página de administración de citas
        header('Location: ../');
        exit;
    } else {
        // Error al modificar la cita, imprimir el mensaje de error
        if (isset($response_modificar_cita['error'])) {
            echo "Error al modificar la cita: " . $response_modificar_cita['error'];
        } else {
            echo "Error desconocido al modificar la cita.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    // header('Location: ../?error=true');
    exit;
}
?>

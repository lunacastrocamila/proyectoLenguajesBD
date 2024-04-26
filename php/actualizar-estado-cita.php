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

// Verificar si se están enviando datos a través de POST y si se proporcionó el ID de la cita y el nuevo estado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cita_id']) && isset($_POST['estado'])) {
    // Obtener datos del formulario
    $citaId = $_POST['cita_id'];
    $estado = $_POST['estado'];

    // Construir la consulta UPDATE para modificar el estado de la cita
    $query_sql = "UPDATE Citas SET Estado = '$estado' WHERE Id_Citas = '$citaId'";

    // Realizar la modificación del estado de la cita directamente desde la consulta SQL
    $url_modificar_estado_cita = $api_url . '?query=' . urlencode($query_sql);
    $response_modificar_estado_cita = call_api($url_modificar_estado_cita);

    // Verificar la respuesta de la API
    if ($response_modificar_estado_cita && !isset($response_modificar_estado_cita['error'])) {
        // Estado de la cita modificado correctamente, redirigir al usuario a la página principal
        //header('Location: ../');
        exit;
    } else {
        // Error al modificar el estado de la cita, imprimir el mensaje de error
        if (isset($response_modificar_estado_cita['error'])) {
            echo "Error al modificar el estado de la cita: " . $response_modificar_estado_cita['error'];
        } else {
            echo "Error desconocido al modificar el estado de la cita.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se proporcionaron todos los datos necesarios
    echo "No se proporcionaron todos los datos necesarios.";
    exit;
}
?>

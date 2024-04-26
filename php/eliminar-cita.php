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
    echo $response;
    return json_decode($response, true);
}

// Obtener citas de la API con detalles de paciente, especialidad y doctor
$query_sql = 'DELETE FROM Citas WHERE Id_Citas = ' . $_GET['id']; // Construir la consulta DELETE

// Realizar la eliminación de la cita directamente desde la consulta SQL
$url_eliminar_cita = $api_url . '?query=' . urlencode($query_sql);
$response_eliminar_cita = call_api($url_eliminar_cita);
echo $query_sql;
// Verificar la respuesta de la API
if ($response_eliminar_cita) {
    // Cita eliminada correctamente, redirigir al usuario a la página de administración de citas
    //header('Location: ../');
    exit;
} else {
    // Error al eliminar la cita, redirigir al usuario con un mensaje de error
    header('Location: ../?error=true');
    exit;
}
?>

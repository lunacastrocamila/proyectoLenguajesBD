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

// Verificar si se están enviando datos a través de GET y si se proporcionó el ID del paciente
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id'])) {
    // Obtener el ID del paciente a eliminar
    $id = $_GET['id'];

    // Construir la consulta DELETE para eliminar el paciente
    $query_sql = "DELETE FROM Pacientes WHERE ID_PACIENTE = '$id'";

    // Realizar la eliminación del paciente directamente desde la consulta SQL
    $url_eliminar_paciente = $api_url . '?query=' . urlencode($query_sql);
    $response_eliminar_paciente = call_api($url_eliminar_paciente);

    // Verificar la respuesta de la API
    if ($response_eliminar_paciente) {
        // Paciente eliminado correctamente, redirigir al usuario a la página de administración de pacientes
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al eliminar el paciente, redirigir al usuario con un mensaje de error
        header('Location: ../administrar/usuarios/?error=true');
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se proporcionó el ID del paciente
    header('Location: ../administrar/usuarios/?error=true');
    exit;
}
?>

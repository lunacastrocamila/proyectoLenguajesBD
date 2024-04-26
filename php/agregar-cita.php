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

// Verificar si se han enviado los datos del formulario a través de la URL (método GET)
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['paciente']) && isset($_GET['area_clinica']) && isset($_GET['fecha']) && isset($_GET['hora'])) {
    // Obtener datos del formulario
    $paciente = $_GET['paciente'];
    $area_clinica = $_GET['area_clinica'];
    $fecha = $_GET['fecha'];
    $hora = $_GET['hora'];

    // Construir la consulta INSERT con la secuencia para obtener el próximo valor de ID_CITAS
    $query_sql = "INSERT INTO Citas (ID_CITAS, ID_PACIENTE, ID_ESPECIALIDAD, FECHA, HORA, ID_DOCTORES) VALUES (citas_seq.nextval, '$paciente', '$area_clinica', '$fecha', '$hora', 1)";

    // Realizar la inserción de la cita directamente desde la consulta SQL
    $url_agregar_cita = $api_url . '?query=' . urlencode($query_sql);
    $response_agregar_cita = call_api($url_agregar_cita);
    echo $query_sql;
    // Verificar la respuesta de la API
    if ($response_agregar_cita && !isset($response_agregar_cita['error'])) {
        // Cita agregada correctamente, redirigir al usuario a la página de administración de citas
        header('Location: ../');
        exit;
    } else {
        // Error al agregar la cita, redirigir al usuario con un mensaje de error
        //header('Location: ../?error=true');
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    //header('Location: ../?error=true');
    exit;
}
?>

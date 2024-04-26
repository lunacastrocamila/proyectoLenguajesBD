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

// Verificar si se están enviando datos del formulario a través de la URL (método GET)
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['nombre']) && isset($_GET['apellido1']) && isset($_GET['apellido2'])) {
    // Obtener datos del formulario
    $nombre = $_GET['nombre'];
    $apellido1 = $_GET['apellido1'];
    $apellido2 = $_GET['apellido2'];

    // Construir la consulta INSERT utilizando la secuencia correspondiente para ID_PACIENTE
    $query_sql = "INSERT INTO Pacientes (ID_PACIENTE, NOMBREPACIENTE, APELLIDO1PACIENTE, APELLIDO2PACIENTE) VALUES (seq_pacientes.nextval, '$nombre', '$apellido1', '$apellido2')";

    // Realizar la inserción del paciente directamente desde la consulta SQL
    $url_agregar_paciente = $api_url . '?query=' . urlencode($query_sql);
    $response_agregar_paciente = call_api($url_agregar_paciente);

    // Verificar la respuesta de la API
    if ($response_agregar_paciente && !isset($response_agregar_paciente['error'])) {
        // Paciente agregado correctamente, redirigir al usuario a la página de administración de pacientes
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al agregar el paciente, imprimir el mensaje de error
        if (isset($response_agregar_paciente['error'])) {
            echo "Error al agregar el paciente: " . $response_agregar_paciente['error'];
        } else {
            echo "Error desconocido al agregar el paciente.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    // header('Location: ../?error=true');
    exit;
}
?>

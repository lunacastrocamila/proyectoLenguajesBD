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
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['nombre']) && isset($_GET['apellido1']) && isset($_GET['apellido2']) && isset($_GET['especialidad'])) {
    // Obtener datos del formulario
    $nombre = $_GET['nombre'];
    $apellido1 = $_GET['apellido1'];
    $apellido2 = $_GET['apellido2'];
    $especialidad = $_GET['especialidad'];

    // Construir la consulta INSERT utilizando la secuencia citas_seq.nextval para ID_CITAS
    $query_sql = "INSERT INTO Doctores (ID_DOCTORES, NOMBREDOCTOR, APELLIDO1DOCTOR, APELLIDO2DOCTOR, ID_ESPECIALIDAD) VALUES (seq_doctores.nextval, '$nombre', '$apellido1', '$apellido2', $especialidad)";

    // Realizar la inserción del doctor directamente desde la consulta SQL
    $url_agregar_doctor = $api_url . '?query=' . urlencode($query_sql);
    $response_agregar_doctor = call_api($url_agregar_doctor);

    // Verificar la respuesta de la API
    if ($response_agregar_doctor && !isset($response_agregar_doctor['error'])) {
        // Doctor agregado correctamente, redirigir al usuario a la página de administración de doctores
        header('Location: ../administrar/usuarios/');
        exit;
    } else {
        // Error al agregar el doctor, imprimir el mensaje de error
        if (isset($response_agregar_doctor['error'])) {
            echo "Error al agregar el doctor: " . $response_agregar_doctor['error'];
        } else {
            echo "Error desconocido al agregar el doctor.";
        }
        exit;
    }
} else {
    // Redirigir al usuario con un mensaje de error si no se han proporcionado todos los datos necesarios
    //header('Location: ../?error=true');
    exit;
}
?>

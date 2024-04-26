<?php 
include '../../php/comprobarUsuario.php'; 
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

// Obtener todos los pacientes disponibles
$url_pacientes = $api_url . '?query=' . urlencode('SELECT * FROM Pacientes');
$response_pacientes = call_api($url_pacientes);

// Inicializar variables para los valores del formulario
$nombre_paciente = isset($response_pacientes[0]['NOMBREPACIENTE']) ? $response_pacientes[0]['NOMBREPACIENTE'] : '';
$apellido1_paciente = isset($response_pacientes[0]['APELLIDO1PACIENTE']) ? $response_pacientes[0]['APELLIDO1PACIENTE'] : '';
$apellido2_paciente = isset($response_pacientes[0]['APELLIDO2PACIENTE']) ? $response_pacientes[0]['APELLIDO2PACIENTE'] : '';
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar paciente</title>
    <!-- Estilos CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }

        .login {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #555;
        }

        input[type="text"],
        select {
            width: calc(100% - 24px);
            padding: 12px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <?php include '../../includes/menu.php'; ?>
    <div class="container">
        <h1>Registrar nuevo paciente</h1>
        <div class="login">
            <form method="GET" action="<?php echo isset($_GET['id']) ? '../../php/modificar-paciente.php' : '../../php/agregar-paciente.php'; ?>">
                <!-- Campo de entrada oculto para el ID -->
                <input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id'] : ''; ?>">
                
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<?php echo $nombre_paciente; ?>">
                
                <label for="apellido1">Primer apellido:</label>
                <input type="text" id="apellido1" name="apellido1" value="<?php echo $apellido1_paciente; ?>">

                <label for="apellido2">Segundo apellido:</label>
                <input type="text" id="apellido2" name="apellido2" value="<?php echo $apellido2_paciente; ?>">

                <input type="submit" value="Registrar paciente">
            </form>
        </div>
    </div>
</body>
</html>

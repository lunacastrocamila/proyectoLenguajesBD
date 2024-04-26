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

// Inicializar variables para los valores del formulario
$id_cita = '';
$paciente = '';
$area_clinica = '';
$fecha = '';
$hora = '';

// Obtener detalles de la cita si se proporciona un ID en la URL
if (isset($_GET['id'])) {
    $id_cita = $_GET['id'];
    $query_sql = "SELECT * FROM Citas WHERE Id_Citas = $id_cita";
    $url_get_cita = $api_url . '?query=' . urlencode($query_sql);
    $response_cita = call_api($url_get_cita);
    if ($response_cita) {
        $cita = $response_cita[0];
        $paciente = $cita['ID_PACIENTE']; // Asignar valor del paciente
        $area_clinica = $cita['ID_ESPECIALIDAD']; // Asignar valor del área clínica
        $fecha = $cita['FECHA']; // Asignar valor de la fecha
        $hora = $cita['HORA']; // Asignar valor de la hora
    }
}

// Obtener todos los pacientes y áreas clínicas disponibles
$url_pacientes = $api_url . '?query=' . urlencode('SELECT * FROM Pacientes');
$response_pacientes = call_api($url_pacientes);

$url_areas_clinicas = $api_url . '?query=' . urlencode('SELECT * FROM Especialidades');
$response_areas_clinicas = call_api($url_areas_clinicas);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar cita</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #99B4DF;
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

        img {
            display: block;
            margin: 0 auto;
            max-width: 150px;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
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
        input[type="date"],
        input[type="time"],
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
        <h1>Registrar nueva cita</h1>
        <div class="login">
            <img src="../../img/4cb234b73934bd35d8237862250327df9ad0faea" alt="Logo">
            <form method="GET" action="<?php echo isset($_GET['id']) ? '../../php/modificar-cita.php' : '../../php/agregar-cita.php'; ?>">
                <label for="paciente">Paciente:</label>
                <select name="paciente" id="paciente">
                    <?php foreach ($response_pacientes as $paciente_item): ?>
                        <option value="<?php echo $paciente_item['ID_PACIENTE']; ?>" <?php if ($paciente_item['ID_PACIENTE'] == $paciente) echo 'selected'; ?>><?php echo $paciente_item['NOMBREPACIENTE']." ".$paciente_item['APELLIDO1PACIENTE']." ".$paciente_item['APELLIDO2PACIENTE']; ?></option>
                    <?php endforeach; ?>
                </select>

                <label for="area_clinica">Área médica:</label>
                <select name="area_clinica" id="area_clinica">
                    <?php foreach ($response_areas_clinicas as $area_clinica_item): ?>
                        <option value="<?php echo $area_clinica_item['ID_ESPECIALIDAD']; ?>" <?php if ($area_clinica_item['ID_ESPECIALIDAD'] == $area_clinica) echo 'selected'; ?>><?php echo $area_clinica_item['DESCRIPCIONESPECIALIDAD']; ?></option>
                    <?php endforeach; ?>
                </select>

                <label for="fecha">Fecha de la cita:</label>
                <input type="date" id="fecha" name="fecha" value="<?php echo $fecha; ?>">

                <label for="hora">Hora de la cita:</label>
                <input type="time" id="hora" name="hora" value="<?php echo $hora; ?>">

                <input type="submit" value="Registrar cita">
            </form>
        </div>
    </div>
</body>
</html>

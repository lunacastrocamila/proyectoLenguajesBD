<?php 
include 'php/comprobarUsuario.php'; 
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

// Obtener citas de la API con detalles de paciente, especialidad y doctor
$url_citas = $api_url . '?query=' . urlencode('SELECT Citas.*, Pacientes.NombrePaciente, Especialidades.DescripcionEspecialidad, Doctores.NombreDoctor 
                                                FROM Citas 
                                                INNER JOIN Pacientes ON Citas.Id_Paciente = Pacientes.Id_Paciente
                                                INNER JOIN Especialidades ON Citas.Id_Especialidad = Especialidades.Id_Especialidad
                                                INNER JOIN Doctores ON Citas.Id_Doctores = Doctores.Id_Doctores');
$response_citas = call_api($url_citas);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <title>Citas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        #content {
            margin-left: 90px; 
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .btnEditar {
            margin-right: 5px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        img {
            width: 20px;
            height: auto;
        }
    </style>
</head>
<body>
    <?php include 'includes/menu.php'; ?>
    <div id="content">
        <h1>Administración de Citas</h1>
        <a href="registros/citas"><button>Añadir nueva cita</button></a>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Área</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Doctor</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($response_citas as $cita): ?>
                    <tr>
                        <td><?php echo $cita['NOMBREPACIENTE']; ?></td>
                        <td><?php echo $cita['DESCRIPCIONESPECIALIDAD']; ?></td>
                        <td><?php echo $cita['FECHA']; ?></td>
                        <td><?php echo $cita['HORA']; ?></td>
                        <td><?php echo $cita['NOMBREDOCTOR']; ?></td>
                        <td>
                            <a href="registros/citas?id=<?php echo $cita['ID_CITAS']; ?>" class="btnEditar"><button><img src="img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
                            <a href="php/eliminar-cita.php?id=<?php echo $cita['ID_CITAS']; ?>" class="btnEditar"><button><img src="img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>

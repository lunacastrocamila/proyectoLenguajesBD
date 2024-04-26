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

// Obtener usuarios con nombres de roles
$url_usuarios = $api_url . '?query=' . urlencode('SELECT Usuario.*, Rol.DescripcionRol FROM Usuario INNER JOIN Rol ON Usuario.Id_Rol = Rol.Id_Rol');
$response_usuarios = call_api($url_usuarios);

// Obtener pacientes
$url_pacientes = $api_url . '?query=' . urlencode('SELECT * FROM Pacientes');
$response_pacientes = call_api($url_pacientes);

// Obtener doctores con nombres de especialidades
$url_doctores = $api_url . '?query=' . urlencode('SELECT Doctores.*, Especialidades.DescripcionEspecialidad FROM Doctores INNER JOIN Especialidades ON Doctores.Id_Especialidad = Especialidades.Id_Especialidad');
$response_doctores = call_api($url_doctores);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de Usuarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
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
    <?php include '../../includes/menu.php'; ?>
    <h1>Administración de Usuarios</h1>

    <!-- Tabla de usuarios -->
    <h2>Usuarios</h2>
    <div style="text-align: right;">
        <a href="../../registros/usuario"><button>Añadir nuevo usuario</button></a>
    </div>
    <table>
        <thead>
            <tr>
                <th>Usuario</th>
                <th>Apellido</th>
                <th>Rol</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($response_usuarios as $usuario): ?>
                <tr>
                    <td><?php echo $usuario['USUARIO']; ?></td>
                    <td><?php echo $usuario['APELLIDO1USER'] . ' ' . $usuario['APELLIDO2USER']; ?></td>
                    <td><?php echo $usuario['DESCRIPCIONROL']; ?></td>
                    <td>
                        <a href="../../registros/usuario?usuario=<?php echo $usuario['USUARIO']; ?>" class="btnEditar"><button><img src="../../img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
                        <a href="php/eliminar-usuario.php?usuario=<?php echo $usuario['USUARIO']; ?>" class="btnEditar"><button><img src="../../img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Tabla de pacientes -->
    <h2>Pacientes</h2>
    <div style="text-align: right;">
        <a href="../../registros/paciente"><button>Añadir nuevo paciente</button></a>
    </div>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($response_pacientes as $paciente): ?>
                <tr>
                    <td><?php echo $paciente['NOMBREPACIENTE']; ?></td>
                    <td><?php echo $paciente['APELLIDO1PACIENTE'] . ' ' . $paciente['APELLIDO2PACIENTE']; ?></td>
                    <td>
                        <a href="../../registros/paciente?id=<?php echo $paciente['ID_PACIENTE']; ?>" class="btnEditar"><button><img src="../../img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
                        <a href="php/eliminar-paciente.php?id=<?php echo $paciente['ID_PACIENTE']; ?>" class="btnEditar"><button><img src="../../img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Tabla de doctores -->
    <h2>Doctores</h2>
    <div style="text-align: right;">
        <a href="../../registros/doctor"><button>Añadir nuevo doctor</button></a>
    </div>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Especialidad</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($response_doctores as $doctor): ?>
                <tr>
                    <td><?php echo $doctor['NOMBREDOCTOR']; ?></td>
                    <td><?php echo $doctor['APELLIDO1DOCTOR'] . ' ' . $doctor['APELLIDO2DOCTOR']; ?></td>
                    <td><?php echo $doctor['DESCRIPCIONESPECIALIDAD']; ?></td>
                    <td>
                        <a href="../../registros/doctor?id=<?php echo $doctor['ID_DOCTORES']; ?>" class="btnEditar"><button><img src="../../img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
                        <a href="php/eliminar-doctor.php?id=<?php echo $doctor['ID_DOCTORES']; ?>" class="btnEditar"><button><img src="../../img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>

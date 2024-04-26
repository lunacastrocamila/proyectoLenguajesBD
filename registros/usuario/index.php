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

// Obtener todos los roles disponibles
$url_roles = $api_url . '?query=' . urlencode('SELECT * FROM Rol');
$response_roles = call_api($url_roles);

// Inicializar variables para los valores del formulario
$nombre_usuario = '';
$apellido1_usuario = '';
$apellido2_usuario = '';
$rol_usuario = isset($response_roles[0]['DESCRIPCIONROL']) ? $response_roles[0]['DESCRIPCIONROL'] : '';

// Obtener detalles del usuario si se proporciona un nombre de usuario en la URL
if (isset($_GET['usuario'])) {
    $usuario = $_GET['usuario'];
    $query_sql = "SELECT Usuario.*, Rol.DescripcionRol FROM Usuario INNER JOIN Rol ON Usuario.Id_Rol = Rol.Id_Rol WHERE Usuario = '$usuario'";
    $url_get_usuario = $api_url . '?query=' . urlencode($query_sql);
    $response_usuario = call_api($url_get_usuario);
    if ($response_usuario) {
        $nombre_usuario = $response_usuario[0]['USUARIO'];
        $apellido1_usuario = $response_usuario[0]['APELLIDO1USER'];
        $apellido2_usuario = $response_usuario[0]['APELLIDO2USER'];
        $rol_usuario = $response_usuario[0]['DescripcionRol'];
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar usuario</title>
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
        input[type="password"],
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
        <h1>Modificar usuario</h1>
        <div class="login">
            <form method="POST" action="<?php echo isset($_GET['usuario']) ? '../../php/modificar-usuario.php' : '../../php/agregar-usuario.php'; ?>">
                <!-- Campo de entrada oculto para el ID -->
                <input type="hidden" name="usuario" value="<?php echo isset($_GET['usuario']) ? $_GET['usuario'] : ''; ?>">

                <label for="nombre">Nombre de usuario:</label>
                <input type="text" id="nombre" name="nombre" value="<?php echo $nombre_usuario; ?>" >

                <label for="apellido1">Primer apellido:</label>
                <input type="text" id="apellido1" name="apellido1" value="<?php echo $apellido1_usuario; ?>">

                <label for="apellido2">Segundo apellido:</label>
                <input type="text" id="apellido2" name="apellido2" value="<?php echo $apellido2_usuario; ?>">

                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" value=""> <!-- Aquí agregué el campo para la contraseña -->

                <label for="rol">Rol:</label>
                <select name="rol" id="rol">
                    <?php foreach ($response_roles as $rol): ?>
                        <option value="<?php echo $rol['Id_Rol']; ?>" <?php if ($rol['DESCRIPCIONROL'] == $rol_usuario) echo 'selected'; ?>><?php echo $rol['DESCRIPCIONROL']; ?></option>
                    <?php endforeach; ?>
                </select>

                <input type="submit" value="Guardar cambios">
            </form>

        </div>
    </div>
</body>
</html>

<?php include '../../php/comprobarUsuario.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar usuario</title>
    <link rel="stylesheet" type="text/css" href="../../css/estilos.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #99B4DF;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            text-align: center;
        }

        .login {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        img {
            display: block;
            margin: 0 auto;
            width: 150px;
            height: auto;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <?php include '../../includes/menu.php'; ?>
    <h1>Inicio de Sesión</h1>
    <h2>¡Bienvenido! Por favor, inicia sesión para acceder a tu cuenta.</h2>
    <div class="login">
        <img src="../../img/4cb234b73934bd35d8237862250327df9ad0faea">
        <form method="POST" action="../../php/registro.php">
            <div>
                <label for="name">Nombre</label>
                <input type="text" name="name" required>
                <label for="mail">Correo</label>
                <input type="email" name="mail" required>
                <label for="password">Contraseña</label>
                <input type="password" name="password" required>
            </div>
            <div>
                <input type="submit" value="Guardar usuario">
            </div>
        </form>
    </div>
</body>
</html>

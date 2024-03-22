<?php include '../../php/comprobarUsuario.php'; ?>
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
            <form method="GET" action="">
                <label for="paciente">Paciente:</label>
                <select name="paciente" id="paciente">
                    <option value="1">Juan Pérez</option>
                    <option value="2">María García</option>
                    <option value="3">Carlos López</option>
                    <!-- Agrega más opciones según sea necesario -->
                </select>

                <label for="area_clinica">Área médica:</label>
                <select name="area_clinica" id="area_clinica">
                    <option value="Cardiología">Cardiología</option>
                    <option value="Dermatología">Dermatología</option>
                    <option value="Gastroenterología">Gastroenterología</option>
                    <option value="Neurología">Neurología</option>
                    <option value="Oftalmología">Oftalmología</option>
                    <option value="Pediatría">Pediatría</option>
                </select>

                <label for="fecha">Fecha de la cita:</label>
                <input type="date" id="fecha" name="fecha">

                <label for="hora">Hora de la cita:</label>
                <input type="time" id="hora" name="hora">

                <input type="submit" value="Registrar cita">
            </form>
        </div>
    </div>
</body>
</html>

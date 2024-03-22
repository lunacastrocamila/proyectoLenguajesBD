<?php include '../../php/comprobarUsuario.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="../../css/estilos.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h1 {
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
    <div style="text-align: right;">
        <a href="../../registros/usuario"><button>Añadir nuevo usuario</button></a>
    </div>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Cédula</th>
                <th>Correo</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php for ($i = 0; $i < 10; $i++): ?>
                <tr>
                    <td>Jefferson Chaves</td>
                    <td>11845789625</td>
                    <td>q@a.a</td>
                    <td>
                        <a href="../../registros/usuario" class="btnEditar"><button><img src="../../img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
                        <a href="" class="btnEditar"><button><img src="../../img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
                    </td>
                </tr>
            <?php endfor ?>
        </tbody>
    </table>
</body>
</html>

<?php include 'php/comprobarUsuario.php'; ?>
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
                    <th>Cédula</th>
                    <th>Área</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php for ($i = 0; $i < 10; $i++): ?>
                    <tr>
                        <td>Jefferson Chaves</td>
                        <td>11845789625</td>
                        <td>Odontología</td>
                        <td>23/04/2024</td>
                        <td>9:30 AM</td>
                        <td>
                            <a href="registros/citas" class="btnEditar"><button><img src="img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
                            <a href="" class="btnEditar"><button><img src="img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
                        </td>
                    </tr>
                <?php endfor ?>
            </tbody>
        </table>
    </div>
</body>
</html>

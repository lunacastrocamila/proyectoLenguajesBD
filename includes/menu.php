<?php session_start(); ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        header {
            display: flex;
            align-items: center;
            padding: 20px;
        }

        .menu-lateral {
            position: fixed;
            top: 0;
            left: -150px; 
            height: 100%;
            width: 150px;
            background-color: #0D1C55;
            color: #fff;
            padding: 20px;
            transition: left 0.3s;
        }

        .menu-lateral.abierto {
            left: 0; 
        }

        .menu-lateral img {
            width: 60%;
            height: auto;
            margin-bottom: 12px;
        }

        .menu-lateral ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu-lateral ul li {
            margin-bottom: 10px;
        }

        .menu-lateral a {
            text-decoration: none;
            color: #fff;
        }

        .menu {
            position: fixed;
            top: 20px;
            left: 20px;
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            cursor: pointer;
            z-index: 1; 
        }
    </style>
</head>
<body>

<div class="menu-lateral" id="menuLateral" onclick="cerrarMenu()">
    <img src="/proyectoLenguajesBD/img/5f8621c689f88a3266c14e6dc4292e0564cda50d">
    <h2>Menú</h2>
    <ul>
        <a href="/proyectoLenguajesBD/login"><p class="nombre_usuario"><?php echo $_SESSION['usuario']; ?>(Logout)</p></a>
        <hr>
        <li><a href="/proyectoLenguajesBD/">Administrar citas</a></li>
        <li><a href="/proyectoLenguajesBD/administrar/usuarios">Administrar usuarios</a></li>
    </ul>
</div>

<script>
    function cerrarMenu() {
        var menuLateral = document.getElementById("menuLateral");
        menuLateral.classList.remove("abierto");
    }

    document.addEventListener("click", function(event) {
        var menuLateral = document.getElementById("menuLateral");
        if (event.target.closest(".menu") || event.target.closest(".menu-lateral")) {
            menuLateral.classList.toggle("abierto");
        } else {
            menuLateral.classList.remove("abierto");
        }
    });
</script>

</body>
</html>
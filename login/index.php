<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #99B4DF; 
    }
    .titulo {
        text-align: center;
    }
    .imagen-login {
        max-width: 30%; 
        height: auto; 
    }
    .centrar-boton {
        text-align: center;
    }
</style>
</head>
<body>

<div class="row">
    <div class="col titulo">
        <h2>¡Bienvenido!</h2>
        <p>Por favor, inicia sesión para acceder a tu cuenta.</p>
    </div>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <h5 class="card-header text-center"><img src="../img/4cb234b73934bd35d8237862250327df9ad0faea" class="imagen-login"> </h5>
                <div class="card-body">
                    <?php 
                    if ($_GET['error']=="true") {
                        ?>
                        <h1>Usuario o contraseña incorrectos.</h1>
                        <?php 
                    }
                    ?>
                    <form method="POST" action="../php/login.php">
                        <div class="form-group">
                            <label for="user">Usuario</label>
                            <input type="text" class="form-control" id="user" name="user">
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <div class="centrar-boton "> 
                            <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

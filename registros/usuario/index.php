<?php include '../../php/comprobarUsuario.php';?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Registrar usuario</title>
</head>
<body>
	<?php include '../../includes/menu.php'; ?>
	<h1>Inicio de Sesion</h1>
	<h2>¡Bienvenido! Por favor, inicia sesión para acceder a tu cuenta.</h2>
	<div class="login">
		<img src="../../img/4cb234b73934bd35d8237862250327df9ad0faea">
		<form method="POST" action="../../php/registro.php">
		<div>
			<label for="name">Nombre</label>
			<input type="text" name="name">
			<label for="mail">Correo</label>
			<input type="mail" name="mail">
			<label for="password">Contraseña</label>
			<input type="password" name="password">
		</div>
		<div>
			<input type="submit" value="Guardar usuario">
		</div>
	</form>
	</div>
	
</body>
</html>
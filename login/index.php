<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
</head>
<body>
	<h1>Inicio de Sesion</h1>
	<h2>¡Bienvenido! Por favor, inicia sesión para acceder a tu cuenta.</h2>
	<div class="login">
		<img src="../img/4cb234b73934bd35d8237862250327df9ad0faea">
		<form method="POST" action="../php/login.php">
		<div>
			<label for="user">Usuario</label>
			<input type="text" name="user">
			<label for="password">Contraseña</label>
			<input type="password" name="password">
		</div>
		<div>
			<input type="submit" value="Iniciar sesión">
		</div>
	</form>
	</div>
	
</body>
</html>
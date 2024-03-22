<?php include '../../php/comprobarUsuario.php';?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Registrar cita</title>
</head>
<body>
	<?php include '../../includes/menu.php'; ?>
	<h1>Citas</h1>
	<div class="login">
		<img src="../../img/4cb234b73934bd35d8237862250327df9ad0faea">
		<form method="GET" action=" ">
		<div>
			<?php include '../../includes/selector_usuarios.php'; ?>
			<select name="area_clinica" id="area_clinica">
				<option value="Cardiología">Cardiología</option>
			    <option value="Dermatología">Dermatología</option>
			    <option value="Gastroenterología">Gastroenterología</option>
			    <option value="Neurología">Neurología</option>
			    <option value="Oftalmología">Oftalmología</option>
			    <option value="Pediatría">Pediatría</option>
			</select>
			<label for="fecha">Fecha</label>
			<input type="date" id="fecha" name="fecha">

			<label for="hora">Hora</label>
			<input type="time" id="hora" name="hora">
		</div>
		<div>
			<input type="submit" value="Registrar">
		</div>
	</form>
	</div>
	
</body>
</html>
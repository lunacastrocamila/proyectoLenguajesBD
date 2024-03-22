<?php include 'php/comprobarUsuario.php';?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<title>Citas</title>
</head>
	<?php include 'includes/menu.php'; ?>
	<h1>Administracion de Citas</h1>
	<a href="registros/citas"><button>Añadir nueva cita</button></a>
	<table>
		<thead>
			<th>Nombre</th>
			<th>Cédula</th>
			<th>Área</th>
			<th>Fecha</th>
			<th>Hora</th>
			<th></th>
		</thead>
		<hr>
		<tbody>
			<?php for ($i = 0; $i < 10; $i++): ?>
				<tr>
					<th>Jefferson Chaves</th>
					<th>11845789625</th>
					<th>Odontología</th>
					<th>23/04/2024</th>
					<th>9:30 AM</th>
					<th>
						<a href="registros/citas" class="btnEditar"><button><img src="img/1d8d3457136176fa7fd05cfd094c9c4bce34b516"></button></a>
						<a href="" class="btnEditar"><button><img src="img/332ca27ff0266b4be269614f7a7a7ac57f30fb6f"></button></a>
					</th>
				</tr>
			<?php endfor ?>
		</tbody>
	</table>
</html>
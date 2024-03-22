<?php 
	session_start();
	if ($_SESSION['usuario'] == "") {
		header('Location: /proyectoLenguajesBD/login');
		exit();
	}
?>
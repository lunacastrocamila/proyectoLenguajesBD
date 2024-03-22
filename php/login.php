<?php 
	session_start();
	$_SESSION['usuario'] = $_POST['user'];
	header('Location: /proyectoLenguajesBD/');
?>
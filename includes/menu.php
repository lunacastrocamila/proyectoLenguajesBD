<?php session_start(); ?>
<header>
	<img src="/proyectoLenguajesBD/img/5f8621c689f88a3266c14e6dc4292e0564cda50d">
	<h1>Analisis de datos medicos</h1>
	<form action="/proyectoLenguajesBD/php/">
		<input type="text" name="busqueda">
	</form>
</header>

<aside class="menu">
	<p class="nombre_usuario"><?php echo $_SESSION['usuario']; ?></p>
	<hr>
	<p>Menú</p>
	<a href="/proyectoLenguajesBD/">Administrar citas</a>
	<a href="/proyectoLenguajesBD/administrar/usuarios">Administrar usuarios</a>
	<hr>
</aside>
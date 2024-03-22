<label for="usuario">Paciente:</label>
<select name="usuario" id="usuario">
<?php for ($i = 1; $i <= 10; $i++) { ?>
      <option value="<?php echo $i; ?>">Paciente <?php echo $i; ?></option>
<?php } ?>
</select>
<a href="/proyectoLenguajesBD/registros/paciente">Agregar paciente</a>
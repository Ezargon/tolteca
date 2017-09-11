<?php
/**
 * Bootstrap Details Template
 *
 * @package     Joomla
 * @subpackage  Fabrik
 * @copyright   Copyright (C) 2005-2013 fabrikar.com - All rights reserved.
 * @license     GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @since       3.1
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

$form = $this->form;
$model = $this->getModel();

//datos personales
$dp_nombre = utf8_decode($this->groups["Datos Personales"]->elements["nombre"]->value);
$dp_apellido1 = utf8_decode($this->groups["Datos Personales"]->elements["apellido1"]->value);
$dp_apellido2 = utf8_decode($this->groups["Datos Personales"]->elements["apellido2"]->value);
$dp_nif = utf8_decode($this->groups["Datos Personales"]->elements["nif_nie_pasaporte"]->value);
$dp_sexo = utf8_decode($this->groups["Datos Personales"]->elements["sexo"]->element_ro);
$dp_fecha_nac = utf8_decode($this->groups["Datos Personales"]->elements["fecha_nac"]->value);
$dp_pais_nac = utf8_decode($this->groups["Datos Personales"]->elements["pais_nac"]->value[0]);
$dp_nacionalidad = utf8_decode($this->groups["Datos Personales"]->elements["nacionalidad"]->value[0]);
$dp_direccion = utf8_decode($this->groups["Datos Personales"]->elements["direccion"]->value);
$dp_localidad = utf8_decode($this->groups["Datos Personales"]->elements["localidad"]->value);
$dp_cp = utf8_decode($this->groups["Datos Personales"]->elements["cp"]->value);
$dp_provincia = utf8_decode($this->groups["Datos Personales"]->elements["provincia"]->value);
$dp_pais = utf8_decode($this->groups["Datos Personales"]->elements["pais"]->value[0]);
$dp_telefono = utf8_decode($this->groups["Datos Personales"]->elements["telefono"]->value);
$dp_email = utf8_decode($this->groups["Datos Personales"]->elements["email"]->value);

//datos académicos
$da_titulacion = utf8_decode($this->groups["Datos Academicos"]->elements["titulacion"]->value);
$da_universidad = utf8_decode($this->groups["Datos Academicos"]->elements["universidad"]->value);
$da_cursando = utf8_decode($this->groups["Datos Academicos"]->elements["cursando"]->value);
$da_vias = $this->groups["Datos Academicos"]->elements["via_acceso"]->value;

//datos solicitud
$ds_fecha = date('d-m-Y h:i:s',strtotime($this->groups["Datos Solicitud"]->elements["date_time"]->value));
$ds_codigo =utf8_decode($this->groups["Datos Solicitud"]->elements["codigo"]->value);
$ds_curso =utf8_decode($this->groups["Datos Solicitud"]->elements["curso"]->value[0]);

$ds_programa = utf8_decode($this->groups["Datos Solicitud"]->elements["programa"]->value[0]);
$ds_linea = utf8_decode($this->groups["Datos Solicitud"]->elements["linea"]->value[0]);
$ds_tutor = utf8_decode($this->groups["Datos Solicitud"]->elements["tutor_tesis"]->value);
$ds_director1 = utf8_decode($this->groups["Datos Solicitud"]->elements["director_1"]->value);
$ds_director2 = utf8_decode($this->groups["Datos Solicitud"]->elements["director_2"]->value);
$ds_director3 = utf8_decode($this->groups["Datos Solicitud"]->elements["director_3"]->value);
$ds_modalidad =utf8_decode($this->groups["Datos Solicitud"]->elements["modalidad"]->element_ro);

//documentacion
$da_ficheros = $this->groups["Documentacion"]->elements["ficheros"]->value;
$da_subsanacion = $this->groups["Documentacion-Subs"]->elements["subsanacion"]->value;
$curso = $this->groups["Datos Solicitud"]->elements["curso"]->element_raw;

?>
<div id="hoja">
<table class="encabezado">
	<tr>
		<td style="width:150px; border-color:white #ccc white white !important;">
		   <img src="images/header-object.png" heigth="80" width="180"/>
		</td>
		<td style="padding-left:10px;border-color:white;">
			<h1>SOLICITUD DE ADMISIÓN A UN PROGRAMA DE DOCTORADO</h1>
			<h2>REGULADO POR EL R.D.99/2011 (NORMATIVA REGULADA POR ACUERDO 7.2/CG 17-6-11)</h2>
			<h2><B>CURSO <?php echo $ds_curso?></B></H2>
		</td>
	</tr>
	</table>
<p><b>C&Oacute;DIGO DE SOLICITUD:</b> <?php echo $ds_codigo?>
<table class="formulario">
<tr><th colspan="3">DATOS PERSONALES</th></tr>
<tr class="encabezado"><td>NOMBRE Y APELLIDOS</td><td>NIF/NIE/PASAPORTE</td><td>SEXO</td></tr>
<tr class="datos"><td><?php echo $dp_nombre . " " . $dp_apellido1 . " " . $dp_apellido2 ?></td><td><?php echo $dp_nif ?></td><td><?php echo $dp_sexo ?></td></tr>

<tr class="encabezado"><td>FECHA NACIMIENTO</td><td>PAIS NACIMIENTO</td><td>NACIONALIDAD</td></tr>
<tr class="datos"><td><?php echo $dp_fecha_nac ?></td><td><?php echo $dp_pais_nac ?></td><td><?php echo $dp_nacionalidad ?></td></tr>

<tr class="encabezado"><td>DIRECCION</td><td>LOCALIDAD</td><td>PROVINCIA</td></tr>
<tr class="datos"><td><?php echo $dp_direccion?></td><td><?php echo $dp_localidad." (". $dp_cp.")" ?></td><td><?php echo $dp_provincia?></td></tr>

<tr class="encabezado"><td>PAÍS</td><td>CORREO ELECTRÓNICO</td><td>TELÉFONO</td></tr>
<tr class="datos"><td><?php echo $dp_pais?></td><td><?php echo $dp_email?></td><td><?php echo $dp_telefono ?></td></tr>
</table>

<table class="formulario">
<tr><th colspan="1">DATOS ACADÉMICOS</th></tr>
<tr class="encabezado"><td>TITULACION QUE POSEE</td></tr>
<tr class="datos"><td><?php echo $da_titulacion ?></td></tr>

<tr class="encabezado"><td>UNIVERSIDAD</td></tr>
<tr class="datos"><td><?php echo $da_universidad ?></td></tr>

<tr class="encabezado"><td>CURSANDO ACTUALMENTE</td></tr>
<tr class="datos"><td><?php echo $da_cursando ?></td></tr>

<tr class="encabezado"><td>VIAS DE ACCESO</td></tr>
<tr class="datos"><td class="vias"><ul><?php
		foreach($da_vias as $via)
			echo "<li>". utf8_decode($via) ."</li>";
	?></ul></td></tr>
</table>

<table class="formulario">
<tr><th>Solicita:</th></tr>
<tr class="encabezado"><td>ADMISIÓN AL PROGRAMA DE DOCTORADO</td></tr>
<tr class="datos"><td ><?php echo $ds_programa ?></td></tr>
<tr class="encabezado"><td>LÍNEA DE INVESTIGACIÓN DEL PROGRAMA DE DOCTORADO</td></tr>
<tr class="datos"><td><?php echo $ds_linea ?></td></tr>
<tr class="encabezado"><td>TUTOR DE LA TESIS</td></tr>
<tr class="datos"><td><?php echo $ds_tutor ?></td></tr>
<tr class="encabezado"><td width="100%">DIRECTOR/A DE LA TESIS</td></tr>
<?php if($ds_director1 !=""):?><tr class="datos"><td><?php echo $ds_director1 ?></td></tr><?php endif;?>
<?php if($ds_director2 !=""):?><tr class="datos"><td><?php echo $ds_director2 ?></td></tr><?php endif;?>
<?php if($ds_director3 !=""):?><tr class="datos"><td><?php echo $ds_director3 ?></td></tr><?php endif;?>
<tr class="encabezado"><td width="100%">MODALIDAD DE PERMANENCIA</td></tr>
<tr class="datos"><td colspan=2><?php echo $ds_modalidad ?></td></tr>
</table>


<table class="formulario">
<tr><th>DOCUMENTACIÓN ENTREGADA</th></tr>

<tr class="datos"><td class="vias"><ul><?php
			echo "<li>". utf8_decode(str_replace('","params":"null"}]','',substr($da_ficheros,28))) ."</li>";
			if ($da_subsanacion!="") echo "<li>". utf8_decode(substr($da_subsanacion,15)) ."</li>";
	?></ul></td></tr>
</table>
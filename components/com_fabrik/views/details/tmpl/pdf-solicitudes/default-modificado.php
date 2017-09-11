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

$dp_nombre = utf8_decode($this->groups["Datos Personales"]->elements["nombre"]->value);
$dp_apellido1 = utf8_decode($this->groups["Datos Personales"]->elements["apellido1"]->value);
$dp_apellido2 = utf8_decode($this->groups["Datos Personales"]->elements["apellido2"]->value);
$dp_nif = utf8_decode($this->groups["Datos Personales"]->elements["nif_nie_pasaporte"]->value);
$dp_direccion = utf8_decode($this->groups["Datos Personales"]->elements["direccion"]->value);
$dp_localidad = utf8_decode($this->groups["Datos Personales"]->elements["localidad"]->value);
$dp_provincia = utf8_decode($this->groups["Datos Personales"]->elements["provincia"]->value);
$dp_titulacion = utf8_decode($this->groups["Datos Personales"]->elements["titulacion"]->value);
$dp_universidad = utf8_decode($this->groups["Datos Personales"]->elements["universidad"]->value);
$dp_telefono = utf8_decode($this->groups["Datos Personales"]->elements["telefono"]->value);
$dp_email = utf8_decode($this->groups["Datos Personales"]->elements["email"]->value);

$ds_programa = utf8_decode($this->groups["Datos Solicitud"]->elements["programa"]->value[0]);
$ds_linea = utf8_decode($this->groups["Datos Solicitud"]->elements["linea"]->value[0]);
$ds_tutor = utf8_decode($this->groups["Datos Solicitud"]->elements["tutor_tesis"]->value);
$ds_director1 = utf8_decode($this->groups["Datos Solicitud"]->elements["director_1"]->value);
$ds_director2 = utf8_decode($this->groups["Datos Solicitud"]->elements["director_2"]->value);
$ds_director3 = utf8_decode($this->groups["Datos Solicitud"]->elements["director_3"]->value);
$ds_modalidad =utf8_decode($this->groups["Datos Solicitud"]->elements["modalidad"]->element_ro);
?>
<html>
<head>
<style>
    body {
     	font-family: arial-narrow, arial;
     	font-size:10pt;
     	word-spacing:-3px;
	}
	#hoja
	{

		height:1010px;
	}
	#hoja2
	{
		word-spacing:-4px;
		font-size:11pt;
	}
	#firma
	{
		text-aling:center;
		position:fixed;
		top:850px;
	}
	table.encabezado
	{
		width:100%;
		
	}
     h1 {font-size:14pt; color:#000;font-weight:bold;line-height:13pt; padding:0px;margin:5px 0px 2px 0px;}
     h2 {font-size:9pt; color:#000; font-weight:normal; line-height:8pt;text-transform:uppercase;padding:0px;margin:0px;}
     h3 {font-weight:bold;}
     table, td {
     	border-collapse:collapse;
     	border:1px solid #ccc;
  	 }
  	 
  	 table.aviso
  	 {
  	 	width:100%;
  	 	margin:20px 0px 20px 0px;
	 }
	 table.aviso td 
	 {
	 	padding:5px;
	 }
  	 table.formulario {
     	border-color:white;
     	width:100%;
     	text-align:left;
     	margin:5px 0px;
	 }
     table.formulario th 
     {
     	color:white;
     	background-color:#444;
     	border:white !important;
     	text-align:left;
     	padding-left:10px;
     	text-transform:uppercase;
	 }
     table.formulario tr.encabezado td  
     {
     	border:0px;
     	line-height:10pt;
     	margin:0px;
     	padding-left:10px;
     	font-weight:bold;
	 }
	 table.formulario tr.datos td  
     {
     	border-color:white #ddd #ddd #ddd !important;
     	line-height:10pt;
     	margin:0px;
     	padding-left:10px;
     	font-size:12pt;
     	font-style:italic;
     }
     table.documentacion
     {
     	width:100%;
     	border:0px;     	
     }
     table.documentacion th, table.documentacion td
     {
     	text-align:left;
     	border:0px;
     }
     table.firma, table.firma td
     {
        border:0px;
     	margin:0 auto;
     	width:500px;
     	text-align:center;
     }
     table.firma td.fdo
     {
     	height:100px;
     	vertical-align:bottom;
     }
     td.coordinador {text-transform:uppercase;}
</style>
</head>
<body>
<div id="hoja">
<table class="encabezado">
	<tr>
		<td style="width:150px; border-color:white #ccc white white !important;">
		   <img src="images/fama-300.gif" heigth="80" width="80" style="margin-left:30px;"/>
		    <span style="font-size:9pt;">SERVICIO DE DOCTORADO</span> 
		</td>
		<td style="padding-left:10px;border-color:white;">
			<h1>SOLICITUD DE ADMISIÓN A UN PROGRAMA DE DOCTORADO</h1>
			<h2>REGULADO POR EL R.D.99/2011 (NORMATIVA REGULADA POR ACUERDO 7.2/CG 17-6-11)</h2>
		</td>
	</tr>
	</table>
	
	<table class="aviso" >
	<tr>
	<td>
	<b>IMPORTANTE: LEA CON ATENCIÓN LAS INSTRUCCIONES ESPECIFICADAS EN LA PÁGINA 2 DE ESTE DOCUMENTO.</b>
	</td></tr>
</table>

<table class="formulario">
<tr><th colspan="2">Datos personales</th></tr>
<tr class="encabezado"><td width="80%">NOMBRE Y APELLIDOS</td><td>NIF/NIE/PASAPORTE</td></tr>
<tr class="datos"><td><?php echo $dp_nombre . " " . $dp_apellido1 " " . $dp_apellido2; ?></td><td><?php echo $dp_nif ?></td></tr>
<tr class="encabezado"><td width="100%" colspan=2>DIRECCIÓN</td></tr>
<tr class="datos"><td colspan=2> <?php echo $dp_direccion ?></td></tr>
<tr class="encabezado"><td> LOCALIDAD</td><td>PROVINCIA</td></tr>
<tr class="datos"><td><?php echo $dp_localidad?></td><td><?php echo $dp_provincia?></td></tr>
<tr class="encabezado"><td>TITULACIÓN QUE POSEE</td><td>UNIVERSIDAD</td></tr>
<tr class="datos"><td><?php echo $dp_titulacion?></td><td><?php echo $dp_universidad?></td></tr>
<tr class="encabezado"><td>CORREO ELECTRÓNICO</td><td>TELÉFONO</td></tr>
<tr class="datos"><td><?php echo $dp_email?></td><td><?php echo $dp_telefono ?></td></tr>
</table>
<table class="formulario">
<tr><th>Solicita:</th></tr>
<tr class="encabezado"><td width="100%">ADMISIÓN AL PROGRAMA DE DOCTORADO</td></tr>
<tr class="datos"><td ><?php echo $ds_programa ?></td></tr>
<tr class="encabezado"><td width="100%">LÍNEA DE INVESTIGACIÓN DEL PROGRAMA DE DOCTORADO</td></tr>
<tr class="datos"><td><?php echo $ds_linea ?></td></tr>
<tr class="encabezado"><td width="100%">TUTOR DE LA TESIS</td></tr>
<tr class="datos"><td colspan=2><?php echo $ds_tutor ?></td></tr>
<tr class="encabezado"><td width="100%">DIRECTOR/A DE LA TESIS</td></tr>
<?php if($ds_director1 !=""):?><tr class="datos"><td><?php echo $ds_director1 ?></td></tr><?php endif;?>
<?php if($ds_director2 !=""):?><tr class="datos"><td><?php echo $ds_director2 ?></td></tr><?php endif;?>
<?php if($ds_director3 !=""):?><tr class="datos"><td><?php echo $ds_director3 ?></td></tr><?php endif;?>
<tr class="encabezado"><td width="100%">MODALIDAD DE PERMANENCIA</td></tr>
<tr class="datos"><td colspan=2><?php echo $ds_modalidad ?></td></tr>
</table>
<div id="firma">
	<table class="firma">
	<tr><td class="fecha">Sevilla, ________ de ___________________________________ de ________</td></tr>
	<tr><td class="fdo">Fdo: <?php echo $dp_nombre . " " . $dp_apellido1 " " . $dp_apellido2; ?> </td></tr>
	<tr><td class="coordinador"><b>SR. COORDINADOR DEL PROGRAMA DE DOCTORADO DE <?php echo $ds_programa ?></b></b></td></tr>
	</table>
</div>
</div>
<div id="hoja2">
<div class="instrucciones">
<h1>1. INSTRUCCIONES</h1>
<ol>
	<li>Imprima <i> (ctrl + p) </i> dos copias de este documento y fírmelas.</li>
	<li>Adjunte a este documento toda la documentación necesaria especificada en el apartado 2.</li>
	<li>Entregue toda la documentación en el <a href="http://institucional.us.es/vrelinstitu/el-registro-general-de-la-universidad-de-sevilla" target="_blank"> Registro de la Universidad de Sevilla </a> antes de la finalización del <a href="www.doctorado.us.es/inicio/calendario" target="_blank"> plazo de presentación de solicitudes </a> y guardese una de las copias selladas.</li>
	<li>Una vez finalice el plazo de presentación de solicitudes la Comisión Académica estudiará su solicitud y le enviará una respuesta sobre la admisión que podrá consultar en el apartado <i> 'Respuestas recibidas' </i> de esta aplicación telemática</li>
</ol>
<h1>2. DOCUMENTACIÓN A APORTAR</h1>
<table class="documentacion">
<?php 
 $app= JFactory::getApplication();
 $host = $app->getCfg('host');
 $usuario = $app->getCfg('user');
 $contraseña = $app->getCfg('password');
 $fabrikdb =  $app->getCfg('fabrikdb');
 mysql_connect($host,$usuario,$contraseña);
 mysql_select_db($fabrikdb);

$programa=$this->groups["Datos Solicitud"]->elements["programa"]->element_raw;
$sql="SELECT id, descripcion FROM t_documentos WHERE programa=$programa OR programa is null order by id asc";

$result=mysql_query($sql);

if($result!=NULL)
{
   if(mysql_num_rows($result)>0)
   {
   	  while($row=mysql_fetch_array($result))
      {
         //here you can work with the results...
         $icono = JPATH_BASE ."/images/checkbox.gif";
         echo "<tr><td colspan='2'><img src='$icono' alt='icon' style='margin:5px;'>".$row['descripcion']."</td></tr>";
      }
   }
     else{
      echo "Error de sql";
   }
   mysql_free_result($result);
}
mysql_close();
?>
</table>
</div>
</div>
</body>
</html>
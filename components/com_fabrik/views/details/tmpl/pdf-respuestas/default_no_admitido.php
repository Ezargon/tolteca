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


//Se obtienen los campos principales del formulario 
$respuesta =  $this->groups["Respuesta"]->elements["id"]->value;
$fecha = $this->groups["Estado Respuesta"]->elements["fecha_finalizada"]->value;
$fecha = new DateTime($fecha);
$tipo_admision = utf8_decode($this->groups["Respuesta"]->elements["admision"]->element_ro);
$motivos = utf8_decode($this->groups["Respuesta"]->elements["motivos_no_admision"]->value);
$reserva = utf8_decode($this->groups["Respuesta"]->elements["reserva"]->value);

$curso =utf8_decode($this->groups["Respuesta"]->elements["curso"]->value[0]);
$cursoid =$this->groups["Respuesta"]->elements["curso"]->element_raw;

//Se prepara la query para acceder a datos cruzados
$sql="SELECT s.id, s.nombre, s.apellido1, s.apellido2, s.sexo, s.nif_nie_pasaporte, p.denominacion,l.denominacion as linea FROM t_solicitudes as s ";
$sql.="INNER JOIN t_programas as p ON s.programa = p.id "; 
$sql.="INNER JOIN t_lineas_inves as l ON p.id = l.programa ";
$sql.="INNER JOIN t_cursos as c ON c.id = s.curso ";
$sql.="WHERE s.linea = l.id AND s.respuesta =" . $respuesta. " ;";

//se prepara la conexion con la bd
$app= JFactory::getApplication();
$host = $app->getCfg('host');
$usuario = $app->getCfg('user');
$contraseña = $app->getCfg('password');
$fabrikdb =  $app->getCfg('fabrikdb');
mysql_connect($host,$usuario,$contraseña);
mysql_select_db($fabrikdb);
$result=mysql_query($sql);

if($result!=NULL)
{
	if(mysql_num_rows($result)==1)
	{
		 $row=mysql_fetch_array($result);
         
         //Se obtiene los campos adicionales 
		 $solicitud= $row['id'];
         $nombre= $row['nombre'];
         $apellidos = $row['apellido1'] . " " . $row['apellido2'];
         $nif = $row['nif_nie_pasaporte'];
         $programa = $row['denominacion'];
         $linea_investigacion = $row['linea'];
         $sexo = $row['sexo'];
    }
   else
   {
      echo "Resultado de búsqueda erróneo. Contacte con el servicio de soporte: admisiondoctorado@us.es";
   }
   mysql_free_result($result);
}
else 
{
	echo "No hay resultados de busqueda. Contacte con el servicio de soporte: admisiondoctorado@us.es";
}
mysql_close();

//encabezado de documento
$texto = "<div id='hoja'>";
$texto .="<table class='encabezado'>";
$texto .="	<tr>";
$texto .="		<td style='width:150px; border-color:white #ccc white white !important;'>";
$texto .="					   <img src='images/header-object.png' heigth='80' width='180'/>";
$texto .="		</td>";
$texto .="		<td style='padding-left:10px;border-color:white;'>";
$texto .="			<h1>NO ADMISIÓN A UN PROGRAMA DE DOCTORADO</h1>";
$texto .="			<h2>REGULADO POR R.D.99/2011 (NORMATIVA REGULADA POR ACUERDO 7.2/CG 17-6-11)</h2>";
$texto .="		</td>";
$texto .="	</tr>";
$texto .="</table>";

($sexo == "H")?$tratamiento = "D.":$tratamiento = "Dª.";

$texto .= " <p class='carta'>La Comisión Académica del programa de doctorado de "; 
//programa
$texto .= " <span class='entrada'>$programa</span>";
$texto .= " siguiendo el procedimiento establecido para la selección de candidatos y conforme a la normativa de aplicación ha acordado otorgar la "; 
//tipo de admisión 
$texto .= " <span class='entrada'> $tipo_admision</span> a ";
//solicitante
$texto .= " <span class='entrada'>$tratamiento $nombre $apellidos</span>";
$texto .= " en el curso $curso en el citado programa por los motivos que se detallan a continuación: </p>";
//motivos
$texto .= " <p class='motivos'> $motivos</p>";
//reserva y reclamación
$texto .= "<p class='carta'>";
if($reserva!="") $texto .=" <p class='carta'> Como consecuencia de la limitación en el número de plazas la Comisión Académica le ha adjudicado la posición $reserva ª en la lista de reserva.";
$texto .=" Ante esta respuesta dispondrá de 10 dias naturales si desea interponer una reclamación ante la Comisión de Doctorado mediante solicitud presentada por Registro General</p>";


if($cursoid<4)
{
	//acreditacion
	$texto.="<div id='firma'>";
	$texto .= "<p class='carta'>El Director de la Escuela Internacional de Doctorado de la Universidad de Sevilla (EIDUS)";
	$texto .= " informa que <span class='entrada'>$tratamiento $nombre $apellidos</span> ha obtenido <span class='entrada'> $tipo_admision</span> en el programa de doctorado ";
	$texto .= " de <span class='entrada'>$programa</span>, regulado por el RD 99/2011, en el curso $curso </p>";

	//Firma

	$meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
	$texto.="Sevilla, ". $fecha->format('j')." de ".$meses[$fecha->format('n')-1]. " de ".$fecha->format('Y') ."<br/><br/>";
	$texto.="<div><img src='images/firmaysello.jpg' style='margin-left:20px;'/></div>";
	$texto.="<p>Fdo. Antonio Delgado García<br/>Director de la Escuela Internacional de Doctorado<br/>de la Universidad de Sevilla (EIDUS)</p>";
}else 
{
	//acreditacion
	$texto.="<div id='firma'>";
	$texto .= "<p class='carta'>La Directora de la Escuela Internacional de Doctorado de la Universidad de Sevilla (EIDUS)";
	$texto .= " informa que <span class='entrada'>$tratamiento $nombre $apellidos</span> ha obtenido <span class='entrada'> $tipo_admision</span> en el programa de doctorado ";
	$texto .= " de <span class='entrada'>$programa</span>, regulado por el RD 99/2011, en el curso $curso </p>";

	//Firma

	$meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
	$texto.="Sevilla, ". $fecha->format('j')." de ".$meses[$fecha->format('n')-1]. " de ".$fecha->format('Y') ."<br/><br/>";

	$texto.="<div><img src='images/firmaysello2.jpg' style='margin-left:20px;'/></div>";
	$texto.="<p>Fdo. Mar&iacute;a del Carmen Gallardo Cruz<br/>Directora de las Escuelas Internacionales de Posgrado y Doctorado<br/>de la Universidad de Sevilla</p>";	
}
$texto.="</div>";
$texto.="</div>";

echo $texto;






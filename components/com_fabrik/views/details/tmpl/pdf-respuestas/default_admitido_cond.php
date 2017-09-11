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
$tutor = $this->groups["Respuesta"]->elements["tutor"]->value;
$modalidad = utf8_decode($this->groups["Respuesta"]->elements["modalidad"]->element_ro);
$tipo_admision = utf8_decode($this->groups["Respuesta"]->elements["admision"]->element_ro);
//eag-i
$linea_investigacion = utf8_decode($this->groups["Respuesta"]->elements["linea"]->element_ro);
//eag-f

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
         //eag: $linea_investigacion = $row['linea'];
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
$texto .="			<h1>ADMISIÓN A UN PROGRAMA DE DOCTORADO</h1>";
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
$texto .= " <span class='entrada'> $tipo_admision</span> a la superación de los complementos formativos que se detallan, a  ";
//solicitante
$texto .= " <span class='entrada'>$tratamiento $nombre $apellidos</span>";
$texto .= " en el curso $curso para la realización de la tesis doctoral en la línea de investigación ";
//linea de investigacion
$texto .= " <span class='entrada'> $linea_investigacion</span>";
$texto .= ", con la modalidad de estudiante a ";
//modalidad
$texto .= "<span class='entrada'>$modalidad</span>";

if($tutor <> "")
{
	$texto .= " y asignándole como TUTOR/A al profesor/a Dr/a"; 
	//tutor
	$texto .= " <span class='entrada'>". utf8_decode($tutor) ."</span>";
	$texto .= " así como DIRECTOR/ES a los profesor/es:</p>";
}
else 
{
	$texto .= " y asignándole como DIRECTOR/ES a los profesor/es:</p>";
}
//directores
$texto .= generaTablaGrupos ($this->groups["Directores asignados"],"directores");

$texto .= " <p class='carta'>De acuerdo con lo establecido en el art. 3.12 de la normativa de matrícula del curso 2016/2017, ";
$texto .= " el estudiante admitido condicionalmente deberá formalizar la matrícula de tutela académica en la unidad responsable de la gestión de los estudios de doctorado de la EIDUS en la fase de adjudicación en la que hayan resultado admitidos, previa comprobación del cumplimiento de los requisitos referidos en el art.3.1 de la citada normativa "; 
$texto .= " y superar, en el presente curso académico, los complementos que se detallan a continuación:</p>";
$texto .= generaTablaGrupos ($this->groups["Complementos de formacion"],"complementos");

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

function generaTablaGrupos($grupos,$clasetabla)
{
	$html = "";
	//$grupos = $this->groups[$nombregrupo];	
	$html .="<table class='$clasetabla'>";
	$fila=0;
	$filath ="<tr>";
	foreach ($grupos->subgroups as $grupo) :
	//print_r($grupo);
		$filatd ="<tr>";
		$columna=0;
		foreach ($grupo as $campo) :
			if($fila==0)
			{
				//imprime encabezado
				if(!$campo->hidden):
				$filath .="<th> " . utf8_decode($campo->label) . "</th>";
				endif;
			}
			//imprime datos
			if(!$campo->hidden):
				$filatd .="<td> " . utf8_decode($campo->element) . "</td>";
				//$etiqueta = $campo->label;
				$columna++;
			endif;
		endforeach;
		$filath .="</tr>";
		$filatd .="</tr>";
		
		if($fila==0)
			$html.= $filath;
		$html .= $filatd;
		$fila++;
	endforeach;
	$html .="</table>";
	return $html;
}



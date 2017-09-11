<?php
/**
 * This is a sample email template. It will just print out all of the request data:
 *
 * @package     Joomla.Plugin
 * @subpackage  Fabrik.form.email
 * @copyright   Copyright (C) 2005-2013 fabrikar.com - All rights reserved.
 * @license     GNU/GPL http://www.gnu.org/copyleft/gpl.html
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

$codigoSolicitud = $this->data['t_respuestas___codigo_solicitud'];
$programa = JArrayHelper::getValue($this->data['t_respuestas___programa'], 0, '');
$admision = $this->data['t_respuestas___admision'];
$motivosSubsanacion = $this->data['t_respuestas___motivos_subsanacion'];

$id_estado = JArrayHelper::getValue($this->data['t_respuestas___estado_raw'], 0, '');
$id_admision = JArrayHelper::getValue($this->data['t_respuestas___admision_raw'], 0, '');
$id_solicitud = JArrayHelper::getValue($this->data['t_respuestas___solicitud_raw'], 0, '');
$id_respuesta = $this->data['t_respuestas___id'];
if($id_estado == 8)
{
	//RESPUESTA PROVISIONAL
	$texto  ="        <div><h3>Su solicitud de admisi&oacute;n $codigoSolicitud ha sido respondida de forma PROVISIONAL</h3>";
	$texto .="			<p>La Comisi&oacute;n Acad&eacute;mica del Programa de Doctorado de <b>$programa</b> despu&eacute;s de haber analizado y baremado";
	$texto .="     		 todas las solicitudes ha acordado la <b>$admision</b> PROVISIONAL de su solicitud $codigoSolicitud</p>";
	$texto .="           <p>Para conocer la respuesta completa de la Comisi&oacute;n Acad&eacute;mica haga clic en el siguiente enlace:";
	$texto .="           <a href='http://admisiondoctorado.us.es/respuestas-recibidas/details/6/$id_respuesta' target='_blank'>Detalles de la respuesta</a></p>";
	$texto .="           <p>Le recordamos que seg&uacute;n el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula'>calendario oficial</a> del 11 al 25 de abril la Comisi&oacute;n Acad&eacute;mica proceder&aacute; a la adjudicaci&oacute;n definitiva de las plazas. Los solicitantes tendr&aacute;n que esperar a la adjudicaci&oacute;n definitiva para realizar la matr&iacute;cula de tutela acad&eacute;mica y complementos de formaci&oacute;n si procediese<p>";
	$texto .="           </p>";
	$texto .="	         <p>Mas informaci&oacute;n: <a href='http://admisiondoctorado.us.es/ayuda/tipo-admision'>Tipos de admisi&oacute;n</a></p>";
	$texto .="           <p>Por favor, NO RESPONDA a este email, es un env&iacute;o autom&aacute;tico. Para cualquier duda acad&eacute;mica al respecto, puede ponerse en contacto con los responsables del programa de doctorado cuyos datos de contacto aparecen en el siguiente enlace: <a href='http://www.doctorado.us.es/acceso/sedes-de-programas'>Sedes de programas</a> </p>";
    $texto .="        </div>";
}
if($id_estado == 9)
{
	//RESPUESTA PDTE SUBSANACIÓN
	$texto   ="      <div><h3>Su solicitud $codigoSolicitud se encuentra PENDIENTE DE SUBSANACI&Oacute;N</h3>";
	$texto .= "			<p>La Comisi&oacute;n Acad&eacute;mica del programa de $programa, despu&eacute;s de haber analizado su solicitud ha estimado que necesita subsanar su solicitud de admisi&oacute;n a los Estudios de Doctorado por los siguientes motivos:</p>";
    $texto .= "			<p style='margin-left:20px;'><i>$motivosSubsanacion</i></p>";
    $texto .= "			<p>Para subsanar la solicitud haga clic en el siguiente enlace: <a href='http://admisiondoctorado.us.es/mis-solicitudes/form/3/$id_solicitud' target='_blank'>Subsanar solicitud</a>";
	$texto .= "		    </p>";
	$texto .= "		    <p>Seg&uacute;n el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula'>calendario oficial</a> dispondr&aacute; hasta el 10 de abril de 2017 para subsanar la solicitud. <b>Si despu&eacute;s de esta fecha la solicitud no ha sido subsanada &eacute;sta no tendr&aacute; validez</b>.</p>";
	$texto .= "		    <p>Por favor, NO RESPONDA a este email, es un env&iacute;o autom&aacute;tico. Para cualquier duda acad&eacute;mica al respecto, puede ponerse en contacto con los responsables del programa de doctorado cuyos datos de contacto aparecen en el siguiente enlace: <a href='http://www.doctorado.us.es/acceso/sedes-de-programas'>Sedes de programas</a> </p>";
	$texto .= "	     </div>";
}
if($id_estado == 11)
{
	//RESPUESTA FINALZIADA
	$texto  ="        <div><h3>Su solicitud de admisi&oacute;n $codigoSolicitud ha sido respondida</h3>";
	$texto .="			<p>La Comisi&oacute;n Acad&eacute;mica del Programa de Doctorado de <b>$programa</b> despu&eacute;s de haber analizado y baremado";
	$texto .="     		 todas las solicitudes ha acordado la <b>$admision</b> de su solicitud $codigoSolicitud</p>";
	$texto .="           <p>Para conocer la respuesta completa de la Comisi&oacute;n Acad&eacute;mica haga clic en el siguiente enlace:";
	$texto .="           <a href='http://admisiondoctorado.us.es/respuestas-recibidas/details/6/$id_respuesta' target='_blank'>Detalles de la respuesta</a>";
	$texto .="           </p>";
	if($id_admision == 1) {$texto .= "<p>En caso de no admisi&oacute;n, dispondr&aacute; de 10 d&iacute;as naturales para interponer una reclamaci&oacute;n ante la Comisi&oacute;n de Doctorado mediante solicitud presentada por <a target='_blank' href='https://institucional.us.es/vrelinstitu/el-registro-general-de-la-universidad-de-sevilla'>Registro General</a>.</p>";}
	$texto .="	         <p>Mas informaci&oacute;n: <a href='http://admisiondoctorado.us.es/ayuda/tipo-admision'>Tipos de admisi&oacute;n</a></p>";
	$texto .="           <p>Por favor, NO RESPONDA a este email, es un env&iacute;o autom&aacute;tico. Para cualquier duda acad&eacute;mica al respecto, puede ponerse en contacto con los responsables del programa de doctorado cuyos datos de contacto aparecen en el siguiente enlace: <a href='http://www.doctorado.us.es/acceso/sedes-de-programas'>Sedes de programas</a> </p>";
    $texto .="        </div>";

}

?>
<html>
  <head>
    <style>
     body {font-family: Arial, Verdana; font-size:13px;}
     h1 {font-size:22px; color:#333; font-weight:normal;margin-left:20px; }
     h2 {font-size:16px; color:#B60C25; font-weight:normal;margin-left:20px;}
     div.marco {margin:15px; padding:9px; border:1px solid #ddd; border-radius:5px; width:700px;}
    </style>
  </head>
  <body>
    <div class="marco">
		<div class="logo-us">
			<img src='http://admisiondoctorado.us.es/images/header-object.png'/>
		</div>
		<div class="texto">
		<?php 
			  echo $texto;
		?>
		</div>
	</div>
</body>
</html>


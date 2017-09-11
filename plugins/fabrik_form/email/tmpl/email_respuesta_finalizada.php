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

if($id_estado == 7)
{
	//RESPUESTA PDTE ENVIO
	$texto   ="      <div><h3>Su solicitud $codigoSolicitud se encuentra PENDIENTE DE SUBSANACIÓN</h3>";
	$texto .= "			<p>La Comisión Académica del programa de $programa, después de haber analizado su solicitud ha estimado que necesita subsanar su solicitud de admisión a los Estudios de Doctorado por los siguientes motivos:</p>";
    $texto .= "			<p style='margin-left:20px;'><i>$motivosSubsanacion</i></p>";
    $texto .= "			<p>Para subsanar la solicitud haga clic en el siguiente enlace: <a href='http://admisiondoctorado.us.es/mis-solicitudes/form/3/$id_solicitud' target='_blank'>Subsanar solicitud</a>";
	$texto .= "		    </p>";
	$texto .= "		    <p>Dispondrá de 10 días naturales a partir de esta notificación para subsanar la solicitud. Si después de ese tiempo la solicitud no ha sido subsanada no tendrá validez.</p>";
	$texto .= "		    <p>Por favor, NO RESPONDA a este email, es un envío automático. Para cualquier duda acad&eacute;mica al respecto, puede ponerse en contacto con los responsables del programa de doctorado cuyos datos de contacto aparecen en el siguiente enlace: <a href='http://www.doctorado.us.es/acceso/sedes-de-programas'>Sedes de programas</a> </p>";
	$texto .= "	     </div>";
}
if($cod_estado == 9)
{
	//RESPUESTA FINALZIADA
	$texto  ="        <div><h3>Su solicitud de admisi&oacute;n $codigoSolicitud ha sido respondida</h3>";
	$texto .="			<p>La Comisi&oacute;n Acad&eacute;mica del Programa de Doctorado de <b><?php echo $programa;?></b> despu&eacute;s de haber analizado y baremado";
	$texto .="     		 todas las solicitudes ha acordado la <b>$admision</b> de su solicitud <?php echo $codigoSolicitud;?></p>";
	$texto .="           <p>Para conocer la respuesta completa de la Comisi&oacute;n Acad&eacute;mica haga clic en el siguiente enlace:";
	$texto .="           <a href='http://admisiondoctorado.us.es/respuestas-recibidas/details/6/$id_respuesta' target='_blank'>Detalles de la respuesta</a>";
	$texto .="           </p>";
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
  	    <table>
			<tr>
				<td><div class="logo-us"><img src='http://www.doctorado.us.es/templates/doctorado/images/header-object.png'/></div></td>
				<td>
					<h1>Estudios de Doctorado</h1>
					<h2>Plataforma telem&aacute;tica de acceso a doctorado</h2>
				</td>
			</tr>
		</table>
		<?php 
			  echo $texto;
		?>
	</div>
</body>
</html>


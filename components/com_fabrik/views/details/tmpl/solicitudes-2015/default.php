<?php
/**
 * Bootstrap Tabs Form Template
 *
 * @package     Joomla
 * @subpackage  Fabrik
 * @copyright   Copyright (C) 2005-2013 fabrikar.com - All rights reserved.
 * @license     GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @since       3.1
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

/*************************************************OBTENEMOS EL GRUPO DEL USUARIO********************/
$user   = JFactory::getUser();

$userid = $user->get('id');
$usergroups = JAccess::getGroupsByUser($userid);

if(in_array(11, $usergroups)) $perfil = "estudiante";
if(in_array(10, $usergroups)) $perfil = "coordinador";
if(in_array(12, $usergroups)) $perfil = "administrador";

/**************DATOS DE LA SOLICITUD***************/

$respuesta = $this->groups["Datos Solicitud"]->elements["respuesta"]->value;
$solicitud = $this->groups["Datos Solicitud"]->elements["id"]->value;
$estado    = $this->groups["Datos Solicitud"]->elements["estado"]->element_raw;
$estadoEtiqueta    = $this->groups["Datos Solicitud"]->elements["estado"]->value[0];
$codigo    = $this->groups["Datos Solicitud"]->elements["codigo"]->value;
$email    = $this->groups["Datos Personales"]->elements["email"]->value;
$linea = $this->groups["Datos Solicitud"]->elements["linea"]->element_raw;
$tutor = $this->groups["Datos Solicitud"]->elements["tutor_tesis"]->value;
$modalidad = $this->groups["Datos Solicitud"]->elements["modalidad"]->value;
$titulo = $this->groups["Datos Personales"]->elements["nombre"]->value ." ". $this->groups["Datos Personales"]->elements["apellido1"]->value ." ".$this->groups["Datos Personales"]->elements["apellido2"]->value." - ". $this->groups["Datos Solicitud"]->elements["codigo"]->value;
$curso = $this->groups["Datos Solicitud"]->elements["curso"]->element_raw;
$validada = $this->groups["Documentacion"]->elements["validada"]->value;
$revisada = $this->groups["Documentacion"]->elements["revisada"]->value;
$pais_univ = $this->groups["Datos Academicos"]->elements["pais_univ"]->element_raw;

/************* OBTENEMOS EL CURSO ACTUAL *****************************/
$app= JFactory::getApplication();
$cursoactual = $app->getCfg('cursoactual');

/************************PREPARACION DE ARRAYS **********************/
$item= array();
$item['estudiante'] = array();
$item['estudiante']['solicitud'] = 113;
$item['estudiante']['respuesta'] = 123;
$item['coordinador'] = array();
$item['coordinador']['solicitud'] = 114;
$item['coordinador']['respuesta'] = 117;
$item['administrador'] = array();
$item['administrador']['solicitud'] = 121;
$item['administrador']['respuesta'] = 122;

$url=$_SERVER['REQUEST_URI'];
if(strpos($url,"historico"))
{
	$item['coordinador']['solicitud'] = 128;
	$item['coordinador']['respuesta'] = 129;
	$item['administrador']['solicitud'] = 130;
	$item['administrador']['respuesta'] = 131;
}
/*************************PREPARACION DE BOTONES*******************************************/
$botones = array();
switch($estado)
{
	case 1: //PENDIENTE DE ENVIO
		switch($perfil)
		{
			case "estudiante":
				//PDF
				$this->showPDF = false;
				//boton1
				if($curso == $cursoactual)
				{
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Modificar solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=form&formid=3&Itemid=".$item[$perfil]['solicitud']."&rowid=$solicitud";
					$botones[1]['class'] = "btn btn-primary";
					//MENSAJE DE CABECERA
					$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta. ";
					$mensajeCabecera .= "Podr&aacute; modificarla o adjuntar documentaci&oacute;n antes de que finalice el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula' target='_blank'>plazo de presentaci&oacute;n de solicitudes</a>.";
					//ID0000003-I
					$mensajeCabecera .= "<br>Una vez cumplido el plazo, las solicitudes que no hayan sido enviadas no ser&aacute;n v&aacute;lidas y no tendr&aacute;n efectos en la admisi&oacute;n al programa.";
					//ID0000003-F
				}
				else
				{
					//MENSAJE DE CABECERA
					$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta. El plazo ha terminado. No puede modificar ni enviar su solicitud.";
				}
				//boton2
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud'];
				$botones[2]['class'] = "btn";

				break;
			case "coordinador":
				$botones = null;
				break;
			case "administrador":
				$botones = array();
				//PDF
				$this->showPDF = false;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___programa";
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
	case 2: //ENVIADA
		switch($perfil)
		{
			case "estudiante":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta y est&aacute; pendiente de respuesta por la Comisi&oacute;n Acad&eacute;mica. Se le enviar&aacute; un email de notificaci&oacute;n cuando sea respondida";
				break;
			case "coordinador":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				/*ID0000001-I*/
				if($curso == $cursoactual)
				{
					if($respuesta == 0)
					{
						if($pais_univ!="724" && $revisada=="0")
						{
							//MENSAJE DE CABECERA
							$mensajeCabecera = "<h2>Solicitud pendiente de revisi&oacute;n administrativa </h2> Esta solicitud se encuentra pendiente de validaci&oacute;n administrativa de <b>requisitos de acceso.</b> <br/>Una vez sea que la solicitud sea validada por el personal del Servicio de Doctorado podr&aacute; ver los detalles y darle respuesta";
							$this->showPDF = false;
						}
						if($pais_univ!="724" && $revisada=="1" && $validada=="0")
						{
							//MENSAJE DE CABECERA
							$mensajeCabecera = "<h2>Solicitud revisada y no v&aacute;lida. </h2> Esta solicitud no ha sido validada por el personal administrativo por no cumplir los requisitos de acceso.";
							$this->showPDF = false;
						}
						if($pais_univ=="724" || ($pais_univ!="724" && $validada=="1" && $validada=="1"))
						{
							$botones[1]['etiqueta'] = "Responder solicitud";
							$botones[1]['url'] = "index.php?option=com_fabrik&view=form&formid=6&t_respuestas___solicitud_raw=".$solicitud;
							$botones[1]['url'] = $botones[1]['url']. "&t_respuestas___email=$email";
							$botones[1]['url'] = $botones[1]['url']. "&t_respuestas___codigo_solicitud=$codigo";
							$botones[1]['url'] = $botones[1]['url']. "&t_respuestas___linea_raw=$linea";
							$botones[1]['url'] = $botones[1]['url']. "&t_respuestas___tutor=$tutor";
							$botones[1]['url'] = $botones[1]['url']. "&t_respuestas___modalidad=$modalidad";
							$botones[1]['url'] = $botones[1]['url']. "&Itemid=" . $item[$perfil]['respuesta'] = 117;
							$botones[1]['class'] = "btn btn-primary";
							
							//MENSAJE DE CABECERA
							$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta.  Pulse en <b>Responder solicitud</b> para dar una respuesta";
						}

					}
					if($respuesta != 0)
					{
						$botones[1] = array();
						$botones[1]['etiqueta'] = "Modificar respuesta";
						$botones[1]['url'] = "index.php?option=com_fabrik&view=form&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
						$botones[1]['class'] = "btn btn-primary";

						//MENSAJE DE CABECERA
						$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta.  Pulse en <b>Modificar respuesta</b> para modificar la respuesta.";
						
					}
				}
				else
				{
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Ver respuesta";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
					$botones[1]['class'] = "btn btn-primary";
					
					//MENSAJE DE CABECERA
					$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta.  El plazo ha terminado, no puede finalizar la respuesta a esta solicitud.";
						
				}
				/*ID0000001-F*/
				//boton2
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___estado";
				$botones[2]['class'] = "btn";
				
				break;
			case "administrador":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___programa";
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
		case 3: //PROVISIONAL
			switch($perfil)
			{
				case "estudiante":
					//PDF
					$this->showPDF = true;
					//boton2
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Ver respuesta";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
					$botones[1]['class'] = "btn btn-primary";
					//boton3
					$botones[2] = array();
					$botones[2]['etiqueta'] = "Volver al listado";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud'];
					$botones[2]['class'] = "btn";
					//MENSAJE DE CABECERA
					$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta. Pulse sobre el bot&oacute;n <b>".$botones[1]['etiqueta']."</b> para ver los detalles";
					break;
				case "coordinador":
					//PDF
					$this->showPDF = true;
					//boton1
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Ver respuesta";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
					$botones[1]['class'] = "btn btn-primary";
					//boton2
					$botones[2] = array();
					$botones[2]['etiqueta'] = "Volver al listado";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___estado";
					$botones[2]['class'] = "btn";
					//MENSAJE DE CABECERA
					$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
					break;
				case "administrador":
					//PDF
					$this->showPDF = true;
					//boton1
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Ver respuesta";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta']."&t_respuestas___linea_raw=$linea";
					$botones[1]['class'] = "btn btn-primary";
					//boton3
					$botones[2] = array();
					$botones[2]['etiqueta'] = "Volver al listado";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___programa";
					$botones[2]['class'] = "btn";
					//MENSAJE DE CABECERA
					$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
					break;
			}
			break;		
	case 4: //PENDIENTE SUBSANAR
		switch($perfil)
		{
			case "estudiante":
				//MENSAJE DE CABECERA
				$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta. ";
								
				//PDF
				$this->showPDF = false;
				//boton1
				if($curso == $cursoactual)
				{
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Subsanar solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=form&formid=3&Itemid=".$item[$perfil]['solicitud']."&rowid=$solicitud";
					$botones[1]['class'] = "btn btn-primary";
					
					$mensajeCabecera .= "Pulse en el bot&oacute;n <b>".$botones[2]['etiqueta']."</b> para ver los motivos de la subsanaci&oacute;n. Para subsanar la solicitud pulse sobre <b>".$botones[1]['etiqueta']."</b>. Dispone hasta el 10 de Abril 2017 para subsanar la solicitud. Si la solicitud no es subsanada antes de esta fecha no tendr&aacute; validez";				
				}
				else
				{
					$mensajeCabecera .=" No se puede subsanar una solicitud de un plazo anterior.";
				}
				//boton2
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Ver respuesta";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
				$botones[2]['class'] = "btn btn-primary";
				//boton3
				$botones[3] = array();
				$botones[3]['etiqueta'] = "Volver al listado";
				$botones[3]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud'];
				$botones[3]['class'] = "btn";
				break;
			case "coordinador":
				//PDF
				$this->showPDF = false;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Ver respuesta";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
				$botones[1]['class'] = "btn btn-primary";
				//boton2
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___estado";
				$botones[2]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. Por favor, espere a que la solicitud sea subsanada para emitir una nueva respuesta";
				break;
			case "administrador":
				//PDF
				$this->showPDF = false;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Ver respuesta";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta']."&t_respuestas___linea_raw=$linea";
				$botones[1]['class'] = "btn btn-primary";
				//boton3
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___programa";
				$botones[2]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
	case 5: //SUBSANADA
		switch($perfil)
		{
			case "estudiante":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta y est&aacute; pendiente de respuesta final por la Comisi&oacute;n Acad&eacute;mica. Se le enviar&aacute; un email de notificaci&oacute;n cuando sea respondida";
				break;
			case "coordinador":
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta.";
				
				//PDF
				$this->showPDF = true;
				//boton1
				if($curso == $cursoactual)
				{
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Modificar respuesta";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=form&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
					$botones[1]['class'] = "btn btn-primary";
					$mensajeCabecera .= " Para emitir una nueva valoraci&oacute;n pulse sobre el bot&oacute;n <b>". $botones[1]['etiqueta']."</b>";
				}
				else 
				{
					$mensajeCabecera .= " El plazo ha finalizado y no es posible emitir respuesta a una solicitud fuera del plazo actual.</b>";
				}
				//boton2
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___estado";
				$botones[2]['class'] = "btn";
				
				break;
			case "administrador":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Ver respuesta";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta']."&t_respuestas___linea_raw=$linea";
				$botones[1]['class'] = "btn btn-primary";
				//boton3
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___programa";
				$botones[2]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
	case 6: //RESPONDIDA
		switch($perfil)
		{
			case "estudiante":
				//PDF
				$this->showPDF = true;
				//boton2
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Ver respuesta";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
				$botones[1]['class'] = "btn btn-primary";
				//boton3
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud'];
				$botones[2]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "Su solicitud se encuentra en estado $estadoEtiqueta. Pulse sobre el bot&oacute;n <b>".$botones[1]['etiqueta']."</b> para ver los detalles";
				break;
			case "coordinador":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Ver respuesta";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta'];
				$botones[1]['class'] = "btn btn-primary";
				//boton2
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___estado"; 
				$botones[2]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
				break;
			case "administrador":
				//PDF
				$this->showPDF = true;
				//boton1
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Ver respuesta";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=6&rowid=$respuesta&Itemid=".$item[$perfil]['respuesta']."&t_respuestas___linea_raw=$linea";
				$botones[1]['class'] = "btn btn-primary";
				//boton3
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=3&Itemid=".$item[$perfil]['solicitud']."&group_by=t_solicitudes___programa";
				$botones[2]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La solicitud se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
	default:
	    {
	    	//PARQUE CUTRE: ESTE DEFAULT ARREGLA UN FALLO DEL FORMULARIO SOLICITUDES, NO FUNCIONA LA VALIDACION DE DOCUMENTACIÓN Y NO SE PORQUE SALE EL MODO DETAIL, ASI QUE REENVIO DE NUEVO AL FORMULARIO. 
			$url="http://".$_SERVER['HTTP_HOST'].":".$_SERVER['SERVER_PORT'].$_SERVER['REQUEST_URI'];
			header("Location:". $url."?errordoc=1");
			//echo "[VISTA DETALLE].No se encuentra el estado de la solicitud: contacte con admisiondoctorado@us.es";
		}

}
/******************************************************************************************************/
$form = $this->form;
$model = $this->getModel();
$groupTmpl = $model->editable ? 'group' : 'group_details';
$active = ($form->error != '') ? '' : ' fabrikHide';

?>
	<div class="page-header">
		<h2><?php echo $titulo;?></h2>
	</div>
<?php

echo $form->intro;

if ($model->editable) :
		echo '<form method="post" action="' . $form->action . '" ' . $form->attribs . '>';
	else:
		echo '<div class="fabrikForm fabrikDetails" id="' . $form->formid . '">';
endif;
echo $this->plugintop;
/*******************MENSAJES  Y BOTONES **************************************/

echo "<div class='alert'><p>". $mensajeCabecera ."</p></div>";

foreach($botones as $boton):
	?> <a class="<?php echo $boton['class']?>" href="<?php echo $boton['url']?>"><?php echo $boton['etiqueta']?></a><?php
endforeach;

/*************************************************************************************************************/
if ($this->showPrint):?>
			<a class="btn" data-fabrik-print href="<?php echo $this->printURL?>">
				<i class="icon-print"></i>
				<?php echo JText::_('JGLOBAL_PRINT')?>
			</a>
		<?php 
endif;
	
if ($this->showEmail): ?>
			<a class="btn fabrikWin" rel='{"title":"<?php echo JText::_('JGLOBAL_EMAIL'); ?>", "loadMethod":"iframe", "height":"300px"}' href="<?php echo $this->emailURL?>">
				<i class="icon-envelope"></i>
				<?php echo JText::_('JGLOBAL_EMAIL'); ?>
			</a>
<?php endif;

if ($this->showPDF):?>
			<a class="btn" href="<?php echo $this->pdfURL?>">
				<i class="icon-file"></i>
				<?php echo JText::_('COM_FABRIK_PDF')?>
			</a>
<?php endif;
?>

<div class="fabrikMainError alert alert-error fabrikError<?php echo $active?>">
	<button class="close" data-dismiss="alert">Ã—</button>
	<?php echo $form->error?>
</div>

<div class="row-fluid nav">
	<div class="span6 pull-right">
		<?php
		echo $this->loadTemplate('buttons');
		?>
	</div>
	<div class="span6">
		<?php
		echo $this->loadTemplate('relateddata');
		?>
	</div>
</div>
<?php if($perfil!="coordinador" ||($pais_univ=="724" || ($pais_univ!="724" && $revisada=="1" && $validada=="1")))
{?>
<ul class="nav nav-tabs">
	<?php
	$i = 0;
	foreach ($this->groups as $group) :
		// If this ismultipage then groups are consolidated until a group with a page break
		// So we should only show a tab if: it is first tab, or if it is a page break
		if (!$model->isMultiPage() || $i == 0 || $group->splitPage) :
			?>
				<li <?php if ($i == 0) echo 'class="active"'?>>
					<a href="#group-tab<?php echo $i;?>" data-toggle="tab">
						<?php
							if (!empty($group->title))
							{
								echo $group->title;
							}
							else
							{
								echo $group->name;
							}
						?>
					</a>
				</li>
			<?php
			$i ++;
		endif;
	endforeach;
	?>
</ul>
<div class="tab-content">
	<?php

	$i = 0;
	foreach ($this->groups as $group) :
		$this->group = $group;
		if ($i == 0 || !$model->isMultiPage() || $group->splitPage) :
			if ($i != 0)
			{
				echo '</div>';
			}
			?>
			<div class="tab-pane<?php if ($i == 0) echo " active"?>" id="group-tab<?php echo $i;?>">
			<?php
			$i++;
		endif; ?>
			<fieldset class="<?php echo $group->class; ?>" id="group<?php echo $group->id;?>" style="<?php echo $group->css;?>">
				<?php
				$allHidden = true;
				foreach ($group->elements as $element)
				{
					$allHidden &= $element->hidden;
				}
				if ((!$allHidden || !empty($group->intro)) && trim($group->title) !== '') :?>
					<legend class="legend"><?php echo $group->title;?></legend>
				<?php
				endif;

				if (!empty($group->intro)) : ?>
					<div class="groupintro"><?php echo $group->intro ?></div>
				<?php
				endif;

				/* Load the group template - this can be :
				 *  * default_group.php - standard group non-repeating rendered as an unordered list
				 *  * default_repeatgroup.php - repeat group rendered as an unordered list
				 *  * default_repeatgroup_table.php - repeat group rendered in a table.
				 */
				$this->elements = $group->elements;
				echo $this->loadTemplate($group->tmpl);

				if (!empty($group->outro)) : ?>
					<div class="groupoutro"><?php echo $group->outro ?></div>
				<?php
				endif;
			?>
			</fieldset>
		<?php
	endforeach;
	?>
	</div>
</div>
<?php
}


if ($model->editable) : ?>
<div class="fabrikHiddenFields">
	<?php echo $this->hiddenFields; ?>
</div>
<?php
endif;

echo $this->pluginbottom;
echo $this->loadTemplate('actions');
?>
</form>
<?php
if ($model->editable) :
		echo '</form>';
	else:
		echo '</div>';
endif;
echo $form->outro;
echo $this->pluginend;
echo FabrikHelperHTML::keepalive();

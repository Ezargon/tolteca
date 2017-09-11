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

/*************************************************OBTENEMOS EL GRUPO DEL USUARIO********************/
$user   = JFactory::getUser();
$userid = $user->get('id');
$usergroups = JAccess::getGroupsByUser($userid);

if(in_array(11, $usergroups)) $perfil = "estudiante";
if(in_array(10, $usergroups)) $perfil = "coordinador";
if(in_array(12, $usergroups)) $perfil = "administrador";

/******************************datos de la solicitud**********************************/
$solicitud = $this->groups["Datos solicitud"]->elements["solicitud"]->element_raw;
$codigoSolicitud = $this->groups["Datos solicitud"]->elements["codigo_solicitud"]->value;
$admision =$this->groups["Respuesta"]->elements["admision"]->value[0];
$estado   =$this->groups["Estado Respuesta"]->elements["estado"]->element_raw;
$estadoEtiqueta =$this->groups["Estado Respuesta"]->elements["estado"]->value[0];
$subsanada = $this->groups["Subsanacion"]->elements["subsanada"]->value;
$fechaRespuesta = $this->groups["Respuesta"]->elements["date_time"]->value;
$fechaSubsanacion = new DateTime($fechaRespuesta);
$curso = $this->groups["Respuesta"]->elements["curso"]->element_raw;

/************* OBTENEMOS EL CURSO ACTUAL *****************************/
$app= JFactory::getApplication();
$cursoactual = $app->getCfg('cursoactual');

/************************PREPARACION DE ARRAYS DE ENLACES **********************/
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
	case 7: //ABIERTA
		switch($perfil)
		{
			case "estudiante":
				//PDF
				$this->showPDF = false;
				//SIN BOTONES
				break;
			case "coordinador":
				//MENSAJES DE CABECERA
				$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. ";
				//PDF
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";
				//BOTON 2: MODIFICAR RESPUESTA
				if($curso == $cursoactual)
				{
					$botones[2]= array();
					$botones[2]['etiqueta'] = "Modificar respuesta";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=form&Itemid=117&formid=6&listid=6&rowid=$this->rowid";
					$botones[2]['class'] = "btn btn-primary";
					
					$mensajeCabecera .= "Podr&aacute; ser modificada antes de que finalice el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula' target='_blank'>plazo de adjudicaci&oacute;n de plazas</a>.";
				}
				else{
					$mensajeCabecera .= "Esta respuesta pertenece a una solicitud de un plazo anterior. No es posible finalizar la respuesta a esta solicitud.";
				}
				//BOTON 3: VOLVER AL LISTADO
				$botones[3] = array();
				$botones[3]['etiqueta'] = "Volver al listado";
				$botones[3]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
				$botones[3]['class'] = "btn";
				//
				break;
			case "administrador":
				//PDF
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";				
				//BOTON 2: VOLVER AL LISTADO
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La respuesta se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
		case 8: //PROVISIONAL
			switch($perfil)
			{
				case "estudiante":
					//PDF
					$this->showPDF = false;
					//BOTON 1: VER SOLICITUD
					$botones[1]= array();
					$botones[1]['etiqueta'] = "Ver solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
					$botones[1]['class'] = "btn btn-primary";
					$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. ";
					break;
				case "coordinador":
					//MENSAJES DE CABECERA
					$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. ";
					//PDF
					$this->showPDF = false;
					//BOTON 1: VER SOLICITUD
					$botones[1]= array();
					$botones[1]['etiqueta'] = "Ver solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
					$botones[1]['class'] = "btn btn-primary";
					//BOTON 2: MODIFICAR RESPUESTA
					if($curso == $cursoactual)
					{
						$botones[2]= array();
						$botones[2]['etiqueta'] = "Modificar respuesta";
						$botones[2]['url'] = "index.php?option=com_fabrik&view=form&Itemid=117&formid=6&listid=6&rowid=$this->rowid";
						$botones[2]['class'] = "btn btn-primary";
							
						$mensajeCabecera .= "Podr&aacute; ser modificada antes de que finalice el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula' target='_blank'>plazo de adjudicaci&oacute;n de plazas</a>.";
					}
					else{
						$mensajeCabecera .= "Esta respuesta pertenece a una solicitud de un plazo anterior. No es posible finalizar la respuesta a esta solicitud.";
					}
					//BOTON 3: VOLVER AL LISTADO
					$botones[3] = array();
					$botones[3]['etiqueta'] = "Volver al listado";
					$botones[3]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
					$botones[3]['class'] = "btn";
					//
					break;
				case "administrador":
					//PDF
					$this->showPDF = false;
					//BOTON 1: VER SOLICITUD
					$botones[1]= array();
					$botones[1]['etiqueta'] = "Ver solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
					$botones[1]['class'] = "btn btn-primary";
					//BOTON 2: VOLVER AL LISTADO
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Volver al listado";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
					$botones[1]['class'] = "btn";
					//MENSAJE DE CABECERA
					$mensajeCabecera = "La respuesta se encuentra en estado $estadoEtiqueta. ";
					break;
			}
			break;		
	case 9: //PENDIENTE DE SUBSANAR
		switch($perfil)
		{
			case "estudiante":
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";
				//BOTON 2: SUBSANAR SOLICITUD
				//ID0000006-I
				//ID0000006 if(!$subsanada)
				//ID0000006 {
					$botones[2]= array();
					$botones[2]['etiqueta'] = "Subsanar solicitud";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=form&formid=3&Itemid=".$item[$perfil]['solicitud']."&rowid=$solicitud";
					$botones[2]['class'] = "btn btn-primary";				
				//ID0000006 }
				//ID0000006
				//BOTON 3: VOLVER AL LISTADO
				$botones[3] = array();
				$botones[3]['etiqueta'] = "Volver al listado";
				$botones[3]['url'] = $url_listado = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta'];
				$botones[3]['class'] = "btn";
				//MENSAJES DE CABECERA
				//ID0000006-I
				//ID0000006 if($subsanada){
				//ID0000006	$mensajeCabecera .= "Su solicitud ha sido subsanada y enviada de nuevo. Por favor, espere a que la Comisi&oacute;n Acad&eacute;mica remita una nueva respuesta a su solicitud";
				//ID0000006 }
				//ID0000006 else {
					$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. ";
					$mensajeCabecera .= "Dispone de 10 d&iacute;s naturales desde el ". $fechaSubsanacion->format('d/m/Y') ." para subsanar la solicitud. Pulse sobre <b>".$botones[2]['etiqueta']."</b>";
				//ID0000006 }
				//ID0000006-F
				break;
			case "coordinador":
				//MENSAJES DE CABECERA
				$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta.";
				//PDF
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";
				//BOTON 2: MODIFICAR RESPUESTA
				if($curso == $cursoactual)
				{
					$botones[2]= array();
					$botones[2]['etiqueta'] = "Modificar respuesta";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=form&Itemid=117&formid=6&listid=6&rowid=$this->rowid";
					$botones[2]['class'] = "btn btn-primary";
					
					$mensajeCabecera .= " Por favor, espere a que el estudiante haya subsanado la solicitud para emitir una nueva valoraci&oacute;n.";
				}
				else 
				{
					$mensajeCabecera .= " El plazo ha finalizado y la solicitud no ha sido subsanada.";
				}
				//BOTON 3: VOLVER AL LISTADO
				$botones[3] = array();
				$botones[3]['etiqueta'] = "Volver al listado";
				$botones[3]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
				$botones[3]['class'] = "btn";

				break;
			case "administrador":
				//PDF
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";				
				//BOTON 2: VOLVER AL LISTADO
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La respuesta se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
	    case 10: //SUBSANADA
		switch($perfil)
		{
			case "estudiante":
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";
				//BOTON 3: VOLVER AL LISTADO
				$botones[2] = array();
				$botones[2]['etiqueta'] = "Volver al listado";
				$botones[2]['url'] = $url_listado = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta'];
				$botones[2]['class'] = "btn";
				//MENSAJES DE CABECERA
				//ID000006-I
				////ID000006 $mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. ";
				$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. <b>Por favor, espere a que la Comisi&oacute;n Acad&eacute;mica valore su subsanaci&oacute;n</b>";
				//ID000006-F
				break;
			case "coordinador":
				$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. <br/><b>Por favor, revise la documentaci&oacute;n subsanada que ha sido adjuntada a la solicitud</b>.";
				//PDF
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";
				//BOTON 2: MODIFICAR RESPUESTA
				if($curso == $cursoactual)
				{
					$botones[2]= array();
					$botones[2]['etiqueta'] = "Modificar respuesta";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=form&Itemid=117&formid=6&listid=6&rowid=$this->rowid";
					$botones[2]['class'] = "btn btn-primary";
						
					$mensajeCabecera .= " Despu&eacute;s pulse en modificar respuesta para emitir una nueva valoraci&oacute;n.";
				}
				else
				{
					$mensajeCabecera .= " El plazo ha finalizado y la solicitud no ha sido respondida.";
				}				
				//BOTON 3: VOLVER AL LISTADO
				$botones[3] = array();
				$botones[3]['etiqueta'] = "Volver al listado";
				$botones[3]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
				$botones[3]['class'] = "btn";
				//MENSAJES DE CABECERA
				//ID0000006-I
				//ID0000006 $mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta. ";
				
				//ID0000006-F
				break;
			case "administrador":
				//PDF
				$this->showPDF = false;
				//BOTON 1: VER SOLICITUD
				$botones[1]= array();
				$botones[1]['etiqueta'] = "Ver solicitud";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
				$botones[1]['class'] = "btn btn-primary";				
				//BOTON 2: VOLVER AL LISTADO
				$botones[1] = array();
				$botones[1]['etiqueta'] = "Volver al listado";
				$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
				$botones[1]['class'] = "btn";
				//MENSAJE DE CABECERA
				$mensajeCabecera = "La respuesta se encuentra en estado $estadoEtiqueta. ";
				break;
		}
		break;
		//ID0000006-I
		case 11: //DEFINIVA
			switch($perfil)
			{
				case "estudiante":
					$this->showPDF = true;
					//BOTON 1: VER SOLICITUD
					$botones[1]= array();
					$botones[1]['etiqueta'] = "Ver solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
					$botones[1]['class'] = "btn btn-primary";
					//BOTON 3: VOLVER AL LISTADO
					$botones[2] = array();
					$botones[2]['etiqueta'] = "Volver al listado";
					$botones[2]['url'] = $url_listado = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta'];
					$botones[2]['class'] = "btn";
					//MENSAJES DE CABECERA
					$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta.";
					break;
				case "coordinador":
					//PDF
					$this->showPDF = true;
					//BOTON 1: VER SOLICITUD
					$botones[1]= array();
					$botones[1]['etiqueta'] = "Ver solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
					$botones[1]['class'] = "btn btn-primary";
					//BOTON 2: VOLVER AL LISTADO
					$botones[2] = array();
					$botones[2]['etiqueta'] = "Volver al listado";
					$botones[2]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
					$botones[2]['class'] = "btn";
					//MENSAJES DE CABECERA
					$mensajeCabecera = "Su respuesta se encuentra en estado $estadoEtiqueta.";
					break;
				case "administrador":
					//PDF
					$this->showPDF = true;
					//BOTON 1: VER SOLICITUD
					$botones[1]= array();
					$botones[1]['etiqueta'] = "Ver solicitud";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=details&formid=3&rowid=$solicitud&Itemid=".$item[$perfil]['solicitud'];
					$botones[1]['class'] = "btn btn-primary";
					//BOTON 2: VOLVER AL LISTADO
					$botones[1] = array();
					$botones[1]['etiqueta'] = "Volver al listado";
					$botones[1]['url'] = "index.php?option=com_fabrik&view=list&listid=6&Itemid=".$item[$perfil]['respuesta']."&group_by=t_respuestas___estado";
					$botones[1]['class'] = "btn";
					//MENSAJE DE CABECERA
					$mensajeCabecera = "La respuesta se encuentra en estado $estadoEtiqueta. ";
					break;
			}
			break;	
			//ID0000006-F	
	    default:
		echo "No se encuentra el estado de la respuesta";
}
/******************************************************************************************************/

$form = $this->form;
$model = $this->getModel();


if ($this->params->get('show-title', 1)) :?>
<div class="page-header">
	<h1><?php echo $form->label; echo " a solicitud ".$codigoSolicitud;?></h1>
</div>
<?php
endif;

echo $form->intro;
echo '<div class="fabrikForm fabrikDetails" id="' . $form->formid . '">';
echo $this->plugintop;
echo $this->loadTemplate('buttons');
echo $this->loadTemplate('relateddata');

/*******************MENSAJES  Y BOTONES **************************************/
echo "<div class='alert'><p>". $mensajeCabecera ."</p></div>";

foreach($botones as $boton):
	?> <a class="<?php echo $boton['class']?>" href="<?php echo $boton['url']?>"><?php echo $boton['etiqueta']?></a><?php
endforeach;
/*************************************************************************************************************/

	if ($this->showPDF): ?>
	<a class="btn btn-primary" href="<?php echo $this->pdfURL?>">
		<i class="icon-file"></i>
		<?php echo "Carta de respuesta"; ?>
	</a>
	<?php endif;
	
	/***************OCULTACION DE GRUPOS SEGUN TIPO DE ADMISION********************************/
	foreach ($this->groups as $group) :
		$this->group = $group;
		
		switch($estado)
		{
			case 7://abierta
				if($group->name == "Subsanacion") $group->css = 'display:none;';
				break;
			case 8://provisional
				if($group->name == "Subsanacion") $group->css = 'display:none;';
				if($admision == 1)//NO ADMITIDO
				{
					if($group->name == "Directores asignados") $group->css = 'display:none;';
					if($group->name == "Complementos de formacion") $group->css = 'display:none;';
				}
				if($admision == 3)//ADMISION
				{
					if($group->name == "Complementos de formacion") $group->css = 'display:none;';
				}
				break;
			case 9://pte subsanacion
				if($group->name == "Respuesta") $group->css = 'display:none;';
				if($group->name == "Directores asignados") $group->css = 'display:none;';
				if($group->name == "Complementos de formacion") $group->css = 'display:none;';
				break;
			//ID0000006-I				
			case 10://subsanada
				if($group->name == "Respuesta") $group->css = 'display:none;';
				if($group->name == "Directores asignados") $group->css = 'display:none;';
				if($group->name == "Complementos de formacion") $group->css = 'display:none;';
		    	break;				
			case 11://finalizada
			//ID0000006-F
				if($group->name == "Subsanacion") $group->css = 'display:none;';
				if($admision == 1)//NO ADMITIDO
				{
					if($group->name == "Directores asignados") $group->css = 'display:none;';
					if($group->name == "Complementos de formacion") $group->css = 'display:none;';
				}
				if($admision == 3)//ADMISION DEFINITIVA
				{
					if($group->name == "Complementos de formacion") $group->css = 'display:none;';
						
				}
				break;	
			default: echo "No se encuentra el estado: contacte con admisiondoctorado@us.es";
		}
		/********************************************************************************************/
	?>
	
		
		<div class="<?php echo $group->class; ?>" id="group<?php echo $group->id;?>" style="<?php echo $group->css;?>">

		<?php if (trim($group->title) !== '') :
		?>

		<h3 class="legend">
			<span><?php echo $group->title;?></span>
		</h3>

		<?php endif;

		if ($group->intro !== '') : ?>
			<div class="groupintro"><?php echo $group->intro ?></div>
		<?php
		endif;
		// Load the group template - this can be :
		//  * default_group.php - standard group non-repeating rendered as an unordered list
		//  * default_repeatgroup.php - repeat group rendered as an unordered list
		//  * default_repeatgroup_table.php - repeat group rendered in a table.
		$this->elements = $group->elements;
		echo $this->loadTemplate($group->tmpl);
		 ?>
	</div>
	<?php
	endforeach;


echo $this->pluginbottom;
echo $this->loadTemplate('actions');
echo '</div>';
echo $form->outro;
echo $this->pluginend;

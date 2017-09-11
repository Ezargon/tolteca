<?php
/**
 * Bootstrap List Template - Default
 *
 * @package     Joomla
 * @subpackage  Fabrik
 * @copyright   Copyright (C) 2005-2013 fabrikar.com - All rights reserved.
 * @license     GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @since       3.1
 */

// No direct access
defined('_JEXEC') or die('Restricted access');
//ID0000003-I
/*************************************************OBTENEMOS EL GRUPO DEL USUARIO********************/
$user   = JFactory::getUser();
$userid = $user->get('id');
$usergroups = JAccess::getGroupsByUser($userid);

if(in_array(11, $usergroups)) $perfil = "estudiante";
if(in_array(10, $usergroups)) $perfil = "coordinador";
if(in_array(12, $usergroups)) $perfil = "administrador";
/******************************************************************************************************/
//ID0000003-F
$pageClass = $this->params->get('pageclass_sfx', '');

if ($pageClass !== '') :
	echo '<div class="' . $pageClass . '">';
endif;

if ($this->tablePicker != '') : ?>
	<div style="text-align:right"><?php echo JText::_('COM_FABRIK_LIST') ?>: <?php echo $this->tablePicker; ?></div>
<?php
endif;

if ($this->params->get('show_page_heading')) :
	echo '<h1>' . $this->params->get('page_heading') . ' </h1>';
endif;

if ($this->params->get('show-title', 1)) : ?>
	<div class="page-header">
		<h1><?php echo $this->table->label;?></h1>
	</div>
<?php
endif;

// Intro outside of form to allow for other lists/forms to be injected.
echo $this->table->intro;


//ID0000003-I
switch($perfil)
{
	case "estudiante":
		$mensajeCabecera = "<ul><li>Una vez cumplido el plazo de presentaci&oacute;n de solicitudes (<a href='http://www.doctorado.us.es/matricula/calendario-de-matricula' target='_blank'>ver calendario</a>), aquellas que no hayan sido enviadas no ser&aacute;n v&aacute;lidas y <u>no tendr&aacute;n efectos en la admisi&oacute;n al programa.</u></li>";
		$mensajeCabecera .= "<li>Cada solicitante podr&aacute; realizar hasta un m&aacute;ximo de 3 solicitudes de admisi&oacute;n.</li>";
		$mensajeCabecera .= "<li>Solo se permite realizar una solicitud de admisi&oacute;n a un mismo programa de doctorado.</li></ul>";
		
	break;
	case "coordinador":
		$mensajeCabecera = "Listado de solicitudes enviadas al programa de doctorado. ";		
		$mensajeCabecera .= "<br/>Por favor, <b>no responda a ninguna solicitud hasta que no finalice el plazo de presentaci&oacute;n de solicitudes</b> (1 al 10 de marzo).";
		$mensajeCabecera .= "<br/>Seg&uacute;n el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula' target='_blank'>calendario oficial</a>, el periodo de adjudicaci&oacute;n de plazas y respuesta a solicitudes se prolongar&aacute; del 11 al 25 de abril.";
	break;
	case "administrador":
		$mensajeCabecera = "Listado de solicitudes enviadas a los programa de doctorado. ";
	break;	
}
echo "<div class='alert'><p>". $mensajeCabecera ."</p></div>";
//ID0000003-F
	?>
	<div class="row-fluid">
	<table class="estados">
	<tr>
		<?php if($perfil == "administrador" || $perfil == "estudiante"){ ?><td class="estado1">Pendiente de env&iacute;o</td> <?php }?>
		<td class="estado2">Enviada</td>
		<td class="estado3">Respondida provisional</td>
		<td class="estado4">Pendiente de subsanaci&oacute;n</td>
		<td class="estado5">Subsanada</td>
		<td class="estado6">Respondida definitiva</td>
	</tr>
	</table>
	</div>
<?php 

?>
<form class="fabrikForm form-search" action="<?php echo $this->table->action;?>" method="post" id="<?php echo $this->formid;?>" name="fabrikList">

<?php
if ($this->hasButtons):
	echo $this->loadTemplate('buttons');
endif;

if ($this->showFilters && $this->bootShowFilters) :
	echo $this->loadTemplate('filter');
endif;
//for some really ODD reason loading the headings template inside the group
//template causes an error as $this->_path['template'] doesnt cotain the correct
// path to this template - go figure!
$headingsHtml = $this->loadTemplate('headings');
echo $this->loadTemplate('tabs');
?>

<div class="fabrikDataContainer">

<?php foreach ($this->pluginBeforeList as $c) :
	echo $c;
endforeach;
?>
	<table class="<?php echo $this->list->class;?>" id="list_<?php echo $this->table->renderid;?>" >
		 <thead><?php echo $headingsHtml?></thead>
		 <tfoot>
			<tr class="fabrik___heading">
				<td colspan="<?php echo count($this->headings);?>">
					<?php echo $this->nav;?>
				</td>
			</tr>
		 </tfoot>
		<?php
		if ($this->isGrouped && empty($this->rows)) :
			?>
			<tbody style="<?php echo $this->emptyStyle?>">
				<tr>
					<td class="groupdataMsg emptyDataMessage" style="<?php echo $this->emptyStyle?>" colspan="<?php echo count($this->headings)?>">
						<div class="emptyDataMessage" style="<?php echo $this->emptyStyle?>">
							<?php echo $this->emptyDataMessage; ?>
						</div>
					</td>
				</tr>
			</tbody>
			<?php
		endif;
		$gCounter = 0;
		foreach ($this->rows as $groupedby => $group) :
			if ($this->isGrouped) : ?>
			<tbody>
				<tr class="fabrik_groupheading info">
					<td colspan="<?php echo $this->colCount;?>">
					<?php if ($this->emptyDataMessage != '') : ?>
					<a href="#" class="toggle">
					<?php else: ?>
						<a href="#" class="toggle fabrikTip" title="<?php echo $this->emptyDataMessage?>" opts='{trigger: "hover"}'>
					<?php endif;?>
							<?php echo FabrikHelperHTML::image('arrow-down.png', 'list', $this->tmpl, JText::_('COM_FABRIK_TOGGLE'));?>
							<?php echo $this->grouptemplates[$groupedby]; ?> ( <?php echo count($group)?> )
						</a>
					</td>
				</tr>
			</tbody>
			<?php endif ?>
			<tbody class="fabrik_groupdata">
				<tr style="<?php echo $this->emptyStyle?>">
					<td class="groupdataMsg emptyDataMessage" style="<?php echo $this->emptyStyle?>" colspan="<?php echo count($this->headings)?>">
						<div class="emptyDataMessage" style="<?php echo $this->emptyStyle?>">
							<?php echo $this->emptyDataMessage; ?>
						</div>
					</td>
				</tr>
			<?php
			foreach ($group as $this->_row) :
				echo $this->loadTemplate('row');
		 	endforeach
		 	?>
			<?php if ($this->hasCalculations) : ?>
				<tr class="fabrik_calculations">
				<?php
				foreach ($this->calculations as $cal) :
					echo "<td>";
					echo array_key_exists($groupedby, $cal->grouped) ? $cal->grouped[$groupedby] : $cal->calc;
					echo  "</td>";
				endforeach;
				?>
				</tr>

			<?php endif ?>
			</tbody>
		<?php
		$gCounter++;
		endforeach?>
	</table>
	<?php print_r($this->hiddenFields);?>
</div>
</form>
<?php
echo $this->table->outro;
if ($pageClass !== '') :
	echo '</div>';
endif;
?>

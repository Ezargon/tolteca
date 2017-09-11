<?php
/**
 * Bootstrap Form Template
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
$groupTmpl = $model->editable ? 'group' : 'group_details';
$active = ($form->error != '') ? '' : ' fabrikHide';


if ($this->params->get('show-title', 1)) :?>
<div class="page-header">
	<h1><?php echo $form->label;?></h1>
</div>

<?php
endif;

echo $form->intro;
?>
<form method="post" <?php echo $form->attribs?> >
<?php
echo $this->plugintop;
?>

<div class="fabrikMainError alert alert-error fabrikError<?php echo $active?>">
	<button class="close" data-dismiss="alert">×</button>
	<?php echo $form->error; ?>
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

<?php
foreach ($this->groups as $group) :
	$this->group = $group;
	?>

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
<script type="text/javascript">
	window.addEventListener("load", ocultaOpciones());
	//document.getElementsByName("submit").addEventListener("click", enviarFormulario);
	//document.getElementById("btn-enviar").addEventListener("click", enviarFormulario);
	
	/*function enviarFormulario()
	{
		alert("Entrando");
	}*/
	
	function ocultaOpciones()
	{
		
		var estado = jQuery("#t_respuestas___estado").val();
		//Si el estado de la respuesta es PROVISIONAL (8), PTE.SUBSANAR (9) o SUBSANADA (10), no puede volver atrás hacia el estado ABIERTA,
		//de esta manera desaparecería la respuesta al estudiante.
		if(estado == "8" || estado == "9" || estado == "10")
		{
			jQuery("#t_respuestas___estado option[value='7']").remove();
	    }
	    //El coordinador no puede nunca pasar a estado subsanada(10), es un estado al que por fuerza debe pasar el estudiante
		if(estado != "10")
		{
			jQuery("#t_respuestas___estado option[value='10']").remove();
	    }	    

	}

</script>
<?php
echo $form->outro;
echo $this->pluginend;
echo FabrikHelperHTML::keepalive();

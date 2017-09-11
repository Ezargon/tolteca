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

?>
<div class="row-striped">
<?php
foreach ($this->elements as $element) :
	$this->element = $element;
	$this->element->single = $single = $element->startRow && $element->endRow;

	if ($single)
	{
		$this->element->containerClass = str_replace('fabrikElementContainer', '', $this->element->containerClass);
	}

	$element->fullWidth = $element->span == 'span12' || $element->span == '';

	
	//DETECTAR AKI SI DEBE SER O NO UN CAMPO VISIBLE
	$style = $element->hidden ? 'style="display:none"' : '';
	$admision =$this->groups["Respuesta"]->elements["admision"]->value[0];
	
		if($admision == 1)
		{ //NO ADMITIDO
			if($element->id == "t_respuestas___tutor_ro") $style = 'style="display:none"';
			if($element->id == "t_respuestas___modalidad_ro") $style = 'style="display:none"';
		}
		if($admision > 1)
		{ //NO ADMITIDO
			if($element->id == "t_respuestas___motivos_no_admision_ro") $style = 'style="display:none"';
			if($element->id == "t_respuestas___reserva_ro") $style = 'style="display:none"';
		}
	//************************/
	
	if ($element->startRow) : ?>
			<div class="row-fluid <?php echo $single ? 'fabrikElementContainer' : ''; ?>" <?php echo $style?>><!-- start element row -->
		<?php
		endif;
		$labels_above = $this->params->get('labels_above_details', 0);
		if ($labels_above == 1)
		{
			echo $this->loadTemplate('group_labels_above');
		}
		elseif ($labels_above == 2)
		{
			echo $this->loadTemplate('group_labels_none');
		}
		elseif ($element->fullWidth || $labels_above == 0)
		{
			echo $this->loadTemplate('group_labels_side');
		}
		else
		{
			// Multi columns - best to use simplified layout with labels above field
			echo $this->loadTemplate('group_labels_above');
		}
		if ($element->endRow) :?>
		</div><!-- end row-fluid -->
	<?php endif;
endforeach;

// If the last element was not closing the row add an additional div (only if elements are in columns
if (!$element->endRow && !$element->fullWidth) :?>
</div><!-- end row-fluid for open row -->
<?php endif;?>
</div>


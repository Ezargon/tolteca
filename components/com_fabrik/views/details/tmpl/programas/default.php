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

$titulopag = $this->groups["Programas"]->elements["denominacion"]->value;

if ($this->params->get('show-title', 1)) :?>
<div class="page-header">
	<h1><?php echo $titulopag ?></h1>
</div>
<?php
endif;

echo $form->intro;
echo '<div class="fabrikForm fabrikDetails" id="' . $form->formid . '">';
echo $this->plugintop;
echo $this->loadTemplate('buttons');

foreach ($this->groups as $group) :
	$this->group = $group;
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
echo $this->loadTemplate('relateddata');
echo $this->pluginbottom;
echo $this->loadTemplate('actions');
echo '</div>';
echo $form->outro;
echo $this->pluginend;


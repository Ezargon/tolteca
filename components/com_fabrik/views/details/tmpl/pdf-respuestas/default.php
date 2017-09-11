<?php

// No direct access
defined('_JEXEC') or die('Restricted access');

$form = $this->form;
$model = $this->getModel();

$r_admision =$this->groups["Respuesta"]->elements["admision"]->value[0];
//print_r($r_admision);
switch ($r_admision)
{
	case 1:
		//NO ADMITIDO
		echo $this->loadTemplate('no_admitido');
		break;
	case 2:
		//ADMITIDO CONDICIONALMENTE
		echo $this->loadTemplate('admitido_cond');
		break;
	case 3:
		//ADMITIDO DEFINITIVAMENTE
		echo $this->loadTemplate('admitido');
		break;
}

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
$estado = $this->groups["Datos Solicitud"]->elements["estado"]->element_raw;
$estadoEtiqueta = $this->groups["Datos Solicitud"]->elements["estado"]->value[0];
//SOLO ACCESO A ESTE FORMULARIO POR ESTUDIANTES.
switch($estado)
{
	case 1:
		$mensajeCabecera = "<div class='alert'><p>Su solicitud se encuentra en estado $estadoEtiqueta. Podr&aacute; modificarla o adjuntar documentaci&oacute;n antes de que finalice el <a href='http://www.doctorado.us.es/matricula/calendario-de-matricula' target='_blank'>plazo de presentaci&oacute;n de solicitudes</a></p></div>";
		break;
	case 3:
		$mensajeCabecera = "<div class='alert'><p>Su solicitud se encuentra en estado $estadoEtiqueta. Dispone de 10 d&iacute;as naturales a partir de la fecha de respuesta para subsanar su solicitud.</p></div>";
		break;
	default:
		$mensajeCabecera = "";
}

/*if ($this->params->get('show_page_heading', 1)) : ?>
	<div class="componentheading<?php echo $this->params->get('pageclass_sfx')?>">
		<?php echo $this->escape($this->params->get('page_heading')); ?>
	</div>
<?php
endif;*/

if ($this->params->get('show-title', 1)) :?>
<div class="page-header">
	<h1><?php echo $form->label;?></h1>
</div>
<?php
endif;

echo $form->intro;
echo $mensajeCabecera;
?>


<div class="navegacion-formulario row-fluid">
<div id="nav-ico-0" class="span3 col-icono"><a href="#grupo-6" ><i class="fa fa-user fa-3x"></i><br>1. Datos Personales</a></div>
<div id="nav-ico-1" class="span3 col-icono"><a href="#grupo-7"><i class="fa fa-graduation-cap fa-3x"></i><br>2. Datos Acad&eacute;micos</a></div>
<div id="nav-ico-2" class="span3 col-icono"><a href="#grupo-20"><i class="fa fa-file-text-o fa-3x"></i><br>3. Datos de la Solicitud</a></div>
<div id="nav-ico-3" class="span3 col-icono"><a href="#grupo-21"><i class="fa fa-upload fa-3x"></i><br>4. Documentaci&oacute;n</a></div>
</div>
<form method="post" <?php echo $form->attribs?>>

<?php
echo $this->plugintop;
?>

<div class="fabrikMainError alert alert-error fabrikError<?php echo $active?>">
	<button class="close" data-dismiss="alert">Ã—</button>
	<?php echo $form->error; ?>
</div>
<!-- 
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
 -->
<?php

foreach ($this->groups as $group) :
	$this->group = $group;
	?>
	<a name="grupo-<?php echo $group->id;?>"></a>
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
		/*************************MOSTRAR DOCUMENTACION A ENTREGAR**************************/
		
		if ($group->id == 21) : //ES LA DOCUMENTACION
			echo "<h3>Documentacion a entregar:</h3>";
			echo "<div class='documentacion-general-entregar'><ol>";
			imprimeDocGeneral();
			imprimeDocEspecifica();
			echo "</ol></div>";
			echo "<div class='alert'>Cada archivo a subir tiene un <b>l&iacute;mite m&aacute;ximo de 2MB</b>. Para subir los documentos solicitados haga clic en el bot&oacute;n 'A&ntilde;adir archivos' y posteriormente en 'Iniciar carga'.</div>";			
			
		endif;
		
		/***********************************************************************************/
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
	//********************VISUALIZA LA DOCUMENTACION CON LAS CLASES PASADAS POR PARAMETROS ***************/
	function ocultaClase(clase)
	{
		var clasesOcultar = document.getElementsByClassName(clase);
		for(var i = 0; i < clasesOcultar.length; i++)
			clasesOcultar[i].style.display = "none";
	}
	function visualizaClase(clase)
	{
		var clasesVisualizar = document.getElementsByClassName(clase);
		for(var i = 0; i < clasesVisualizar.length; i++)
			clasesVisualizar[i].style.display = "list-item";
	}
	/*********************** CAMBIO DE PROGRAMA **********************************************************/
	function cambioPrograma()
	{
		var select = document.getElementById("t_solicitudes___programa");
		var indice = select.selectedIndex;
	    var programa = select.options[indice].value;
	    var clase = "prog" + programa;
	    ocultaClase("doc-especifica");
	   	visualizaClase(clase);
	   
	}
	/************************ PRUEBA CHECKBOX      ********************************************************/
	function pruebaCheckbox()
	{		
		var checkboxes = document.getElementsByClassName("checkbox");
		var activos = new Array();
		for(var i=0;i<checkboxes.length;i++)
		{
			if(document.getElementById("t_solicitudes___via_acceso_"+i).checked == true)
				activos.push(i);
		}
		
		//for(var i = 0; i < activos.length; i++){alert(activos[i]);}
		
		mostrarVias(activos);			
	}
	function mostrarVias(activos)
	{
		ocultaClase("doc-general");
		<?php 
		consultaDocPorVias();
		?>
		//alert(activos.length);
		for(var i = 0; i < activos.length; i++)
		{
			//alert("breakpoint");
			var via = activos[i];
			
			var documentos = arrayVias[via];
			for(var j = 0; j < documentos.length; j++)
			{
				var clase = "id"+documentos[j];
				visualizaClase(clase);
			}
		}
		
	}
	/************************ MODO SUBSANACION *******************************************************/
	function modoSubsanacion()
	{
		//TODO
		var select = document.getElementById("t_solicitudes___estado");
		var indice = select.selectedIndex;
		var estado = select.options[indice].value ;
		if(estado == "3")
		{
			document.getElementById("nav-ico-0").style.display= "none";
			document.getElementById("nav-ico-1").style.display= "none";
			document.getElementById("nav-ico-2").style.display= "none";
			document.getElementById("nav-ico-3").style.display= "none";
			document.getElementById("group6").style.display= "none";
			document.getElementById("group7").style.display= "none";
			document.getElementById("group20").style.display= "none";

		}
	}
	function enviarFormulario()
	{
		if(confirm("Una vez enviada la solicitud no podr\u00E1 volver a modificarla.\n \u00BFEst\u00E1 seguro de que desea enviar?"))
		{

			var select = document.getElementById("t_solicitudes___estado");
			var indice = select.selectedIndex;
		    var estado = select.options[indice].value ;
		
			if(estado == "1")
			{ 
				// si esta ABIERTA(1) PASA A ENVIADA
				document.getElementById("t_solicitudes___estado").selectedIndex = 1;
			}
			else
			{	//SI ESTÁ PENDIENTE DE SUBSANAR(3) PASA A SUBSANADA
				document.getElementById("t_solicitudes___estado").selectedIndex = 3;
			}
			document.form_3.submit();
		}
	}
	/************************ MANEJADOR DE EVENTOS *******************************************************/
	
	window.addEventListener("load", ocultaClase("doc-especifica"));
	window.addEventListener("load", ocultaClase("tituloh4"));	
	window.addEventListener("load", ocultaClase("doc-general"));
	window.addEventListener("load", cambioPrograma());
	window.addEventListener("load", pruebaCheckbox());
	window.addEventListener("load", modoSubsanacion());

	//FUNCION PHP QUE IMPRIME LISTENER JAVASCRIPT DE MODIFICACION DE CHECKBOX:
	<?php 
	imprimeListeners();
	?>
	document.getElementById("btn-enviar").addEventListener("click", enviarFormulario);
	document.getElementById("t_solicitudes___programa").addEventListener("change", cambioPrograma);
	
</script>
<?php
echo $form->outro;
echo $this->pluginend;
echo FabrikHelperHTML::keepalive();

/**********FUNCIONES PHP DE LISTADO***********/
function imprimeDocGeneral()
{

	$app= JFactory::getApplication();
	$host = $app->getCfg('host');
	$usuario = $app->getCfg('user');
	$contraseña = $app->getCfg('password');
	$fabrikdb =  $app->getCfg('fabrikdb');
	mysql_connect($host,$usuario,$contraseña);
	mysql_select_db($fabrikdb);
	
	//$programa=$this->groups["Datos Solicitud"]->elements["programa"]->element_raw;
	//$programa=1;
	
	$sql  ="SELECT D.id, D.descripcion ";
	$sql .=" FROM t_documentos AS D inner join t_vias_acceso_repeat_documentos as V";
	$sql .=" WHERE D.id = V.documentos AND D.tipo = 1";
	$sql .=" group by D.id";
	$sql .=" order by D.id ASC";
	
	$result=mysql_query($sql);
	if($result!=NULL)
	{
		if(mysql_num_rows($result)>0)
		{
			while($row=mysql_fetch_array($result))
			{
				//here you can work with the results...
				$id = $row['id'];
				$doc = $row['descripcion'];
	
				$doc = str_replace("á","&aacute;",$doc);
				$doc = str_replace("é","&eacute;",$doc);
				$doc = str_replace("í","&iacute;",$doc);
				$doc = str_replace("ó","&oacute;",$doc);
				$doc = str_replace("ú","&uacute;",$doc);
				$doc = str_replace("ñ","&ntilde;",$doc);
	
	
				echo "<li class='id". $id . " prog0 doc-general'>".$doc."</li>";
			}
		}
		else{
			echo "Error de sql";
		}
		mysql_free_result($result);
	}
	mysql_close();
}
function imprimeDocEspecifica()
{

	$app= JFactory::getApplication();
	$host = $app->getCfg('host');
	$usuario = $app->getCfg('user');
	$contraseña = $app->getCfg('password');
	$fabrikdb =  $app->getCfg('fabrikdb');
	mysql_connect($host,$usuario,$contraseña);
	mysql_select_db($fabrikdb);

	//$programa=$this->groups["Datos Solicitud"]->elements["programa"]->element_raw;
	//$programa=1;

	$sql  ="SELECT id, descripcion, programa ";
	$sql .=" FROM t_documentos";
	$sql .=" WHERE tipo = 2";
	$sql .=" order by id ASC";
	
	echo "<h4>Adem&aacute;s de los anteriores la Comision Acad&eacute;mica del programa solicita los siguientos documentos:</h4>";

	$result=mysql_query($sql);
	if($result!=NULL)
	{
		if(mysql_num_rows($result)>0)
		{
			while($row=mysql_fetch_array($result))
			{
				//here you can work with the results...
				$id = $row['id'];
				$programa = $row['programa'];
				$doc = $row['descripcion'];

				$doc = str_replace("á","&aacute;",$doc);
				$doc = str_replace("é","&eacute;",$doc);
				$doc = str_replace("í","&iacute;",$doc);
				$doc = str_replace("ó","&oacute;",$doc);
				$doc = str_replace("ú","&uacute;",$doc);
				$doc = str_replace("ñ","&ntilde;",$doc);


				echo "<li class='id". $id . " prog".$programa." doc-especifica'>".$doc."</li>";
			}
		}
		else{
			echo "Error de sql";
		}
		mysql_free_result($result);
	}
	mysql_close();
}
function imprimeListeners()
{
	$app= JFactory::getApplication();
	$host = $app->getCfg('host');
	$usuario = $app->getCfg('user');
	$contraseña = $app->getCfg('password');
	$fabrikdb =  $app->getCfg('fabrikdb');
	mysql_connect($host,$usuario,$contraseña);
	mysql_select_db($fabrikdb);
	
	//$programa=$this->groups["Datos Solicitud"]->elements["programa"]->element_raw;
	//$programa=1;
	
	$sql  ="SELECT count(*) as num from t_vias_acceso;";
	
	$result=mysql_query($sql);
	if($result!=NULL)
	{
		if(mysql_num_rows($result)>0)
		{
			while($row=mysql_fetch_array($result))
			{
				//here you can work with the results...
				$num = $row['num'];
			}
		}
		else{
			echo "Error de sql";
		}
		mysql_free_result($result);
	}
	mysql_close();
	
	for($i=0;$i<$num;$i++)
		echo "document.getElementById('t_solicitudes___via_acceso_".$i."').addEventListener('click',pruebaCheckbox);\n";
}
function consultaDocPorVias()
{
	$app= JFactory::getApplication();
	$host = $app->getCfg('host');
	$usuario = $app->getCfg('user');
	$contraseña = $app->getCfg('password');
	$fabrikdb =  $app->getCfg('fabrikdb');
	mysql_connect($host,$usuario,$contraseña);
	mysql_select_db($fabrikdb);

	$sql  ="SELECT parent_id as via, documentos as doc from t_vias_acceso_repeat_documentos order by parent_id, documentos ;";
	
	$viaAnt = 1;
	$cambioVia = false;
	
	echo "var arrayVias = new Array();\n";
	echo "var arrayDocs = new Array();\n";
	
	$result=mysql_query($sql);
	if($result!=NULL)
	{
		if(mysql_num_rows($result)>0)
		{
			while($row=mysql_fetch_array($result))
			{
				//here you can work with the results...
				$doc = $row['doc'];
				$via = $row['via'];
				
				if($via == $viaAnt)
				{
					echo "arrayDocs.push(".$doc.");\n";	
				}
				else
				{
					echo "arrayVias.push(arrayDocs);\n";
					echo "var arrayDocs = new Array();\n";
					echo "arrayDocs.push(".$doc.");\n";
					$viaAnt = $via;
				}
			}
			echo "arrayVias.push(arrayDocs);\n";
		}
		else{
			echo "Error de sql";
		}
		mysql_free_result($result);
	}
	mysql_close();
}

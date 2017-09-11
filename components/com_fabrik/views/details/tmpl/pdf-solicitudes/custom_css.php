<?php
header('Content-type: text/css');
$c = (int) $_REQUEST['c'];
$view = isset($_REQUEST['view']) ? $_REQUEST['view'] : 'form';
echo "

/* BEGIN - Your CSS styling starts here */
     body {
     	font-family: arial-narrow, arial;
     	font-size:10pt;
     	word-spacing:-3px;
	}
	#hoja
	{

		height:1010px;
	}
	#hoja2
	{
		word-spacing:-4px;
		font-size:11pt;
	}
	#firma
	{
		text-aling:center;
		position:fixed;
		top:850px;
	}
	table.encabezado
	{
		width:100%;
		
	}
     h1 {font-size:14pt; color:#000;font-weight:bold;line-height:13pt; padding:0px;margin:5px 0px 2px 0px;}
     h2 {font-size:9pt; color:#000; font-weight:normal; line-height:8pt;text-transform:uppercase;padding:0px;margin:0px;}
     h3 {font-weight:bold;}
     table, td {
     	border-collapse:collapse;
     	border:1px solid #ccc;
  	 }
  	 
  	 table.formulario {
     	border-color:white;
     	width:100%;
     	text-align:left;
     	margin:5px 0px;
	 }
     table.formulario th 
     {
     	color:white;
     	background-color:#444;
     	border:white !important;
     	text-align:left;
     	padding-left:10px;
     	text-transform:uppercase;
	 }
     table.formulario tr.encabezado td  
     {
     	border:0px;
     	line-height:10pt;
     	margin:0px;
     	padding-left:10px;
     	font-weight:bold;
	 }
	 table.formulario tr.datos td  
     {
     	border-color:white #ddd #ddd #ddd !important;
     	line-height:10pt;
     	margin:0px;
     	padding-left:10px;
     	font-size:12pt;
     	font-style:italic;
     }
     table.formulario tr.datos td.vias
     {
     	font-size:12px;
     }
     table.formulario tr.datos td.vias ul
     {
     	margin:0 10px;
     	padding:0 5px;
     }
     table.documentacion
     {
     	width:100%;
     	border:0px;     	
     }
     table.documentacion th, table.documentacion td
     {
     	text-align:left;
     	border:0px;
     }
     table.firma, table.firma td
     {
        border:0px;
     	margin:0 auto;
     	width:500px;
     	text-align:center;
     }
     table.firma td.fdo
     {
     	height:100px;
     	vertical-align:bottom;
     }
     td.coordinador {text-transform:uppercase;}
*/
#{$view}_$c .foobar {
	display: none;
}

/* END - Your CSS styling ends here */

";
?>
<?php
header('Content-type: text/css');
$c = (int) $_REQUEST['c'];
$view = isset($_REQUEST['view']) ? $_REQUEST['view'] : 'form';
echo "

/* BEGIN - Your CSS styling starts here */
     body {
     	font-family: sans-serif;
     	font-size:10pt;
     	
	}
	#hoja
	{
		height:1010px;
	}
	#firma
	{
		top:680px;
		position:fixed;
		text-align:center;
		font-size:9pt;
	}
	#firma img
	{
		clear:left;
	}
	table.encabezado
	{
		width:100%;
		font-family: arial-narrow;
		word-spacing:-3px;
	}
     h1 {font-size:14pt; color:#000;font-weight:bold;line-height:13pt; padding:0px;margin:5px 0px 2px 0px;}
     h2 {font-size:9pt; color:#000; font-weight:normal; line-height:8pt;padding:0px;margin:0px;}
     h3 {font-weight:bold;}
     
     td {
     	border:1px solid;
     	border-color:#ccc;
  	 }
  	 

     p.carta
     {
     	line-height:22pt;
     	text-align:justify;
     	margin:10px 0px;
     	padding:0px 30px;

     }
     p.motivos
     {
     	line-height:20pt;
     	margin-top:10px;
     	padding:0px 30px;
     	text-align:justify;
     	font-style:italic;
     }
     span.entrada
     {
     	font-weight:bold;
     	/*font-style:italic;*/
     	text-transform:uppercase;

     }
     /************** DIRECTORES **********************/
     table.directores
     {
     	margin:0px 20px;
     	width:100%;
     	font-size:9pt;

     }
     table.directores th
     {
		background-color:#fff;
     }
     table.directores td
     {
     	border:1px solid;
     	padding-left:10px;
     	border-color:#fff #fff #ddd #ddd;
     }
     /*****************COMPLEMENTOS***************/
     table.complementos
     {
     	margin:0px 20px;
     	width:100%;
     	font-size:9pt;
    	
     }
     table.complementos th
     {
     	background-color:#fff;
     	text-transform:uppercase;
     	font-family:sans-serif;
     }
     table.complementos td
     {
     	border:1px solid;
     	padding-left:10px;
     	border-color:#fff #fff #ddd #ddd;
     }
     /*******************FIRMA**********************/
     table.firma, table.firma td
     {
        border:0px;
     	margin:0 auto;
     	width:500px;
     	text-align:center;
     	
     	top:1000px;
     	
     }
     table.firma td.fdo
     {
     	height:100px;
     	vertical-align:bottom;
     }
     div
     {
     	float:left;
     	margin:0;
     	padding:0;
     }
*/
#{$view}_$c .foobar {
	display: none;
}

/* END - Your CSS styling ends here */

";
?>
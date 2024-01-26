<?php
include "BD.php";
$opc = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$sistema = "kanako";

//"https://magustechnologies.com/kanako/venta/comprobante/pdf/6446/20611556960-01-F001-142";
//11
switch ($opc) {

  case '1': // AGREGAR
    $rucemisor= $_POST['rucemisor'];
    $serie = $_POST['serie'];
    $correlativo = $_POST['correlativo'];
    $consoleInner = $_POST['consoleInner'];
	
    ///factura y boletas
    if ($consoleInner ==2 or $consoleInner==1) {
    $sqlcod = "SELECT v.id_venta, d.cod_sunat FROM ventas v, documentos_sunat d WHERE v.serie='$serie' AND v.numero='$correlativo' AND v.id_tido ='$consoleInner'
	AND d.id_tido = v.id_tido";
      }	
   
    ///guida de remision
    if ($consoleInner ==11) {
     $sqlcod = "SELECT v.id_guia_remision FROM guia_remision v WHERE v.serie='$serie' AND v.numero='$correlativo'";
     }
      $rescod = mysqli_query($con,$sqlcod);
      $arrcod = mysqli_fetch_array($rescod,MYSQLI_ASSOC);
 	
      $codshb = $arrcod['id_venta'];	
      if ($codshb>0) { 
	$buscar = 1;	
        $codsut = $arrcod['cod_sunat'];
        if ($consoleInner ==2 or $consoleInner==1) { 
      	$ruta = "https://magustechnologies.com/".$sistema."/venta/comprobante/pdf/".$codshb."/".$rucemisor."-".$codsut."-".$serie."-".$correlativo;
 	}

	if ($consoleInner ==11) {
	 $ruta = "https://magustechnologies.com/".$sistema."/guia/remision/pdf/".$codshb."/".$rucemisor."-".$codsut."-".$serie."-".$correlativo;
     	}



      } else { 
	$buscar = 0;
      	$ruta = "";
      } 
    
      $listar = array("buscar" =>$buscar,"ruta" =>$ruta);
      $data[] = $listar;
    break;
  
    


    }         
  print json_encode($data);

 ?>

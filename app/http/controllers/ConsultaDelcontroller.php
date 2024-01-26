<?php

require_once 'utils/lib/mpdf/vendor/autoload.php';
require_once "utils/lib/code/vendor/autoload.php";
use Picqer\Barcode\BarcodeGeneratorPNG;


class ConsultaDelcontroller extends Controller
{
    private $conexion;
    public function __construct()
    {
        $this->conexion = (new Conexion())->getConexion();

        /*   $c_producto->setIdEmpresa($_SESSION['id_empresa']); */
    }
    public function generarBarCode2(){
// Crea una instancia del generador de códigos de barras HTML


        $sql="select * from productos where  id_producto='{$_GET['nombre']}'";
        $re3sult = $this->conexion->query($sql)->fetch_assoc();

        $barcodeGenerator = new BarcodeGeneratorPNG();

        $fontSixe1=' 13px';
        $fontSixe2=' 15px';

// Genera el código de barras como una imagen PNG
        $barcodeData = trim($re3sult['codigo']); // Datos del código de barras
        $barcodeImage = $barcodeGenerator->getBarcode($barcodeData, $barcodeGenerator::TYPE_CODE_128_B);
        if ($_GET['scal']==2){
            $fontSixe1=' 20px';
            $fontSixe2=' 17px';
        }
        //$re3sult['descripcion']=strlen($re3sult['descripcion'])>46?substr($re3sult['descripcion'],0,54):$re3sult['descripcion'];
        //$re3sult['descripcion']='FOCO LED Y3 2 CARAS ULTRA SLIM H4 20000LM CHIP LED DOB 30W - 12V DISIPADOR METALICO X UNIDAD (Y3-H4)';

// Agrega la imagen del código de barras al contenido del PDF
        $html = '<div style="font-family: Arial, Helvetica, sans-serif;width: 100%; text-align: center"><span style="font-size: '.$fontSixe1.';  ">'.$re3sult['descripcion'].'</span>
<br> <span style="font-family: Arial, Helvetica, sans-serif;font-weight: bold;font-size: '.$fontSixe2.' ">S/ '.number_format($re3sult['precio_unidad'],2).'</span> - 
 <span style="font-family: Arial, Helvetica, sans-serif;font-weight: bold;font-size: '.$fontSixe2.' ">CLUB S/ '.number_format($re3sult['precio4'],2).'</span></div>';
       // $html .= '<img style="display: block;margin: auto;margin-left: 20px;" src="data:image/png;base64,' . base64_encode($barcodeImage) . '">';
        $html .= '<div style="font-weight: bold;font-family: Arial, Helvetica, sans-serif;width: 100%; text-align: center;font-size: '.$fontSixe2.'"><span>'.$re3sult['codigo'].'</span></div>';


        $this->mpdf  = new \Mpdf\Mpdf([
            'margin_bottom' => 1,
            'margin_top' => 1,
            'margin_left' => 1,
            'margin_right' => 1,
            'mode' => 'utf-8',
        ]);

        $this->mpdf->AddPageByArray([
            "orientation" => "P",
            "newformat" =>[75, 50], //
        ]); ;
        $this->mpdf->WriteHTML($html, \Mpdf\HTMLParserMode::HTML_BODY);
        $this->mpdf->Output();
    }
    public function generarBarCode(){
// Crea una instancia del generador de códigos de barras HTML


        $sql="select * from productos where  id_producto='{$_GET['nombre']}'";
        $re3sult = $this->conexion->query($sql)->fetch_assoc();

        $barcodeGenerator = new BarcodeGeneratorPNG();

        $fontSixe1=' 10px';
        $fontSixe2=' 12px';

// Genera el código de barras como una imagen PNG
        $barcodeData = trim($re3sult['codigo']); // Datos del código de barras
        $barcodeImage = $barcodeGenerator->getBarcode($barcodeData, $barcodeGenerator::TYPE_CODE_128_B);
        if ($_GET['scal']==2){
            $fontSixe1=' 9px';
            $fontSixe2=' 10px';
        }
        //$re3sult['descripcion']=strlen($re3sult['descripcion'])>46?substr($re3sult['descripcion'],0,54):$re3sult['descripcion'];
        //$re3sult['descripcion']='FOCO LED Y3 2 CARAS ULTRA SLIM H4 20000LM CHIP LED DOB 30W - 12V DISIPADOR METALICO X UNIDAD (Y3-H4)';

// Agrega la imagen del código de barras al contenido del PDF
        $html = '<div style="font-family: Arial, Helvetica, sans-serif;width: 100%; text-align: center"><span style="font-size: '.$fontSixe1.';  ">'.$re3sult['descripcion'].'</span>
<br> <span style="font-family: Arial, Helvetica, sans-serif;font-weight: bold;font-size: '.$fontSixe2.' ">S/ '.number_format($re3sult['precio_unidad'],2).'</span> - 
 <span style="font-family: Arial, Helvetica, sans-serif;font-weight: bold;font-size: '.$fontSixe2.' ">CLUB S/ '.number_format($re3sult['precio4'],2).'</span></div>';
        //$html .= '<img src="data:image/png;base64,' . base64_encode($barcodeImage) . '">';
        $html .= '<div style="font-weight: bold;font-family: Arial, Helvetica, sans-serif;width: 100%; text-align: center;font-size: '.$fontSixe2.'"><span>'.$re3sult['codigo'].'</span></div>';


        $this->mpdf  = new \Mpdf\Mpdf([
            'margin_bottom' => 1,
            'margin_top' => 1,
            'margin_left' => 1,
            'margin_right' => 1,
            'mode' => 'utf-8',
        ]);

        $this->mpdf->AddPageByArray([
            "orientation" => "P",
            "newformat" =>[50, 30], //
        ]); ;
        $this->mpdf->WriteHTML($html, \Mpdf\HTMLParserMode::HTML_BODY);
        $this->mpdf->Output();
    }
}

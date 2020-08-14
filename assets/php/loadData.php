<?php
    $servername='localhost';
    $username='root';
    $password='luizmar0cker0';
    $database='botesparabasura';

    $con=mysqli_connect($servername,$username,$password,$database);
    $ruta='productos.csv';
    $file=fopen($ruta,'r');
    while(!feof($file))
    {
        $cadena=fgets($file);
        $array=explode('|',$cadena);
        $idDescripcion=$array[0];
        $idProducto=$array[1];
        $linea=$array[2];
        $descripcion=$array[3].' '.$array[4];
        $acabado=$array[5];
        $material=$array[6];
        $calibre=$array[7];
        $capacidad=$array[8];
        $anclaje=$array[9];
        $vaciado=$array[10];
        $largoT=$array[11];
        $anchoT=$array[12];
        $altoT=$array[13];
        $diametroT=$array[14];
        $largoC=$array[15];
        $anchoC=$array[16];
        $altoC=$array[17];
        $diamC=$array[18];
        $largoL=$array[19];
        $altoL=$array[20];
        $adicional=$array[21];
        $colores=$array[22];
        $query="insert into descripcion_producto (id_descripcion,fk_idProducto,descripcion,linea,acabado,material,calibre,capacidad,colores,anclaje,vaciado,largoTotal,anchoTotal,altoTotal,diametroTotal,largoCont,anchoCont,altoCont,diametroCont,largoLetrero,altoLetrero,adicional,imagen) 
        values ('$idDescripcion','$idProducto','$descripcion','$linea','$acabado','$material','$calibre','$capacidad','$colores','$anclaje','$vaciado','$largoT','$anchoT','$altoT','$diametroT','$largoC','$anchoC','$altoC','$diamC','$largoL','$altoL','$adicional','$idProducto');";
        //$query="insert into producto (idProducto,fk_idSubcategoria,nombreProducto,imagenProducto) values ('$idProducto','$idSubcategoria','$nombreProducto','$imagenProducto');";
        echo $query.'<br/>';
        mysqli_query($con,$query);
    }
?>
<?php
    include('dataSource.php');
    header("Content-Type: text/html;charset=utf-8");
    $str_json = file_get_contents('php://input');
    $response = json_decode($str_json, true);
    $data_source=new DataSource();
    if(isset($response['categoria']) || isset($_POST['categoria']))
    {
        if(isset($_POST['categoria']))
            $idCatego=$_POST['categoria'];
        else
            $idCatego=$response['categoria'];
        $query="SELECT idSubcategoria,nombreSubcategoria,imagenSubcategoria FROM subcategoria WHERE fk_idCategoria = '$idCatego'";
        $result_query = $data_source->exeConsulta($query);
        foreach($result_query as $row)
        {
            $result[]=Array('idSubcategoria'=>$row['idSubcategoria'],'nombreSubcategoria'=>$row['nombreSubcategoria'],'imagenSubcategoria'=>$row['imagenSubcategoria']);
        }
        $json=json_encode($result);
        echo $json;
    }
    else if(isset($response['subcategoria']) || isset($_POST['subcategoria']))
    {
        if(isset($_POST['subcategoria']))
            $idSubcatego=$_POST['subcategoria'];
        else
            $idSubcatego=$response['subcategoria'];
        $query="SELECT idProducto,nombreProducto,imagenProducto FROM producto WHERE fk_idSubcategoria = '$idSubcatego' ORDER BY idProducto ASC";
        $result_query = $data_source->exeConsulta($query);
        foreach($result_query as $row)
        {
            $result[]=Array('idProducto'=>$row['idProducto'],'nombreProducto'=>$row['nombreProducto'],'imagenProducto'=>$row['imagenProducto']);
        }
        $json=json_encode($result);
        echo $json;
    }
    else if(isset($response['idProducto']) || isset($_POST['idProducto']))
    {
        if(isset($_POST['idProducto']))
            $idProducto=$_POST['idProducto'];
        else
            $idProducto=$response['idProducto'];
        $query="SELECT descripcion,acabado,material,calibre,capacidad,colores,anclaje,vaciado,medidas,contenedor,letrero,adicional,imagen FROM descripcion_producto where fk_idProducto = '$idProducto'";
        $result_query = $data_source->exeConsulta($query);
        foreach($result_query as $row)
        {
            $result[]=Array('descripcion'=>$row['descripcion'],'acabado'=>$row['acabado'],'material'=>$row['material'],'calibre'=>$row['calibre'],'capacidad'=>$row['capacidad'],'colores'=>$row['colores'],'anclaje'=>$row['anclaje'],
                            'vaciado'=>$row['vaciado'],'medidas'=>$row['medidas'],'contenedor'=>$row['contenedor'],'letrero'=>$row['letrero'],'adicional'=>$row['adicional'],'imagen'=>$row['imagen']);
        }
        $json=json_encode($result);
        echo $json;
    }
    else if(isset($response['cat']) && $response['cat']==true)
    {
        $query="SELECT idCategoria,nombreCategoria,imagenCategoria FROM categoria";
        $result_query = $data_source->exeConsulta($query);
        foreach($result_query as $row)
        {
            $result[]=Array('idCategoria'=>$row['idCategoria'],'nombreCategoria'=>$row['nombreCategoria'],'imagenCategoria'=>$row['imagenCategoria']);
        }
        $json=json_encode($result);
        echo $json;
    }
?>
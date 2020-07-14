<?php
    include('dataSource.php');
    header("Content-Type: text/html;charset=utf-8");
    $str_json = file_get_contents('php://input');
    $response = json_decode($str_json, true);
    $data_source=new DataSource();
    if(isset($response['categoria']))
    {
        $idCatego=$response['categoria'];
        $query="SELECT idProducto,descripcion,imagen FROM producto WHERE fk_idCategoria = '$idCatego'";
        $result_query = $data_source->exeConsulta($query);
        foreach($result_query as $row)
        {
            $result[]=Array('idProducto'=>$row['idProducto'],'descripcion'=>$row['descripcion'],'imagen'=>$row['imagen']);
        }
        $json=json_encode($result);
        echo $json;
    }
?>
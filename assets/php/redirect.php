<?php
    include 'list.php';
    if (isset($_POST['idSubcategoria']))
    {
        foreach($array as $row)
        {
            echo $row;
        }
    }
?>
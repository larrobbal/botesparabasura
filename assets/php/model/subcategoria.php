<?php
    require_once 'dataSource.php';
    class subcategoria
    {
        private $idSubcategoria;
        private $idCategoria;
        private $nombre;

        private $dataSource;

        public function get_by_category()
        {
            $dataSource = new DataSource();
        }
    }
?>
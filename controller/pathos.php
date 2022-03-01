<?php

namespace Controller;

use Model\PathosModel;
require "./model/pathosModel.php";


class Pathos
{
    private $pathoModel; 
    
    /**
     * fonction d'initialisation de la connexion avec le model
     */
    private function init()
    {
        
        $this->pathoModel = new PathosModel();
        
    }
    /**
     * fonction qui verifie si la variable $pathoModel est initialisée
     */
    private function checkIfSet()
    {   
        if (!isset($this->pathoModel))
        {
            $this->init();
        }
        
    }

    /**
     * fonction qui fait appel au model pour recuperer toutes les valeurs d'une table
     * @param table nom de la table
     */
    function getTable($table)
    {
        $this->checkIfSet();
        $data = $this->pathoModel->getTable($table);
        return $data;
    }

    /**
     * fonction qui permet de recuperer un element en particulier dans une table
     * 
     */
    function getElementTable($table, $column ,$ligne)
    {
        
        // $table = $_GET["table"];
        // $column = $_GET["column"];
        // $ligne = $_GET["ligne"];
        
        $this->checkIfSet();
        $data = $this->pathoModel->getElementTable($table, $column, $ligne);
        return $data ;
    }

    function searchByKeyword($key)
    {
        $tableKey= [];
        $tableKey["search"] = $key;
        $datas = $this->getTable("keywords");

        foreach( $datas as $data )
        {
            
            if (strpos(strtolower($data["name"]), strtolower($key)) !== false)
            {
                // echo 'salut la chaine '. json_encode($data). "contient la chaine ". $key;
                $tableKey["idk"] = $data["idk"];
                $tableKey["name"] = $data["name"];
            }
            
        }
        echo json_encode($tableKey);
        
        $tableIds=[];
        foreach ($tableKey["idk"] as $idk)
        {
            $dataIds = $this->getElementTable("keysympt", "idk", $idk);
            foreach($dataIds as $ids)
            {
                array_push($tableIds, $ids["ids"]);
            }
        }
        $tableKey["ids"] = $tableIds;   
        echo json_encode($tableKey);



    }

    
   
    // /**
    //  * Recuperation des pathos
    //  */
    // function getAllPathos()
    // {
    //     $this->checkIfSet();
    //     $data = $this->pathoModel->getAllPathos();
    //     var_dump($data);
    // }

    // function getPathoById($idpatho)
    // {
    //    $this->checkIfSet();
    //     $data = $this->pathoModel->getPathoById($idpatho);
    //     var_dump($data);

    // }

    // /**
    //  * Recuperation des méridiens
    //  */
    // function getAllMerdien()
    // {
    //     $this->checkIfSet();
    //     $data = $this->pathoModel->getAllMerdien();
    //     var_dump($data);
    // }
    // function getMeridienByCode($Codemeridien)
    // {
    //     $this->checkIfSet();
    //     $data = $this->pathoModel->getMeridienByCode($Codemeridien);
    //     var_dump($data);

    // }

    // //  /**
    // //  * Recuperation des méridiens
    // //  */
    // // function getAllMerdien()
    // // {
    // //     $this->checkIfSet();
    // //     $data = $this->pathoModel->getAllMerdien();
    // //     var_dump($data);
    // // }
    // // function getMeridienByCode($Codemeridien)
    // // {
    // //     $this->checkIfSet();
    // //     $data = $this->pathoModel->getMeridienByCode($Codemeridien);
    // //     var_dump($data);

    // // }

}
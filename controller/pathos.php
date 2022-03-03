<?php

namespace Controller;

use Model\PathosModel;
require "./model/pathosModel.php";
require "controller/controller.php";


/**
 * Classe Controller de gestion des pathos
 * @param pathoModel: parametre de connexion avec le model
 */
class Pathos extends Controller
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
     * @param table table sql que l'on veut lire 
     * @param column colonne  que l'on veut lire
     * @param ligne ligne que l'on veut lire
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

        // recuperation de name et idk correspondant la la table Keywords
        foreach( $datas as $data )
        {
            
            if (strpos(strtolower($data["name"]), strtolower($key)) !== false)
            {
                $tableKey["idk"] = $data["idk"];
                $tableKey["name"] = $data["name"];
            }
            
        }
        
        // recuperation des Ids correspondant
        $tableIds=[];
        $tableSympt=[];
        $tableIdp = [];
        $dataIds = $this->getElementTable("keysympt", "idk", $tableKey["idk"]);
        foreach($dataIds as $ids)
        {
            array_push($tableSympt, $this->getElementTable("symptome", "ids", $ids["ids"])[0]["desc"]);
            // array_push($tableIdp, $this->getElementTable("symptpatho", "ids", $ids["ids"]));
            $idp = $this->getElementTable("symptpatho", "ids", $ids["ids"]);
            foreach($idp as $element)
            {
                // echo '<br>';
                // var_dump($element);
            }   
            array_push($tableIds, $ids["ids"]);
            // echo '<br>';
            // var_dump($this->getElementTable("symptpatho", "ids", $ids["ids"]));

        }
        
        $tableKey["ids"] = $tableIds;   
        $tableKey["symptomes"] = $tableSympt;
        $tableKey["idp"] = $tableIdp;
        
        // echo '<pre>';
        // var_dump($tableIdp);
        // echo "</pre>";


        // recuperation des symptomes
        foreach ($tableKey["ids"] as $ids)
        {
            

        }

        // $this->renderTpl("view/template/recherche.tpl", ["title"=> "BEMS - Association d'acupuncteurs"]);


    }

}
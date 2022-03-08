<?php


include_once "./model/pathosModel.php";
include_once "./controller/controller.php";


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
    private function checkIfSetPathoModel()
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
        $this->checkIfSetPathoModel();
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
        
        $this->checkIfSetPathoModel();
        $data = $this->pathoModel->getElementTable($table, $column, $ligne);
        return $data ;
    }

    function searchByKeyword($key)
    {
        // $key = $_POST["sb_text"];
        
       
        $this->checkIfSetPathoModel();
        
        $datas = $this->pathoModel->getTableByKeyword($key);
        // header('Content-Type: application/json');
    
        empty($datas)? $this->renderTpl("view/template/search.tpl", ["data"=> [], "elementFind" => false]) :$this->renderTpl("view/template/search.tpl", ["data"=> $datas[0], "elementFind" => true]);
        // header("Location: http://localhost:3080/test/view/template/search.tpl");


    }

    function search()
    {
        $this->checkIfSetPathoModel();
        $datas = $this->pahtoModel->getTable("meridien");
        
        $meridien = [];
        foreach ($datas as $data)
        {
            $meridien[$data['nom']] = $this->pathoModel->getTableByMeriden($data['nom']) ;
        }
        echo "<pre>";
        var_dump($meridien);
        echo "</pre>";

    }

    
    function searchByPathoType($pathoType)
    {
        $this->checkIfSetPathoModel();
        $datas = $this->pathoModel->getTableByPathoType($pathoType);
        echo "<pre>";
        var_dump($datas);
        echo "</pre>";
    }
}

// [
//     ["meridien1"] => [
//                 pathos1 => [sympthomes]
//                 pathos2 => [sympthomes]
//                 pathos3 => [sympthomes]
//                 ]
//     ["meridien2"] => [
//                 pathos1 => [sympthomes]
//                 pathos2 => [sympthomes]
//                 pathos3 => [sympthomes]
//                 ]

// ]


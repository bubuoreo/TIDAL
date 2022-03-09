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

    function searchAll()
    {
    
        $this->checkIfSetPathoModel();
        $datas = $this->pathoModel->getPathosAll();
        echo "<pre>";
        var_dump($datas);
        echo "</pre>";

        $categoriePathos = [
            "Pathologies de méridien" => "m%",
            "Pathologies d’organe/viscère (tsang/fu)" => "tf",
            "Pathologies des tendino-musculaires ( jing jin)" => "j",
            "Pathologie des branches (voies luo)" => "l",
            "Pathologies des merveilleux vaisseaux" => "mv"
        ];

        $fusion = []
        
        foreach ($datas as $data)
        {
            foreach($categoriePathos as $patho)
            {
                if 
            }
        }

    }

    
    function searchByPathoType($pathoType)
    {
        $correspondance = [
            "Pathologies de méridien" => "m%",
            "Pathologies d’organe/viscère (tsang/fu)" => "tf",
            "Pathologies des tendino-musculaires ( jing jin)" => "j",
            "Pathologie des branches (voies luo)" => "l",
            "Pathologies des merveilleux vaisseaux" => "mv"
        ];
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

[
    "pathologie de meridien" => [
                    "meridien du poumon interne" => [ "symptome1", "sympthom2", ...],
                    "meridien du poumon externe" => [ "symptome1", "sympthom2", ...]
                    ....
                                ]
    
    "Pathologies d’organe/viscère (tsang/fu)" => [
        "meridien du poumon interne" => [ "symptome1", "sympthom2", ...],
        "meridien du poumon externe" => [ "symptome1", "sympthom2", ...]
        ....
                    ]
]
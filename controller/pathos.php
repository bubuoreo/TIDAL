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

    function filtreCoeur($value, $comparator)
    {
        return $value["mer"] == $comparator;  
    }

    function searchAll()
    {
    
        $this->checkIfSetPathoModel();
        $meridiens = $this->pathoModel->getTable("meridien"); // recuperation de la table des meridiens sera utile pour trier par meridien
        
        
        $categoriePathos = [
            "Pathologies de meridien" => ["m%", "mv%"],
            "Pathologies d’organe/viscère (tsang/fu)" => ["tf%"],
            "Pathologies des tendino-musculaires ( jing jin)" => ["j%"],
            "Pathologie des branches (voies luo)" => ["l%"],
            "Pathologies des merveilleux vaisseaux" => ["mv%"]
        ];
        $correspondance = [
            "Pathologies de meridien" => "meridien",
            "Pathologies d’organe/viscère (tsang/fu)" => "tsangFu",
            "Pathologies des tendino-musculaires ( jing jin)" => "jingJin",
            "Pathologie des branches (voies luo)" => "voieLuo",
            "Pathologies des merveilleux vaisseaux" => "merveilleuxVessaux"
        ];
        $datas=[];
        foreach($categoriePathos as $categorie => $reg)
        // iteration sur Categorie patho afin de recuper le nom de la catégorie ainsi que le type associer
        {
            $datas[$correspondance[$categorie]] = $this->pathoModel->getPathosAll($reg) ; // requet sql pour recupérer les valeurs
            $categorieMeridiens = [];
                       
            // echo "<pre>";
            // var_dump('Je suis la'. $categorie);
            // echo "</pre>";
            // die;
            foreach($meridiens as $meridien)
            // iteration sur les meridien pour extrere la liste des des sympthomes pas meridiens
            {
                $comparator = $meridien["code"];
                $categorieMeridiens[$meridien["nom"]] = array_filter($datas[$correspondance[$categorie]], function($value) use($comparator){return $value["mer"] == $comparator;});
            }
            $datas[$correspondance[$categorie]] = array_filter($categorieMeridiens);
            // echo "<pre>";
            // var_dump($datas[$correspondance[$categorie]]);
            // echo "</pre>";
            // die;

         
    
        }
        

        
        

        // echo "<pre>";
        // var_dump($_SERVER['DOCUMENT_ROOT']);
        // echo "</pre>";
        // die;

        $this->renderTpl("view/template/search.tpl", ["datas" => $datas, "Categorie" => $categoriePathos, "logged_in" => $_SESSION["status"]]);

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

// [
//     "pathologie de meridien" => [
//                     "meridien du poumon interne" => [ "symptome1", "sympthom2", ...],
//                     "meridien du poumon externe" => [ "symptome1", "sympthom2", ...]
//                     ....
//                                 ]
    
//     "Pathologies d’organe/viscère (tsang/fu)" => [
//         "meridien du poumon interne" => [ "symptome1", "sympthom2", ...],
//         "meridien du poumon externe" => [ "symptome1", "sympthom2", ...]
//         ....
//                     ]
// ]
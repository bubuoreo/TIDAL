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

    function searchByKeyword()
    {
        $key = $_POST["recherche"];
        
       
        $this->checkIfSetPathoModel();
        
        $datas = $this->pathoModel->getTableByKeyword($key);
        // header('Content-Type: application/json');
    
        empty($datas)? $this->renderTpl("view/template/search.tpl", ["data"=> [], "elementFind" => false]) :$this->renderTpl("view/template/search.tpl", ["data"=> $datas[0], "elementFind" => true]);
        // header("Location: http://localhost:3080/test/view/template/search.tpl");


    }


    function searchAll()
    {
        
        $this->checkIfSetPathoModel();
        $meridiens = $this->pathoModel->getTable("meridien"); // recuperation de la table des meridiens sera utile pour trier par meridien
        
        $categoriePathos = [
            "Pathologies de meridien" => ["reg" =>["m%", "mv%"], "abrev" => "meridien"],
            "Pathologies d’organe/viscère (tsang/fu)" => ["reg" =>["tf%"], "abrev" => "tsangFu"],
            "Pathologies des tendino-musculaires ( jing jin)" => ["reg" =>["j%"], "abrev" => "jingJin"],
            "Pathologie des branches (voies luo)" => ["reg" =>["l%"], "abrev" => "voieLuo"],
            "Pathologies des merveilleux vaisseaux" => ["reg" =>["mv%"], "abrev" => "merveilleuxVessaux"]
        ];
        $correspondance = [
            "Pathologies de meridien" => "meridien",
            "Pathologies d’organe/viscère (tsang/fu)" => "tsangFu",
            "Pathologies des tendino-musculaires ( jing jin)" => "jingJin",
            "Pathologie des branches (voies luo)" => "voieLuo",
            "Pathologies des merveilleux vaisseaux" => "merveilleuxVessaux"
        ];
        $datas=[];
        foreach($categoriePathos as $categorie => $patho)
        // iteration sur Categorie patho afin de recuper le nom de la catégorie ainsi que le type associer
        {
            $datas[$categorie] = $this->pathoModel->getPathosAll($patho["reg"]) ; // requet sql pour recupérer les valeurs
            $categorieMeridiens = [];
                       
         
            foreach($meridiens as $meridien)
            // iteration sur les meridien pour extrere la liste des des sympthomes pas meridiens
            {
                $comparator = $meridien["code"];
                $categorieMeridiens[$meridien["nom"]] = array_filter($datas[$categorie], function($value) use($comparator){return $value["mer"] == $comparator;});
                
            }
            $datas[$categorie] = array_filter($categorieMeridiens);
    
        }
        $this->renderTpl("view/template/search.tpl", ["listeMeridien" => $meridiens, "datas" => $datas, "Categorie" => $categoriePathos, ]);
    }

}
//     function searchByPathoType($pathoType)
//     {
//         $correspondance = [
//             "Pathologies de méridien" => "m%",
//             "Pathologies d’organe/viscère (tsang/fu)" => "tf",
//             "Pathologies des tendino-musculaires ( jing jin)" => "j",
//             "Pathologie des branches (voies luo)" => "l",
//             "Pathologies des merveilleux vaisseaux" => "mv"
//         ];
//         $this->checkIfSetPathoModel();
//         $datas = $this->pathoModel->getTableByPathoType($pathoType);
//         echo "<pre>";
//         var_dump($datas);
//         echo "</pre>";
//     }
// }

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
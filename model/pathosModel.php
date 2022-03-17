<?php


require("./model/model.php");
/**
 * classe de gestion des requetes pour les pathologies
 */
class PathosModel extends Model
{
    
    /**
     * Permet de recupere toutes les valeurs d'une table
     * @param table: nom de la table que l'on souhaite récuperer.
     * @return data reponse de la requete 
     */
    function getTable($table)
    {
        $sql = "SELECT * FROM public.". $table; // Commande sql stocké dans une chaine de charactere
        return $this->sqlRequest($sql);
    }

    /**
     * Permet de recupere une ligne en particuler d'une table 
     * @param table nom de la tabel que l'on souhaite regarder
     * @param column nom de la colonne 
     * @param ligne id de la ligne que l'on veut
     */
    function getElementTable(string $table, string $column, string $ligne)
    {
       
        $sql =  "SELECT * FROM public." . $table . " WHERE $column = :$column" ;
        
        return $this->sqlRequest($sql, [":".$column => $ligne]);
    }
    
    /**
     * prepatation de la requete afin d'obtenir toutes les informations liées a keyword
     * @param keyword mot clé fourni par l'utilisateur pour faire une recherche
     */
    function getTableByKeyword($keyword)
    {
        $sql = "SELECT keywords.name, symptome.desc AS description, patho.mer, patho.type,meridien.nom, patho.desc AS meridien 
                FROM keywords
                JOIN keysympt
                    ON keywords.idk = keysympt.idk
                JOIN symptome
                    ON keysympt.ids = symptome.ids
                JOIN symptpatho
                    ON symptome.ids = symptpatho.ids
                JOIN patho
                    ON symptpatho.idp = patho.idp
                JOIN meridien
                    ON patho.mer = meridien.code
                WHERE keywords.name = :keyword
                ORDER BY patho.idp, patho.type";


        return $this->sqlRequest($sql, [":keyword" => $keyword]);

    }

    /**
     * recuperation des informations liées a un meridiens en particulier
     * @param meridien meridien d'on l'on souhaite les infos
     */
    function getTableByMeriden($meridien)
    {
        $sql = "SELECT  symptome.desc, patho.desc, patho.type,patho.mer
        FROM meridien
        JOIN patho
            ON patho.mer = meridien.code
        JOIN symptpatho
            ON symptpatho.idp = patho.idp
        JOIN symptome
            ON symptome.ids = symptpatho.ids
		WHERE meridien.nom = :meridien";


        return $this->sqlRequest($sql, [":meridien" => $meridien]);
    }

    
    /**
     * recuperation de toutes les tables en utilisant le pathosType
     * @param pathoType array ["l"] soit ["m%", "mv"]
     */
    function getPathosAll($pathoType)
    {
        
        if ($pathoType[0] != "m%")
        {
            $sql = "SELECT patho.mer, patho.type, patho.desc, symptome.desc AS descriptionSympt, meridien.nom
            FROM patho
            JOIN symptpatho 
                ON patho.idp = symptpatho.idp
            JOIN symptome
                ON symptpatho.ids = symptome.ids
            JOIN meridien 
                ON meridien.code = patho.mer
                WHERE patho.type LIKE :typePatho
            ORDER BY patho.mer";

            $data = $this->sqlRequest($sql,[":typePatho" => $pathoType[0]]);
        }
        else
        {
            $sql = "SELECT patho.mer, patho.type, patho.desc, symptome.desc AS descriptionSympt, meridien.nom
                FROM patho
                JOIN symptpatho 
                    ON patho.idp = symptpatho.idp
                JOIN symptome
                    ON symptpatho.ids = symptome.ids
                JOIN meridien 
                    ON meridien.code = patho.mer
                WHERE patho.type LIKE :typePatho AND patho.type NOT LIKE :nonTypePatho
                ORDER BY patho.mer";

                $data = $this->sqlRequest($sql , [":typePatho" => $pathoType[0], ":nonTypePatho" => $pathoType[1]]);
        }

        return $data;
    }

}
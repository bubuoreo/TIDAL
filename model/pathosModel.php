<?php

namespace Model;
require("./model/model.php");

class PathosModel extends Model
{
    
    /**
     * Permet de recupere toutes les valeurs d'une table
     * @param table: nom de la table que l'on souhaite récuperer. 
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
    
    function getTableByKeyword($keyword)
    {
        $sql = "SELECT keywords.*, keysympt.ids, symptome.desc, patho.*, meridien.*
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
                WHERE keywords.name = :keyword";


        return $this->sqlRequest($sql, [":keyword" => $keyword]);

    }
}
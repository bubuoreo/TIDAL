<?php

namespace Model;
require("./Model/model.php");

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
    
    //  /**
    //  * Recuperation des pathos
    //  */
    // public function getAllPathos()
    // {
       
    //     $sql = "SELECT * FROM public.patho"; // Commande sql stocké dans une chaine de charactere
    //     return $this->sqlRequest($sql);
    // }   


    // public function getPathoById($idpatho)
    // {
       
    //     $sql =  "SELECT * FROM public.patho WHERE idp= :idp";
    //     return $this->sqlRequest($sql, [':idp' => $idpatho]);
    // }   


    // /**
    //  * Recuperation des méridiens
    //  */
    // public function getAllMerdien()
    // {
    //     $sql =  "SELECT * FROM public.meridien ";
    //     return $this->sqlRequest($sql);
    // }
    // public function getMeridienByCode($Codemeridien)
    // {
       
    //     $sql =  "SELECT * FROM public.meridien WHERE code= :code";
    //     return $this->sqlRequest($sql, [':code' => $Codemeridien]);
    // } 


    // /**
    //  * Recuperation des sympthomes
    //  */
    // public function getAllSympthomes()
    // {
    //     $sql =  "SELECT * FROM public.symptome ";
    //     return $this->sqlRequest($sql);
    // }
    // public function getSympthomeByid($idSympthome)
    // {
       
    //     $sql =  "SELECT * FROM public.symptome WHERE ids= :idSympthome";
    //     return $this->sqlRequest($sql, [':idSympthome' => $idSympthome]);
    // } 
    
}
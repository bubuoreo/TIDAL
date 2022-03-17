<?php


require_once("model.php");

/**
 * classe de gestion des requetes liers aux utilistateurs donc userTable
 */
class ClientModel extends Model
{

    /**
     * recuperation de tous les utilistateur (pour l'admin)
     */
    public function getAll()
    {
       
        $sql = "SELECT * FROM public.\"userTable\""; // Commande sql stocké dans une chaine de charactere
      
        return $this->sqlRequest($sql);
    }

    /**
     * recuperation des information d'un utilisateur en particulier a l'aide 
     * de son unsername
     */
    public function getUser($username){
        $sql = "SELECT * FROM public.\"userTable\" WHERE username = :username "; // Commande sql stocké dans une chaine de charactere
        return $this->sqlRequest($sql, [":username" => $username]);
    }

    /**
     * creation d'un nouvel utilisteur dans la base de donnée
     */
    public function setUser($username, $password, $email)
    {
        $sql = "INSERT INTO public.\"userTable\" (username, password, email) VALUES ( :user, :pass, :mail);"; // Commande sql stocké dans une chaine de charactere
        
        return $this->sqlRequest($sql, [":user" => $username, ":pass" => $password, ":mail" => $email]);
    }

    /**
     * modification du mot de passe d'un utilisateur
     */
    public function modifiPassword($username, $newpassword)
    {
        $sql = "UPDATE public.\"userTable\" SET password = :newpass  WHERE username = :username;";
        return $this->sqlRequest($sql, [":newpass" => $newpassword, ":username" => $username]);
    }
}
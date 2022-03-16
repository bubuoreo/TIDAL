<?php


require_once("model.php");

class ClientModel extends Model
{
    private static   $userNumber = 0;

    public function getAll()
    {
       
        $sql = "SELECT * FROM public.userTable"; // Commande sql stocké dans une chaine de charactere
      
        return $this->sqlRequest($sql);
    }

    public function getUser($username){
        $sql = "SELECT * FROM public.userTable WHERE username= :username"; // Commande sql stocké dans une chaine de charactere
        return $this->sqlRequest($sql, [":username" => $username]);
    }

    public function setUser($username, $password, $email)
    {
        $sql = "INSERT INTO public.userTable (username, password, email) VALUES (':username', ':password', ':email');"; // Commande sql stocké dans une chaine de charactere
        
        return $this->sqlRequest($sql, [":username" => $username, ":password" => $password, ":email" => $email]);
    }

    public function modifiPassword($username, $newpassword)
    {
        $sql = "UPDATE public.userTable SET password = :newpass  WHERE username = :username;";
        return $this->sqlRequest($sql, [":newpass" => $newpassword, ":username" => $username]);
    }
}
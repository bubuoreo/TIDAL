<?php

namespace Model;
require_once("model.php");

class ClientModel extends Model
{
    private static   $userNumber = 0;

    public function getAll()
    {
       
        $sql = "SELECT * FROM public.\"userTable\""; // Commande sql stocké dans une chaine de charactere
      
        return $this->sqlRequest($sql);
    }

    public function getUser($username){
        $sql = "SELECT * FROM public.\"userTable\" WHERE username='{{$username}}'"; // Commande sql stocké dans une chaine de charactere
        return $this->sqlRequest($sql);
    }

    public function setUser($username, $pasword, $email)
    {
        $sql = "INSERT INTO public.\"userTable\" (username, password, email) VALUES ('{{$username}}', '{{$pasword}}', '{{$email}}');"; // Commande sql stocké dans une chaine de charactere
        var_dump($sql);
        return $this->sqlRequest($sql);
    }
}
<?php

include_once "./controller/controller.php";

class Login extends Controller
{
   
    /**
     * First time on the login page
     */
    function displayLogin()
    {
        $connecter = $this->islogged();
        $user = "";
        if ($connecter)
        {
            $user = $_SESSION["user"];
        }

        $this->renderTpl("view/template/login.tpl", [
            "incorrect_login" => false,
            "connect" => $connecter,
            "user" => $user, 
            "password_modifier" => false ]);
    }

    
    /**
     * Verifies the credentials of the login
     */
    function connexionLogin()
    {
        require('model/clientModel.php');
        require_once("pathos.php");
        $username = htmlspecialchars($_POST["input_user"]);
        
        $client = new clientModel();
        $data = $client->getUser($username);
        $flag = True;

 

        // Verify if it is the good pswd
        if ((sizeof($data) != 0)) {// TODO: remplace when data is added to the db
            $db_pswd = $data[0]["password"]; 
            $password = htmlspecialchars($_POST["input_password"]);
            
            // TODO : For now the problem ofthe routes are not specifically addressed...
            if(password_verify($password, $db_pswd)){
                $flag=false;
                
                if($_SESSION["status"]==0)
                {
                    $_SESSION["username"] = $username; // Adding the user to the session
                    $_SESSION["status"] = 1;    
                }

                $router = new Router("/listeSympthome");
                $router->newRoutePost("/listeSympthome", "Pathos@searchAll");
                $router->run();

            }
        }
        
        if($flag){
            $this->renderTpl("view/template/login.tpl", [
                "incorrect_login" =>true, 
                "password_modifier" => false]);  
            }
    }

        
    /**
     * First time on the account creation page
     */
    function displayNewAcc()
    {
        $connecter = $this->islogged();

        $this->renderTpl("view/template/new_account.tpl", [
            "already_exists" => false,
            "connect" => $connecter]);
    }


        /**
         * Verifies the credentials of the login
         */
    function connexionNewAcc()
    {
        require('model/clientModel.php');
        
        $username = htmlspecialchars($_POST["input_user"]);
        $password = htmlspecialchars($_POST["input_email"]);
        $email = htmlspecialchars($_POST["input_email"]);

        $client = new clientModel();
        $data = $client->getUser($username);

        // Verify if it is the good pswd
        if ((sizeof($data) == 0)) {
            $client->setUser($username, password_hash($password,PASSWORD_DEFAULT), $email);
            $router = new Router("/");
            $router->newRoutePost("/", "Controller\Login@display");
            $router->run();
        }
        else{
            $this->renderTpl("view/template/new_account.tpl", ["already_exists" =>true]);

        }
    }

    function modificationMdp()
    {
        require_once('model/clientModel.php');
        $client = new clientModel();
        $user = htmlspecialchars($_POST["input_user_modif"]);
        $newpassword = htmlspecialchars($_POST["input_password_modif"]);

        $verifuser = $client->getUser($user);

        if (!empty($verifuser))
        {
            $client->modifiPassword($user, password_hash($newpassword,PASSWORD_DEFAULT));

            $this->renderTpl("view/template/login.tpl", [
                "incorrect_login" => false, 
                "password_modifier" => true]);  
        }
    }
}
    



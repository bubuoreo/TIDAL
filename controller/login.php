<?php

include_once "./controller/controller.php";

class Login extends Controller
{
   
    /**
     * First time on the login page
     */
    function displayLogin()
    {
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library

        $smarty = new \Smarty(); // Creating smarty object
        $smarty->assign('incorrect_login',false); // No error messages will be displayed
        $smarty->display("view/template/login.tpl"); // displaying the tpl page
    }

    /**
     * First time on the account creation page
     */
    function displayNewAcc(){
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library
        $smarty = new \Smarty(); // Creating smarty object
        $smarty->assign('already_exists',false); // No error messages will be displayed
        $smarty->display("view/template/new_account.tpl"); // displaying the tpl page
    }

    /**
     * Verifies the credentials of the login
     */
    function connexionLogin()
    {
        require('model/clientModel.php');
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library
        require_once("pathos.php");

        $client = new clientModel();
        $data = $client->getUser($_POST["input_user"]);
        $flag = True;

        $smarty = new \Smarty(); // Creating smarty object

        // Verify if it is the good pswd
        if ((sizeof($data) != 0)) {// TODO: remplace when data is added to the db
            $db_pswd = $data[0]["password"]; 

            // TODO : For now the problem ofthe routes are not specifically addressed...
            if(password_verify($_POST["input_password"],$db_pswd)){
                $flag=false;

                if($_SESSION["status"]==0)
                {
                    $_SESSION["user"] = $_POST["input_user"]; // Adding the user to the session
                    $_SESSION["status"] = 1;
                    
                }

                $router = new Router("/search");
                $router->newRoutePost("/search", "Pathos@searchAll");
                $router->run();

            }
        }
       
        if($flag){
            $smarty->assign('incorrect_login',true); // No error messages will be displayed
            $smarty->display("view/template/login.tpl"); // displaying the tpl page
        }
    }

    /**
     * Verifies the credentials of the login
     */
    function connexionNewAcc()
    {
        require('model/clientModel.php');
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library

        $client = new clientModel();
        $data = $client->getUser($_POST["input_user"]);
        $smarty = new \Smarty(); // Creating smarty object

        // Verify if it is the good pswd
        if ((sizeof($data) == 0)) {
            $client->setUser($_POST["input_user"],password_hash($_POST["input_password"],PASSWORD_DEFAULT),$_POST["input_email"]);
            $router = new Router("/");
            $router->newRoutePost("/", "Controller\Login@display");
            $router->run();
        }
        else{
            $smarty->assign('already_exists',true); // No error messages will be displayed
            $smarty->display("view/template/new_account.tpl"); // displaying the tpl page
        }
    }

}
    



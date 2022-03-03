<?php

namespace Controller;

use Controller\Route\Router;
use Model\ClientModel;

class Login 
{
    function displayHome()
    {
        echo "salut je suis la homepage";
    }
    /**
     * First time on the login page
     */
    function display()
    {
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library

        $smarty = new \Smarty(); // Creating smarty object
        $smarty->assign('incorrect_login','False'); // No error messages will be displayed
        $smarty->display("view/template/login.tpl"); // displaying the tpl page
    }

    /**
     * First time on the account creation page
     */
    function displayNewAcc(){
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library
        $smarty = new \Smarty(); // Creating smarty object
        $smarty->assign('already_exists','False'); // No error messages will be displayed
        $smarty->display("view/template/new_account.tpl"); // displaying the tpl page
    }

    /**
     * Verifies the credentials of the login
     */
    function connexion()
    {
        require('model/clientModel.php');
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library

        $client = new clientModel();
        $data = $client->getUser($_POST["input_user"]);
        $flag = True;
        var_dump($data[0]["password"]);

        $smarty = new \Smarty(); // Creating smarty object

        // Verify if it is the good pswd
        if ((sizeof($data) != 0)) {// TODO: remplace when data is added to the db
            $db_pswd = $data[0]["password"]; 
            // TODO : For now the problem ofthe routes are not specifically addressed...
            if($db_pswd == $_POST["input_password"]){
                $router = new Router("/");
                $router->newRouteGet("/", "Controller\Login@display");
                $router->run();
            }
        }
       
        if($flag){
            $smarty->assign('already_exists','True'); // No error messages will be displayed
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
            $router = new Router($_GET["url"]);
            $router->newRouteGet("/", "Controller\Login@display");
            $router->run();
        }
        else{
            $smarty->assign('incorrect_login','True'); // No error messages will be displayed
            $smarty->display("view/template/new_account.tpl"); // displaying the tpl page
        }
    }

    function test(int $param)
    {
        echo "salut je suis un test avec param:". $param;
    }

    function policy()
    {
       
        $router = new Router("/");
        $router->newRouteGet("/", "Controller\Login@display");
        $router->run();

    }

    function testSmarty()
    {
        
    }
}



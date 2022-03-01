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
     * Verifies the credentials of the login
     */
    function connexion()
    {
        var_dump($_POST["input_user"]);

        require('model/clientModel.php');
        require_once("smarty/libs/Smarty.class.php"); //importing smarty library

        $client = new clientModel();
        //var_dump($client->setUser("root","toor","root@root.root"));
        //$data = $client->getUser($_POST["input_user"]);

        $smarty = new \Smarty(); // Creating smarty object

        if (True) {// TODO: remplace when data is added to the db
            // TODO : For now the problem ofthe routes are not specifically addressed...
            
            $smarty->assign('incorrect_login','True'); // No error messages will be displayed
            $smarty->display("view/template/index.tpl"); // displaying the tpl page
        }
        else{
            $smarty->assign('incorrect_login','True'); // No error messages will be displayed
            $smarty->display("view/template/login.tpl"); // displaying the tpl page
        }
    }

    function test(int $param)
    {
        echo "salut je suis un test avec param:". $param;
    }

    function policy()
    {
       
        $router = new Router("/");
        $router->get("/", "Controller\Login@display");
        $router->run();

    }

    function testSmarty()
    {
        
    }
}

// $info = $_POST;
// //var_dump($_POST);
    
// $data = getUser($info["input_user"]);
// echo "okok" . setUser('romain','galmier','r@g.fr');

// if($data){
//     echo 'ok';
//     if($data["password"]==$info["input_password"]){
//         session_start();
//         $_SESSION['user'] = $data["username"];
//         $_SESSION['email'] = $data["email"];
//         echo '</br>';
//         var_dump($_SESSION);
//     }
// }
// else{
//     echo "Retry boi";
//     // header('Location: ../view/login.html');
//     echo "<p>Error</p>";
//     exit;
// }

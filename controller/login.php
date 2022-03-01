<?php

namespace Controller;

use Controller\Route\Router;

class Login 
{
    function displayHome()
    {
        echo "salut je suis la homepage";
    function displayHome()
    {
        echo "salut je suis la homepage";
    }
    function display()
    {
        $login = False;
        require_once("smarty/libs/Smarty.class.php");
        $smarty = new \Smarty();
        $smarty->assign('','');
        $smarty->display("view/template/login.tpl");
    }
    function connexion()
    {
        // $_POST[];
        // 
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

<?php
require "../model/client.php";

$info = $_POST;
//var_dump($_POST);
    
$data = getUser($info["input_user"]);

if($data){
    echo 'ok';
    if($data["password"]==$info["input_password"]){
        session_start();
        $_SESSION['user'] = $info["input_user"];
        echo '</br>';
        var_dump($_SESSION);
    }
}
else{
    echo "Retry boi";
    header('Location: ../view/login.html');
    //echo "<alert>retry boi</alert>";
    exit;
}

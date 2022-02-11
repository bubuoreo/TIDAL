<?php
require "../model/client.php";

$info = $_POST;
//var_dump($_POST);
    
$data = getUser($info["input_user"]);
echo "okok" . setUser('romain','galmier','r@g.fr');

if($data){
    echo 'ok';
    if($data["password"]==$info["input_password"]){
        session_start();
        $_SESSION['user'] = $data["username"];
        $_SESSION['email'] = $data["email"];
        echo '</br>';
        var_dump($_SESSION);
    }
}
else{
    echo "Retry boi";
    // header('Location: ../view/login.html');
    echo "<p>Error</p>";
    exit;
}

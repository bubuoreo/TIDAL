<?php


function verifyUser($username,$password){

    $db_user = "pgtidal";
    $db_pass = "tidal";
    $host='localhost';
    $db_name='acudb';

    try{
        $dbh = new PDO("pgsql:host=$host;dbname=$db_name",$db_user,$db_pass); // quand on le creer, on transmet une chaine de connection
    }
    catch(PDOException $e){
        print "Erreur : " . $e->getMessage() . "<br/>";
        die;
    }
    

    echo 'dbh ok';

    $sql = 'SELECT * FROM public.userTable WHERE "user" = :$username'; // Commande sql stocké dans une chaine de charactere

    $dbh->beginTransaction();
    
    try {
        $sth = $dbh->prepare($sql);
        $sth->execute(array(':$username' => "vraie"));
        $data = $sth->fetchAll();
        $dbh->commit();
        var_dump($data);
    } 
    catch(PDOException $e) {
        $dbh->rollback();
    }
    return NULL;
}

verifyUser("user","password");

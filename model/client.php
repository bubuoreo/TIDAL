<?php


function verifyUser($username,$password){
    
    $dbh = new PDO('sqlite:../acuBD-pgsql.sql'); // quand on le creer, on transmet une chaine de connection

    $sql = 'SELECT * FROM public.userTable WHERE "user" = :$username'; // Commande sql stocké dans une chaine de charactere

    $dbh->beginTransaction();
    echo 'ok boi';
    try {
        $sth = $dbh->prepare($sql);
        $sth->execute(array(':$username' => "vraie valeur"));
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

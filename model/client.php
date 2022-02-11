<?php
function sqlRequest($sql,$dbh){
    $dbh->beginTransaction();
    
    try {
        $sth = $dbh->prepare($sql);
        $sth->execute();
        $data = $sth->fetch(PDO::FETCH_ASSOC);
        $dbh->commit();
    } 
    catch(PDOException $e) {
        $dbh->rollback();
    }

    return $data;
}

function getUser($username){

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

    $sql = "SELECT * FROM public.\"userTable\" WHERE username='$username'"; // Commande sql stocké dans une chaine de charactere
    
    return sqlRequest($sql,$dbh);
}

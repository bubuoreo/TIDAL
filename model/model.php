<?php


/**
 * Super classe qui gere la connection ainsi que 
 * l'execution des requetes SQL qui on été préparé par les autres models
 */
class Model
{       
    /**
     * parametres de connection
     */
    protected $db_user = "pgtidal";
    protected $db_pass = "tidal";
    protected $host='localhost';
    protected $db_name='acudb';
    
    protected $dbh;

    /**
     * initialisation de la connection a la DB
     */
    function initialisationDB()
    {
        try{
            $dbh = new \PDO("pgsql:host=$this->host;dbname=$this->db_name",$this->db_user,$this->db_pass); // quand on le creer, on transmet une chaine de connection
            $this->dbh = $dbh;
        }
        catch(\PDOException $e){
            print "Erreur : " . $e->getMessage() . "<br/>";
            die;
        }
        
    }

    /**
     * verification si la connection a été établie grace a l'objet dbh
     */
    private function checkInitialisationDB()
    {
        if ($this->dbh == null)
        {
            $this->initialisationDB();
        }
    }

    /**
     * fonction qui execute les requetes 
     * @param sql requete prepare
     * @param arguments arguments qui l'on peut founir pour les ajouter a la requete
     * 
     * @return data données recus du server SQL
     */
    function sqlRequest($sql, $arguments = []){
        
      
        $this->checkInitialisationDB();
       

        $this->dbh->beginTransaction();
        
        if (empty($arguments))
        {
            try {
                $sth = $this->dbh->prepare($sql);
                $sth->execute();
                $data = $sth->fetchAll(\PDO::FETCH_ASSOC);
                $this->dbh->commit();
            } 
            catch(\PDOException $e) {
                    $this->dbh->rollback();
            }
        }
        else
        {
            try {
                $sth = $this->dbh->prepare($sql);
                $sth->execute($arguments);
                $data = $sth->fetchAll(\PDO::FETCH_ASSOC);
                $this->dbh->commit();
            } 
            catch(\PDOException $e) {
                    $this->dbh->rollback();
            }
        }

        return $data;
    }
    
    
    
}
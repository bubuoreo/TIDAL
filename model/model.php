<?php


namespace Model;

class Model
{       
    protected $db_user = "pgtidal";
    protected $db_pass = "tidal";
    protected $host='localhost';
    protected $db_name='acudb';
    
    protected $dbh;


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


    private function checkInitialisationDB()
    {
        if ($this->dbh == null)
        {
            $this->initialisationDB();
        }
    }

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
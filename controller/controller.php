<?php




require_once("smarty/libs/Smarty.class.php");

class Controller
{
    protected $UserSession;
    protected $smarty ;

    function initSmarty()
    {
        $this->smarty = new Smarty();
    }

    /**
     * fonction pour utiliser les templates smarty avec assignation de paramettres
     * @param path : chemin vers le fichier de template
     * @param params : tableau associatif pour passer des paramettres a smarty de la forme
     *                  [ nom-variable => valeur]
     */
    function renderTpl($path, $params=[])
    {
        if (!isset($this->smarty))
        {
            $this->initSmarty();
        }
        if (!empty($params))
        {
            
            foreach ($params as $clef => $valeur)
            {
                $this->smarty->assign($clef, $valeur);
            }
        }
        // header("Location: http://localhost:3080/login");
        $this->smarty->display($path);
    }
    
    function checkSession()
    {
        // session_start();
        if(!isset($_SESSION["status"]))
        {
            return false;
        }
        return true;
    }


    function startSession()
    {
        if (!$this->checkSession())
        {
            session_set_cookie_params(['samesite' => "Strict"]);
            session_start();
            session_regenerate_id();
            $_SESSION["status"] = 0;
        }
    }
    

    function islogged()
    {
        if ($this->checkSession())
        {
            if ($_SESSION["status"] == 1)
            {
                return true;
            }
            return false;
        }
        return false;
    }

    function exitSession()
    {
        session_unset();
        session_destroy();
        $this->startSession();
    }
    
}
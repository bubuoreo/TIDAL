<?php

namespace Controller\Route;

/**
 * classe Route qui contient un objet route avec pour parametres:
 * @param path  chemin vers le fichier a ouvrir
 * @param action fonction a executer 
 * @param matches routes qui matches avec le path
 */
class Route
{
    public $path;
    public $action;
    public $matches;

    /**
     * 
     */
    public function __construct($path, $action)
    {   
        $this->path = trim($path, '/');
        $this->action = $action;
            
    }

    /**
     * methode qui vérifie si l'url passer correspond au chemin existant
     */
    public function matches(string $url)
    {   
        $valren = false;
        $path = preg_replace('#:([\w]+)#', '([^/]+)', $this->path);
        
        $pathToMatch = "#^$path$#";
        
        
        if (preg_match($pathToMatch, $url, $matches))
        {

            
            $this->matches = $matches;
            $valren =  true;
        }
       
        return $valren;
    }

    /**
     * méthode qui va executer la fonction action dans le chemin path
     */
    public function execute()
    {
        $params = explode('@', $this->action);
        $controller = new $params[0]();
        $method = $params[1];
        
        return isset($this->matches[1]) ? $controller->$method($this->matches[1]) : $controller->$method();

    }
}
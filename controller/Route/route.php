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
     * Méthode construsant une route et la méthode et la méthode à réaliser
     * @param path donne le chemin d'accès
     * @param action donne le namespace avec la méthode à appeler
     */
    public function __construct($path, $action)
    {   
        # enlève le caractère '/' au début et à la fon de la chaine de caractère
        $this->path = trim($path, '/');
        # stocke l'action voulue en paramètre
        $this->action = $action; 
            
    }

    /**
     * Methode qui vérifie si l'url passer correspond au chemin existant
     * @param url variable de type string qui renseigne l'url
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
        # sépare en gros le nom de la fonction avec le nom de la méthode à réaliser
        $params = explode('@', $this->action);
        $controller = new $params[0]();
        $method = $params[1];
        
        return isset($this->matches[1]) ? $controller->$method($this->matches[1]) : $controller->$method();

    }
}
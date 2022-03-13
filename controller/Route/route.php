<?php



/**
 * classe Route qui contient un objet de type route avec pour parametres:
 * @param path      chemin vers le fichier a ouvrir
 * @param action    fonction a executer 
 * @param matches   routes qui matches avec le path
 */
class Route
{
    public $path;
    public $action;
    public $matches;

    /**
     * Méthode construisant une route avec la méthode à réaliser
     * @param path      donne le chemin d'accès
     * @param action    donne le namespace avec la méthode à appeler
     */
    public function __construct($path, $action)
    {   
        # enlève le caractère '/' au début et à la fin de la chaine de caractère
        $this->path = trim($path, '/');
        # stocke l'action voulue en paramètre
        $this->action = $action; 
    }

    /**
     * Methode qui vérifie si l'url passer correspond au chemin existant
     * @param url string, renseigne l'url
     * @return valren boolean, montre si l'url est la même chose que le path
     */
    public function matches(string $url)
    {   
        # Initialisation de la valeur de retour
        $valren = false;
        # remplace le deuxième argument par le caractère ci-dessous
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
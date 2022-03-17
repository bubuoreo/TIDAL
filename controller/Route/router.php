<?php

use function PHPSTORM_META\elementType;

require("route.php");


/**
 * Classe Router permet de faire le routage des differentes url
 * @param url 
 * @param routes tableau contenant des objets Route qui liste les routes connues 
 */
class Router
{
    private $default = "/";
    public $url;
    public $routes = [];


    public function __construct($url)
    {
        $this->url = trim($url, '/');
        $this->routes["default"] = new Route("/","Page@displayHome" );
    }

    /**
     * Permet d'ajouter un nouvelles routes de methode GET
     */
    public function newRouteGet(string $path, string $action)
    {
        $this->routes["GET"][] = new Route($path, $action);
    }

    /**
     * Permet d'ajouter une nouvelle route de methode POST
     */
    public function newRoutePost(string $path, string $action)
    {
        $this->routes["POST"][] = new Route($path, $action);
    }


    /**
     * Permet de run le router c'est à dire que nous allons récupéré l'url passé avec la methode
     * et vérifier si une route connue correspond, pour pouvoir exécuter la methode correspondante.
     */
    public function run()
    {
        if ($this->middleware())
        {

            # Parcours la variable dont la méthode de requête est celle spécifiée
            foreach($this->routes[$_SERVER['REQUEST_METHOD']] as $route)
            {
                # test si la route est bien une route pouvant être réalisée
                if ($route->matches($this->url) == true)
                {
                    $route->execute(); # l'exécute
                    return true;
                }
            }

            // redirection vers la home page 
            $this->routes["default"]->execute();
            echo "<script> 
                    alert('La route que avez indiqué n\'existe pas. Vous avez été rediriré');  
                </script>";
        }
        else
        {
            // redirection vers la home page 
            $this->routes["default"]->execute();
            echo "<script> 
                    alert('Vous n\'avez pas les droit d\'accès. Vous avez été rediriré');  
                </script>";
        }
            
    }

    /**
     * verifie les droits d'acces de l'utilisateur
     */
    private function middleware()
    {
        if($this->url == "userList")
        {
            if ($_SESSION["status"] == 2)
            {
                return true;
            }
            else   
            {
                return false;
            }
            
        }

        return true;
    }


   
}


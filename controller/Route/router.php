<?php

namespace Controller\Route;
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
        $this->routes["default"] = new Route("/","Controller\Login@display" );
    }

    /**
     * Permet d'ajouter un nouvelles routes de methode GET
     */
    public function get(string $path, string $action)
    {
        $this->routes["GET"][] = new Route($path, $action);
    }

    /**
     * Permet d'ajouter une nouvelle route de methode POST
     */
    public function post(string $path, string $action)
    {
        $this->routes["POST"][] = new Route($path, $action);
    }


    /**
     * Permet de run le router c'est à dire que nous allons récupéré l'url passé avec la methode
     * et vérifier si une route connue correspond, pour pouvoir exécuter la methode correspondante.
     */
    public function run()
    {
        # Parcours la variable dont la méthode de requête est celle spécifiée
        foreach($this->routes[$_SERVER['REQUEST_METHOD']] as $route)
        {
            # test si la route est bien une route pouvant être réalisée
            if ($route->matches($this->url) == true)
            {
                $route->execute(); # l'exécute
            }
        }
        // return  header("HTTP/1.0 404 Not Found");
        // echo "URL invalide, redirection";
        // sleep(2);
        // $this->routes["default"]->execute();

    }


    // public function reroute($methode, $path)
    // {
    //     foreach($this->routes[$methode] as $route);
    //     if ($route->matches($this->$path) == true)
    //         {
    //             $route->execute();
    //         }
    // }
}


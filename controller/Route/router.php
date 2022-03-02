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
     * permet d'ajouter un nouvelles routes de methode GET
     */
    public function newRouteGet(string $path, string $action)
    {
        $this->routes["GET"][] = new Route($path, $action);
    }

    /**
     * permet d'ajouter une nouvelle route de methode POST
     */
    public function newRoutePost(string $path, string $action)
    {
        $this->routes["POST"][] = new Route($path, $action);
    }


    /**
     * permet de run le router c'est a dire qui nous allons recupere l'url passer avec la methode
     * et verifier si une route connue correspond pour pouvoir exetuter la methode correspondante
     */
    public function run()
    {
        foreach($this->routes[$_SERVER['REQUEST_METHOD']] as $route)
        {

            if ($route->matches($this->url) == true)
            {
                $route->execute();
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


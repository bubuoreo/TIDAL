<?php

namespace Controller\Route;
require("route.php");

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

    public function get(string $path, string $action)
    {
        $this->routes["GET"][] = new Route($path, $action);
    }

    public function post(string $path, string $action)
    {
        $this->routes["POST"][] = new Route($path, $action);
    }

    public function run()
    {
        foreach($this->routes[$_SERVER['REQUEST_METHOD']] as $route)
        {

            if ($route->matches($this->url) == true)
            {
                $route->execute();
            }
        }
        return  header("HTTP/1.0 404 Not Found");
        // echo "URL invalide, redirection";
        // sleep(2);
        // $this->routes["default"]->execute();

    }

    public function reroute($methode, $path)
    {
        foreach($this->routes[$methode] as $route);
        if ($route->matches($this->$path) == true)
            {
                $route->execute();
            }
    }
}


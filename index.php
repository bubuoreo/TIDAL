<?php

use Controller\Route\Router;

require_once("controller/Route/router.php");
require_once("controller/login.php");
require_once("controller/pathos.php");

$router = new Router($_GET["url"]);


/**
 * Listage des routes
 */


 /**
  * GET
  */

$router->newRouteGet("/", "Controller\Login@displayhome");
$router->newRouteGet("/login", "Controller\Login@display");
$router->newRouteGet("/policy", "Controller\Login@policy");
$router->newRouteGet("/create", "Controller\Login@displayNewAcc");


$router->newRouteGet("/sympthome/:key", "Controller\Pathos@searchByKeyword");
$router->newRouteGet("/meridien/:code", "Controller\Pathos@getMeridienByCode");

 /**
  * POST
  */
$router->newRoutePost("/login", "Controller\Login@connexion");
$router->newRoutePost("/create", "Controller\Login@connexionNewAcc");



$router->run();


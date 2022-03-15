<?php



require_once("controller/Route/router.php");
require_once("controller/login.php");
require_once("controller/pathos.php");
require_once("controller/page.php");

$router = new Router($_GET["url"]);


/**
 * Listage des routes
 */


 /**
  * GET
  */

$router->newRouteGet("/", "Page@displayHome");
$router->newRouteGet("/policy", "Page@displayPolicy");
$router->newRouteGet("/sources", "Page@displaySources");

$router->newRouteGet("/create", "Login@displayNewAcc");
$router->newRouteGet("/login", "Login@display");


$router->newRouteGet("/listeSympthome", "Pathos@searchAll");

/**
 * POST
 */
$router->newRoutePost("/login", "Login@connexion");
$router->newRoutePost("/create", "Login@connexionNewAcc");


$router->newRoutePost("/search", "Pathos@searchByKeyword");

$router->run();


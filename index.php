<?php

require_once("controller/Route/router.php");
require_once("controller/login.php");
require_once("controller/pathos.php");
require_once("controller/page.php");

/**
 * Creation d'une session utilisateur
 */
session_start();

$_SESSION["status"] = 0;

/**
 * Création d'un routeur
*/
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
$router->newRouteGet("/login", "Login@displayLogin");


$router->newRouteGet("/search", "Pathos@searchAll");
$router->newRouteGet("/sympthome/:key", "Pathos@searchByKeyword");
$router->newRouteGet("/meridien/:code", "Pathos@getMeridienByCode");
$router->newRouteGet("/pathos/:pathoType", "Pathos@searchByPathoType");

 /**
  * POST
  */
$router->newRoutePost("/search", "Pathos@searchAll");
$router->newRoutePost("/login", "Login@connexionLogin");
$router->newRoutePost("/create", "Login@connexionNewAcc");


$router->run();


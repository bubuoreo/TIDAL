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

$router->newRouteGet("/", "Page@displayhome");
$router->newRouteGet("/login", "Login@display");
$router->newRouteGet("/policy", "Page@displayPolicy");
$router->newRouteGet("/create", "Login@displayNewAcc");
$router->newRouteGet("/source", "Page@displaySources");



$router->newRouteGet("/sympthome/:key", "Pathos@searchByKeyword");
$router->newRouteGet("/meridien/:code", "Pathos@getMeridienByCode");

 /**
  * POST
  */
$router->newRoutePost("/login", "Login@connexion");
$router->newRoutePost("/create", "Login@connexionNewAcc");



$router->run();


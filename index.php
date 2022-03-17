<?php

require_once("controller/Route/router.php");
require_once("controller/login.php");
require_once("controller/pathos.php");
require_once("controller/page.php");

/**
 * Creation/chargement d'une session 
 */

session_start();

/**
 * instentiation d'un routeur
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
$router->newRouteGet("/logout", "Login@logout");
$router->newRouteGet("/userList", "Login@userList");


$router->newRouteGet("/listeSympthome", "Pathos@searchAll");

/**
 * POST
 */
$router->newRoutePost("/login", "Login@connexionLogin");
$router->newRoutePost("/create", "Login@connexionNewAcc");
$router->newRoutePost("/modificationMotDePasse", "Login@modificationMdp");

$router->newRoutePost("/search", "Pathos@searchByKeyword");

$router->run();


<?php

// Tentative utilisation smarty mais code d'erreur 
//  Fatal error: Uncaught --> Smarty: unable to create directory /var/www/html/View/templates_c <-- thrown in /var/www/html/smarty-master/smarty-master/libs/sysplugins/smarty_internal_runtime_writefile.php on line 51
// $pathologies = [
//     'patho A',
//     'patho B',
//     'patho C'
// ];
// require_once('smarty-master/smarty-master/libs/Smarty.class.php');
// $smarty = new Smarty;
// $smarty->caching = true;
// $smarty->cache_lifetime = 120;
// $smarty->setTemplateDir("View/templates");
// $smarty->setCompileDir("View/templates_c");

// $smarty->assign('pathos', $pathologies);
// $smarty->display("View/vue.tpl");  




// require("./View/templates/TemplateLogin.php");

use Controller\Route\Router;
require("controller/Route/router.php");


require_once("controller/login.php");
require_once("controller/pathos.php");

$router = new Router($_GET["url"]);

$router->get("/posts/:id", "Controller\Login@test");
$router->get("/", "Controller\Login@displayhome");
$router->get("/login", "Controller\Login@display");
$router->post("/login", "Controller\Login@connexion");
$router->get("/policy", "Controller\Login@policy");
$router->post("/", "Controller\Login@connexion");


$router->get("/all/:table", "Controller\Pathos@getAll");
$router->get("/sympthome/:key", "Controller\Pathos@searchByKeyword");
$router->get("/element", "Controller\Pathos@getElementTable");
$router->get("/pathos", "Controller\Pathos@getAllPathos");
$router->get("/patho/:id", "Controller\Pathos@getPathoById");
$router->get("/meridien/:code", "Controller\Pathos@getMeridienByCode");


$router->run();


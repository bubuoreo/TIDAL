<?php

include_once "./controller/controller.php";


/**
 * Classe d'affichage de page sans besoin d'utilisation de dynamisme
 * Cette classe doit pouvoir afficher les pages index.html et policy.html
 */
class Page extends Controller
{
    function displaySources{
        $this->renderTpl("../view/template/sources.tpl");
    }
}

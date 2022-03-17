<?php

include_once "./controller/controller.php";


/**
 * Classe d'affichage de page sans besoin d'utilisation de dynamisme
 * Cette classe doit pouvoir afficher les pages index.html et policy.html
 */
class Page extends Controller
{
    
    function displayHome()
    {
        $this->startSession();
        
        $connecter = $this->islogged();
        $this->renderTpl("view/template/index.tpl", ["isconnect" => $connecter]);
    }


    function displaySources()
    {
        $connecter = $this->islogged();
        $this->renderTpl("view/template/sources.tpl", ["isconnect" => $connecter]);
    }
    function displayPolicy()
    {
        $connecter = $this->islogged();
        $this->renderTpl("view/template/policy.tpl", ["isconnect" => $connecter]);
    }
}

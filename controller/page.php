<?php

include_once "./controller/controller.php";


/**
 * Classe d'affichage de page sans besoin d'utilisation de dynamisme
 * Cette classe doit pouvoir afficher les pages index.html et policy.html
 */
class Page extends Controller
{
    
    /**
     * affichage de la page principale
     */
    function displayHome()
    {
        $this->startSession();
        
        $connecter = $this->islogged();
        $this->renderTpl("view/template/index.tpl", ["isconnect" => $connecter]);
    }

    /**
     * affichage de la page des sources
     */
    function displaySources()
    {
        $connecter = $this->islogged();
        $this->renderTpl("view/template/sources.tpl", ["isconnect" => $connecter]);
    }

    /**
     * affichage de la page de la policy
     */
    function displayPolicy()
    {
        $connecter = $this->islogged();
        $this->renderTpl("view/template/policy.tpl", ["isconnect" => $connecter]);
    }
}

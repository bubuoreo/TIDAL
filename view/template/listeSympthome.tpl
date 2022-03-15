<!DOCTYPE html>
<html lang="fr">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" href="../view/css/listeSympthome.css">
    <title>BEMS - Association d'acupuncteurs</title>
</head>



<body>
    {include file="./header.tpl"}
    
    <div class="recherche">
        <form class="form login" id="sb_form" method="POST" action="/search" autocomplete="off">
            <!-- Si l'utilisateur n'est pas connecté, un appuie sur le bouton 'Rchercher' redirige vers la page de connexion -->
            <!-- Ou alors on fait disparaître ce champ pour les utilisateurs non connectés -->
            <label for="sb_text">Recherche par mot clé : </label>
            <input type="text" class="input_text" id="recherche" name="recherche" placeholder="recherche">
            <button type="submit" class="submit">Valider</button>
        </form>
    </div>

    <div class="black-space">
        <p>black-space</p>
    </div>

    <select id="selectPatho" name="patho">
        <option value="all" selected>Selectionner le type de pathologie</option>
         {foreach from=$Categorie key=Nom item=catPatho }
            <option value = {$catPatho.abrev} class = {$catPatho.abrev}>{$Nom} </option>
        {/foreach}
        {* <option value="">premier choix</option>
        <option value="">deuxieme choix</option>
        <option value="">troisième choix</option>
        <option value="">quatrième choix</option>
        <option value="">cinquième choix</option> *}
    </select>

    <select id="selectMeridien" name="Meridien" size="max">
        <option value="all" selected>Selectionner le méridien</option>
        {foreach from=$listeMeridien item=meridien }
        <p>{$meridien}</p>
            <option value = {$meridien.code} class = {$meridien.nom|replace:' ' : '_'}>{$meridien.nom} </option>
        {/foreach}
        {* <option value="Meridiens">Méridiens</option>
        <option value="Tsang/Fu">Tsang/Fu</option>
        <option value="Jing Jin">Jing Jin</option>
        <option value="Voie Luo" disabled>Voie Luo</option>
        <option value="Merveilleux Vaisseaux">Merveilleux Vaisseaux</option> *}
    </select>

    <select id='selectCaract' name="caract">
        <option value="all" selected>Selectionner la/les caractéristique(s)</option>
        <optgroup class ="all" label="Toutes les caractéristiques" style="display: block;">
            <option value="c" style="display: block;">Chaud</option>
            <option value="f" style="display: block;">Froid</option>
            <option value="p" style="display: block;">Plein</option>
            <option value="v" style="display: block;">Vide</option>
            <option value="2p" style="display: block;">Grand plein</option>
            <option value="2v" style="display: block;">Grand vide</option>
            <option value="e" style="display: block;">Externe</option>
            <option value="i" style="display: block;">Interne</option>
            <option value="pc" style="display: block;">Plein et chaud</option>
            <option value="pci" style="display: block;">Inférieur plein et chaud</option>
            <option value="pcm" style="display: block;">Moyen plein et chaud</option>
            <option value="pcs" style="display: block;">Supérieur plein et chaud</option>
            <option value="v+" style="display: block;">Yang vide</option>
            <option value="v-" style="display: block;">Yin vide</option>
            <option value="vf" style="display: block;">Vide et froid</option>
            <option value="vfi" style="display: block;">Inférieur vide et froid</option>
            <option value="vfm" style="display: block;">Moyen vide et froid</option>
            <option value="vfs" style="display: block;">Supérieur vide et froid</option>
            <option value="va" style="display: block;">Antérieur</option>
            <option value="vi" style="display: block;">Inférieur </option>
            <option value="vp" style="display: block;">Postérieur </option>
        </optgroup>
        <optgroup class = "meridien" label="Meridiens" style="display: block;">
            <option value="me" style="display: block;">Externe</option>
            <option value="mi" style="display: block;">Interne</option>
        </optgroup>
        <optgroup class = "tsangFu" label="Tsang/Fu" style="display: block;">
            <option value="tfc" style="display: block;">Chaud</option>
            <option value="tff" style="display: block;">Froid</option>
            <option value="tfp" style="display: block;">Plein</option>
            <option value="tfv" style="display: block;">Vide</option>
            <option value="tfpc" style="display: block;">Plein et chaud</option>
            <option value="tfpci" style="display: block;">Inférieur plein et chaud</option>
            <option value="tfpcm" style="display: block;">Moyen plein et chaud</option>
            <option value="tfpcs" style="display: block;">Supérieur plein et chaud</option>
            <option value="tfv+" style="display: block;">Yang vide</option>
            <option value="tfv-" style="display: block;">Yin vide</option>
            <option value="tfvf" style="display: block;">Vide et froid</option>
            <option value="tfvfi" style="display: block;">Inférieur vide et froid</option>
            <option value="tfvfm" style="display: block;">Moyen vide et froid</option>
            <option value="tfvfs" style="display: block;">Supérieur vide et froid</option>
        </optgroup>
        <optgroup class = "jingJin" label="Jing Jin" style="display: block;">
            <option value="Jing Jin:None" style="display: block;">Aucunes caractéristiques</option>
        </optgroup>
        <optgroup class = "voieLuo" label="Voie Luo" style="display: block;">
            <option value="lp" style="display: block;">Plein</option>
            <option value="lv" style="display: block;">Vide</option>
            <option value="l2p" style="display: block;">Grand plein</option>
            <option value="l2v" style="display: block;">Grand vide</option>
        </optgroup>
        <optgroup class = "merveilleuxVessaux" label="Merveilleux Vaisseaux" style="display: block;">
            <option value="mva" style="display: block;">Antérieur</option>
            <option value="mvp" style="display: block;">Postérieur</option>
            <option value="mvi" style="display: block;">Inférieur</option>
        </optgroup>
    </select>
    <!-- lien vers un site qui explique comment faire un filtrage propre : https://www.jqueryscript.net/table/filter-each-column.html -->            
 
   <div id="listePathos">
    {foreach from=$Categorie key=Nom item=Categoriepatho  }
    <div class = {$Categoriepatho.abrev}>
        
        <h2 class = {$Categoriepatho.abrev}>{$Nom} </h2>
        <br>
        {counter start=0 assign=compteur}
            {foreach from=$datas[$Nom] key=NomMeridien item=patho}
                <h3 class = "{$Categoriepatho.abrev} {$patho[$compteur].mer}" name="visible" >Meridien associé: {$NomMeridien} </h3>
                <ul class = "{$Categoriepatho.abrev} {$patho[$compteur].mer}">
                    {foreach from=$patho  item=value name=bouclesympt}
                        <li class = "{$Categoriepatho.abrev} {$value.mer} {$value.type}"> {$value.descriptionsympt}</li>
                        {counter}
                    {/foreach}  
                    <li class="{$Categoriepatho.abrev} {$patho[$compteur - 1].mer} VoirPlus"><button class = "Plus">...</button></li>
                </ul>     
            {/foreach}
    </div>
    {/foreach}
    <p class="rechercheNull" style = "display: none;">Aucun élément ne correspond à votre recherche </p>
    </div>
    <div class="white-space">
        <p>
            white-space
        </p>
    </div>

    {include file="./footer.tpl"}
</body>

{* Attention probleme sur l'assignation des classes pour merveilleux Vaisseaux *}
<script src="../view/js/jquery.min.js"></script>
<script src="../view/js/listeSympthome.js"></script>

</html>
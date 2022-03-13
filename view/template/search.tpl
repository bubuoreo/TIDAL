<!DOCTYPE html>
<html lang="fr">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" href="../view/css/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="../view/css/search.css">
    {* <script src="/ui/js/bootstrap.min.js"></script> --> *}
    {* <script src="https://kit.fontawesome.com/197d1cb87f.js"></script> *}
    {* <script src="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.js"></script> *}
    <title>BEMS - Association d'acupuncteurs</title>
</head>



<body>
    <header>
        <a href="/">
            <img class="logo" src="../view/images/logo.png" alt="BEMS">
        </a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
            </ul>
        </nav>
        <a class="cta btn" href="/">
            <img src="../view/images/connexion.png" alt="Connexion" width="30" height="30">
        </a>
    </header>
    
    <div class="recherche">
        <form class="form login" id="sb_form" method="POST" action="/sympthomes/" autocomplete="off">
            <!-- Si l'utilisateur n'est pas connecté, un appuie sur le bouton 'Rchercher' redirige vers la page de connexion -->
            <!-- Ou alors on fait disparaître ce champ pour les utilisateurs non connectés -->
            <label for="sb_text">Recherche par mot clé : </label>
            <input type="text" class="input_text" id="sb_text" name="sb_text">
            <button type="submit" class="submit">Valider</button>
        </form>
    </div>

    <div class="black-space">
        <p>black-space</p>
    </div>

    <select name="Meridien" size="max">
        <option value="None" selected>Selectionner le méridien</option>
        <option value="Meridiens">Méridiens</option>
        <option value="Tsang/Fu">Tsang/Fu</option>
        <option value="Jing Jin">Jing Jin</option>
        <option value="Voie Luo" disabled>Voie Luo</option>
        <option value="Merveilleux Vaisseaux">Merveilleux Vaisseaux</option>
    </select>

    <select name="patho">
        <option value="None" selected>Selectionner le type de pathologie</option>
        <option value="">premier choix</option>
        <option value="">deuxieme choix</option>
        <option value="">troisième choix</option>
        <option value="">quatrième choix</option>
        <option value="">cinquième choix</option>
    </select>

    <select name="caract">
        <option value="None" selected>Selectionner la/les caractéristique(s)</option>
        <optgroup label="Toutes les caractéristiques" style="display: block;">
            <option value="Chaud" style="display: block;">Chaud</option>
            <option value="Froid" style="display: block;">Froid</option>
            <option value="Plein" style="display: block;">Plein</option>
            <option value="Vide" style="display: block;">Vide</option>
            <option value="Grand plein" style="display: block;">Grand plein</option>
            <option value="Grand vide" style="display: block;">Grand vide</option>
            <option value="Externe" style="display: block;">Externe</option>
            <option value="Interne" style="display: block;">Interne</option>
            <option value="Plein et chaud" style="display: block;">Plein et chaud</option>
            <option value="Inferieur plein et chaud" style="display: block;">Inférieur plein et chaud</option>
            <option value="Moyen plein et chaud" style="display: block;">Moyen plein et chaud</option>
            <option value="Superieur plein et chaud" style="display: block;">Supérieur plein et chaud</option>
            <option value="Yang vide" style="display: block;">Yang vide</option>
            <option value="Yin vide" style="display: block;">Yin vide</option>
            <option value="Vide et froid" style="display: block;">Vide et froid</option>
            <option value="Inferieur vide et froid" style="display: block;">Inférieur vide et froid</option>
            <option value="Moyen vide et froid" style="display: block;">Moyen vide et froid</option>
            <option value="Superieur vide et froid" style="display: block;">Supérieur vide et froid</option>
        </optgroup>
        <optgroup label="Meridiens" style="display: block;">
            <option value="Meridien:Externe" style="display: block;">Externe</option>
            <option value="Meridien:Interne" style="display: block;">Interne</option>
        </optgroup>
        <optgroup label="Tsang/Fu" style="display: block;">
            <option value="Tsang/Fu:Chaud" style="display: block;">Chaud</option>
            <option value="Tsang/Fu:Froid" style="display: block;">Froid</option>
            <option value="Tsang/Fu:Plein" style="display: block;">Plein</option>
            <option value="Tsang/Fu:Vide" style="display: block;">Vide</option>
            <option value="Tsang/Fu:Plein et chaud" style="display: block;">Plein et chaud</option>
            <option value="Tsang/Fu:Inferieur plein et chaud" style="display: block;">Inférieur plein et chaud</option>
            <option value="Tsang/Fu:Moyen plein et chaud" style="display: block;">Moyen plein et chaud</option>
            <option value="Tsang/Fu:Superieur plein et chaud" style="display: block;">Supérieur plein et chaud</option>
            <option value="Tsang/Fu:Yang vide" style="display: block;">Yang vide</option>
            <option value="Tsang/Fu:Yin vide" style="display: block;">Yin vide</option>
            <option value="Tsang/Fu:Vide et froid" style="display: block;">Vide et froid</option>
            <option value="Tsang/Fu:Inferieur vide et froid" style="display: block;">Inférieur vide et froid</option>
            <option value="Tsang/Fu:Moyen vide et froid" style="display: block;">Moyen vide et froid</option>
            <option value="Tsang/Fu:Superieur vide et froid" style="display: block;">Supérieur vide et froid</option>
        </optgroup>
        <optgroup label="Jing Jin" style="display: block;">
            <option value="Jing Jin:None" style="display: block;">Aucunes caractéristiques</option>
        </optgroup>
        <optgroup label="Voie Luo" style="display: block;">
            <option value="Voie Luo:Plein" style="display: block;">Plein</option>
            <option value="Voie Luo:Vide" style="display: block;">Vide</option>
            <option value="Voie Luo:Grand plein" style="display: block;">Grand plein</option>
            <option value="Voie Luo:Grand vide" style="display: block;">Grand vide</option>
        </optgroup>
        <optgroup label="Merveilleux Vaisseaux" style="display: block;">
            <option value="Merveilleux Vaisseaux:Anterieur" style="display: block;">Antérieur</option>
            <option value="Merveilleux Vaisseaux:Posterieur" style="display: block;">Postérieur</option>
            <option value="Merveilleux Vaisseaux:Inferieur" style="display: block;">Inférieur</option>
        </optgroup>
    </select>
    <!-- lien vers un site qui explique comment faire un filtrage propre : https://www.jqueryscript.net/table/filter-each-column.html -->            
 
    {*
    <div>
        <H2>Catégories de pathologies correspondant à vos critères <br> <br></H2>

        <h3>méridien du poumon interne</h3>
        <ul>
            <li class="sympt">Sympt1</li>
            <li class="sympt">Sympt2</li>
            <li class="sympt">Sympt3</li>
            <li class="sympt">Sympt4</li>
            <!-- Liste déroulante si l'utilisateur veut -->
            <li class="sympt"><a href="" class="souligne">Voir plus ... <br><br></a></li>
            <!-- faire apparaître un 'voir moins une fois cliqué sur le lien ci-dessus' -->
        </ul>
        <h3>méridien du poumon externe</h3>
        <ul>
            <li class="sympt">Sympt1</li>
            <li class="sympt">Sympt2</li>
            <li class="sympt">Sympt3</li>
            <li class="sympt">Sympt4</li>
            <!-- Liste déroulante si l'utilisateur veut -->
            <li class="sympt"><a href="" class="souligne">Voir plus ... <br><br></a></li>
            <!-- faire apparaître un 'voir moins une fois cliqué sur le lien ci-dessus' -->
        </ul>
        <h3>méridien du gros intestin</h3>
        <ul>
            <li class="sympt">Sympt1</li>
            <li class="sympt">Sympt2</li>
            <li class="sympt">Sympt3</li>
            <li class="sympt">Sympt4</li>
            <!-- Liste déroulante si l'utilisateur veut -->
            <li class="sympt"><a href="" class="souligne">Voir plus ... <br><br></a></li>
            <!-- fairea apparaître un 'voir moins une fois cliqué sur le lien ci-dessus' -->
        </ul>
    *}

    {foreach from=$Categorie key=Nom item=reg }
        <h2 class = {$Nom|replace:' ' : '_'}>{$Nom} </h2>
        <br>
            {foreach from=$datas.meridien key=NomMeridien item=patho}
            <h3 class = "{$Nom|replace:' ' : '_'}" >Meridien associé: {$NomMeridien} </h3>
            <ul class = "{$Nom|replace:' ' : '_'}">
                {foreach from=$patho  item=value}
                    <li> {$value.descriptionsympt}</li>
                {/foreach}  
            </ul>     
            {/foreach}
       
    {/foreach}

    <div class="white-space">
        <p>
            white-space
        </p>
    </div>

    <footer>
        <a href="/">
            <img class="logo" src="../view/images/logo.png" alt="BEMS">
        </a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
                <li><a href="/policy">Privacy policy</a></li>
            </ul>
        </nav>
        <a class="cta btn" href="/">
            <img src="../view/images/connexion.png" alt="Connexion" width="30" height="30">
        </a>
    </footer>
</body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

{literal}
  <script type="text/javascript">
     $(document).ready(function() {
        
        var tabHeader = document.querySelectorAll("h2");
        console.log(tabHeader);
        
        tabHeader.forEach(function(element){
            let name = element.className;
            $("ul.".name).each(function(){
                  $(this).children().hide()
                  $(this).children().slice(0,3).show()
            })) 
            
            
            
        });

            //$("ul.Pathologies_de_meridien ").each(function(){
            //      $(this).children().hide()
            //      $(this).children().slice(0,3).show()
            //})
              

        });
</script>
{/literal}



</html>
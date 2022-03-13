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
                <h3 class = "{$Categoriepatho.abrev} {$patho[$compteur].mer}" >Meridien associé: {$NomMeridien} </h3>
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
    </div>
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

{* Attention probleme sur l'assignation des classes pour merveilleux Vaisseaux *}
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

{literal}
  <script type="text/javascript">

    function hideLi($elementul)
    {
        $elementul.children().hide();
        $elementul.children().slice(0,3).show();       
        $elementul.children("li").last().show()
    }
    $(document).ready(function(){
        var tabHeader = document.querySelectorAll("h2");
        
        tabHeader.forEach(function(element){
            let name = element.className;
            let $uls = $("ul."+name);
            $uls.each(function(){
                hideLi($(this))
            })
           
            }) 
 
    });
    
    $("#listePathos button").click(function () { 
        let $but = $(this);
        if ($but.attr("class") == "Plus")
        { 
            $but.attr("class", 'Moins');
            $but.parent().siblings("li").show();
        }
        else if ($but.attr("class") == "Moins")
        {
            $but.attr("class", 'Plus');
            hideLi($($but.parent().parent("ul")));

        }
            
    })

    function hideShowElement($element, filtre, indice)
    {
        if( filtre == "all")
        {
            $element.show()
        }
        else if($element.attr("class").split(" ")[indice] != filtre )
        {
            $element.hide()
        }
        else
        {
            $element.show()
        } 
    } 


    function gestionPathos(select, filtre)
    {
        switch(select)
        {   
            case "#selectPatho":
                var $listeCategorie =$($("#listePathos").children())
                $listeCategorie.each(function(index, element) { hideShowElement($(element), filtre, 0) })

            break;
            case '#selectMeridien':
                var listeCategorieVisible = $($("#listePathos").children(":visible"));
                listeCategorieVisible.children("h3").each(function(index, element) { hideShowElement($(element), filtre, 1) });
                listeCategorieVisible.children("ul").each(function(index, element) { hideShowElement($(element), filtre, 1) });
                
            break;
        
            case "#selectCaract":
                var listeCategorieVisible = $($("#listePathos").children(":visible"));
                var listeMerVisible = $(listeCategorieVisible.children("ul:visible"));
                listeMerVisible.children().each(function(index, element){hideShowElement($(element), filtre, 2)})
              
            break;
        }
    }
    // application des filtres sur la page
    $("#selectPatho").change(function(){
        var select = $("#selectPatho option:selected").attr("value");

        $('#selectCaract').find('optgroup').each(function(index,element){
            if($(element).attr("class") != select )
            {
                $(element).hide()
            }
            else
            {
                $(element).show()
            } 
        });

        gestionPathos('#selectPatho', select);
       
    })

    $("#selectMeridien").change(function(){
        var select = $("#selectMeridien option:selected").attr("value");
        gestionPathos("#selectMeridien", select)   
    })

     $("#selectCaract").change(function(){
        var select = $("#selectCaract option:selected").attr("value");
        gestionPathos("#selectCaract", select)
        
       
    })

</script>
{/literal}



</html>
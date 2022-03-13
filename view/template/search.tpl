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
        <a href="/"><img class="logo" src="../view/images/logo.png" alt="BEMS"></a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
                <!-- <li><a href="./login.html">Connexion</a></li> -->
            </ul>
        </nav>
        <a class="cta btn" href="/login"><img src="../view/images/connexion.png" alt="Connexion" width="30" height="30"></a>
    </header>
    
    
    <div>
        <form class="form login" id="sb_form" method="POST" action="/sympthomes/" autocomplete="off">
            <label for="sb_text">Votre requete:</label>
            <input type="text" class="input_text" id="sb_text" name="sb_text">
            <button type="submit" class="submit">Valider</button>
        </form>
    </div>

    {* <div>
        <table class="styled-table">
            <thead>
              <tr>
                  <!-- lien vers un site qui explique comment faire un filtrage propre : https://www.jqueryscript.net/table/filter-each-column.html -->
                <th><input type="text" placeholder="Catégorie de pathologie" disabled></th>
                <th><input type="text" placeholder="Caractéristiques possibles" disabled></th>
              </tr>
            </thead>
            <tbody> *}

            
 
  {* <div>
                    <H2>Pathologies de méridien </H2>
                    <h3>méridien du poumon interne</h3>
                    <ul>
                        <li class="sympt">Sympt1</li>
                        <li class="sympt">Sympt2</li>
                        <li class="sympt">Sympt3</li>
                        <li class="sympt">Sympt4</li>
                        <!-- Liste déroulante si l'utilisateur veut -->
                        <li class="sympt"><a href="">Voir plus ...</a></li>
                    </ul>
                    <h3>méridien du poumon externe</h3>
                    <ul>
                        <li class="sympt">Sympt1</li>
                        <li class="sympt">Sympt2</li>
                        <li class="sympt">Sympt3</li>
                        <li class="sympt">Sympt4</li>
                        <!-- Liste déroulante si l'utilisateur veut -->
                        <li class="sympt"><a href="">Voir plus ...</a></li>
                    </ul>
                    <h3>méridien du gros intestin</h3>
                    <ul>
                        <li class="sympt">Sympt1</li>
                        <li class="sympt">Sympt2</li>
                        <li class="sympt">Sympt3</li>
                        <li class="sympt">Sympt4</li>
                        <!-- Liste déroulante si l'utilisateur veut -->
                        <li class="sympt"><a href="">Voir plus ...</a></li>
                    </ul>

    </div>   *}
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

    <footer>
        <a href="/"><img class="logo" src="../view/images/logo.png" alt="BEMS"></a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
                <li><a href="/policy">Privacy policy</a></li>
            </ul>
        </nav>
        <a class="cta btn" href="/"><img src="../view/images/connexion.png" alt="Connexion" width="30" height="30"></a>
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
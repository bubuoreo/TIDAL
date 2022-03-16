<!DOCTYPE html>
<html lang="fr">
<head>
    <link rel="stylesheet" href="../view/css/listSympthome.css">
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

    <div class="black-space"></div>

{if $elementFind}
        <table>
            <thead>
                <tr>
                        <th> <h2>Liste des sympthomes associers à {$keyword} </h2></th>
                </tr>
                <tr>
                    <th> <h3>Symphtomes </h3></th>
                    <th> <h3>Pathologie associée </h3></th>
                    <th> <h3>Meridien associé </h3></th>
                
                </tr>
            </thead>

            <tbody>
                {foreach from=$datas key=nomMeridien item=meridien}
                <tr>
                    {foreach from=$meridien item=description }
                    <th>
                        <ul>
                            {foreach from=$description item=valeur }
                                <li>  {$valeur}</li>
                            {/foreach}
                        </ul>
                    </th>
                    {/foreach}
                    <th>
                        {$nomMeridien}
                    </th>
                </tr>
                {/foreach}
            </tbody>
            
        </table>
    {else}
            <div> 
                <h2> Aucune valeure ne correspond à votre recherche </h2>
            </div>
    {/if}
    
   {include file="./footer.tpl"}
</body>

{* Attention probleme sur l'assignation des classes pour merveilleux Vaisseaux *}
<script src="../view/js/jquery.min.js"></script>

</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    
    <!-- <meta http-equiv="refresh" content="2;url=login.html"> -->
    <title>BEMS - Association d'acupuncteurs - Page de connexion</title>
</head>
<body>
    {include file="./header.tpl"}
{if $connect == false}
    <div class="general">
        <form class="form login" id="login_form" method="POST" action="/login" autocomplete="off">

            <div class="user_block">
                <label for="input_user">Utilisateur:</label>
                <input type="text" class="login_text" id="input_user" name="input_user">
            </div>

            <div class="password_block">
                <label for="input_password">Mot de passe:</label>
                <input type="password" class="password_text" id="input_password" name="input_password">
            </div>

            <div class="button_block">
                <input type="submit" class="submit">
            </div>

        </form>
        <button id="BtnModal">Mot de passe oublié</button>

        
        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
            </div>
            <div>
                <form class="form mdpforgot" id="modiMdp_form" method="POST" action="/modificationMotDePass" autocomplete="off">

                    <div class="user_block">
                        <label for="input_user_modif">Nom d'utilisateur:</label>
                        <input type="text" class="login_text" id="input_user_modif" name="input_user_modif">
                    </div>

                    <div class="password_block">
                        <label for="input_password_modif">Nouveau mot de passe:</label>
                        <input type="password" class="password_text" id="input_password_modif" name="input_password_modif">
                    </div>

                    <div class="password_block">
                        <label for="input_password_confirme">confirmer le mot de passe:</label>
                        <input type="password" class="password_text" id="input_password_confirm" name="input_password_confirme">
                    </div>

                    <div class="button_block">
                        <input  id="modifier_mdp" type="submit" class="submit">
                    </div>

                </form>
            </div>

        </div>
        
        <div>
                <a class="souligne centré" id="création_compte" href="/create">
                    Créer votre compte
                </a>
        </div>
        {if $password_modifier}
            <div> 
             <p> Votre mot de passe à bien été modifié</p>   
            </div>
        {/if}
    </div>
{else}
    <div class="general">
        <h2> Bonjour {$user}</h2>
        <p> Vous etes déjà connecté(e)</p>
    </div>
{/if}


    {include file="./footer.tpl"}

    <link rel="stylesheet" href="../view/css/login.css">

{literal}
    
<style>
        /* The Modal (background) */
    .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    }

    /* The Close Button */
    .close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    }

    .close:hover,
    .close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
    }
</style>

<script>
    $(document).ready(function(){
        $("#myModal").hide()
         $("#modifier_mdp").prop("disabled",true);
    })

    $("#BtnModal").click(function(){
        $("#myModal").css("display","block" )
    })
    $(".close").click(function(){
        $("#myModal").hide()
    })

    $("#input_password_confirm").change(function(){
        var confirme_pass = $(this).val()
        var new_pass = $("#input_password_modif").val()
        if(confirme_pass == new_pass)
        {
            $("#modifier_mdp").prop("disabled",false);
        }
    })
</script>
{/literal}
</body>

</html>
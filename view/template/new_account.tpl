<!DOCTYPE html>
<html lang="fr">
<head>
    {* <link rel="stylesheet" href="../view/css/header.css"> *}
    {* <link rel="stylesheet" href="../view/css/footer.css"> *}
    <link rel="stylesheet" href="../view/css/login.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta http-equiv="refresh" content="2;url=login.html"> -->
    <title>BEMS - Association d'acupuncteurs - Création de compte</title>
</head>
<body>
    {include file="./header.tpl"}

    <div class="general">
        <form class="form login" id="login_form" method="POST" action="/create" autocomplete="off">
            {if $already_exists}
                <div class="error_block">
                    <p class="error_message">This account already exists</p>
                </div>
            {/if}

            <div class="user_block">
                <label for="input_user">Utilisateur:</label>
                <input type="text" class="login_text" id="input_user" name="input_user">
            </div>

            <div class="password_block">
                <label for="input_password">Mot de passe:</label>
                <input type="text" class="login_text" id="input_password" name="input_password">
            </div>

            <div class="email_block">
                <label for="input_email">Email:</label>
                <input type="text" class="login_text" id="input_email" name="input_email">
            </div>

            <div class="button_block">
                <input type="submit" class="submit" value="S'inscrire">
            </div>
        </form>
    </div>
<<<<<<< HEAD
    
    {include file="./footer.tpl"}
=======
    <footer>
        <a href="../../view/html/index.html">
            <img class="logo" src="../../view/images/logo.png" alt="BEMS">
        </a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
                <li><a href="/policy">Privacy policy</a></li>
            </ul>
        </nav>
        <a class="cta btn" href="/login">
            <img src="../../view/images/connexion.png" alt="Connexion" width="30" height="30">
        </a>
    </footer>
>>>>>>> main
</body>
</html>
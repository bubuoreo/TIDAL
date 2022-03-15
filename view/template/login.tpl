<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta http-equiv="refresh" content="2;url=login.html"> -->
    <link rel="stylesheet" href="../view/css/login.css">
    <title>Login page</title>
</head>
<body>
    <header>
        <a href="/"><img class="logo" src="../../view/images/logo.png" alt="Le logo du BEMS"></a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
            </ul>
        </nav>
        <a class="cta btn"  href="/listeSympthome"><img src="../../view/images/picto_loupe.png" alt="Recherche" width="30" height="30"></a>
        <a class="cta btn"  href="/login"><img src="../../view/images/connexion.png" alt="Connexion" width="30" height="30"></a>
    </header>

    <div class="general">
        <form class="form login" id="login_form" method="POST" action="../../controller/login.php" autocomplete="off">

            <div class="user_block">
                <label for="input_user">Utilisateur:</label>
                <input type="text" class="login_text" id="input_user" name="input_user">
            </div>

            <div class="password_block">
                <label for="input_password">Mot de passe:</label>
                <input type="text" class="password_text" id="input_password" name="input_password">
            </div>

            <div class="button_block">
                <input type="submit" class="submit">
            </div>

            <div>
                <a class="souligne centré" id="création_compte" href="register.html">
                    Créer votre compte
                </a>
            </div>

        </form>
    </div>

    <footer>
        <a href="../../view/html/index.html">
            <img class="logo" src="../../view/images/logo.png" alt="BEMS">
        </a>
        <nav>
            <ul class="nav_links">
                <li><a href="../../view/html/sources.html">Sources</a></li>
                <li><a href="../../view/html/policy.html">Privacy policy</a></li>
            </ul>
        </nav>
        <a class="cta btn" href="../../view/html/login.html">
            <img src="../../view/images/connexion.png" alt="Connexion" width="30" height="30">
        </a>
    </footer>
</body>
    
</body>
</html>
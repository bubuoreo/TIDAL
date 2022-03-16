<head>
    <link rel="stylesheet" href="../view/css/header.css">
</head>
<header>
    <a href="/">
        <img class="logo" src="../../view/images/logo.png" alt="Le logo du BEMS">
    </a>
    <a class="btn decale" href="/listeSympthome"><img src="../../view/images/picto_loupe.png" alt="Recherche" width="30" height="30"></a>
    {if $isconnect}
        <a class="btn" href="/logout"><img src="../../view/images/deconnexion.png" alt="deconnexion" width="30" height="30"></a>
    {else}
        <a class="btn" href="/login"><img src="../../view/images/connexion.png" alt="Connexion" width="30" height="30"></a>
    {/if}
</header>
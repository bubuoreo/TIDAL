<!DOCTYPE html>
<html lang="fr">
<head>
    <link rel="stylesheet" href="../view/css/index.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BEMS - Association d'acupuncteurs</title>
</head>
<body>
    {include file="./header.tpl"}

    <div class="contenant">
        <img class="photo_accueil" src="../../view/images/acu_secu.jpg" alt="Image de fond du site de BEMS montrant une scéance d'acupuncture sur le dos" height="80%" width="100%">
        <div class="texte_centrer">BEMS<br>Brigade Erudite de Médecine et de Santé</div>
    </div>
    <section>
        <h2 class="centré">Accueil</h2>

        <p class="centré">
            Bonjour, nous vous souhaitons la bienvenue sur notre site collaboratif des acupuncteurs de la médecine chinoise.<br><br>
            Dans un monde où la planète Terre se meurt, où l'impact humanitaire de la civilisation exploite les
            ressources de ce monde dans un consumérisme effeiné. En étant conscient de ces problèmes existantiels,
            nous proposons une approche nouvelle de la médecine de l'esprit, de la médecine des chakras.
            En utilisant tous notre savoir en le corps et les méridiens, nous guérissons les maux de quelque type
            que ce soit.<br>

            Notre vision du renouveau de la médecine est un élément essentiel dans la pratique de la médecine
            traditionnelle chinoise <br>
        </p>
    </section>

    <section>
        <h2 class="centré">Présentation</h2>

        <p class="centré">
            Face au monopole des multinationales qui brident nos libertés et nous assujettissent à un système de santé
            complètement corrompu, frauduleux, nous, membre su BEMS nous postons en défenseur des droits primordiaux
            de tous les concitoyens. C'est dans ce mouvement que nous nous inscrivons. Un mouvement dans lequel le corps
            et l'esprit trouvent réconfort dans une science qui a fait ses preuves, qui nous ouvre les chakras et fait 
            respirer notre âme.

            Nous luttons jours après jour pour une médecine dirigée vers les Hommes avec un grand H. Une médecine aussi
            plus juste, égalitaire face aux aléas du quotidien. En prenant rendez-vous avec nous par téléphone, nous 
            pourrons vous guider au mieux dans vos soins pour que la vie vous soit agréable car elle constitue un véritable 
            cadeau venu des cieux.
            Nous vous attendons donc nombreux, venez vous ouvrir au monde par l'intermédiaire de vos méridiens, de votre
            peau et de votre âme
        </p>
    </section>
    {if $connect == false}
        <div class="centré">
            <p>Connectez-vous pour pouvoir profiter de tous les avantages que propose notre site Web.<br></p>
        </div>
    
    <div class="centré">
        <a href="/login" class="centré">
                <button name="Connexion" id="connexion">Se connecter</button>
        </a>
    </div>
    <div class="centré">
        <a class="souligne centré" id="continuer_sans_connexion" href="/listeSympthome">
                Cliquez ici pour continuer sans vous connecter.
        </a>
    </div>
    {else}
        <div class="centré">
        <a class="souligne centré" id="continuer_sans_connexion" href="/listeSympthome">
                Cliquez ici pour continuer .
        </a>
    </div>
    {/if}

    {include file="./footer.tpl" }
</body>
</html>
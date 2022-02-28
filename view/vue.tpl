<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Pathologies</title>
</head>
<body>
    <h1>Exemple &laquo; tpl2 &raquo; : templating par un moteur de template</h1>
    <ul>
        {foreach $pathos as $patho}
            <li>{$patho}</li>
        {/foreach}
    </ul>
</body>
</html>
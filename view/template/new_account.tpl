<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta http-equiv="refresh" content="2;url=login.html"> -->
    <link rel="stylesheet" href="../view/css/new_account.css">
    <title>Login page</title>
</head>
<body>
    {include file="./header.tpl"}

    <div class="general">
        <form class="form login" id="login_form" method="POST" action="../../create" autocomplete="off">
            {if $already_exists eq 'True'}
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
                <input type="submit" class="submit">
            </div>
        </form>
    </div>
    
    {include file="./footer.tpl"}
</body>
</html>
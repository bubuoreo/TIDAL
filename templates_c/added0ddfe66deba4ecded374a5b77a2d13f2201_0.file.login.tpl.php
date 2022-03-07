<?php
/* Smarty version 4.1.0, created on 2022-03-03 09:46:50
  from '/var/www/html/view/template/login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6220807a59bc02_15613960',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'added0ddfe66deba4ecded374a5b77a2d13f2201' => 
    array (
      0 => '/var/www/html/view/template/login.tpl',
      1 => 1646297206,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6220807a59bc02_15613960 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta http-equiv="refresh" content="2;url=login.html"> -->
    <title>Login page</title>
</head>
<body>
    <div class="general">
        <form class="form login" id="login_form" method="POST" action="../../login" autocomplete="off">
            <?php if ($_smarty_tpl->tpl_vars['incorrect_login']->value == 'True') {?>
                <div class="error_block">
                    <p class="error_message">Wrong login credentials</p>
                </div>
            <?php }?>

            <div class="user_block">
                <label for="input_user">Utilisateur:</label>
                <input type="text" class="login_text" id="input_user" name="input_user">
            </div>

            <div class="password_block">
                <label for="input_password">Mot de passe:</label>
                <input type="text" class="login_text" id="input_password" name="input_password">
            </div>

            <div class="create_block">
                <a href="create">Creer ton compte</a>
            </div>

            <div class="button_block">
                <input type="submit" class="submit">
            </div>
        </form>
    </div>
    
</body>
</html><?php }
}

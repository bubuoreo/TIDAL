<?php
/* Smarty version 4.1.0, created on 2022-03-03 09:37:07
  from '/var/www/html/view/template/new_account.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_62207e3353e4d3_65304138',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0a2c9835faad7abf4389c472a93ec7ff42d0dc78' => 
    array (
      0 => '/var/www/html/view/template/new_account.tpl',
      1 => 1646296615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62207e3353e4d3_65304138 (Smarty_Internal_Template $_smarty_tpl) {
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
        <form class="form login" id="login_form" method="POST" action="../../create" autocomplete="off">
            <?php if ($_smarty_tpl->tpl_vars['already_exists']->value == 'True') {?>
                <div class="error_block">
                    <p class="error_message">This account already exists</p>
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

            <div class="email_block">
                <label for="input_email">Email:</label>
                <input type="text" class="login_text" id="input_email" name="input_email">
            </div>

            <div class="button_block">
                <input type="submit" class="submit">
            </div>
        </form>
    </div>
    
</body>
</html><?php }
}

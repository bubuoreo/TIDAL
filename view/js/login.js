
// gestion des acction sur la modale
$(document).ready(function(){
        
    $("#modifier_mdp").prop("disabled",true);
  
    if ($("#wrongUsername").lenght)
    {
        $("#myModal").show();
    } else
    {
        $("#myModal").hide();
    }
})

$("#BtnModal").click(function(){
    $("#myModal").css("display","block" );
})


$(".close").click(function(){
    $("#myModal").hide();
})


// authorisation a envoyer la modification uniquement les 2 mdp sont identiques
$("#input_password_confirm").change(function(){
    var confirme_pass = $(this).val();
    var new_pass = $("#input_password_modif").val();
    if(confirme_pass == new_pass)
    {
        $("#modifier_mdp").prop("disabled",false);
    }
})
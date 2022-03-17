console.log("Coucou")


//  fonction permettant de cacher une partie des li dans la liste li
function hideLi($elementul)
{
    $elementul.children().hide();
    $elementul.children().slice(0,3).show();       
    $elementul.children("li").last().show()
}

function gestionLi()
{
    var tabHeader = document.querySelectorAll("h2");
    tabHeader.forEach(function(element){
        let name = element.className;
        let $uls = $("ul."+name +":visible");
        $uls.each(function(){
            hideLi($(this));
        })
    })
};
// action que l'on effectue au chargement de la page pour cacher les li en trop pour ne pas surcharcher la page
$(document).ready(function(){
  
       gestionLi();
    
    $("#selectPatho option[value='all']").prop('selected', true);
    $("#selectMeridien option[value='all']").prop('selected', true);
    $("#selectCaract option[value='all']").prop('selected', true);

});

// gestion du boutton pour afficher ou non tous les li correspondant a une catégorie
$("#listePathos button").click(function () { 
    let $but = $(this);
    if ($but.attr("class") == "Plus")
    { 
        $but.attr("class", 'Moins');
        $but.parent().siblings("li").show();
    }
    else if ($but.attr("class") == "Moins")
    {
        $but.attr("class", 'Plus');
        hideLi($($but.parent().parent("ul")));

    }
        
})

// fonction gerant la visibilité de l'element qu'on lui donne en fonction du filtre donne
function hideShowElement($element, filtre, indice)
{
    if( filtre == "all")
    {
        $element.show()
        $element.parents("h2").attr('name', 'visible')
    }
    else if($element.attr("class").split(" ")[indice].indexOf(filtre) < 0 )
    {

        $element.hide()
        $element.parents("h2").attr('name', 'invisible')
    }
    else
    {
        $element.show()
        $element.parents("h2").attr('name', 'visible')
    } 
} 

// fonction de gestion des filtres 
function gestionPathos(select, filtre)
{
    switch(select)
    {   
        case "#selectPatho":
            var $listeCategorie =$($("#listePathos").children())
            $listeCategorie.each(function(index, element) { hideShowElement($(element), filtre, 0) })
            var select = $("#selectCaract option:selected").attr("value");
            gestionPathos("#selectCaract", select)

        break;
        case '#selectMeridien':
            var listeCategorieVisible = $($("#listePathos").children(":visible"));
            listeCategorieVisible.children("h3").each(function(index, element) { hideShowElement($(element), filtre, 1) });
            listeCategorieVisible.children("ul").each(function(index, element) { hideShowElement($(element), filtre, 1) });
            var select = $("#selectCaract option:selected").attr("value");
            gestionPathos("#selectCaract", select)
            
        break;
    
        case "#selectCaract":
            var listeCategorieVisible = $($("#listePathos").children(":visible"));
            var listeMerVisible = $(listeCategorieVisible.children("ul:visible"));
            listeMerVisible.children("li").each(function(index, element){hideShowElement($(element), filtre, 2)})
          
        break;

    }
    
    // gestion affichage mot d'erreur, aucune pathologie ne correspond
    var listeLiVisibles = $("#listePathos  li:visible ")
    if (listeLiVisibles.length < 1)
    {

        $("#listePathos ").children(".rechercheNull").show()
    }
    else if( $("#listePathos ").children(".rechercheNull:visible").length > 0)
    {
        
        $("#listePathos ").children(".rechercheNull:visible").hide()
    }

  
      
}


// application des filtres sur la page
$("#selectPatho").change(function(){
    var select = $("#selectPatho option:selected").attr("value");

    // action sur l'afficage des caracterirtiques en fonction de la categorie selectionnée 
    // ex : Patholigie de meridien --> caracteritique = interne ou externe
    $('#selectCaract').find('optgroup').each(function(index,element){
        if($(element).attr("class") != select )
        {
            $(element).hide()
        }
        else
        {
            $(element).show()
        } 
    });
    gestionPathos('#selectPatho', select);
   
})

$("#selectMeridien").change(function(){
    var select = $("#selectMeridien option:selected").attr("value");
    gestionPathos("#selectMeridien", select)   
})

 $("#selectCaract").change(function(){
    var select = $("#selectCaract option:selected").attr("value");
    gestionPathos("#selectCaract", select)
})



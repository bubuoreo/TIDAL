<!DOCTYPE html>
<html lang="fr">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../view/css/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="../view/css/search.css">
    <script src="../view/js/search.js"></script>
    <!-- <script src="../js/jquery.min.js"></script>
    <script src="/ui/js/bootstrap.min.js"></script> -->
    {* <script src="https://kit.fontawesome.com/197d1cb87f.js"></script> *}
    {* <script src="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.js"></script> *}
    <title>BEMS - Association d'acupuncteurs</title>
</head>



<body>
    <header>
        <a href="/"><img class="logo" src="../view/images/logo.png" alt="BEMS"></a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
                <!-- <li><a href="./login.html">Connexion</a></li> -->
            </ul>
        </nav>
        <a class="cta btn" href="/login"><img src="../view/images/connexion.png" alt="Connexion" width="30" height="30"></a>
    </header>
    
    
    <div>
        <form class="form login" id="sb_form" method="POST" action="/sympthomes/" autocomplete="off">
            <label for="sb_text">Votre requete:</label>
            <input type="text" class="input_text" id="sb_text" name="sb_text">
            <button type="submit" class="submit">Valider</button>
        </form>
    </div>

    <div>
        <table class="styled-table">
            <thead>
              <tr>
                  <!-- lien vers un site qui explique comment faire un filtrage propre : https://www.jqueryscript.net/table/filter-each-column.html -->
                <th><input type="text" placeholder="Catégorie de pathologie" disabled></th>
                <th><input type="text" placeholder="Caractéristiques possibles" disabled></th>
              </tr>
            </thead>
            <tbody><tr>
            {if $elementFind}
                {foreach from=$data item=val key=it}
                <tr>
                <td>{$val} </td> <td> {$it} </td>
                </tr>
            {/foreach}
            {else}
                <p>Erreur le mot rechercher ne correspond a aucun mot de notre base</p>
            {/if}
              
                <td>Contenu interne 1</td>
                <td>Contenu interne 2</td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td>Pied de tableau 1</td>
                <td>Pied de tableau 2</td>
              </tr>
            </tfoot>
          </table>
    </div>
    <div class="fade-in container-fluid">
      <div class="animated fadeIn">
          <ul class="nav nav-tabs nav-justified" role="tablist">
              <li class="nav-item">
                  <a class="nav-link active" id="actifs-tab" data-toggle="tab" href="#categorie" role="tab" aria-controls="categorie" aria-selected="true">Catégorie de Pathologies</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" id="archives-tab" data-toggle="tab" href="#pathologie" role="tab" aria-controls="pathologie" aria-selected="false">Critères</a>
              </li>
          </ul>
          <div class="tab-content">
              <div class="tab-pane fade show active" id="actifs" role="tabpanel" aria-labelledby="actifs-tab">
                  <table id="datatable-categorie" data-detail-view="true" data-striped="true" data-filter-control="true" data-filter-show-clear="false" data-show-refresh="false" data-search="true" data-show-pagination-switch="false" data-pagination="false">
                      <thead>
                          <tr>
                              <th data-field="CartegoriePatho" data-width="150px"  data-align="center" data-formatter="actionFormatterDossier" data-events="actionEvents">Categorie de Pathologie</th>
                              <th data-field="CaractéristiquesPossibles" data-align="center" data-filter-control="input" data-visible="false" data-sortable="true">Caractéristiques Passibles</th>
                              <th data-field="Exemples" data-align="center" data-filter-control="input" data-sortable="true">Exemples</th>
                             
                          </tr>
                      </thead>
                  </table>
              </div>
              <div class="tab-pane fade" id="archives" role="tabpanel" aria-labelledby="archives-tab">
                  <table id="datatable-Critere" data-detail-view="true" data-striped="true" data-filter-control="true" data-filter-show-clear="false" data-show-refresh="false" data-search="true" data-show-pagination-switch="false" data-pagination="false">
                      <thead>
                          <tr>
                              <th data-field="Critères" data-width="150px" data-align="center"  data-formatter="actionFormatterDossier" data-events="actionEvents">Critères</th>
                              <th data-field="ValeursPossibles" data-align="center" data-filter-control="input" data-visible="false" data-sortable="true">Valeurs Possibles</th>
                              <th data-field="Exemples" data-align="center" data-filter-control="input" data-sortable="true">Exemples</th>
                             
                          </tr>
                      </thead>
                  </table>
              </div>
          </div>
      </div>
  </div>
 
  <div>
                    <H2>Pathologies de méridien </H2>
                    <h3>méridien du poumon interne</h3>
                    <ul>
                        <li class="sympt">Sympt1</li>
                        <li class="sympt">Sympt2</li>
                        <li class="sympt">Sympt3</li>
                        <li class="sympt">Sympt4</li>
                        <!-- Liste déroulante si l'utilisateur veut -->
                        <li class="sympt"><a href="">Voir plus ...</a></li>
                    </ul>
                    <h3>méridien du poumon externe</h3>
                    <ul>
                        <li class="sympt">Sympt1</li>
                        <li class="sympt">Sympt2</li>
                        <li class="sympt">Sympt3</li>
                        <li class="sympt">Sympt4</li>
                        <!-- Liste déroulante si l'utilisateur veut -->
                        <li class="sympt"><a href="">Voir plus ...</a></li>
                    </ul>
                    <h3>méridien du gros intestin</h3>
                    <ul>
                        <li class="sympt">Sympt1</li>
                        <li class="sympt">Sympt2</li>
                        <li class="sympt">Sympt3</li>
                        <li class="sympt">Sympt4</li>
                        <!-- Liste déroulante si l'utilisateur veut -->
                        <li class="sympt"><a href="">Voir plus ...</a></li>
                    </ul>

                </div>
    <footer>
        <a href="/"><img class="logo" src="../view/images/logo.png" alt="BEMS"></a>
        <nav>
            <ul class="nav_links">
                <li><a href="/sources">Sources</a></li>
                <li><a href="/policy">Privacy policy</a></li>
            </ul>
        </nav>
        <a class="cta btn" href="/"><img src="../view/images/connexion.png" alt="Connexion" width="30" height="30"></a>
    </footer>
</body>


<script src="../view/js/bootbox/bootbox.min.js"></script>

<script type="text/javascript">
     $(document).ready(function() {
            $('#datatable-categorie').bootstrapTable({
                url: "/views/getPathos"
            });
        });

        $(document).ready(function() {
            $('#datatable-Critere').bootstrapTable({
                url: "/views/getCriteres"
            });
        });
</script>

</html>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Learn Grails</title>
        <g:javascript library="jquery" plugin="jquery"/>

        <script type="text/javascript">
            function carregarLista() {
                <g:remoteFunction controller="produto" action="lista" update="divList"/>
            }

            function excluir(id) {
                if (confirm("Deseja realmente excluir?")) {
                    <g:remoteFunction controller="produto" action="excluir" update="divList" id="'+id+'"/>
                }
            }

            function cancelar() {
                jQuery("#divForm").html("")
            }
        </script>
    </head>
    <body>
        <g:remoteLink controller="produto" action="adicionar" update="divForm">Adicionar</g:remoteLink>

    <div id="divList">
        <g:render template="list" model="[produtos: produtos]"/>
    </div>
    <div id="divForm"></div>
    </body>
</html>
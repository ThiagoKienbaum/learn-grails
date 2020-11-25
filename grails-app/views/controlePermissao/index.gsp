<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta name="layout" content="main">
        <title>Controle de permissão</title>
        <g:javascript library="jquery" plugin="jquery"/>

        <style type="text/css">
            #divUsuarios {
                width: 30%;
                float: left;
                border: 1px solid #000;
                margin-right: 5%;
            }

            #divFormUsuario, #divFormPermissao {
                padding: 5px;
            }

            #divDetalhesUsuarios {
                width: 30%;
                float: left;
                border: 1px solid #000;
                margin-right: 4%;
            }

            #divPermissoes {
                width: 30%;
                float: right;
                border: 1px solid #000;
            }
        </style>

        <script type="text/javascript">
            $(document).ready(function() {
                carregarListaUsuarios()
                carregarListaPermissoes()
            })

            function carregarListaUsuarios() {
                $.ajax({
                    method: "POST",
                    url: "listarUsuario",
                    data: {},
                    success: function (data) {
                        $("divListaUsuario").html(data)
                    }
                })
            }

            function retornoSalvarUsuario(data) {
                if (data.mensagem == "OK") {
                    $("#divMensagemUsuario").html("Usuário salvo com sucesso.")
                    $("input[name= login]").val("")
                    carregarListaUsuarios()
                } else {
                    $("#divMensagemUsuario").html("Não foi possível salvar.")
                }
            }

            function carregarListaPermissoes() {
                $.ajax({
                    method: "POST",
                    url: "listarPermissao",
                    data: {},
                    success: function (data) {
                        $("divListaPermissao").html(data)
                    }
                })
            }

            function retornoSalvarPermissao(data) {
                if (data.mensagem == "OK") {
                    $("#divMensagemPermissao").html("Permissão salva com sucesso.")
                    $("input[name= permissao]").val("")
                    carregarListaPermissoes()
                } else {
                    $("#divMensagemPermissao").html("Não foi possível salvar.")
                }
            }
        </script>
    </head>

    <body>
        <div id="divUsuarios">
            <div id="divFormUsuario">
                <div id="divMensagemUsuario"></div>
                <g:formRemote name="formUsuario" url="[controller: 'controlePermissao', action: 'salvarUsuario']" onSuccess="retornoSalvarUsuario(data)">
                    Login <input type="text" name="login" value=""/>
                    <input type="submit" name="salvar" value="Salvar"/>
                </g:formRemote>
            </div>
            <div id="divListaUsuario"></div>
        </div>

        <div id="divDetalhesUsuarios">
            <table>
                <thead>
                <th>Detalhes</th>
                </thead>
                <g:each in="${permissoes}" var="permissao">
                    <tr>
                        <td>${permissao.authority}</td>
                    </tr>
                </g:each>
            </table>
        </div>

        <div id="divPermissoes">
            <div id="divFormPermissao">
                <div id="divMensagemPermissao"></div>
                <g:formRemote name="formPermissao" url="[controller: 'controlePermissao', action: 'salvarPermissao']" onSuccess="retornoSalvarPermissao(data)">
                    Permissão <input type="text" name="permissao" value=""/>
                    <input type="submit" name="salvar" value="Salvar"/>
                </g:formRemote>
            </div>
            <div id="divListaPermissao"></div>
        </div>
    </body>
</html>
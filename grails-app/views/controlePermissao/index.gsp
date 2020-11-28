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
                width: 20%;
                float: left;
                border: 1px solid #000;
                margin-right: 4%;
            }

            #divPermissoes {
                width: 40%;
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
                    success: function(data) {
                        $("#divListaUsuario").html(data)
                    }
                })
            }

            function retornoSalvarUsuario(data) {
                if (data.mensagem == "OK") {
                    $("#divMensagemUsuario").html("Usuário salvo com sucesso.")
                    $("input[name= login]").val("")
                    $("input[name= id]").val("")
                    carregarListaUsuarios()
                } else {
                    $("#divMensagemUsuario").html("Não foi possível salvar.")
                }
            }

            function alterarUsuario(id) {
                $.ajax({
                    method: "POST",
                    url: "getUsuario",
                    data: { "id": id },
                    success: function(data) {
                        $("#formUsuario input[name = login]").val(data.usuario.username)
                        $("#formUsuario input[name = id]").val(data.usuario.id)
                        $("#divDetalhesUsuarios").html("")
                        data.permissoes.forEach(permissao => {
                            $("#divDetalhesUsuarios").append(permissao.authority + "<br/>")
                        })
                    }
                })
            }

            function excluirUsuario(id) {
                if (confirm("Deseja realmente excluir o usuario?")) {
                    $.ajax({
                        method: "POST",
                        url: "excluirUsuario",
                        data: { "id": id },
                        success: function(data) {
                            if(data.mensagem == "OK") {
                                carregarListaUsuarios()
                            } else {
                                $("#divMensagemUsuario").html("Não foi possível excluir")
                            }
                        }
                    })}
            }

            function vincularPermissao(permissaoId) {
                var usuarioId = $("#formUsuario input[name = id]").val()
                $.ajax({
                    method: "POST",
                    url: "vincularPermissao",
                    data: {"permissaoId": permissaoId, "usuarioId": usuarioId},
                    success: function(data) {
                        if(data.mensagem == "OK") {
                            alterarUsuario(usuarioId)
                        } else {
                            $("#divMensagemPermissao").html("Não foi possível vincular a permissão")
                        }
                    }
                })
            }

            function carregarListaPermissoes() {
                $.ajax({
                    method: "POST",
                    url: "listarPermissao",
                    data: {},
                    success: function(data) {
                        $("#divListaPermissao").html(data)
                    }
                })
            }

            function retornoSalvarPermissao(data) {
                if (data.mensagem == "OK") {
                    $("#divMensagemPermissao").html("Permissão salva com sucesso.")
                    $("input[name= permissao]").val("")
                    $("input[name= id]").val("")
                    carregarListaPermissoes()
                } else {
                    $("#divMensagemPermissao").html("Não foi possível salvar.")
                }
            }

            function alterarPermissao(id) {
                $.ajax({
                    method: "POST",
                    url: "getPermissao",
                    data: { "id": id },
                    success: function(data) {
                        $("#formPermissao input[name = permissao]").val(data.authority)
                        $("#formPermissao input[name = id]").val(data.id)
                    }
                })
            }

            function excluirPermissao(id) {
                if (confirm("Deseja realmente excluir a permissão?")) {
                    $.ajax({
                    method: "POST",
                    url: "excluirPermissao",
                    data: { "id": id },
                    success: function(data) {
                        if(data.mensagem == "OK") {
                            carregarListaPermissoes()
                        } else {
                            $("#divMensagemPermissao").html("Não foi possível excluir")
                        }
                    }
                })}
            }
        </script>
    </head>

    <body>
        <div id="divUsuarios">
            <div id="divFormUsuario">
                <div id="divMensagemUsuario"></div>
                <g:formRemote id="formUsuario" name="formUsuario" url="[controller: 'controlePermissao', action: 'salvarUsuario']" onSuccess="retornoSalvarUsuario(data)">
                    Login <input type="text" name="login" value=""/>
                    <input type="hidden" name="id"/>
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
                <g:formRemote id="formPermissao" name="formPermissao" url="[controller: 'controlePermissao', action: 'salvarPermissao']" onSuccess="retornoSalvarPermissao(data)">
                    Permissão <input type="text" name="permissao" value=""/>
                    <input type="hidden" name="id"/>
                    <input type="submit" name="salvar" value="Salvar"/>
                </g:formRemote>
            </div>
            <div id="divListaPermissao"></div>
        </div>
    </body>
</html>
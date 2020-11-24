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

            #formUsuario {
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

            })

            function retornoSalvarUsuario(data) {
                if (data.mensagem == "OK") {
                    $("#divMensagemUsuario").html("Usuário salvo com sucesso.")
                } else {
                    $("#divMensagemUsuario").html("Não foi possível salvar.")
                }
            }
        </script>
    </head>

    <body>
        <div id="divUsuarios">
            <div id="formUsuario">
                <div id="divMensagemUsuario"></div>
                <g:formRemote name="formUsuario" url="[controller: 'controlePermissao', action: 'salvarUsuario']" onSuccess="retornoSalvarUsuario(data)">
                    Login <input type="text" name="login" value=""/>
                    <input type="submit" name="salvar" value="Salvar"/>
                </g:formRemote>
            </div>

            <table>
                <thead>
                    <th>Username</th>
                </thead>
                <g:each in="${usuarios}" var="usuario">
                    <tr>
                        <td>${usuario.username}</td>
                    </tr>
                </g:each>
            </table>
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
            <table>
                <thead>
                <th>Permissão</th>
                </thead>
                <g:each in="${permissoes}" var="permissao">
                    <tr>
                        <td>${permissao.authority}</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>
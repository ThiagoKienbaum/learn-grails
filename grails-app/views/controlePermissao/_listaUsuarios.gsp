<table>
    <thead>
    <th>Username</th>
    </thead>
    <g:each in="${usuarios}" var="usuario">
        <tr>
            <td>${usuario.username}</td>
            <td><a href="javascript: alterarUsuario(${usuario.id})">Alterar</a></td>
            <td><a href="javascript: excluirUsuario(${usuario.id})">Excluir</a></td>
        </tr>
    </g:each>
</table>
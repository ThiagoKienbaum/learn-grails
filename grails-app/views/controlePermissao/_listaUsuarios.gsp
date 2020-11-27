<table>
    <thead>
    <th>Username</th>
    </thead>
    <g:each in="${usuarios}" var="usuario">
        <tr>
            <td>${usuario.username}</td>
            <td><a href="javascript: excluirPermissao(${usuario.id})">Excluir</a></td>
        </tr>
    </g:each>
</table>
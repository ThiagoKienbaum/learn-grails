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
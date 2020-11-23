<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="man"/>
        <title>Área restrita</title>
    </head>

    <body>
        <sec:ifLoggedIn>
            Hello ${usuario}!
            <a href="/learn-grails/j_spring_security_logout">Sair</a>
        </sec:ifLoggedIn>
    </body>
</html>
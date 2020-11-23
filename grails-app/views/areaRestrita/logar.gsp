<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="man"/>
        <title>Área restrita</title>
    </head>

    <body>
        <form action="${request.contextPath}/j_spring_security_check" method="POST" id="formLogar" name="formLogar">
            <p>
                Email
                <input type="text" name="j_username" id="username"/>
            </p>
            <p>
                Senha
                <input type="password" name="j_password" id="password"/>
            </p>
            <input type="submit" value="Entrar"/>
        </form>
    </body>
</html>
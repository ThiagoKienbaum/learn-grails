<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Learn Grails</title>
	    <g:javascript library="jquery"/>
    </head>
    <body>
        <a href="#">Adicionar</a>

    <div id="divList">
        <g:render template="list" model="[produtos: produtos]"/>
    </div>
    <div id="divForm"></div>
    </body>
</html>
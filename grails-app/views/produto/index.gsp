<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Learn Grails</title>
	    <g:javascript library="jquery"/>
    </head>
    <body>
        <g:remoteLink controller="produto" action="adicionar" update="divForm">Adicionar</g:remoteLink>

    <div id="divList">
        <g:render template="list" model="[produtos: produtos]"/>
    </div>
    <div id="divForm"></div>
    </body>
</html>
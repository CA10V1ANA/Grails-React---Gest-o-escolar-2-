<!-- <!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Criar Curso</title>
</head>
<body>

<h1>Criar Curso</h1>

<g:if test="${flash.message}">
    <div class="alert">${flash.message}</div>
</g:if>

<g:form url="[controller: 'Curso', action: 'salvar']" method="post">
    <table>
        <tr>
            <td>Título:</td>
            <td><g:textField name="titulo" value="${cursoInstance?.titulo}" required="true"/></td>
        </tr>
        <tr>
            <td>Descrição:</td>
            <td><g:textField name="descricao" value="${cursoInstance?.descricao}" required="true"/></td>
        </tr>
        <tr>
            <td>Carga Horária:</td>
            <td><g:textField name="cargaHoraria" value="${cursoInstance?.cargaHoraria}" required="true"/></td>
        </tr>
    </table>

    <g:submitButton name="create" value="Criar Curso"/>
</g:form>

<br/>
<g:link controller="Curso" action="index">Voltar à lista</g:link>

</body>
</html>

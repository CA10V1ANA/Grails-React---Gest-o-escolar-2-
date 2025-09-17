<!--<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Criar Aluno</title>
</head>
<body>

<h1>Criar Aluno</h1>

<g:if test="${flash.message}">
    <div class="alert">${flash.message}</div>
</g:if>

<g:form url="[controller: 'aluno', action: 'salvar']" method="post">
    <table>
        <tr>
            <td>Nome:</td>
            <td><g:textField name="nome" value="${alunoInstance?.nome}" required="true"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><g:textField name="email" value="${alunoInstance?.email}" required="true"/></td>
        </tr>
        <tr>
            <td>Data Nascimento:</td>
            <td><g:datePicker name="dataNascimento" value="${alunoInstance?.dataNascimento}" precision="day"/></td>
        </tr>
    </table>

    <g:submitButton name="create" value="Criar Aluno"/>
</g:form>

<br/>
<g:link controller="aluno" action="index">Voltar à lista</g:link>

</body>
</html>

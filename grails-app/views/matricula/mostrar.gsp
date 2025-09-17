<!--DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes da Matrícula</title>
</head>
<body>

<h1>Detalhes da Matrícula</h1>

<g:if test="${flash.message}">
    <div style="color: red;">${flash.message}</div>
</g:if>

<p><strong>Aluno:</strong> ${matricula?.aluno?.nome ?: 'Não informado'}</p>
<p><strong>Curso:</strong> ${matricula?.curso?.titulo ?: 'Não informado'}</p>
<p><strong>Data da Matrícula:</strong> ${matricula?.dataMatricula?.format('dd/MM/yyyy') ?: 'Não informado'}</p>
<p><strong>Valor Pago:</strong> R$ ${matricula?.valorPago ?: 'Não informado'}</p>

<g:link action="atualizar" id="${matricula?.id}">Editar</g:link> |
<g:link action="index">Voltar</g:link>

</body>
</html>

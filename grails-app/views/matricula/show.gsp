<!--DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Visualizar Matrícula</title>
</head>
<body>

<h1>Visualizar Matrícula</h1>

<p><strong>ID:</strong> ${matriculaInstance?.id}</p>
<p><strong>Aluno:</strong> ${matriculaInstance?.aluno?.nome}</p>
<p><strong>Curso:</strong> ${matriculaInstance?.curso?.titulo}</p>
<p><strong>Data Matrícula:</strong> ${matriculaInstance?.dataMatricula?.format('dd/MM/yyyy')}</p>
<p><strong>Valor Pago:</strong> ${matriculaInstance?.valorPago}</p>

<g:link controller="matricula" action="index">Voltar</g:link>
<g:link controller="matricula" action="edit" id="${matriculaInstance?.id}">Editar</g:link>

</body>
</html>

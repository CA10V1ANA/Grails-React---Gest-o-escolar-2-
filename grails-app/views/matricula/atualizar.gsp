<!--DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Atualizar Matrícula</title>
    <style>
        label { display: inline-block; width: 150px; font-weight: bold; }
        input, select { width: 200px; }
        p { margin: 8px 0; }
    </style>
</head>
<body>

<h1>Atualizar Matrícula</h1>

<g:if test="${flash.message}">
    <div style="color: green;">${flash.message}</div>
</g:if>

<g:form controller="matricula" action="atualizar" method="post">
    <!-- Hidden para simular PUT -->
    <g:hiddenField name="_method" value="PUT"/>
    <g:hiddenField name="id" value="${matricula.id}"/>

    <p>
        <label>Aluno:</label>
        <g:select name="alunoId" from="${alunos}" optionKey="id" optionValue="nome" 
                  value="${matricula.aluno?.id}" required="true"/>
    </p>

    <p>
        <label>Curso:</label>
        <g:select name="cursoId" from="${Curso}" optionKey="id" optionValue="titulo" 
                  value="${matricula.curso?.id}" required="true"/>
    </p>

    <p>
        <label>Data da Matrícula:</label>
        <g:datePicker name="dataMatricula" precision="day" value="${matricula.dataMatricula}" required="true"/>
    </p>

    <p>
        <label>Valor Pago:</label>
        <g:textField name="valorPago" type="number" step="0.01" min="0" 
                     value="${matricula.valorPago}" required="true"/>
    </p>

    <p>
        <g:submitButton name="salvar" value="Atualizar Matrícula"/>
    </p>
</g:form>

<g:link action="mostrar" id="${matricula.id}">Voltar para Detalhes</g:link> |
<g:link action="index">Voltar para Lista</g:link>

</body>
</html>

<!--DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Criar Matrícula</title>
    <style>
        /* Adicione seu estilo CSS personalizado aqui */
        p{
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            margin-left: 10px; 
        }
        .form-control {
            display: block;
            width: 10%;
            padding: 8px;
            margin: 4px 0;
            box-sizing: border-box;
        }
        h1{
            margin-left: 10px;
        }
        .voltar-link{
            margin-left: 10px;
        }
    </style>
</head>
<body>

<h1>Criar Matrícula</h1>

<g:if test="${flash.message}">
    <div style="color: green;">${flash.message}</div>
</g:if>

<g:form controller="matricula" action="salvar" method="post">
    <p>
        <label>Aluno:</label>
        <g:select name="alunoId" from="${alunos}" optionKey="id" optionValue="nome" required="true"/>
    </p>
    <p>
        <label>Curso:</label>
        <g:select name="cursoId" from="${Curso}" optionKey="id" optionValue="titulo" required="true" class="form-control"/>
    </p>
    <p>
        <label>Data da Matrícula:</label>
        <g:datePicker name="dataMatricula" precision="day" required="true" class="form-control"/>
    </p>
    <p>
        <label>Valor Pago:</label>
        <g:textField name="valorPago" type="number" step="0.01" min="0" required="true" class="form-control"/>
    </p>
    <p>
        <g:submitButton name="salvar" value="Criar Matrícula"/>
    </p>
</g:form>

<g:link controller="matricula" action="index" class="voltar-link">Voltar</g:link>

</body>
</html>

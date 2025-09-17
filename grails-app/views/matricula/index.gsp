<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Matrículas</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .links {
            margin-top: 20px;
            padding: 10px;
        }
        .links-item {
            margin-right: 15px;
            background-color: #0099ffff;
            padding: 5px;
            border-radius: 3px;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }
        h1{
            margin-left: 20px;
        }
        table {
            width: 95%;
            margin-left: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<h1>Matrículas</h1>

<g:if test="${flash.message}">
    <div class="alert">${flash.message}</div>
</g:if>

<label>Pesquisar Matrícula:</label>
<g:textField name="q" id="pesquisaMatricula" placeholder="Digite nome do aluno ou curso..." />

<g:formRemote 
    url="[controller:'matricula', action:'salvar']"
    update="tabelaMatriculas"
    method="POST"
    onSuccess="console.log('Matrícula realizada com sucesso')"
    onFailure="alert('Erro ao salvar matrícula')">

    <label>Aluno:</label>
    <g:select name="aluno.id" from="${alunos}" optionKey="id" optionValue="nome"/><br/>

    <label>Curso:</label>
    <g:select name="curso.id" from="${Curso}" optionKey="id" optionValue="nome"/><br/>

    <g:submitButton name="salvar" value="Matricular"/>
</g:formRemote>

<hr/>


<div id="tabelaMatriculas">
    <g:render template="lista" model="[matriculas: matriculas]"/>
</div>

<script>
document.getElementById("pesquisaMatricula").addEventListener("keyup", function() {
    const termo = this.value;
    $.get("/matricula/pesquisar", { q: termo }, function(data) {
        $("#tabelaMatriculas").html(data); // Atualiza template _lista.gsp
    });
});
</script>

</body>
</html>

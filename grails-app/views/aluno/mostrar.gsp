<!--<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes do Aluno</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        table { border-collapse: collapse; }
        td, th { border: 1px solid #ccc; padding: 5px 10px; }
    </style>
</head>
<body>

<h1>Detalhes do Aluno</h1>

<div id="aluno-detalhes">
    <p><strong>Nome:</strong> <span id="nome">Carregando...</span></p>
    <p><strong>Email:</strong> <span id="email">Carregando...</span></p>
    <p><strong>Data Nascimento:</strong> <span id="dataNascimento">Carregando...</span></p>
</div>

<g:link action="atualizar" id="${params.id}">Editar</g:link> |
<g:link action="index">Voltar</g:link>

<script>
$(document).ready(function() {
    const alunoId = "${params.id}"; // pega o id da URL

    // Consome a API do backend
    $.getJSON(`/aluno/mostrar/${alunoId}`)
    .done(function(a) {
        if (a) {
            const dataFormatada = a.dataNascimento 
                ? new Date(a.dataNascimento).toLocaleDateString('pt-BR')
                : 'Não informado';

            $("#nome").text(a.nome || 'Não informado');
            $("#email").text(a.email || 'Não informado');
            $("#dataNascimento").text(dataFormatada);
        } else {
            $("#aluno-detalhes").html('<p>Aluno não encontrado.</p>');
        }
    })
    .fail(function() {
        $("#aluno-detalhes").html('<p>Erro ao carregar os dados do aluno.</p>');
    });
});
</script>

</body>
</html>

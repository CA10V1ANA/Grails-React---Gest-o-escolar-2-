<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Alunos</title>
    <g:javascript library="jquery"/>
</head>
<body>

<h1>Alunos</h1>

<!-- Formulário para adicionar novo aluno -->
<g:form controller="aluno" action="save" id="addAlunoForm">
    <label for="nome">Nome:</label>
    <g:textField name="nome" required="true"/>
    <g:submitButton name="submit" value="Adicionar"/>
</g:form>

<hr/>

<!-- Tabela de alunos -->
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${alunoList}" var="aluno">
        <tr id="aluno-${aluno.id}">
            <td>${aluno.id}</td>
            <td>${aluno.nome}</td>
            <td>
                <!-- Link para editar (abre na própria página ou em outro form) -->
                <g:link controller="aluno" action="edit" id="${aluno.id}">Editar</g:link>
                
                <!-- Botão para deletar via JS -->
                <button onclick="deleteAluno(${aluno.id})">Deletar</button>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>
function deleteAluno(id) {
    if(confirm('Tem certeza que deseja deletar este aluno?')) {
        $.ajax({
            url: '/aluno/delete/' + id,
            type: 'POST', // ou 'DELETE' dependendo da sua configuração
            success: function() {
                $('#aluno-' + id).remove();
            },
            error: function() {
                alert('Erro ao deletar aluno.');
            }
        });
    }
}
</script>

</body>
</html>

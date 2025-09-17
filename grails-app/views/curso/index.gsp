<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Cursos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #333; padding: 8px; text-align: left; }
        th { background-color: #1a1a4b; color: white; }
        button { background-color: #1a1a4b; color: white; border: none; padding: 5px 10px; cursor: pointer; border-radius: 4px; }
        button:hover { background-color: #333366; }
        input[type=text] { padding: 5px; width: 200px; }
    </style>
</head>
<body>

<h1>Lista de Cursos</h1>

<!-- Formulário para adicionar curso -->
<form id="cursoForm" method="post" action="${createLink(controller:'curso', action:'save')}">
    <label>Nome do Curso:</label>
    <input type="text" name="nome" required/>
    <button type="submit">Adicionar</button>
</form>

<!-- Tabela de cursos -->
<table id="tabelaCursos">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${cursos}" var="curso">
            <tr id="curso-${curso.id}">
                <td>${curso.id}</td>
                <td>${curso.nome}</td>
                <td>
                    <button onclick="deleteCurso(${curso.id})">Deletar</button>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>

<script>
// Função para adicionar curso via AJAX
document.getElementById('cursoForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);

    fetch(form.action, {
        method: 'POST',
        body: formData
    })
    .then(resp => resp.json())
    .then(curso => {
        // Adiciona o novo curso na tabela
        const tbody = document.getElementById('tabelaCursos').querySelector('tbody');
        const row = document.createElement('tr');
        row.id = `curso-${curso.id}`;
        row.innerHTML = `
            <td>${curso.id}</td>
            <td>${curso.nome}</td>
            <td>
                <button onclick="deleteCurso(${curso.id})">Deletar</button>
            </td>
        `;
        tbody.appendChild(row);
        form.reset();
    })
    .catch(err => console.error(err));
});

// Função para deletar curso via AJAX
function deleteCurso(id) {
    fetch(`/curso/delete/${id}`, { method: 'DELETE' })
        .then(() => {
            const row = document.getElementById(`curso-${id}`);
            if(row) row.remove();
        })
        .catch(err => console.error(err));
}
</script>

</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Alunos</title>
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
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Data Nascimento</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${alunos}" var="a">
            <tr>
                <td>${a.id}</td>
                <td>${a.nome}</td>
                <td>${a.email}</td>
                <td>${a.dataNascimento?.format('dd/MM/yyyy') ?: ''}</td>
                <td>
                    <g:link controller="aluno" action="mostrar" id="${a.id}">Ver</g:link> |
                    <g:link controller="aluno" action="atualizar" id="${a.id}" params="[form:true]">Editar</g:link> |
                    <g:form controller="aluno" action="deletar" id="deleteForm${a.id}" style="display:inline">
                        <g:hiddenField name="id" value="${a.id}"/>
                        <g:submitButton value="Deletar" onclick="return confirm('Tem certeza que deseja deletar este aluno?')"/>
                    </g:form>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>

</body>
</html>

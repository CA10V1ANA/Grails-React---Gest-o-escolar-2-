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
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Aluno</th>
            <th>Curso</th>
            <th>Data Matrícula</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${matriculas}" var="m">
            <tr>
                <td>${m.id}</td>
                <td>${m.aluno.nome}</td>
                <td>${m.curso.nome}</td>
                <td>${m.dataMatricula?.format('dd/MM/yyyy') ?: ''}</td>
                <td>
                    <g:link controller="matricula" action="mostrar" id="${m.id}">Ver</g:link> |
                    <g:link controller="matricula" action="atualizar" id="${m.id}" params="[form:true]">Editar</g:link> |
                    <g:form controller="matricula" action="deletar" id="deleteForm${m.id}" style="display:inline">
                        <g:hiddenField name="id" value="${m.id}"/>
                        <g:submitButton value="Deletar" onclick="return confirm('Tem certeza que deseja deletar esta matrícula?')"/>
                    </g:form>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
</body>
</html>

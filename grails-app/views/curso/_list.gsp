<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Curso</title>
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
            <th>Descrição</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${Curso}" var="c">
            <tr>
                <td>${c.id}</td>
                <td>${c.nome}</td>
                <td>${c.descricao}</td>
                <td>
                    <g:link controller="curso" action="mostrar" id="${c.id}">Ver</g:link> |
                    <g:link controller="curso" action="atualizar" id="${c.id}" params="[form:true]">Editar</g:link> |
                    <g:form controller="curso" action="deletar" id="deleteForm${c.id}" style="display:inline">
                        <g:hiddenField name="id" value="${c.id}"/>
                        <g:submitButton value="Deletar" onclick="return confirm('Tem certeza que deseja deletar este curso?')"/>
                    </g:form>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
</body>
</html>

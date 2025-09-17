package escolaa

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "aluno", action: "index")
        "/Curso"(controller: "Curso", action: "index")
        "/matricula"(controller: "matricula", action: "index")

        get "/aluno/listar"(controller: 'aluno', action: 'listar', method: "GET")
        get "/aluno/mostrar/$id"(controller: 'aluno', action: 'mostrar', method: "GET")
        put "/aluno/atualizar/$id"(controller: 'aluno', action: 'atualizar', method: "PUT")
        get "/aluno/atualizar/$id"(controller: "aluno", action: "atualizar", params: [form: true], method: "GET")
        post "/aluno/salvar"(controller: 'aluno', action: 'salvar', method: "POST")
        get  "/aluno/criar"(controller: "aluno", action: "criar")
        delete "/aluno/deletar/$id"(controller: 'aluno', action: 'deletar', method: "DELETE")

        get "/Curso/listar"(controller: 'Curso', action: 'listar', method: "GET")
        get "/Curso/mostrar/$id"(controller: 'Curso', action: 'mostrar', method: "GET")
        post "/Curso/salvar"(controller: 'Curso', action: 'salvar', method: "POST")
        get "/Curso/create"(controller: "Curso", action: "criar")
        delete "/Curso/deletar/$id"(controller: 'Curso', action: 'deletar', method: "DELETE")
        put "/Curso/atualizar/$id"(controller: 'Curso', action: 'atualizar', method: "PUT")
        get "/Curso/atualizar/$id"(controller: "Curso", action: "atualizar", params: [form: true], method: "GET")

        get "/matricula/listar"(controller: 'matricula', action: 'listar', method: "GET")
        get "/matricula/mostrar/$id"(controller: 'matricula', action: 'mostrar', method: "GET")
        post "/matricula/salvar"(controller: 'matricula', action: 'salvar', method: "POST")
        get "/matricula/create"(controller: "matricula", action: "criar")
        delete "/matricula/deletar/$id"(controller: 'matricula', action: 'deletar', method: "DELETE")
        put "/matricula/atualizar/$id"(controller: 'matricula', action: 'atualizar', method: "PUT")
        get "/matricula/atualizar/$id"(controller: "matricula", action: "atualizar", params: [form: true], method: "GET")

        "/"(view:"/aluno/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

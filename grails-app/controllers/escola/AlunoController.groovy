package escolaa
import grails.rest.*
import grails.converters.*
import escolaa.Aluno

class AlunoController {
    static responseFormats = ['json']
    static allowedMethods = [
        listar: "GET",
        mostrar: "GET",
        atualizar: ["GET", "PUT"],
        salvar: ["GET", "POST"],
        deletar: "DELETE"
    ]

    def alunoService

    def index() {
        [alunos: Aluno.list()]
    }

    def mostrar(Long id){
        def aluno = Aluno.findById(id)
        if(aluno){
            render(view: "mostrar", model: [alunoInstance: aluno])
        } else {
            render status: 404
        }
    }

    def atualizar(Long id) {
        def aluno = Aluno.get(alunoId)

        if (!aluno) {
            render status: 404, text: "Aluno não encontrado"
            return
        }

        aluno.properties = params

        if (!aluno.save(flush: true)) {
            if (request.xhr) {
                render status: 400, text: "Erro ao atualizar aluno"
            } else if (request.format == 'json') {
                render status: 400
            } else {
                flash.message = "Erro ao atualizar aluno!"
                redirect(action: "index")
            }
            return
        }

        if (request.xhr) {
            render(template: "lista", model: [alunos: Aluno.list()])
        } else if (request.format == 'json') {
            render aluno as JSON
        } else {
            flash.message = "Aluno atualizado com sucesso!"
            redirect(action: "index")
        }

        render aluno as JSON
    }


    def salvar() {
        def aluno = new Aluno(request.JSON ?: params)

        if (!aluno.save(flush: true)) {
            if (request.xhr) { 
                render status: 400, text: "Erro ao criar aluno"
            } else if (request.format == 'json') {
                render status: 400
            } else { 
                flash.message = "Erro ao criar aluno!"
                render(view: "create", model: [alunoInstance: aluno])
            }
            return
        }

        if (request.xhr) {
            render(template: "lista", model: [alunos: Aluno.list()])
        } else if (request.format == 'json') {
            render aluno as JSON
        } else {
            flash.message = "Aluno criado com sucesso!"
            redirect(action: "index")
        }
    }


    def criar(){
        render(view: "create", model: [alunoInstance: new Aluno()])
    }


    def deletar(Long id) {
        def aluno = Aluno.get(id)
        if (!aluno) {
            render status: 404, text: "Aluno não encontrado"
            return
        }
        aluno.delete(flush: true)

        if (request.xhr) {
            render(template: "lista", model: [alunos: Aluno.list()])
        } else if (request.format == 'json') {
            render([status: "ok"] as JSON)
        } else {
            flash.message = "Aluno deletado com sucesso!"
            redirect(action: "index")
        }
    }

     def pesquisar() {
        def termo = params.q ?: ""
        def alunosFiltrados = Aluno.createCriteria().list {
            ilike("nome", "%${termo}%")
        }

        render(template: "lista", model: [alunos: alunosFiltrados])
    }

}


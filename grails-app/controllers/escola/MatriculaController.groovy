package escolaa
import grails.rest.*
import grails.converters.*
import escolaa.Matricula
import escolaa.Aluno
import escolaa.Curso

class MatriculaController {
    static responseFormats = ['json']
    static allowedMethods = [
        listar: "GET",
        mostrar: "GET",
        atualizar: ["PUT","GET"],
        salvar: ["GET", "POST"], 
        deletar: "DELETE"
    ]

    def matriculaService

    def index() {
        [matriculas: Matricula.list(), alunos: Aluno.list(), Curso: Curso.list()]
    }

    def salvar() {
        def matricula = new Matricula()
        matricula.aluno = Aluno.get(params.aluno.id as Long)
        matricula.curso = Curso.get(params.curso.id as Long)

        if (!matricula.save(flush: true)) {
            if (request.xhr) {
                render status: 400, text: "Erro ao criar matrícula"
            } else if (request.format == 'json') {
                render status: 400
            } else {
                flash.message = "Erro ao criar matrícula!"
                render(view: "create", model: [matriculaInstance: matricula])
            }
            return
        }

        if (request.xhr) {
            render(template: "lista", model: [matriculas: Matricula.list()])
        } else if (request.format == 'json') {
            render matricula as JSON
        } else {
            flash.message = "Matrícula criada com sucesso!"
            redirect(action: "index")
        }
    }

    def atualizar() {
        Long matriculaId = params.id as Long
    def matricula = Matricula.get(matriculaId)

        if (!matricula) {
            render status: 404, text: "Matrícula não encontrada"
            return
        }

        matricula.aluno = Aluno.get(params.aluno.id as Long)
        matricula.curso = Curso.get(params.curso.id as Long)

        if (!matricula.save(flush: true)) {
            if (request.xhr) {
                render status: 400, text: "Erro ao atualizar matrícula"
            } else if (request.format == 'json') {
                render status: 400
            } else {
                flash.message = "Erro ao atualizar matrícula!"
                redirect(action: "index")
            }
            return
        }

        if (request.xhr) {
            render(template: "lista", model: [matriculas: Matricula.list()])
        } else if (request.format == 'json') {
            render matricula as JSON
        } else {
            flash.message = "Matrícula atualizada com sucesso!"
            redirect(action: "index")
        }
    }

    def deletar(Long id) {
        def matricula = Matricula.get(id)
        if (!matricula) {
            render status: 404, text: "Matrícula não encontrada"
            return
        }

        matricula.delete(flush: true)

        if (request.xhr) {
            render(template: "lista", model: [matriculas: Matricula.list()])
        } else if (request.format == 'json') {
            render([status: "ok"] as JSON)
        } else {
            flash.message = "Matrícula deletada com sucesso!"
            redirect(action: "index")
        }
    }

    def pesquisar() {
        def termo = params.q ?: ""
        def matriculasFiltradas = Matricula.createCriteria().list {
            aluno {
                ilike("nome", "%${termo}%")
            }
            or {
                curso {
                    ilike("nome", "%${termo}%")
                }
            }
        }

        render(template: "lista", model: [matriculas: matriculasFiltradas])
    }
}
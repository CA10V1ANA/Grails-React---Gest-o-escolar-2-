package escolaa
import grails.rest.*
import grails.converters.*
import escolaa.Curso


class CursoController { 
    static responseFormats = ['json']
    static allowedMethods = [
        listar: "GET",
        mostrar: "GET",
        atualizar: ["GET","PUT"],
        salvar: ["GET", "POST"],
        deletar: "DELETE"
    ]

    def cursoService

    def index() {
        [Curso: Curso.list()]
    }

    def listar(){
        def Curso = Curso.findAll()
        render Curso as JSON
    }

    def mostrar(Long id){
        def curso = Curso.findById(id)
        if(curso){
            render (view: "mostrar", model: [curso: curso])
        } else {
            render status: 404
        }
    }

    def atualizar( ) {
    Long id = params.id as Long
    def curso = Curso.get(id)
    if (!curso) {
        render status: 404, text: "Curso não encontrado"
        return
    }

    if (request.method == 'GET') {
        // Abre formulário GSP
        render(view: "edit", model: [cursoInstance: curso])
        return
    }

    // Atualiza dados
    curso.properties = request.JSON ?: params

    if (!curso.save(flush: true)) {
        if (request.xhr) {
            render status: 400, text: "Erro ao atualizar curso"
        } else if (request.format == 'json') {
            render status: 400
        } else {
            flash.message = "Erro ao atualizar curso!"
            render(view: "edit", model: [cursoInstance: curso])
        }
        return
    }

    if (request.xhr) {
        render(template: "lista", model: [Curso: Curso.list()])
    } else if (request.format == 'json') {
        render curso as JSON
    } else {
        flash.message = "Curso atualizado com sucesso!"
        redirect(action: "index")
    }
}

    def salvar() {
        def curso = new Curso(request.JSON ?: params)

        if (!curso.save(flush: true)) {
            if (request.xhr) {
                render status: 400, text: "Erro ao criar curso"
            } else if (request.format == 'json') {
                render status: 400
            } else {
                flash.message = "Erro ao criar curso!"
                render(view: "create", model: [cursoInstance: curso])
            }
            return
        }

        if (request.xhr) {
            render(template: "lista", model: [Curso: Curso.list()])
        } else if (request.format == 'json') {
            render curso as JSON
        } else {
            flash.message = "Curso criado com sucesso!"
            redirect(action: "index")
        }
    }

    def deletar(Long id) {
        def curso = Curso.get(id)
        if (!curso) {
            render status: 404, text: "Curso não encontrado"
            return
        }

        curso.delete(flush: true)

        if (request.xhr) {
            render(template: "lista", model: [Curso: Curso.list()])
        } else if (request.format == 'json') {
            render([status: "ok"] as JSON)
        } else {
            flash.message = "Curso deletado com sucesso!"
            redirect(action: "index")
        }
    }

    // Pesquisa dinâmica via Criteria
    def pesquisar() {
        def termo = params.q ?: ""
        def CursoFiltrados = Curso.createCriteria().list {
            or {
                ilike("nome", "%${termo}%")
                ilike("descricao", "%${termo}%")
            }
        }

        render(template: "lista", model: [Curso: CursoFiltrados])
    }
}

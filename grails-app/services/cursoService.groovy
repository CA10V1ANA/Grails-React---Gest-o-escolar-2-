package escolaa

class CursoService {

    def listAll() {
        Curso.list()
    }

    def saveCurso(curso) {
        curso.save(flush:true)
    }

    def updateCurso(id, params) {
        def curso = Curso.get(id)
        if(curso) {
            curso.properties = params
            curso.save(flush:true)
        }
        return curso
    }

    def deleteCurso(id) {
        Curso.get(id)?.delete(flush:true)
    }
}

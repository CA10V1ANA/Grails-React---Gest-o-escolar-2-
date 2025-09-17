package escolaa

class MatriculaService {

    def listAll() {
        Matricula.list()
    }

    def saveMatricula(matricula) {
        matricula.save(flush:true)
    }

    def updateMatricula(id, params) {
        def matricula = Matricula.get(id)
        if(matricula) {
            matricula.properties = params
            matricula.save(flush:true)
        }
        return matricula
    }

    def deleteMatricula(id) {
        Matricula.get(id)?.delete(flush:true)
    }
}

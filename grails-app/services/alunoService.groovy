package escolaa

class AlunoService {

    def listAll() {
        Aluno.list()
    }

    def saveAluno(aluno) {
        aluno.save(flush:true)
    }

    def updateAluno(id, params) {
        def aluno = Aluno.get(id)
        if(aluno) {
            aluno.properties = params
            aluno.save(flush:true)
        }
        return aluno
    }

    def deleteAluno(id) {
        Aluno.get(id)?.delete(flush:true)
    }
}

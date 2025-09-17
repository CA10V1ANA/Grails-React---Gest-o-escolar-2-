package escolaa
import escolaa.Matricula
import escolaa.Aluno
import escolaa.Curso

class BootStrap {

    def init = { servletContext ->
        if(Matricula.count == 0 & Aluno.count == 0 & Curso.count == 0){
        println "===== BootStrap iniciando ====="

        // --- Limpar tabelas antes de criar ---
        Matricula.deleteAll()
        Aluno.deleteAll()
        Curso.deleteAll()

        println "Tabelas limpas"

        // --- Criando Curso ---
        def curso1 = new Curso(titulo: "Java Básico", descricao: "Aprenda Java do zero", cargaHoraria: 40)
                .save(flush:true, failOnError:true)
        def curso2 = new Curso(titulo: "Grails Avançado", descricao: "Framework Grails avançado", cargaHoraria: 60)
                .save(flush:true, failOnError:true)
        def curso3 = new Curso(titulo: "Banco de Dados", descricao: "Modelagem e SQL", cargaHoraria: 50)
                .save(flush:true, failOnError:true)

        println "Curso criados: ${Curso.count()}"

        // --- Criando Alunos ---
        def aluno1 = new Aluno(nome: "Miguel Sousa", email: "miguel@email.com", dataNascimento: Date.parse("yyyy-MM-dd","1995-08-21"))
                .save(flush:true, failOnError:true)
        def aluno2 = new Aluno(nome: "Ana Silva", email: "ana@email.com", dataNascimento: Date.parse("yyyy-MM-dd","1998-03-15"))
                .save(flush:true, failOnError:true)
        def aluno3 = new Aluno(nome: "Carlos Pereira", email: "carlos@email.com", dataNascimento: Date.parse("yyyy-MM-dd","2000-07-10"))
                .save(flush:true, failOnError:true)

        println "Alunos criados: ${Aluno.count()}"

        // --- Criando Matrículas ---
        new Matricula(aluno: aluno1, curso: curso1, dataMatricula: new Date(), valorPago: 500.00G).save(flush:true, failOnError:true)
        new Matricula(aluno: aluno1, curso: curso2, dataMatricula: new Date(), valorPago: 700.00G).save(flush:true, failOnError:true)
        new Matricula(aluno: aluno2, curso: curso2, dataMatricula: new Date(), valorPago: 700.00G).save(flush:true, failOnError:true)
        new Matricula(aluno: aluno2, curso: curso3, dataMatricula: new Date(), valorPago: 600.00G).save(flush:true, failOnError:true)
        new Matricula(aluno: aluno3, curso: curso1, dataMatricula: new Date(), valorPago: 500.00G).save(flush:true, failOnError:true)

        println "Matrículas criadas: ${Matricula.count()}"

        println "===== BootStrap finalizado ====="
        }
    }

    def destroy = { }
}

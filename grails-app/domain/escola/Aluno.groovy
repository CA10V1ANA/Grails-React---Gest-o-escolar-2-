package escolaa

class Aluno {

    String nome
    String email
    Date dataNascimento

    static hasMany = [matriculas: Matricula]

    static constraints = {
        nome nullable: false, blank: false
        email nullable: false, email: true
        dataNascimento nullable: false
        matriculas nullable: true  // permite criar aluno sem matrícula inicial
    }

    static mapping = {
        version false
    }
}

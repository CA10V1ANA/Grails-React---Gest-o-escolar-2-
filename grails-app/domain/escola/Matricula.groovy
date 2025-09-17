package escolaa

class Matricula {

    Date dataMatricula
    BigDecimal valorPago

    Aluno aluno
    Curso curso

    static belongsTo = [aluno: Aluno, curso: Curso]  // garante delete em cascata

    static constraints = {
        dataMatricula nullable: false
        valorPago nullable: false, min: 0.0G
        aluno nullable: false
        curso nullable: false
    }

    static mapping = {
        version false
    }
}

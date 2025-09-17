package escolaa

class Curso {

    String titulo
    String descricao
    Integer cargaHoraria

    static hasMany = [matriculas: Matricula]
    static belongsTo = [matricula: Matricula]

    static constraints = {
        titulo nullable: false, blank: false
        descricao nullable: false, blank: false
        cargaHoraria nullable: false, min: 1
        matricula nullable: true  // permite criar curso sem matrícula inicial
    }

    static mapping = {
        version false
    }
}

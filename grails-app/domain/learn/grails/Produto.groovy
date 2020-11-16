package learn.grails

class Produto {
    String nome
    Double preco
    Estoque estoque

//    static hasOne = [estoque: Estoque]

    static hasMany = [clientes: Cliente]

    static belongsTo = [Cliente]

    static constraints = {
    }
}

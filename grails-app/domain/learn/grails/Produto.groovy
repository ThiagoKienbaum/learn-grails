package learn.grails

class Produto {
    String nome
    Double preco
    Estoque estoque

//    static hasOne = [estoque: Estoque]

    static hasMany = [clientes: Cliente, itens: ItemPedido]

    static belongsTo = [Cliente]

    static constraints = {
        nome nullable: false, blank: false
        preco min: new Double(0)
    }

    static mapping = {
        discriminator column: "tipo", value: "GERAL"
    }
}

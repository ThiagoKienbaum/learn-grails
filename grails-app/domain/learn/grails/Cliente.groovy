package learn.grails

class Cliente {
    String nome
    String email
    String senha

    static hasMany = [pedidos:Pedido]

    static constraints = {
    }
}

package learn.grails

class Pedido {
    Date dataHora
    Double valorTotal
    Cliente cliente

    static hasMany = [itens: ItemPedido]

    static constraints = {
    }
}

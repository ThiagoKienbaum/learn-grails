package learn.grails

class ItemPedido {
    Integer quantidade
    Double valorVenda
    String observacao
    Produto produto
    Pedido pedido

    static belongsTo = [Pedido]

    static constraints = {
    }

    static mapping = {
        produto column: "id_produto"
        pedido column: "id_pedido"
    }
}

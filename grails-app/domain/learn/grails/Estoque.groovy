package learn.grails

class Estoque {
    Integer quantidade
    Integer quantidadeMinima
    Produto produto

    static constraints = {
    }

//    static mapping = {
//        table name: "est_estoque"
//        id column: "id_estoque"
//    }
}

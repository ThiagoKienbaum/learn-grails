package learn.grails

class ProdutoController {

    def index() {
        def lista = Produto.list()

        render(view:"/produto/index", model: [produtos: lista])
    }
}

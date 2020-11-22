package learn.grails

class ProdutoController {

    def index() {
        def lista = Produto.list()

        render(view:"/produto/index", model: [produtos: lista])
    }

    def adicionar() {
        Produto novoProduto = new Produto()
        novoProduto.preco = 0
        novoProduto.estoque = new Estoque()
        novoProduto.estoque.quantidade = 0
        novoProduto.estoque.quantidadeMinima = 0

        render(template:"/produto/form", model: [produto: novoProduto])
    }

    def salvar() {
        Produto produto
        if (params.id) {
            produto = Produto.get(params.id)
        } else {
            produto = new Produto()
            produto.estoque = new Estoque()
        }

        produto.nome = params.nome
        produto.preco = params.preco.toDouble()
        produto.estoque.quantidade = params.quantidade.toInteger()
        produto.estoque.quantidadeMinima = params.quantidadeMinima.toInteger()

        produto.validate()
        if (!produto.hasErrors()) {
            produto.save(flush: true)
            render("Produto cadastrado com sucesso")
        } else {
            render("Foram encontrados erros no cadastro")
        }
    }

    def lista() {
        def lista = Produto.list()
        render(template: "/produto/list", model: [produtos: lista])
    }

    def alterar() {
        Produto produto = Produto.get(params.id)

        render(template: "/produto/form", model: [produto: produto])
    }
}

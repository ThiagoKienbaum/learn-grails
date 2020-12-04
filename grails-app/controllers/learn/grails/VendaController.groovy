package learn.grails

import grails.converters.JSON

class VendaController {

    def vendaService

    def index() {
        def produtos = Produto.list()

        render(view: "index", model: [produtos: produtos])
    }

    def salvar() {
        String nome = params.nome
        String email = params.email
        List produtos = params.produto.toList()
        List quantidades = params.quantidade.toList()
        def mensagem = [:]

        try {
            vendaService.salvar(nome, email, produtos, quantidades)
            mensagem.resposta = "OK"
        } catch(Exception excecao) {
            mensagem.resposta = excecao.message
        }
        render mensagem as JSON
    }
}

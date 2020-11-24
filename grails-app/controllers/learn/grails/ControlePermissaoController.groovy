package learn.grails

import core.Permissao
import core.Usuario

class ControlePermissaoController {

    def index() {
        def listaUsuarios = Usuario.list()
        def listaPermissoes = Permissao.list()

        render(view: "/controlePermissao/index", model: [usuarios: listaUsuarios, permissoes: listaPermissoes])
    }

    def salvarUsuario() {

    }
}

package learn.grails

import core.Permissao
import core.Usuario
import grails.converters.JSON

class ControlePermissaoController {

    def index() {
        def listaUsuarios = Usuario.list()
        def listaPermissoes = Permissao.list()

        render(view: "/controlePermissao/index", model: [usuarios: listaUsuarios, permissoes: listaPermissoes])
    }

    def salvarUsuario() {
        Map retorno = [:]

        Usuario usuario = new Usuario()
        usuario.username = params.login
        usuario.enabled = true
        usuario.passwordExpired = false
        usuario.accountExpired = false
        usuario.accountLocked = false
        usuario.password = "1234"
        usuario.validate()

        if (usuario.hasErrors()) {
            retorno.mensagem = "ERRO"
        } else {
            usuario.save(flush: true)
            retorno.mensagem = "OK"
        }

        render retorno as JSON
    }
}

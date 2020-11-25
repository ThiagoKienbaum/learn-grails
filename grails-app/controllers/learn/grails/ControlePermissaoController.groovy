package learn.grails

import core.Permissao
import core.Usuario
import grails.converters.JSON

class ControlePermissaoController {

    def index() {
        def listaPermissoes = Permissao.list()

        render(view: "/controlePermissao/index", model: [permissoes: listaPermissoes])
    }

    def listarUsuario() {
        def listaUsuarios = Usuario.createCriteria().list {
            order("username")
        }

        render(template: "listaUsuarios", model: [usuarios: listaUsuarios])
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

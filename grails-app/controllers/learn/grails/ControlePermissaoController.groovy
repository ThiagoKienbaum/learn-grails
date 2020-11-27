package learn.grails

import core.Permissao
import core.Usuario
import grails.converters.JSON

class ControlePermissaoController {

    def index() {
        render(view: "index")
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

    def getUsuario() {

    }

    def listarUsuario() {
        def listaUsuarios = Usuario.createCriteria().list {
            order("username")
        }
        render(template: "listaUsuarios", model: [usuarios: listaUsuarios])
    }

    def alterarUsuario() {

    }

    def excluirUsuario() {

    }

    def salvarPermissao() {
        Map retorno = [:]


        Permissao permissao

        if (params.id) {
            permissao = Permissao.get(params.id)
        } else {
            permissao = new Permissao()
        }

        permissao.authority = params.permissao
        permissao.validate()

        if (permissao.hasErrors()) {
            retorno.mensagem = "ERRO"
        } else {
            permissao.save(flush: true)
            retorno.mensagem = "OK"
        }
        render retorno as JSON
    }

    def getPermissao() {
        Permissao permissao = Permissao.get(params.id)
        render permissao as JSON
    }

    def listarPermissao() {
        def listaPermissoes = Permissao.createCriteria().list {
            order("authority")
        }
        render(template: "listaPermissoes", model: [permissoes: listaPermissoes])
    }

    def excluirPermissao() {
        Map retorno = [:]
        Permissao permissao = Permissao.get(params.id)
        try {
            permissao.delete()
            retorno.mensagem = "OK"
        } catch(Exception exception) {
            retorno.mensagem = "ERRO"
        }
        render retorno as JSON
    }
}

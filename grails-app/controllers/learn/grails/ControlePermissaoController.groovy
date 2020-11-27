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
        Usuario usuario

        if(params.id) {
            usuario = Usuario.get(params.id)
        } else {
            usuario = new Usuario()
            usuario.enabled = true
            usuario.passwordExpired = false
            usuario.accountExpired = false
            usuario.accountLocked = false
            usuario.password = "1234"
        }

        usuario.username = params.login
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
        Usuario usuario = Usuario.get(params.id)
        render usuario as JSON
    }

    def listarUsuario() {
        def listaUsuarios = Usuario.createCriteria().list {
            order("username")
        }
        render(template: "listaUsuarios", model: [usuarios: listaUsuarios])
    }

    def excluirUsuario() {
        Map retorno = [:]
        Usuario usuario = Usuario.get(params.id)
        try {
            usuario.delete()
            retorno.mensagem = "OK"
        } catch(Exception exception) {
            retorno.mensagem = "ERRO"
        }
        render retorno as JSON
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

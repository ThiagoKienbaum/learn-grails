package learn.grails

class Prato {
    Integer quantidadePessoas

    static constraints = {
        quantidadePessoas min: 1
    }
}

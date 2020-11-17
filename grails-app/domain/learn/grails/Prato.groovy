package learn.grails

class Prato extends Produto {
    Integer quantidadePessoas

    static constraints = {
        quantidadePessoas min: 1
    }

    static mapping = {
        discriminator value: "PRATO"
    }
}

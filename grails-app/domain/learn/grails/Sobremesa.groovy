package learn.grails

class Sobremesa extends Produto {
    Integer calorias

    static constraints = {
        calorias min: 0
    }
}

package learn.grails

class Sobremesa {
    Integer calorias

    static constraints = {
        calorias min: 0
    }
}

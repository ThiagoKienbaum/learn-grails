package learn.grails

class Bebida {
    Double volume
    String unidade

    static constraints = {
        volume min: new Double(0)
        unidade nullable:false, blank: false, inList: ["l", "ml"]
    }
}

package learn.grails

class ConsultaController {
    def index() {
        def lista = []

        //Dynamic finding
        lista = Cliente.findByNome("Maria")
        lista = Cliente.findAllByNome("Maria")
        lista = Cliente.findAllByNomeLike("Ma%")
        lista = Cliente.findAllByNomeIlike("ma%") // Procura todos por nome e ignora o case
        lista = Cliente.findAll().sort{it.nome}
        lista = Bebida.findAllByVolumeGreaterThanAndUnidade(500, "ml")

        //Criteria
        lista = Cliente.createCriteria().list {
            order("nome", "asc")
            ilike("nome", "%Rober%")
        }

        lista = Bebida.createCriteria().list {
            gt("volume", 500d)
            eq("unidade", "ml")
        }

        lista = Sobremesa.createCriteria().list {
            or {
                lt("preco", 5d)

                and {
                    ilike("nome", "%bolo%")
                    gt("calorias", 200)
                }
            }
        }

        lista = Produto.createCriteria().list { //Join
            estoque {
                gt("quantidade", 5)
            }
        }

        lista = Produto.createCriteria().list { //Join
            createAlias("estoque", "est")
            gt("est.quantidade", 5)
        }

        //HQL
        lista = Cliente.executeQuery("select cli from Cliente cli order by nome desc")
        lista = Bebida.executeQuery("select bebida from Bebida bebida where bebida.volume > 500 and unidade='ml'")
        lista = Produto.executeQuery("select produto from Produto produto where produto.estoque.quantidade > 5")


        render(view: "index", model: [lista: lista.nome])
    }
}

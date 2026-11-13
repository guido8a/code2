package code2

class ArticuloController {

    def producto(){
       def articulo = Articulo.get(params.id)
       return [articulo: articulo]
    }

}

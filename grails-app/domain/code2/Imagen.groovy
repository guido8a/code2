package code2

class Imagen {

    Articulo articulo
    String nombre

    static mapping = {
        table 'imag'
        cache usage:'read-write', include:'non-lazy'
        id generator:'identity'
        version false
        columns {
            id              column: 'imag__id'
            articulo         column: 'artc__id'
            nombre          column: 'imagnmbr'
        }
    }
    static constraints = {
        nombre(blank:false,nullable: false, size: 3..255)
    }


}

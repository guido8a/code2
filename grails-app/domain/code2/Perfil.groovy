package code2

class Perfil {

    String nombre

    static constraints = {
        nombre blank: false, unique: true, maxSize: 50
    }

    static mapping = {
        table 'prfl'
        cache usage:'read-write', include:'non-lazy'
        id generator:'identity'
        version false
        columns {
            id              column: 'prfl__id'
            nombre          column: 'prflnmbr'
        }
    }

    String toString() { nombre }
}

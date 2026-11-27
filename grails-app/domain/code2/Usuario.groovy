package code2

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class Usuario {

    String username
    String password
    String nombre
    String email
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false

    Date dateCreated
    Date lastUpdated

    static hasMany = [perfiles: Perfil]

    static constraints = {
        username blank: false, unique: true, size: 3..50
        password blank: false, minSize: 6, maxSize: 255   // ← permite planos y encriptados
        nombre nullable: true, maxSize: 100
        email email: true, nullable: true, maxSize: 255
        enabled nullable: false
        accountExpired nullable: false
        accountLocked nullable: false
        passwordExpired nullable: false
    }

    static mapping = {
        table 'usro'
        version false

        columns {
            id              column: 'usro__id'
            username        column: 'usrouser'
            password        column: 'usropass'
            nombre          column: 'usronmbr'
            email           column: 'usromail'
            enabled         column: 'usroactv'
            accountExpired  column: 'usroacex'
            accountLocked   column: 'usroaclc'
            passwordExpired column: 'usropsex'
            dateCreated     column: 'usrofcrc'
            lastUpdated     column: 'usrofmdf'
        }

        perfiles joinTable: [name: 'usuarios_perfiles', key: 'usro_id', column: 'perfil_id']
    }

//    def beforeInsert() {
//        encriptarPassword()
//    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encriptarPassword()
        }
    }

    private void encriptarPassword() {
        if (password && !password.startsWith('$2')) {
            password = new BCryptPasswordEncoder().encode(password)
        }
    }
}
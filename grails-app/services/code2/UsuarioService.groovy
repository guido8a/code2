
package code2
import grails.gorm.transactions.Transactional
import org.springframework.security.core.userdetails.User
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@Transactional(readOnly = true)
class UsuarioService implements UserDetailsService {

    @Override
    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

       println(">>> loadUserByUsername llamado con: '${username}'")

        def usuario = Usuario.findByUsername(username)

        println(">>> usuario encontrado: ${usuario?.username}")
//        println(">>> password en BD: ${usuario?.password}")
//        println(">>> enabled: ${usuario?.enabled}")

        if (!usuario) {
            throw new UsernameNotFoundException("Usuario no encontrado: ${username}")
        }

        def authorities = usuario.perfiles.collect { new SimpleGrantedAuthority(it.nombre) }

        return new User(
                usuario.username,
                usuario.password,
                usuario.enabled,
                !usuario.accountExpired,
                true,
                !usuario.accountLocked,
                authorities
        )
    }

    @Transactional
    Usuario crearUsuario(String username, String password, String nombre, String email,
                         List<String> perfiles = ['Usuario']) {
        def usuario = new Usuario(
                username: username,
                password: new BCryptPasswordEncoder().encode(password),
                nombre: nombre,
                email: email,
                enabled: true
        )

        perfiles.each { perfilNombre ->
            def perfil = Perfil.findByNombre(perfilNombre)
                    ?: new Perfil(nombre: perfilNombre).save(flush: true)
            usuario.addToPerfiles(perfil)
        }

        if (!usuario.save(flush: true)) {
            throw new RuntimeException("Error al crear usuario: ${usuario.errors}")
        }
        return usuario
    }
}

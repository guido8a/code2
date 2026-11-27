package code2

import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.userdetails.User

class PerfilController {

    def index() {
        def auth = SecurityContextHolder.context.authentication
        if (!auth?.authenticated) {
            redirect(uri: '/login')
            return
        }

        // Obtener los perfiles del usuario
//        def perfiles = auth.authorities.collect { it.authority }
        def perfiles = auth.authorities.collect { it.authority }

        // Si solo tiene uno, no tiene sentido mostrar la pantalla
        if (perfiles.size() <= 1) {
            session.perfilActivo = perfiles[0]
            redirect(uri: '/')
            return
        }

        [perfiles: perfiles, perfilActivo: session.perfilActivo]
    }

    def seleccionar(String perfil) {
        def auth = SecurityContextHolder.context.authentication
        if (!auth?.authenticated) {
            redirect(uri: '/login')
            return
        }

        // Validar que el perfil esté entre los del usuario
        def perfiles = auth.authorities.collect { it.authority }
        if (!perfiles.contains(perfil)) {
            flash.error = "Perfil no válido"
            redirect(action: 'index')
            return
        }

        // Guardar el perfil activo en sesión
        session.perfilActivo = perfil

        // Crear un nuevo Authentication con el perfil activo
        def nuevaAuth = new UsernamePasswordAuthenticationToken(
                auth.principal,
                auth.credentials,
                [new SimpleGrantedAuthority(perfil)]
        )
        SecurityContextHolder.context.authentication = nuevaAuth

        flash.message = "Trabajando como: ${perfil}"
        redirect(uri: '/')
    }
}
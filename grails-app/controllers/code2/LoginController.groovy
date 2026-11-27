package code2

import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder

class LoginController {

    def index() {
        def auth = SecurityContextHolder.context.authentication

        // Si está autenticado Y NO es anónimo → redirige al inicio
        if (auth?.authenticated && !(auth instanceof AnonymousAuthenticationToken)) {
            redirect(uri: '/')
            return
        }

        [params: params]
    }

    def registro() {
        [usuario: new Usuario()]
    }

    def guardarRegistro(String username, String password, String passwordConfirm, String nombre, String email) {
        if (password != passwordConfirm) {
            flash.error = "Las contraseñas no coinciden"
            redirect(action: 'registro')
            return
        }

       if (!username || username.size() < 3) {
            flash.error = "El usuario debe tener al menos 3 caracteres"
            redirect(action: 'registro')
            return
        }
        if (!password || password.size() < 6) {
            flash.error = "La contraseña debe tener al menos 6 caracteres"
            redirect(action: 'registro')
            return
        }
        if (password != passwordConfirm) {
            flash.error = "Las contraseñas no coinciden"
            redirect(action: 'registro')
            return
        }
        if (Usuario.findByUsername(username)) {
            flash.error = "El usuario '${username}' ya existe"
            redirect(action: 'registro')
            return
        }

        try {
            usuarioService.crearUsuario(username, password, nombre, email, ['ROLE_USER'])
            flash.message = "Usuario creado correctamente. Inicia sesión."
            redirect(action: 'index')
        } catch (Exception e) {
            log.error("Error al registrar usuario", e)
            flash.error = "Error al crear usuario: ${e.message}"
            redirect(action: 'registro')
        }
    }
}
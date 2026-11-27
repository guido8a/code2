package code2

import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder

class SecurityTagLib {

    static namespace = "sec"

    /**
     * Renderiza el body si el usuario está autenticado (no anónimo).
     * Uso: <sec:ifLoggedIn>...</sec:ifLoggedIn>
     */
    def ifLoggedIn = { attrs, body ->
        if (estaAutenticado()) {
            out << body()
        }
    }

    /**
     * Renderiza el body si el usuario NO está autenticado.
     * Uso: <sec:ifNotLoggedIn>...</sec:ifNotLoggedIn>
     */
    def ifNotLoggedIn = { attrs, body ->
        if (!estaAutenticado()) {
            out << body()
        }
    }

    /**
     * Muestra el nombre del usuario autenticado.
     * Uso: <sec:username/>
     */
    def username = { attrs ->
        def auth = SecurityContextHolder.context.authentication
        out << (auth?.name ?: '')
    }

    /**
     * Renderiza el body si el usuario tiene TODOS los roles indicados.
     * Uso: <sec:ifAllGranted roles="ROLE_ADMIN,ROLE_USER">...</sec:ifAllGranted>
     */
    def ifAllGranted = { attrs, body ->
        def roles = attrs.roles?.toString()?.split(',')*.trim() ?: []
        def authorities = getAuthorities()
        if (roles && roles.every { authorities.contains(it) }) {
            out << body()
        }
    }

    /**
     * Renderiza el body si el usuario tiene AL MENOS UNO de los roles.
     * Uso: <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_USER">...</sec:ifAnyGranted>
     */
    def ifAnyGranted = { attrs, body ->
        def roles = attrs.roles?.toString()?.split(',')*.trim() ?: []
        def authorities = getAuthorities()
        if (roles && roles.any { authorities.contains(it) }) {
            out << body()
        }
    }

    /**
     * Renderiza el body si el usuario NO tiene NINGUNO de los roles.
     * Uso: <sec:ifNoneGranted roles="ROLE_ADMIN">...</sec:ifNoneGranted>
     */
    def ifNoneGranted = { attrs, body ->
        def roles = attrs.roles?.toString()?.split(',')*.trim() ?: []
        def authorities = getAuthorities()
        if (roles && roles.every { !authorities.contains(it) }) {
            out << body()
        }
    }

    private boolean estaAutenticado() {
        def auth = SecurityContextHolder.context.authentication
        return auth?.authenticated &&
                !(auth instanceof AnonymousAuthenticationToken) &&
                auth.name != 'anonymousUser'
    }

    private List<String> getAuthorities() {
        def auth = SecurityContextHolder.context.authentication
        return auth?.authorities?.collect { it.authority } ?: []
    }
}
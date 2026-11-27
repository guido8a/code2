package code2

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.authentication.dao.DaoAuthenticationProvider
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.web.SecurityFilterChain

@Configuration
@EnableWebSecurity
class SecurityConfig {

    final UsuarioService usuarioService

    SecurityConfig(UsuarioService usuarioService) {
        this.usuarioService = usuarioService
       println(">>> SecurityConfig cargado con UsuarioService")
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
       println(">>> filterChain configurado")
        http
                .authenticationProvider(authenticationProvider())
                .authorizeHttpRequests { auth ->
                    auth
//                            .requestMatchers('/', '/login', '/registro', '/assets/**', '/css/**', '/js/**', '/images/**',
//                                    '/vendor/**', '/fonts/**', '/favicon.ico').permitAll()

                    // ========== PÚBLICAS (sin login) ==========
                            .requestMatchers(
                                    '/',      // index
                                    '/articulo/articulo/**',
                                    '/articulo/servicio/**',
                                    '/acerca',
                                    '/registro',
                                    '/perfil',
                                    '/perfil/**',
                                    '/imagen/**',
                                    '/logout',
                                    '/assets/**',
                                    '/css/**',
                                    '/js/**',
                                    '/images/**',
                                    '/vendor/**',
                                    '/fonts/**',
                                    '/favicon.ico',
                                    '/error',
                                    '/notFound',
                                    '/*/_ajax',
                                    '/*/*_ajax',
                                    '/*/*/*_ajax'
                            ).permitAll()

//                    // ========== PROTEGIDAS (con login) ==========
//                            .requestMatchers(
//                                    '/articulo/list',       // gestión de artículos
//                                    '/seccion/list',                 // gestión de secciones
//                                    '/descargas',                   // descargas
//                            ).authenticated()

                    // ========== SOLO ADMIN ==========
                            .requestMatchers('/articulo/list','/seccion/list').hasAnyAuthority('Administrador')

                    // ========== SOLO USUARIO ==========
//                            .requestMatchers('/descargas' ).hasAnyAuthority('Usuario')

                    // Ambos roles
                            .requestMatchers('/descargas').hasAnyAuthority('Usuario', 'Administrador')

                    // ========== LO DEMÁS: requiere login ==========
                            .anyRequest().authenticated()

                }
                .formLogin { form ->
                    form
                            .loginPage('/login')
                            .loginProcessingUrl('/login')
                            .successHandler { request, response, authentication ->
                                // Redirigir a selección de perfil si tiene varios
                                def perfiles = authentication.authorities.collect { it.authority }
                                println("--- perfiles " + perfiles)
                                if (perfiles.size() > 1) {
                                    response.sendRedirect("/perfil")
                                } else {
                                    request.session.setAttribute("perfilActivo", perfiles[0])
                                    response.sendRedirect("/")
                                }
                            }

//                            .defaultSuccessUrl('/', true)
                            .failureUrl('/login?error=true')
                            .usernameParameter('username')
                            .passwordParameter('password')
                            .permitAll()
                }
                .logout { logout ->
                    logout
                            .logoutUrl('/logout')
                            .logoutSuccessUrl('/')
                            .invalidateHttpSession(true)
                            .deleteCookies('JSESSIONID')
                            .permitAll()
                }
                .csrf { csrf -> csrf.disable() }

                .exceptionHandling { ex ->
                    ex.accessDeniedPage('/denegado')
                }
        return http.build()
    }

    @Bean
    DaoAuthenticationProvider authenticationProvider() {
        println(">>> DaoAuthenticationProvider configurado")
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider()
        provider.setUserDetailsService(usuarioService)
        provider.setPasswordEncoder(passwordEncoder())
        return provider
    }

    @Bean
    PasswordEncoder passwordEncoder() {
       println(">>> PasswordEncoder configurado")
        return new BCryptPasswordEncoder()
    }
}
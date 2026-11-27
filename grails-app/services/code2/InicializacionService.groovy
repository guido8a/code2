package code2

import grails.gorm.transactions.Transactional

@Transactional
class InicializacionService {

    def usuarioService

    void crearDatosIniciales() {
        // Crear perfiles si no existen
        ['Administrador', 'Usuario'].each { perfilNombre ->
            if (!Perfil.findByNombre(perfilNombre)) {
                new Perfil(nombre: perfilNombre).save(flush: true)
                println ">>> Perfil creado: ${perfilNombre}"
            }
        }

        // Crear usuario admin si no existe
        if (!Usuario.findByUsername('admin')) {
            usuarioService.crearUsuario(
                    'admin',
                    'admin123',
                    'Administrador',
                    'admin@tedein.com.ec',
                    ['Administrador', 'Usuario']
            )
            println ">>> Usuario admin creado"
        }
    }
}
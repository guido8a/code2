//package code2
//
//class BootStrap {
//
//    def init = {
//    }
//
//    def destroy = {
//    }
//
//}

//package code2
//import grails.gorm.transactions.Transactional

//@Transactional
//class BootStrap {
//
//    def usuarioService
//
//    def init = { servletContext ->
//        // Crear perfiles si no existen
//        ['Administrador', 'Usuario'].each { perfilNombre ->
//            if (!Perfil.findByNombre(perfilNombre)) {
//                new Perfil(nombre: perfilNombre).save(flush: true)
//            }
//        }
//
//        // Crear usuario admin si no existe
//        if (!Usuario.findByUsername('admin')) {
//            usuarioService.crearUsuario(
//                    'admin',
//                    'admin123',
//                    'Administrador',
//                    'admin@tedein.com.ec',
//                    ['Administrador', 'Usuario']
//            )
//            println ">>> Usuario admin creado: admin / admin123"
//        }
//    }
//
//    def destroy = {
//    }
//}

package code2

class BootStrap {

    def inicializacionService

    def init = { servletContext ->
        inicializacionService.crearDatosIniciales()
    }

    def destroy = {
    }
}
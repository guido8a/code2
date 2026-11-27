//package code2
//
//class UrlMappings {
//    static mappings = {
////        "/$namespace/$controller/$action?/$id?(.$format)?" {}
////        "/$controller/$action?/$id?(.$format)?"{
////            constraints {
////                // apply constraints here
////            }
////        }
//
////        "/index"(controller: "/", action: "index")
//        "/login"(controller: "login", action: "index")
//        "/registro"(controller: "login", action: "registro")
//        "/logout"(uri: "/logout")
//
//        "/"(view:"/index")
//        "500"(view:'/error')
//        "404"(view:'/notFound')
//
//    }
//}

package code2

class UrlMappings {
    static mappings = {
        // Mapeos específicos PRIMERO
//        "/login"(controller: "login", action: "index")
//        "/registro"(controller: "login", action: "registro")
//        "/logout"(uri: "/logout")
//
//        // Raíz
//        "/"(view: "/index")
//
//        // Mapeo genérico (OBLIGATORIO)
//        "/$controller/$action?/$id?(.$format)?" {}
//
//        // Errores
//        "500"(view: '/error')
//        "404"(view: '/notFound')

        // Públicas
        "/"(view: "/index")
        "/denegado"(view: "/denegado")
        "/acerca"(controller: "articulo", action: "acerca")
        "/articulo/articulo"(controller: "articulo", action: "articulo")
        "/articulo/servicio"(controller: "articulo", action: "servicio")
        "/perfil"(controller: "perfil", action: "index")
        "/perfil/seleccionar"(controller: "perfil", action: "seleccionar")

        // Login
        "/login"(controller: "login", action: "index")
        "/articulo/list"(controller: "articulo", action: "list")
        "/seccion/list"(controller: "seccion", action: "list")
        "/registro"(controller: "login", action: "registro")
        "/logout"(uri: "/logout")

        // Genérico
        "/$controller/$action?/$id?(.$format)?" {}

        // Errores
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}

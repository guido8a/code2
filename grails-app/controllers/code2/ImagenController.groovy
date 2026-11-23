package code2

import grails.gorm.transactions.Transactional

class ImagenController {

    def mostrarImagen() {
        // Obtener la ruta (relativa a /var/tedein/imagenes/)
        String ruta = params.ruta ?: "${params.carpeta}/${params.nombre}"

        // Seguridad: evitar path traversal
        if (!ruta || ruta.contains('..')) {
            response.status = 400
            render "Ruta inválida"
            return
        }

        File base = new File('/var/tedein/imagenes')
        File archivo = new File(base, ruta)

        // Verificar que esté dentro de la carpeta base (seguridad)
        if (!archivo.canonicalPath.startsWith(base.canonicalPath)) {
            response.status = 403
            render "Acceso denegado"
            return
        }

        if (!archivo.exists() || !archivo.isFile()) {
            response.status = 404
            render "Imagen no encontrada"
            return
        }

        // Detectar content-type por extensión
        String ext = archivo.name.tokenize('.').last().toLowerCase()
        String contentType = [
                'jpg' : 'image/jpeg',
                'jpeg': 'image/jpeg',
                'png' : 'image/png',
                'gif' : 'image/gif',
                'webp': 'image/webp',
                'svg' : 'image/svg+xml',
                'bmp' : 'image/bmp',
                'ico' : 'image/x-icon'
        ][ext] ?: 'application/octet-stream'

        response.setContentType(contentType)
        response.setHeader("Cache-Control", "public, max-age=86400")  // 1 día
        response.setContentLengthLong(archivo.length())
        response.outputStream << archivo.bytes
        response.outputStream.flush()
    }

    @Transactional
    def guardarOrden_ajax(){
        def imagen = Imagen.get(params.id)
        def articulo = imagen.articulo
        def existeOrden = Imagen.findAllByArticuloAndOrdenAndIdNotEqual(articulo, params.valor as Integer, imagen?.id)

        if(existeOrden){
            render "no_El numero de orden ya fue asignado a otra imagen"
        }else{
            imagen.orden = params.valor as Integer
            imagen.save(flush:true)
            render "ok_Orden guardado correctamente"
        }

    }

}

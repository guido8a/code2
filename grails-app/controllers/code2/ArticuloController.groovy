package code2
import grails.gorm.transactions.Transactional

class ArticuloController {

    def articulo(){
       def articulo = Articulo.get(params.id)
       return [articulo: articulo]
    }

    def list(){
    }

    def tablaArticulos_ajax(){
        def seccion = Seccion.get(params.seccion)
        def articulos = Articulo.findAllBySeccion(seccion).sort{it.orden}
        return [articuloInstanceList: articulos, seccion: seccion]
    }

    def form_ajax(){
        def articulo

        if(params.id){
            articulo = Articulo.get(params.id)
        }else{
            articulo = new Articulo()
        }

        return [artc: articulo]
    }

    @Transactional
    def guardarArticulo_ajax () {
//        println("params articulo " + params)

        def articuloInstance
        def seccion = Seccion.get(params.seccion)

        if(params.id){
            articuloInstance = Articulo.get(params.id)
        } else {
            articuloInstance = new Articulo()
            articuloInstance.fecha = new Date()
        }
        articuloInstance.properties = params
        articuloInstance.seccion = seccion

        if(!articuloInstance.save(flush:true)){
            println("error al guardar el articulo " + articuloInstance.errors)
            render "no_Error al guardar el artículo"
        }else{
            render "ok_Artículo guardado correctamente"
        }
    }

    def show_ajax(){
        def articulo = Articulo.get(params.id)
        return [artc: articulo]
    }

    def imagenes_ajax(){
        def articulo = Articulo.get(params.id)
        return [articulo: articulo]
    }

    def tablaImagenes_ajax(){
        def articulo = Articulo.get(params.id)
        def imagenes = Imagen.findAllByArticulo(articulo).sort{it.orden}
        return [articulo: articulo, imagenes: imagenes]
    }

    @Transactional
    def uploadImagenesArticulo() {
       println("params cia " + params)
//        System.err.println(">>> DEBUG: guardarArticulo_ajax ejecutado")
//        log.error(">>> DEBUG: guardarArticulo_ajax ejecutado (log.error)")

        def acceptedExt = ["jpg", "png", "jpeg"]
        def articulo = Articulo.get(params.id)
        def path = "/var/tedein/imagenes/articulo_${articulo?.id}/"
        new File(path).mkdirs()

        def f = request.getFile('file')  //archivo = name del input type file
        if (f && !f.empty) {
            def fileName = f.getOriginalFilename() //nombre original del archivo
            def ext =''
            def parts = fileName.split("\\.")
            fileName = ""
            parts.eachWithIndex { obj, i ->
                if (i < parts.size() - 1) {
                    fileName += obj
                } else {
                    ext = obj
                }
            }
            if (acceptedExt.contains(ext?.toLowerCase())) {
                fileName = fileName + "." + ext.toLowerCase()
                def pathFile = path + fileName
                def file = new File(pathFile)
                println "subiendo archivo: $fileName"

                def imagenExiste = Imagen.findByArticuloAndNombre(articulo, fileName)
                def old = imagenExiste?.nombre

                if (old && old.trim() != "") {
                    def oldPath = path + old
                    def oldFile = new File(oldPath)
                    if (oldFile.exists()) {
                        oldFile.delete()
                    }
                }

                f.transferTo(file)

                def ultimoOrden
                def maxOrden = Imagen.createCriteria().get {
                    eq('articulo', articulo)
                    projections {
                        max('orden')
                    }
                } ?: 0
                int siguienteOrden = (maxOrden as Integer) + 1

                if(!imagenExiste){
                    def nuevaImagen = new Imagen()
                    nuevaImagen.articulo = articulo
                    nuevaImagen.nombre = fileName
                    nuevaImagen.orden = siguienteOrden
                    nuevaImagen.save(flush: true)
                }else{
                    imagenExiste.nombre = fileName
                    imagenExiste.save(flush: true)
                }

                render "ok_Imagen subida correctamente"

            } else {
                render "no_Seleccione una imagen JPG, JPEG, PNG"
            }
        } else {
            render "no_Seleccione una imagen JPG, JPEG, PNG"
        }
    }

    @Transactional
    def borrarImagenArticulo_ajax(){
       def imagen = Imagen.get(params.id)

        if(imagen){
            try{

                def old = imagen.nombre
                if (old && old.trim() != "") {
                    def oldPath = "/var/tedein/imagenes/articulo_${imagen?.articulo?.id}/" + old
                    def oldFile = new File(oldPath)
                    if (oldFile.exists()) {
                        oldFile.delete()
                    }
                }

                imagen.delete(flush:true)
                render "ok_Imagen borrada correctamente"

            }catch(e){
                println("error al borrar la imagen " + imagen.errors + e)
                render "no_Error al borrar la imagen"
            }
        }else{
            render "no_No se encontró la imagen"
        }
    }

    @Transactional
    def borrarArticulo_ajax(){

        def articulo = Articulo.get(params.id)

        try{
            articulo.delete(flush: true)
            render "ok_Artículo borrado correctamente"
        }catch (e){
            println("Error al borrar el artículo " + articulo.errors + e)
            render "no_Error al borrar el artículo"
        }
    }

    def servicio(){
        def articulo = Articulo.get(params.id)
        return [articulo: articulo]
    }

    def acerca(){
        def articulo = Articulo.get(params.id)
        return [articulo: articulo]
    }

    def producto_list(){

    }

    def servicio_list(){

    }

    def descargas(){
        def seccion = Seccion.get(12)
        def descargas = Articulo.findAllBySeccionAndDestacado(seccion, 'S').sort{it.orden}
        return [descargas: descargas]
    }

    def archivo_ajax(){
        def articulo = Articulo.get(params.id)
        return [articulo: articulo]
    }

    def tablaArchivos_ajax(){
        def articulo = Articulo.get(params.id)
        return [articulo: articulo]
    }

    @Transactional
    def uploadArchivoArticulo() {
//        println("params ca " + params)

        def articulo = Articulo.get(params.id)
        def path = "/var/tedein/archivos/articulo_${articulo?.id}/"
        new File(path).mkdirs()

        def f = request.getFile('file')  //archivo = name del input type file
        if (f && !f.empty) {
            def fileName = f.getOriginalFilename() //nombre original del archivo
            def ext =''
            def parts = fileName.split("\\.")
            fileName = ""
            parts.eachWithIndex { obj, i ->
                if (i < parts.size() - 1) {
                    fileName += obj
                } else {
                    ext = obj
                }
            }
                fileName = fileName + "." + ext.toLowerCase()
                def pathFile = path + fileName
                def file = new File(pathFile)
                println "subiendo archivo: $fileName"

                def archivoExiste = articulo?.archivo
                def old = archivoExiste

                if (old && old.trim() != "") {
                    def oldPath = path + old
                    def oldFile = new File(oldPath)
                    if (oldFile.exists()) {
                        oldFile.delete()
                    }
                }

                f.transferTo(file)

                 articulo.archivo = fileName
                 articulo.save(flush: true)

                render "ok_Archivo subido correctamente"


        } else {
            render "no_Seleccione un archivo"
        }
    }

    @Transactional
    def borrarArchivo_ajax(){
        def articulo = Articulo.get(params.id)

        if(articulo){
            try{

                def old = articulo?.archivo
                if (old && old.trim() != "") {
                    def oldPath = "/var/tedein/archivos/articulo_${articulo?.id}/" + old
                    def oldFile = new File(oldPath)
                    if (oldFile.exists()) {
                        oldFile.delete()
                    }
                }

                articulo.archivo = null
                articulo.save(flush:true)
                render "ok_Archivo borrado correctamente"

            }catch(e){
                println("error al borrar el archivo " + articulo.errors + e)
                render "no_Error al borrar el archivo"
            }
        }else{
            render "no_No se encontró el artículo"
        }
    }

    @Transactional
    def descargarArchivo(){
        def articulo = Articulo.get(params.id)
        def archivo = articulo.archivo
        def path = "/var/tedein/archivos/articulo_${articulo?.id}/" + archivo

        println("id " + articulo?.id)
        println("archivo " + articulo?.archivo)
        println("path " + path)

        def file = new File(path)
        if (file.exists()) {
            def b = file.getBytes()

            def ext = articulo.archivo.split("\\.")
            ext = ext[ext.size() - 1]

//            def ext = archivo.name.tokenize('.').last().toLowerCase()
            def contentType = servletContext.getMimeType(archivo) ?: 'application/octet-stream'
            response.setContentType(contentType)

//            response.setContentType(ext == 'pdf' ? "application/pdf" : "image/" + ext)
            response.setHeader("Content-disposition", "attachment; filename=" + articulo.archivo)
            response.setContentLength(b.length)
            response.getOutputStream().write(b)
        } else {
            render "no_No se encontró el archivo " + "_ " + articulo?.archivo
        }
    }

}



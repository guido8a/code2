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
        return [articuloInstanceList: articulos]
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
        println("---------- " + params)

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
        def imagenes = Imagen.findAllByArticulo(articulo)
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

                if(!imagenExiste){
                    def nuevaImagen = new Imagen()
                    nuevaImagen.articulo = articulo
                    nuevaImagen.nombre = fileName
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
}

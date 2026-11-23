package code2
import grails.gorm.transactions.Transactional

class SeccionController {

    def list(){

    }

    def tablaSeccion_ajax(){
        def secciones = Seccion.list().sort{it.orden}
        return [secciones: secciones]
    }

    def show_ajax(){
        def seccion = Seccion.get(params.id)
        return [seccion: seccion]
    }

    def form_ajax(){
        def seccion

        if(params.id){
            seccion = Seccion.get(params.id)
        }else{
            seccion = new Seccion()
        }
        return [seccion: seccion]
    }

        @Transactional
    def guardarSeccion_ajax(){
//        println("params seccion " + params)

        def seccion

        if(params.id){
            seccion = Seccion.get(params.id)
        } else {
            seccion = new Seccion()
        }
        seccion.properties = params

        if(!seccion.save(flush:true)){
            println("error al guardar la sección " + seccion.errors)
            render "no_Error al guardar la sección"
        }else{
            render "ok_Sección guardada correctamente"
        }
    }

    @Transactional
    def borrarSeccion_ajax(){

        def seccion = Seccion.get(params.id)

        try{
            seccion.delete(flush: true)
            render "ok_Sección borrada correctamente"
        }catch (e){
            println("Error al borrar la sección " + seccion.errors + e)
            render "no_Error al borrar la sección"
        }
    }

}

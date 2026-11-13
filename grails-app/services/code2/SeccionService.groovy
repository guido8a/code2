package code2

import grails.gorm.services.Service

@Service(Seccion)
interface SeccionService {

    Seccion get(Serializable id)

    List<Seccion> list(Map args)

    Long count()

    void delete(Serializable id)

    Seccion save(Seccion seccion)

}
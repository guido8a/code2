package code2

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SeccionServiceSpec extends Specification {

    SeccionService seccionService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Seccion(...).save(flush: true, failOnError: true)
        //new Seccion(...).save(flush: true, failOnError: true)
        //Seccion seccion = new Seccion(...).save(flush: true, failOnError: true)
        //new Seccion(...).save(flush: true, failOnError: true)
        //new Seccion(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //seccion.id
    }

    void "test get"() {
        setupData()

        expect:
        seccionService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Seccion> seccionList = seccionService.list(max: 2, offset: 2)

        then:
        seccionList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        seccionService.count() == 5
    }

    void "test delete"() {
        Long seccionId = setupData()

        expect:
        seccionService.count() == 5

        when:
        seccionService.delete(seccionId)
        sessionFactory.currentSession.flush()

        then:
        seccionService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Seccion seccion = new Seccion()
        seccionService.save(seccion)

        then:
        seccion.id != null
    }
}

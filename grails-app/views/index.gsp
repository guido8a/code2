<%@ page import="code2.Articulo; code2.Seccion" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inicio - TEDEIN</title>
</head>
<body>
<!-- Header con imagen de portada -->
<header class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 align-items-center justify-content-center">
            <div class="col-lg-8 col-xl-7 col-xxl-6">
                <div class="my-5 text-center text-xl-start">
                    <div class="d-flex align-items-center justify-content-center justify-content-xl-start my-5">
                        <img class="me-3"
                             style="height: 60px;"
                             src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 1)?.nombre}"])}"
                             alt="Logo" />
                        <h1 class="display-5 fw-bolder text-white mb-0">
                            TEDEIN S.A.
                        </h1>
                    </div>
                    <p class="lead fw-normal text-white-50 mb-4">
                        Tecnología para el Desarrollo Integral
                    </p>
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                        <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#productos">Nuestros Productos</a>
                        <a class="btn btn-outline-light btn-lg px-4" href="#informacion">Más información</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                <img class="img-fluid rounded-3 my-5"
                     src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 2)?.nombre}"])}"
                     alt="Fondo Tedein" />
            </div>
        </div>
    </div>
</header>

<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">NUESTROS <br/> SERVICIOS.</h2></div>
            <div class="col-lg-8">
                <div class="row gx-5 row-cols-1 row-cols-md-2">
                    <g:if test="${code2.Articulo.findAllByDestacadoAndSeccion('S', code2.Seccion.get(2))}">
                        <g:each in="${code2.Articulo.findAllByDestacadoAndSeccion('S', code2.Seccion.get(2))[0..3]}" var="servicio" >
                            <div class="col mb-5 h-100">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                <a class="text-decoration-none link-dark" id="servicio_${servicio?.id}"
                                   href="${createLink(controller: 'articulo', action: 'servicio', params: [id: servicio?.id])}">
                                    <h2 class="h5">${servicio?.titulo}</h2>
                                    <p class="mb-0">${servicio?.subtitulo}</p>
                                </a>
                            </div>
                        </g:each>
                    </g:if>
                </div>
            </div>
        </div>
        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
            <a class="btn btn-primary btn-lg px-4 me-sm-3" href="${createLink(controller: 'articulo', action: 'servicio_list')}">Más servicios</a>
        </div>
    </div>
</section>
<!-- Testimonial section-->
<div class="py-5 bg-light">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-10 col-xl-7">
                <div class="text-center">
                    <div class="fs-4 mb-4 fst-italic">"Usamos la tecnología para que
                    nuestros clientes cuenten con una solución de software que
                    les permita contar con una herramienta útil y eficaz para sus procesos."
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <img class="me-3"
                             style="height: 30px;"
                             src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 1)?.nombre}"])}"
                             alt="Logo" />
                        <div class="fw-bold">
                            TEDEIN S.A.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog preview section-->
<section class="py-5" id="productos">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-8 col-xl-6">
                <div class="text-center">
                    <h2 class="fw-bolder">NUESTROS PRODUCTOS <br/> Software </h2>
                    <p class="lead fw-normal text-muted mb-5">Sistemas basados en Software Libre - Plataforma Web.</p>
                </div>
            </div>
        </div>
        <div class="row gx-5">
            <g:if test="${code2.Articulo.findAllByDestacadoAndSeccion('S', Seccion.get(3))}">
                <g:each in="${code2.Articulo.findAllByDestacadoAndSeccion('S', Seccion.get(3))[0..2]}" var="articulo" >
                    <div class="col-lg-4 mb-5">
                        <div class="card h-100 shadow border-0">
                            <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo?.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 1)?.nombre}"])}"
                                 alt="Imagen principal"
                                 class="icard-img-top"/>
                            <div class="card-body p-4">
                                <div class="badge bg-primary bg-gradient rounded-pill mb-2">Sistema Web</div>
                                <a class="text-decoration-none link-dark stretched-link"
                                   href="${createLink(controller: 'articulo', action: 'articulo', params: [id: articulo?.id])}">
                                    <h5 class="card-title mb-3">${articulo?.titulo}</h5>
                                </a>
                                <p class="card-text mb-0"> ${articulo?.subtitulo}</p>
                            </div>
                            <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                <div class="d-flex align-items-end justify-content-between">
                                    <g:if test="${articulo?.cliente}">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle img-fluid w-5 h-5 me-3"
                                                 style="width: 40px; height: 40px; object-fit: cover;"
                                                 src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 1)?.nombre}"])}"
                                                 alt="Logo" />
                                            <div class="small">
                                                <div class="fw-bold">Nuestros clientes:</div>
                                                <div class="text-muted">${articulo?.cliente ?: ''}</div>
                                            </div>
                                        </div>
                                    </g:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:each>
            </g:if>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="${createLink(controller: 'articulo', action: 'producto_list')}">Más productos</a>
            </div>
        </div>
        <!-- Call to action-->
        <section class="py-2" id="informacion">
            <aside class="bg-dark rounded-3 p-4 p-sm-5 mt-5">
                <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                    <div class="mb-4 mb-xl-0">
                        <div class="fs-4 fw-bold text-white">Contáctenos</div>
                        <div class="text-white">Tienes alguna pregunta? Llámanos o escríbenos</div>
                    </div>
                    <div class="mb-2">
                        <div class="text-white"><strong><i class="fa fa-phone"></i> Teléfonos:</strong> 02-501-9108 / 098 491 6620</div>
                        <p class="text-white mb-0">
                            <i class="bi bi-geo-alt me-1 text-primary"></i>
                            Quito, Ecuador
                        </p>
                    </div>
                    <div class="ms-xl-4">
                        <div class="d-grid gap-2">
                            <a href="mailto:soporte@tedein.com.ec"
                               class="btn btn-outline-primary btn-sm">
                                <i class="bi bi-envelope me-1"></i>
                                soporte@tedein.com.ec
                            </a>
                            <a href="mailto:informacion@tedein.com.ec"
                               class="btn btn-outline-primary btn-sm">
                                <i class="bi bi-envelope me-1"></i>
                                informacion@tedein.com.ec
                            </a>
                        </div>
                    </div>
                </div>
            </aside>
        </section>
    </div>
</section>

</body>
</html>
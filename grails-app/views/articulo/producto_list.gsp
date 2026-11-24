<%@ page import="code2.Seccion; code2.Imagen" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de productos - TEDEIN</title>
</head>
<body class="d-flex flex-column">

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
            <g:if test="${code2.Articulo.findAllBySeccion(Seccion.get(3))}">
                <g:each in="${code2.Articulo.findAllBySeccion(Seccion.get(3)).sort{it.orden}}" var="articulo" >
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
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle img-fluid w-5 h-5 me-3"
                                             style="width: 40px; height: 40px; object-fit: cover;"
                                             src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 1)?.nombre}"])}"
                                             alt="Logo" />
                                        <div class="small">
                                            <div class="fw-bold">Nuestros clientes:</div>
                                            <div class="text-muted">Prefectura de Pichincha</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:each>
            </g:if>
        </div>
    </div>
</section>

</body>
</html>
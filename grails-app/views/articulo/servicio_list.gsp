<%@ page import="code2.Seccion; code2.Imagen" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de servicios - TEDEIN</title>
</head>
<body class="d-flex flex-column">

<section class="py-5" id="servicios">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-8 col-xl-6">
                <div class="text-center">
                    <h2 class="fw-bolder">NUESTROS SERVICIOS </h2>
                </div>
            </div>
        </div>
        <div class="row gx-5">
            <g:if test="${code2.Articulo.findAllBySeccion(Seccion.get(2))}">
                <g:each in="${code2.Articulo.findAllBySeccion(Seccion.get(2)).sort{it.orden}}" var="articulo" >
                    <div class="col-lg-4 mb-5">
                        <div class="card h-100 shadow border-0">
                            <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo?.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 1)?.nombre}"])}"
                                 alt="Imagen principal"
                                 class="icard-img-top"/>
                            <div class="card-body p-4">
                                <div class="badge bg-primary bg-gradient rounded-pill mb-2">Servicio</div>
                                <a class="text-decoration-none link-dark stretched-link"
                                   href="${createLink(controller: 'articulo', action: 'servicio', params: [id: articulo?.id])}">
                                    <h5 class="card-title mb-3">${articulo?.titulo}</h5>
                                </a>
                                <p class="card-text mb-0"> ${articulo?.subtitulo}</p>
                            </div>
                            <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                <div class="d-flex align-items-end justify-content-between">
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
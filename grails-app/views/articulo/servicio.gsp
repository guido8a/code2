<%@ page import="code2.Imagen" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${articulo?.titulo} - TEDEIN</title>
</head>
<body class="d-flex flex-column">
<!-- Header-->
<header class="py-5">
    <div class="container px-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-xxl-6">
                <div class="text-center my-5">
                    <h1 class="fw-bolder mb-3">${articulo?.titulo}</h1>
                    <p class="lead fw-normal text-muted mb-4">${articulo?.subtitulo}</p>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- About section one-->
<section class="py-5 bg-light" id="scroll-target">
    <div class="container px-5 my-5">
        <div class="row gx-5 align-items-center">
            <div class="col-lg-4">
                <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo?.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 1)?.nombre}"])}"
                     alt="Principal"
                     class="img-fluid rounded mb-5 mb-lg-0"/>
            </div>
            <div class="col-lg-7">
                <h2 class="fw-bolder">Qué hacemos?</h2>
                <p class="lead fw-normal text-muted mb-0">${articulo?.descripcion}</p>
            </div>
        </div>
    </div>
</section>
<!-- About section two-->
<section class="py-5">
    <div class="container px-5 my-5">
        <div class="row gx-5 align-items-center">
            <div class="col-lg-4 order-first order-lg-last">
                <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo?.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 2)?.nombre}"])}"
                     alt="Principal"
                     class="img-fluid rounded mb-5 mb-lg-0"/>
            </div>
            <div class="col-lg-7">
                <h2 class="fw-bolder">Cómo lo hacemos?</h2>
                <p class="lead fw-normal text-muted mb-0">${raw(articulo?.texto)}</p>
            </div>
        </div>
    </div>
</section>
<div class="d-flex justify-content-center mb-5">
    <a class="btn btn-primary btn-lg px-4" href="${createLink(controller: 'articulo', action: 'servicio_list')}">
        <i class="fa fa-handshake"></i> Más servicios
    </a>
</div>
</body>
</html>
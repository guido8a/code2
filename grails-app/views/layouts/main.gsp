<%@ page import="code2.Seccion" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title><g:layoutTitle default="TEDEIN"/></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <asset:stylesheet src="styles.css"/>
    <asset:stylesheet src="fontawesome.min.css"/>
    %{--    <asset:javascript src="jquery-3.3.1.min.js"/>--}%
    <asset:javascript src="jquery-3.7.0.min.js"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <asset:javascript src="all.min.js"/>
    %{--    <asset:javascript src="application.js"/>--}%
    <g:layoutHead/>

    <style>

    .navbar {
        position: relative;
        z-index: 1030;
    }

    .navbar .dropdown-menu {
        z-index: 1050;
    }

    .dropdown-menu {
        z-index: 1050 !important;
    }

    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="${createLink(uri: '/')}">
            <img class="me-3"
                 style="height: 30px;"
                 src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 1)?.nombre}"])}"
                 alt="Logo" />
            TEDEIN S.A.</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <g:link class="nav-link" uri="/"><i class="fa fa-bookmark"></i> Inicio</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="articulo" action="acerca" params="[id: 2]"><i class="fa fa-eye"></i> Acerca</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="articulo" action="descargas"><i class="fa fa-download"></i> Descargas</g:link>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-handshake"></i> Servicios</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <g:each in="${code2.Articulo.findAllBySeccion(code2.Seccion.get(2)).sort {it.orden}}" var="articulo" >
                            <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'servicio', params: [id: articulo?.id])}">${articulo?.titulo}</a></li>
                        </g:each>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-house-laptop"></i> Productos</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <g:each in="${code2.Articulo.findAllBySeccion(code2.Seccion.get(3)).sort {it.orden}}" var="articulo" >
                            <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'articulo', params: [id: articulo?.id])}">${articulo?.titulo}</a></li>
                        </g:each>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenido dinámico -->
<g:layoutBody/>

<!-- Footer (copiado del template) -->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">TEDEIN S.A. 2026</div>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
%{--<asset:javascript src="jquery-3.3.1.min.js"/>--}%
%{--<asset:javascript src="jquery-3.7.0.min.js"/>--}%
<asset:javascript src="jquery.validate.min.js"/>

<asset:javascript src="bootbox.min.js"/>
<asset:javascript src="scripts.js"/>
<asset:javascript src="application.js"/>
<g:pageProperty name="page.scripts"/>


</body>
</html>
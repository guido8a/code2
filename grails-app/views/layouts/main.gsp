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
    <g:layoutHead/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="${createLink(uri: '/')}">TEDEIN S.A.</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <g:link class="nav-link" uri="/">Inicio</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="about">Acerca</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="contact">Contacto</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="contact">Descargas</g:link>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Servicios</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="blog-home.html">Sistemas Web</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">Sistemas Expertos</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">Manejadores de contenidos</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">Consultoría</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">Capacitación</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">Cursos y Talleres</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Productos</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 5])}">Gestión de Obras</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 8])}">Gestión de Trámites</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 4])}">Administración de Consultorios</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 1])}">Evaluación Docentes</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 9])}">Bitácora de conocimientos</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 15])}">Administración de política pública</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 21])}">Administración de condominios</a></li>
                        <li><a class="dropdown-item" href="${createLink(controller: 'articulo', action: 'producto', params: [id: 22])}">Sistema de contabilidad</a></li>
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
<asset:javascript src="scripts.js"/>
%{--<g:pageProperty name="page.scripts"/>--}%
</body>
</html>
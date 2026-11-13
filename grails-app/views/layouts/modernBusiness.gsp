<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title><g:layoutTitle default="Portal Informativo"/></title>

    <!-- Bootstrap Icons (CDN oficial recomendado por Start Bootstrap) -->
    <link href="https://jsdelivr.net" rel="stylesheet"/>

    <!-- CSS de Modern Business (incluye Bootstrap 5) -->
    <asset:stylesheet src="modern-business.css"/>

    <g:layoutHead/>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Barra de navegación superior -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <g:link uri="/" class="navbar-brand">Mi Portal Informativo</g:link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><g:link uri="/" class="nav-link">Inicio</g:link></li>
                    <li class="nav-item"><g:link controller="noticia" action="index" class="nav-link">Noticias</g:link></li>
                    <li class="nav-item"><g:link controller="institucional" action="nosotros" class="nav-link">Nosotros</g:link></li>
                    <li class="nav-item"><g:link controller="institucional" action="preguntas" class="nav-link">Preguntas Frecuentes</g:link></li>
                    <li class="nav-item"><g:link controller="contacto" action="index" class="nav-link">Contacto</g:link></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenido dinámico de cada página -->
    <g:layoutBody/>
</main>

<!-- Pie de página -->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">Copyright &copy; Mi Portal Informativo 2026</div>
            </div>
            <div class="col-auto">
                <g:link controller="institucional" action="privacidad" class="link-light small">Privacidad</g:link>
                <span class="text-white mx-1">&middot;</span>
                <g:link controller="institucional" action="terminos" class="link-light small">Términos</g:link>
                <span class="text-white mx-1">&middot;</span>
                <g:link controller="contacto" action="index" class="link-light small">Contacto</g:link>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JS (CDN) + JS propio de Modern Business -->
<script src="https://jsdelivr.net"></script>
<asset:javascript src="modern-business.js"/>
</body>
</html>

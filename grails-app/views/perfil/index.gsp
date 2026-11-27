<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Seleccionar perfil - TEDEIN</title>
</head>
<body>
<section class="py-5 bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body p-4 p-md-5">

                        <div class="text-center mb-4">
                            <i class="bi bi-person-badge text-primary" style="font-size: 3rem;"></i>
                            <h3 class="fw-bold mt-2">Selecciona tu perfil</h3>
                        </div>

                        <g:if test="${flash.error}">
                            <div class="alert alert-danger small">${flash.error}</div>
                        </g:if>

                        <div class="d-grid gap-3">
                            <g:each in="${perfiles}" var="perfil">
                                <g:link action="seleccionar" params="[perfil: perfil]"
                                        class="btn btn-outline-primary btn-lg text-start">
                                    <div class="d-flex align-items-center">
                                        <i class="bi ${perfil == 'Administrador' ? 'bi-shield-lock' : 'bi-person'} me-3 fs-4"></i>
                                        <div>
                                            <div class="fw-bold">
                                                <g:if test="${perfil == 'Administrador'}">Administrador</g:if>
                                                <g:elseif test="${perfil == 'Usuario'}">Usuario</g:elseif>
                                                <g:else>${perfil}</g:else>
                                            </div>
                                            <small class="">
                                                <g:if test="${perfil == 'Administrador'}">
                                                    Acceso completo al sistema
                                                </g:if>
                                                <g:else>
                                                    Acceso básico
                                                </g:else>
                                            </small>
                                        </div>
                                    </div>
                                </g:link>
                            </g:each>
                        </div>

                        <div class="text-center mt-4">
                            <a href="${createLink(uri: '/logout')}" class="text-muted small">
                                <i class="bi bi-box-arrow-right me-1"></i> Cerrar sesión
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
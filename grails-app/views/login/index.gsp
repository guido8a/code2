<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="layout" content="main"/>
    <title>Iniciar sesión - TEDEIN</title>
</head>
<body class="d-flex flex-column min-vh-100">

<section class="py-5 bg-light flex-grow-1 d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">

                <div class="card border-0 shadow-sm">
                    <div class="card-body p-4 p-md-5">

                        <div class="text-center mb-4">
                            <i class="bi bi-person-circle text-primary" style="font-size: 3rem;"></i>
                            <h3 class="fw-bold mt-2">Iniciar sesión</h3>
                            <p class="text-muted small">Accede a tu cuenta de TEDEIN</p>
                        </div>

                    <%-- Mensajes flash --%>
                        <g:if test="${flash.message}">
                            <div class="alert alert-success small">${flash.message}</div>
                        </g:if>
                        <g:if test="${flash.error}">
                            <div class="alert alert-danger small">${flash.error}</div>
                        </g:if>
                        <g:if test="${params.error}">
                            <div class="alert alert-danger small">
                                Usuario o contraseña incorrectos.
                            </div>
                        </g:if>
                        <g:if test="${params.logout}">
                            <div class="alert alert-info small">
                                Has cerrado sesión correctamente.
                            </div>
                        </g:if>

                    <%-- Formulario de login --%>
                        <form action="${createLink(uri: '/login')}" method="POST" autocomplete="off">
                            <div class="mb-3">
                                <label for="username" class="form-label fw-semibold">Usuario</label>
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="Tu usuario" required autofocus/>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label fw-semibold">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="Tu contraseña" required/>
                            </div>

                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="bi bi-box-arrow-in-right me-2"></i> Entrar
                                </button>
                            </div>

                            <div class="text-center small">
                                ¿No tienes cuenta?
                                <a href="${createLink(action: 'registro')}">Regístrate</a>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

</body>
</html>
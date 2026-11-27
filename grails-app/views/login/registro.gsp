<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="layout" content="main"/>
    <title>Registro - TEDEIN</title>
</head>
<body class="d-flex flex-column min-vh-100">

<section class="py-5 bg-light flex-grow-1 d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-5">

                <div class="card border-0 shadow-sm">
                    <div class="card-body p-4 p-md-5">

                        <div class="text-center mb-4">
                            <i class="bi bi-person-plus-fill text-primary" style="font-size: 3rem;"></i>
                            <h3 class="fw-bold mt-2">Crear cuenta</h3>
                            <p class="text-muted small">Regístrate en TEDEIN</p>
                        </div>

                        <g:if test="${flash.error}">
                            <div class="alert alert-danger small">${flash.error}</div>
                        </g:if>

                        <form action="${createLink(action: 'guardarRegistro')}" method="POST" autocomplete="off">
                            <div class="mb-3">
                                <label for="username" class="form-label fw-semibold">Usuario *</label>
                                <input type="text" class="form-control" id="username" name="username"
                                       required minlength="3" maxlength="50"/>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="nombre" class="form-label fw-semibold">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre"/>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label fw-semibold">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"/>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label fw-semibold">Contraseña *</label>
                                <input type="password" class="form-control" id="password" name="password"
                                       required minlength="6"/>
                                <div class="form-text">Mínimo 6 caracteres.</div>
                            </div>

                            <div class="mb-3">
                                <label for="passwordConfirm" class="form-label fw-semibold">Confirmar contraseña *</label>
                                <input type="password" class="form-control" id="passwordConfirm"
                                       name="passwordConfirm" required minlength="6"/>
                            </div>

                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="bi bi-person-check me-2"></i> Crear cuenta
                                </button>
                            </div>

                            <div class="text-center small">
                                ¿Ya tienes cuenta?
                                <a href="${createLink(action: 'index')}">Inicia sesión</a>
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
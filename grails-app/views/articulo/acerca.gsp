<%@ page import="code2.Imagen" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${articulo?.titulo} - TEDEIN</title>
</head>
<body class="d-flex flex-column">

<section class="py-5">
    <div class="container px-5 my-5">

        <%-- Encabezado --%>
        <div class="text-center mb-5">
            <h1 class="fw-bolder mb-2">${articulo?.titulo}</h1>
            <p class="lead fw-normal text-muted mb-0">¿Quiénes somos?</p>
            <hr class="w-25 mx-auto mt-4" style="border-top: 3px solid #0d6efd; opacity: 1;"/>
        </div>

        <div class="row gx-5">

            <%-- Columna principal --%>
            <div class="col-xl-8">

                <%-- Sección: Descripción --%>
                <div class="mb-5">
                    <h2 class="fw-bolder mb-3 d-flex align-items-center">
                        <i class="bi bi-file-text text-primary me-2 fs-4"></i>
                        Descripción
                    </h2>
                    <div class="ps-4 border-start border-3 border-primary">
                        <p class="fs-5 text-secondary mb-0" style="line-height: 1.8;">
                            ${articulo?.descripcion}
                        </p>
                    </div>
                </div>

                <%-- Sección: Nosotros --%>
                <div class="mb-5">
                    <h2 class="fw-bolder mb-3 d-flex align-items-center">
                        <i class="bi bi-people text-primary me-2 fs-4"></i>
                        Nosotros
                    </h2>
                    <div class="ps-4 border-start border-3 border-primary">
                        <div class="fs-6 text-secondary" style="line-height: 1.8;">
                            ${raw(articulo?.texto)}
                        </div>
                    </div>
                </div>

                <%-- Sección: Nuestros clientes --%>
                <div class="mb-5">
                    <h2 class="fw-bolder mb-3 d-flex align-items-center">
                        <i class="bi bi-star text-primary me-2 fs-4"></i>
                        Nuestros clientes
                    </h2>
                    <div class="ps-4 border-start border-3 border-primary">
                        <div class="row g-3">
                            <%-- Aquí puedes iterar clientes desde la BD --%>
                            <div class="col-md-4">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body text-center p-3">
                                        <i class="bi bi-building fs-2 text-primary mb-2"></i>
                                        <p class="mb-0 fw-semibold small">Prefectura de Pichincha</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body text-center p-3">
                                        <i class="bi bi-building fs-2 text-primary mb-2"></i>
                                        <p class="mb-0 fw-semibold small">Cliente 2</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body text-center p-3">
                                        <i class="bi bi-building fs-2 text-primary mb-2"></i>
                                        <p class="mb-0 fw-semibold small">Cliente 3</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Columna lateral: Contacto --%>
            <div class="col-xl-4">
                <div class="card border-0 shadow-sm sticky-top" style="top: 100px;">
                    <div class="card-body p-4 text-center">
                        <div class="mb-3">
                            <i class="bi bi-chat-dots-fill text-primary" style="font-size: 2.5rem;"></i>
                        </div>
                        <h5 class="fw-bolder mb-3">¿Tienes preguntas?</h5>
                        <p class="text-muted mb-4 small">
                            Nuestro equipo está disponible para ayudarte.
                        </p>

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

                        <hr class="my-4"/>

                        <div class="text-start small">
                            <p class="text-muted mb-2">
                                <i class="fa fa-phone me-1 text-primary"></i>
                                <strong>Teléfonos:</strong> 02-501-9108 / 098 491 6620
                            </p>
                            <p class="text-muted mb-0">
                                <i class="bi bi-geo-alt me-1 text-primary"></i>
                                Quito, Ecuador
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
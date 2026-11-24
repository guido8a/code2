<%@ page import="code2.Imagen" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${articulo?.titulo} - TEDEIN</title>
</head>
<body>
<section class="py-5">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <div class="col-lg-3">
                <div class="d-flex flex-column align-items-center text-center mt-lg-5 mb-4">
                    <img class="mb-2"
                         style="height: 60px;"
                         src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_2/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(2), 1)?.nombre}"])}"
                         alt="Logo" />
                    <div class="fw-bold">TEDEIN S.A.</div>
                </div>
                <div class="col-lg-12">
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
                                    <strong>Teléfonos:</strong> 02-501-9108 <br/> 098 491 6620
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
            <div class="col-lg-9">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h1 class="fw-bolder mb-1">${articulo?.titulo}</h1>
%{--                        <a class="badge bg-secondary text-decoration-none link-light" href="#">Sistema Web</a>--}%
                        <a class="badge bg-info text-decoration-none link-light" href="#">Sistema Web</a>
                    </header>

                    <figure class="mb-2" style="text-align: center">
                        <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo?.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 1)?.nombre}"])}"
                             alt="Principal"
                             class="img-fluid rounded"/>
                    </figure>

                    <section class="mb-5">
                        <p class="fw-bolder mb-4 mt-5">${articulo?.descripcion}</p>
                        <div id="carruselProducto" class="carousel slide mb-6" data-bs-ride="carousel">
                            <div class="carousel-inner rounded">
                                <div class="carousel-item active">
                                    <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 2)?.nombre}"])}"
                                         alt="Carrusel 1"
                                         style="height: 300px; object-fit: fill;"
                                         class="d-block w-100"/>
                                </div>
                                <div class="carousel-item">
                                    <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 3)?.nombre}"])}"
                                         alt="Carrusel 2"
                                         style="height: 300px; object-fit: fill;"
                                         class="d-block w-100"/>
                                </div>
                                <div class="carousel-item">
                                    <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 4)?.nombre}"])}"
                                         alt="Carrusel 3"
                                         style="height: 300px; object-fit: fill;"
                                         class="d-block w-100"/>
                                </div>
                                <div class="carousel-item">
                                    <img src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo.id}/${code2.Imagen.findByArticuloAndOrden(articulo, 5)?.nombre}"])}"
                                         alt="Carrusel 4"
                                         style="height: 300px; object-fit: fill;"
                                         class="d-block w-100"/>
                                </div>
                            </div>

                            <!-- Botón anterior -->
                            <button class="carousel-control-prev" type="button"
                                    data-bs-target="#carruselProducto" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Anterior</span>
                            </button>

                            <!-- Botón siguiente -->
                            <button class="carousel-control-next" type="button"
                                    data-bs-target="#carruselProducto" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Siguiente</span>
                            </button>

                            <!-- Indicadores (puntos) -->
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carruselProducto" data-bs-slide-to="0"
                                        class="active" aria-current="true" aria-label="Imagen 1"></button>
                                <button type="button" data-bs-target="#carruselProducto" data-bs-slide-to="1"
                                        aria-label="Imagen 2"></button>
                                <button type="button" data-bs-target="#carruselProducto" data-bs-slide-to="2"
                                        aria-label="Imagen 3"></button>
                                <button type="button" data-bs-target="#carruselProducto" data-bs-slide-to="3"
                                        aria-label="Imagen 4"></button>
                            </div>
                        </div>
                        <!-- descripcion del producto -->
                        <p class="fs-5 mb-4">${raw(articulo?.texto)}</p>
                    </section>
                </article>
                <!-- Comments section-->
                <section>
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment with nested comments-->
                            <div class="d-flex mb-4">
                                <!-- Parent comment-->
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">Nuestros clientes usando el sistema:</div>
                                    Prefectura de Pichincha
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>

<div class="d-flex justify-content-center mb-5">
    <a class="btn btn-primary btn-lg px-4" href="${createLink(controller: 'articulo', action: 'producto_list')}">
        <i class="fa fa-house-laptop"></i> Más productos
    </a>
</div>

</body>
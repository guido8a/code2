<%@ page contentType="text/html;charset=UTF-8" %>
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
                <div class="d-flex align-items-center mt-lg-5 mb-4">

                    <div class="ms-3">
                        <asset:image src="tedein-logo.png" alt="TEDEIN" style="height: 60px;" class="me-3"/>
                        <div class="fw-bold">TEDEIN S.A.</div>
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
                        <a class="badge bg-secondary text-decoration-none link-light" href="#">Sistema Web</a>
                        <a class="badge bg-info text-decoration-none link-light" href="#">En línea</a>
                    </header>

                    <figure class="mb-2" style="text-align: center">
                        <asset:image src="construccion.jpeg" alt="" class="img-fluid rounded"/>
                    </figure>

                    <section class="mb-5">
                        <p class="fw-bolder mb-4 mt-5">${articulo?.descripcion}</p>
                        <div id="carruselProducto" class="carousel slide mb-5" data-bs-ride="carousel">
                            <div class="carousel-inner rounded">
                                <div class="carousel-item active">
                                    <asset:image src="construccion.jpeg" alt="Vista 1" class="d-block w-100"
                                                 style="height: 180px; object-fit: cover;"/>
                                </div>
                                <div class="carousel-item">
                                    <asset:image src="construccion.jpeg" alt="Vista 2" class="d-block w-100"
                                                 style="height: 180px; object-fit: cover;"/>
                                </div>
                                <div class="carousel-item">
                                    <asset:image src="construccion.jpeg" alt="Vista 3" class="d-block w-100"
                                                 style="height: 180px; object-fit: cover;"/>
                                </div>
                                <div class="carousel-item">
                                    <asset:image src="construccion.jpeg" alt="Vista 4" class="d-block w-100"
                                                 style="height: 180px; object-fit: cover;"/>
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

</body>
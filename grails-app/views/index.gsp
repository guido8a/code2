<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inicio - TEDEIN</title>
</head>
<body>
<!-- Header con imagen de portada -->
<header class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 align-items-center justify-content-center">
            <div class="col-lg-8 col-xl-7 col-xxl-6">
                <div class="my-5 text-center text-xl-start">
                    <div class="d-flex align-items-center justify-content-center justify-content-xl-start my-5">
                        <asset:image src="tedein-logo.png" alt="TEDEIN" style="height: 60px;" class="me-3"/>
                        <h1 class="display-5 fw-bolder text-white mb-0">
                            TEDEIN S.A.
                        </h1>
                    </div>
                    <p class="lead fw-normal text-white-50 mb-4">
                        Tecnología para el Desarrollo Integral
                    </p>
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                        <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#productos">Nuestros Productos</a>
                        <a class="btn btn-outline-light btn-lg px-4" href="#informacion">Más información</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                <asset:image class="img-fluid rounded-3 my-5" src="fondo.jpg" alt="Fondo"/>
            </div>
        </div>
    </div>
</header>

<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">NUESTROS <br/> SERVICIOS.</h2></div>
            <div class="col-lg-8">
                <div class="row gx-5 row-cols-1 row-cols-md-2">
                    <div class="col mb-5 h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                        <h2 class="h5">Sistemas Web</h2>
                        <p class="mb-0">Desarrollo de grandes sistemas de información, acceso remoto a bases de datos, interacción con mail, dispositivos inteligentes, IA, etc</p>
                    </div>
                    <div class="col mb-5 h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                        <h2 class="h5">Consultoria</h2>
                        <p class="mb-0">Sistemas de información, Bases de datos, Educación virtual, desarrollo de cursos, Moodle.</p>
                    </div>
                    <div class="col mb-5 mb-md-0 h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                        <h2 class="h5">Capacitación</h2>
                        <p class="mb-0">Capacitación en temas relacionados al desarrollo de sistemas y las TIC.</p>
                    </div>
                    <div class="col h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                        <h2 class="h5">Sistemas Expertos</h2>
                        <p class="mb-0">Redes Neuronales y Sistemas Expertos para pronósticos, análisis de tendencias, modelos matemáticos, etc.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
            <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#productos">Más servicios</a>
        </div>
    </div>
</section>
<!-- Testimonial section-->
<div class="py-5 bg-light">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-10 col-xl-7">
                <div class="text-center">
                    <div class="fs-4 mb-4 fst-italic">"Usamos la tecnología para que
                    nuestros clientes cuenten con una solución de software que
                    permita contar con una herramienta útil y eficaz para sus procesos."
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <asset:image src="tedein-logo.png" alt="TEDEIN" style="height: 30px;" class=" me-3"/>
                        <div class="fw-bold">
                            TEDEIN S.A.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog preview section-->
<section class="py-5" id="productos">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-8 col-xl-6">
                <div class="text-center">
                    <h2 class="fw-bolder">NUESTROS PRODUCTOS <br/> Software </h2>
                    <p class="lead fw-normal text-muted mb-5">Sistemas basados en Software Libre - Plataforma Web.</p>
                </div>
            </div>
        </div>
        <div class="row gx-5">
            <div class="col-lg-4 mb-5">
                <div class="card h-100 shadow border-0">
                    <asset:image src="construccion.jpeg" alt="Salud" class="card-img-top"/>
                    <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">En línea</div>
                        <a class="text-decoration-none link-dark stretched-link" href="#"><h5 class="card-title mb-3">Gestión de Obras</h5></a>
                        <p class="card-text mb-0">Sistema Integrado de Gestión de Proyectos, Fiscalización, Contratación y Ejecución de Obras. (Plataforma web).</p>
                    </div>
                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                <div class="small">
                                    <div class="fw-bold">Nuestros clientes:</div>
                                    <div class="text-muted">Prefectura de Pichincha</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="card h-100 shadow border-0">
                    <asset:image src="tramites.png" alt="Salud" class="card-img-top"/>
                    <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2"></div>
                        <a class="text-decoration-none link-dark stretched-link" href="#"><h5 class="card-title mb-3">Gestión de Trámites</h5></a>
                        <p class="card-text mb-0">Sistema de Administración de Procesos, Trámites y Documentos.</p>
                    </div>
                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                <div class="small">
                                    <div class="fw-bold">Nuestros clientes:</div>
                                    <div class="text-muted">Prefectura de Pichincha</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="card h-100 shadow border-0">
                    <asset:image src="salud.jpeg" alt="Salud" class="card-img-top"/>
                    <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">En línea</div>
                        <a class="text-decoration-none link-dark stretched-link" href="#"><h5 class="card-title mb-3">Administración de consultorios médicos</h5></a>
                        <p class="card-text mb-0">Administración de Pacientes, Citas médicas e Historias clínicas.</p>
                    </div>
                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                <div class="small">
                                    <div class="fw-bold">Nuestros clientes:</div>
                                    <div class="text-muted">Prefectura de Pichincha</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#productos">Más productos</a>
            </div>
        </div>
        <!-- Call to action-->
        <section class="py-2" id="informacion">
        <aside class="bg-dark rounded-3 p-4 p-sm-5 mt-5">
            <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                <div class="mb-4 mb-xl-0">
                    <div class="fs-4 fw-bold text-white">Contáctenos</div>
                    <div class="text-white">Tienes alguna pregunta? Llámanos o escríbenos</div>
                </div>
                <div class="ms-xl-4">
                    <div class="text-white"><strong>Teléfonos:</strong> 02-501-9108 / 098 491 6620</div>
                    <div class="text-white"><strong>Email:</strong> soporte@tedein.com.ec <br/> informacion@tedein.com.ec </div>
                </div>
            </div>
        </aside>
    </section>
    </div>
</section>

</body>
</html>
<%@ page import="code2.Imagen" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Descargas - TEDEIN</title>
</head>
<body class="d-flex flex-column">
<section class="bg-light py-5">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">Descargas</h1>
            <p class="lead fw-normal text-muted mb-0"></p>
        </div>
        <div class="row gx-5 justify-content-center">
            <g:if test="${descargas.size() > 0}">
                <g:each in="${descargas}" var="articulo">
                    <div class="col-lg-6 col-xl-4">
                        <div class="card border-0 shadow-sm d-flex flex-column h-100" >
                            <div class="card-body p-4 d-flex flex-column flex-grow-1" style="height: 530px;">
                                <div class="mb-3 d-flex justify-content-center">
                                    <img class="mb-2"
                                         style="height: 100px;"
                                         src="${createLink(controller: 'imagen', action: 'mostrarImagen', params: [ruta: "articulo_${articulo?.id}/${code2.Imagen.findByArticuloAndOrden(code2.Articulo.get(articulo?.id), 1)?.nombre}"])}"
                                         alt="Logo" />
                                </div>
                                <h4 class="fw-bold mb-2">${articulo?.titulo}</h4>
                                <g:if test="${articulo?.subtitulo}">
                                    <p class="text-muted small mb-3">${articulo?.subtitulo}</p>
                                </g:if>
                                <g:if test="${articulo?.descripcion}">
                                    <p class="text-secondary mb-3" style="line-height: 1.6;">
                                        ${articulo?.descripcion}
                                    </p>
                                </g:if>
                                <div class="flex-grow-1 mb-3 texto-scroll"
                                     style="overflow-y: auto; max-height: 100%; min-height: 0;">
                                    <div class="text-muted small" style="line-height: 1.6;">
                                        ${raw(articulo?.texto)}
                                    </div>
                                </div>
                                <div class="mt-auto">
                                    <button type="button" class="btn btn-primary w-100"
                                            onclick="descargarArchivo(${articulo.id})" title="Descargar">
                                        <i class="bi bi-download me-2"></i> Descargar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:each>
            </g:if>
            <g:else>
                <div class="text-center py-5">
                    <div class="mb-3">
                        <i class="bi bi-cloud-download text-primary" style="font-size: 4rem; opacity: 0.6;"></i>
                    </div>
                    <h5 class="fw-bold text-secondary mb-2">No existen descargas</h5>
                    <p class="text-muted mb-4">Aún no hay archivos disponibles para descargar.</p>
                </div>
            </g:else>
        </div>
    </div>
</section>

<script type="text/javascript">

    function descargarArchivo(id){
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'articulo', action:'descargarArchivo')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var parts = msg.split("_");
                if(parts[0] !== 'no' ){
                    location.href="${createLink(controller: 'articulo', action: 'descargarArchivo')}/" + id
                }else{
                    resultado(parts[1], 'error')
                }
            } //success
        }); //ajax
    }

</script>
</body>
</html>
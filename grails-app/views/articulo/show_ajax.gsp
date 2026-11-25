<%@ page import="code2.Articulo" %>

<div class="container-fluid px-3 py-2">

    <div class="row mb-3">
        <div class="col-12">
            <span class="text-muted small d-block">Título</span>
        <p class="fw-semibold mb-0">${artc.titulo}</p>
            <g:if test="${artc.subtitulo}">
                <span class="text-muted small d-block">Subtítulo</span>
                <p class="fw-semibold mb-0">${artc.subtitulo}</p>
            </g:if>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-4">
            <span class="text-muted small d-block">Sección</span>
            <span class="fw-semibold">${artc.seccion?.titulo ?: '—'}</span>
        </div>
        <div class="col-md-4">
            <span class="text-muted small d-block">Estado</span>
            <g:if test="${artc.estado == 'A'}">
                <span class="badge bg-success bg-opacity-10 text-success border border-success">Aprobado</span>
            </g:if>
            <g:else>
                <span class="badge bg-warning bg-opacity-10 text-success border border-warning">Provisional</span>
            </g:else>
        </div>
        <div class="col-md-4">
            <span class="text-muted small d-block">Orden</span>
            <span class="fw-semibold">${artc.orden ?: '—'}</span>
        </div>
    </div>

    <g:if test="${artc.descripcion}">
        <div class="row mb-3">
            <div class="col-12">
                <span class="text-muted small d-block mb-1">Descripción</span>
                <p class="mb-0">${artc.descripcion}</p>
            </div>
        </div>
    </g:if>

    <g:if test="${artc.texto}">
        <div class="row mb-3">
            <div class="col-12">
                <span class="text-muted small d-block mb-2">Contenido</span>
                <div class="border rounded p-3 bg-light">
                    ${raw(artc.texto)}
                </div>
            </div>
        </div>
    </g:if>

    <g:if test="${artc.cliente}">
        <div class="row mb-3">
            <div class="col-12">
                <span class="text-muted small d-block mb-1">Clientes</span>
                <p class="mb-0 fst-italic">${artc.cliente}</p>
            </div>
        </div>
    </g:if>

    <g:if test="${artc.metaDescripcion}">
        <div class="row mb-3">
            <div class="col-12">
                <span class="text-muted small d-block mb-1">Meta descripción (SEO)</span>
                <p class="mb-0 text-muted fst-italic">${artc.metaDescripcion}</p>
            </div>
        </div>
    </g:if>

</div>
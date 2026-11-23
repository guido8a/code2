
<div class="container-fluid px-3 py-2">
    <div class="row mb-3">
        <div class="col-12">
            <span class="text-muted small d-block">Título</span>
            <p class="fw-semibold mb-0">${seccion.titulo}</p>
            <g:if test="${seccion.subtitulo}">
                <span class="text-muted small d-block">Subtítulo</span>
                <p class="fw-semibold mb-0">${seccion.subtitulo}</p>
            </g:if>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-4">
            <span class="text-muted small d-block">Estado</span>
            <g:if test="${seccion.estado == 'A'}">
                <span class="badge bg-success bg-opacity-10 text-success border border-success">Aprobado</span>
            </g:if>
            <g:else>
                <span class="badge bg-warning bg-opacity-10 text-success border border-warning">Provisional</span>
            </g:else>
        </div>
        <div class="col-md-4">
            <span class="text-muted small d-block">Orden</span>
            <span class="fw-semibold">${seccion.orden ?: '—'}</span>
        </div>
    </div>

    <g:if test="${seccion.menu}">
        <div class="row mb-3">
            <div class="col-12">
                <span class="text-muted small d-block mb-1">Menú</span>
                <p class="mb-0 text-muted fst-italic">${seccion?.menu}</p>
            </div>
        </div>
    </g:if>

</div>
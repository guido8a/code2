<div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
    <table class="table table-hover align-middle mb-0" style="table-layout: fixed; width: 100%;">
        <thead class="table-dark" style="position: sticky; top: 0; z-index: 10;">
        <tr>
            <th style="width: 10%;" class="text-center">#</th>
            <th style="width: 60%;">Nombre</th>
            <th style="width: 30%;" class="text-center">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${imagenes}" var="imagen" status="i">
            <tr>
                <td class="fw-bold text-muted text-center">${i + 1}</td>
                <td class="fw-semibold text-truncate" title="${imagen?.nombre}">
                    <i class="bi bi-file-image text-primary me-1"></i>
                    ${imagen?.nombre}
                </td>
                <td class="text-center">
                    <div class="btn-group btn-group-sm" role="group">
                        <button type="button" class="btn btn-outline-danger"
                                onclick="deleteImagen(${imagen.id})" title="Eliminar">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </td>
            </tr>
        </g:each>
        <g:if test="${!imagenes}">
            <tr>
                <td colspan="3" class="text-center text-muted py-5">
                    <i class="bi bi-inbox fs-1 d-block mb-2 text-secondary"></i>
                    <p class="mb-0">No hay imágenes cargadas.</p>
                </td>
            </tr>
        </g:if>
        </tbody>
    </table>
</div>
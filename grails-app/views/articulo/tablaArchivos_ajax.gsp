<div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
    <table class="table table-hover align-middle mb-0" style="table-layout: fixed; width: 100%;">
        <thead class="table-dark" style="position: sticky; top: 0; z-index: 10;">
        <tr>
            <th style="width: 70%;">Nombre</th>
            <th style="width: 30%;" class="text-center">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:if test="${!articulo?.archivo}">
            <tr>
                <td colspan="2" class="text-center text-muted py-5">
                    <i class="bi bi-inbox fs-1 d-block mb-2 text-secondary"></i>
                    <p class="mb-0">No hay archivo cargado.</p>
                </td>
            </tr>
        </g:if>
        <g:else>
            <tr>
                <td class="fw-semibold text-truncate" title="${articulo?.archivo}">
                    <i class="fa fa-upload text-primary me-1"></i>
                    ${articulo?.archivo}
                </td>
                <td class="text-center">
                    <div class="btn-group btn-group-sm" role="group">
                        <button type="button" class="btn btn-outline-danger"
                                onclick="deleteArchivo(${articulo.id})" title="Eliminar archivo">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </td>
            </tr>
        </g:else>
        </tbody>
    </table>
</div>
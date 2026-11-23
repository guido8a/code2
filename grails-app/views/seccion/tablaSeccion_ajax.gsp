<div class="mx-auto" style="width: 80%;">
    <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
        <table class="table table-hover align-middle mb-0" style="table-layout: fixed; width: 100%;">
            <thead class="table-dark sticky-top">
            <tr style="width: 100%">
                <th scope="col" style="width: 5%;">#</th>
                <th scope="col" style="width: 20%;">Título</th>
                <th scope="col" style="width: 60%;">Descripción</th>
                <th scope="col" style="width: 15%;" class="text-center">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${secciones}" var="seccion" status="i">
                <tr>
                    <td class="fw-bold text-muted">${seccion?.orden}</td>
                    <td class="fw-semibold">${seccion.titulo}</td>
                    <td class="text-muted">${seccion.subtitulo?.take(120)}${seccion.subtitulo?.length() > 120 ? '…' : ''}</td>
                    <td class="text-center">
                        <div class="btn-group btn-group-sm" role="group">
                            <button type="button" class="btn btn-primary"
                                    onclick="verSeccion(${seccion.id}, '${seccion?.titulo}')" title="Ver">
                                <i class="fa fa-search"></i>
                            </button>
                            <button type="button" class="btn btn-success"
                                    onclick="editarSeccion(${seccion.id}, '${seccion?.titulo}')" title="Editar">
                                <i class="fa fa-edit"></i>
                            </button>
                            <button type="button" class="btn btn-danger"
                                    onclick="deleteSeccion(${seccion.id}, '${seccion?.titulo}')" title="Eliminar">
                                <i class="fa fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
            </g:each>
            <g:if test="${!secciones}">
                <tr>
                    <td colspan="5" class="text-center text-muted py-4">
                        <i class="bi bi-inbox fs-3 d-block mb-2"></i>
                        No hay secciones registrados.
                    </td>
                </tr>
            </g:if>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">

    function verSeccion(id, nombre) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'seccion', action:'show_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                var va = bootbox.dialog({
                    id: "dlgVerSeccion",
                    title: "<i class='fa fa-edit text-bg-success'></i> Sección: " + nombre,
                    closeButton: false,
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i>  Cancelar",
                            className: "btn-info",
                            callback: function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    }

    function deleteSeccion(id, nombre) {
        bootbox.confirm({
            message: "<i class='fa fa-3x fa-trash text-danger'></i> <strong style='font-size: 14px'>  Está seguro que desea borrar la sección: </strong> " + nombre + " ?",
            buttons: {
                confirm: {
                    label: '<i class="fa fa-trash"></i> Borrar',
                    className: 'btn-danger'
                },
                cancel: {
                    label: '<i class="fa fa-times"></i> Cancelar',
                    className: 'btn-info'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller: 'seccion', action: 'borrarSeccion_ajax')}',
                        data: {
                            id: id
                        },
                        success: function (msg) {
                            var parts = msg.split("_");
                            if (parts[0] === 'ok') {
                                resultado(parts[1], "success");
                                cargarTablaSeccion();
                            } else {
                                resultado(parts[1], 'error')
                            }
                        }
                    });
                }
            }
        });
    }
</script>
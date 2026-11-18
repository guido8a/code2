<div class="mx-auto" style="width: 80%;">
    <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
        <table class="table table-hover align-middle mb-0" style="table-layout: fixed; width: 100%;">
            <thead class="table-dark sticky-top">
            <tr style="width: 100%">
                <th scope="col" style="width: 5%;">#</th>
                <th scope="col" style="width: 20%;">Título</th>
                <th scope="col" style="width: 50%;">Descripción</th>
                <th scope="col" style="width: 10%;">Estado</th>
                <th scope="col" style="width: 15%;" class="text-center">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${articuloInstanceList}" var="articulo" status="i">
                <tr>
                    <td class="fw-bold text-muted">${articulo?.orden}</td>
                    <td class="fw-semibold">${articulo.titulo}</td>
                    <td class="text-muted">${articulo.descripcion?.take(100)}${articulo.descripcion?.length() > 100 ? '…' : ''}</td>
                    <td>
                        <g:if test="${articulo?.estado == 'A'}">
                            <span class="badge bg-success bg-opacity-10 text-success border border-success">
                                Aprobado
                            </span>
                        </g:if>
                        <g:else>
                            <span class="badge bg-warning bg-opacity-10 text-success border border-warning">
                                Provisional
                            </span>
                        </g:else>

                    </td>
                    <td class="text-center">
                        <div class="btn-group btn-group-sm" role="group">
                            <button type="button" class="btn btn-primary"
                                    onclick="verArticulo(${articulo.id}, '${articulo?.titulo}')" title="Ver">
                                <i class="fa fa-search"></i>
                            </button>
                            <button type="button" class="btn btn-success"
                                    onclick="editarArticulo(${articulo.id}, '${articulo?.titulo}')" title="Editar">
                                <i class="fa fa-edit"></i>
                            </button>
                            <button type="button" class="btn btn-info"
                                    onclick="imagenesArticulo(${articulo.id}, '${articulo?.titulo}')" title="Imágenes">
                                <i class="fa fa-upload"></i>
                            </button>
                            <button type="button" class="btn btn-danger"
                                    onclick="deleteRow(${articulo.id})" title="Eliminar">
                                <i class="fa fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
            </g:each>
            <g:if test="${!articuloInstanceList}">
                <tr>
                    <td colspan="5" class="text-center text-muted py-4">
                        <i class="bi bi-inbox fs-3 d-block mb-2"></i>
                        No hay artículos registrados.
                    </td>
                </tr>
            </g:if>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">

    var dart;

    function verArticulo(id, nombre) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'articulo', action:'show_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                var va = bootbox.dialog({
                    id: "dlgVerArticulo",
                    title: "<i class='fa fa-edit text-bg-success'></i> Artículo: " + nombre,
                    className: 'modal-xl',
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

    function editarArticulo(id, nombre) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'articulo', action:'form_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                dart = bootbox.dialog({
                    id: "dlgCreateEditArticulo",
                    title: "<i class='fa fa-edit text-bg-success'></i> Artículo: " + nombre,
                    className: 'modal-xl',
                    closeButton: false,
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i>  Cancelar",
                            className: "btn-info",
                            callback: function () {
                            }
                        },
                        guardar: {
                            label: "<i class='fa fa-save'></i>  Guardar",
                            className: "btn-success",
                            callback: function () {
                                if (typeof window.guardarArticulo === 'function') {
                                    window.guardarArticulo();
                                } else {
                                    console.error("guardarArticulo no está definida");
                                }
                                return false;
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    }
    function imagenesArticulo(id, nombre) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'articulo', action:'imagenes_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                var va = bootbox.dialog({
                    id: "dlgSubirImagenesArticulo",
                    title: "<i class='fa fa-edit text-bg-success'></i> Artículo: " + nombre,
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

    function cerrarEditarArticulo(){
       dart.modal("hide");
    }
</script>
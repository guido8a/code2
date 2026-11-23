
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Secciones</title>
</head>
<body>

<div class="d-flex justify-content-center mb-3 mt-3">
    <div class="btn-toolbar" role="toolbar">
        <div class="btn-group" role="group">
            <g:link controller="seccion" action="list"
                    class="btn ${controllerName == 'seccion' ? 'btn-primary' : 'btn-outline-primary'}"
                    style="margin-right: 2px;">
                <i class="bi bi-folder"></i> Secciones
            </g:link>
            <g:link controller="articulo" action="list"
                    class="btn ${controllerName == 'articulo' ? 'btn-primary' : 'btn-outline-primary'}"
                    style="margin-right: 2px;">
                <i class="bi bi-file-earmark-text"></i> Artículos
            </g:link>
%{--            <g:link controller="descarga" action="list"--}%
%{--                    class="btn ${controllerName == 'descarga' ? 'btn-primary' : 'btn-outline-primary'}"--}%
%{--                    style="margin-right: 2px;">--}%
%{--                <i class="bi bi-download"></i> Descargas--}%
%{--            </g:link>--}%
        </div>
    </div>
</div>

<div class="d-flex justify-content-center mb-3 mt-3">
    <div class="btn-group col-md-2 ms-4">
        <button type="button" class="btn btn-primary"
                onclick="editarSeccion(null, '${se?.titulo}')" title="Crear nueva sección">
            <i class="fa fa-file-text"></i> Crear Sección
        </button>
    </div>
</div>

<div class="justify-content-center mb-3 mt-3" id="divSecciones">

</div>


<script type="text/javascript">
    var esc;

    cargarTablaSeccion();

    function editarSeccion(id, nombre) {
        var titulo = nombre ? ('<i class="fa fa-edit text-bg-success"></i>  Sección: ' + nombre) : ('<i class="fa fa-file text-success"></i>  Nueva sección ')
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'seccion', action:'form_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                esc = bootbox.dialog({
                    id: "dlgCreateEditSeccion",
                    title: titulo,
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
                                return guardarSeccion();
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    }

    function guardarSeccion(){
        var $form = $("#frmSeccion");
        var data = $form.serialize();
        if ($form.valid()) {
            var l = cargarLoader("Guardando...")
            $.ajax({
                type: 'POST',
                url: "${createLink(controller: 'seccion', action: 'guardarSeccion_ajax')}",
                data: data,
                success: function (msg) {
                    cerrarLoader(l);
                    var parts = msg.split("_");
                    if (parts[0] === 'ok') {
                        resultado(parts[1], "success");
                        cerrarEditarSeccion();
                        cargarTablaSeccion();
                    } else {
                        resultado(parts[1], "error");
                    }
                }
            });
        }
        return false
    }

    function cerrarEditarSeccion(){
        esc.modal("hide");
    }

    function cargarTablaSeccion() {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'seccion' ,action:'tablaSeccion_ajax')}",
            data: {
            },
            success: function (msg) {
                $("#divSecciones").html(msg)
            } //success
        }); //ajax
    }



</script>

</body>
</html>

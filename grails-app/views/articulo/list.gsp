<%@ page import="code2.Seccion" %>

<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Artículos</title>
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
    <div class="col-md-1 negrilla control-label">Sección: </div>
    <div class="col-md-3">
        <g:select name="seccion_name" id="seccion" optionKey="id" optionValue="titulo"
                  class="form-control" from="${code2.Seccion.list([sort: 'titulo', order: 'asc'])}"/>
    </div>
    <div class="btn-group col-md-2 ms-4">
        <button type="button" class="btn btn-primary"
                onclick="editarArticulo(null, '${articulo?.titulo}')" title="Crear nuevo artículo">
            <i class="fa fa-file-text"></i> Crear Artículo
        </button>
    </div>
</div>

<div class="justify-content-center mb-3 mt-3" id="divArticulos">

</div>

<script type="text/javascript">
    var id = null;

    cargarTablaArticulos($("#seccion").val());

    $("#seccion").change(function () {
        let seccion = $(this).val()
        cargarTablaArticulos(seccion);
    });

    function deleteRow(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash-o fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar el Articulo seleccionado? Esta acción no se puede deshacer.</p>",
            buttons : {
                cancelar : {
                    label     : "Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                eliminar : {
                    label     : "<i class='fa fa-trash-o'></i> Eliminar",
                    className : "btn-danger",
                    callback  : function () {
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(action:'delete_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                var parts = msg.split("_");
                                log(parts[1], parts[0] === "OK" ? "success" : "error"); // log(msg, type, title, hide)
                                if (parts[0] === "OK") {
                                    location.reload();
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    function cargarTablaArticulos(seccion) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'articulo' ,action:'tablaArticulos_ajax')}",
            data: {
                seccion: seccion
            },
            success: function (msg) {
                $("#divArticulos").html(msg)
            } //success
        }); //ajax
    }

</script>
</body>
</html>

<div class="card shadow-sm border-0 mb-4">
    <div class="card-header bg-white border-bottom d-flex justify-content-between align-items-center py-3">
        <h5 class="mb-0 fw-bold">
            <i class="bi bi-images me-2 text-primary"></i>
            Archivo del artículo
        </h5>
    </div>

    <div class="card-body">
        <g:uploadForm action="uploadArchivoArticulo" method="post" name="frmUploadArchivo" enctype="multipart/form-data" class="mb-0" >
            <g:hiddenField name="id" value="${articulo?.id}"/>
            <div class="fieldcontain required">
                <input type="file" id="file" name="file" class="" multiple accept="*/*"/>
                <div class="btn-group" style="margin-top: 20px;">
                    <button type="button" class="btn btn-success"
                            onclick="submitSubirArchivo()" title="Cargar archivo">
                        <i class="fa fa-upload"></i> Subir
                    </button>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>

<div class="card shadow-sm border-0">
    <div class="card-header bg-white border-bottom py-3">
        <h6 class="mb-0 fw-bold text-secondary">
            <i class="bi bi-list-ul me-1"></i> Archivo cargado:
        </h6>
    </div>
    <div id="divTablaArchivos">

    </div>
</div>

<script type="text/javascript">

    var sd, po;

    cargarTablaArchivos()

    $("#submit").click(function () {
        return submitSubirArchivo();
    });

    function cargarTablaArchivos() {
        var articulo = '${articulo?.id}'
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'articulo' ,action:'tablaArchivos_ajax')}",
            data: {
                id: articulo
            },
            success: function (msg) {
                $("#divTablaArchivos").html(msg)
            } //success
        }); //ajax
    }

    function deleteArchivo(id){
        bootbox.confirm({
            message: "<i class='fa fa-3x fa-trash text-danger'></i> <strong style='font-size: 14px'>  Está seguro que desea borrar el archivo? </strong>",
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
                if(result){
                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller: 'articulo', action: 'borrarArchivo_ajax')}',
                        data:{
                            id: id
                        },
                        success: function (msg) {
                            var parts = msg.split("_");
                            if(parts[0] === 'ok'){
                                resultado(parts[1],"success");
                                cargarTablaArchivos()
                            }else{
                                resultado(parts[1], 'error')
                            }
                        }
                    });
                }
            }
        });
    }

    function submitSubirArchivo() {
        var $form = $("#frmUploadArchivo");
        var formData = new FormData($form[0]);
        sd = cargarLoader("Guardando...");
        $.ajax({
            type    : "POST",
            url     : $form.attr("action"),
            data    : formData,
            processData: false,
            contentType: false,
            success : function (msg) {
                cerrarLoader(sd)
                var parts = msg.split("_");
                if(parts[0] === 'ok'){
                    resultado(parts[1], "success");
                    cargarTablaArchivos()
                }else{
                    resultado(parts[1], 'error')
                    return false;
                }
            }
        });
    }

</script>


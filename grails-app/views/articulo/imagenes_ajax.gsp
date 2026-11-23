<div class="card shadow-sm border-0 mb-4">
    <div class="card-header bg-white border-bottom d-flex justify-content-between align-items-center py-3">
        <h5 class="mb-0 fw-bold">
            <i class="bi bi-images me-2 text-primary"></i>
            Imágenes del artículo
        </h5>
    </div>

    <div class="card-body">
        <g:uploadForm action="uploadImagenesArticulo" method="post" name="frmUpload" enctype="multipart/form-data" class="mb-0" >
            <g:hiddenField name="id" value="${articulo?.id}"/>
            <div class="fieldcontain required">
                <input type="file" id="file" name="file" class="" multiple accept=".jpeg, .jpg, .png"/>
                <div class="btn-group" style="margin-top: 20px;">
                    <button type="button" class="btn btn-success"
                            onclick="submitSubirImagenes()" title="Cargar imagen">
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
            <i class="bi bi-list-ul me-1"></i> Imágenes cargadas
        </h6>
    </div>
    <div id="divTablaImagenes">

    </div>
</div>

<script type="text/javascript">

    var sd, po;

    cargarTablaImagenes()

    $("#submit").click(function () {
        return submitSubirImagenes();
    });

    function cargarTablaImagenes() {
        var articulo = '${articulo?.id}'
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'articulo' ,action:'tablaImagenes_ajax')}",
            data: {
                id: articulo
            },
            success: function (msg) {
                $("#divTablaImagenes").html(msg)
            } //success
        }); //ajax
    }

    function deleteImagen(id){
        bootbox.confirm({
            message: "<i class='fa fa-3x fa-trash text-danger'></i> <strong style='font-size: 14px'>  Está seguro que desea borrar la imagen? </strong>",
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
                        url: '${createLink(controller: 'articulo', action: 'borrarImagenArticulo_ajax')}',
                        data:{
                            id: id
                        },
                        success: function (msg) {
                            var parts = msg.split("_");
                            if(parts[0] === 'ok'){
                                resultado(parts[1],"success");
                                cargarTablaImagenes()
                            }else{
                                resultado(parts[1], 'error')
                            }
                        }
                    });
                }
            }
        });
    }

    function submitSubirImagenes() {
        var $form = $("#frmUpload");
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
                    cargarTablaImagenes()
                }else{
                    resultado(parts[1], 'error')
                    return false;
                }
            }
        });
    }

    function ordenar(id, valor) {
        po= bootbox.prompt({
            id: 'dialogoOrden',
            title: 'Cambiar orden ',
            closeButton: false,
            className: 'modal-sm',
            value:valor,
            buttons: {
                confirm: {
                    label: '<i class="fa fa-save"></i> Guardar',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<i class="fa fa-times"></i> Cancelar',
                    className: 'btn-info'
                }
            },
            callback: function (result) {
                return  guardarOrden(id, result)
            }
        });
    }

    function guardarOrden(id, valor) {
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'imagen', action: 'guardarOrden_ajax')}',
            data: {
                id: id,
                valor: valor
            },
            success: function (msg) {
                var parts = msg.split("_");
                if (parts[0] === 'ok') {
                    resultado(parts[1], "success");
                    cerrarDialogoOrden()
                    cargarTablaImagenes()
                } else {
                    resultado(parts[1], 'error')
                }
            }
        });
    }

    function cerrarDialogoOrden(){
        po.modal("hide");
    }

    function validarNum(ev) {
        /*
         48-57      -> numeros
         96-105     -> teclado numerico
         188        -> , (coma)
         190        -> . (punto) teclado
         110        -> . (punto) teclado numerico
         8          -> backspace
         46         -> delete
         9          -> tab
         37         -> flecha izq
         39         -> flecha der
         */
        return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
            (ev.keyCode >= 96 && ev.keyCode <= 105) ||
            ev.keyCode === 8 || ev.keyCode === 46 || ev.keyCode === 9 ||
            ev.keyCode === 37 || ev.keyCode === 39);
    }


    $("#dialogoOrden").keydown(function (ev) {
        return validarNum(ev);
    });


</script>


%{--<%@ page import="code2.Seccion" %>--}%

%{--<asset:javascript src="/ckeditor/ckeditor.js"/>--}%

%{--<div class="container justify-content-center mb-3 mt-3">--}%
%{--        <g:form name="frmArticulo" role="form" action="guardarArtc_ajax" method="POST">--}%
%{--            <div class="row">--}%
%{--                <div class="col-md-12">--}%
%{--                    <span class="col-md-2 label label-primary text-info mediano">Sección</span>--}%
%{--                    <div class="col-md-10 text-info">--}%
%{--                        <g:select name="seccion" id="seccionId" from="${code2.Seccion.list()}" optionKey="id"--}%
%{--                                  value="${artc?.seccion?.id}" optionValue="titulo" class="form-control"--}%
%{--                                  style="color: #3d658a"/>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <div class="row">--}%
%{--                <div class="grupo col-md-8">--}%
%{--                    <span class="col-md-3 label label-primary text-info mediano">Título</span>--}%

%{--                    <div class="col-md-9">--}%
%{--                        <g:textField name="titulo" id="titulo" class="form-control required"--}%
%{--                                     maxlength="127" value="${artc?.titulo}"/>--}%
%{--                    </div>--}%
%{--                </div>--}%

%{--                <div class="col-md-4">--}%
%{--                    <span class="col-md-3 label label-primary text-info mediano">Orden</span>--}%

%{--                    <div class="col-md-4">--}%
%{--                        <g:textField name="orden" id="orden" class="form-control required" maxlength="255"--}%
%{--                                     value="${artc?.orden}"/>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <div class="row">--}%
%{--                <div class="col-md-8">--}%
%{--                    <span class="col-md-3 label label-primary text-info mediano">Subtítulo</span>--}%

%{--                    <div class="col-md-9">--}%
%{--                        <span class="grupo">--}%
%{--                            <g:textArea name="subtitulo" id="subtitulo" class="form-control required" maxlength="255"--}%
%{--                                        style="height: 40px; resize: none" value="${artc?.subtitulo}"/>--}%
%{--                        </span>--}%
%{--                    </div>--}%
%{--                </div>--}%


%{--                <div class="col-md-4">--}%
%{--                    <span class="col-md-3 label label-primary text-info mediano">Estado</span>--}%

%{--                    <div class="col-md-6">--}%
%{--                        <g:select from="${['P':'Provisional', 'A':'Aprobado']}" optionValue="value" optionKey="key" class="form-control" name="estado" value="${artc?.estado}"/>--}%
%{--                    </div>--}%
%{--                </div>--}%

%{--            </div>--}%

%{--            <div class="row">--}%
%{--                <div class="col-md-12">--}%
%{--                    <span class="col-md-2 label label-primary text-info mediano">Descripción</span>--}%

%{--                    <div>--}%
%{--                        <div class="col-md-10">--}%
%{--                            <span class="grupo">--}%
%{--                                <g:textArea name="descripcion" id="descripcion" class="form-control required" maxlength="255"--}%
%{--                                            style="height: 60px; resize: none" value="${artc?.descripcion}"/>--}%
%{--                            </span>--}%
%{--                        </div>--}%

%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <div class="row">--}%
%{--                <div class="col-md-12">--}%
%{--                    <span class="col-md-2 label label-primary text-info mediano">Texto</span>--}%
%{--                    <div class="col-md-10">--}%
%{--                        <textarea name="texto" id="texto">${artc?.texto}</textarea>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <div class="row" style="margin-bottom: 20px">--}%
%{--                <div class="col-md-12">--}%
%{--                    <span class="col-md-2 label label-primary text-info mediano">Imagen</span>--}%

%{--                    <div class="col-md-10">--}%
%{--                        <g:textField name="imagen" id="imagen" class="form-control" maxlength="255"--}%
%{--                                     value="${artc?.imagen}"/>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <div class="row" style="margin-bottom: 20px">--}%
%{--                <span class="grupo col-md-12">--}%
%{--                    <span class="col-md-2 label label-primary text-info mediano">Meta</span>--}%
%{--                    <span class="grupo col-md-10">--}%
%{--                        <g:textField name="meta" id="metaDescripcion" class="form-control required" maxlength="255"--}%
%{--                                     value="${artc?.metaDescripcion}"/>--}%
%{--                    </span>--}%
%{--                </span>--}%
%{--            </div>--}%
%{--        </g:form>--}%
%{--</div>--}%




%{--<script type="text/javascript">--}%

%{--    CKEDITOR.replace('texto', {--}%
%{--        removePlugins: 'scayt,wsc',--}%
%{--        disableNativeSpellChecker: false,--}%
%{--        scayt_autoStartup: false,--}%
%{--        enableScaytAfterInit: false,--}%
%{--        height: "240px",--}%
%{--        customConfig: 'config.js',--}%
%{--        filebrowserBrowseUrl: '${createLink(controller: "artcImagenes", action: "browser")}',--}%
%{--        filebrowserUploadUrl: '${createLink(controller: "artcImagenes", action: "uploader")}'--}%
%{--    });--}%

%{--    CKEDITOR.on('instanceReady', function (ev) {--}%
%{--        ev.editor.document.on('drop', function (ev) {--}%
%{--            ev.data.preventDefault(true);--}%
%{--        });--}%
%{--    });--}%

%{--    $("#btnArticulo").click(function () {--}%
%{--        location.href = "${createLink(action: 'articulo')}"--}%
%{--    });--}%

%{--    $("#btnGuardar").click(function () {--}%
%{--        var $form = $("#frmArticulo");--}%
%{--        var txto = CKEDITOR.instances.texto.getData();--}%
%{--        var base_id = '${artc?.id}';--}%
%{--        if ($form.valid()) {--}%
%{--            $.ajax({--}%
%{--                type: 'POST',--}%
%{--                url: "${createLink(action: 'guardarArtc_ajax')}",--}%
%{--                data: {--}%
%{--                    id: base_id,--}%
%{--                    seccion: $("#seccionId").val(),--}%
%{--                    titulo: $("#titulo").val(),--}%
%{--                    orden: $("#orden").val(),--}%
%{--                    subtitulo: $("#subtitulo").val(),--}%
%{--                    descripcion: $("#descripcion").val(),--}%
%{--                    texto: txto,--}%
%{--                    imagen: $("#imagen").val(),--}%
%{--                    metaDescripcion: $("#metaDescripcion").val(),--}%
%{--                    estado : $("#estado").val()--}%
%{--                },--}%
%{--                success: function (msg) {--}%
%{--                    var parte = msg.split("_");--}%
%{--                    if (parte[0] === 'ok') {--}%
%{--                        log("Artículo guardado correctamente", "success");--}%
%{--                        setTimeout(function () {--}%
%{--                            reCargar(parte[1]);--}%
%{--                        }, 500);--}%
%{--                    } else {--}%
%{--                        log("Error al guardar el artículo", "error")--}%
%{--                    }--}%
%{--                }--}%
%{--            });--}%
%{--        }--}%
%{--    });--}%

%{--    function reCargar(id) {--}%
%{--        location.href = "${createLink(action: 'articulo')}" + "/" + id;--}%
%{--    }--}%

%{--    const validator = $("#frmArticulo").validate({--}%
%{--        errorClass: "help-block",--}%
%{--        errorPlacement: function (error, element) {--}%
%{--            if (element.parent().hasClass("input-group")) {--}%
%{--                error.insertAfter(element.parent());--}%
%{--            } else {--}%
%{--                error.insertAfter(element);--}%
%{--            }--}%
%{--            element.parents(".grupo").addClass('has-error');--}%
%{--        },--}%
%{--        success: function (label) {--}%
%{--            label.parents(".grupo").removeClass('has-error');--}%
%{--        },--}%
%{--        rules: {--}%
%{--            titulo: {--}%
%{--                remote: {--}%
%{--                    url: "${createLink(action: 'validarTitulo_ajax')}",--}%
%{--                    type: "post",--}%
%{--                    data: {--}%
%{--                        id: $("#titulo").val()--}%
%{--                    }--}%
%{--                }--}%
%{--            },--}%
%{--            meta: {--}%
%{--                remote: {--}%
%{--                    url: "${createLink(action: 'validarMeta_ajax')}",--}%
%{--                    type: "post",--}%
%{--                    data: {--}%
%{--                        meta: $("#meta").val()--}%
%{--                    }--}%
%{--                }--}%
%{--            }--}%
%{--        },--}%
%{--        messages: {--}%
%{--            titulo: {--}%
%{--                remote: "El número mínimo de caracteres debe ser de 3"--}%
%{--            },--}%
%{--            meta: {--}%
%{--                remote: "El campo meta esta vacío"--}%
%{--            }--}%
%{--        }--}%
%{--    });--}%

%{--    $(".form-control").keydown(function (ev) {--}%
%{--        if (ev.keyCode === 13) {--}%
%{--            submitForm();--}%
%{--            return false;--}%
%{--        }--}%
%{--        return true;--}%
%{--    });--}%

%{--    --}%%{--$("#btnVer").click(function () {--}%
%{--    --}%%{--    const id_base = ${artc?.id}--}%
%{--    --}%%{--        $.ajax({--}%
%{--    --}%%{--            type: 'POST',--}%
%{--    --}%%{--            url: '${createLink(controller: 'articulo', action: 'show_ajax')}',--}%
%{--    --}%%{--            data: {--}%
%{--    --}%%{--                id: id_base--}%
%{--    --}%%{--            },--}%
%{--    --}%%{--            success: function (msg) {--}%
%{--    --}%%{--                $("#dialog-body").html(msg)--}%
%{--    --}%%{--            }--}%
%{--    --}%%{--        });--}%
%{--    --}%%{--});--}%


%{--</script>--}%

<%@ page import="code2.Seccion" %>

<asset:javascript src="/ckeditor/ckeditor.js"/>

<style>

/* Integrar CKEditor con el estilo de Bootstrap */
.cke_chrome {
    border: 1px solid #ced4da !important;
    border-radius: 0.375rem !important;
    box-shadow: none !important;
}

.cke_top {
    background: #f8f9fa !important;
    border-bottom: 1px solid #ced4da !important;
    border-radius: 0.375rem 0.375rem 0 0 !important;
}

.cke_bottom {
    background: #f8f9fa !important;
    border-top: 1px solid #ced4da !important;
    border-radius: 0 0 0.375rem 0.375rem !important;
}

.cke_focus {
    border-color: #86b7fe !important;
    box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25) !important;
}

</style>

<div class="container-fluid px-3 py-2">
    <g:form name="frmArticulo" role="form" action="guardarArticulo_ajax" method="POST">
        <div class="row g-3 mb-3">
            <div class="col-md-6">
                <label for="seccionId" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-folder me-1"></i> Sección
                </label>
                <g:select name="seccion" id="seccionId"
                          from="${code2.Seccion.list()}"
                          optionKey="id"
                          optionValue="titulo"
                          value="${artc?.seccion?.id}"
                          class="form-select"/>
            </div>

            <div class="col-md-3">
                <label for="orden" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-sort-numeric-down me-1"></i> Orden
                </label>
                <g:textField name="orden" id="orden"
                             class="form-control required" maxlength="255"
                             value="${artc?.orden}"/>
            </div>

            <div class="col-md-3">
                <label for="estado" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-toggle-on me-1"></i> Estado
                </label>
                <g:select name="estado" id="estado"
                          from="${['P':'Provisional', 'A':'Aprobado']}"
                          optionValue="value" optionKey="key"
                          value="${artc?.estado}"
                          class="form-select"/>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-12">
                <label for="titulo" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-fonts me-1"></i> Título
                </label>
                <g:textField name="titulo" id="titulo"
                             class="form-control required" maxlength="127"
                             value="${artc?.titulo}"/>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-12">
                <label for="subtitulo" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-type me-1"></i> Subtítulo
                </label>
                <g:textArea name="subtitulo" id="subtitulo"
                            class="form-control required" maxlength="255"
                            rows="2"
                            value="${artc?.subtitulo}" style="resize: none"/>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-12">
                <label for="descripcion" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-text-paragraph me-1"></i> Descripción
                </label>
                <g:textArea name="descripcion" id="descripcion"
                            class="form-control required" maxlength="255"
                            rows="3"
                            value="${artc?.descripcion}" style="resize: none"/>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-12">
                <label for="texto" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-file-richtext me-1"></i> Texto
                </label>
                <textarea name="texto" id="texto">${artc?.texto}</textarea>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-md-12">
                <label for="metaDescripcion" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-search me-1"></i> Meta descripción (SEO)
                </label>
                <g:textField name="meta" id="metaDescripcion"
                             class="form-control required" maxlength="255"
                             value="${artc?.metaDescripcion}"/>
                <div class="form-text">Máximo 255 caracteres.</div>
            </div>
        </div>
    </g:form>
</div>

<script type="text/javascript">
    CKEDITOR.replace('texto', {
        removePlugins: 'scayt,wsc',
        disableNativeSpellChecker: false,
        scayt_autoStartup: false,
        enableScaytAfterInit: false,
        height: "240px",
        customConfig: 'config.js',
        filebrowserBrowseUrl: '${createLink(controller: "artcImagenes", action: "browser")}',
        filebrowserUploadUrl: '${createLink(controller: "artcImagenes", action: "uploader")}'
    });

    CKEDITOR.on('instanceReady', function (ev) {
        ev.editor.document.on('drop', function (ev) {
            ev.data.preventDefault(true);
        });
    });

    function guardarArticulo(){
        var $form = $("#frmArticulo");
        var txto = CKEDITOR.instances.texto.getData();
        var base_id = '${artc?.id}';
        if ($form.valid()) {
            $.ajax({
                type: 'POST',
                url: "${createLink(controller: 'articulo', action: 'guardarArticulo_ajax')}",
                data: {
                    id: base_id,
                    seccion: $("#seccionId").val(),
                    titulo: $("#titulo").val(),
                    orden: $("#orden").val(),
                    subtitulo: $("#subtitulo").val(),
                    descripcion: $("#descripcion").val(),
                    texto: txto,
                    imagen: $("#imagen").val(),
                    metaDescripcion: $("#metaDescripcion").val(),
                    estado: $("#estado").val()
                },
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] === 'ok') {
                        cerrarEditarArticulo();
                        resultado(parts[1], "success");
                        cargarTablaArticulos($("#seccionId").val());
                    } else {
                        resultado(parts[1], "error");
                    }
                }
            });
        }
    }

    // $("#btnGuardar").click(function () {
    //
    // });

    function reCargar(id) {
        location.href = "${createLink(action: 'articulo')}" + "/" + id;
    }

    var validator = $("#frmArticulo").validate({
        errorClass: "help-block",
        errorPlacement: function (error, element) {
            if (element.parent().hasClass("input-group")) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
            element.parents(".grupo").addClass('has-error');
        },
        success: function (label) {
            label.parents(".grupo").removeClass('has-error');
        },
        %{--rules: {--}%
        %{--    titulo: {--}%
        %{--        remote: {--}%
        %{--            url: "${createLink(action: 'validarTitulo_ajax')}",--}%
        %{--            type: "post",--}%
        %{--            data: { id: $("#titulo").val() }--}%
        %{--        }--}%
        %{--    },--}%
        %{--    meta: {--}%
        %{--        remote: {--}%
        %{--            url: "${createLink(action: 'validarMeta_ajax')}",--}%
        %{--            type: "post",--}%
        %{--            data: { meta: $("#meta").val() }--}%
        %{--        }--}%
        %{--    }--}%
        %{--},--}%
        %{--messages: {--}%
        %{--    titulo: { remote: "El número mínimo de caracteres debe ser de 3" },--}%
        %{--    meta: { remote: "El campo meta está vacío" }--}%
        %{--}--}%
    });

    $(".form-control, .form-select").keydown(function (ev) {
        if (ev.keyCode === 13) {
            guardarArticulo();
            return false;
        }
        return true;
    });

    window.guardarArticulo = guardarArticulo;

</script>


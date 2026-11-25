
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
            <div class="col-md-4">
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
                             class="form-control required" maxlength="3"
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
            <div class="col-md-2">
                <label for="destacado" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-toggle-on me-1"></i> Destacado
                </label>
                <g:select name="destacado" id="destacado"
                          from="${['S':'SI', 'N':'NO']}"
                          optionValue="value" optionKey="key"
                          value="${artc?.destacado == 'S' ?: 'N'}"
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
                <label for="cliente" class="form-label fw-semibold text-secondary">
                    <i class="fa fa-users me-1"></i> Clientes
                </label>
                <g:textField name="cliente" id="cliente"
                             class="form-control" maxlength="255"
                             value="${artc?.cliente}"/>
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
                    estado: $("#estado").val(),
                    destacado: $("#destacado").val(),
                    cliente: $("#cliente").val()
                },
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] === 'ok') {
                        resultado(parts[1], "success");
                        cerrarEditarArticulo();
                        cargarTablaArticulos($("#seccionId").val());
                    } else {
                        resultado(parts[1], "error");
                    }
                }
            });
        }
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
        }
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


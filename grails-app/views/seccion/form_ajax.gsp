
<%@ page import="code2.Sitio; code2.Seccion" %>

<div class="container-fluid px-3 py-2">
    <g:form name="frmSeccion" role="form" action="guardarSeccion_ajax" method="POST">
        <g:hiddenField name="id" value="${seccion?.id}"/>
        <div class="row g-3 mb-3">
            <div class="col-md-3">
                <label for="sitio" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-folder me-1"></i> Sitio
                </label>
                <g:select name="sitio" id="sitio"
                          from="${code2.Sitio.list()}"
                          optionKey="id"
                          optionValue="nombre"
                          value="${seccion?.sitio?.id}"
                          class="form-select"/>
            </div>

            <div class="col-md-3">
                <label for="layout" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-folder me-1"></i> Layout
                </label>
                <g:select name="layout" id="layout"
                          from="${code2.Layout.list()}"
                          optionKey="id"
                          optionValue="descripcion"
                          value="${seccion?.layout?.id}"
                          class="form-select"/>
            </div>

            <div class="col-md-3">
                <label for="orden" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-sort-numeric-down me-1"></i> Orden
                </label>
                <g:textField name="orden" id="orden"
                             class="form-control required" maxlength="3"
                             value="${seccion?.orden}"/>
            </div>

            <div class="col-md-3">
                <label for="estado" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-toggle-on me-1"></i> Estado
                </label>
                <g:select name="estado" id="estado"
                          from="${['N':'Provisional', 'A':'Aprobado']}"
                          optionValue="value" optionKey="key"
                          value="${seccion?.estado}"
                          class="form-select"/>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-12">
                <label for="titulo" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-fonts me-1"></i> Título
                </label>
                <g:textField name="titulo" id="titulo"
                             class="form-control required" maxlength="255"
                             value="${seccion?.titulo}"/>
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
                            value="${seccion?.subtitulo}" style="resize: none"/>
            </div>
        </div>
        <div class="row g-3 mb-3">
            <div class="col-md-12">
                <label for="menu" class="form-label fw-semibold text-secondary">
                    <i class="bi bi-search me-1"></i> Menú
                </label>
                <g:textField name="menu" id="menu"
                             class="form-control required" maxlength="63"
                             value="${seccion?.menu}"/>
            </div>
        </div>
    </g:form>
</div>

<script type="text/javascript">

     var validator = $("#frmSeccion").validate({
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
            guardarSeccion();
            return false;
        }
        return true;
    });

</script>


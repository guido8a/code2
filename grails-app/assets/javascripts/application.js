// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require webjars/jquery/%/dist/jquery.js
//= require webjars/bootstrap/%/dist/js/bootstrap.bundle.js
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}

function cargarLoader(texto){
    var cl = bootbox.dialog({
        id: 'loader',
        message: '<p class="text-center mb-0" style="font-size: 14px"><i class="fa fa-3x fa-spin fa-cog"></i>' + texto + '</p>',
        closeButton: false
    });
    return cl
}
function cerrarLoader($loader) {
    if (!$loader || $loader.length === 0) return;
    var el = $loader[0];

    // 1. Intentar con Bootstrap
    try {
        var inst = bootstrap.Modal.getInstance(el);
        if (inst) {
            inst._isTransitioning = false;
            inst.hide();
        }
    } catch (e) {}
}
function resultado(texto, tipo) {
    let icono, color;
    if (tipo === 'success') {
        icono = 'fa-check-circle';
        color = 'text-success';
    } else if (tipo === 'error') {
        icono = 'fa-times-circle';
        color = 'text-danger';
    } else if (tipo === 'warning') {
        icono = 'fa-exclamation-triangle';
        color = 'text-warning';
    } else {
        icono = 'fa-cog fa-spin';   // spinner por defecto
        color = 'text-primary';
    }

    var dr = bootbox.dialog({
        message: '<p class="text-center mb-0" style="font-size: 14px">' +
            '<i class="fa fa-3x ' + icono + ' ' + color + '"></i><br>' +
            texto +
            '</p>',
        closeButton: true
    });

    setTimeout(function () {
        dr.modal('hide');
    }, 3000);
    return dr;
}


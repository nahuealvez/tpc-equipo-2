﻿/* Modales de usuario */
function abrirModalAgregarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarUsuario"), {
        keyboard: false,
        dismiss: "modal"
    });
    pageModal.show();
}

/* Modales de especialista */
function abrirModalAgregarEspecialista() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarEspecialista"), {
        keyboard: false,
        dismiss: "modal"
    });
    pageModal.show();
}


/* Modales de especialidad */
function abrirModalAgregarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalModificarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("ModificarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalEliminarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("EliminarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalDesactivarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("DesactivarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalActivarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("ActivarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalErrorAgregarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorAgregarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalErrorModificarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorModificarEspecialidad"), { keyboard: false });
    pageModal.show();
}

function abrirModalErrorEliminarEspecialidad() {
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorModificarEspecialidad"), { keyboard: false });
    pageModal.show();
}
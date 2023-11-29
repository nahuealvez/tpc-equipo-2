﻿/* Modales de paciente */
function abrirModalAgregarPaciente() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarPaciente"), {
        keyboard: false,
        dismiss: "modal"
    });
    pageModal.show();
}

function abrirModalModificarPaciente() {
    var pageModal = new bootstrap.Modal(document.getElementById("ModificarPaciente"), { keyboard: false });
    pageModal.show();
}

function abrirModalAgendarTurno() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgendarTurno"), { keyboard: false });
    pageModal.show();
}

function abrirModalAgregarMotivoConsulta() {
    var pageModal = new bootstrap.Modal(document.getElementById("MotivoConsulta"), { keyboard: false });
    pageModal.show();
}

function abrirModalConfirmarTurno() {
    var pageModal = new bootstrap.Modal(document.getElementById("ConfirmacionTurno"), { keyboard: false });
    pageModal.show();
}
function abrirModalErrorAgendarTurnoSuperpuesto() {
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorAgendarTurnoSuperpuesto"), { keyboard: false });
    pageModal.show();
}

/* Modales de usuario */
function abrirModalAgregarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarUsuario"), {
        keyboard: false,
        dismiss: "modal"
    });
    pageModal.show();
}

function abrirModalModificarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("ModificarUsuario"), { keyboard: false });
    pageModal.show();
}

function abrirModalDesactivarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("DesactivarUsuario"), { keyboard: false });
    pageModal.show();
}

function abrirModalActivarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("ActivarUsuario"), { keyboard: false });
    pageModal.show();
}

function abrirModalEliminarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("EliminarUsuario"), { keyboard: false });
    pageModal.show();
}

function abrirModalNoEliminarUsuario() {
    var pageModal = new bootstrap.Modal(document.getElementById("NoEliminarUsuario"), { keyboard: false });
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

function abrirModalModificarEspecialista() {
    var pageModal = new bootstrap.Modal(document.getElementById("ModificarEspecialista"), { keyboard: false });
    pageModal.show();
}

function abrirModalAgregarQuitarEspecialidades() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarQuitarEspecialidades"), { keyboard: false });
    pageModal.show();
}

function abrirModalDesactivarEspecialista() {
    console.log("Función ejecutada");
    var pageModal = new bootstrap.Modal(document.getElementById("DesactivarEspecialista"), { keyboard: false });
    pageModal.show();
}

function abrirModalActivarEspecialista() {
    var pageModal = new bootstrap.Modal(document.getElementById("ActivarEspecialista"), { keyboard: false });
    pageModal.show();
}

function abrirModalEliminarEspecialista() {
    var pageModal = new bootstrap.Modal(document.getElementById("EliminarEspecialista"), { keyboard: false });
    pageModal.show();
}

function abrirModalErrorEliminarEspecialista() {
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorEliminarEspecialista"), { keyboard: false });
    pageModal.show();
}

function abrirModalConfigurarJornada() {
    var pageModal = new bootstrap.Modal(document.getElementById("ConfigurarJornada"), { keyboard: false });
    pageModal.show();
}
function ErrorAgregarJornadaSuperpuesta() {
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorAgregarJornadaSuperpuesta"), { keyboard: false });
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
    var pageModal = new bootstrap.Modal(document.getElementById("ErrorEliminarEspecialidad"), { keyboard: false });
    pageModal.show();
}

/* Modales de turnos */
function abrirModalCancelarTurno() {
    var pageModal = new bootstrap.Modal(document.getElementById("CancelarTurno"), { keyboard: false });
    pageModal.show();
}

function abrirModalVerDetalleTurno() {
    var pageModal = new bootstrap.Modal(document.getElementById("VerDetalleTurno"), { keyboard: false });
    pageModal.show();
}

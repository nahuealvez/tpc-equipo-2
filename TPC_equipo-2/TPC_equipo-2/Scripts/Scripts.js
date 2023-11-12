/* Modales de paciente */
function abrirModalAgregarPaciente() {
    var pageModal = new bootstrap.Modal(document.getElementById("AgregarPaciente"), {
        keyboard: false,
        dismiss: "modal"
    });
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
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="TPC_equipo_2.Pacientes" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        //if (UsuarioLogeado.Perfil != (int)dominio.EnumPerfil.Especialista)
        if (UsuarioLogeado != null && UsuarioLogeado.Perfil != (int)dominio.EnumPerfil.Especialista)
        {%>
    <div class="container">
        <h2 class="pt-3 pb-3">Pacientes</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <asp:TextBox CssClass="form-control me-2 input-number-noneButtons" placeholder="Buscar por DNI" Type="number" ID="txtBusqueda" runat="server" />
                        <asp:Button ID="btnBuscarPacientePorDNI" TextMode="SigleLine" Text="Buscar" class="btn btn-color-project-primary" OnClick="btnBuscarPorDNIPaciente_Click" runat="server" />
                    </li>
                    <li class="nav-item">
                        <asp:Button Text="Agregar paciente" ID="btnAgregar" CssClass="btn btn-color-project-primary" runat="server" OnClick="btnAgregarPaciente_Click" />
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col" class="align-middle">DNI</th>
                            <th scope="col" class="align-middle">Apellidos</th>
                            <th scope="col" class="align-middle">Nombres</th>
                            <th scope="col" class="align-middle">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="repRepetidor">
                            <ItemTemplate>
                                <tr>
                                    <td class="align-middle" style="width: 100px"><%#Eval("Dni")%></td>
                                    <td class="align-middle"><%#Eval("Apellido")%></td>
                                    <td class="align-middle"><%#Eval("Nombre")%></td>
                                    <td style="max-width: 170px;" class="align-middle">
                                        <div class="btn-group">
                                            <asp:Button Text="Agendar turno" ID="btnAgendarTurno" CssClass="btn btn-success" Style="width: 130px;" runat="server" CommandArgument='<%#Eval("IdPaciente") %>' CommandName="EspecialidadId" OnClick="btnAgendarTurno_Click" />
                                            <asp:Button Text="Modificar" ID="btnModificar" CssClass="btn btn-color-project-primary" Style="width: 130px" runat="server" CommandArgument='<%#Eval("IdPaciente") %>' CommandName="EspecialidadId" OnClick="btnModificarPaciente_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <% }
        else
        {%>
    <h2 class="h2">Acceso solo para Recepcionistas y Administradores</h2>
    <h5 class="h5">Inicie sesión con los permisos requeridos</h5>


    <% }
    %>


    <!-- Modal agregar Paciente -->
    <div class="modal fade" id="AgregarPaciente" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="agregarPacienteLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgregarPaciente">Agregar paciente</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="valSummaryForm" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3" data-bs-backdrop="static" data-bs-keyboard="false">
                                <label for="lblApellidosPaciente" class="form-label">Apellidos</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxApellidos" />
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNombresPaciente" class="form-label">Nombres</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxNombres" />
                            </div>
                            <div class="mb-3">
                                <label for="lblDni" class="form-label">DNI (Sin puntos)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxDNI" />
                            </div>
                            <div class="mb-3">
                                <label for="lblSexo" class="form-label">Sexo</label>
                                <asp:DropDownList ID="DropDownListSexo" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                    <asp:ListItem Text="Masculino" Value="M" />
                                    <asp:ListItem Text="Femenino" Value="F" />
                                    <asp:ListItem Text="No especificado" Value="X" />
                                </asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="lblFechaNacimiento" class="form-label">Fecha de nacimiento</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxFechaNacimiento" type="date" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="lblEmail" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxEmail" type="mail" />
                            </div>
                            <div class="mb-3">
                                <label for="lblTelefono" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxTelefono" />
                            </div>
                            <div class="mb-3">
                                <label for="lblCobertura" class="form-label">Cobertura</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxCobertura" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNroCredencial" class="form-label">Nro. de credencial</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxNroCredencial" />
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        * Todos los campos son obligatorios
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarAgregarPaciente_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal modificar Paciente -->
    <div class="modal fade" id="ModificarPaciente" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modificarPacienteLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblModificarPaciente">Modificar paciente</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="ValidationSummary1" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3" data-bs-backdrop="static" data-bs-keyboard="false">
                                <label for="lblModApellidosPaciente" class="form-label">Apellidos</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModApellidoPaciente" />
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblModNombresPaciente" class="form-label">Nombres</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModNombrePaciente" />
                            </div>
                            <div class="mb-3">
                                <label for="lblModDniPaciente" class="form-label">DNI (Sin puntos)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModDniPaciente" />
                            </div>
                            <div class="mb-3">
                                <label for="lblModSexoPaciente" class="form-label">Sexo</label>
                                <asp:DropDownList ID="dplModSexoPaciente" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                    <asp:ListItem Text="Masculino" Value="M" />
                                    <asp:ListItem Text="Femenino" Value="F" />
                                    <asp:ListItem Text="No especificado" Value="X" />
                                </asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="lblModFechaNacimientoPaciente" class="form-label">Fecha de nacimiento</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModNacPaciente" type="date" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="lblModEmailPaciente" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModEmailPaciente" type="mail" />
                            </div>
                            <div class="mb-3">
                                <label for="lblModTelefonoPaciente" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModTelPaciente" />
                            </div>
                            <div class="mb-3">
                                <label for="lblModCoberturaPaciente" class="form-label">Cobertura</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModCoberturaPaciente" />
                            </div>
                            <div class="mb-3">
                                <label for="lblModNroCredencialPaciente" class="form-label">Nro. de credencial</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModCredPaciente" />
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        * Todos los campos son obligatorios
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardModPaciente" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarModPaciente_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal agendar turno -->
    <div class="modal fade" id="AgendarTurno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="AgendarTurnoLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgendarTurno">Agendar turno</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="ValidationSummary2" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="lblSelectorEspecialidades" class="form-label">Especialidad</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlEspecialidades" CssClass="form-select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged">
                                        <asp:ListItem Text="" Selected="True" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="lblSelectorEspecialistas" class="form-label">Especialista</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlEspecialistas" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="" Selected="True" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mb-3">
                                <asp:Button ID="btnBuscarTurnos" Text="Buscar turno" CssClass="btn btn-color-project-primary" runat="server" OnClick="btnBuscarTurnos_Click" Visible="false" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr class="table-primary">
                                    <th scope="col" class="align-middle text-center">Fecha</th>
                                    <th scope="col" class="align-middle text-center">Hora</th>
                                    <th scope="col" class="align-middle text-center">Especialidad</th>
                                    <th scope="col" class="align-middle text-center">Especialista</th>
                                    <th scope="col" class="align-middle text-center">Acciones</th>
                                </tr>
                                <asp:Repeater ID="repTurnosDisponibles" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="align-middle text-center"><%#((DateTime)Eval("FechaHora")).ToString("dd/MM/yyyy")%></td>
                                            <td class="align-middle text-center"><%#((DateTime)Eval("FechaHora")).ToString("HH:mm")%></td>
                                            <td class="align-middle text-center"><%#Eval("Especialidad.Descripcion")%></td>
                                            <td class="align-middle text-center"><%#Eval("Usuario.Apellido")%> <%#Eval("Usuario.Nombre")%></td>
                                            <td class="align-middle text-center" style="width: auto;">
                                                <asp:Button Text="Seleccionar" CssClass="btn btn-color-project-primary" runat="server" OnClientClick="return btnPrevenirCierreModal()" CommandArgument='<%#Eval("IdTurno") %>' CommandName="TurnoSeleccionado" OnClick="btnConfirmarSeleccionTurno_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </thead>
                        </table>
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal agregar motivo de consulta al turno -->
    <div class="modal fade" id="MotivoConsulta" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="MotivoConsultaLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblMotivoConsulta">Agregar motivo de consulta</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card-body d-flex flex-column gap-2">
                        <label for="motivoConsulta">Motivo de consulta</label>
                        <asp:TextBox ID="tbxMotivoConsulta" CssClass="form-control" TextMode="MultiLine" Rows="5" runat="server" />
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button CssClass="btn btn-success" Text="Guardar" OnClick="btnAgregarMotivoConsulta_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal confirmación de turno -->
    <div class="modal fade" id="ConfirmacionTurno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ConfirmacionTurnoLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblConfirmacionTurno">Confirmación de turno</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card-body">
                        <label for="motivoConsulta">Motivo de consulta: </label>
                        <asp:Label Text="Motivo" ID="lblMotivoConsultaAConfirmar" runat="server" />
                    </div>
                    <div class="card-body">
                        <label for="Dia">Dia / Horario: </label>
                        <asp:Label Text="Fecha" ID="lblFechaTurno" runat="server" />
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <asp:Button CssClass="btn btn-danger" Text="Cancelar" OnClick="btnNoConfirmarTurno_Click" runat="server" />
                    <asp:Button CssClass="btn btn-success" Text="Confirmar" OnClick="btnConfirmarTurno_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

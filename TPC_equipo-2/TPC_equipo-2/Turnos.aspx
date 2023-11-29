<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPC_equipo_2.Turnos" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (UsuarioLogeado != null)
        {%>
    <div class="container">
        <h2 class="pt-3 pb-3">Turnos</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <asp:TextBox CssClass="form-control me-2 input-number-noneButtons" placeholder="Buscar por DNI" Type="number" ID="txtBusqueda" runat="server" />
                        <asp:Button ID="btnBuscarTurnoPorDNIPaciente" TextMode="SigleLine" Text="Buscar" class="btn btn-color-project-primary" OnClick="btnBuscarPorDNIPaciente_Click" runat="server" />
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col" class="align-middle" style="width: 80px;">ID Turno</th>
                            <th scope="col" class="align-middle" style="width: auto;">DNI paciente</th>
                            <th scope="col" class="align-middle" style="width: auto;">Paciente</th>
                            <th scope="col" class="align-middle" style="width: auto;">Especialidad</th>
                            <th scope="col" class="align-middle" style="width: auto;">Especialista</th>
                            <th scope="col" class="align-middle" style="width: auto;">Fecha</th>
                            <th scope="col" class="align-middle" style="width: auto;">Hora</th>
                            <th scope="col" class="align-middle" style="width: auto;">Estado</th>
                            <th scope="col" class="align-middle" style="width: auto;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="repRepetidor">
                            <ItemTemplate>
                                <tr>
                                    <td class="align-middle"><%#Eval("IdTurno")%></td>
                                    <td class="align-middle"><%#Eval("Paciente.Dni")%></td>
                                    <td class="align-middle"><%#Eval("Paciente.Apellido")%> <%#Eval("Paciente.Nombre")%></td>
                                    <td class="align-middle"><%#Eval("Especialidad.Descripcion")%></td>
                                    <td class="align-middle"><%#Eval("Usuario.Apellido")%> <%#Eval("Usuario.Nombre")%></td>
                                    <td class="align-middle"><%#((DateTime)Eval("FechaHora")).ToString("dd/MM/yyyy") %></td>
                                    <td class="align-middle"><%#((DateTime)Eval("FechaHora")).ToString("HH:mm") + " hs" %></td>
                                    <td class='<%# "align-middle " + ((string)Eval("Estado.Descripcion") == "Pendiente" ? "bg-warning-subtle" : ((string)Eval("Estado.Descripcion") == "Atendido" ? "bg-success-subtle" : "bg-danger-subtle")) %>'>
                                        <%# Eval("Estado.Descripcion") %>
                                    </td>
                                    <td style="max-width: auto;" class="align-middle">
                                        <div class="btn-group">
                                            <asp:Button Text="Ver turno" ID="btnVerDetalle" Visible="true" CssClass="btn btn-color-project-primary" Style="width: 130px" runat="server" CommandArgument='<%#Eval("IdTurno") %>' CommandName="IdTurno" OnClick="btnVerDetalle_Click" />
                                            <asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-danger" Style="width: 130px" runat="server" CommandArgument='<%#Eval("IdTurno") %>' CommandName="IdTurno" OnClick="btnCancelarTurno_Click" />
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
    <%}
        else
        {%>
    <h2 class="h2">Usuario no registrado</h2>
    <h5 class="h5">Debe iniciar sesión para acceder</h5>

    <%}
    %>


    <%-- Modal cancelar turno --%>
    <div class="modal fade" id="CancelarTurno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="cancelarTurnoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblEliminarEspecialidad">Cancelar turno</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">¿Está seguro que desea cancelar el turno?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarCancelarTurno_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal ver detalle de turno --%>
    <div class="modal fade" id="VerDetalleTurno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="verDetalleTurnoLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblVerTurno">Detalle de turno</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 d-flex flex-column gap-3">
                        <%--<div class="d-flex flex-column">
                            <asp:Label ID="LabelIdTurno" Text="Id Turno" CssClass="form-label" runat="server" />
                            <asp:TextBox Enabled="false" ID="txtIdTurno" CssClass="form-control" runat="server" />
                        </div>--%>
                        <div class="d-flex flex-column">
                            <asp:Label ID="LabelFecha" Text="Fecha" CssClass="form-label" runat="server" />
                            <asp:TextBox Enabled="false" ID="txtFecha" CssClass="form-control" runat="server" />
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="LabelHora" Text="Hora" CssClass="form-label" runat="server" />
                            <asp:TextBox Enabled="false" ID="txtHora" CssClass="form-control" runat="server" />
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="LabelEspecialidad" Text="Especialidad" CssClass="form-label" runat="server" />
                            <asp:TextBox Enabled="false" ID="txtEspecialidad" CssClass="form-control" runat="server" MaxLength="50"/>
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="LabelEspecialista" Text="Especialista" CssClass="form-label" runat="server" />
                            <asp:TextBox Enabled="false" ID="txtEspecialista" CssClass="form-control" runat="server" MaxLength="50"/>
                        </div>
                        <div class="d-flex flex-column">
                            <asp:Label ID="LabelMotivoConsulta" Text="Motivo de consulta" CssClass="form-label" runat="server" />
                            <asp:TextBox Enabled="false" ID="txtMotivoConsulta" CssClass="form-control" TextMode="MultiLine" Rows="5" runat="server" MaxLength="200"/>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="card-body d-flex flex-column gap-2">
                            <label for="diagnostico">Diagnóstico</label>
                            <asp:TextBox ID="tbxDiagnostico" CssClass="form-control" TextMode="MultiLine" MaxLength="444" Rows="5" runat="server" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblAlertDiagnostico" class="alert alert-warning d-flex justify-content-center align-items-center" role="alert" Text="Para cambiar el estado a Atendido se requiere completar el diagnóstico." runat="server" />
                        <asp:Label Visible="false" ID="lblDangerDiagnostico" class="alert alert-danger d-flex justify-content-center align-items-center" role="alert" Text="Falta cargar el diagnóstico para cambiar el estado a Atendido" runat="server" />
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Label ID="lblEstadoTurno" CssClass="h5" Text="Estado del turno | " runat="server" />
                    <asp:Button ID="btnAusente" Text="Ausente" CssClass="btn btn-warning" data-bs-dismiss="modal" runat="server" OnClick="btnMarcarEstadoAusente_Click" />
                    <asp:Button ID="btnAtendido" Text="Atendido" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnMarcarEstadoAtendido_Click" OnClientClick="return validarDiagnostico();" />
                    <asp:Label ID="lblPipe" CssClass="h5" Text=" | " runat="server" />
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPC_equipo_2.Turnos" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="pt-3 pb-3">Turnos</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <asp:TextBox CssClass="form-control me-2" placeholder="Buscar por DNI" ID="txtBusqueda" runat="server" />
                        <asp:Button ID="btnBuscarTurnoPorDNIPaciente" Text="Buscar" class="btn btn-color-project-primary" OnClick="btnBuscarPorDNIPaciente_Click" runat="server" />
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
                                    <td class='<%# "align-middle " + ((string)Eval("Estado.Descripcion") == "Pendiente" ? "bg-warning-subtle" : ((string)Eval("Estado.Descripcion") == "Atendido" ? "bg-success-subtle" : "bg-danger-subtle")) %>'>
                                        <%# Eval("Estado.Descripcion") %>
                                    </td>
                                    <td style="max-width: auto;" class="align-middle">
                                        <div class="btn-group">
                                            <asp:Button Text="Ver detalle" ID="btnVerDetalle" Visible="true" CssClass="btn btn-color-project-primary" Style="width: 130px" runat="server" CommandArgument='<%#Eval("IdTurno") %>' CommandName="IdTurno" />
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
</asp:Content>

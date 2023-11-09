<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialistas.aspx.cs" Inherits="TPC_equipo_2.Especialistas" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="pt-3 pb-3">Especialistas</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <form class="d-flex" role="buscar">
                            <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                            <button class="btn btn-color-project-primary" type="submit">Buscar</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <asp:Button Text="Agregar especialista" ID="btnAgregar" CssClass="btn btn-color-project-primary" runat="server" OnClick="btnAgregarEspecialista_Click" />
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col" class="align-middle">Especialista</th>
                            <th scope="col" class="align-middle">Estado</th>
                            <th scope="col" class="align-middle">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="repRepetidor">
                            <ItemTemplate>
                                <tr>
                                    <td class="align-middle"><%#Eval("Descripcion")%></td>
                                    <td class="<%# (bool)Eval("Estado") ? "bg-success-subtle align-middle" : "bg-warning-subtle align-middle" %>">
                                        <%#(bool)Eval("Estado") ? "Activo" : "Inactivo" %>
                                    </td>
                                    <td style="max-width: 120px;" class="align-middle">
                                        <div class="btn-group">
                                            <asp:Button Text="Modificar" ID="btnModificar" CssClass="btn btn-color-project-primary" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnModificarEspecialista_Click" />
                                            <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnEliminarEspecialista_Click" />
                                            <asp:Button Text="Desactivar" ID="btnDesactivar" CssClass="btn btn-warning" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnDesactivarEspecialista_Click" Visible="true" />
                                            <asp:Button Text="Activar" ID="btnActivar" CssClass="btn btn-success" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnActivarEspecialista_Click" Visible="false" />

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

    <!-- Modal agregar usuario -->
    <div class="modal fade" id="AgregarEspecialista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="agregarEspecialistaLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgregarEspecialista">Agregar especialista</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="valSummaryForm" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3" data-bs-backdrop="static" data-bs-keyboard="false">
                                <label for="lblApellidosUsuario" class="form-label">Apellidos</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxApellidos" />
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNombresUsuario" class="form-label">Nombres</label>
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
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtFechaNacimiento" type="date" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="lblEmail" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" type="mail" />
                            </div>
                            <div class="mb-3">
                                <label for="lblTelefono" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtTelefono" />
                            </div>
                            <div class="mb-3">
                                <label for="lblUsuario" class="form-label">Usuario</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxUsuario" />
                            </div>
                            <div class="mb-3">
                                <label for="lblContrasenia" class="form-label">Contraseña</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxContrasenia" type="password" />
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        * Todos los campos son obligatorios
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarAgregarEspecialista_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

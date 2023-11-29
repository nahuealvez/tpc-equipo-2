<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TPC_equipo_2.Usuarios" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (UsuarioLogeado != null && UsuarioLogeado.Perfil == (int)dominio.EnumPerfil.Administrador)
        {%>
    <div class="container">
        <h2 class="pt-3 pb-3">Usuarios</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <asp:TextBox CssClass="form-control me-2" placeholder="Buscar usuario" ID="txtBusqueda" runat="server" />
                        <asp:Button ID="btnBuscarEspecialidad" Text="Buscar" class="btn btn-color-project-primary" OnClick="btnBuscar_Click" runat="server" />
                    </li>
                    <li class="nav-item">
                        <asp:Button Text="Agregar usuario" ID="btnAgregar" CssClass="btn btn-color-project-primary" runat="server" OnClick="btnAgregarUsuario_Click" />
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col" class="align-middle">Nombre y apellido</th>
                            <th scope="col" class="align-middle">Usuario</th>
                            <th scope="col" class="align-middle">Perfil</th>
                            <th scope="col" class="align-middle">Estado</th>
                            <th scope="col" class="align-middle">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="repRepetidor">
                            <ItemTemplate>
                                <tr>
                                    <td class="align-middle"><%#Eval("Apellido")%> <%#Eval("Nombre")%></td>
                                    <td class="align-middle"><%#Eval("UsuarioReg")%></td>
                                    <td class="align-middle">
                                        <%# (int)Eval("Perfil") == 1 ? "Administrador" : ((int)Eval("Perfil") == 2 ? "Recepcionista" : "Otro") %>
                                    </td>
                                    <td class="<%# (bool)Eval("Estado") ? "bg-success-subtle align-middle" : "bg-warning-subtle align-middle" %>">
                                        <%#(bool)Eval("Estado") ? "Activo" : "Inactivo" %>
                                    </td>
                                    <td style="max-width: auto;" class="align-middle">
                                        <div class="btn-group">
                                            <asp:Button Text="Modificar" ID="btnModificar" CssClass="btn btn-color-project-primary" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialidadId" OnClick="btnModificarUsuario_Click" />
                                            <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialidadId" OnClick="btnEliminarUsuario_Click" />
                                            <asp:Button Text="Desactivar" ID="btnDesactivar" CssClass="btn btn-warning" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialidadId" OnClick="btnDesactivarUsuario_Click" Visible="true" />
                                            <asp:Button Text="Activar" ID="btnActivar" CssClass="btn btn-success" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialidadId" OnClick="btnActivarUsuario_Click" Visible="false" />

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
    <h2 class="h2">Acceso solo para Administradores</h2>
    <h5 class="h5">Inicie sesión con los permisos requeridos</h5>


    <% }
    %>


    <!-- Modal agregar usuario -->
    <div class="modal fade" id="AgregarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="agregarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgregarUsuario">Agregar usuario</h1>
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
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxApellidos" MaxLength="50"/>
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNombresUsuario" class="form-label">Nombres</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxNombres" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblDni" class="form-label">DNI (Sin puntos)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxDNI" MaxLength="8"/>
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
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxEmail" type="mail" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblTelefono" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxTelefono" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblUsuario" class="form-label">Usuario</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxUsuario" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblContrasenia" class="form-label">Contraseña</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxContrasenia" type="password" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblPerfil" class="form-label">Perfil</label>
                                <asp:DropDownList ID="DropDownListPerfil" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                    <asp:ListItem Text="Administrador" Value="1" />
                                    <asp:ListItem Text="Recepcionista" Value="2" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        * Todos los campos son obligatorios
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarAgregarUsuario_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal modificar usuario -->
    <div class="modal fade" id="ModificarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modificarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblModificarUsuario">Modificar usuario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="ValidationSummary1" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3" data-bs-backdrop="static" data-bs-keyboard="false">
                                <label for="lblApellidosUsuario" class="form-label">Apellidos</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserApellido" MaxLength="50"/>
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNombresUsuario" class="form-label">Nombres</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserNombre" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblDni" class="form-label">DNI (Sin puntos)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserDni" MaxLength="8"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblSexo" class="form-label">Sexo</label>
                                <asp:DropDownList ID="dplModificarUserSexo" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                    <asp:ListItem Text="Masculino" Value="M" />
                                    <asp:ListItem Text="Femenino" Value="F" />
                                    <asp:ListItem Text="No especificado" Value="X" />
                                </asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="lblFechaNacimiento" class="form-label">Fecha de nacimiento</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserNacimiento" type="date" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="lblEmail" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserMail" type="mail" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblTelefono" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserTel" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblUsuario" class="form-label">Usuario</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUser" MaxLength="50"/>
                            </div>
                            <div class="mb-3">
                                <label for="lblContrasenia" class="form-label">Contraseña</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUserPass" type="password" MaxLength="50"/>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        * Todos los campos son obligatorios
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardarModificarUser" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarModificarUser_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal desactivar usuario --%>
    <div class="modal fade" id="DesactivarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="desactivarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblDesactivarUsuarios">Desactivar Usuario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreUsuario" class="form-label">Usuario: </label>
                        <asp:Label ID="lblNombreUsuarioDesactivar" CssClass="form-label" runat="server" />
                        <label for="lblNombreUsuario" class="form-label">¿Está seguro que desea desactivar este usuario?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarDesactivarUsuario" Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarDesactivarUsuario_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal activar usuario --%>
    <div class="modal fade" id="ActivarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="activarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblActivarUsuarios">Activar Usuario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreUsuario" class="form-label">Usuario: </label>
                        <asp:Label ID="lblNombreUsuarioActivar" CssClass="form-label" runat="server" />
                        <label for="lblNombreUsuarioActivar" class="form-label">¿Está seguro que desea activar este usuario?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button1" Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarActivarUsuario_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal eliminar usuario --%>
    <div class="modal fade" id="EliminarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblEliminarUsuario">Eliminar usuario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Usuario: </label>
                        <asp:Label ID="lblNombreEliminarUsuario" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">¿Está seguro que desea eliminar este usuario?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarEliminarUsuario_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal no puede eliminar usuario --%>
    <div class="modal fade" id="NoEliminarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noEliminarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblNoEliminarUsuario">Eliminar usuario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Usuario: </label>
                        <asp:Label ID="Label1" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">No puede eliminar un usuario logeado actualmente</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Title="Especialidades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="TPC_equipo_2.Especialidades" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (UsuarioLogeado.Perfil == (int)dominio.EnumPerfil.Administrador)
        {%>
    <div class="container">
        <h2 class="pt-3 pb-3">Especialidades</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <asp:TextBox CssClass="form-control me-2" placeholder="Buscar especialidad" ID="txtBusqueda" runat="server" />
                        <asp:Button ID="btnBuscarEspecialidad" Text="Buscar" class="btn btn-color-project-primary" OnClick="btnBuscar_Click" runat="server" />
                    </li>
                    <li class="nav-item">
                        <asp:Button Text="Agregar especialidad" ID="btnAgregar" CssClass="btn btn-color-project-primary" runat="server" OnClick="btnAgregarEspecialidad_Click" />
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col" class="align-middle">Nombre</th>
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
                                            <asp:Button Text="Modificar" ID="btnModificar" CssClass="btn btn-color-project-primary" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnModificarEspecialidad_Click" />
                                            <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnEliminarEspecialidad_Click" />
                                            <asp:Button Text="Desactivar" ID="btnDesactivar" CssClass="btn btn-warning" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnDesactivarEspecialidad_Click" Visible="true" />
                                            <asp:Button Text="Activar" ID="btnActivar" CssClass="btn btn-success" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnActivarEspecialidad_Click" Visible="false" />

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

    <% }
    %>


    <!-- Modal agregar especialidad -->
    <div class="modal fade" id="AgregarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="agregarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgregarEspecialidad">Agregar especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Nombre</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="tbxEspecialidad" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button Text="Guardar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnGuardarAgregarEspecialidad_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal modificar especialidad -->
    <div class="modal fade" id="ModificarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modificarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblModificarEspecialidad">Modificar especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Nombre</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarEspecialidad" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button Text="Guardar" class="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnGuardarModificacionEspecialidad_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal eliminar especialidad --%>
    <div class="modal fade" id="EliminarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblEliminarEspecialidad">Eliminar especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialidad: </label>
                        <asp:Label ID="lblNombreEspecEliminar" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">¿Está seguro que desea eliminar esta especialidad?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarEliminarEspecialidad_Click" />
                </div>
            </div>
        </div>
    </div>


    <%-- Modal desactivar especialidad --%>
    <div class="modal fade" id="DesactivarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="desactivarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblDesactivarEspecialidad">Desactivar especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialidad: </label>
                        <asp:Label ID="lblNombreEspecDesactivar" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">¿Está seguro que desea desactivar esta especialidad?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarDesactivarEspec" Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarDesactivarEspecialidad_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal activar especialidad --%>
    <div class="modal fade" id="ActivarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="activarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblActivarEspecialidad">Activar especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialidad: </label>
                        <asp:Label ID="lblNombreEspecActivar" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">¿Está seguro que desea activar esta especialidad?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarActivarEspec" Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarActivarEspecialidad_Click" />
                </div>
            </div>
        </div>
    </div>
    </div>

    <%-- Modal error agregar especialidad --%>
    <div class="modal fade" id="ErrorAgregarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorAgregarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblErrorAgregarEspecialidad">Error: No se puede agregar la especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialidad: </label>
                        <asp:Label CssClass="form-label" ID="lblErrorAgregarEsp" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">La especialidad ya se encuentra registrada en la base de datos</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal error modificar especialidad --%>
    <div class="modal fade" id="ErrorModificarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorModificarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblErrorModificarEspecialidad">Error: No se puede modificar la especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialidad: </label>
                        <asp:Label CssClass="form-label" Text="Nombre especialidad" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">La especialidad se encuentra vinculada a otro registro</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal error eliminar especialidad --%>
    <div class="modal fade" id="ErrorEliminarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorEliminarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Error: No se puede eliminar la especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialidad: </label>
                        <asp:Label CssClass="form-label" ID="lblErrorEliminarEspecialidad" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">La especialidad se encuentra vinculada a otro registro</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

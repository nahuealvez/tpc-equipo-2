<%@ Page Title="Especialidades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="TPC_equipo_2.Especialidades" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h2 class="pt-3 pb-3">Especialidades</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <li class="d-flex">
                        <form class="d-flex" role="buscar">
                            <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                            <button class="btn btn-outline-primary" type="submit">Buscar</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AgregarEspecialidad">
                            Agregar especialidad
                        </button>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col" class="align-middle">#</th>
                            <th scope="col" class="align-middle">Nombre</th>
                            <th scope="col" class="align-middle">Estado</th>
                            <th scope="col" class="align-middle">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int loop = 1;
                            foreach (var especialidad in EspecialidadList)
                            {%>
                        <tr>
                            <th scope="row" class="align-middle"><%:loop %></th>
                            <td class="align-middle"><%:especialidad.Descripcion %></td>
                            <td class="<%:especialidad.Estado ? "bg-success-subtle align-middle" : "bg-warning-subtle align-middle" %>">
                                <%:especialidad.Estado ? "Activo" : "Inactivo" %>
                            </td>
                            <td style="max-width: 120px;" class="align-middle">
                                <div class="btn-group">
                                    <asp:Button Text="Modificar" ID="btnModificar" CssClass="btn btn-primary" runat="server" Onclick="btnModificarEspecialidad_Click" />
                                    <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" style="width: 100px;" runat="server" OnClick="btnEliminarEspecialidad_Click" />
                                    <%if (especialidad.Estado == true)
                                        { %>
                                    <asp:Button Text="Desactivar" CssClass="btn btn-warning" style="width: 100px;" runat="server" />
                                    <%}
                                        else
                                        { %>
                                    <asp:Button Text="Activar" CssClass="btn btn-success" style="width: 100px;" runat="server" />
                                    <%} %>
                                    
                                </div>
                            </td>
                        </tr>

                        <%  loop++;
                            } %>
                    </tbody>
                </table>
            </div>  
        </div>
    </div>

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
                        <asp:TextBox CssClass="form-control" runat="server" ID="tbxEspecialidad"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Guardar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="AgregarEspecialidad_Click" />
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal modificar especialidad -->
    <div class="modal fade" id="ModificarEspecialidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modificarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgregarEspecialidad">Modificar especialidad</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Nombre</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="TextBox1" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Guardar</button>
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
                        <label for="lblNombreEspecialidad" class="form-label">Nombre</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="TextBox2" />
                        <label for="lblNombreEspecialidad" class="form-label">¿Está seguro que desea eliminar esta especialidad?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>


    <%-- Modal desactivar especialidad --%>


    <script>
        function abrirModalModificarEspecialidad() {
            var pageModal = new bootstrap.Modal(document.getElementById("ModificarEspecialidad"), { keyboard: false });
            pageModal.show();
        }

            function abrirModalEliminarEspecialidad() {
            var pageModal = new bootstrap.Modal(document.getElementById("EliminarEspecialidad"), { keyboard: false });
            pageModal.show();
        }
    </script>
</asp:Content>

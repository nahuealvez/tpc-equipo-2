﻿<%@ Page Title="Especialistas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialistas.aspx.cs" Inherits="TPC_equipo_2.Especialistas" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (UsuarioLogeado != null && UsuarioLogeado.Perfil == (int)dominio.EnumPerfil.Administrador)
        {%>
    <div class="container">
        <h2 class="pt-3 pb-3">Especialistas</h2>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills d-flex justify-content-between">
                    <div class="d-flex justify-content-center align-items-center gap-4">
                        <li class="d-flex">
                            <asp:TextBox CssClass="form-control me-2" placeholder="Buscar especialista" ID="txtBusqueda" runat="server" />
                            <asp:Button ID="btnBuscarEspecialista" Text="Buscar" class="btn btn-color-project-primary" OnClick="btnBuscar_Click" runat="server" />
                        </li>
                        <li class="d-flex">
                            <asp:DropDownList ID="ddlFiltroEspecialidades" runat="server" CssClass="form-select me-2">
                                <asp:ListItem Text="" Selected="True" />
                            </asp:DropDownList>
                            <asp:Button ID="btnFiltrarEspecialista" Text="Filtrar" class="btn btn-color-project-primary" runat="server" />
                        </li>
                    </div>
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
                                    <td style="width: 450px" class="align-middle"><%#Eval("Apellido")%> <%#Eval("Nombre")%></td>
                                    <td style="width: 120px;" class="<%# (bool)Eval("Estado") ? "bg-success-subtle align-middle" : "bg-warning-subtle align-middle" %>">
                                        <%#(bool)Eval("Estado") ? "Activo" : "Inactivo" %>
                                    </td>
                                    <td style="width: auto;" class="align-middle">
                                        <div class="btn-group">
                                            <asp:Button Text="Modificar" ID="btnModificar" CssClass="btn btn-color-project-primary" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialistaId" OnClick="btnModificarEspecialista_Click" />
                                            <asp:Button Text="Especialidades" ID="btnAgregarEspecialidades" CssClass="btn btn-secondary" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialistaId" OnClick="btnAgregarQuitarEspecialidades_Click" />
                                            <asp:Button Text="Jornadas" ID="btnConfigurarJornadas" CssClass="btn btn-color-project-primary" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialistaId" OnClick="btnConfigurarJornadas_Click" />
                                            <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialistaId" OnClick="btnEliminarEspecialista_Click" />
                                            <asp:Button Text="Desactivar" ID="btnDesactivar" CssClass="btn btn-warning" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialistaId" OnClick="btnDesactivarEspecialista_Click" Visible="true" />
                                            <asp:Button Text="Activar" ID="btnActivar" CssClass="btn btn-success" Style="width: 100px;" runat="server" CommandArgument='<%#Eval("IdUsuario") %>' CommandName="EspecialistaId" OnClick="btnActivarEspecialista_Click" Visible="false" />
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


    <!-- Modal agregar especialista -->
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
                                <label for="lblApellidosEspecialista" class="form-label">Apellidos</label>
                                <asp:TextBox CssClass="form-control" MaxLength="50" runat="server" ID="tbxApellidos" />
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNombresEspecialista" class="form-label">Nombres</label>
                                <asp:TextBox CssClass="form-control" MaxLength="50" runat="server" ID="tbxNombres" />
                            </div>
                            <div class="mb-3">
                                <label for="lblDni" class="form-label">DNI</label>
                                <asp:TextBox CssClass="form-control" MaxLength="8" runat="server" ID="tbxDNI" />
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
                                <asp:TextBox CssClass="form-control" MaxLength="50" runat="server" ID="tbxEmail" type="mail" />
                            </div>
                            <div class="mb-3">
                                <label for="lblTelefono" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxTelefono" />
                            </div>
                            <div class="mb-3">
                                <label for="lblUsuario" class="form-label">Usuario</label>
                                <asp:TextBox CssClass="form-control" MaxLength="50" runat="server" ID="tbxUsuario" />
                            </div>
                            <div class="mb-3">
                                <label for="lblContrasenia" class="form-label">Contraseña</label>
                                <asp:TextBox CssClass="form-control" MaxLength="50" runat="server" ID="tbxContrasenia" type="password" />
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-warning" role="alert">
                        <asp:Label ID="lblCamposObligatoriosAgregar" Text="Todos los campos son obligatorios" runat="server" />
                        <asp:Label ID="lblAlertAgregar" Text="" runat="server" />
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarAgregarEspecialista_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal modificar especialista -->
    <div class="modal fade" id="ModificarEspecialista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modificarEspecialistaLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblModificarEspecialista">Modificar especialista</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="ValidationSummary1" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3" data-bs-backdrop="static" data-bs-keyboard="false">
                                <label for="lblApellidosEspecialista" class="form-label">Apellidos</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarApellido" />
                                <asp:RequiredFieldValidator ForeColor="red" ValidationGroup="valForm" ErrorMessage="* Campo incompleto" ControlToValidate="tbxApellidos" runat="server" Display="Dynamic" />
                            </div>
                            <div class="mb-3">
                                <label for="lblNombresEspecialista" class="form-label">Nombres</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarNombre" />
                            </div>
                            <div class="mb-3">
                                <label for="lblDni" class="form-label">DNI (Sin puntos)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarDni" />
                            </div>
                            <div class="mb-3">
                                <label for="lblSexo" class="form-label">Sexo</label>
                                <asp:DropDownList ID="dplModificarSexo" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                    <asp:ListItem Text="Masculino" Value="M" />
                                    <asp:ListItem Text="Femenino" Value="F" />
                                    <asp:ListItem Text="No especificado" Value="X" />
                                </asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="lblFechaNacimiento" class="form-label">Fecha de nacimiento</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarNacimiento" type="date" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="lblEmail" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarMail" type="mail" />
                            </div>
                            <div class="mb-3">
                                <label for="lblTelefono" class="form-label">Teléfono (Sin guiones ni espacios)</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarTel" />
                            </div>
                            <div class="mb-3">
                                <label for="lblUsuario" class="form-label">Usuario</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarUser" />
                            </div>
                            <div class="mb-3">
                                <label for="lblContrasenia" class="form-label">Contraseña</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="tbxModificarPass" type="password" />
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-warning" role="alert">
                        <asp:Label ID="lblCamposObligatoriosModificar" Text="Todos los campos son obligatorios" runat="server" />
                        <asp:Label ID="lblAlertModificar" Text="" runat="server" />
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardarModificarEspeclista" Text="Guardar" CssClass="btn btn-success" runat="server" OnClientClick="return btnPrevenirCierreModal()" OnClick="btnGuardarModificarEspecialista_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal agregar/quitar especialidades -->
    <div class="modal fade" id="AgregarQuitarEspecialidades" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="AgregarQuitarEspecialidadesLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblAgregarQuitarEspecialidades">Agregar/Quitar especialidades</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="ValidationSummary2" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblSelectorEspecialidades" class="form-label">Seleccione las especialidades</label>
                        <div class="input-group">
                            <asp:DropDownList ID="ddlEspecialidades" runat="server" CssClass="form-select">
                                <asp:ListItem Text="" Selected="True" />
                            </asp:DropDownList>
                            <asp:Button ID="btnGuardarEspecialidadEnEspecialista" Text="Agregar" CssClass="btn btn-color-project-primary" runat="server" OnClick="btnGuardarEspecialidadEnEspecialista_Click" />
                        </div>
                    </div>

                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr class="table-primary">
                                    <th scope="col" class="align-middle">Especialidad</th>
                                    <th scope="col" class="align-middle" style="width: 100px">Acciones</th>
                                </tr>

                                <asp:Repeater runat="server" ID="repEspecialidadesEspecialista">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="align-middle"><%#Eval("Descripcion")%></td>
                                            <td class="align-middle">
                                                <asp:Button Text="Quitar" CssClass="btn btn-danger" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnQuitarEspecialidad_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </thead>
                        </table>
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal configurar jornada -->
    <div class="modal fade" id="ConfigurarJornada" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ConfigurarJornadaLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblConfigurarJornada">Configurar jornada</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <p class="bg-primary">
                    <asp:ValidationSummary ID="ValidationSummary3" Visible="false" runat="server" />
                </p>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <div class="mb-3 col">
                            <label for="lblSelectorEspecialidades" class="form-label">Seleccione la especialidad</label>
                            <div class="input-group">
                                <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="mb-3 col">
                            <label for="lblSelectorEspecialidades" class="form-label">Seleccione el día de la semana</label>
                            <div class="input-group">
                                <asp:DropDownList ID="ddlDiaSemana" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="" Selected="True" />
                                    <asp:ListItem Text="Lunes" Value="1" />
                                    <asp:ListItem Text="Martes" Value="2" />
                                    <asp:ListItem Text="Miércoles" Value="3" />
                                    <asp:ListItem Text="Jueves" Value="4" />
                                    <asp:ListItem Text="Viernes" Value="5" />
                                    <asp:ListItem Text="Sábado" Value="6" />
                                    <asp:ListItem Text="Domingo" Value="7" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col mb-3">
                            <label for="lblHorarioInicio" class="form-label">Horario inicio</label>
                            <div class="input-group">
                                <asp:TextBox min="1" max="24" CssClass="form-control" type="number" runat="server" ID="tbxHoraInicio" />
                                <div class="input-group-text">Hs</div>
                            </div>
                        </div>
                        <div class="col mb-3">
                            <label for="lblHorarioFin" class="form-label">Horario fin</label>
                            <div class="input-group">
                                <asp:TextBox min="1" max="24" CssClass="form-control" type="number" runat="server" ID="tbxHoraFin" />
                                <div class="input-group-text">Hs</div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col mb-3">
                            <asp:Button ID="btnGuardarJornada" Text="Agregar jornada" CssClass="btn btn-color-project-primary" Style="width: 100%;" runat="server" OnClick="btnGuardarJornada_Click" />
                        </div>
                    </div>

                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr class="table-primary">
                                    <th scope="col" class="align-middle">Especialidad</th>
                                    <th scope="col" class="align-middle">Día</th>
                                    <th scope="col" class="align-middle">Horario Inicio</th>
                                    <th scope="col" class="align-middle">Horario Fin</th>
                                    <th scope="col" class="align-middle">Acciones</th>
                                </tr>


                                <asp:Repeater runat="server" ID="repJornadas">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="align-middle"><%#Eval("Especialidad.Descripcion")%></td>
                                            <td class="align-middle"><%#Eval("DiaSemana")%></td>
                                            <td class="align-middle"><%#Eval("HoraInicio")%></td>
                                            <td class="align-middle"><%#Eval("HoraFin")%></td>
                                            <td class="align-middle">
                                                <asp:Button Text="Quitar" CssClass="btn btn-danger" runat="server" CommandArgument='<%#Eval("IdJornada") %>' CommandName="JornadaId" OnClick="btnQuitarJornada_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </thead>
                        </table>
                    </div>
                </div>
                <div class="modal-footer" data-bs-backdrop="static" data-bs-keyboard="false">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal desactivar especialista --%>
    <div class="modal fade" id="DesactivarEspecialista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="desactivarEspecialistaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblDesactivarEspecialista">Desactivar especialista</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialista" class="form-label">Especialista: </label>
                        <asp:Label ID="lblNombreEspecialistaDesactivar" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialista" class="form-label">¿Está seguro que desea desactivar este especialista?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarDesactivarEspecialista" Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarDesactivarEspecialista_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal activar especialista --%>
    <div class="modal fade" id="ActivarEspecialista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="activarEspecialistaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblActivarEspecialista">Activar especialista</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialistaActivar" class="form-label">Especialista: </label>
                        <asp:Label ID="lblNombreEspecialistaActivar" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialista" class="form-label">¿Está seguro que desea activar este especialista?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button2" Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarActivarEspecialista_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal eliminar especialista --%>
    <div class="modal fade" id="EliminarEspecialista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarEspecialistaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblEliminarEspecialista">Eliminar especialista</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialista" class="form-label">Especialista: </label>
                        <asp:Label ID="lblNombreEliminarEspecialista" CssClass="form-label" runat="server" />
                        <label for="lblNombreEspecialista" class="form-label">¿Está seguro que desea eliminar este especialista?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Aceptar" CssClass="btn btn-success" data-bs-dismiss="modal" runat="server" OnClick="btnAceptarEliminarEspecialista_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- Modal error eliminar especialista --%>
    <div class="modal fade" id="ErrorEliminarEspecialista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorEliminarEspecialistaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblErrorEliminarEspecialista">Error</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblNombreEspecialidad" class="form-label">Especialista: </label>
                        <asp:Label CssClass="form-label" ID="lblNombreErrorEliminarEspecialista" runat="server" />
                        <label for="lblNombreEspecialidad" class="form-label">El especialista no se puede eliminar porque se encuentra vinculado a otro registro.</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal error agregar jornada Superpuesto --%>
    <div class="modal fade" id="ErrorAgregarJornadaSuperpuesta" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorEliminarEspecialidadLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Error: No es posible agregar la jornada</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="lblMsjeError" class="form-label">La jornada se superpone con una existente</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

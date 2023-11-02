<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_equipo_2.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        <asp:Button Text="Agregar especialidad" CssClass="btn btn-primary" runat="server" />
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
                            <td class="align-middle"><%:especialidad.Nombre %></td>
                            <td class="<%:especialidad.Estado ? "bg-success-subtle align-middle" : "bg-warning-subtle align-middle" %>">
                                <%:especialidad.Estado ? "Activo" : "Inactivo" %>
                            </td>
                            <td style="max-width: 120px;" class="align-middle">
                                <div class="btn-group">
                                    <asp:Button Text="Modificar" CssClass="btn btn-primary" style="width: 100px;" runat="server" />
                                    <asp:Button Text="Eliminar" CssClass="btn btn-danger" style="width: 100px;" runat="server" />
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
</asp:Content>

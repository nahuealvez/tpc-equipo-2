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
                        <a class="nav-link active" href="#">Agregar especialidad</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col">#</th>
                            <th scope="col">Id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Activo</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int loop = 1;
                            foreach (var especialidad in EspecialidadList)
                            {%>
                        <tr>
                            <th scope="row"><%:loop %></th>
                            <td><%:especialidad.Id %></td>
                            <td><%:especialidad.Nombre %></td>
                            <td><%:especialidad.Estado %></td>
                            <td class="">
                                <button type="button" class="btn btn-primary">Modificar</button>
                                <button type="button" class="btn btn-danger">Eliminar</button>
                                <button type="button" class="btn btn-warning">Desactivar</button>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_equipo_2.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Id</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripción</th>
                </tr>
            </thead>
            <tbody>
            <%  int loop = 1;
                foreach(var especialidad in EspecialidadList)
                {%>
                <tr>
                    <th scope="row"><%:loop %></th>
                    <td><%:especialidad.Id %></td>
                    <td><%:especialidad.Nombre %></td>
                    <td><%:especialidad.Descripcion %></td>
                </tr>

            <%  loop++;
                } %>
            </tbody>
        </table>
    </div>
</asp:Content>

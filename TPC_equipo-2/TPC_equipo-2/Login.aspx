<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_equipo_2.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container w-50 pt-5">
        <div class="d-flex flex-column justify-content-center gap-3">
            <h3 class="h3">Acceso</h3>
            <div>
                <asp:Label class="form-label" Text="Usuario" runat="server" />
                <asp:TextBox type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" runat="server" />
                <%--<label for="exampleInputEmail1" class="form-label">Usuario</label>--%>
<%--                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">--%>
            </div>
            <div>
                <asp:Label ID="lblContraseña" class="form-label" Text="Contraseña" runat="server" />
                <asp:TextBox type="password" class="form-control" id="exampleInputPassword1" aria-describedby="emailHelp" runat="server" />

                <%--<label for="exampleInputPassword1" class="form-label">Contraseña</label>--%>
                <%--<input type="password" class="form-control" id="exampleInputPassword1">--%>
            </div>
            <asp:Label ID="lblError" class="alert alert-danger d-flex align-items-center" role="alert" Text="" Visible="false" runat="server" />
            <asp:Button Text="Ingresar" type="submit" class="btn" style="background-color: #0364B8; color: #ffffff;" onclick="btnIngresar_Click" runat="server" />
            <%--<button type="submit" class="btn" style="background-color: #0364B8; color: #ffffff;" onclick="btnIngresar_Click">Ingresar</button>--%>
        </div>
    </div>
</asp:Content>

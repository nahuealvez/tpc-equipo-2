<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_equipo_2.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-5" style="width: 500px;">
        <div class="d-flex flex-column justify-content-center gap-3">
                <div style="color: #0364B8; font-family: 'Fira Sans', sans-serif; font-weight: 800;" class="d-flex flex-column justify-content-center align-items-center">
                    <p style="font-size: 30px" class="mb-0 d-flex justify-content-center align-items-center gap-2">
                        <img width="30" height="30" src="https://img.icons8.com/material/30/0364B8/heart-with-pulse.png" alt="heart-with-pulse" />Port Salut
                    </p>
                    <p style="font-weight: 400; font-size: 18px;" class="mb-0">Medicina privada</p>
                </div>
                <h3 class="h3">Acceso</h3>
                <div>
                    <asp:Label class="form-label" Text="Usuario" runat="server" />
                    <asp:TextBox type="text" class="form-control" ID="exampleInputUser1" aria-describedby="emailHelp" runat="server" />
                </div>
                <div>
                    <asp:Label ID="lblContraseña" class="form-label" Text="Contraseña" runat="server" />
                    <asp:TextBox type="password" class="form-control" ID="exampleInputPassword1" aria-describedby="emailHelp" runat="server" />
                </div>
                <asp:Label ID="lblError" class="alert alert-danger d-flex justify-content-center align-items-center" role="alert" Text="" Visible="false" runat="server" />
                <asp:Button Text="Ingresar" type="submit" class="btn" Style="background-color: #0364B8; color: #ffffff;" OnClick="btnIngresar_Click" runat="server" />
        </div>
    </div>
</asp:Content>

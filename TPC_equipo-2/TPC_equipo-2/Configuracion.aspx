<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuracion.aspx.cs" Inherits="TPC_equipo_2.Configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column pt-3 gap-3">
        <h2 class="h2">Configuración</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card h-100">
                    <img width="150" class="img-fluid mx-auto pt-3" height="150" src="https://img.icons8.com/external-outline-lafs/150/000000/external-team-cloud-storage-outline-lafs.png" alt="external-team-cloud-storage-outline-lafs"/>
                    <div class="card-body">
                        <h5 class="card-title">Usuarios</h5>
                        <p class="card-text">Gestión de ABM de usuarios internos</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" type="button" class="btn float-end btn-color-project-primary">Configurar</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img width="150" class="img-fluid mx-auto pt-3" height="150" src="https://img.icons8.com/external-outline-lafs/150/000000/external-doctors-medicine-outline-part-1-v2-outline-lafs.png" alt="external-doctors-medicine-outline-part-1-v2-outline-lafs"/>
                    <div class="card-body">
                        <h5 class="card-title">Especialistas</h5>
                        <p class="card-text">Gestión de ABM de especialistas</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" type="button" class="btn float-end btn-color-project-primary">Configurar</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img width="150" class="img-fluid mx-auto pt-3" height="150" src="https://img.icons8.com/external-outline-lafs/150/000000/external-physician-medicine-outline-part-1-v2-outline-lafs.png" alt="external-physician-medicine-outline-part-1-v2-outline-lafs"/>
                    <div class="card-body">
                        <h5 class="card-title">Especialidades</h5>
                        <p class="card-text">Gestión de ABM de especialidades</p>
                    </div>
                    <div class="card-footer">
                        <a href="/Especialidades.aspx" type="button" class="btn float-end btn-color-project-primary">Configurar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

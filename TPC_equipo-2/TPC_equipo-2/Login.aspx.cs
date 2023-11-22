﻿using dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 

namespace TPC_equipo_2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            List<Usuario> usuario = new List<Usuario>();
            UsuarioNegocio valida = new UsuarioNegocio();
            usuario = valida.LoginUsuario(exampleInputEmail1.Text, exampleInputPassword1.Text);

            if (usuario.Count > 0)
            {
                Response.Redirect("Configuracion.aspx");
            }
            else
            {
                lblError.Text = "Error!";
                lblError.Visible = true;
            }
        }
    }
}
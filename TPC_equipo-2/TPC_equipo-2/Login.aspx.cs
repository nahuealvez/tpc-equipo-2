using dominio;
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
        public UsuarioNegocio UsuarioLogeado = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UsuarioSesion"] = null;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            List<Usuario> usuarios = new List<Usuario>();
            usuarios = UsuarioLogeado.LoginUsuario(exampleInputUser1.Text, exampleInputPassword1.Text);

            if (usuarios.Count > 0)
            {
                Session["UsuarioSesion"] = usuarios[0];
                if (usuarios[0].Perfil == (int)EnumPerfil.Administrador)
                {
                    Response.Redirect("Configuracion.aspx");
                }
                if (usuarios[0].Perfil == (int)EnumPerfil.Recepcionista)
                {
                    Response.Redirect("Turnos.aspx");
                }
                else
                {
                    Response.Redirect("Turnos.aspx");
                }
            }
            else
            {
                lblError.Text = "Las credenciales ingresadas son incorrectas";
                lblError.Visible = true;
            }
        }
    }
}
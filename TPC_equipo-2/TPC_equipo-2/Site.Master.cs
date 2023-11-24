using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public Usuario UsuarioLogeado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogeado = Session["UsuarioSesion"] as Usuario;
        }
    }
}
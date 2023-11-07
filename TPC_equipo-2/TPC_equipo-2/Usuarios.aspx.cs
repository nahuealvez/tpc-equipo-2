using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarUsuario()", true);
        }

        protected void btnGuardarAgregarUsuario_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarUsuario_Click(Object sender, EventArgs e)
        {

        }

        protected void btnEliminarUsuario_Click(Object sender, EventArgs e)
        {

        }

        protected void btnDesactivarUsuario_Click(Object sender, EventArgs e)
        {

        }

        protected void btnActivarUsuario_Click(Object sender, EventArgs e)
        {

        }
    }
}
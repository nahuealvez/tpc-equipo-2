using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Especialistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarEspecialista_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarEspecialista()", true);
        }

        protected void btnGuardarAgregarEspecialista_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarEspecialista_Click(Object sender, EventArgs e)
        {

        }

        protected void btnEliminarEspecialista_Click(Object sender, EventArgs e)
        {

        }

        protected void btnDesactivarEspecialista_Click(Object sender, EventArgs e)
        {

        }

        protected void btnActivarEspecialista_Click(Object sender, EventArgs e)
        {

        }

    }
}
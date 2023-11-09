using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarPaciente()", true);
        }

        protected void btnGuardarAgregarPaciente_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarPaciente_Click(Object sender, EventArgs e)
        {

        }

        protected void btnEliminarPaciente_Click(Object sender, EventArgs e)
        {

        }

        protected void btnDesactivarPaciente_Click(Object sender, EventArgs e)
        {

        }

        protected void btnActivarPaciente_Click(Object sender, EventArgs e)
        {

        }
    }
}
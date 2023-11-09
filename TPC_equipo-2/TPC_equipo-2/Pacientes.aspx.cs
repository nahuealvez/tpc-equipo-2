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
    public partial class Pacientes : System.Web.UI.Page
    {
        public List<Paciente> PacienteList;

        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio pacienteNegocio = new PacienteNegocio();
            PacienteList = pacienteNegocio.Listar();
            if (!IsPostBack)
            {
                repRepetidor.DataSource = PacienteList;
                repRepetidor.DataBind();
            }

            foreach (RepeaterItem item in repRepetidor.Items)
            {
                int Id = int.Parse((item.FindControl("btnModificar") as Button).CommandArgument.ToString());
                Button btnDesactivar = (Button)item.FindControl("btnDesactivar");
                Button btnActivar = (Button)item.FindControl("btnActivar");
                Paciente pacienteAux = PacienteList.Find(x => x.IdPaciente == Id);
                //if (!pacienteAux.Estado)
                //{
                //    btnDesactivar.Visible = false;
                //    btnActivar.Visible = true;
                //}
            }
        }

        protected void btnAgendarTurno_Click(object sender, EventArgs e)
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
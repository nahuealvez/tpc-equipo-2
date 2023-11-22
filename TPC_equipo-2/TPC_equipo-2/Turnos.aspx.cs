using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using Negocio;

namespace TPC_equipo_2
{
    public partial class Turnos : System.Web.UI.Page
    {
        public List<Turno> TurnosList;
        protected void Page_Load(object sender, EventArgs e)
        {
            TurnoNegocio turnoNegocio = new TurnoNegocio();
            TurnosList = turnoNegocio.Listar();
            
            if (!IsPostBack)
            {
                repRepetidor.DataSource = TurnosList;
                repRepetidor.DataBind();
            }
        }

        protected void btnCancelarTurno_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalCancelarTurno()", true);
        }

        protected void btnAceptarCancelarTurno_Click(object sender, EventArgs e)
        {
            ;
        }
    }
}
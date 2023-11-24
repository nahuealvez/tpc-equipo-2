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
        public Usuario UsuarioLogeado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogeado = Session["UsuarioSesion"] as Usuario;
            TurnoNegocio turnoNegocio = new TurnoNegocio();
            if (UsuarioLogeado.Perfil == (int)EnumPerfil.Especialista) TurnosList = turnoNegocio.ListarPorEspecialista(UsuarioLogeado.IdUsuario);
            else TurnosList = turnoNegocio.Listar();
            
            if (!IsPostBack)
            {
                repRepetidor.DataSource = TurnosList;
                repRepetidor.DataBind();
            }

            foreach (RepeaterItem item in repRepetidor.Items)
            {
                int Id = int.Parse((item.FindControl("btnVerDetalle") as Button).CommandArgument.ToString());
                Button btnCancelar = (Button)item.FindControl("btnCancelar");
                Turno turnoAux = TurnosList.Find(x => x.IdTurno == Id);
                if (turnoAux.Estado.Id == 3)
                {
                    btnCancelar.Visible = false;
                }
            }
        }

        protected void btnCancelarTurno_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("IdTurno", id);
            Turno turno = TurnosList.Find(x => x.IdTurno == id);
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalCancelarTurno()", true);
        }

        protected void btnAceptarCancelarTurno_Click(object sender, EventArgs e)
        {
            int idTurno = (int)(Session["IdTurno"]);
            TurnoNegocio negocio = new TurnoNegocio();
            Turno turnoCancelar = TurnosList.Find(x => x.IdTurno == idTurno);

            try
            {
                negocio.CancelarTurno(turnoCancelar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
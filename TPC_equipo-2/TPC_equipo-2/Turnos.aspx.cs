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
            if(UsuarioLogeado != null)
            {
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

                    if (UsuarioLogeado.Perfil == (int)EnumPerfil.Especialista)
                    {
                        btnCancelar.Visible = false;
                    }
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

        protected void btnBuscarPorDNIPaciente_Click(object sender, EventArgs e)
        {
            try
            {
                string busqueda = txtBusqueda.Text.Trim();

                if (busqueda != "")
                {
                    if (int.TryParse(busqueda, out int dni))
                    {
                        List<Turno> turnosFiltradosPorDNI = TurnosList.Where(x => x.Paciente.Dni == dni).ToList();

                        repRepetidor.DataSource = turnosFiltradosPorDNI;
                        repRepetidor.DataBind();
                    }
                }
                else
                {
                    repRepetidor.DataSource = TurnosList;
                    repRepetidor.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);

            TurnoNegocio turnoNegocio = new TurnoNegocio();
            Turno turno = turnoNegocio.listarTurnoPorId(id);

            Session.Add("IdTurno", id);

            txtIdTurno.Text = turno.IdTurno.ToString();
            txtFecha.Text = turno.FechaHora.ToString("dd/MM/yyyy");
            txtHora.Text = turno.FechaHora.ToString("HH:mm") + " Hs.";
            txtEspecialidad.Text = turno.Especialidad.Descripcion;
            txtEspecialista.Text = turno.Usuario.Apellido + " " + turno.Usuario.Nombre;
            txtMotivoConsulta.Text = turno.MotivoConsulta;

            if (turno.Estado.Id == 2 || turno.Estado.Id == 3 || turno.Estado.Id == 4)
            {
                tbxDiagnostico.Text = turno.Diagnostico;
                tbxDiagnostico.Enabled = false;
                lblEstadoTurno.Visible = false;
                lblPipe.Visible = false;
                btnAusente.Visible = false;
                btnAtendido.Visible = false;
                lblAlertDiagnostico.Visible = false;
                lblDangerDiagnostico.Visible = false;
            }
            else
            {
                tbxDiagnostico.Enabled = true;
                lblEstadoTurno.Visible = true;
                lblPipe.Visible = true;
                btnAusente.Visible = true;
                btnAtendido.Visible = true;
                lblAlertDiagnostico.Visible = true;
                lblDangerDiagnostico.Visible = false;
                tbxDiagnostico.Text = "";
            }

            ClientScript.RegisterStartupScript(this.GetType(), "pop", "abrirModalVerDetalleTurno()", true);
        }

        protected void btnMarcarEstadoAusente_Click(object sender, EventArgs e)
        {
            int idTurno = (int)Session["IdTurno"];

            TurnoNegocio turnoNegocio = new TurnoNegocio();

            try
            {
                turnoNegocio.MarcarTurnoComoAusente(idTurno);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "postbackKey", "__doPostBack('', '');", true);
        }

        protected void btnMarcarEstadoAtendido_Click(object sender, EventArgs e)
        {
            if (tbxDiagnostico.Text == "")
            {
                lblAlertDiagnostico.Visible = false;
                lblDangerDiagnostico.Visible = true;
                
                ClientScript.RegisterStartupScript(this.GetType(), "pop", "abrirModalVerDetalleTurno()", true);
            }
            else
            {
                int idTurno = (int)Session["IdTurno"];

                TurnoNegocio turnoNegocio = new TurnoNegocio();

                try
                {
                    turnoNegocio.MarcarTurnoComoAtendido(idTurno);
                    turnoNegocio.CargarDiagnostico(idTurno, tbxDiagnostico.Text);
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
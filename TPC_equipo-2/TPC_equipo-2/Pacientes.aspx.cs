using dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Pacientes : System.Web.UI.Page
    {
        public List<Paciente> PacienteList;
        public Usuario UsuarioLogeado { get; set; }

        private bool confirmacionTurno = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogeado = Session["UsuarioSesion"] as Usuario;
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

        protected void cargarModalGestionTurnos()
        {
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            List<Especialidad> especialidadesActivas = new List<Especialidad>();
            especialidadesActivas = especialidadNegocio.ListarActivos();

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            ddlEspecialidades.DataSource = especialidadesActivas;
            ddlEspecialidades.DataTextField = "Descripcion";
            ddlEspecialidades.DataValueField = "Id";
            ddlEspecialidades.DataBind();
            ddlEspecialidades.Items.Insert(0, "");
            Session.Add("especialidadesActivas", especialidadesActivas);

            List<Turno> turnosDisponibles = new List<Turno>();
            repTurnosDisponibles.DataSource = turnosDisponibles;
            repTurnosDisponibles.DataBind();

            ddlEspecialistas.Items.Clear();
            ddlEspecialistas.Items.Add(new ListItem("", ""));
            btnBuscarTurnos.Visible = false;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgendarTurno()", true);
        }

        protected void cargarModalGestionTurnosSeleccionarEspecialista(int idEspecialidad, int indexDdlEspecialidad, int indexDdlEspecialista)
        {
            if (idEspecialidad != 0)
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

                List<Especialidad> especialidadesActivas = new List<Especialidad>();
                especialidadesActivas = (List<Especialidad>)Session["especialidadesActivas"];

                List<int> idsEspecialistas = new List<int>();
                idsEspecialistas = especialidadNegocio.EspecialistasXEspecialidad(idEspecialidad);

                List<Usuario> especialistas = new List<Usuario>();
                List<Usuario> especialistasFiltrados = new List<Usuario>();
                especialistas = usuarioNegocio.ListarEspecialistas();

                foreach (int id in idsEspecialistas)
                {
                    especialistasFiltrados.Add(especialistas.Find(x => x.IdUsuario == id));
                }

                if (especialistasFiltrados.Count > 0)
                {
                    // Si hay especialistas disponibles, los carga en el ddl
                    ddlEspecialistas.DataSource = especialistasFiltrados;
                    ddlEspecialistas.DataTextField = "NombreCompleto";
                    ddlEspecialistas.DataValueField = "IdUsuario";
                    ddlEspecialistas.SelectedIndex = indexDdlEspecialista;
                    btnBuscarTurnos.Visible = true;
                }
                else
                {
                    // Si no hay especialistas disponibles, carga un item que lo indique
                    ddlEspecialistas.Items.Clear();
                    ddlEspecialistas.Items.Add(new ListItem("Sin especialistas disponibles", ""));
                    btnBuscarTurnos.Visible = false;
                }
            }
            else
            {
                ddlEspecialistas.Items.Clear();
                ddlEspecialistas.Items.Add(new ListItem("", ""));
                btnBuscarTurnos.Visible = false;
            }
            
            ddlEspecialistas.DataBind();

            List<Turno> turnosDisponibles = new List<Turno>();
            turnosDisponibles = (List<Turno>)Session["turnosDisponibles"];

            repTurnosDisponibles.DataSource = turnosDisponibles;
            repTurnosDisponibles.DataBind();

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgendarTurno()", true);

        }

        protected void btnAgendarTurno_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Paciente paciente = PacienteList.Find(x => x.IdPaciente == id);
            Session.Add("pacienteSeleccionado", paciente);

            cargarModalGestionTurnos();
        }

        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Turno> turnosDisponibles = new List<Turno>();
            Session.Add("turnosDisponibles", turnosDisponibles);

            int selectedIndexEspecialista = 0;
            int selectedIndexEspecialidad = ddlEspecialidades.SelectedIndex;
            int idEspecialidad = string.IsNullOrEmpty(ddlEspecialidades.Text) ? 0 : int.Parse(ddlEspecialidades.Text);
            cargarModalGestionTurnosSeleccionarEspecialista(idEspecialidad, selectedIndexEspecialidad, selectedIndexEspecialista);

        }

        protected void btnBuscarTurnos_Click(object sender, EventArgs e)
        {
            TurnoNegocio turnoNegocio = new TurnoNegocio();
            List<Turno> turnosDisponibles = new List<Turno>();

            int selectedIndexEspecialidad = ddlEspecialidades.SelectedIndex;
            int selectedIndexEspecialista = ddlEspecialistas.SelectedIndex;
            int idEspecialidad = int.Parse(ddlEspecialidades.Text);
            int idEspecialista = int.Parse(ddlEspecialistas.Text);

            turnosDisponibles = turnoNegocio.ChequearTurnos(idEspecialista, idEspecialidad);

            for(int i = 0; i < turnosDisponibles.Count; i++)
            {
                turnosDisponibles[i].IdTurno = i + 1;
            }

            Session.Add("turnosDisponibles", turnosDisponibles);
            cargarModalGestionTurnosSeleccionarEspecialista(idEspecialidad, selectedIndexEspecialidad, selectedIndexEspecialista);
        }

        protected void btnConfirmarSeleccionTurno_Click(Object sender, EventArgs e)
        {
            //TurnoNegocio turnoNegocio = new TurnoNegocio();

            List<Turno> turnosDisponibles = new List<Turno>();
            turnosDisponibles = (List<Turno>)Session["turnosDisponibles"];
            Paciente pacienteSeleccionado = (Paciente)Session["pacienteSeleccionado"];

            int id = int.Parse(((Button)sender).CommandArgument);
            Turno turnoSeleccionado = turnosDisponibles.Find(x => x.IdTurno == id);

            turnoSeleccionado.Paciente = pacienteSeleccionado;

            turnoSeleccionado.MotivoConsulta = "";
            turnoSeleccionado.Diagnostico = "";

            Session["turnoSeleccionado"] = turnoSeleccionado;

            tbxMotivoConsulta.Text = "";

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarMotivoConsulta()", true);
        }

        protected void btnAgregarMotivoConsulta_Click(object sender, EventArgs e)
        {
            Turno turnoSeleccionado = Session["turnoSeleccionado"] as Turno;            

            turnoSeleccionado.MotivoConsulta = tbxMotivoConsulta.Text;

            Session["turnoSeleccionado"] = turnoSeleccionado;

            lblMotivoConsultaAConfirmar.Text = turnoSeleccionado.MotivoConsulta;

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalConfirmarTurno()", true);
        }

        protected void btnConfirmarTurno_Click(Object sender, EventArgs e)
        {
            Turno turnoSeleccionado = Session["turnoSeleccionado"] as Turno;

            if (turnoSeleccionado != null)
            {
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                List<Turno> turnosAsignados = turnoNegocio.Listar();

                foreach(Turno turno in turnosAsignados)
                {
                    if(turno.Estado.Id !=3 && turno.Paciente.IdPaciente == turnoSeleccionado.Paciente.IdPaciente && turno.FechaHora == turnoSeleccionado.FechaHora)
                    {
                        //preparar msje error
                        return;
                    }
                }
                    
                turnoNegocio.Agregar(turnoSeleccionado);

                Session["turnoSeleccionado"] = null;

                string fechaTurno = turnoSeleccionado.FechaHora.ToString("dd/MM/yyyy");
                string horaTurno = turnoSeleccionado.FechaHora.ToString("HH:mm");
                //lblMotivoConsultaAConfirmar.Text = "";
                //lblFechaTurno.Text = fechaTurno + horaTurno;

                MailService envioMail = new MailService();
                string mailPaciente = turnoSeleccionado.Paciente.Mail;
                string asunto = "Turno confirmado Port Salut Medicina";
                string cuerpoMail = "<p>Su turno ha sido confirmado para el día " + fechaTurno + " a las " + horaTurno + ".</p>" +
                    "<p><strong>Especialidad:</strong> " + turnoSeleccionado.Especialidad.Descripcion + "</p>" +
                    "<p><strong>Especialista:</strong> " + turnoSeleccionado.Usuario.NombreCompleto + "</p>" +
                    "<p><strong>Motivo de consulta:</strong> " + turnoSeleccionado.MotivoConsulta + "</p>" +
                    "<p>Saludos cordiales, Port Salut Medicina.</p>";
                envioMail.armarCorreo(mailPaciente, asunto, cuerpoMail);

                try
                {
                    envioMail.enviarCorreo();
                    //Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        protected void btnNoConfirmarTurno_Click(Object sender, EventArgs e)
        {
            Session["turnoSeleccionado"] = null;
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarPaciente()", true);
        }

        protected void btnGuardarAgregarPaciente_Click(object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();
            Paciente nuevoPaciente  = new Paciente();
            
            nuevoPaciente.Apellido = tbxApellidos.Text;
            nuevoPaciente.Nombre =  tbxNombres.Text;
            nuevoPaciente.Dni =int.Parse(tbxDNI.Text);
            nuevoPaciente.Sexo = DropDownListSexo.Text;
            nuevoPaciente.FechaNacimiento = DateTime.Parse(tbxFechaNacimiento.Text);
            nuevoPaciente.Mail = tbxEmail.Text;
            nuevoPaciente.Telefono = tbxTelefono.Text;
            nuevoPaciente.Cobertura = tbxCobertura.Text;
            nuevoPaciente.NroCredencial = int.Parse(tbxNroCredencial.Text);

            try
            {
                negocio.Agregar(nuevoPaciente);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnModificarPaciente_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Paciente aux = PacienteList.Find(x => x.IdPaciente == id);
            tbxModApellidoPaciente.Text = aux.Apellido;
            tbxModNombrePaciente.Text = aux.Nombre;
            tbxModDniPaciente.Text = aux.Dni.ToString();
            dplModSexoPaciente.Text = aux.Sexo.ToString();
            tbxModNacPaciente.Text = aux.FechaNacimiento.ToString(("yyyy-MM-dd"));
            tbxModEmailPaciente.Text = aux.Mail.ToString();
            tbxModTelPaciente.Text = aux.Telefono;
            tbxModCoberturaPaciente.Text = aux.Cobertura;
            tbxModCredPaciente.Text = aux.NroCredencial.ToString();

            Session.Add("pacienteModificar", aux);
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalModificarPaciente()", true);
        }

        protected void btnGuardarModPaciente_Click(Object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();
            Paciente pacienteModificar = (Paciente)(Session["pacienteModificar"]);
            pacienteModificar.Apellido = tbxModApellidoPaciente.Text;
            pacienteModificar.Nombre = tbxModNombrePaciente.Text;
            pacienteModificar.Dni = int.Parse(tbxModDniPaciente.Text);
            pacienteModificar.Sexo = dplModSexoPaciente.Text;
            pacienteModificar.FechaNacimiento = DateTime.Parse(tbxModNacPaciente.Text);
            pacienteModificar.Mail = tbxModEmailPaciente.Text;
            pacienteModificar.Telefono = tbxModTelPaciente.Text;
            pacienteModificar.Cobertura = tbxModCoberturaPaciente.Text;
            pacienteModificar.NroCredencial = int.Parse(tbxModCredPaciente.Text);

            try
            {
                negocio.Modificar(pacienteModificar);
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
                        PacienteNegocio pacienteNegocio = new PacienteNegocio();
                        List<Paciente> pacienteFiltrado = pacienteNegocio.ListarXDniPaciente(dni);

                        repRepetidor.DataSource = pacienteFiltrado;
                        repRepetidor.DataBind();
                    }
                }
                else
                {
                    repRepetidor.DataSource = PacienteList;
                    repRepetidor.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
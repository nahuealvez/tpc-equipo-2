﻿using dominio;
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
        public Usuario UsuarioLogeado { get; set; }

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
                    ddlEspecialistas.Items.Add(new ListItem("SIN ESPECIALISTAS DISPONIBLES", ""));
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

        protected void btnConfirmarTurno_Click(Object sender, EventArgs e)
        {
            TurnoNegocio turnoNegocio = new TurnoNegocio();

            List<Turno> turnosDisponibles = new List<Turno>();
            turnosDisponibles = (List<Turno>)Session["turnosDisponibles"];
            Paciente pacienteSeleccionado = (Paciente)Session["pacienteSeleccionado"];

            int id = int.Parse(((Button)sender).CommandArgument);
            Turno turnoSeleccionado = turnosDisponibles.Find(x => x.IdTurno == id);

            turnoSeleccionado.Paciente = pacienteSeleccionado;
            turnoSeleccionado.MotivoConsulta = "MotivoTest";
            turnoSeleccionado.Diagnostico = "DiagnosticoTest";

            turnoNegocio.Agregar(turnoSeleccionado);

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
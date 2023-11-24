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

        protected void cargarModalGestionTurnos()
        {
            List<Turno> turnosDisponibles = new List<Turno>();
            turnosDisponibles = (List<Turno>)Session["turnosDisponibles"];
            repTurnosDisponibles.DataSource = turnosDisponibles;
            repTurnosDisponibles.DataBind();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgendarTurno()", true);
        }
        protected void btnAgendarTurno_Click(object sender, EventArgs e)
        {
            cargarModalGestionTurnos();
        }
        protected void btnBuscarTurnos_Click(object sender, EventArgs e)
        {
            TurnoNegocio turnoNegocio = new TurnoNegocio();
            List<Turno> turnosDisponibles = new List<Turno>();
            turnosDisponibles = turnoNegocio.ChequearTurnos(6, 13);
            Session.Add("turnosDisponibles", turnosDisponibles);
            cargarModalGestionTurnos();
        }

        protected void btnAceptarAgendarTurno_Click(Object sender, EventArgs e)
        {

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
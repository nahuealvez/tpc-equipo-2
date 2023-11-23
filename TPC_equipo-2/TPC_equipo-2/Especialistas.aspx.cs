using dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Especialistas : System.Web.UI.Page
    {
        public List<Usuario> EspecialistasList;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            EspecialistasList = usuarioNegocio.ListarEspecialistas();

            List<Especialidad> especialidadesList = new List<Especialidad>();
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            especialidadesList = especialidadNegocio.Listar();
            especialidadesList = especialidadesList.OrderBy(x => x.Descripcion).ToList();
            ddlFiltroEspecialidades.DataTextField = "Descripcion";
            ddlFiltroEspecialidades.DataValueField = "Id";
            ddlFiltroEspecialidades.DataSource = especialidadesList;
            ddlFiltroEspecialidades.DataBind();
            ddlFiltroEspecialidades.Items.Insert(0, "Todas las especialidades");

            if (!IsPostBack)
            {
                repRepetidor.DataSource = EspecialistasList;
                repRepetidor.DataBind();
            }

            foreach (RepeaterItem item in repRepetidor.Items)
            {
                int Id = int.Parse((item.FindControl("btnModificar") as Button).CommandArgument.ToString());
                Button btnDesactivar = (Button)item.FindControl("btnDesactivar");
                Button btnActivar = (Button)item.FindControl("btnActivar");
                Usuario usuarioAux = EspecialistasList.Find(x => x.IdUsuario == Id);
                if (!usuarioAux.Estado)
                {
                    btnDesactivar.Visible = false;
                    btnActivar.Visible = true;
                }
            }
        }

        protected void btnAgregarEspecialista_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarEspecialista()", true);
        }

        protected void btnModificarEspecialista_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Usuario aux = EspecialistasList.Find(x => x.IdUsuario ==  id);
            tbxModificarApellido.Text = aux.Apellido;
            tbxModificarNombre.Text = aux.Nombre;
            tbxModificarDni.Text = aux.Dni.ToString();
            dplModificarSexo.Text = aux.Sexo.ToString();
            tbxModificarNacimiento.Text = aux.FechaNacimiento.ToString(("yyyy-MM-dd"));
            tbxModificarMail.Text = aux.Mail.ToString();
            tbxModificarTel.Text = aux.Telefono;
            tbxModificarUser.Text = aux.UsuarioReg;
            tbxModificarPass.Text = aux.Password;
            Session.Add("usuarioModificar", aux);

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalModificarEspecialista()", true);
        }

        protected void btnGuardarAgregarEspecialista_Click(object sender, EventArgs e)
        {
            //PENDIENTE MANEJAR VALIDACIONES COMO USUARIO REPETIDO / DNI REPETIDO X EJ
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario nuevoEspecialista = new Usuario();

            nuevoEspecialista.Nombre = tbxNombres.Text;
            nuevoEspecialista.Apellido = tbxApellidos.Text;
            nuevoEspecialista.Dni = int.Parse(tbxDNI.Text);
            nuevoEspecialista.Sexo = DropDownListSexo.Text;
            nuevoEspecialista.FechaNacimiento = DateTime.Parse(tbxFechaNacimiento.Text);
            nuevoEspecialista.Mail = tbxEmail.Text;
            nuevoEspecialista.Telefono = tbxTelefono.Text;
            nuevoEspecialista.UsuarioReg = tbxUsuario.Text;
            nuevoEspecialista.Password = tbxContrasenia.Text;
            nuevoEspecialista.Perfil = 3;

            try
            {
                negocio.Agregar(nuevoEspecialista);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void cargarModalAgregarQuitarEspecialidades(int id)
        {
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();
            List<Especialidad> especialidadesList = new List<Especialidad>();
            List<Especialidad> especialidadesNoAsignadas = new List<Especialidad>();
            List<Especialidad> especialidadesAsignadas = new List<Especialidad>();
            List<int> idsEespecialidadesAsignadas = new List<int>();
            especialidadesList = negocioEspecialidad.Listar();
            idsEespecialidadesAsignadas = negocioEspecialidad.EspecialidadesXEspecialista(id);
            foreach (Especialidad especialidad in especialidadesList)
            {
                if (idsEespecialidadesAsignadas.Exists(x => x == especialidad.Id))
                {
                    especialidadesAsignadas.Add(especialidad);
                }
                else
                {
                    if (especialidad.Estado == true)
                    {
                        especialidadesNoAsignadas.Add(especialidad);
                    }
                }
            }
            ddlEspecialidades.DataSource = especialidadesNoAsignadas;
            ddlEspecialidades.DataTextField = "Descripcion";
            ddlEspecialidades.DataValueField = "Id";
            ddlEspecialidades.DataBind();
            repEspecialidadesEspecialista.DataSource = especialidadesAsignadas;
            repEspecialidadesEspecialista.DataBind();

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarQuitarEspecialidades()", true);
        }

        protected void btnAgregarQuitarEspecialidades_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialistaModificarEspecialidades", id);
            cargarModalAgregarQuitarEspecialidades(id);
        }

        protected void btnGuardarEspecialidadEnEspecialista_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();

            int idEspecialista = (int)(Session["idEspecialistaModificarEspecialidades"]);
            int idEspecialidad = int.Parse(ddlEspecialidades.Text);
            negocioEspecialidad.AgregarEspecialidadEspecialista(idEspecialista, idEspecialidad);

            cargarModalAgregarQuitarEspecialidades(idEspecialista);
        }

        protected void btnQuitarEspecialidad_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();

            int idEspecialista = (int)(Session["idEspecialistaModificarEspecialidades"]);
            int idEspecialidad = int.Parse(((Button)sender).CommandArgument);
            negocioEspecialidad.EliminarEspecialidadEspecialista(idEspecialista, idEspecialidad);

            cargarModalAgregarQuitarEspecialidades(idEspecialista);
        }

        protected void cargarModalConfigurarJornadas(Usuario especialista)
        {
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();
            JornadaNegocio negocioJornada = new JornadaNegocio();
            List<Jornada> jornadasList = negocioJornada.ListarXEspecialista(especialista);
            List<Especialidad> especialidades = new List<Especialidad>();
            List<Especialidad> especialidadesAsignadas = new List<Especialidad>();
            List<int> idsEspecialidadesAsignadas = new List<int> ();
            especialidades = negocioEspecialidad.Listar();
            idsEspecialidadesAsignadas = negocioEspecialidad.EspecialidadesXEspecialista(especialista.IdUsuario);

            foreach(Especialidad especialidad in especialidades)
            {
                if(idsEspecialidadesAsignadas.Exists(x => x == especialidad.Id))
                {
                    especialidadesAsignadas.Add(especialidad);
                }
            }

            ddlEspecialidad.DataSource = especialidadesAsignadas;
            ddlEspecialidad.DataTextField = "Descripcion";
            ddlEspecialidad.DataValueField = "Id";
            ddlEspecialidad.DataBind();

            repJornadas.DataSource = jornadasList;
            repJornadas.DataBind();

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalConfigurarJornada()", true);
        }

        protected void btnConfigurarJornadas_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            Usuario especialista = new Usuario();
            EspecialistasList = usuarioNegocio.ListarEspecialistas();

            int idEspecialista = int.Parse(((Button)sender).CommandArgument);
            especialista = EspecialistasList.Find(x => x.IdUsuario == idEspecialista);

            Session.Add("especialista", especialista);
            cargarModalConfigurarJornadas(especialista);
        }

        protected void btnGuardarJornada_Click(object sender, EventArgs e)
        {
            JornadaNegocio jornadaNegocio = new JornadaNegocio();
            Jornada nuevaJornada = new Jornada();
            Usuario especialista = (Usuario)(Session["especialista"]);
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            List<Especialidad> especialidades = new List<Especialidad>();
            especialidades = especialidadNegocio.Listar();
            string horaInicioFormateada = tbxHoraInicio.Text.PadLeft(2, '0')+":00:00";
            string horaFinFormateada = tbxHoraFin.Text.PadLeft(2, '0') + ":00:00";

            nuevaJornada.Especialidad = especialidades.Find(x => x.Id == int.Parse(ddlEspecialidad.Text));
            nuevaJornada.Especialista = especialista;
            nuevaJornada.DiaSemana = ddlDiaSemana.SelectedItem.Text;
            nuevaJornada.HoraInicio = TimeSpan.Parse(horaInicioFormateada);
            nuevaJornada.HoraFin = TimeSpan.Parse(horaFinFormateada);

            jornadaNegocio.Agregar(nuevaJornada);

            cargarModalConfigurarJornadas(especialista);
        }

        protected void btnQuitarJornada_Click(object sender, EventArgs e)
        {
            Usuario especialista = (Usuario)(Session["especialista"]);
            cargarModalConfigurarJornadas(especialista);
        }

        protected void btnGuardarModificarEspecialista_Click(object sender, EventArgs e)
        {

            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuarioModificar = (Usuario)(Session["usuarioModificar"]);
            usuarioModificar.Nombre = tbxModificarNombre.Text;
            usuarioModificar.Apellido = tbxModificarApellido.Text;
            usuarioModificar.Dni = int.Parse(tbxModificarDni.Text);
            usuarioModificar.Sexo = dplModificarSexo.Text;
            usuarioModificar.FechaNacimiento = DateTime.Parse(tbxModificarNacimiento.Text);
            usuarioModificar.Mail = tbxModificarMail.Text;
            usuarioModificar.Telefono = tbxModificarTel.Text;
            usuarioModificar.UsuarioReg = tbxModificarUser.Text;
            usuarioModificar.Password = tbxModificarPass.Text;

            try
            {
                negocio.Modificar(usuarioModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnEliminarEspecialista_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idUsuario", id);
            Usuario usuario = EspecialistasList.Find(x => x.IdUsuario == id);
            lblNombreEliminarEspecialista.Text = usuario.UsuarioReg;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalEliminarEspecialista()", true);
        }

        protected void btnAceptarEliminarEspecialista_Click(object sender, EventArgs e)
        {
            int idUsuario = (int)(Session["idUsuario"]);
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario especialistaEliminar = EspecialistasList.Find(x => x.IdUsuario == idUsuario);

            try
            {
                negocio.Eliminar(especialistaEliminar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblNombreErrorEliminarEspecialista.Text = especialistaEliminar.UsuarioReg;
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalErrorEliminarEspecialista()", true);
            }
        }

        protected void btnDesactivarEspecialista_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialista", id);
            Usuario usuario = EspecialistasList.Find(x => x.IdUsuario == id);
            lblNombreEspecialistaDesactivar.Text = usuario.UsuarioReg;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalDesactivarEspecialista()", true);
        }

        protected void btnAceptarDesactivarEspecialista_Click(object sender, EventArgs e)
        {
            int idUsuario = (int)(Session["idEspecialista"]);
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario especialistaModificar = EspecialistasList.Find(x => x.IdUsuario == idUsuario);

            try
            {
                especialistaModificar.Estado = false;
                negocio.ModificarEstado(especialistaModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnActivarEspecialista_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialista", id);
            Usuario usuario = EspecialistasList.Find(x => x.IdUsuario == id);
            lblNombreEspecialistaActivar.Text = usuario.UsuarioReg;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalActivarEspecialista()", true);
        }

        protected void btnAceptarActivarEspecialista_Click(object sender, EventArgs e)
        {
            int idUsuario = (int)(Session["idEspecialista"]);
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario especialistaModificar = EspecialistasList.Find(x => x.IdUsuario == idUsuario);

            try
            {
                especialistaModificar.Estado = true;
                negocio.ModificarEstado(especialistaModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected static string EliminarAcentosConRegEx(string inputString)
        {
            Regex reemplazarAcentos_a = new Regex("[á|à|ä|â]", RegexOptions.Compiled);
            Regex reemplazarAcentos_b = new Regex("[é|è|ë|ê]", RegexOptions.Compiled);
            Regex reemplazarAcentos_c = new Regex("[í|ì|ï|î]", RegexOptions.Compiled);
            Regex reemplazarAcentos_d = new Regex("[ó|ò|ö|ô]", RegexOptions.Compiled);
            Regex reemplazarAcentos_e = new Regex("[ú|ù|ü|û]", RegexOptions.Compiled);

            inputString = reemplazarAcentos_a.Replace(inputString, "a");
            inputString = reemplazarAcentos_b.Replace(inputString, "e");
            inputString = reemplazarAcentos_c.Replace(inputString, "i");
            inputString = reemplazarAcentos_d.Replace(inputString, "o");
            inputString = reemplazarAcentos_e.Replace(inputString, "u");

            return inputString;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string busqueda = EliminarAcentosConRegEx(txtBusqueda.Text.Trim().ToLower());

            List<Usuario> especialistasFiltrados = EspecialistasList.Where(x => EliminarAcentosConRegEx(x.Apellido.ToLower()).Contains(busqueda) || EliminarAcentosConRegEx(x.Nombre.ToLower()).Contains(busqueda)).ToList();

            repRepetidor.DataSource = especialistasFiltrados;
            repRepetidor.DataBind();
        }
    }
}
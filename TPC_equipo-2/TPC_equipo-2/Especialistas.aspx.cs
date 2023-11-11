using dominio;
using Negocio;
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
        public List<Usuario> EspecialistasList;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            EspecialistasList = usuarioNegocio.ListarEspecialistas();
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

        protected void btnAgregarQuitarEspecialidades_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();
            List<Especialidad> especialidadesList = new List<Especialidad>();
            especialidadesList = negocioEspecialidad.Listar();
            ddlEspecialidades.DataSource = especialidadesList;
            ddlEspecialidades.DataTextField = "Descripcion";
            ddlEspecialidades.DataValueField = "Id";
            ddlEspecialidades.DataBind();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarQuitarEspecialidades()", true);
        }

        protected void btnAgregarJornadas_Click(object sender, EventArgs e)
        {

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

        }

        protected void btnDesactivarEspecialista_Click(Object sender, EventArgs e)
        {

        }

        protected void btnActivarEspecialista_Click(Object sender, EventArgs e)
        {

        }

    }
}
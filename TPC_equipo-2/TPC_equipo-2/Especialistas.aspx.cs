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

        protected void btnModificarEspecialista_Click(Object sender, EventArgs e)
        {

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
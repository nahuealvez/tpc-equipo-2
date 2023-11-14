using dominio;
using Negocio;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Usuarios : System.Web.UI.Page
    {
        public List<Usuario> UsuarioList;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            UsuarioList = usuarioNegocio.Listar();
            if (!IsPostBack)
            {
                repRepetidor.DataSource = UsuarioList;
                repRepetidor.DataBind();
            }

            foreach (RepeaterItem item in repRepetidor.Items)
            {
                int Id = int.Parse((item.FindControl("btnModificar") as Button).CommandArgument.ToString());
                Button btnDesactivar = (Button)item.FindControl("btnDesactivar");
                Button btnActivar = (Button)item.FindControl("btnActivar");
                Usuario usuarioAux = UsuarioList.Find(x => x.IdUsuario == Id);
                if (!usuarioAux.Estado)
                {
                    btnDesactivar.Visible = false;
                    btnActivar.Visible = true;
                }
            }
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalAgregarUsuario()", true);
        }

        protected void btnGuardarAgregarUsuario_Click(object sender, EventArgs e)
        {
            //PENDIENTE MANEJAR VALIDACIONES COMO USUARIO REPETIDO / DNI REPETIDO X EJ
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario nuevoUsuario = new Usuario();

            nuevoUsuario.Nombre = tbxNombres.Text;
            nuevoUsuario.Apellido = tbxApellidos.Text;
            nuevoUsuario.Dni = int.Parse(tbxDNI.Text);
            nuevoUsuario.Sexo = DropDownListSexo.Text;
            nuevoUsuario.FechaNacimiento = DateTime.Parse(tbxFechaNacimiento.Text);
            nuevoUsuario.Mail = tbxEmail.Text;
            nuevoUsuario.Telefono = tbxTelefono.Text;
            nuevoUsuario.UsuarioReg = tbxUsuario.Text;
            nuevoUsuario.Password = tbxContrasenia.Text;
            nuevoUsuario.Perfil = int.Parse(DropDownListPerfil.Text);

            try
            {
                negocio.Agregar(nuevoUsuario);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            if (!Page.IsValid)
            {
                valSummaryForm.Visible = true;
            }
        }

        protected void btnModificarUsuario_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Usuario aux = UsuarioList.Find(x => x.IdUsuario == id);
            tbxModificarUserApellido.Text = aux.Apellido;
            tbxModificarUserNombre.Text = aux.Nombre;
            tbxModificarUserDni.Text = aux.Dni.ToString();
            dplModificarUserSexo.Text = aux.Sexo.ToString();
            tbxModificarUserNacimiento.Text = aux.FechaNacimiento.ToString(("yyyy-MM-dd"));
            tbxModificarUserMail.Text = aux.Mail.ToString();
            tbxModificarUserTel.Text = aux.Telefono;
            tbxModificarUser.Text = aux.UsuarioReg;
            tbxModificarUserPass.Text = aux.Password;
            Session.Add("usuarioModificar", aux);
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalModificarUsuario()", true);
        }

        protected void btnGuardarModificarUser_Click(Object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuarioModificar = (Usuario)(Session["usuarioModificar"]);
            usuarioModificar.Nombre = tbxModificarUserNombre.Text;
            usuarioModificar.Apellido = tbxModificarUserApellido.Text;
            usuarioModificar.Dni = int.Parse(tbxModificarUserDni.Text);
            usuarioModificar.Sexo = dplModificarUserSexo.Text;
            usuarioModificar.FechaNacimiento = DateTime.Parse(tbxModificarUserNacimiento.Text);
            usuarioModificar.Mail = tbxModificarUserMail.Text;
            usuarioModificar.Telefono = tbxModificarUserTel.Text;
            usuarioModificar.UsuarioReg = tbxModificarUser.Text;
            usuarioModificar.Password = tbxModificarUserPass.Text;

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

        protected void btnEliminarUsuario_Click(Object sender, EventArgs e)
        {

        }

        protected void btnDesactivarUsuario_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idUsuario", id);
            Usuario usuario = UsuarioList.Find(x => x.IdUsuario == id);
            lblNombreUsuarioDesactivar.Text = usuario.UsuarioReg;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalDesactivarUsuario()", true);
        }

        protected void btnAceptarDesactivarUsuario_Click(Object sender, EventArgs e)
        {
            int idUsuario = (int)(Session["idUsuario"]);
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuarioModificar = UsuarioList.Find(x => x.IdUsuario == idUsuario);

            try
            {
                usuarioModificar.Estado = false;
                negocio.ModificarEstado(usuarioModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnActivarUsuario_Click(Object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idUsuario", id);
            Usuario usuario = UsuarioList.Find(x => x.IdUsuario == id);
            lblNombreUsuarioActivar.Text = usuario.UsuarioReg;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalActivarUsuario()", true);
        }

        protected void btnAceptarActivarUsuario_Click(object sender, EventArgs e)
        {
            int idUsuario = (int)(Session["idUsuario"]);
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuarioModificar = UsuarioList.Find(x => x.IdUsuario == idUsuario);

            try
            {
                usuarioModificar.Estado = true;
                negocio.ModificarEstado(usuarioModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
using dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_equipo_2
{
    public partial class Especialidades : System.Web.UI.Page
    {
        public List<Especialidad> EspecialidadList;
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            EspecialidadList = especialidadNegocio.Listar();
            if (!IsPostBack)
            {
                repRepetidor.DataSource = EspecialidadList;
                repRepetidor.DataBind();
            }

            foreach(RepeaterItem item in repRepetidor.Items)
            {
                int Id = int.Parse((item.FindControl("btnModificar") as Button).CommandArgument.ToString());
                Button btnDesactivar = (Button)item.FindControl("btnDesactivar");
                Button btnActivar = (Button)item.FindControl("btnActivar");
                Especialidad especialidadAux = EspecialidadList.Find(x => x.Id == Id);
                if (!especialidadAux.Estado)
                {
                    btnDesactivar.Visible = false;
                    btnActivar.Visible = true;
                }
            }

        }

        protected void btnModificarEspecialidad_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialidad", id);
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalModificarEspecialidad()", true);
        }

        protected void btnEliminarEspecialidad_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialidad", id);
            Especialidad especialidad = EspecialidadList.Find(x => x.Id == id);
            lblNombreEspecEliminar.Text = especialidad.Descripcion;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalEliminarEspecialidad()", true);
        }

        protected void btnDesactivarEspecialidad_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialidad", id);
            Especialidad especialidad = EspecialidadList.Find(x => x.Id == id);
            lblNombreEspecDesactivar.Text = especialidad.Descripcion;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalDesactivarEspecialidad()", true);
        }

        protected void btnActivarEspecialidad_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("idEspecialidad", id);
            Especialidad especialidad = EspecialidadList.Find(x => x.Id == id);
            lblNombreEspecActivar.Text = especialidad.Descripcion;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalActivarEspecialidad()", true);
        }
        protected void btnGuardarAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            if (tbxEspecialidad.Text.Trim() != "")
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                Especialidad nuevaEspecialidad = new Especialidad();
                if(EspecialidadList.Exists(x => x.Descripcion.ToUpper() == tbxEspecialidad.Text.ToUpper()))
                {
                    lblErrorAgregarEsp.Text = tbxEspecialidad.Text;
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalErrorAgregarEspecialidad()", true);
                    tbxEspecialidad.Text = "";
                }
                else
                {
                    try
                    {
                        nuevaEspecialidad.Descripcion = tbxEspecialidad.Text;
                        negocio.Agregar(nuevaEspecialidad);
                        Response.Redirect(Request.RawUrl);

                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }
                }
            }

        }
        protected void btnGuardarModificacionEspecialidad_Click(object sender, EventArgs e)
        {
            int idEspecialidad = (int)(Session["idEspecialidad"]);
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad especialidadModificar = EspecialidadList.Find(x => x.Id == idEspecialidad);

            if(tbxModificarEspecialidad.Text.Trim() != "")
            {
                try
                {
                    especialidadModificar.Descripcion = tbxModificarEspecialidad.Text;
                    negocio.Modificar(especialidadModificar);
                    Response.Redirect(Request.RawUrl);
                    //PENDIENTE VALIDACION PARA NO MODIFICAR SI ESTA ASOCIADO
                    //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalErrorModificarEspecialidad()", true);
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        protected void btnAceptarEliminarEspecialidad_Click(object sender, EventArgs e)
        {
            int idEspecialidad = (int)(Session["idEspecialidad"]);
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad especialidadEliminar = EspecialidadList.Find(x => x.Id == idEspecialidad);
            try
            {
                negocio.Eliminar(especialidadEliminar);
                Response.Redirect(Request.RawUrl);
                //PENDIENTE VALIDACION NO ELIMINAR SI HAY ASOCIADO
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalErrorEliminarEspecialidad()", true);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnAceptarDesactivarEspecialidad_Click(object sender, EventArgs e)
        {
            int idEspecialidad = (int)(Session["idEspecialidad"]);
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad especialidadModificar = EspecialidadList.Find(x => x.Id == idEspecialidad);
            try
            {
                especialidadModificar.Estado = false;
                negocio.ModificarEstado(especialidadModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnAceptarActivarEspecialidad_Click(object sender, EventArgs e)
        {
            int idEspecialidad = (int)(Session["idEspecialidad"]);
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad especialidadModificar = EspecialidadList.Find(x => x.Id == idEspecialidad);
            try
            {
                especialidadModificar.Estado = true;
                negocio.ModificarEstado(especialidadModificar);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
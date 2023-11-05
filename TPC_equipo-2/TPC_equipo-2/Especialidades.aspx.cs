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

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalModificarEspecialidad()", true);
        }

        protected void btnEliminarEspecialidad_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalEliminarEspecialidad()", true);
        }

        protected void btnDesactivarEspecialidad_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalDesactivarEspecialidad()", true);
        }

        protected void btnActivarEspecialidad_Click(object sender, EventArgs e)
        {
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
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalErrorModificarEspecialidad()", true);
        }

        protected void btnAceptarEliminarEspecialidad_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalErrorEliminarEspecialidad()", true);
        }
    }
}
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

        }

        protected void btnModificarEspecialidad_Click(object sender, EventArgs e)
        {

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalModificarEspecialidad()", true);
        }

        protected void btnEliminarEspecialidad_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "abrirModalEliminarEspecialidad()", true);
        }

        protected void AgregarEspecialidad_Click(object sender, EventArgs e)
        {
            if(tbxEspecialidad.Text.Trim() != "")
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                Especialidad nuevaEspecialidad = new Especialidad();
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
}
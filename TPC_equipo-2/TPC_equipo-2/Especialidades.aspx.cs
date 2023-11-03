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

        protected void OnAdd(object sender, EventArgs e)
        {

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal()", true);
        }
    }
}
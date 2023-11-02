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
    public partial class Default : System.Web.UI.Page
    {
        public List<Especialidad> EspecialidadList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
                EspecialidadList = especialidadNegocio.Listar();
            }
        }
    }
}
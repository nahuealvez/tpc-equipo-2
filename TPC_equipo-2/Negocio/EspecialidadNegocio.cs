using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace Negocio
{
    public class EspecialidadNegocio
    {
        public List<Especialidad> Listar()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Medico].[sp_GetEspecialidad]");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.Id = (int)datos.Lector["IdEspecialidad"];
                    aux.Nombre = (string)datos.Lector["Especialidad"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

    }
}

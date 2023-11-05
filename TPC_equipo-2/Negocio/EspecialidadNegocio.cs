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
                    aux.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.Estado = (bool)datos.Lector["Estado"];
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
        public void Agregar(Especialidad nuevaEspecialidad)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("INSERT INTO Medico.Especialidad (Especialidad, Estado) VALUES (@especialidad,1)");
                datos.SetearParametro("@especialidad", nuevaEspecialidad.Descripcion);
                datos.EjecutarAccion();
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
        public void Modificar(Especialidad especialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE Medico.Especialidad set Especialidad = @Descripcion where IdEspecialidad = @Id");
                datos.SetearParametro("@Descripcion", especialidad.Descripcion);
                datos.SetearParametro("@Id", especialidad.Id);
                datos.EjecutarAccion();
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

        public void ModificarEstado(Especialidad especialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE Medico.Especialidad set Estado = @Estado where IdEspecialidad = @Id");
                datos.SetearParametro("@Estado", especialidad.Estado);
                datos.SetearParametro("@Id", especialidad.Id);
                datos.EjecutarAccion();
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
        public void Eliminar(Especialidad especialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("DELETE Medico.Especialidad WHERE IdEspecialidad = @Id");
                datos.SetearParametro("@Id", especialidad.Id);
                datos.EjecutarAccion();
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

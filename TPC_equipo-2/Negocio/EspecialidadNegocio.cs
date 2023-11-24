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
                datos.SetearConsulta("EXEC [Especialidad].[sp_GetEspecialidades]");

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

        public Especialidad ListarXId(int idEspecialidad)
        {
            Especialidad especialidadEncontrada = new Especialidad();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT * FROM Especialidad.Especialidad WHERE IdEspecialidad = @id");
                datos.SetearParametro("@id", idEspecialidad);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    especialidadEncontrada.Id = (int)datos.Lector["IdEspecialidad"];
                    especialidadEncontrada.Descripcion = (string)datos.Lector["Especialidad"];
                    especialidadEncontrada.Estado = (bool)datos.Lector["Estado"];
                }

                return especialidadEncontrada;
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

        public List<Especialidad> ListarActivos()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Especialidad].[sp_GetEspecialidades]");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.Id = (int)datos.Lector["IdEspecialidad"];
                    aux.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    
                    if (aux.Estado == true)
                    {
                        lista.Add(aux);
                    }
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
                datos.SetearConsulta("EXEC [Especialidad].[sp_InsEspecialidad] @especialidad");
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
                datos.SetearConsulta("EXEC [Especialidad].[sp_UpdEspecialidad] @Id, @Descripcion, @Estado");
                datos.SetearParametro("@Id", especialidad.Id);
                datos.SetearParametro("@Descripcion", especialidad.Descripcion);
                datos.SetearParametro("@Estado", especialidad.Estado);
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
                datos.SetearConsulta("EXEC [Especialidad].[sp_UpdEstadoEspecialidad] @Id, @Estado");
                datos.SetearParametro("@Id", especialidad.Id);
                datos.SetearParametro("@Estado", especialidad.Estado);
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
                datos.SetearConsulta("EXEC [Especialidad].[sp_DelEspecialidad] @Id;");
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
        public List<int> EspecialidadesXEspecialista(int id)
        {
            List<int> lista = new List<int>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT * FROM Especialidad.EspecialistaEspecialidad WHERE IdUsuario = @Id");
                datos.SetearParametro("@Id", id);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add((int)datos.Lector["IdEspecialidad"]);
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

        public void AgregarEspecialidadEspecialista(int idUsuario, int idEspecialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("INSERT INTO Especialidad.EspecialistaEspecialidad (IdUsuario, IdEspecialidad) VALUES (@IdEspecialista, @IdEspecialidad)");
                datos.SetearParametro("@IdEspecialista", idUsuario);
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
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
        public void EliminarEspecialidadEspecialista(int idUsuario, int idEspecialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("DELETE FROM Especialidad.EspecialistaEspecialidad WHERE IdUsuario = @IdEspecialista AND IdEspecialidad = @IdEspecialidad");
                datos.SetearParametro("@IdEspecialista", idUsuario);
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
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

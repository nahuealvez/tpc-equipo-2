using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class JornadaNegocio
    {
        public List<Jornada> Listar()
        {
            List<Jornada> lista = new List<Jornada>();
            List<Usuario> especialistas = new List<Usuario>();
            List<Especialidad> especialidades = new List<Especialidad>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

            especialistas = usuarioNegocio.ListarEspecialistas();
            especialidades = especialidadNegocio.Listar();

            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT * FROM Usuario.Jornada");
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Jornada aux = new Jornada();
                    aux.IdJornada = (int)datos.Lector["IdJornada"];
                    aux.Especialidad = especialidades.Find(x => x.Id == (int)datos.Lector["IdEspecialidad"]);
                    aux.Especialista = especialistas.Find(x => x.IdUsuario == (int)datos.Lector["IdEspecialista"]);
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];
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
        public List<Jornada> ListarXEspecialista(Usuario Especialista)
        {
            List<Jornada> lista = new List<Jornada>();
            List<Especialidad> especialidades = new List<Especialidad>();
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

            especialidades = especialidadNegocio.Listar();

            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT * FROM Usuario.Jornada WHERE IdEspecialista = @Id");
                datos.SetearParametro("@Id", Especialista.IdUsuario);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Jornada aux = new Jornada();
                    aux.IdJornada = (int)datos.Lector["IdJornada"];
                    aux.Especialidad = especialidades.Find(x => x.Id == (int)datos.Lector["IdEspecialidad"]);
                    aux.Especialista = Especialista;
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];
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

        public void Agregar (Jornada nuevaJornada)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("INSERT INTO Usuario.Jornada (IdEspecialidad, IdEspecialista, DiaSemana, HoraInicio, HoraFin) VALUES (@IdEspecialidad, @IdEspecialista, @DiaSemana, @HoraInicio, @HoraFin)");
                //datos.SetearConsulta("EXEC [Usuario].[sp_InsJornada] @IdEspecialidad, @IdEspecialista, @DiaSemana, @HoraInicio, @HoraFin");
                datos.SetearParametro("@IdEspecialidad", nuevaJornada.Especialidad.Id);
                datos.SetearParametro("@IdEspecialista", nuevaJornada.Especialista.IdUsuario);
                datos.SetearParametro("@DiaSemana", nuevaJornada.DiaSemana);
                datos.SetearParametro("@HoraInicio", nuevaJornada.HoraInicio);
                datos.SetearParametro("@HoraFin", nuevaJornada.HoraFin);
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

        public void Eliminar(int IdJornada)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_DelJornada] @IdJornada");
                //datos.SetearConsulta("EXEC [Usuario].[sp_InsJornada] @IdEspecialidad, @IdEspecialista, @DiaSemana, @HoraInicio, @HoraFin");
                datos.SetearParametro("@IdJornada", IdJornada);
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

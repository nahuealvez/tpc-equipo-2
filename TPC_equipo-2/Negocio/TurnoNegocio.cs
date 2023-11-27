using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace Negocio
{
    public class TurnoNegocio
    {
        public List<Turno> Listar()
        {
            List<Turno> lista = new List<Turno>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            PacienteNegocio pacienteNegocio = new PacienteNegocio();

            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT A.IdTurno, A.IdPaciente, A.IdEspecialista, A.IdEspecialidad, A.FechaHoraTurno, A.MotivoConsulta, A.Diagnostico, A.IdEstadoTurno, B.NombreEstado FROM Especialidad.Turno A INNER JOIN Especialidad.EstadoTurno AS B ON A.IdEstadoTurno = B.IdEstadoTurno");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaHoraTurno"];
                    aux.MotivoConsulta = (string)datos.Lector["MotivoConsulta"];
                    aux.Diagnostico = (string)datos.Lector["Diagnostico"];
                    
                    int idPaciente = (int)datos.Lector["IdPaciente"];
                    aux.Paciente = pacienteNegocio.ListarXIdPaciente(idPaciente);

                    int idEspecialista = (int)datos.Lector["IdEspecialista"];
                    aux.Usuario = usuarioNegocio.ListarXIdUsuario(idEspecialista);

                    int idEspecialidad = (int)datos.Lector["IdEspecialidad"];
                    aux.Especialidad = especialidadNegocio.ListarXId(idEspecialidad);

                    aux.Estado = new EstadoTurno();
                    aux.Estado.Id = (int)datos.Lector["IdEstadoTurno"];
                    aux.Estado.Descripcion = (string)datos.Lector["NombreEstado"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public List<Turno> ListarPorEspecialista(int IdEspecialista)
        {
            List<Turno> lista = new List<Turno>();
            List<Usuario> especialistas = new List<Usuario>();
            List<Especialidad> especialidades = new List<Especialidad>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

            especialistas = usuarioNegocio.ListarEspecialistas();
            especialidades = especialidadNegocio.Listar();

            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Especialidad].[sp_GetTurnosByEspecialista] @IdEspecialista;");
                datos.SetearParametro("@IdEspecialista", IdEspecialista);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaHoraTurno"];
                    aux.MotivoConsulta = (string)datos.Lector["MotivoConsulta"];
                    aux.Diagnostico = (string)datos.Lector["Diagnostico"];

                    aux.Paciente = new Paciente();
                    aux.Paciente.IdPaciente = (Int32)datos.Lector["IdPaciente"];
                    aux.Paciente.Dni = (Int32)datos.Lector["DniPaciente"];
                    aux.Paciente.Apellido = (string)datos.Lector["ApellidoPaciente"];
                    aux.Paciente.Nombre = (string)datos.Lector["NombrePaciente"];
                    aux.Paciente.Sexo = (string)datos.Lector["SexoPaciente"];
                    aux.Paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimientoPaciente"];
                    aux.Paciente.Mail = (string)datos.Lector["MailPaciente"];
                    aux.Paciente.Telefono = (string)datos.Lector["TelefonoPaciente"];
                    aux.Paciente.Cobertura = (string)datos.Lector["CoberturaPaciente"];
                    aux.Paciente.NroCredencial = (int)datos.Lector["NroCredencialPaciente"];
                    aux.Usuario = especialistas.Find(x => x.IdUsuario == (int)datos.Lector["IdEspecialista"]);

                    aux.Usuario = new Usuario();
                    aux.Usuario.IdUsuario = (int)datos.Lector["IdEspecialista"];
                    aux.Usuario.Apellido = (string)datos.Lector["ApellidoEspecialista"];
                    aux.Usuario.Nombre = (string)datos.Lector["NombreEspecialista"];
                    aux.Usuario.Dni = (int)datos.Lector["DniEspecialista"];
                    aux.Usuario.Sexo = (string)datos.Lector["SexoEspecialista"];
                    aux.Usuario.FechaNacimiento = (DateTime)datos.Lector["FechaNacimientoEspecialista"];
                    aux.Usuario.Mail = (string)datos.Lector["MailEspecialista"];
                    aux.Usuario.Telefono = (string)datos.Lector["TelefonoEspecialista"];
                    aux.Usuario.UsuarioReg = (string)datos.Lector["UsuarioEspecialista"];
                    aux.Usuario.Password = (string)datos.Lector["PasswordEspecialista"];
                    aux.Usuario.Perfil = (int)datos.Lector["IdPerfilEspecialista"];
                    aux.Usuario.Estado = (bool)datos.Lector["EstadoEspecialidad"];
                    aux.Especialidad = especialidades.Find(x => x.Id == (int)datos.Lector["IdEspecialidad"]);

                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Id = (int)datos.Lector["IdEspecialidad"];
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.Especialidad.Estado = (bool)datos.Lector["EstadoEspecialidad"];

                    aux.Estado = new EstadoTurno();
                    aux.Estado.Id = (int)datos.Lector["IdEstadoTurno"];
                    aux.Estado.Descripcion = (string)datos.Lector["NombreEstado"];

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

        public void Agregar (Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("INSERT INTO [Especialidad].[Turno] ([IdPaciente], [IdEspecialista], [IdEspecialidad], [FechaHoraTurno], [MotivoConsulta], [Diagnostico], [IdEstadoTurno]) VALUES (@IdPaciente, @IdEspecialista, @IdEspecialidad, @FechaHoraTurno, @MotivoConsulta, @Diagnostico, @IdEstadoTurno)");
                datos.SetearParametro("@IdPaciente", turno.Paciente.IdPaciente);
                datos.SetearParametro("@IdEspecialista", turno.Usuario.IdUsuario);
                datos.SetearParametro("@IdEspecialidad", turno.Especialidad.Id);
                datos.SetearParametro("@FechaHoraTurno", turno.FechaHora);
                datos.SetearParametro("@MotivoConsulta", turno.MotivoConsulta);
                datos.SetearParametro("@Diagnostico", turno.Diagnostico);
                datos.SetearParametro("@IdEstadoTurno", 1);
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

        public void CancelarTurno(Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Especialidad].[sp_CanTurno] @IdTurno");
                datos.SetearParametro("@IdTurno", turno.IdTurno);
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

        public List<Turno> ChequearTurnos(int idEspecialista, int idEspecialidad)
        {
            JornadaNegocio jornadaNegocio = new JornadaNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            Usuario especialista = usuarioNegocio.ListarXIdUsuario(idEspecialista);
            List<Turno> turnosDisponibles = new List<Turno>();
            List<Turno> turnosAsignadosEspecialidadMedico = new List<Turno>();
            List<string> stringsCompararTurnosAsigndos = new List<string>();
            List<Turno> turnosAsignados = Listar();
            List<Jornada> jornadasEspecialista = new List<Jornada>();
            jornadasEspecialista = jornadaNegocio.ListarXEspecialista(especialista);
            
            foreach(Turno turno in turnosAsignados)
            {
                if(turno.Estado.Id == 1 && turno.Usuario.IdUsuario ==  idEspecialista && turno.Especialidad.Id == idEspecialidad)
                {
                    turnosAsignadosEspecialidadMedico.Add(turno);
                }
            }
            //POSIBLEMENTE ESTO PUEDE INCLUIRSE EN EL MISMO FOR EACH DE ARRIBA.
            foreach(Turno turno in turnosAsignadosEspecialidadMedico)
            {
                string idEspecialistaStr = turno.Usuario.IdUsuario.ToString();
                string idEspecilidadStr = turno.Especialidad.Id.ToString();
                string fechaTurnoStr = turno.FechaHora.ToString();

                string codigoTurno = (idEspecialistaStr + "-" + idEspecilidadStr +  "-" + fechaTurnoStr).ToUpper();
                stringsCompararTurnosAsigndos.Add(codigoTurno);
            }

            for(int i = 1; i < 31; i++)
            {
                DateTime fechaAComprobar = DateTime.Now.AddDays(i);
                string nombreDia = (fechaAComprobar.ToString("dddd")).ToUpper();
                
                foreach(Jornada jornadaAEvaluar in jornadasEspecialista)
                {
                    if(nombreDia == (jornadaAEvaluar.DiaSemana).ToUpper())
                    {
                        int cantidadHsJornada = (int)(jornadaAEvaluar.HoraFin - jornadaAEvaluar.HoraInicio).TotalHours;
                        DateTime fechaHoraTurnoPotencial = new DateTime(
                            fechaAComprobar.Year,
                            fechaAComprobar.Month,
                            fechaAComprobar.Day,
                            jornadaAEvaluar.HoraInicio.Hours,
                            jornadaAEvaluar.HoraInicio.Minutes,
                            jornadaAEvaluar.HoraInicio.Seconds
                        );

                        for(int j = 0; j < cantidadHsJornada; j++)
                        {
                            string idEspecialistaStr = jornadaAEvaluar.Especialista.IdUsuario.ToString();
                            string idEspecilidadStr = jornadaAEvaluar.Especialidad.Id.ToString();
                            string fechaTurnoStr = fechaHoraTurnoPotencial.ToString();
                            string codigoTurnoComparar = (idEspecialistaStr + "-" + idEspecilidadStr + "-" + fechaTurnoStr).ToUpper();
                            if (!stringsCompararTurnosAsigndos.Contains(codigoTurnoComparar))
                            {
                                Turno aux = new Turno();
                                aux.Jornada = jornadaAEvaluar;
                                aux.FechaHora = fechaHoraTurnoPotencial;
                                aux.Usuario = jornadaAEvaluar.Especialista;
                                aux.Especialidad = jornadaAEvaluar.Especialidad;
                                turnosDisponibles.Add(aux);
                            }
                            fechaHoraTurnoPotencial = fechaHoraTurnoPotencial.AddHours(1);
                        }
                    }
                }
               
            }
            return turnosDisponibles;
        }
    }
}

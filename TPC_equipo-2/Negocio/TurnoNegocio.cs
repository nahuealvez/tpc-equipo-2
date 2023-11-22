using System;
using System.Collections.Generic;
using System.Linq;
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
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT A.IdTurno, A.FechaHoraTurno, A.MotivoConsulta, A.Diagnostico, B.Dni AS DniPaciente, B.Apellido AS ApellidoPaciente, B.Nombre AS NombrePaciente , C.Apellido AS ApellidoEspecialista, C.Nombre AS NombreEspecialista, D.Especialidad, E.NombreEstado FROM Especialidad.Turno AS A LEFT JOIN Usuario.Paciente AS B ON A.IdPaciente = B.IdPaciente LEFT JOIN Usuario.Usuario AS C ON A.IdEspecialista = C.IdUsuario LEFT JOIN Especialidad.Especialidad AS D ON A.IdEspecialidad = D.IdEspecialidad LEFT JOIN Especialidad.EstadoTurno AS E ON A.IdEstadoTurno = E.IdEstadoTurno");
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.Paciente = new Paciente();
                    aux.Paciente.Dni = (Int32)datos.Lector["DniPaciente"];
                    aux.Paciente.Apellido = (string)datos.Lector["ApellidoPaciente"];
                    aux.Paciente.Nombre = (string)datos.Lector["NombrePaciente"];
                    aux.Usuario = new Usuario();
                    aux.Usuario.Apellido = (string)datos.Lector["ApellidoEspecialista"];
                    aux.Usuario.Nombre = (string)datos.Lector["NombreEspecialista"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaHoraTurno"];
                    aux.MotivoConsulta = (string)datos.Lector["MotivoConsulta"];
                    aux.Diagnostico = (string)datos.Lector["Diagnostico"];
                    aux.Estado = new EstadoTurno();
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
    }
}

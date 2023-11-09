using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class PacienteNegocio
    {
        public List<Paciente> Listar()
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_GetPacientes]");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.IdPaciente = (int)datos.Lector["IdPaciente"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Dni = (int)datos.Lector["Dni"];
                    aux.Sexo = (string)datos.Lector["Sexo"];
                    aux.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.Telefono = (string)datos.Lector["Telefono"];
                    aux.Cobertura = (string)datos.Lector["Cobertura"];
                    aux.NroCredencial = (int)datos.Lector["NroCredencial"];
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


        public void Agregar(Paciente nuevoPaciente)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_InsPaciente] @Apellido, @Nombre, @Dni, @Sexo, @FechaNacimiento, @Mail, @Telefono, @Cobertura, @NroCredencial");
                datos.SetearParametro("@Apellido", nuevoPaciente.Apellido);
                datos.SetearParametro("@Nombre", nuevoPaciente.Nombre);
                datos.SetearParametro("@Dni", nuevoPaciente.Dni);
                datos.SetearParametro("@Sexo", nuevoPaciente.Sexo);
                datos.SetearParametro("@FechaNacimiento", nuevoPaciente.FechaNacimiento);
                datos.SetearParametro("@Mail", nuevoPaciente.Mail);
                datos.SetearParametro("@Telefono", nuevoPaciente.Telefono);
                datos.SetearParametro("@Cobertura", nuevoPaciente.Cobertura);
                datos.SetearParametro("@NroCredencial", nuevoPaciente.NroCredencial);
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


        public void Modificar(Paciente paciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_UpdPaciente] @IdUsuario, @NuevoApellido, @NuevoNombre, @NuevoDni, @NuevoSexo, @NuevaFechaNacimiento, @NuevoMail, @NuevoTelefono, @NuevoCobertura, @NuevoNroCredencial");
                datos.SetearParametro("@IdUsuario", paciente.IdPaciente);
                datos.SetearParametro("@NuevoApellido", paciente.Apellido);
                datos.SetearParametro("@NuevoNombre", paciente.Nombre);
                datos.SetearParametro("@NuevoDni", paciente.Dni);
                datos.SetearParametro("@NuevoSexo", paciente.Sexo);
                datos.SetearParametro("@NuevaFechaNacimiento", paciente.FechaNacimiento);
                datos.SetearParametro("@NuevoMail", paciente.Mail);
                datos.SetearParametro("@NuevoTelefono", paciente.Telefono);
                datos.SetearParametro("@NuevoCobertura", paciente.Cobertura);
                datos.SetearParametro("@NuevoNroCredencial", paciente.NroCredencial);
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


        public void Eliminar(Paciente paciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_DelPaciente] @IdPaciente;");
                datos.SetearParametro("@IdPaciente", paciente.IdPaciente);
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

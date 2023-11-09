﻿using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_GetUsuarios]");

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Dni = (int)datos.Lector["Dni"];
                    aux.Sexo = (string)datos.Lector["Sexo"];
                    aux.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.Telefono = (string)datos.Lector["Telefono"];
                    aux.UsuarioReg = (string)datos.Lector["Usuario"];
                    aux.Password = (string)datos.Lector["Password"];
                    aux.Perfil = (int)datos.Lector["IdPerfil"];
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

        public void Agregar(Usuario nuevoUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_InsUsuario] @Apellido @Nombre @Dni @Sexo @FechaNacimiento @Mail @Telefono @NombreUsuario @Password @IdPerfil");
                datos.SetearParametro("@Apellido", nuevoUsuario.Apellido);
                datos.SetearParametro("@Nombre", nuevoUsuario.Nombre);
                datos.SetearParametro("@Dni", nuevoUsuario.Dni);
                datos.SetearParametro("@Sexo", nuevoUsuario.Sexo);
                datos.SetearParametro("@FechaNacimiento", nuevoUsuario.FechaNacimiento);
                datos.SetearParametro("@Mail", nuevoUsuario.Mail);
                datos.SetearParametro("@Telefono", nuevoUsuario.Telefono);
                datos.SetearParametro("@NombreUsuario", nuevoUsuario.UsuarioReg);
                datos.SetearParametro("@Password", nuevoUsuario.Password);
                datos.SetearParametro("@IdPerfil", nuevoUsuario.Perfil);
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

        public void Modificar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_UpdUsuario] @IdUsuario @NuevoApellido @NuevoNombre @NuevoDni @NuevoSexo @NuevaFechaNacimiento @NuevoMail @NuevoTelefono @NuevoNombreUsuario @NuevoPassword @NuevoIdPerfil @NuevoEstado");
                datos.SetearParametro("@IdUsuario", usuario.IdUsuario);
                datos.SetearParametro("@NuevoApellido", usuario.Apellido);
                datos.SetearParametro("@NuevoNombre", usuario.Nombre);
                datos.SetearParametro("@NuevoDni", usuario.Dni);
                datos.SetearParametro("@NuevoSexo", usuario.Sexo);
                datos.SetearParametro("@NuevaFechaNacimiento", usuario.FechaNacimiento);
                datos.SetearParametro("@NuevoMail", usuario.Mail);
                datos.SetearParametro("@NuevoTelefono", usuario.Telefono);
                datos.SetearParametro("@NuevoNombreUsuario", usuario.UsuarioReg);
                datos.SetearParametro("@NuevoPassword", usuario.Password);
                datos.SetearParametro("@NuevoIdPerfil", usuario.Perfil);
                datos.SetearParametro("@NuevoEstado", usuario.Estado);
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

        public void ModificarEstado(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_UpdEstadoUsuario] @IdUsuario, @NuevoEstado");
                datos.SetearParametro("@IdUsuario", usuario.IdUsuario);
                datos.SetearParametro("@NuevoEstado", usuario.Estado);
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

        public void Eliminar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("EXEC [Usuario].[sp_DelUsuario] @IdUsuario;");
                datos.SetearParametro("@IdUsuario", usuario.IdUsuario);
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

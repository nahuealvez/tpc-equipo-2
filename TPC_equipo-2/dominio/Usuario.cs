using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Apellido { get; set; }
        public string Nombre { get; set; }
        public int Dni { get; set; }
        public string Sexo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Mail { get; set; }
        public string Telefono { get; set; }
        public string UsuarioReg { get; set; }
        public string Password { get; set; }
        public int Perfil { get; set; }
        public bool Estado { get; set; }
    }
}

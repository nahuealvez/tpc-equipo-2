using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario : Persona
    {
        public int IdUsuario { get; set; }

        public string UsuarioReg { get; set; }
        public string Password { get; set; }
        public int Perfil { get; set; }
        public List<Especialidad> Especialidades { get; set; }
        public bool Estado { get; set; }
    }
}

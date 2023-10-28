using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Especialista : Persona
    {
        public string Usuario { get; set; }
        public string Password { get; set; }
        public List<Especialidad> Especialidades { get; set; }

    }
}

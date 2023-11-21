using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Jornada
    {
        public int IdJornada { get; set; }
        public Especialidad Especialidad { get; set; }
        public Usuario Especialista { get; set; }
        public String DiaSemana { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
    }
}

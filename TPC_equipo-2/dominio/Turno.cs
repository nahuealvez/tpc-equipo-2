using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Turno
    {
        public int Id { get; set; }
        public DateTime FechaHora { get; set; }
        public string MotivoConsulta { get; set; }
        public string Diagnostico { get; set; }
        public Usuario Especialista { get; set; }
        public EstadoTurno Estado { get; set; }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Turno
    {
        public int IdTurno { get; set; }
        public Paciente Paciente { get; set; }
        public Usuario Usuario { get; set; }
        public Especialidad Especialidad { get; set; }
        public DateTime FechaHora { get; set; }
        public string MotivoConsulta { get; set; }
        public string Diagnostico { get; set; }
        public EstadoTurno Estado { get; set; }
    }
}

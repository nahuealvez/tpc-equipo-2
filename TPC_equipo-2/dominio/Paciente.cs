﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Paciente : Persona
    {
        public int IdPaciente {  get; set; }
        public string Cobertura { get; set; }
        public int NroCredencial { get; set; }
    }
}

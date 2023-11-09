using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    internal class Paciente
    {
        public int idPaciente {  get; set; }
        public string Apellido { get; set; }
        public string Nombre { get; set; }
        public int Dni {  get; set; }
        public string Sexo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Mail {  get; set; }
        public string Telefono { get; set; }
        public string Cobertura { get; set; }
        public string NroCredencial { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Negocio
{
    public class Utilitarios
    {
        public static string EliminarAcentosConRegEx(string inputString)
        {
            Regex reemplazarAcentos_a = new Regex("[á|à|ä|â]", RegexOptions.Compiled);
            Regex reemplazarAcentos_b = new Regex("[é|è|ë|ê]", RegexOptions.Compiled);
            Regex reemplazarAcentos_c = new Regex("[í|ì|ï|î]", RegexOptions.Compiled);
            Regex reemplazarAcentos_d = new Regex("[ó|ò|ö|ô]", RegexOptions.Compiled);
            Regex reemplazarAcentos_e = new Regex("[ú|ù|ü|û]", RegexOptions.Compiled);

            inputString = reemplazarAcentos_a.Replace(inputString, "a");
            inputString = reemplazarAcentos_b.Replace(inputString, "e");
            inputString = reemplazarAcentos_c.Replace(inputString, "i");
            inputString = reemplazarAcentos_d.Replace(inputString, "o");
            inputString = reemplazarAcentos_e.Replace(inputString, "u");

            return inputString;
        }
    }
}

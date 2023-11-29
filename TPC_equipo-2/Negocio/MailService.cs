using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MailService
    {
        private MailMessage email;
        private SmtpClient server;
        
        public MailService()
        {
            server = new SmtpClient();
            server.Host = "smtp-relay.sendinblue.com";
            server.Port = 587;
            server.Credentials = new NetworkCredential("portsaludmed@gmail.com", "5yq0X7rghmKxJBdf");
            server.EnableSsl = true;
        }

        public void armarCorreo(string destinatario, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@portsaludmed.com.ar");
            email.To.Add(destinatario);
            email.Subject = asunto;
            email.Body = cuerpo;
            email.IsBodyHtml = true;
        }

        public void enviarCorreo()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

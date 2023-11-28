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
            server.Host = "sandbox.smtp.mailtrap.io";
            server.Port = 2525;
            server.Credentials = new NetworkCredential("61d97d360a7c65", "d6610f6914b893");
            server.EnableSsl = true;
        }

        public void armarCorreo(string destinatario, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@portsaludmed.com.ar");
            email.To.Add(destinatario);
            email.Subject = asunto;
            email.Body = cuerpo;
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

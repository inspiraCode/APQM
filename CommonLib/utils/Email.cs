using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
//using System.Web.Security;
//using System.Web.UI;
//using System.Web.UI.HtmlControls;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;

/// <summary>
/// Descripción breve de Email
/// </summary>
public class Email
{
    public SmtpClient server = new SmtpClient("smtp.gmail.com", 587);
    public string EmailAddress = "aaron.corrales.zt@gmail.com";
    public string Password = "chingon123";

    public Email()
    {
        /*
         * Autenticacion en el Servidor
         * Utilizaremos nuestra cuenta de correo
         *
         * Direccion de Correo (Gmail o Hotmail)
         * y Contrasena correspondiente
         */
        //aaron.corrales.zt@gmail.com

        server.Credentials = new System.Net.NetworkCredential(EmailAddress, Password);
        server.EnableSsl = true;
    }

    public void SendMail(MailMessage Message)
    {
        server.Send(Message);
    }

}


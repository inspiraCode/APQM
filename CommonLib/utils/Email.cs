﻿using System;
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
    public SmtpClient server = new SmtpClient("smtp.emailsrvr.com", 587);
    public string EmailAddress = "rfqm@capsonic.com";
    public string Password = "request1324";

    public Email()
    {
        /*
         * Autenticacion en el Servidor
         * Utilizaremos nuestra cuenta de correo
         *
         * Direccion de Correo (Gmail o Hotmail)
         * y Contrasena correspondiente
         */
        //capsonic.apps@gmail.com

        server.Credentials = new System.Net.NetworkCredential(EmailAddress, Password);
        server.EnableSsl = false;
    }

    public void SendMail(MailMessage Message)
    {
        server.Send(Message);
    }

}


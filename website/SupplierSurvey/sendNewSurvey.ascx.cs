﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class SupplierSurvey_sendNewSurvey : System.Web.UI.UserControl
{
    
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;
    private Supplier supplier;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (((SessionObject)Session["supplierObject"])!= null)
        {
            supplier = (Supplier)(((SessionObject)Session["supplierObject"]).Content);
        }
    }
    public void load()
    {
        if (supplier == null)
        {
            if (Session["supplierObject"] != null)
            {
                supplier = (Supplier)(((SessionObject)Session["supplierObject"]).Content);
                fillFields(supplier);
            }
        }
    }
    private void fillFields(Supplier supplier){
        lblSupplier.Text = supplier.SupplierName;
        txtEmail.Text = supplier.ContactEmail;
    }
    protected void btnSendSurvey_Click(object sender, EventArgs e)
    {
        if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
        {
            SupplierCRUD supplierCRUD = new SupplierCRUD();
            supplier.ContactEmail = txtEmail.Text.Trim();
            if (!supplierCRUD.update(supplier))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }
        
        SupplierSurveyCRUD surveyCRUD = new SupplierSurveyCRUD();
        SupplierSurvey survey = new SupplierSurvey();
        survey.SupplierMasterKey = supplier.Id;
        survey.SentToVendor = DateTime.Now;
        supplier.SupplierSurvey = survey;

        string idGenerated = surveyCRUD.createAndReturnIdGenerated(survey);

        if (idGenerated != "")
        {
            TokenCRUD token_CRUD = new TokenCRUD();
            Token token = new Token();
            token.Subject = "SURVEY";
            token.SubjectKey = long.Parse(idGenerated);
            token.TokenNumber =  MD5HashGenerator.GenerateKey(DateTime.Now);
            if (token_CRUD.create(token))
            {
                Email NewMail = new Email();
                MailMessage Message = new MailMessage();

                Message.From = new MailAddress("aaron.corrales.zt@gmail.com", "aaron.corrales.zt@gmail.com");
                Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                Message.Subject = "test from APQM WEB";
                Message.IsBodyHtml = true;
                Message.BodyEncoding = System.Text.Encoding.UTF8;
                //Message.Body = "Aqui va el link con el token= " + " <a href:\"http://localhost:29724/APQM/Vendor/RFQ.aspx?token=" + token.TokenNumber + "\">Link</a>";
                //Message.Body = "Aqui va el link con el token= " + " <a href:\"http://www.google.com\">Google</a>";


                AlternateView htmlView = AlternateView.CreateAlternateViewFromString("Aqui va el link con el token= http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/Survey.aspx?token=" + token.TokenNumber);
                Message.AlternateViews.Add(htmlView);
                
                string path = HttpRuntime.AppDomainAppPath.ToString() + @"\Docs\NDA.pdf";

                Attachment x = new Attachment(path);

                Message.Attachments.Add(x);

                NewMail.SendMail(Message);
                
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "");
            return;
        }
        supplier = null;
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        supplier = null;
        Cancel_Click(this, e);
    }
}
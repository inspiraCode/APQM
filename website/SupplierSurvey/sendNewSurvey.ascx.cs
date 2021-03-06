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
        if (Session["supplierObject"] != null)
        {
            supplier = (Supplier)(((SessionObject)Session["supplierObject"]).Content);
            fillFields(supplier);
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
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
                return;
            }
        }
        
        SupplierSurveyCRUD surveyCRUD = new SupplierSurveyCRUD();
        SupplierSurvey survey = new SupplierSurvey();
        survey.SupplierMasterKey = supplier.Id;
        survey.SentToVendor = DateTime.Now;
        supplier.SupplierSurvey = survey;



        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("Survey Save");


        string idGenerated = surveyCRUD.createAndReturnIdGenerated(survey, ref DM);

        if (!surveyCRUD.ErrorOccur)
        {
            TokenCRUD token_CRUD = new TokenCRUD();
            Token token = new Token();
            token.Subject = "SURVEY";
            token.SubjectKey = long.Parse(idGenerated);
            token.TokenNumber =  MD5HashGenerator.GenerateKey(DateTime.Now);
            if (token_CRUD.create(token, ref DM))
            {
                Email NewMail = new Email();
                MailMessage Message = new MailMessage();

                Message.From = new MailAddress("capsonic.apps@gmail.com", "capsonic.apps@gmail.com");
                Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                Message.Subject = "Survey";
                Message.IsBodyHtml = true;
                Message.BodyEncoding = System.Text.Encoding.UTF8;
                //Message.Body = "Aqui va el link con el token= " + " <a href:\"http://localhost:29724/APQM/Vendor/RFQ.aspx?token=" + token.TokenNumber + "\">Link</a>";
                //Message.Body = "Aqui va el link con el token= " + " <a href:\"http://www.google.com\">Google</a>";

                string strEmailContent = "Dear Potential Supplier," + Environment.NewLine
                                                                + "Please click the following link to fill out our supplier survey form.  Please fill out as completely as possible.  Once we have received your completed survey, a representative will contact you to discuss the next steps."
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/Survey.aspx?token=" + token.TokenNumber
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "Thank you for your time. We look forward to hearing from you."
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "Sincerely," + Environment.NewLine + Environment.NewLine + "The Capsonic Advanced Purchasing Team";


                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(strEmailContent);
                Message.AlternateViews.Add(htmlView);

                try
                {
                    NewMail.SendMail(Message);
                }
                catch
                {
                    DM.RollBack();
                    Navigator.goToPage("~/Error.aspx", "ERROR:Could not send email to: " + supplier.ContactEmail.ToString());
                    return;
                }
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + token_CRUD.ErrorMessage);
                return;
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + surveyCRUD.ErrorMessage);
            return;
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
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
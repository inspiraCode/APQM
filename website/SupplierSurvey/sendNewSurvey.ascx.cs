using System;
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



        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("Survey Save");


        string idGenerated = surveyCRUD.createAndReturnIdGenerated(survey, ref DM);

        if (idGenerated != "")
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
                Message.Subject = "Test from APQM WEB - sending Survey";
                Message.IsBodyHtml = true;
                Message.BodyEncoding = System.Text.Encoding.UTF8;
                //Message.Body = "Aqui va el link con el token= " + " <a href:\"http://localhost:29724/APQM/Vendor/RFQ.aspx?token=" + token.TokenNumber + "\">Link</a>";
                //Message.Body = "Aqui va el link con el token= " + " <a href:\"http://www.google.com\">Google</a>";


                AlternateView htmlView = AlternateView.CreateAlternateViewFromString("Please click the following link to open the Survey form:" + Environment.NewLine + "http://" + 
                    Request.Url.Authority + Request.ApplicationPath + "/Vendor/Survey.aspx?token=" + token.TokenNumber);
                Message.AlternateViews.Add(htmlView);

                try
                {
                    NewMail.SendMail(Message);

                }
                catch
                {
                    DM.RollBack();
                    Navigator.goToPage("~/Error.aspx", "");
                    return;
                }
                
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "");
            return;
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
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
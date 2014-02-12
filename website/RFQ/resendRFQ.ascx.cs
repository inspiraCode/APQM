using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class ResendRFQ : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    RFQ rfqToResend;
    Supplier supplier;
    RfqCRUD rfqCRUD = new RfqCRUD();
    SupplierCRUD supplier_CRUD = new SupplierCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        rfqToResend = (RFQ)Session["rfqToResendObject"];
        supplier = (Supplier)Session["resendRFQ_supplier"];
    }
    public bool setEntity(long RFQHeaderKey){
        
        rfqToResend = rfqCRUD.readById(RFQHeaderKey);
        if (rfqToResend == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve RFQ. Please try again.");
            return false;
        }

        Supplier supplier = supplier_CRUD.readById(rfqToResend.SupplierId);
        if (supplier == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve Supplier. Please try again.");
            return false;
        }

        lblSupplier.Text = supplier.SupplierName;
        txtEmail.Text = supplier.ContactEmail;
        Session["rfqToResendObject"] = rfqToResend;
        Session["resendRFQ_supplier"] = supplier;
        return true;
    }
    public void resend(object sender, EventArgs e)
    {

        if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
        {
            supplier.ContactEmail = txtEmail.Text.Trim();
            if (!supplier_CRUD.update(supplier))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplier_CRUD.ErrorMessage);
                return;
            }
        }

        TokenCRUD token_CRUD = new TokenCRUD();
        Token token = token_CRUD.readByRFQ(rfqToResend);

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQ Re-send");

        rfqToResend.SentToVendor = DateTime.Now;
        if (!rfqCRUD.update(rfqToResend, ref DM))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
            return;
        }

        if (token == null)
        {
            token = new Token();
            token.Subject = "RFQ";
            token.SubjectKey = rfqToResend.Id;
            token.TokenNumber = MD5HashGenerator.GenerateKey(DateTime.Now);
            token_CRUD.create(token, ref DM);
            if (token_CRUD.ErrorOccur)
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + token_CRUD.ErrorMessage);
                return;
            }
        }


        Email NewMail = new Email();
        MailMessage Message = new MailMessage();

        Message.From = new MailAddress("capsonic.apps@gmail.com", "capsonic.apps@gmail.com");
        Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
        Message.Subject = "Request For Quote";
        Message.IsBodyHtml = true;
        Message.BodyEncoding = System.Text.Encoding.UTF8;

        string strEmailContent = "Dear Supplier," + Environment.NewLine
                                    + "We are seeking quotations to match the part/process description shown on our RFQ form.  Please click the following link to be directed to the RFQ page.  Drawings and special instructions will be included there also."
                                    + " Please fill out the RFQ form as completely as possible. You may attach documents to the RFQ, but the RFQ form must be completed."
                                    + Environment.NewLine + Environment.NewLine
                                    + "There is an instruction module available to walk you through the form should you need assistance.  If you have any questions regarding the RFQ, please contact the Capsonic Advanced Purchasing Buyer shown on the RFQ form."
                                    + Environment.NewLine + Environment.NewLine
                                    + "http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber
                                    + Environment.NewLine + Environment.NewLine
                                    + "Please mark this e-mail as coming from a trusted source to avoid issues with future correspondence reaching your inbox."
                                    + Environment.NewLine + Environment.NewLine
                                    + "In order to open the hyperlink, it is necessary to have javascript enabled in your browser and Internet Explorer 11 or any other browser like Chrome or Firefox."
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

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return;
        }

        Ok_Click(null,null);
        return;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_Click(this, e);
    }
}
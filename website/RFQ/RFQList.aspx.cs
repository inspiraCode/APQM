using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Net.Mail;

public partial class RFQ_RFQList : System.Web.UI.Page
{
    private long bomDetailKeyFilter = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["RFQList_bomHeaderKeyFilter"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["RFQList_bomHeaderKeyFilter"] = bomDetailKeyFilter;
            uscRFQList.filterByBOMDetailKey(bomDetailKeyFilter);
        }
        else
        {
            uscRFQList.filterByBOMDetailKey(-1);
        }
    }
    private bool retrieveEntity()
    {
        string sBOMDetailKey = Request["bomComponent"];
        if (sBOMDetailKey != "" && sBOMDetailKey != null)
        {
            bomDetailKeyFilter = long.Parse(Request["bomComponent"]);
        }
        else
        {
            bomDetailKeyFilter = -1;
        }
        return true;
    }

    [WebMethod]
    public static string deleteByID(string sRFQHeaderKey)
    {
        long rfqHeaderKey = long.Parse(sRFQHeaderKey);
        RfqCRUD rfq_CRUD = new RfqCRUD();
        if (!rfq_CRUD.setActiveByID(rfqHeaderKey, 0))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfq_CRUD.ErrorMessage);
            return "";
        }
        return "Correct";
    }

    [WebMethod]
    public static string awardByRFQID(string sRFQHeaderKey)
    {
        long rfqHeaderKey = long.Parse(sRFQHeaderKey);

        RfqCRUD rfqCRUD = new RfqCRUD();
        RFQ rfq = rfqCRUD.readById(rfqHeaderKey);

        bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
        BOMDetail bomDetail = bomDetailCRUD.readById(rfq.BomDetailId);
        List<RFQ> rfqList = rfqCRUD.readByBOMDetailKey(rfq.BomDetailId);

        if (rfq != null)
        {
            ConnectionManager CM = new ConnectionManager();
            Data_Base_MNG.SQL DM = CM.getDataManager();

            /*Begin Transaction*/
            DM.Open_Connection("RFQ Save");

            
            if (rfqList.Count > 0)
            {
                foreach (RFQ rfqLocal in rfqList)
                {
                    if (rfqLocal.Id != rfq.Id)
                    {
                        rfqLocal.Status = "DISMISSED";
                        if (rfqLocal.NoQuote == true)
                            rfqLocal.Status = "NO QUOTE";
                        if (!rfqCRUD.update(rfqLocal, ref DM))
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                            return "";
                        }
                    }
                }
            }

            rfq.Status = "AWARDED";
            if (!rfqCRUD.update(rfq, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                return "";
            }
            else
            {

                if (bomDetail != null)
                {
                    bomDetail.Status = "Processed";
                    if (!bomDetailCRUD.update(bomDetail, ref DM))
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailCRUD.ErrorMessage);
                        return "";
                    }
                }
                else
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:There was an error when retrieving a BOM Detail for rfq.BomDetailId = " + rfq.BomDetailId);
                    return "";
                }
            }

            DM.CommitTransaction();
            DM.Close_Open_Connection();

            if (DM.ErrorOccur)
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
                return "";
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve RFQ with rfqHeaderKey = " + rfqHeaderKey);
            return "";
        }
        return "Correct";
    }
    
    [WebMethod]
    public static string resendRFQbyID(string sRFQHeaderKey, string sSupplierKey, string sEmail)
    {
        long rfqHeaderKey = long.Parse(sRFQHeaderKey);
        long supplierKey = long.Parse(sSupplierKey);

        RfqCRUD rfq_CRUD = new RfqCRUD();
        RFQ rfqToResend = rfq_CRUD.readById(rfqHeaderKey);

        if (rfqToResend == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve RFQ with ID = " + rfqHeaderKey);
            return "";
        }

        SupplierCRUD supplier_CRUD = new SupplierCRUD();
        Supplier supplier = supplier_CRUD.readById(supplierKey);
        if (supplier == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve supplier with ID = " + supplierKey);
            return "";
        }
        
        if (sEmail.Trim() != "")
        {
            supplier.ContactEmail = sEmail.Trim();
            if (!supplier_CRUD.update(supplier))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplier_CRUD.ErrorMessage);
                return "";
            }
        }

        TokenCRUD token_CRUD = new TokenCRUD();
        Token token = token_CRUD.readByRFQ(rfqToResend);

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQ Re-send");

        rfqToResend.SentToVendor = DateTime.Now;
        if (!rfq_CRUD.update(rfqToResend, ref DM))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfq_CRUD.ErrorMessage);
            return "";
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
                return "";
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
                                    + "http://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber
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
            return "";
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return "";
        }

        return "Correct";
    }
}
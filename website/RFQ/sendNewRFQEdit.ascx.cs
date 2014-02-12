using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.IO;

public partial class SendNewRFQEdit : System.Web.UI.UserControl
{
    public event EventHandler Send_Click;
    public event EventHandler Save_Click;
    public event EventHandler Cancel_Click;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();
    private Supplier supplier = null;
    private RFQ rfq;

    protected void Page_Load(object sender, EventArgs e)
    {
        btnNewMarketSector.OnClientClick = "return promptUser('New Market Sector', 'm~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";

        supplier = (Supplier)Session["SendNewRFQEdit_Supplier"];
        if (supplier == null)
        {
            supplier = new Supplier();
            Session["SendNewRFQEdit_Supplier"] = supplier;
        }
        if (txtDueDate.Text.Trim() == "")
        {
            txtDueDate.Text = DateTime.Now.ToShortDateString();
        }

        rfq = (RFQ)Session["SendNewRFQEdit_RFQ"];
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_Click(this, e);
    }
    public void setEntity(long rfqHeaderKey)
    {
        RfqCRUD rfq_CRUD = new RfqCRUD();
        RFQ rfqLocal = rfq_CRUD.readById(rfqHeaderKey);
        if (rfqLocal != null)
        {
            rfq = rfqLocal;
            Session["SendNewRFQEdit_RFQ"] = rfq;
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:RFQ null.");
            return;
        }
        Supplier supplier = supplierCRUD.readById(rfq.SupplierId);
        if (supplier == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Supplier null.");
            return;
        }
        lblSupplier.Text = supplier.SupplierName;
        txtEmail.Text = supplier.ContactEmail;
        Session["SendNewRFQEdit_Supplier"] = supplier;

        ViewState["bomDetailID"] = rfq.BomDetailId;
        lblBomDetailID.Text = rfq.BomDetailId.ToString();
        frmBOMLine.DataBind();

        ViewState["sifHeaderID"] = rfq.SifHeaderKey;
        sifDetailCRUD sifDetail_CRUD = new sifDetailCRUD();
        List<SIFDetail> sifDetail = sifDetail_CRUD.readByParentID(rfq.SifHeaderKey);
        uscSifDetail.setEntity(sifDetail);


        EAUHidden.Value = rfq.EstimatedAnnualVolume;
        txtEAU.Text = rfq.EstimatedAnnualVolume;

        txtDueDate.Text = rfq.DueDate.ToShortDateString();
        cboMarketSector.SelectedValue = rfq.MarketSectorID.ToString();
        txtDrawingLevel.Text = rfq.DrawingLevel;
        if (rfq.TargetPrice > -1)
        {
            chkTargetPrice.Checked = true;
            txtTargetPrice.Text = rfq.TargetPrice.ToString();
        }
        txtCommentToVendor.Text = rfq.CommentsToVendor;
        updateListAttachmentsSent(rfq);

    }
    public void updateListAttachmentsSent(RFQ rfq)
    {
        hiddenAttachmentsSent.Value = rfq.SentAttachmentsFolder;
        Session["RFQATTACHMENTSFOLDER"] = rfq.SentAttachmentsFolder;
        
        string baseSentAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];
        
        if (rfq.SentAttachmentsFolder.Trim() != "" && Directory.Exists(baseSentAttachmentsPath + rfq.SentAttachmentsFolder.Trim()))
        {
            List<RFQAttachments> rfqSentAttachmentsList = new List<RFQAttachments>();
            DirectoryInfo directory = new DirectoryInfo(baseSentAttachmentsPath + rfq.SentAttachmentsFolder);
            foreach (FileInfo file in directory.GetFiles())
            {
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = rfq.SentAttachmentsFolder;
                rfqSentAttachmentsList.Add(rfqAttachment);
            }
            uscRfqAttachmentsSent.setEntity(rfqSentAttachmentsList);
            uscRfqAttachmentsSent.load();
        }
    }

    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSourceRFQCountPerBOMDetail.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSourceMarketSector.ConnectionString = connection.getConnection().ConnectionString;
    }

    protected void on_prompt(object sender, EventArgs e)
    {
        string value = ((HiddenField)sender).Value;

        if (value.Trim() != "")
        {
            string[] prompt = value.Split('~');
            if (prompt[1] != "null" && prompt[1].Trim() != "")
            {
                switch (prompt[0])
                {
                    case "m":
                        MarketSector marketSector = new MarketSector();
                        marketSector.Name = prompt[1];

                        MarketSectorCRUD marketSector_CRUD = new MarketSectorCRUD();


                        string idGeneratedMarket = marketSector_CRUD.createAndReturnIdGenerated(marketSector);
                        if (!marketSector_CRUD.ErrorOccur)
                        {
                            //SqlDataSource1.DataBind();
                            cboMarketSector.DataBind();
                            cboMarketSector.SelectedValue = idGeneratedMarket;

                            cboMarketSector.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("Market Sector could not be saved. " + marketSector_CRUD.ErrorMessage);
                        }
                        break;
                }
            }
            ((HiddenField)sender).Value = "";
        }
    }

    protected void btnSendRFQ_Click(object sender, EventArgs e)
    {
        RfqCRUD rfq_CRUD = new RfqCRUD();
        bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
        bomDetailVolumeCRUD bomDetailVolume_CRUD = new bomDetailVolumeCRUD();

        string folderAttachments = (string)Session["RFQATTACHMENTSFOLDER"];

        string strAuthUser = HttpContext.Current.User.Identity.Name;

        string strEAUTextBox = ((TextBox)frmBOMLine.FindControl("txtEAU")).Text;
        string strEAULabel = ((HiddenField)frmBOMLine.FindControl("EAUHidden")).Value;

        BOMDetail bomDetailObject = bomDetail_CRUD.readById((long)ViewState["bomDetailID"]);
        if (bomDetailObject == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + "Could not find Component to RFQ.");
            return;
        }

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("Updating BOM Line EAU");

        if (!strEAULabel.Equals(strEAUTextBox))
        {
            if (!bomDetailVolume_CRUD.updateByVolumeAndBOMDetailKey((long)ViewState["bomDetailID"], long.Parse(strEAULabel), long.Parse(strEAUTextBox), ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailVolume_CRUD.ErrorMessage);
                return;
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return;
        }

        List<BOMDetailVolume> bomDetailVolumeList = bomDetailVolume_CRUD.readByParentID((long)ViewState["bomDetailID"]);

        string strVolume = "";
        foreach (BOMDetailVolume objVolume in bomDetailVolumeList)
        {
            strVolume += objVolume.Volume + ", ";
        }
        strVolume = strVolume.Substring(0, strVolume.Length - 2);

        bomDetailObject.EAU = strVolume;

        if (bomDetailObject.Status != "Processed")
        {
            bomDetailObject.Status = "In Progress";
        }

        CM = new ConnectionManager();
        DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("Send RFQ Previously Saved");

        if (!bomDetail_CRUD.update(bomDetailObject, ref DM))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetail_CRUD.ErrorMessage);
            return;
        }

        if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
        {
            supplier.ContactEmail = txtEmail.Text.Trim();
            if (!supplierCRUD.update(supplier, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
                return;
            }
        }

        //rfq.SupplierId = supplier.Id;
        rfq.SentToVendor = DateTime.Now;
        rfq.Status = "PENDING";
        //rfq.BomDetailId = (long)ViewState["bomDetailID"];
        //rfq.RfqNumberKey = long.Parse(idGeneratedRFQNumber);
        rfq.DueDate = DateTime.Parse(txtDueDate.Text);
        rfq.MarketSectorID = long.Parse(cboMarketSector.SelectedValue);
        rfq.DrawingLevel = txtDrawingLevel.Text;
        rfq.EstimatedAnnualVolume = strEAUTextBox;
        if (chkTargetPrice.Checked)
        {
            rfq.TargetPrice = float.Parse(txtTargetPrice.Text);
        }
        rfq.CommentsToVendor = txtCommentToVendor.Text.Trim();

        if (folderAttachments != null)
        {
            rfq.SentAttachmentsFolder = folderAttachments;
        }

        rfq.CreatedBy = strAuthUser;

        TokenCRUD token_CRUD = new TokenCRUD();
        Token token = token_CRUD.readByRFQ(rfq);

        if (!rfq_CRUD.update(rfq, ref DM))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfq_CRUD.ErrorMessage);
            return;
        }

        if (token == null)
        {
            token = new Token();
            token.Subject = "RFQ";
            token.SubjectKey = rfq.Id;
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

        Session.Remove("RFQATTACHMENTS");
        Session.Remove("RFQATTACHMENTSFOLDER");

        supplier = null;
        Send_Click(this, e);
    }
    protected void btnEditRFQ_Click(object sender, EventArgs e)
    {
        RfqCRUD rfq_CRUD = new RfqCRUD();
        bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
        bomDetailVolumeCRUD bomDetailVolume_CRUD = new bomDetailVolumeCRUD();

        string folderAttachments = (string)Session["RFQATTACHMENTSFOLDER"];

        string strAuthUser = HttpContext.Current.User.Identity.Name;

        string strEAUTextBox = txtEAU.Text;
        string strEAULabel = EAUHidden.Value;

        BOMDetail bomDetailObject = bomDetail_CRUD.readById((long)ViewState["bomDetailID"]);
        if (bomDetailObject == null)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + "Could not find Component to RFQ.");
            return;
        }

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("Updating BOM Line EAU");

        if (!strEAULabel.Equals(strEAUTextBox))
        {
            if (!bomDetailVolume_CRUD.updateByVolumeAndBOMDetailKey((long)ViewState["bomDetailID"], long.Parse(strEAULabel), long.Parse(strEAUTextBox), ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailVolume_CRUD.ErrorMessage);
                return;
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return;
        }

        List<BOMDetailVolume> bomDetailVolumeList = bomDetailVolume_CRUD.readByParentID((long)ViewState["bomDetailID"]);

        string strVolume = "";
        foreach (BOMDetailVolume objVolume in bomDetailVolumeList)
        {
            strVolume += objVolume.Volume + ", ";
        }
        strVolume = strVolume.Substring(0, strVolume.Length - 2);

        bomDetailObject.EAU = strVolume;

        if (bomDetailObject.Status != "Processed")
        {
            bomDetailObject.Status = "In Progress";
        }

        CM = new ConnectionManager();
        DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("Send RFQ Previously Saved");

        if (!bomDetail_CRUD.update(bomDetailObject, ref DM))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetail_CRUD.ErrorMessage);
            return;
        }

        if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
        {
            supplier.ContactEmail = txtEmail.Text.Trim();
            if (!supplierCRUD.update(supplier, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
                return;
            }
        }

        //rfq.SupplierId = supplier.Id;
        //rfq.SentToVendor = DateTime.Now;
        rfq.Status = "PENDING";
        //rfq.BomDetailId = (long)ViewState["bomDetailID"];
        //rfq.RfqNumberKey = long.Parse(idGeneratedRFQNumber);
        rfq.DueDate = DateTime.Parse(txtDueDate.Text);
        rfq.MarketSectorID = long.Parse(cboMarketSector.SelectedValue);
        rfq.DrawingLevel = txtDrawingLevel.Text;
        rfq.EstimatedAnnualVolume = strEAUTextBox;
        if (chkTargetPrice.Checked)
        {
            rfq.TargetPrice = float.Parse(txtTargetPrice.Text);
        }
        rfq.CommentsToVendor = txtCommentToVendor.Text.Trim();

        if (folderAttachments != null)
        {
            rfq.SentAttachmentsFolder = folderAttachments;
        }

        rfq.CreatedBy = strAuthUser;


        if (!rfq_CRUD.update(rfq, ref DM))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfq_CRUD.ErrorMessage);
            return;
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return;
        }

        Session.Remove("RFQATTACHMENTS");
        Session.Remove("RFQATTACHMENTSFOLDER");

        supplier = null;
        Save_Click(this, e);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

public partial class rfqForm : System.Web.UI.UserControl
{
    public event EventHandler AfterSave;
    public event EventHandler AfterFinalize;

    RfqCRUD rfqCRUD = new RfqCRUD();
    public RFQ rfq = null;

    private RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    private RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rfqObject"] != null)
        {
            rfq = (RFQ)((SessionObject)Session["rfqObject"]).Content;
            if (rfq.TargetPrice < 0)
            {
                lblTargetPrice.Visible = false;
                lblTargetPriceLabel.Visible = false;
            }
        }
    }
    public void load()
    {
        if (Session["rfqObject"] != null)
        {
            rfq = (RFQ)((SessionObject)Session["rfqObject"]).Content;
            //rfq.RfqDetail = rfqDetailCRUD.readByParentID(rfq.Id);
            if (((SessionObject)Session["rfqObject"]).Status == "forUpdate")
            {
                lblMode.Text = "Update";
                fillWithEntity(rfq);
            }
            else if (((SessionObject)Session["rfqObject"]).Status == "forNew")
            {
                lblMode.Text = "New";                
            }            
            ((SessionObject)Session["rfqObject"]).Status = "Retrieved";
        }
        else
        {
            SessionObject so = new SessionObject();
            so.Content = new RFQ();
            so.Status = "forNew";
            Session["rfqObject"] = so;
            lblMode.Text = "New";
            uscRFQDetailList.setEntity(null);
            uscRFQDetailList.load();
        }
    }
    public void fillWithEntity(RFQ rfq)
    {
        txtCommentsToVendor.Text = rfq.CommentsToVendor;
        optNoQuote.Checked = rfq.NoQuote;
        optQuote.Checked = !rfq.NoQuote;
        txtReasonNoQuote.Text = rfq.ReasonNoQuote;
        lblBOMDetailID.Text = rfq.BomDetailId.ToString();
        lblID.Text = rfq.Id.ToString();
        lblDueDate.Text = rfq.DueDate.ToShortDateString();
        lblRFQNumber.Text = rfq.RfqGenerated;
        lblMarketSector.Text = rfq.MarketSectorName;
        ViewState["MarketSectoryID"] = rfq.MarketSectorID;
        lblPartNumber.Text = rfq.PartNumber;
        lblPartName.Text = rfq.PartMaterial;
        lblDrawingLevel.Text = rfq.DrawingLevel;
        lblTargetPrice.Text = rfq.TargetPrice.ToString();
        lblEAV.Text = rfq.EstimatedAnnualVolume;

        lblSupplierName.Text = rfq.SupplierName;
        hiddenSupplierID.Value = rfq.SupplierId.ToString();
        lblManufacturingLocation.Text = rfq.ManufacturingLocation;
        lblShipFromLocation.Text = rfq.ShipLocation;
        txtPreparedBy.Text = rfq.PreparedBy;

        txtSGAProfit.Text = rfq.SgAProfit.ToString();
        txtPackingCostUnit.Text = rfq.PackingPerUnit.ToString();
        txtAssemblyCostUnit.Text = rfq.AssemblyCostPerUnit.ToString();
        
        txtProductionLeadTime.Text = rfq.ProductionLeadTime;
        txtProductionToolingLeadTime.Text = rfq.ProductionToolingLeadTime;
        txtPrototypeToolingLeadTime.Text = rfq.PrototypeToolingLeadTime;
        txtPrototypePieceLeadTime.Text = rfq.PrototypePieceLeadTime;
        txtLeadTimePPAP.Text = rfq.LeadTimePPAP;

        txtToolingDetail.Text = rfq.ToolingDetail;
        txtProductionTooling.Text = rfq.ProductionTooling.ToString();
        txtPrototypeTooling.Text = rfq.PrototypeTooling.ToString();
        txtPrototypePiece.Text = rfq.PrototypePiece.ToString();

        txtWeight.Text = rfq.Weight.ToString();
        //cboUMWeight.SelectedValue = rfq.UmWeight; Not to be used anymore: always lb
        txtMOQ.Text = rfq.Moq;
        txtMake.Text = rfq.Make;
        txtComments.Text = rfq.CommentsToBuyer;

        chkIAgree.Checked = rfq.IAgree;

        hiddenCreatedBy.Value = rfq.CreatedBy;

        uscRFQDetailList.reset();
        uscRFQDetailList.setEntity(rfq.RfqDetail);
        uscRFQDetailList.load();

        uscRfqACR.reset();
        uscRfqACR.setEntity(rfq.RfqAcr);
        uscRfqACR.load();

        hiddenSentAttachmentsFolder.Value = rfq.SentAttachmentsFolder;

        string baseSentAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];
        
        if (rfq.SentAttachmentsFolder.Trim() != "" && Directory.Exists(baseSentAttachmentsPath + rfq.SentAttachmentsFolder.Trim()))
        {
            List<RFQAttachments> rfqSentAttachmentsList = new List<RFQAttachments>();
            DirectoryInfo directory = new DirectoryInfo(baseSentAttachmentsPath + rfq.SentAttachmentsFolder);
            foreach(FileInfo file in directory.GetFiles()){
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = rfq.SentAttachmentsFolder;
                rfqSentAttachmentsList.Add(rfqAttachment);
            }
            uscRfqAttachmentsSent.setEntity(rfqSentAttachmentsList);
            uscRfqAttachmentsSent.load();
        }

        updateListAttachmentsVendor(rfq);
        
    }
    public void updateListAttachmentsVendor(RFQ rfq)
    {
        hiddenInboxAttachments.Value = rfq.InboxAttachmentsFolder;
        Session["RFQATTACHMENTSFOLDERINBOX"] = rfq.InboxAttachmentsFolder;

        string baseInboxAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        if (rfq.InboxAttachmentsFolder.Trim() != "" && Directory.Exists(baseInboxAttachmentsPath + rfq.InboxAttachmentsFolder.Trim()))
        {
            List<RFQAttachments> rfqInboxAttachmentsList = new List<RFQAttachments>();
            DirectoryInfo directory = new DirectoryInfo(baseInboxAttachmentsPath + rfq.InboxAttachmentsFolder);
            foreach (FileInfo file in directory.GetFiles())
            {
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = rfq.InboxAttachmentsFolder;
                rfqInboxAttachmentsList.Add(rfqAttachment);
            }
            uscRfqInboxAttachments.setEntity(rfqInboxAttachmentsList);
            uscRfqInboxAttachments.load();
        }
    }
    public bool finalize() {
        uscNotifier.hide();
        if (saveRFQ())
        {
            RFQ rfq = rfqCRUD.readById(this.rfq.Id);
            rfq.Status = "COMPLETED";
            if (rfq.NoQuote)
            {
                rfq.Status = "NO QUOTE";
            }
            rfq.DateFilledOut = DateTime.Now;
            if (!rfqCRUD.update(rfq))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                return false;
            }
        }
        else
        {
            
            return false;
        }
        uscNotifier.showSuccess("Information saved successfully.");
        return true;
    }
    public bool saveRFQ()
    {
        RFQ rfq = new RFQ();
        //lblPartNumber.Text
        if (lblDueDate.Text.Trim() != "") rfq.DueDate = DateTime.Parse(lblDueDate.Text);

        rfq.CommentsToVendor = txtCommentsToVendor.Text;
        rfq.NoQuote = !optQuote.Checked;
        if(rfq.NoQuote)
            rfq.ReasonNoQuote = txtReasonNoQuote.Text;
        else
            rfq.ReasonNoQuote = "";

        rfq.BomDetailId = long.Parse(lblBOMDetailID.Text);
        rfq.SupplierId = long.Parse(hiddenSupplierID.Value);
        //rfq.RfqNumber = lblRFQNumber.Text;
        rfq.DrawingLevel = lblDrawingLevel.Text;
        rfq.MarketSectorID = (long)ViewState["MarketSectoryID"];
        rfq.TargetPrice = float.Parse(lblTargetPrice.Text);
        rfq.EstimatedAnnualVolume = lblEAV.Text;

        rfq.PreparedBy = txtPreparedBy.Text;
        if (txtSGAProfit.Text.Trim() != "") rfq.SgAProfit = float.Parse(txtSGAProfit.Text);
        if (txtPackingCostUnit.Text.Trim() != "") rfq.PackingPerUnit = float.Parse(txtPackingCostUnit.Text);
        if (txtAssemblyCostUnit.Text.Trim() != "") rfq.AssemblyCostPerUnit = float.Parse(txtAssemblyCostUnit.Text);

        rfq.ProductionLeadTime = txtProductionLeadTime.Text;
        rfq.ProductionToolingLeadTime = txtProductionToolingLeadTime.Text;
        rfq.PrototypeToolingLeadTime = txtPrototypeToolingLeadTime.Text;
        rfq.PrototypePieceLeadTime = txtPrototypePieceLeadTime.Text;
        rfq.LeadTimePPAP = txtLeadTimePPAP.Text;
        
        rfq.ToolingDetail = txtToolingDetail.Text;
        if (txtProductionTooling.Text.Trim() != "") rfq.ProductionTooling = float.Parse(txtProductionTooling.Text);
        if (txtPrototypeTooling.Text.Trim() != "") rfq.PrototypeTooling = float.Parse(txtPrototypeTooling.Text);
        if (txtPrototypePiece.Text.Trim() != "") rfq.PrototypePiece = float.Parse(txtPrototypePiece.Text);

        if (txtWeight.Text.Trim() != "")
        {
            rfq.Weight = float.Parse(txtWeight.Text);
            //rfq.UmWeight = cboUMWeight.SelectedValue; Not to be used anymore: always lb
        }

        rfq.Moq = txtMOQ.Text;
        rfq.Make = txtMake.Text;
        rfq.CommentsToBuyer = txtComments.Text;

        rfq.IAgree = chkIAgree.Checked;

        rfq.CreatedBy = hiddenCreatedBy.Value;

        rfq.SentAttachmentsFolder = hiddenSentAttachmentsFolder.Value;

        string folderVendorAttachments = (string)Session["RFQATTACHMENTSFOLDERINBOX"];
        if (folderVendorAttachments != null)
        {
            rfq.InboxAttachmentsFolder = folderVendorAttachments;
        }
        else
        {
            rfq.InboxAttachmentsFolder = hiddenInboxAttachments.Value;
        }
        Session.Remove("RFQATTACHMENTSINBOX");
        Session.Remove("RFQATTACHMENTSFOLDERINBOX");

        List<RFQDetail> rfqDetailList = uscRFQDetailList.getEntity();
        List<RFQACR> rfqACRList = uscRfqACR.getEntity();

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQ Save");

        if (lblMode.Text == "New")
        {
            rfq.Status = "PENDING";
            rfq.SentToVendor = DateTime.Now;
            string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq, ref DM);
            if (!rfqCRUD.ErrorOccur)
            {
                this.rfq.Id = long.Parse(idGenerated);
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                return false;
            }
        }
        else if (lblMode.Text == "Update")
        {
            rfq.Status = "IN PROGRESS";
            rfq.Id = this.rfq.Id;
            if (!rfqCRUD.update(rfq, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                return false;
            }
            if (!rfqDetailCRUD.deleteByParentID(rfq.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqDetailCRUD.ErrorMessage);
                return false;
            }
            if (!rfqACRCRUD.deleteByParentID(rfq.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqACRCRUD.ErrorMessage);
                return false;
            }
        }
        foreach (RFQDetail detail in rfqDetailList)
        {
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqDetailCRUD.create(detail, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqDetailCRUD.ErrorMessage);
                return false;
            }
        }
        foreach (RFQACR detail in rfqACRList)
        {
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqACRCRUD.create(detail, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqACRCRUD.ErrorMessage);
                return false;
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();
        
        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return false;
        }

        uscNotifier.showSuccess("Information saved successfully.");
        return true;
    }
    public void setEnabled(bool enabled)
    {
        if (enabled)
        {
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (saveRFQ()) AfterSave(null, null);
    }
    protected void btnFinalize_Click(object sender, EventArgs e)
    {
        if (finalize())
        {
            AfterFinalize(null,null);
        }
    }
    protected void on_after_delete_vendorAttachment(object sender, EventArgs e)
    {
        updateListAttachmentsVendor(rfq);
    }
    public void showCancelMessage(){
        uscNotifier.showLog("Values have been re-established.");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Xml.Linq;

public partial class rfqForm : System.Web.UI.UserControl
{
    public event EventHandler AfterSave;
    public event EventHandler AfterFinalize;

    RfqCRUD rfqCRUD = new RfqCRUD();
    public RFQ rfq = null;

    private RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    private RFQEAVCRUD rfqEAV_CRUD = new RFQEAVCRUD();
    private RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();   

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["rfqObject"] != null)
        //{
        //    rfq = (RFQ)((SessionObject)Session["rfqObject"]).Content;
        //    if (rfq.TargetPrice < 0)
        //    {
        //        lblTargetPrice.Visible = false;
        //        lblTargetPriceLabel.Visible = false;
        //    }
        //}
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
            //uscRFQDetailList.setEntity(null);
            //uscRFQDetailList.load();
        }
    }
    public void fillWithEntity(RFQ rfq)
    {
        lblBOMDetailID.Text = rfq.BomDetailId.ToString();
        lblID.Text = rfq.Id.ToString();
        ViewState["MarketSectoryID"] = rfq.MarketSectorID;
        
        hiddenSupplierID.Value = rfq.SupplierId.ToString();
        
        
        /*Fields repleaced by the next ones. Required by Seth*/
        //txtProductionLeadTime.Text = rfq.ProductionLeadTime;
        //txtProductionToolingLeadTime.Text = rfq.ProductionToolingLeadTime;
        //txtPrototypeToolingLeadTime.Text = rfq.PrototypeToolingLeadTime;
        //txtPrototypePieceLeadTime.Text = rfq.PrototypePieceLeadTime;
        //txtLeadTimePPAP.Text = rfq.LeadTimePPAP;
        ///*********************************************************/
        
        //txtLeadTimeFirstProductionOrder.Text = rfq.LeadTimeFirstProductionOrder;
        //txtLeadTimePPAP_FAIR.Text = rfq.LeadTimePPAPFAIR;
        //txtLeadTimeNormalProductionOrders.Text = rfq.LeadTimeNormalProductionOrders;

        /*********************************************************/
        

        //cboUMWeight.SelectedValue = rfq.UmWeight; Not to be used anymore: always lb
        
        
        hiddenCreatedBy.Value = rfq.CreatedBy;

        
        ViewState["SentToVendor"] = rfq.SentToVendor;

        
        //uscRFQDetailList.reset();
        //uscRFQDetailList.setEntity(rfq.RfqDetail);
        //uscRFQDetailList.load();

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
        if (Request.ContentType.Contains("json") &&
            Request.QueryString["Save"] != null)
        {
            XElement xmlElement = XElement.Load(Request.InputStream.ToString());
            
            return true;
        }



        RFQ rfq = new RFQ();
        //lblPartNumber.Text
        
       //if(rfq.NoQuote)
       //     rfq.ReasonNoQuote = txtReasonNoQuote.Text;
       // else
       //     rfq.ReasonNoQuote = "";

        rfq.BomDetailId = long.Parse(lblBOMDetailID.Text);
        rfq.SupplierId = long.Parse(hiddenSupplierID.Value);
        //rfq.RfqNumber = lblRFQNumber.Text;
        rfq.MarketSectorID = (long)ViewState["MarketSectoryID"];
        
        
       
        
        
        
        rfq.CreatedBy = hiddenCreatedBy.Value;

        
        rfq.SentAttachmentsFolder = hiddenSentAttachmentsFolder.Value;

        rfq.SentToVendor = (DateTime)ViewState["SentToVendor"];

        string folderVendorAttachments = (string)Session["RFQATTACHMENTSFOLDERINBOX"];
        if (folderVendorAttachments != null)
        {
            rfq.InboxAttachmentsFolder = folderVendorAttachments;
        }
        else
        {
            rfq.InboxAttachmentsFolder = hiddenInboxAttachments.Value;
        }
        Session.Remove("RFQATTACHMENTSFOLDERINBOX");

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

            foreach (RFQEAV rfqEAVLocal in rfq.RfqEAV)
            {
                if(rfqEAV_CRUD.update(rfqEAVLocal, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqDetailCRUD.ErrorMessage);
                    return false;
                }
                //if (txtSGAProfit.Text.Trim() != "") rfq.SgAProfit = float.Parse(txtSGAProfit.Text);
                //if (txtPackingCostUnit.Text.Trim() != "") rfq.PackingPerUnit = float.Parse(txtPackingCostUnit.Text);
                //if (txtAssemblyCostUnit.Text.Trim() != "") rfq.AssemblyCostPerUnit = float.Parse(txtAssemblyCostUnit.Text);

                if (!rfqDetailCRUD.deleteByParentID(rfqEAVLocal.Id, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqDetailCRUD.ErrorMessage);
                    return false;
                }
            }
            if (!rfqACRCRUD.deleteByParentID(rfq.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqACRCRUD.ErrorMessage);
                return false;
            }
        }
        foreach (RFQEAV rfqEAVLocal in rfq.RfqEAV)
        {
            foreach (RFQDetail detail in rfqEAVLocal.RfqDetail)
            {
                detail.RfqEAVKey = rfqEAVLocal.Id;
                if (!rfqDetailCRUD.create(detail, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqDetailCRUD.ErrorMessage);
                    return false;
                }
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
    protected void on_after_delete_buyerAttachment(object sender, EventArgs e)
    {
        //Vendor is not able to delete Buyer attachment. Links are hidden.
    }
    public void showCancelMessage(){
        uscNotifier.showLog("Values have been re-established.");
    }

    public void on_item_databound(Object Sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    BOMDetail bomDetail = (BOMDetail)e.Item.DataItem;
        //    if (bomDetail.PartNumber.Trim() == "")
        //    {
        //        ((Label)e.Item.FindControl("lblPartNumber")).Text = "(Empty)";
        //    }
        //    if (bomDetail.User != "")
        //    {
        //        ((LinkButton)e.Item.FindControl("linkAssignedToLine")).Text = bomDetail.User;
        //    }
        //    if (bomDetail.internalAction == "UPDATE")
        //    {

        //        ((Label)e.Item.FindControl("lblStatus")).Text = "For Edit";
        //    }

        //    ((ImageButton)e.Item.FindControl("deleteByID")).CommandArgument = bomDetail.Sequence.ToString();
        //    ((ImageButton)e.Item.FindControl("updateByID")).CommandArgument = bomDetail.Sequence.ToString();
        //    ((LinkButton)e.Item.FindControl("linkAssignedToLine")).CommandArgument = bomDetail.Sequence.ToString();
            
        //}
    }
}
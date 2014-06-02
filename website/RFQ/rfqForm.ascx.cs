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
    }
    public void load()
    {
    }
    public void fillWithEntity(RFQ rfq)
    {
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
        
    }
    

    public bool finalize() {
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
        return true;
    }
    public bool saveRFQ()
    {
        RFQ rfq = new RFQ();
        //lblPartNumber.Text
        
       //if(rfq.NoQuote)
       //     rfq.ReasonNoQuote = txtReasonNoQuote.Text;
       // else
       //     rfq.ReasonNoQuote = "";

        //rfq.BomDetailId = long.Parse(lblBOMDetailID.Text);
        //rfq.SupplierId = long.Parse(hiddenSupplierID.Value);
        //rfq.RfqNumber = lblRFQNumber.Text;
        //rfq.MarketSectorID = (long)ViewState["MarketSectoryID"];
        
        //rfq.CreatedBy = hiddenCreatedBy.Value;

        
        //rfq.SentAttachmentsFolder = hiddenSentAttachmentsFolder.Value;

        //rfq.SentToVendor = (DateTime)ViewState["SentToVendor"];

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

        //List<RFQACR> rfqACRList = uscRfqACR.getEntity();

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQ Save");

        
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
        //foreach (RFQACR detail in rfqACRList)
        //{
        //    detail.RfqHeaderKey = this.rfq.Id;
        //    if (!rfqACRCRUD.create(detail, ref DM))
        //    {
        //        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqACRCRUD.ErrorMessage);
        //        return false;
        //    }
        //}

        DM.CommitTransaction();
        DM.Close_Open_Connection();
        
        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return false;
        }

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
       // updateListAttachmentsVendor(rfq);
    }
    protected void on_after_delete_buyerAttachment(object sender, EventArgs e)
    {
        //Vendor is not able to delete Buyer attachment. Links are hidden.
    }
    public void showCancelMessage(){
        //uscNotifier.showLog("Values have been re-established.");
    }
}
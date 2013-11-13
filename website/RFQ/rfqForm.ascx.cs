using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqForm : System.Web.UI.UserControl
{
    public event EventHandler AfterSave;
    public event EventHandler AfterCancel;

    RfqCRUD rfqCRUD = new RfqCRUD();
    public RFQ rfq = null;

    private RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    private RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();   

    protected void Page_Load(object sender, EventArgs e)
    {
        uscRfqEAV.setEnabled(false);
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
        optNoQuote.Checked = rfq.NoQuote;
        optQuote.Checked = !rfq.NoQuote;
        txtReasonNoQuote.Text = rfq.ReasonNoQuote;
        lblBOMDetailID.Text = rfq.BomDetailId.ToString();
        lblID.Text = rfq.Id.ToString();
        lblDueDate.Text = rfq.DueDate.ToShortDateString();
        lblRFQNumber.Text = rfq.RfqGenerated;
        lblPartNumber.Text = rfq.PartNumber;
        // lblPartName.Text
        lblDrawingLevel.Text = rfq.DrawingLevel;
        lblMarketSector.Text = rfq.AutoAero;
        lblTargetPrice.Text = rfq.TargetPrice.ToString();
        
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
        txtToolingDetail.Text = rfq.ToolingDetail;
        txtProductionTooling.Text = rfq.ProductionTooling.ToString();
        txtPrototypeTooling.Text = rfq.PrototypeTooling.ToString();
        txtPrototypePiece.Text = rfq.PrototypePiece.ToString();

        txtWeight.Text = rfq.Weight.ToString();
        txtMOQ.Text = rfq.Moq;
        txtMake.Text = rfq.Make;
        txtComments.Text = rfq.Comments;

        chkIAgree.Checked = rfq.IAgree;

        uscRFQDetailList.reset();
        uscRFQDetailList.setEntity(rfq.RfqDetail);
        uscRFQDetailList.load();

        uscRfqACR.reset();
        uscRfqACR.setEntity(rfq.RfqAcr);
        uscRfqACR.load();

        uscRfqEAV.reset();
        uscRfqEAV.setEntity(rfq.RfqEAV);
        uscRfqEAV.load();

    }
    public void save()
    {
        if (saveRFQ()) AfterSave(null, null);
    }
    public bool finalize() {
        if (saveRFQ())
        {
            RFQ rfq = rfqCRUD.readById(this.rfq.Id);
            rfq.Status = "COMPLETED";
            rfq.DateFilledOut = DateTime.Now;
            if (!rfqCRUD.update(rfq))
            {
                Navigator.goToPage("~/Error.aspx", "");
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
        if (lblDueDate.Text.Trim() != "") rfq.DueDate = DateTime.Parse(lblDueDate.Text);

        rfq.NoQuote = !optQuote.Checked;
        if(rfq.NoQuote)
            rfq.ReasonNoQuote = txtReasonNoQuote.Text;
        else
            rfq.ReasonNoQuote = "";

        rfq.BomDetailId = long.Parse(lblBOMDetailID.Text);
        rfq.SupplierId = long.Parse(hiddenSupplierID.Value);
        //rfq.RfqNumber = lblRFQNumber.Text;
        rfq.DrawingLevel = lblDrawingLevel.Text;
        rfq.AutoAero = lblMarketSector.Text;
        rfq.TargetPrice = float.Parse(lblTargetPrice.Text);
        
        rfq.PreparedBy = txtPreparedBy.Text;
        if (txtSGAProfit.Text.Trim() != "") rfq.SgAProfit = float.Parse(txtSGAProfit.Text);
        if (txtPackingCostUnit.Text.Trim() != "") rfq.PackingPerUnit = float.Parse(txtPackingCostUnit.Text);
        if (txtAssemblyCostUnit.Text.Trim() != "") rfq.AssemblyCostPerUnit = float.Parse(txtAssemblyCostUnit.Text);

        rfq.ProductionLeadTime = txtProductionLeadTime.Text;
        rfq.ProductionToolingLeadTime = txtProductionToolingLeadTime.Text;
        rfq.PrototypeToolingLeadTime = txtPrototypeToolingLeadTime.Text;
        rfq.PrototypePieceLeadTime = txtPrototypePieceLeadTime.Text;
        
        rfq.ToolingDetail = txtToolingDetail.Text;
        if (txtProductionTooling.Text.Trim() != "") rfq.ProductionTooling = float.Parse(txtProductionTooling.Text);
        if (txtPrototypeTooling.Text.Trim() != "") rfq.PrototypeTooling = float.Parse(txtPrototypeTooling.Text);
        if (txtPrototypePiece.Text.Trim() != "") rfq.PrototypePiece = float.Parse(txtPrototypePiece.Text);

        if (txtWeight.Text.Trim() != "") rfq.Weight = float.Parse(txtWeight.Text);
        rfq.Moq = txtMOQ.Text;
        rfq.Make = txtMake.Text;
        rfq.Comments = txtComments.Text;

        rfq.IAgree = chkIAgree.Checked;

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
            if (idGenerated != "")
            {
                this.rfq.Id = long.Parse(idGenerated);
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }
        else if (lblMode.Text == "Update")
        {
            rfq.Status = "IN PROGRESS";
            rfq.Id = this.rfq.Id;
            if (!rfqCRUD.update(rfq, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
            if (!rfqDetailCRUD.deleteByParentID(rfq.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
            if (!rfqACRCRUD.deleteByParentID(rfq.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }
        foreach (RFQDetail detail in rfqDetailList)
        {
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqDetailCRUD.create(detail, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }
        foreach (RFQACR detail in rfqACRList)
        {
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqACRCRUD.create(detail, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();
        
        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "");
            return false;
        }
        return true;
    }
    public void cancel()
    {
        AfterCancel(null, null);        
    }
}
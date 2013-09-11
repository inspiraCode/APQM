using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqForm : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    RfqCRUD rfqCRUD = new RfqCRUD();
    public RFQ rfq = null;

    private RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
   

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void load()
    {
        if (rfq == null)
        {
            if (Session["RFQObject"] != null)
            {
                rfq = (RFQ)((SessionObject)Session["RFQObject"]).Content;
                rfq.RfqDetail = rfqDetailCRUD.readByParentID(rfq.Id);
                if (((SessionObject)Session["RFQObject"]).Status == "forUpdate")
                {
                    fillWithEntity(rfq);
                    lblMode.Text = "Update";
                    ((SessionObject)Session["RFQObject"]).Status = "Retrieved";
                }
                else if (((SessionObject)Session["RFQObject"]).Status == "forNew")
                {
                    fillWithEntity(rfq);
                    lblMode.Text = "New";
                    ((SessionObject)Session["RFQObject"]).Status = "Retrieved";
                }
            }
            else
            {
                lblMode.Text = "New";
                uscRFQDetailList.setEntity(null);                
            }
        }
        
    }
    public void fillWithEntity(RFQ rfq)
    {
        lblID.Text = rfq.Id.ToString();
        lblDueDate.Text = rfq.DueDate.ToString();
        lblRFQNumber.Text = rfq.RfqNumber.ToString();
        //lblPartNumber.Text = 
        //lblPartName.Text =
        lblDrawingLevel.Text = rfq.DrawingLevel;
        lblEstimatedAnnualVolume.Text = rfq.DrawingLevel;
        //lblSupplierName.Text = 
        //lblManufacturingLocation.Text =
        //lblShipFromLocation.Text =
        txtPreparedBy.Text = rfq.PreparedBy;
        txtSGAProfit.Text = rfq.SgAProfit.ToString();
        txtPackingCostUnit.Text = rfq.PackingPerUnit.ToString();
        txtAssemblyCostUnit.Text = rfq.AssemblyCostPerUnit.ToString();
        txtProductionLeadTime.Text = rfq.ProductionLeadTime;
        txtProductionToolingLeadTime.Text = rfq.ProductionToolingLeadTime;
        txtPrototypeToolingLeadTime.Text = rfq.ProductionToolingLeadTime;
        txtPrototypePieceLeadTime.Text = rfq.PrototypePieceLeadTime;
        txtToolingDetail.Text = rfq.ToolingDetail;
        txtProductionTooling.Text = rfq.ProductionTooling.ToString();
        txtPrototypeTooling.Text = rfq.PrototypeTooling.ToString();
        txtPrototypePiece.Text = rfq.PrototypePiece.ToString();
        uscRFQDetailList.reset();
        uscRFQDetailList.setEntity(rfq.RfqDetail);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        RFQ rfq= new RFQ();

        if (lblDueDate.Text.Trim() != "") rfq.DueDate = DateTime.Parse(lblDueDate.Text);
        rfq.RfqNumber = lblRFQNumber.Text;
        //lblPartNumber.Text
        //lblPartName.text =
        rfq.DrawingLevel = lblDrawingLevel.Text;
        rfq.EstimatedAnnualVolume = lblEstimatedAnnualVolume.Text;
        ////lblSupplierName.Text =
        ////lblManufacturingLocation.Text =
        ////lblShipFromLocation.Text =
        rfq.PreparedBy = txtPreparedBy.Text;
        if (txtSGAProfit.Text.Trim() != "")rfq.SgAProfit = float.Parse(txtSGAProfit.Text);
        if (txtPackingCostUnit.Text.Trim() != "")  rfq.PackingPerUnit = long.Parse(txtPackingCostUnit.Text);
        if (txtAssemblyCostUnit.Text.Trim() != "") rfq.AssemblyCostPerUnit = float.Parse(txtAssemblyCostUnit.Text);
        rfq.ProductionLeadTime =txtProductionLeadTime.Text;
        rfq.ProductionToolingLeadTime=txtProductionToolingLeadTime.Text;
        rfq.PrototypeToolingLeadTime=txtPrototypeToolingLeadTime.Text;
        rfq.PrototypePieceLeadTime=txtPrototypePieceLeadTime.Text;
        rfq.ToolingDetail=txtToolingDetail.Text;
        if (txtProductionTooling.Text.Trim() != "") rfq.ProductionTooling = float.Parse(txtProductionTooling.Text);
        if (txtPrototypeTooling.Text.Trim() != "")  rfq.PrototypeTooling = float.Parse(txtPrototypeTooling.Text);
        if (txtPrototypePiece.Text.Trim() != "") rfq.PrototypePiece = float.Parse(txtPrototypePiece.Text);

        List<RFQDetail> rfqDetailList = uscRFQDetailList.getEntity();

        if (lblMode.Text == "New") {
            string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq);
            if (idGenerated != "")
            {
                this.rfq.Id = long.Parse(idGenerated);
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }else if(lblMode.Text == "Update"){
            rfq.Id = this.rfq.Id;
            if (!rfqCRUD.update(rfq))
            {
                Navigator.goToPage("~/Error.aspx","");
                return;
            }
            if (!rfqDetailCRUD.deleteByParentID(rfq.Id))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }
        foreach (RFQDetail detail in rfqDetailList)
        {
            
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqDetailCRUD.create(detail))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("RFQObject");
        Cancel_Click(this, e);
    }
}
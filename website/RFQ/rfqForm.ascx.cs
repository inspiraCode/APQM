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

    rfqCRUD rfq_CRUD = new rfqCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["RFQObject"]!=null)
        {
            if (((SessionObject)Session["RFQObject"]).Status == "forUpdate")
            {
                fillWithEntity((RFQ)(((SessionObject)Session["RFQObject"]).Content));
                ((SessionObject)Session["RFQObject"]).Status = "Retrieved";
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

        lblMode.Text = "Update";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        RFQ rfq= new RFQ();

        //if (txtCustomerKey.Text != "")
        //{
        //    sif.CustomerKey = long.Parse(txtCustomerKey.Text);
        //}
        //else
        //{
        //    sif.CustomerKey = -1;
        //}

        if (lblDueDate.Text.Trim() != "")
        {
            rfq.DueDate = DateTime.Parse(lblDueDate.Text);
        }
        else
        {
            rfq.DueDate = DateTime.Today;
        }
        
        rfq.RfqNumber = lblRFQNumber.Text;
        //lblPartNumber.Text
        //lblPartName.text =
        rfq.DrawingLevel = lblDrawingLevel.Text;
        rfq.EstimatedAnnualVolume = lblEstimatedAnnualVolume.Text;
        ////lblSupplierName.Text = 
        ////lblManufacturingLocation.Text =
        ////lblShipFromLocation.Text =

        rfq.PreparedBy = txtPreparedBy.Text;

        if (txtSGAProfit.Text.Trim() != "")
        {
            rfq.SgAProfit = float.Parse(txtSGAProfit.Text);
        }
        else
        {
            rfq.SgAProfit = 0;
        }
        if (txtPackingCostUnit.Text.Trim() != "")
        {
            rfq.PackingPerUnit = long.Parse(txtPackingCostUnit.Text);
        }
        else
        {
            rfq.PackingPerUnit = 0;
        }
        if (txtAssemblyCostUnit.Text.Trim() != "")
        {
            rfq.AssemblyCostPerUnit = float.Parse(txtAssemblyCostUnit.Text);
        }
        else
        {
            rfq.AssemblyCostPerUnit = 0;
        }       

        rfq.ProductionLeadTime =txtProductionLeadTime.Text;
        rfq.ProductionToolingLeadTime=txtProductionToolingLeadTime.Text;
        rfq.PrototypeToolingLeadTime=txtPrototypeToolingLeadTime.Text;
        rfq.PrototypePieceLeadTime=txtPrototypePieceLeadTime.Text;
        rfq.ToolingDetail=txtToolingDetail.Text;
        
        if (txtProductionTooling.Text.Trim() != "")
        {
            rfq.ProductionTooling = float.Parse(txtProductionTooling.Text);
        }
        else
        {
            rfq.ProductionTooling = 0;
        }
        if (txtPrototypeTooling.Text.Trim() != "")
        {
            rfq.PrototypeTooling = float.Parse(txtPrototypeTooling.Text);
        }
        else
        {
            rfq.PrototypeTooling = 0;
        }
        if (txtPrototypePiece.Text.Trim() != "")
        {
            rfq.PrototypePiece = float.Parse(txtPrototypePiece.Text);
        }
        else
        {
            rfq.PrototypePiece = 0;
        }
        if (lblMode.Text == "New") {
            if (!rfq_CRUD.create(rfq))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
        }else if(lblMode.Text == "Update"){
            rfq.Id = long.Parse(lblID.Text);
            if (!rfq_CRUD.update(rfq))
            {
                Navigator.goToPage("~/Error.aspx","");
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
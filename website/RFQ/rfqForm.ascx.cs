﻿using System;
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
    private RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rfqObject"] != null)
        {
            rfq = (RFQ)((SessionObject)Session["rfqObject"]).Content;
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
        lblBOMDetailID.Text = rfq.BomDetailId.ToString();
        lblID.Text = rfq.Id.ToString();
        lblDueDate.Text = rfq.DueDate.ToShortDateString();
        lblRFQNumber.Text = rfq.RfqNumber.ToString();
        lblPartNumber.Text = rfq.PartNumber;
        // lblPartName.Text
        lblDrawingLevel.Text = rfq.DrawingLevel;
        lblEstimatedAnnualVolume.Text = rfq.DrawingLevel;
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
        txtPrototypeToolingLeadTime.Text = rfq.ProductionToolingLeadTime;
        txtPrototypePieceLeadTime.Text = rfq.PrototypePieceLeadTime;
        txtToolingDetail.Text = rfq.ToolingDetail;
        txtProductionTooling.Text = rfq.ProductionTooling.ToString();
        txtPrototypeTooling.Text = rfq.PrototypeTooling.ToString();
        txtPrototypePiece.Text = rfq.PrototypePiece.ToString();

        uscRFQDetailList.reset();
        uscRFQDetailList.setEntity(rfq.RfqDetail);
        uscRFQDetailList.load();

        uscRfqACR.reset();
        uscRfqACR.setEntity(rfq.RfqAcr);
        uscRfqACR.load();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        if (save()) Ok_Click(this, e);
           
    }
    public bool save(bool finalize) {
        if (finalize)
        {
            if (save()) {
                RFQ rfq = rfqCRUD.readById(this.rfq.Id);
                rfq.Status = "COMPLETED";                
                if (!rfqCRUD.update(rfq))
                {
                    Navigator.goToPage("~/Error.aspx", "");
                    return false;
                }
            }
        }
        return true;
    }
    public bool save()
    {
        RFQ rfq = new RFQ();

        rfq.RfqNumber = lblRFQNumber.Text;
        rfq.BomDetailId = long.Parse(lblBOMDetailID.Text);
        rfq.SupplierId = long.Parse(hiddenSupplierID.Value);
        rfq.RfqNumber = lblRFQNumber.Text;
        rfq.DrawingLevel = lblDrawingLevel.Text;
        rfq.EstimatedAnnualVolume = lblEstimatedAnnualVolume.Text;
        rfq.ProductionLeadTime = txtProductionLeadTime.Text;
        rfq.ProductionToolingLeadTime = txtProductionToolingLeadTime.Text;
        rfq.PrototypeToolingLeadTime = txtPrototypeToolingLeadTime.Text;
        rfq.PrototypePieceLeadTime = txtPrototypePieceLeadTime.Text;
        rfq.ToolingDetail = txtToolingDetail.Text;
        if (txtProductionTooling.Text.Trim() != "") rfq.ProductionTooling = float.Parse(txtProductionTooling.Text);
        if (txtPrototypeTooling.Text.Trim() != "") rfq.PrototypeTooling = float.Parse(txtPrototypeTooling.Text);
        if (txtPrototypePiece.Text.Trim() != "") rfq.PrototypePiece = float.Parse(txtPrototypePiece.Text);
        if (txtSGAProfit.Text.Trim() != "") rfq.SgAProfit = float.Parse(txtSGAProfit.Text);
        if (txtPackingCostUnit.Text.Trim() != "") rfq.PackingPerUnit = long.Parse(txtPackingCostUnit.Text);
        if (txtAssemblyCostUnit.Text.Trim() != "") rfq.AssemblyCostPerUnit = float.Parse(txtAssemblyCostUnit.Text);
        if (lblDueDate.Text.Trim() != "") rfq.DueDate = DateTime.Parse(lblDueDate.Text);

        //lblPartNumber.Text

        rfq.PreparedBy = txtPreparedBy.Text;

        List<RFQDetail> rfqDetailList = uscRFQDetailList.getEntity();
        List<RFQACR> rfqACRList = uscRfqACR.getEntity();

        if (lblMode.Text == "New")
        {
            rfq.Status = "PENDING";
            rfq.SentToVendor = DateTime.Now;
            string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq);
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
            if (!rfqCRUD.update(rfq))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
            if (!rfqDetailCRUD.deleteByParentID(rfq.Id))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
            if (!rfqACRCRUD.deleteByParentID(rfq.Id))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }
        foreach (RFQDetail detail in rfqDetailList)
        {
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqDetailCRUD.create(detail))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }
        foreach (RFQACR detail in rfqACRList)
        {
            detail.RfqHeaderKey = this.rfq.Id;
            if (!rfqACRCRUD.create(detail))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return false;
            }
        }
        return true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("rfqObject");       
        Cancel_Click(this, e);        
    }
}
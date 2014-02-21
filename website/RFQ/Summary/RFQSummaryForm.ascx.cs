using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQSummaryForm : System.Web.UI.UserControl
{
    RfqSummaryHeaderCRUD rfqSummaryHeader_CRUD = new RfqSummaryHeaderCRUD();
    RFQSummaryHeader rfqSummaryHeader;
    Supplier supplierRecommended;
    protected void Page_Load(object sender, EventArgs e)
    {
        rfqSummaryHeader = (RFQSummaryHeader)Session["RFQSummaryHeader"];
        supplierRecommended = (Supplier)Session["SupplierRecommended"];
    }
    public void setBomDetailID(long bomDetailID)
    {
        ViewState["bomDetailID"] = bomDetailID;
        txtBomDetailID.Text = bomDetailID.ToString();
        uscRfqSummaryList.setEntity(bomDetailID);
        frmRFQSummaryHeader.DataBind();

        List<RFQSummary> rfqSummaryList = uscRfqSummaryList.getEntity();
        RFQSummary rfqSelected = rfqSummaryList.Find(item => item.Status == "SELECTED" || item.Status == "AWARDED");
        if (rfqSelected != null)
        {
            SupplierCRUD supplier_CRUD = new SupplierCRUD();
            supplierRecommended = supplier_CRUD.readById(rfqSelected.SupplierKey);
            Session["SupplierRecommended"] = supplierRecommended;
        }
        else
        {
            Session["SupplierRecommended"] = null;
            supplierRecommended = null;
        }
        if (supplierRecommended != null)
            lblRecommendedSupplier.Text = supplierRecommended.SupplierName;
        else
        {
            lblRecommendedSupplier.Text = "";
        }

        if (Session["RFQSummaryHeader"] == null)
        {
            RFQSummaryHeader rfqSummaryHeaderLocal = rfqSummaryHeader_CRUD.readByBOMDetailID(bomDetailID);
            if (rfqSummaryHeaderLocal != null)
            {
                if (rfqSummaryHeaderLocal.PrebuildDate.Year == 1985 &&
                    rfqSummaryHeaderLocal.PrebuildDate.Month == 2 &&
                    rfqSummaryHeaderLocal.PrebuildDate.Day == 10)
                {
                    txtPPAPDate.Text = "";
                }
                else
                {
                    txtPPAPDate.Text = rfqSummaryHeaderLocal.PrebuildDate.ToShortDateString();
                }
                txtInitialReleaseQty.Text = rfqSummaryHeaderLocal.InitialReleaseQty.ToString();
                if (rfqSummaryHeaderLocal.InitialReleaseDate.Year == 1985 &&
                    rfqSummaryHeaderLocal.InitialReleaseDate.Month == 2 &&
                    rfqSummaryHeaderLocal.InitialReleaseDate.Day == 10)
                {
                    txtInitialReleaseDate.Text = "";
                }
                else
                {
                    txtInitialReleaseDate.Text = rfqSummaryHeaderLocal.InitialReleaseDate.ToShortDateString();
                }
                txtPreBuildQty.Text = rfqSummaryHeaderLocal.PrebuildQty.ToString();
                if (rfqSummaryHeaderLocal.PrebuildDate.Year == 1985 &&
                    rfqSummaryHeaderLocal.PrebuildDate.Month == 2 &&
                    rfqSummaryHeaderLocal.PrebuildDate.Day == 10)
                {
                    txtPreBuildDate.Text = "";
                }
                else
                {
                    txtPreBuildDate.Text = rfqSummaryHeaderLocal.PrebuildDate.ToShortDateString();
                }

                txtPurchasingAllRecommendations.Text = rfqSummaryHeaderLocal.PurchasingAllRecommendations;
                txtEnginneringAllConcurrences.Text = rfqSummaryHeaderLocal.EngineeringAllConcurrences;
                txtManfufacturingAllConcurrences.Text = rfqSummaryHeaderLocal.ManufacturingAllConcurrences;
                txtQualityAllConcurrences.Text = rfqSummaryHeaderLocal.QualityAllConcurrences;
                txtSalesAllConcurrences.Text = rfqSummaryHeaderLocal.SalesAllConcurrences;
                txtNotes.Text = rfqSummaryHeaderLocal.Notes;
            }
            else
            {
                cleanFields();
                rfqSummaryHeaderLocal = new RFQSummaryHeader();
            }
            Session["RFQSummaryHeader"] = rfqSummaryHeaderLocal;
        }
        divRFQSummaryHeader.Visible = true;
    }
    private void cleanFields()
    {
        txtPPAPDate.Text = "";
        txtInitialReleaseDate.Text = "";
        txtInitialReleaseQty.Text = "";
        txtPreBuildQty.Text = "";
        txtPreBuildDate.Text = "";
        txtPurchasingAllRecommendations.Text = "";
        txtEnginneringAllConcurrences.Text = "";
        txtManfufacturingAllConcurrences.Text = "";
        txtQualityAllConcurrences.Text = "";
        txtSalesAllConcurrences.Text = "";
        txtNotes.Text = "";
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (uscRfqSummaryList.save())
        {
            if (saveRFQSummaryHeader())
            {
                setBomDetailID(long.Parse(ViewState["bomDetailID"].ToString()));
            }
        }
    }
    private bool saveRFQSummaryHeader()
    {
        RFQSummaryHeader rfqSummaryHeaderLocal1 = rfqSummaryHeader_CRUD.readByBOMDetailID(long.Parse(ViewState["bomDetailID"].ToString()));
        RFQSummaryHeader rfqSummaryHeaderLocal = new RFQSummaryHeader();
        if (rfqSummaryHeaderLocal1 != null)
            rfqSummaryHeaderLocal.Id = rfqSummaryHeaderLocal1.Id;   

        rfqSummaryHeaderLocal.BomDetailKey = long.Parse(ViewState["bomDetailID"].ToString());

        try
        {
            rfqSummaryHeaderLocal.PpapDate = DateTime.Parse(txtPPAPDate.Text);
        }
        catch { }
        try
        {
            rfqSummaryHeaderLocal.InitialReleaseQty = float.Parse(txtInitialReleaseQty.Text);
        }
        catch { }
        try
        {
            rfqSummaryHeaderLocal.InitialReleaseDate = DateTime.Parse(txtInitialReleaseDate.Text);
        }
        catch { }
        try
        {
            rfqSummaryHeaderLocal.PrebuildQty = float.Parse(txtPreBuildQty.Text);
        }
        catch { }
        try
        {
            rfqSummaryHeaderLocal.PrebuildDate = DateTime.Parse(txtPreBuildDate.Text);
        }
        catch { }
        rfqSummaryHeaderLocal.PurchasingAllRecommendations = txtPurchasingAllRecommendations.Text;
        rfqSummaryHeaderLocal.EngineeringAllConcurrences = txtEnginneringAllConcurrences.Text;
        rfqSummaryHeaderLocal.ManufacturingAllConcurrences = txtManfufacturingAllConcurrences.Text;
        rfqSummaryHeaderLocal.QualityAllConcurrences = txtQualityAllConcurrences.Text;
        rfqSummaryHeaderLocal.SalesAllConcurrences = txtSalesAllConcurrences.Text;
        rfqSummaryHeaderLocal.Notes = txtNotes.Text;
        if (!rfqSummaryHeader_CRUD.updateOrCreate(rfqSummaryHeaderLocal))
        {   
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqSummaryHeader_CRUD.ErrorMessage);
            return false;
        }
        return true;
    }
}
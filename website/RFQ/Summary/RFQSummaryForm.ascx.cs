using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQSummaryForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void setBomDetailID(long bomDetailID)
    {
        txtBomDetailID.Value = bomDetailID.ToString();
        frmRFQSummaryHeader.DataBind();
        divRFQSummaryHeader.Visible = true;
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    if (uscRfqSummaryList.save())
    //    {
    //        if (saveRFQSummaryHeader())
    //        {
    //            setBomDetailID(long.Parse(ViewState["bomDetailID"].ToString()));
    //        }
    //    }
    //}
    //private bool saveRFQSummaryHeader()
    //{
    //    RFQSummaryHeader rfqSummaryHeaderLocal1 = rfqSummaryHeader_CRUD.readByBOMDetailID(long.Parse(ViewState["bomDetailID"].ToString()));
    //    RFQSummaryHeader rfqSummaryHeaderLocal = new RFQSummaryHeader();
    //    if (rfqSummaryHeaderLocal1 != null)
    //        rfqSummaryHeaderLocal.Id = rfqSummaryHeaderLocal1.Id;   

    //    rfqSummaryHeaderLocal.BomDetailKey = long.Parse(ViewState["bomDetailID"].ToString());

    //    try
    //    {
    //        rfqSummaryHeaderLocal.PpapDate = DateTime.Parse(txtPPAPDate.Text);
    //    }
    //    catch { }
    //    try
    //    {
    //        rfqSummaryHeaderLocal.InitialReleaseQty = float.Parse(txtInitialReleaseQty.Text);
    //    }
    //    catch { }
    //    try
    //    {
    //        rfqSummaryHeaderLocal.InitialReleaseDate = DateTime.Parse(txtInitialReleaseDate.Text);
    //    }
    //    catch { }
    //    try
    //    {
    //        rfqSummaryHeaderLocal.PrebuildQty = float.Parse(txtPreBuildQty.Text);
    //    }
    //    catch { }
    //    try
    //    {
    //        rfqSummaryHeaderLocal.PrebuildDate = DateTime.Parse(txtPreBuildDate.Text);
    //    }
    //    catch { }
    //    rfqSummaryHeaderLocal.PurchasingAllRecommendations = txtPurchasingAllRecommendations.Text;
    //    rfqSummaryHeaderLocal.EngineeringAllConcurrences = txtEnginneringAllConcurrences.Text;
    //    rfqSummaryHeaderLocal.ManufacturingAllConcurrences = txtManfufacturingAllConcurrences.Text;
    //    rfqSummaryHeaderLocal.QualityAllConcurrences = txtQualityAllConcurrences.Text;
    //    rfqSummaryHeaderLocal.SalesAllConcurrences = txtSalesAllConcurrences.Text;
    //    rfqSummaryHeaderLocal.Notes = txtNotes.Text;
    //    if (!rfqSummaryHeader_CRUD.updateOrCreate(rfqSummaryHeaderLocal))
    //    {   
    //        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqSummaryHeader_CRUD.ErrorMessage);
    //        return false;
    //    }
    //    return true;
    //}
}
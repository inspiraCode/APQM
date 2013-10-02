using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQSummaryForm : System.Web.UI.UserControl
{
    RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();
    public RFQSummary rfqSummary = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["rfqSummaryObject"] != null)
        //{
        //    rfqSummary = (RFQSummary)((SessionObject)Session["rfqSummaryObject"]).Content;
        //}
    }
    //public void load()
    //{
    //    if (Session["rfqSummaryObject"] != null)
    //    {
    //        rfqSummary = (RFQSummary)((SessionObject)Session["rfqSummaryObject"]).Content;
    //        fillWithEntity(rfqSummary);
    //    }
    //    else
    //    {
    //        SessionObject so = new SessionObject();
    //        so.Content = new RFQSummary();
    //        Session["rfqSummaryObject"] = so;
    //        uscRfqSummaryList.setEntity(null);
    //        uscRfqSummaryList.load();
    //    }
    //}
    //public void fillWithEntity(RFQSummary rfqSummary)
    //{
    //    txtSIF.Text = rfqSummary.BomDetailId.ToString();
    //    txtProgram.Text = rfqSummary.Id.ToString();
    //    txtPartNumber.Text = rfqSummary.DueDate.ToShortDateString();
    //    txtPartDescription.Text = rfqSummary.RfqNumber.ToString();
    //    txtEstimatedVolume.Text = rfqSummary.PartNumber;
        
    //    uscRfqSummaryList.reset();
    //    uscRfqSummaryList.setEntity(rfqSummary.RfqDetail);
    //    uscRfqSummaryList.load();
    //}

    public void setBomDetailID(long bomDetailID)
    {
        try
        {
            txtBomDetailID.Text = bomDetailID.ToString();
            
            List<RFQSummary> rfqSummary = rfqSummaryCRUD.readByBOMDetailID(bomDetailID);
            uscRfqSummaryList.setEntity(rfqSummary);
            uscRfqSummaryList.load();

            frmRFQSummaryHeader.DataBind();
        }
        catch (Exception e)
        {
            throw e;
        }
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();        
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
    protected void on_select_rfq(Object sender, EventArgs e)
    {
        panelPopup.Visible = true;
        uscSelectRFQ.load();
    }
    protected void on_confirm_rfq(Object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
    protected void on_cancel_rfq(Object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
}
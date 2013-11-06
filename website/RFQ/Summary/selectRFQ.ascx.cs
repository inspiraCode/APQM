using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_Summary_selectRFQ : System.Web.UI.UserControl
{
    public event EventHandler Ok_click;
    public event EventHandler Cancel_click;
    private RFQSummary rfqSummary;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rfqSummarySelected"] != null)
        {
            rfqSummary = (RFQSummary)((SessionObject)Session["rfqSummarySelected"]).Content;
        }
    }
    public void load()
    {
        lblRFQHeaderKey.Text = "";
        if (Session["rfqSummarySelected"] != null)
        {
            rfqSummary = (RFQSummary)((SessionObject)Session["rfqSummarySelected"]).Content;
            lblRFQHeaderKey.Text = rfqSummary.RfqHeaderKey.ToString();            
        
            frmSelectRFQ.DataBind();
            if (frmSelectRFQ.DataItemCount > 0)
            {
                lblNewCost.Text = rfqSummary.NewCost.ToString();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_click(sender, e);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        RfqCRUD rfqCRUD = new RfqCRUD();
        RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();

        RFQ rfq = rfqCRUD.readById(rfqSummary.RfqHeaderKey);
        List<RFQSummary> rfqSummaryList = rfqSummaryCRUD.readByBOMDetailID(rfq.BomDetailId);

        foreach(RFQSummary rsl in rfqSummaryList){
            if (rsl.RfqHeaderKey != rfq.Id)
            {
                RFQ rfqAux = rfqCRUD.readById(rsl.RfqHeaderKey);
                if(rfqAux!=null){
                    rfqAux.Status = "DISCARDED";
                    if(!rfqCRUD.update(rfqAux)){
                        Navigator.goToPage("~/Error.aspx", "");
                        return;
                    }
                }
            }
        }

        if (rfq != null)
        {
            rfq.Status = "SELECTED";
            if (!rfqCRUD.update(rfq))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
            else
            {
                if (chkUpdateBOMLineCost.Checked)
                {
                    bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
                    BOMDetail bomDetail = bomDetailCRUD.readById(rfqSummary.BomDetailKey);
                    if (bomDetail != null)
                    {
                        bomDetail.Cost = float.Parse(lblNewCost.Text);
                        if (!bomDetailCRUD.update(bomDetail))
                        {
                            Navigator.goToPage("~/Error.aspx", "");
                            return;
                        }
                    }
                    else
                    {
                        Navigator.goToPage("~/Error.aspx", "");
                        return;
                    }
                }
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "");
            return;
        }
        Ok_click(sender, e);
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;        
    }
}
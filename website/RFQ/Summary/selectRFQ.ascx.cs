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
        List<RFQ> rfqList = rfqCRUD.readByBOMDetailKey(rfq.BomDetailId);

        bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
        BOMDetail bomDetail = bomDetailCRUD.readById(rfqSummary.BomDetailKey);

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQSummary Save");

        foreach(RFQ rfqObj in rfqList){
            if (rfqObj.Id != rfq.Id)
            {
                rfqObj.Status = "DISMISSED";
                if (rfqObj.NoQuote == true)
                    rfqObj.Status = "DECLINED";
                if (!rfqCRUD.update(rfqObj, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "");
                    return;
                }
            }
        }

        if (rfq != null)
        {
            rfq.Status = "SELECTED";
            if (!rfqCRUD.update(rfq, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
            else
            {
                
                if (bomDetail != null)
                {
                    if (chkUpdateBOMLineCost.Checked)
                    {
                        bomDetail.Cost = float.Parse(lblNewCost.Text);
                    }
                    bomDetail.Status = "Processed";
                    if (!bomDetailCRUD.update(bomDetail, ref DM))
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
        else
        {
            Navigator.goToPage("~/Error.aspx", "");
            return;
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
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
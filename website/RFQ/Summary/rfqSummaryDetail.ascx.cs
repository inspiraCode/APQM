using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_rfqSummaryDetail : System.Web.UI.UserControl
{
    private List<RFQSummary> rfqSummary = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        rfqSummary = (List<RFQSummary>)Session["rfqSummaryList"];
    }
    public void load()
    {
        //loadDropDowns();
        loadDetail();
    }
    public void reset()
    {
        //allItems = null;
        rfqSummary = null;
        Session.Remove("rfqSummaryList");
    }
    private void loadDetail()
    {
        
        repeaterRFQSummary.DataSource = rfqSummary;
        repeaterRFQSummary.DataBind();
        summarizeTotals();
        if (rfqSummary.Count > 0)
        {
            repeaterRFQSummary.Visible = true;
            divHeader.Visible = true;            
        }
        else
        {
            repeaterRFQSummary.Visible = false;
            divHeader.Visible = false;            
        }
    }
    public void summarizeTotals()
    {
        //float totalMaterial = 0;
        //float totalService = 0;
        //float totalScrap = 0;
        //float totalLabor = 0;
        //float totalBurden = 0;

        //foreach (RFQSummary rfqDetailLine in rfqSummary)
        //{
        //    totalMaterial += rfqDetailLine.MaterialTotal;
        //    totalService += rfqDetailLine.ServiceTotal;
        //    totalScrap += rfqDetailLine.ScrapCost;
        //    totalLabor += rfqDetailLine.LaborCost;
        //    totalBurden += rfqDetailLine.BurdenTotal;
        //}
        //lblTotalMaterial.Text = totalMaterial.ToString();
        //lblTotalService.Text = totalService.ToString();
        //lblTotalScrap.Text = totalScrap.ToString();
        //lblTotalLabor.Text = totalLabor.ToString();
        //lblTotalBurden.Text = totalBurden.ToString();

        //float total = totalMaterial + totalService + totalScrap + totalLabor + totalBurden;
        //Label lblTotal = (Label)Parent.FindControl("lblTotalManufacturingCost");
        //lblTotal.Text = total.ToString();
    }
    public void setEntity(List<RFQSummary> entity)
    {
        if (entity != null)
        {
            rfqSummary = entity;            
        }
        else
        {
            rfqSummary = new List<RFQSummary>();            
        }        
        Session["rfqSummaryList"] = rfqSummary;
    }
    public List<RFQSummary> getEntity()
    {
        return (List<RFQSummary>)Session["rfqSummaryList"];
    }  
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqSummaryDetail : System.Web.UI.UserControl
{
    private List<RFQSummary> rfqSummary = null;
    private RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();
    public event EventHandler select_RFQ;

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
            //divHeader.Visible = true;            
        }
        else
        {
            repeaterRFQSummary.Visible = false;
            //divHeader.Visible = false;            
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
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            RFQSummary rfqSummary = (RFQSummary)e.Item.DataItem;
            ((LinkButton)e.Item.FindControl("lnkSupplier")).CommandArgument = rfqSummary.RfqHeaderKey.ToString();
            ((Label)e.Item.FindControl("lblTotalACost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((Label)e.Item.FindControl("lblTotalACost")).Attributes.Add("fieldName", "lblTotalACost");

            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("fieldName", "txtTotalBCost");
            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("onchange", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");
            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("onkeyup", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");

            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("fieldName", "txtTotalCCost"); 
            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("onchange", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");
            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("onkeyup", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");

            ((Label)e.Item.FindControl("lblTotalAcquisitionCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((Label)e.Item.FindControl("lblTotalAcquisitionCost")).Attributes.Add("fieldName", "lblTotalAcquisitionCost");

            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("fieldName", "txtEAV"); 
            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("onchange", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");
            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("onkeyup", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");

            ((Label)e.Item.FindControl("lblAnnualPurchaseCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((Label)e.Item.FindControl("lblAnnualPurchaseCost")).Attributes.Add("fieldName", "lblAnnualPurchaseCost");
        }
    }
    public void selectRFQ(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        RFQSummary rfqSummary = new RFQSummary();
        rfqSummary = rfqSummaryCRUD.readByRFQHeaderId(id);
        if (rfqSummary != null)
        {
            SessionObject so = new SessionObject();
            rfqSummary.NewCost = 100;
            so.Content = rfqSummary;
            so.Status = "forUpdate";

            Session["rfqSummarySelected"] = so;
            select_RFQ(sender, e);
        }
        else
        {
            Session.Remove("rfqSummarySelected");
            Navigator.goToPage("~/Error.aspx", "");
        }
    }
}
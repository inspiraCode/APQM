using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqDetailList : System.Web.UI.UserControl
{    
    private List<RFQDetail> rfqDetail = null;
    private itemCRUD item_CRUD = new itemCRUD();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        rfqDetail = (List<RFQDetail>) Session["rfqDetailObject"];
    }
    public void load()
    {
        //loadDropDowns();
        loadDetail();
    }
    public void reset()
    {
        //allItems = null;
        rfqDetail = null;
        Session.Remove("rfqDetailObject");
    }
    private void loadDetail()
    {        
        repeaterRFQDetail.DataSource = rfqDetail;
        repeaterRFQDetail.DataBind();
        summarizeTotals();
       
    }
    public void summarizeTotals()
    {
        float totalMaterial = 0;
        float totalService = 0;
        float totalScrap =0;
        float totalLabor = 0;
        float totalBurden = 0;

        foreach(RFQDetail rfqDetailLine in rfqDetail){
            totalMaterial += rfqDetailLine.MaterialTotal;
            totalService += rfqDetailLine.ServiceTotal;
            totalScrap += rfqDetailLine.ScrapCost;
            totalLabor += rfqDetailLine.LaborCost;
            totalBurden += rfqDetailLine.BurdenTotal;
        }
        lblTotalMaterial.Text = totalMaterial.ToString();
        lblTotalService.Text = totalService.ToString();
        lblTotalScrap.Text = totalScrap.ToString();
        lblTotalLabor.Text = totalLabor.ToString();
        lblTotalBurden.Text = totalBurden.ToString();

        float total = totalMaterial + totalService + totalScrap + totalLabor + totalBurden;
        Label lblTotal = (Label) Parent.FindControl("lblTotalManufacturingCost");
        lblTotal.Text = total.ToString();
    }
    public void setEntity(List<RFQDetail> detail)
    {
        if (detail != null)
        {
            rfqDetail = detail;
        }
        else
        {
            rfqDetail = new List<RFQDetail>();
        }
        Session["rfqDetailObject"] = rfqDetail;
    }
    public List<RFQDetail> getEntity()
    {
        return (List<RFQDetail>) Session["rfqDetailObject"];
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((RFQDetail)e.Item.DataItem).Sequence.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (RFQDetail detail in rfqDetail)
        {
            if (detail.Sequence == sequence)
            {
                rfqDetail.Remove(detail);
                loadDetail();
                break;
            }
        }
    }    
    public void add_Click(object sender, EventArgs e)
    {
        RFQDetail rfqDetailLine = new RFQDetail();

        rfqDetailLine.ItemDescription = txtPartNumber.Text;
        rfqDetailLine.Um = txtUOM.Text;
        rfqDetailLine.RpcQty = float.Parse(txtQuantity.Text);
        rfqDetailLine.RpcCostPerUnit = float.Parse(txtCostUnit.Text);
        rfqDetailLine.OSQty = float.Parse(txtOutsideServicesQuantity.Text);
        rfqDetailLine.OSCostPerUnit = float.Parse(txtOutsideServicesCostUnit.Text);
        rfqDetailLine.ScrapValue = float.Parse(txtScrapValue.Text);
        rfqDetailLine.DirectHrlyLaborRate = float.Parse(txtDirectHrlyLaborRate.Text);
        rfqDetailLine.StdHrs = float.Parse(txtStdHrs.Text);
        rfqDetailLine.Burden = float.Parse(txtBurden.Text);
        
        if (rfqDetail == null) rfqDetail = new List<RFQDetail>();
        if (rfqDetail.Count > 0)
        {
            rfqDetailLine.Sequence = rfqDetail[rfqDetail.Count-1].Sequence +1;
        }
        else
        {
            rfqDetailLine.Sequence = 0;
        }

        rfqDetail.Add(rfqDetailLine);
        Session["rfqDetailObject"] = rfqDetail;

        loadDetail();
        clearAddFields();
        txtPartNumber.Focus();        
    }
    private void clearAddFields()
    {
        txtUOM.Text = "";
        txtQuantity.Text = "";
        txtCostUnit.Text = "";
        txtOutsideServicesQuantity.Text = "";
        txtOutsideServicesCostUnit.Text = "";
        txtScrapValue.Text = "";
        txtDirectHrlyLaborRate.Text = "";
        txtStdHrs.Text = "";
        txtBurden.Text = "";
        txtPartNumber.Text = "";
    }   

    //private void loadDropDowns()
    //{
    //    if (allItems == null)
    //    {
    //        allItems = (List<Item>)item_CRUD.readAll();
    //    }
    //    if (cboPartNumber.DataSource == null)
    //    {
    //        cboPartNumber.DataSource = allItems;
    //        cboPartNumber.DataTextField = "PartNumber";
    //        cboPartNumber.DataValueField = "Id";
    //        cboPartNumber.DataBind();
    //    }
    //}
}
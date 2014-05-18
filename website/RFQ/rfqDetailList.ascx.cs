using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqDetailList : System.Web.UI.UserControl
{    
    private List<RFQDetail> rfqDetail = null;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        rfqDetail = (List<RFQDetail>)ViewState["rfqDetailObject"];
    }
    public void load()
    {
        loadDetail();
    }
    public void reset()
    {
        rfqDetail = null;
        ViewState.Remove("rfqDetailObject");
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
        ViewState["rfqDetailObject"] = rfqDetail;
    }
    public List<RFQDetail> getEntity()
    {
        return (List<RFQDetail>)ViewState["rfqDetailObject"];
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((RFQDetail)e.Item.DataItem).Sequence.ToString();
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((RFQDetail)e.Item.DataItem).Sequence.ToString();
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
        rfqDetailLine.Um = cboUM.SelectedValue;
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
        ViewState["rfqDetailObject"] = rfqDetail;

        loadDetail();
        clearAddFields();
        txtPartNumber.Focus();        
    }
    private void clearAddFields()
    {
        cboUM.SelectedIndex = 0;
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
    protected void on_edit_line(object sender, EventArgs e)
    {
        loadDetail();
        panelPopup.Visible = false;
    }
    protected void on_cancelEdit_line(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (RFQDetail detail in rfqDetail)
        {
            if (detail.Sequence == sequence)
            {
                uscRfqDetailEdit.setEntity(detail);
                panelPopup.Visible = true;
                break;
            }
        }
    }
}
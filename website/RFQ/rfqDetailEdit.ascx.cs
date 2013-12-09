using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqDetailEdit : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    private RFQDetail RFQDetailEdit;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        RFQDetailEdit = (RFQDetail)Session["RFQDetailEdit"];

        RFQDetailEdit.ItemDescription = txtPartNumberEdit.Text;
        RFQDetailEdit.Um = cboUMEdit.SelectedValue;
        RFQDetailEdit.RpcQty = float.Parse(txtQuantityEdit.Text);
        RFQDetailEdit.RpcCostPerUnit = float.Parse(txtCostUnitEdit.Text);
        RFQDetailEdit.OSQty = float.Parse(txtOutsideServicesQuantityEdit.Text);
        RFQDetailEdit.OSCostPerUnit = float.Parse(txtOutsideServicesCostUnitEdit.Text);
        RFQDetailEdit.ScrapValue = float.Parse(txtScrapValueEdit.Text);
        RFQDetailEdit.DirectHrlyLaborRate = float.Parse(txtDirectHrlyLaborRateEdit.Text);
        RFQDetailEdit.StdHrs = float.Parse(txtStdHrsEdit.Text);
        RFQDetailEdit.Burden = float.Parse(txtBurdenEdit.Text);
        
        if (RFQDetailEdit.Id > -1)
        {
            RFQDetailEdit.internalAction = "UPDATE";
        }
        
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_Click(this, e);
    }
    public void setEntity(RFQDetail detail)
    {
        if (detail != null)
        {
            Session["RFQDetailEdit"] = detail;
        }
        else
        {
            Session["RFQDetailEdit"] = new RFQDetail();
        }
        RFQDetailEdit = (RFQDetail)Session["RFQDetailEdit"];

        txtPartNumberEdit.Text = RFQDetailEdit.ItemDescription;
        cboUMEdit.SelectedValue = RFQDetailEdit.Um;
        txtQuantityEdit.Text = RFQDetailEdit.RpcQty.ToString();
        txtCostUnitEdit.Text = RFQDetailEdit.RpcCostPerUnit.ToString();
        txtOutsideServicesQuantityEdit.Text = RFQDetailEdit.OSQty.ToString();
        txtOutsideServicesCostUnitEdit.Text = RFQDetailEdit.OSCostPerUnit.ToString();
        txtScrapValueEdit.Text = RFQDetailEdit.ScrapValue.ToString();
        txtDirectHrlyLaborRateEdit.Text = RFQDetailEdit.DirectHrlyLaborRate.ToString();
        txtStdHrsEdit.Text = RFQDetailEdit.StdHrs.ToString();
        txtBurdenEdit.Text = RFQDetailEdit.Burden.ToString();
    }
}
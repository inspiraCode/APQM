using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqACRForm : System.Web.UI.UserControl
{
    List<RFQACR> rfqACR;

    protected void Page_Load(object sender, EventArgs e)
    {
        rfqACR = (List<RFQACR>)Session["rfqACRObject"];
    }
    public void load()
    {
        bindList();
    }
    public void reset()
    {
        rfqACR = null;
        Session.Remove("rfqACRObject");
    }
    private void bindList()
    {
        lstItems.DataSource = rfqACR;
        lstItems.DataTextField = "ACR_Year_Porcentage";
        lstItems.DataBind();
    }
    public void setEntity(List<RFQACR> detail)
    {
        if (detail != null)
        {
            rfqACR = detail;
        }
        else
        {
            rfqACR = new List<RFQACR>();
        }
        Session["rfqACRObject"] = rfqACR;
    }
    public List<RFQACR> getEntity()
    {
        return (List<RFQACR>)Session["rfqACRObject"];
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        removeItemSelectedFromList();
    }
    public bool removeItemSelectedFromList()
    {
        try
        {
            if (lstItems.SelectedIndex > -1)
            {
                rfqACR.RemoveAt(lstItems.SelectedIndex);
                bindList();
                return true;
            }
        }
        catch (Exception e)
        {
        }
        return false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtYear.Text.Trim() != "" && txtCost.Text.Trim() != "")
        {
            RFQACR rfqACRLine = new RFQACR();
            rfqACRLine.Year = int.Parse(txtYear.Text);
            rfqACRLine.Porcentage = float.Parse(txtCost.Text);

            rfqACR.Add(rfqACRLine);
            bindList();
            clearAddFields();
            txtYear.Focus();
        }
    }
    private void clearAddFields()
    {
        txtYear.Text = "";
        txtCost.Text = "";
    }
}
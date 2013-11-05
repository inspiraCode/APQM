using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqEAVForm : System.Web.UI.UserControl
{
    List<RFQEAV> rfqEAV;

    protected void Page_Load(object sender, EventArgs e)
    {
        rfqEAV = (List<RFQEAV>)Session["rfqEAVObject"];
    }
    public void load()
    {
        bindList();
    }
    public void reset()
    {
        rfqEAV = null;
        Session.Remove("rfqEAVObject");
    }
    private void bindList()
    {
        lstItems.DataSource = rfqEAV;
        lstItems.DataTextField = "EAV_Year_Volume";
        lstItems.DataBind();
    }
    public void setEntity(List<RFQEAV> detail)
    {
        if (detail != null)
        {
            rfqEAV = detail;
        }
        else
        {
            rfqEAV = new List<RFQEAV>();
        }
        Session["rfqEAVObject"] = rfqEAV;
    }
    public List<RFQEAV> getEntity()
    {
        return (List<RFQEAV>)Session["rfqEAVObject"];
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
                rfqEAV.RemoveAt(lstItems.SelectedIndex);
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
        if (txtYear.Text.Trim() != "" && txtVolume.Text.Trim() != "")
        {
            RFQEAV rfqEAVLine = new RFQEAV();
            rfqEAVLine.Year = txtYear.Text;
            rfqEAVLine.Volume = float.Parse(txtVolume.Text);

            rfqEAV.Add(rfqEAVLine);
            bindList();
            clearAddFields();
            txtYear.Focus();
        }
    }
    private void clearAddFields()
    {
        txtYear.Text = "";
        txtVolume.Text = "";
    }
    public void setEnabled(bool enabled)
    {
        if (!enabled)
        {
            txtYear.Style.Add("Visibility","hidden");
            txtVolume.Style.Add("Visibility", "hidden");
            btnAdd.Style.Add("Visibility", "hidden");
            btnRemove.Style.Add("Visibility", "hidden");
        }
    }
}
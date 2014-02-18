using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BOM_EAU : System.Web.UI.UserControl
{
    private List<SIFDetail> sifDetail = null;
    private sifDetailCRUD sifDetail_CRUD = new sifDetailCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        sifDetail = (List<SIFDetail>)Session["BOM_sifDetailListAdd"];
    }
    public void load()
    {
        loadDetail();
    }
    public void reset()
    {
        sifDetail = null;
        Session.Remove("BOM_sifDetailListAdd");
    }
    private void loadDetail()
    {
        repeaterSIFDetail.DataSource = sifDetail;
        repeaterSIFDetail.DataBind();
    }
    public void setEntity(List<SIFDetail> detail)
    {
        if (detail != null)
        {
            sifDetail = detail;
        }
        else
        {
            sifDetail = new List<SIFDetail>();
        }
        Session["BOM_sifDetailListAdd"] = sifDetail;
        load();
    }
    public void setParentID(long id)
    {
        hiddenSIFHeaderKey.Value = id.ToString();
    }
    public List<SIFDetail> getEntity()
    {
        return (List<SIFDetail>)Session["BOM_sifDetailListAdd"];
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((SIFDetail)e.Item.DataItem).Sequence.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (SIFDetail detail in sifDetail)
        {
            if (detail.Sequence == sequence)
            {
                sifDetail.Remove(detail);
                loadDetail();
                break;
            }
        }
    }
    public void add_Click(object sender, EventArgs e)
    {
        SIFDetail sifDetailLine = new SIFDetail();

        sifDetailLine.ProgramYear = txtProgramYear.Text;
        try
        {
            sifDetailLine.ProjectedAnnualVolume = long.Parse(txtProjectedAnnualVolume.Text);
        }
        catch (Exception ex)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
            return;
        }

        if (sifDetail == null) sifDetail = new List<SIFDetail>();
        if (sifDetail.Count > 0)
        {
            sifDetailLine.Sequence = sifDetail[sifDetail.Count - 1].Sequence + 1;
        }
        else
        {
            sifDetailLine.Sequence = 0;
        }

        sifDetail.Add(sifDetailLine);
        Session["BOM_sifDetailListAdd"] = sifDetail;

        loadDetail();
        clearAddFields();
        txtProgramYear.Focus();
    }
    private void clearAddFields()
    {
        txtProgramYear.Text = "";
        txtProjectedAnnualVolume.Text = "";
    }
}
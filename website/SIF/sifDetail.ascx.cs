using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SIF_sifDetail : System.Web.UI.UserControl
{
    private List<SIFDetail> sifDetail = null;
    private sifDetailCRUD sifDetailCRUD = new sifDetailCRUD();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        sifDetail = (List<SIFDetail>)Session["sifDetailList"];
    }
    public void load()
    {
        loadDetail();
    }
    public void reset()
    {
        sifDetail = null;
        Session.Remove("sifDetailList");
    }
    private void loadDetail()
    {
        repeaterSIFDetail.DataSource = sifDetail;
        repeaterSIFDetail.DataBind();
        if (sifDetail.Count > 0)
        {
            repeaterSIFDetail.Visible = true;      
        }
        else
        {
            repeaterSIFDetail.Visible = false;      
        }
    }
    public void setEntity(List<SIFDetail> entity)
    {
        if (entity != null)
        {
            sifDetail = entity;
        }
        else
        {
            sifDetail = new List<SIFDetail>();
        }
        Session["sifDetailList"] = sifDetail;
        loadDetail();
    }
    public List<SIFDetail> getEntity()
    {
        return (List<SIFDetail>)Session["sifDetailList"];
    }
}

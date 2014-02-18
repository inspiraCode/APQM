using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BOM_SendNewRFQDetail : System.Web.UI.UserControl
{
    List<BOMDetail> componentsList;
    protected void Page_Load(object sender, EventArgs e)
    {
        componentsList = (List<BOMDetail>)Session["ComponentsToRFQ"];
        bindList();
    }
    public void load()
    {
        bindList();
    }
    private void bindList()
    {
        repeaterNewRFQDetail.DataSource = componentsList;
        repeaterNewRFQDetail.DataBind();
    }
    private void reset()
    {
        componentsList = null;
        Session.Remove("ComponentsToRFQ");
        bindList();
    }
    public void setEntity(List<BOMDetail> bomDetailList)
    {
        Session["ComponentsToRFQ"] = bomDetailList;
        bindList();
    }
}
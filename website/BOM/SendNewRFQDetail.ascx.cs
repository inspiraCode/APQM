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
        componentsList = bomDetailList;
        Session["ComponentsToRFQ"] = componentsList;
        bindList();
    }
    public List<BOMDetail> getEntity()
    {
        return componentsList;
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            BOMDetail bomDetail = (BOMDetail)e.Item.DataItem;
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = bomDetail.Id.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long bomDetailKey = long.Parse((string)e.CommandArgument);
        foreach (BOMDetail detail in componentsList)
        {
            if (detail.Id == bomDetailKey)
            {
                componentsList.Remove(detail);
                break;
            }
        }
        bindList();
    }
}
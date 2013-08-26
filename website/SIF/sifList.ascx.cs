using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sifList : System.Web.UI.UserControl
{
    private sifCRUD sif_CRUD = new sifCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {
        List<SIF> recordset = (List<SIF>)sif_CRUD.readAll();
        Repeater1.DataSource = recordset;
        Repeater1.DataBind();
        divSifList.InnerHtml = recordset.Count.ToString() + " records.";
    }

    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {            
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((SIF)e.Item.DataItem).Id.ToString();
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((SIF)e.Item.DataItem).Id.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (!sif_CRUD.delete(id))
        {
            Response.Redirect("~/Error.aspx");
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        SIF sif = new SIF();
        sif = sif_CRUD.readById(id);
        if (sif != null)
        {
            SessionObject so = new SessionObject();
            so.Content = sif;
            so.Status = "forUpdate";

            Session["SIF"] = so;
        }
        Response.Redirect("~/Supplier/supplier.aspx?section=SIF");
    }   
}
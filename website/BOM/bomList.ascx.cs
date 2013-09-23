using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomList : System.Web.UI.UserControl
{
    private sifCRUD sif_CRUD = new sifCRUD();
    private bomCRUD bom_CRUD = new bomCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void load()
    {
        List<BOM> recordset = (List<BOM>)bom_CRUD.readAll();
        Repeater1.DataSource = recordset;
        Repeater1.DataBind();
        divBomList.InnerHtml = recordset.Count.ToString() + " records.";
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((BOM)e.Item.DataItem).Id.ToString();
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((BOM)e.Item.DataItem).Id.ToString();
            if (((BOM)e.Item.DataItem).SifId > -1)
            {
                ((LinkButton)e.Item.FindControl("updateSIF")).CommandArgument = ((BOM)e.Item.DataItem).Id.ToString() + ";" +
                                                                                   ((BOM)e.Item.DataItem).SifId.ToString();
                ((LinkButton)e.Item.FindControl("updateSIF")).Text = ((BOM)e.Item.DataItem).SifId.ToString();

            }
            else
            {
                ((LinkButton)e.Item.FindControl("updateSIF")).CommandArgument = ((BOM)e.Item.DataItem).Id.ToString() + ";";
                ((LinkButton)e.Item.FindControl("updateSIF")).Text = "None";
            }
            
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (bom_CRUD.delete(id))
        {
            Navigator.goToPage("~/Default.aspx","bom");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx","");
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        BOM bom = new BOM();
        bom = bom_CRUD.readById(id);
        if (bom != null)
        {
            SessionObject so = new SessionObject();
            so.Content = bom;
            so.Status = "forUpdate";

            Session["bomObject"] = so;
        }
        Navigator.goToPage("~/BOM/BOM.aspx","bom");
    }
    public void updateBySIFID(object sender, CommandEventArgs e)
    {
        SessionObject so;
        SIF sif = null;
        string [] values = e.CommandArgument.ToString().Split(';');
        if(values[1]!=""){
            long id = long.Parse(values[1]);
            sif = sif_CRUD.readById(id);
            if (sif == null)
            {
                Navigator.goToPage("~/Error.aspx","");
                return;
            }
            else
            {
                so = new SessionObject();
                so.Content = sif;
                so.Status = "forUpdate";
                Session["SIFObject"] = so;
                Navigator.goToPage("~/BOM/BOM.aspx","sif");
            }
        }else{
            sif = new SIF();
            sif.BomId = long.Parse(values[0]);
            so = new SessionObject();
            so.Content = sif;
            so.Status = "forNew";
            Session["SIFObject"] = so;
            Navigator.goToPage("~/BOM/BOM.aspx", "sif");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sifList : System.Web.UI.UserControl
{
    private sifCRUD sif_CRUD = new sifCRUD();
    private bomCRUD bom_CRUD = new bomCRUD();

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
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((SIF)e.Item.DataItem).Id.ToString();
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((SIF)e.Item.DataItem).Id.ToString();
            if (((SIF)e.Item.DataItem).BomId > -1)
            {
                ((LinkButton)e.Item.FindControl("updateBOM")).CommandArgument = ((SIF)e.Item.DataItem).Id.ToString() + ";" +
                                                                                   ((SIF)e.Item.DataItem).BomId.ToString();                
                ((LinkButton)e.Item.FindControl("updateBOM")).Text = ((SIF)e.Item.DataItem).BomId.ToString();

            }
            else
            {
                ((LinkButton)e.Item.FindControl("updateBOM")).CommandArgument = ((SIF)e.Item.DataItem).Id.ToString() + ";";
                                                                                       
                ((LinkButton)e.Item.FindControl("updateBOM")).Text = "None";
            }
            
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (sif_CRUD.delete(id))
        {
            Navigator.goToPage("~/Default.aspx","sif");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx","");
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

            Session["SIFObject"] = so;
        }
        Navigator.goToPage("~/SIF/SIF.aspx","SIF");
    }
    public void updateByBomID(object sender, CommandEventArgs e)
    {
        SessionObject so;
        BOM bom = null;        
        string [] values = e.CommandArgument.ToString().Split(';');
        if(values[1]!=""){
            long id = long.Parse(values[1]);
            bom = bom_CRUD.readById(id);
            if (bom == null)
            {
                Navigator.goToPage("~/Error.aspx","");
                return;
            }
            else
            {
                so = new SessionObject();
                so.Content = bom;
                so.Status = "forUpdate";
                Session["BOMObject"] = so;
                Navigator.goToPage("~/BOM/BOM.aspx","bom");     
            }
        }else{
            bom = new BOM();
            bom.SifId = long.Parse(values[0]);
            so = new SessionObject();
            so.Content = bom;
            so.Status = "forNew";
            Session["BOMObject"] = so;
            Navigator.goToPage("~/BOM/BOM.aspx","bom");    
        }        
    }
}
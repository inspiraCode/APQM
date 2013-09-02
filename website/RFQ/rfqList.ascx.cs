using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqList : System.Web.UI.UserControl
{
    private rfqCRUD rfq_CRUD = new rfqCRUD();    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SECTION"] != null){        
            List<RFQ> recordset = (List<RFQ>)rfq_CRUD.readAll();
            Repeater1.DataSource = recordset;
            Repeater1.DataBind();
            divRfqList.InnerHtml = recordset.Count.ToString() + " records.";
        }        
    }

    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
        //    ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((RFQ)e.Item.DataItem).Id.ToString();
        //    ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((RFQ)e.Item.DataItem).Id.ToString();
        //    if (((RFQ)e.Item.DataItem).BomId > -1)
        //    {
        //        ((LinkButton)e.Item.FindControl("updateBOM")).CommandArgument = ((RFQ)e.Item.DataItem).Id.ToString() + ";" +
        //                                                                           ((RFQ)e.Item.DataItem).BomId.ToString();                
        //        ((LinkButton)e.Item.FindControl("updateBOM")).Text = ((RFQ)e.Item.DataItem).BomId.ToString();

        //    }
        //    else
        //    {
        //        ((LinkButton)e.Item.FindControl("updateBOM")).CommandArgument = ((RFQ)e.Item.DataItem).Id.ToString() + ";";
                                                                                       
        //        ((LinkButton)e.Item.FindControl("updateBOM")).Text = "None";
        //    }
            
        //}
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (rfq_CRUD.delete(id))
        {
            Navigator.goToPage("~/Default.aspx","rfq");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx","");
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        RFQ rfq = new RFQ();
        rfq = rfq_CRUD.readById(id);
        if (rfq != null)
        {
            SessionObject so = new SessionObject();
            so.Content = rfq;
            so.Status = "forUpdate";

            Session["RFQ"] = so;
        }
        Navigator.goToPage("~/RFQ/RFQ.aspx","rfq");
    }
    public void updateByBomID(object sender, CommandEventArgs e)
    {
         
    }
}
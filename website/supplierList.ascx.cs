using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class supplierList : System.Web.UI.UserControl
{
    private SupplierCRUD supplierCRUD = new SupplierCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {   
        List<Supplier> recordset = (List<Supplier>)supplierCRUD.readAll();
        Repeater1.DataSource = recordset;
        Repeater1.DataBind();
        divSupplierList.InnerHtml = recordset.Count.ToString() + " records.";
    }

    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {                       
            ((LinkButton)e.Item.FindControl("supplierID")).PostBackUrl += ((Supplier)e.Item.DataItem).Id;
        }
    }
}
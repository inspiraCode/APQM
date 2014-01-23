using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class supplierList : System.Web.UI.UserControl
{
    private SupplierCRUD supplierCRUD = new SupplierCRUD();   
    protected void Page_Load(object sender, EventArgs e)
    {   
        
    }
    public void load()
    {
        List<Supplier> recordset = (List<Supplier>)supplierCRUD.readAll();
        Repeater1.DataSource = recordset;
        Repeater1.DataBind();        
    }    
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {                       
            //((LinkButton)e.Item.FindControl("supplierID")).PostBackUrl += ((Supplier)e.Item.DataItem).Id;
            //((LinkButton)e.Item.FindControl("deleteByID")).PostBackUrl += ((Supplier)e.Item.DataItem).Id;
            Supplier supplier = (Supplier)e.Item.DataItem;
            ((HtmlAnchor)e.Item.FindControl("aLinkSupplier")).HRef = "../Supplier/Supplier_Form.aspx?supplier=" + supplier.Id;
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((Supplier)e.Item.DataItem).Id.ToString();            
            //((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((Supplier)e.Item.DataItem).Id.ToString();            
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (supplierCRUD.delete(id))
        {
            load();
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);           
        }
    }
    //public void updateByID(object sender, CommandEventArgs e)
    //{
    //    long id = long.Parse((string)e.CommandArgument);
    //    Supplier supplier = new Supplier();
    //    supplier = supplierCRUD.readById(id);
    //    if (supplier != null)
    //    {
    //        SessionObject so = new SessionObject();
    //        so.Content = supplier;
    //        so.Status = "forUpdate";

    //        Session["supplierObject"] = so;
    //    }
    //    Navigator.goToPage("~/Supplier/supplier.aspx","supplier");
    //}   
}
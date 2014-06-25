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
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Supplier supplier = (Supplier)e.Item.DataItem;
            ((HtmlAnchor)e.Item.FindControl("aLinkSupplier")).HRef = "../Supplier/Supplier_Form.aspx?supplier=" + supplier.Id;
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((Supplier)e.Item.DataItem).Id.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (supplierCRUD.setActive(id, 0))
        {
            load();
            uscNotifier.showSuccess("Supplier deleted successfully.");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
        }
    }
}
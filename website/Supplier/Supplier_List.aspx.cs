using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Supplier_Supplier_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        uscSupplierList.load();
    }
    protected void btnAddSupplier_Click(object sender, EventArgs e)
    {
        Session.Remove("SupplierObject");
        Session.Remove("CommodityList");
        uscSupplierForm.load();
        panelPopup.Visible = true;
    }
    protected void on_afterAdd_supplier(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        uscSupplierList.load();
    }
    protected void on_afterCancel_supplier(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
    protected void on_save_supplier(object sender, EventArgs e)
    {
        uscSupplierForm.save();
    }
    protected void on_cancel_supplier(object sender, EventArgs e)
    {
        uscSupplierForm.cancel();
    }
}
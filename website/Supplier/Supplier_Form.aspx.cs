using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Supplier_Supplier_Form : System.Web.UI.Page
{
    private long supplierHeaderKey = -1;
    private Supplier supplier;
    private SupplierCRUD supplier_CRUD = new SupplierCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        tabSupplier.CssClass = "tabSelected";
        tabSurvey.CssClass = "tabUnselected";
        if (ViewState["supplierHeaderKey"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            lblTitle.InnerText = "Suppliers > " + supplier.SupplierName;
            ViewState["supplierHeaderKey"] = supplierHeaderKey;
            uscSupplierForm.load();
        }
        else
        {
            exitByError("Could not retrieve entity.");
        }
    }
    private bool retrieveEntity()
    {
        string sSupplier_ID = Request["supplier"]; //From Address Box
        if (sSupplier_ID != "" && sSupplier_ID != null)
        {
            supplierHeaderKey = long.Parse(sSupplier_ID);
        }
        else
        {
            supplierHeaderKey = -1;
        }
        supplier = supplier_CRUD.readById(supplierHeaderKey);
        if (supplier != null)
        {
            SessionObject soSIF = new SessionObject();
            soSIF.Content = supplier;
            soSIF.Status = "forUpdate";
            Session["SupplierObject"] = soSIF;
            return true;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        Session.Remove("SupplierObject");
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
    protected void tabSupplier_Click(object sender, EventArgs e)
    {
        if (Session["SupplierObject"] != null)
        {
            ((SessionObject)Session["SupplierObject"]).Status = "forUpdate";
            Response.Redirect("~/Supplier/Supplier_Form.aspx?supplier=" + ((Supplier)((SessionObject)Session["SupplierObject"]).Content).Id);
        }
        else
        {
            exitByError("Session has expired.");
        }
    }
    protected void tabSurvey_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", "survey");
    }
    protected void on_afterSave_supplier(object sender, EventArgs e)
    {
        load();
    }
    protected void on_after_cancel_supplier(object sender, EventArgs e)
    {
        load();
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
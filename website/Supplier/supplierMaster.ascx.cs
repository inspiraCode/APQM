using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class supplierMaster : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    SupplierCRUD supplierCRUD = new SupplierCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Session["Supplier"]!=null)
        {
            if (((SessionObject)Session["Supplier"]).Status == "forUpdate")
            {
                fillWithSupplier((Supplier)(((SessionObject)Session["Supplier"]).Content));
                ((SessionObject)Session["Supplier"]).Status = "Retrieved";
            }
        }               
    }
    public void fillWithSupplier(Supplier supplier){        
        lblID.Text = supplier.Id.ToString();
        txtSupplierName.Text = supplier.SupplierName;
        txtManufacturingLocation.Text = supplier.ManufacturingLocation;
        txtShipLocation.Text = supplier.ShipLocation;
        txtQuotedCurrency.Text = supplier.QuotedCurrency;
        txtContactName.Text = supplier.ContactName;
        txtContactPhoneNumber.Text = supplier.ContactPhone;
        txtContactEmail.Text = supplier.ContactEmail;
        lblMode.Text = "Update";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Supplier supplier = new Supplier();
        supplier.SupplierName = txtSupplierName.Text;
        supplier.ContactName = txtContactName.Text;
        supplier.ContactPhone = txtContactPhoneNumber.Text;
        supplier.ContactEmail = txtContactEmail.Text;
        supplier.ManufacturingLocation = txtManufacturingLocation.Text;
        supplier.ShipLocation = txtShipLocation.Text;
        supplier.QuotedCurrency = txtQuotedCurrency.Text;

        if (lblMode.Text == "New") {
            if (!supplierCRUD.create(supplier))
            {
                Server.Transfer("~/Error.aspx");
            }
        }else if(lblMode.Text == "Update"){
            supplier.Id = long.Parse(lblID.Text);
            if (!supplierCRUD.update(supplier))
            {
                Server.Transfer("~/Error.aspx");
            }
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Supplier");
        Cancel_Click(this, e);
    }
}
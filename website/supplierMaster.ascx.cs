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

    }

    public void fillWithId(long id){
        
        Supplier supplier = supplierCRUD.readById(id);
        if (supplier != null)
        {
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
        else
        {
            Response.Redirect("~/Error.aspx");
        }
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
            long id = supplierCRUD.create(supplier);
            if (id == -1) {
                Response.Redirect("~/Error.aspx");
            }
        }else if(lblMode.Text == "Update"){
            supplier.Id = long.Parse(lblID.Text);
            if (!supplierCRUD.update(supplier))
            {
                Response.Redirect("~/Error.aspx");
            }            
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_Click(this, e);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class supplierMaster : System.Web.UI.UserControl
{
    public event EventHandler AfterSave;
    public event EventHandler AfterCancel;

    SupplierCRUD supplierCRUD = new SupplierCRUD();
    SupplierCommodityCRUD supplierCommodityCRUD = new SupplierCommodityCRUD();
    
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void hideFieldsForVendor()
    {
        fieldsToHideForVendor.Visible = false;
    }
    public void load(){
        if (Session["supplierObject"] != null)
        {
            if (((SessionObject)Session["supplierObject"]).Status == "forUpdate")
            {
                fillUpForm((Supplier)(((SessionObject)Session["supplierObject"]).Content));
                ((SessionObject)Session["supplierObject"]).Status = "Retrieved";
            }
        }
    }
    public void fillUpForm(Supplier supplier){
        lblID.Text = supplier.Id.ToString();
        txtSupplierName.Text = supplier.SupplierName;
        txtManufacturingLocation.Text = supplier.ManufacturingLocation;
        txtShipLocation.Text = supplier.ShipLocation;
        txtQuotedCurrency.Text = supplier.QuotedCurrency;
        txtContactName.Text = supplier.ContactName;
        txtContactPhoneNumber.Text = supplier.ContactPhone;
        txtContactEmail.Text = supplier.ContactEmail;
        txtCapabilities.Text = supplier.Capabilities;
        txtComments.Text = supplier.Comments;
        txtCommodity.Text = supplier.Commodity;
        chkVisible.Checked = supplier.Visible;
        txtContactCellPhone.Text = supplier.ContactCellPhone;

        uscCommodity.setSupplierID(supplier.Id);

        lblMode.Text = "Update";
    }
    public void save()
    {
        Supplier supplier = new Supplier();
        supplier.SupplierName = txtSupplierName.Text;
        supplier.ContactName = txtContactName.Text;
        supplier.ContactPhone = txtContactPhoneNumber.Text;
        supplier.ContactEmail = txtContactEmail.Text;
        supplier.ManufacturingLocation = txtManufacturingLocation.Text;
        supplier.ShipLocation = txtShipLocation.Text;
        supplier.QuotedCurrency = txtQuotedCurrency.Text;
        supplier.Capabilities = txtCapabilities.Text;
        supplier.Comments = txtComments.Text;
        supplier.Commodity = txtCommodity.Text;
        supplier.Visible = chkVisible.Checked;
        supplier.ContactCellPhone = txtContactCellPhone.Text;

        if (lblMode.Text == "New")
        {
            String idGenerated = supplierCRUD.createAndReturnIdGenerated(supplier);
            if (supplierCRUD.ErrorOccur)
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
                return;
            }
            supplier.Id = long.Parse(idGenerated);
        }
        else if (lblMode.Text == "Update")
        {
            supplier.Id = long.Parse(lblID.Text);
            if (!supplierCRUD.update(supplier))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
                return;
            }

            SupplierCommodityCRUD supplierCommodity_CRUD = new SupplierCommodityCRUD();
            if (!supplierCommodity_CRUD.deleteByParentID(supplier.Id))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCommodity_CRUD.ErrorMessage);
                return;
            }
        }

        List<Commodity> commoditiesList = uscCommodity.getEntity();

        foreach (Commodity commodityLocal in commoditiesList)
        {
            Supplier_Commodity supplierCommodity = new Supplier_Commodity();
            supplierCommodity.CommodityKey = commodityLocal.Id;
            supplierCommodity.SupplierKey = supplier.Id;

            if (!supplierCommodityCRUD.create(supplierCommodity))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCommodityCRUD.ErrorMessage);
                return;
            }
        }

        AfterSave(this, null);
    }
    public void cancel()
    {
        Session.Remove("supplierObject");
        AfterCancel(this, null);
    }
}
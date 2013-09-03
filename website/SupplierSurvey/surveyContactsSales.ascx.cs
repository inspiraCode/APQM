using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsSales : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["supplierObject"] != null)
        {
            if (((SessionObject)Session["supplierObject"]).Status == "forUpdate")
            {
                fillWithSupplier((Supplier)(((SessionObject)Session["supplierObject"]).Content));
                ((SessionObject)Session["supplierObject"]).Status = "Retrieved";
            }
        }               
    }
    public void fillWithSupplier(Supplier supplier){
        if (supplier.SupplierSurvey.ContactSales != null)
        {
            txtName.Text = supplier.SupplierSurvey.ContactSales.Name;
            txtTitle.Text = supplier.SupplierSurvey.ContactSales.Title;
            txtAddress.Text = supplier.SupplierSurvey.ContactSales.Address;
            txtPhone.Text = supplier.SupplierSurvey.ContactSales.Phone;
            txtCell.Text = supplier.SupplierSurvey.ContactSales.Cell;
            txtEmail.Text = supplier.SupplierSurvey.ContactSales.Email;
        }
    }   
}
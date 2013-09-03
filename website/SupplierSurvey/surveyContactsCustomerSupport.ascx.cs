using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsCustomerSupport : System.Web.UI.UserControl
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
        if (supplier.SupplierSurvey.ContactCustomerSupport != null)
        {
            txtName.Text = supplier.SupplierSurvey.ContactCustomerSupport.Name;
            txtTitle.Text = supplier.SupplierSurvey.ContactCustomerSupport.Title;
            txtAddress.Text = supplier.SupplierSurvey.ContactCustomerSupport.Address;
            txtPhone.Text = supplier.SupplierSurvey.ContactCustomerSupport.Phone;
            txtCell.Text = supplier.SupplierSurvey.ContactCustomerSupport.Cell;
            txtEmail.Text = supplier.SupplierSurvey.ContactCustomerSupport.Email;
        }
    }   
}
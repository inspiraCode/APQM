using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsExecutive : System.Web.UI.UserControl
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
        if (supplier.SupplierSurvey.ContactExecutive != null)
        {
            txtName.Text = supplier.SupplierSurvey.ContactExecutive.Name;
            txtTitle.Text = supplier.SupplierSurvey.ContactExecutive.Title;
            txtAddress.Text = supplier.SupplierSurvey.ContactExecutive.Address;
            txtPhone.Text = supplier.SupplierSurvey.ContactExecutive.Phone;
            txtCell.Text = supplier.SupplierSurvey.ContactExecutive.Cell;
            txtEmail.Text = supplier.SupplierSurvey.ContactExecutive.Email;
        }
    }   
}
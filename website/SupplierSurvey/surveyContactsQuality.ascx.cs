using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsQuality : System.Web.UI.UserControl
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
        if (supplier.SupplierSurvey.ContactQuality != null)
        {
            txtName.Text = supplier.SupplierSurvey.ContactQuality.Name;
            txtTitle.Text = supplier.SupplierSurvey.ContactQuality.Title;
            txtAddress.Text = supplier.SupplierSurvey.ContactQuality.Address;
            txtPhone.Text = supplier.SupplierSurvey.ContactQuality.Phone;
            txtCell.Text = supplier.SupplierSurvey.ContactQuality.Cell;
            txtEmail.Text = supplier.SupplierSurvey.ContactQuality.Email;
        }
    }   
}
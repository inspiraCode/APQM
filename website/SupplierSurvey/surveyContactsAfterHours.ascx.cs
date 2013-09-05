using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsAfterHours : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void load()
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
    public void fillWithSupplier(Supplier supplier)
    {
        if (supplier.SupplierSurvey != null)
        {
            if (supplier.SupplierSurvey.ContactAfterHoursContact != null)
            {
                txtName.Text = supplier.SupplierSurvey.ContactAfterHoursContact.Name;
                txtTitle.Text = supplier.SupplierSurvey.ContactAfterHoursContact.Title;
                txtAddress.Text = supplier.SupplierSurvey.ContactAfterHoursContact.Address;
                txtPhone.Text = supplier.SupplierSurvey.ContactAfterHoursContact.Phone;
                txtCell.Text = supplier.SupplierSurvey.ContactAfterHoursContact.Cell;
                txtEmail.Text = supplier.SupplierSurvey.ContactAfterHoursContact.Email;
            }
        }
    }
}
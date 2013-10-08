using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsAfterHours : System.Web.UI.UserControl
{
    private SupplierSurveyContacts contact;
    protected void Page_Load(object sender, EventArgs e)
    {
        contact = (SupplierSurveyContacts)Session["SurveyAfterHoursContact"];
    }
    public void load()
    {
        if (Session["supplierObject"] != null)
        {
            if (((SessionObject)Session["supplierObject"]).Status == "forUpdate")
            {

                fillWithSupplier((Supplier)(((SessionObject)Session["supplierObject"]).Content));                
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
    public SupplierSurveyContacts getEntity()
    {
        contact.Address = txtAddress.Text;
        contact.Cell = txtCell.Text;
        contact.Email = txtEmail.Text;
        contact.Name = txtName.Text;
        contact.Phone = txtPhone.Text;
        contact.Position = "AFTERHOURS";
        contact.Title = txtTitle.Text;        
        return contact;
    }

    public void setEntity(SupplierSurveyContacts entity)
    {
        contact = entity;
        if(entity != null){
            txtName.Text = entity.Name;
            txtTitle.Text = entity.Title;
            txtAddress.Text = entity.Address;
            txtPhone.Text = entity.Phone;
            txtCell.Text = entity.Cell;
            txtEmail.Text = entity.Email;
        }
        else
        {
            contact = new SupplierSurveyContacts();
        }
        Session["SurveyAfterHoursContact"] = contact;
    }
}
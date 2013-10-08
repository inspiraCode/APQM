using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsCustomerSupport : System.Web.UI.UserControl
{
    private SupplierSurveyContacts contact;
    protected void Page_Load(object sender, EventArgs e)
    {
        contact = (SupplierSurveyContacts)Session["SurveySupportContact"];
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
    public SupplierSurveyContacts getEntity()
    {        
        contact.Address = txtAddress.Text;
        contact.Cell = txtCell.Text;
        contact.Email = txtEmail.Text;
        contact.Name = txtName.Text;
        contact.Phone = txtPhone.Text;
        contact.Position = "SUPPORT";
        contact.Title = txtTitle.Text;
        return contact;
    }
    public void setEntity(SupplierSurveyContacts entity)
    {
        contact = entity;
        if (entity != null)
        {
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
        Session["SurveySupportContact"] = contact;
    }
}
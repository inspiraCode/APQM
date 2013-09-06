using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyContactsExecutive : System.Web.UI.UserControl
{
    static SupplierSurveyContacts contact = new SupplierSurveyContacts();
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
    public void fillWithSupplier(Supplier supplier){
        if(supplier.SupplierSurvey != null){
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

    public SupplierSurveyContacts getEntity()
    {
        contact.Address = txtAddress.Text;
        contact.Cell = txtCell.Text;
        contact.Email = txtEmail.Text;
        contact.Name = txtName.Text;
        contact.Phone = txtPhone.Text;
        contact.Position = "EXECUTIVE";
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
    }
}
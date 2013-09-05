using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupplierSurvey_sendNewSurvey : System.Web.UI.UserControl
{
    
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;
    Supplier supplier;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public void load()
    {
        if (Session["supplierObject"] != null)
        {
            supplier = (Supplier)(((SessionObject)Session["supplierObject"]).Content);
            fillFields(supplier);
        }
    }

    private void fillFields(Supplier supplier){
        txtSupplier.Text = supplier.SupplierName;
        txtEmail.Text = supplier.ContactEmail;
    }
    protected void btnSendSurvey_Click(object sender, EventArgs e)
    {
        if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
        {
            SupplierCRUD supplierCRUD = new SupplierCRUD();
            supplier.ContactEmail = txtEmail.Text.Trim();
            if (!supplierCRUD.update(supplier))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }            
        }
        //TODO send survey to supplier
        //if(sendEmail == succesfull){
        SupplierSurveyCRUD surveyCRUD = new SupplierSurveyCRUD();
        SupplierSurvey survey = new SupplierSurvey();
        survey.SupplierMasterKey = supplier.Id;
        survey.SentToVendor = DateTime.Now;
        supplier.SupplierSurvey = survey;
        if (!surveyCRUD.create(survey))
        {
            Navigator.goToPage("~/Error.aspx", "");
            return;
        }
        //}
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_Click(this, e);
    }
}
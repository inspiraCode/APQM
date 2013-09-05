using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SifMaster : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    sifCRUD sif_CRUD = new sifCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {        
        
    }
    public void load()
    {
        if (Session["SIFObject"] != null)
        {
            if (((SessionObject)Session["SIFObject"]).Status == "forUpdate")
            {
                fillWithEntity((SIF)(((SessionObject)Session["SIFObject"]).Content));
                ((SessionObject)Session["SIFObject"]).Status = "Retrieved";
            }
        }
    }
    public void fillWithEntity(SIF sif)
    {
        lblID.Text = sif.Id.ToString();
        txtCustomerKey.Text = sif.CustomerKey.ToString();
        lblBOM.Text = sif.BomId.ToString();
        txtInquiryNumber.Text = sif.InquiryNumber;
        txtPriority.Text = sif.Priority;
        txtRevision.Text = sif.Revision;
        txtSalesPerson.Text = sif.SalesPerson;
        txtCostModelLoc.Text = sif.CostModelLoc;
        txtContact.Text = sif.Contact;
        txtBussinesClass.Text = sif.BussinesClass;
        txtProduct.Text = sif.Product;
        txtDivLoc.Text = sif.DivLoc;
        txtDepartment.Text = sif.Department;
        txtReasonForQuote.Text = sif.Reason4Quote;
        txtApplication.Text = sif.Application;
        txtSpecification.Text = sif.Specification;
        txtDrawingLevel.Text = sif.DrawingLevel;
        txtTaskDescription.Text = sif.TaskDescription;
        txtPartPrint.Text = sif.PartPrint;
        txtSample.Text = sif.Sample;
        txtToolingTarget.Text = sif.ToolingTarget;
        txtPrimaryCompetitors.Text = sif.PrimaryCompetitors;
        txtSpecificResourceRequirements.Text = sif.SpecificResourceRequirements;
        txtTechnical.Text = sif.Technical;

        lblMode.Text = "Update";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SIF sif= new SIF();        
        
        if (txtCustomerKey.Text != "")
        {
            sif.CustomerKey = long.Parse(txtCustomerKey.Text);
        }
        else
        {
            sif.CustomerKey = -1;
        }
        if (lblBOM.Text != "")
        {
            sif.BomId = long.Parse(lblBOM.Text);
        }
        else {
            sif.BomId = -1;
        }        
        sif.InquiryNumber = txtInquiryNumber.Text;
        sif.Priority = txtPriority.Text;
        sif.Revision = txtRevision.Text;
        sif.SalesPerson = txtSalesPerson.Text;
        sif.CostModelLoc = txtCostModelLoc.Text;
        sif.Contact = txtContact.Text;
        sif.BussinesClass = txtBussinesClass.Text;
        sif.Product = txtProduct.Text;
        sif.DivLoc = txtDivLoc.Text;
        sif.Department = txtDepartment.Text;
        sif.Reason4Quote = txtReasonForQuote.Text;
        sif.Application = txtApplication.Text;
        sif.Specification = txtSpecification.Text;
        sif.DrawingLevel = txtDrawingLevel.Text;
        sif.TaskDescription = txtTaskDescription.Text;
        sif.PartPrint = txtPartPrint.Text;
        sif.Sample = txtSample.Text;
        sif.ToolingTarget = txtToolingTarget.Text;
        sif.PrimaryCompetitors = txtPrimaryCompetitors.Text;
        sif.SpecificResourceRequirements = txtSpecificResourceRequirements.Text;
        sif.Technical = txtTechnical.Text;
        
        if (lblMode.Text == "New") {
            if (!sif_CRUD.create(sif))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
            else
            {
                BOM bom = new BOM();
                bom.SifId = 21;
                bomCRUD bomCrud = new bomCRUD();
                if (!bomCrud.create(bom))
                {
                    Navigator.goToPage("~/Error.aspx","");
                }
            }
        }else if(lblMode.Text == "Update"){
            sif.Id = long.Parse(lblID.Text);
            if (!sif_CRUD.update(sif))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("SIFObject");
        Cancel_Click(this, e);
    }
}
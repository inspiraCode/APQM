using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyForm : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    Supplier supplier;

    SupplierSurveyCRUD survey_CRUD = new SupplierSurveyCRUD();
    SupplierSurveyCertificationCRUD certification_CRUD = new SupplierSurveyCertificationCRUD();
    SupplierSurveyContactsCRUD contacts_CRUD = new SupplierSurveyContactsCRUD();    
    SupplierSurveyForecastSalesCRUD forecast_CRUD = new SupplierSurveyForecastSalesCRUD();
    SupplierSurveyIndustriesCRUD industries_CRUD = new SupplierSurveyIndustriesCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
        }
        if (Session["SupplierObject"]!=null)
        {
            if (((SessionObject)Session["SupplierObject"]).Status == "forUpdate")
            {
                fillWithEntity((Supplier)(((SessionObject)Session["SupplierObject"]).Content));
                ((SessionObject)Session["SupplierObject"]).Status = "Retrieved";
            }
        }
    }

    public void fillWithEntity(Supplier supplier)
    {
        this.supplier = supplier;

        lblID.Text = supplier.SupplierSurvey.Id.ToString();
        txtLastSurvey.Text = supplier.SupplierSurvey.LastSurvey.ToString();
        txtNDARec.Text = supplier.SupplierSurvey.NDARec.ToString();
        //txtRFQScore.Text = CALCULATED
        lblSupplier.Text = supplier.SupplierName;
        lblContactPerson.Text = supplier.ContactName;
        lblContactPhone.Text = supplier.ContactPhone;
        txtUnion.Text = supplier.SupplierSurvey.UnionYN.ToString();
        txtLocal.Text = supplier.SupplierSurvey.Local;
        txtContractExpiration.Text = supplier.SupplierSurvey.ContractExpiration;
        txtAddress.Text = supplier.SupplierSurvey.StreetAddress;
        txtCity.Text = supplier.SupplierSurvey.City;
        txtState.Text = supplier.SupplierSurvey.State;
        txtZip.Text = supplier.SupplierSurvey.ZipCode;
        txtWebsite.Text = supplier.SupplierSurvey.Website;
        txtPrimaryBusiness.Text = supplier.SupplierSurvey.PrimaryBusiness;
        txtSecundaryBusiness.Text = supplier.SupplierSurvey.SecundaryBusiness;
        txtManufacturingMethod.Text = supplier.SupplierSurvey.ManufacturingMetod;
        txtCurrentCapacity.Text = supplier.SupplierSurvey.CurrentCapacity;
        //txtCurrentAnnualSales.Text = ;
        //lstForecastSales.Text = ;
        txtNewInHouseManufacture.Text = supplier.SupplierSurvey.ToolingNewInHouseYN.ToString();
        txtNewOutsourced.Text = supplier.SupplierSurvey.ToolingNewOutsourcedYN.ToString();
        txtRepairInHouse.Text = supplier.SupplierSurvey.ToolingInHouseYN.ToString();
        txtRepaiOutsource.Text = supplier.SupplierSurvey.ToolingOutsourcedYN.ToString();
        //lstIndustries.Text = 
        //lstCertifications.Text = 
        txtNotes.Text = supplier.SupplierSurvey.Notes;
        
        lblMode.Text = "Update";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SupplierSurvey survey = new SupplierSurvey();
                
        survey.SupplierMasterKey = supplier.Id;
        survey.StreetAddress = txtAddress.Text;
        survey.City = txtCity.Text;
        survey.State = txtState.Text;
        survey.ZipCode = txtZip.Text;
        survey.Website = txtWebsite.Text;
        survey.LastSurvey = DateTime.Parse(txtLastSurvey.Text);
        survey.NDARec = DateTime.Parse(txtNDARec.Text);
        survey.PrimaryBusiness = txtPrimaryBusiness.Text;
        survey.SecundaryBusiness = txtSecundaryBusiness.Text;
        survey.UnionYN = int.Parse(txtUnion.Text);
        survey.Local = txtLocal.Text;
        survey.ContractExpiration = txtContractExpiration.Text;
        survey.CurrentCapacity = txtCurrentCapacity.Text;
        survey.ManufacturingMetod = txtManufacturingMethod.Text;
        survey.ToolingNewInHouseYN = int.Parse(txtNewInHouseManufacture.Text);
        survey.ToolingNewOutsourcedYN = int.Parse(txtNewOutsourced.Text);
        survey.ToolingInHouseYN = int.Parse(txtRepairInHouse.Text);
        survey.ToolingOutsourcedYN = int.Parse(txtRepaiOutsource.Text);
        survey.Notes = txtNotes.Text;
                        
        if (lblMode.Text == "New") {
            if (!survey_CRUD.create(survey))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
            //else
            //{
            //    BOM bom = new BOM();
            //    bom.SifId = 21;
            //    bomCRUD bomCrud = new bomCRUD();
            //    if (!bomCrud.create(bom))
            //    {
            //        Navigator.goToPage("~/Error.aspx","");
            //    }
            //}
        }else if(lblMode.Text == "Update"){
            survey.Id = long.Parse(lblID.Text);
            if (!survey_CRUD.update(survey))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {       
        Cancel_Click(this, e);
    }
}
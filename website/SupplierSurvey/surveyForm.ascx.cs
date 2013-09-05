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

    List<SupplierSurveyCertification> allCertifications;
    List<SupplierSurveyIndustriesSupplied> allIndustriesSupplied; 

    protected void Page_Load(object sender, EventArgs e)
    {
        var algo = Request;
    
    }

    public void load()
    {
        if (Session["supplierObject"]!=null)
        {
            supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
            supplier.SupplierSurvey.Certifications = certification_CRUD.readByParentId(supplier.SupplierSurvey.Id);
            supplier.SupplierSurvey.IndustriesSupplied = industries_CRUD.readByParentId(supplier.SupplierSurvey.Id);
            supplier.SupplierSurvey.ForecastSales = forecast_CRUD.readByParentId(supplier.SupplierSurvey.Id);
            
            if (((SessionObject)Session["supplierObject"]).Status == "forUpdate")
            {
                fillWithEntity(supplier);
                ((SessionObject)Session["supplierObject"]).Status = "retrieved";
            }
            uscContactAfterHours.load();
            uscContactCustomerSupport.load();
            uscContactExecutive.load();
            uscContactQuality.load();
            uscContactSales.load();
            loadDropDowns();

        }
    }
    private void loadDropDowns()
    {   
        allCertifications = (List<SupplierSurveyCertification>)certification_CRUD.readAll();
        cboCertification.DataSource = allCertifications;
        cboCertification.DataTextField = "Certification";
        cboCertification.DataValueField = "Id";
        cboCertification.DataBind();

        allIndustriesSupplied = (List<SupplierSurveyIndustriesSupplied>)industries_CRUD.readAll();
        cboIndustries.DataSource = allIndustriesSupplied;
        cboIndustries.DataTextField = "IndustriesSupplied";
        cboIndustries.DataValueField = "Id";
        cboIndustries.DataBind();
    }
    public void fillWithEntity(Supplier supplier)
    {        
        if (supplier.SupplierSurvey != null)
        {
            lblID.Text = supplier.SupplierSurvey.Id.ToString();

            if (supplier.SupplierSurvey.LastSurvey.Year == 1985 &&
                supplier.SupplierSurvey.LastSurvey.Month == 2 &&
                supplier.SupplierSurvey.LastSurvey.Day == 10)
            {
                lblLastSurvey.Text = "";
            }
            else
            {
                lblLastSurvey.Text = supplier.SupplierSurvey.LastSurvey.ToShortDateString();
            }
            if (supplier.SupplierSurvey.NDARec.Year == 1985 &&
                supplier.SupplierSurvey.NDARec.Month == 2 &&
                supplier.SupplierSurvey.NDARec.Day == 10)
            {
                lblNDARec.Text = "";
            }
            else
            {
                lblNDARec.Text = supplier.SupplierSurvey.NDARec.ToString();
            }            
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

            bindCertifcations();
            bindIndustries();
            bindForecastSales();            

            lblMode.Text = "Update";
        }        
    }
    private void bindCertifcations(){
        lstCertifications.DataSource = supplier.SupplierSurvey.Certifications;
        lstCertifications.DataTextField = "Certification";
        lstCertifications.DataBind();
    }
    private void bindIndustries()
    {
        lstIndustries.DataSource = supplier.SupplierSurvey.IndustriesSupplied;
        lstIndustries.DataTextField = "IndustriesSupplied";
        lstIndustries.DataBind();
    }
    private void bindForecastSales()
    {
        lstForecastSales.DataSource = supplier.SupplierSurvey.ForecastSales;
        lstForecastSales.DataTextField = "forecastYearSale";
        lstForecastSales.DataBind();
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
        survey.LastSurvey = DateTime.Now;
        if (lblNDARec.Text.Trim() != "") survey.NDARec = DateTime.Parse(lblNDARec.Text);
        survey.PrimaryBusiness = txtPrimaryBusiness.Text;
        survey.SecundaryBusiness = txtSecundaryBusiness.Text;
        survey.UnionYN = bool.Parse(txtUnion.Text);
        survey.Local = txtLocal.Text;
        survey.ContractExpiration = txtContractExpiration.Text;
        survey.CurrentCapacity = txtCurrentCapacity.Text;
        survey.ManufacturingMetod = txtManufacturingMethod.Text;
        survey.ToolingNewInHouseYN = bool.Parse(txtNewInHouseManufacture.Text);
        survey.ToolingNewOutsourcedYN = bool.Parse(txtNewOutsourced.Text);
        survey.ToolingInHouseYN = bool.Parse(txtRepairInHouse.Text);
        survey.ToolingOutsourcedYN = bool.Parse(txtRepaiOutsource.Text);
        survey.Notes = txtNotes.Text;

        foreach(SupplierSurveyCertification certification in supplier.SupplierSurvey.Certifications){
            if (certification.forSaving)
            {
                
            }
        }


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
    protected void btnAddCertification_Click(object sender, EventArgs e)
    {
        SupplierSurveyCertification certification = getCertificationSelectedFromDropDown();
        if (certification != null)
        {
            supplier.SupplierSurvey.Certifications.Add(certification);
            bindCertifcations();
        }
    }
    public SupplierSurveyCertification getCertificationSelectedFromDropDown(){
        long id = long.Parse(cboCertification.SelectedValue);
        foreach (SupplierSurveyCertification certification in allCertifications)
        {
            if(certification.Id == id){
                return certification;
            }
        }
        return null;
    }
}
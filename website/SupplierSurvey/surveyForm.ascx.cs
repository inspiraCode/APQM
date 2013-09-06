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

    static List<SupplierSurveyCertification> allCertifications;
    static List<SupplierSurveyIndustriesSupplied> allIndustriesSupplied;
   
    protected void Page_Load(object sender, EventArgs e)
    {}

    public void load()
    {
        btnNewIndustrie.OnClientClick = "document.getElementById('" + txtPrompt.ClientID + "').value = 'i-' + prompt('New Industrie')";
        btnNewCertification.OnClientClick = "document.getElementById('" + txtPrompt.ClientID + "').value = 'c-' + prompt('New Certification')";
        if (Session["supplierObject"]!=null)
        {
            supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
            
            
            if (((SessionObject)Session["supplierObject"]).Status == "forUpdate")
            {
                supplier.SupplierSurvey.Certifications = certification_CRUD.readByParentId(supplier.SupplierSurvey.Id);
                supplier.SupplierSurvey.IndustriesSupplied = industries_CRUD.readByParentId(supplier.SupplierSurvey.Id);
                supplier.SupplierSurvey.ForecastSales = forecast_CRUD.readByParentId(supplier.SupplierSurvey.Id);
                List<SupplierSurveyContacts> allContacts = contacts_CRUD.readByParentId(supplier.SupplierSurvey.Id);

                foreach(SupplierSurveyContacts contact in  allContacts){
                    switch (contact.Position) {
                        case "EXECUTIVE":
                            supplier.SupplierSurvey.ContactExecutive = contact;
                            break;
                        case "AFTERHOURS":
                            supplier.SupplierSurvey.ContactAfterHoursContact = contact;
                            break;
                        case "SUPPORT":
                            supplier.SupplierSurvey.ContactCustomerSupport = contact;
                            break;
                        case "QUALITY":
                            supplier.SupplierSurvey.ContactQuality = contact;
                            break;
                        case "SALES":
                            supplier.SupplierSurvey.ContactSales = contact;
                            break;
                    }
                }
                uscContactAfterHours.load();
                uscContactCustomerSupport.load();
                uscContactExecutive.load();
                uscContactQuality.load();
                uscContactSales.load();
                loadDropDowns();
                fillWithEntity(supplier);
                ((SessionObject)Session["supplierObject"]).Status = "retrieved";
            }            
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
            radUnion.Checked = supplier.SupplierSurvey.UnionYN;
            radUnionNo.Checked = !supplier.SupplierSurvey.UnionYN;
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
            chkNewInHouseManufacture.Checked = supplier.SupplierSurvey.ToolingNewInHouseYN;
            chkNewOutsourced.Checked = supplier.SupplierSurvey.ToolingNewOutsourcedYN;
            chkRepairInHouse.Checked = supplier.SupplierSurvey.ToolingInHouseYN;
            chkRepairOutsource.Checked = supplier.SupplierSurvey.ToolingOutsourcedYN;            
            txtNotes.Text = supplier.SupplierSurvey.Notes;

            bindCertifcations();
            bindIndustries();
            bindForecastSales();

            uscContactAfterHours.setEntity(supplier.SupplierSurvey.ContactAfterHoursContact);
            uscContactCustomerSupport.setEntity(supplier.SupplierSurvey.ContactCustomerSupport);
            uscContactExecutive.setEntity(supplier.SupplierSurvey.ContactExecutive);
            uscContactQuality.setEntity(supplier.SupplierSurvey.ContactQuality);
            uscContactSales.setEntity(supplier.SupplierSurvey.ContactSales);

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
        lstForecastSales.DataTextField = "ForecastYearSale";
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
        survey.UnionYN = radUnion.Checked;        
        survey.Local = txtLocal.Text;
        survey.ContractExpiration = txtContractExpiration.Text;
        survey.CurrentCapacity = txtCurrentCapacity.Text;
        survey.ManufacturingMetod = txtManufacturingMethod.Text;
        survey.ToolingNewInHouseYN = chkNewInHouseManufacture.Checked;
        survey.ToolingNewOutsourcedYN = chkNewOutsourced.Checked;
        survey.ToolingInHouseYN = chkRepairInHouse.Checked;
        survey.ToolingOutsourcedYN = chkRepairOutsource.Checked;
        survey.Notes = txtNotes.Text;

        certification_CRUD.deleteByParentId(supplier.SupplierSurvey.Id);
        foreach (SupplierSurveyCertification certification in supplier.SupplierSurvey.Certifications)
        {            
            certification.SupplierSurveyKey = supplier.SupplierSurvey.Id;
            certification_CRUD.create(certification);            
        }
        industries_CRUD.deleteByParentId(supplier.SupplierSurvey.Id);
        foreach (SupplierSurveyIndustriesSupplied industrie in supplier.SupplierSurvey.IndustriesSupplied)
        {                           
            industrie.SupplierSurveyKey = supplier.SupplierSurvey.Id;
            industries_CRUD.create(industrie);            
        }
        forecast_CRUD.deleteByParentId(supplier.SupplierSurvey.Id);
        foreach (SupplierSurveyForecastSales forecastSale in supplier.SupplierSurvey.ForecastSales)
        {
            forecast_CRUD.create(forecastSale);
        }
        SupplierSurveyContacts executive = uscContactExecutive.getEntity();
        executive.SupplierSurveyKey = supplier.SupplierSurvey.Id;
        if (supplier.SupplierSurvey.ContactExecutive != null)
        {
            contacts_CRUD.update(executive);
        }
        else
        {
            contacts_CRUD.create(executive);
        }
        SupplierSurveyContacts sales = uscContactSales.getEntity();
        sales.SupplierSurveyKey = supplier.SupplierSurvey.Id;
        if (supplier.SupplierSurvey.ContactSales != null)
        {
            contacts_CRUD.update(sales);
        }
        else
        {
            contacts_CRUD.create(sales);
        }
        SupplierSurveyContacts quality = uscContactQuality.getEntity();
        quality.SupplierSurveyKey = supplier.SupplierSurvey.Id;
        if (supplier.SupplierSurvey.ContactQuality != null)
        {
            contacts_CRUD.update(quality);
        }
        else
        {
            contacts_CRUD.create(quality);
        }
        SupplierSurveyContacts support = uscContactCustomerSupport.getEntity();
        support.SupplierSurveyKey = supplier.SupplierSurvey.Id;
        if (supplier.SupplierSurvey.ContactCustomerSupport != null)
        {
            contacts_CRUD.update(support);
        }
        else
        {
            contacts_CRUD.create(support);
        }
        SupplierSurveyContacts afterHours = uscContactAfterHours.getEntity();
        afterHours.SupplierSurveyKey = supplier.SupplierSurvey.Id;
        if (supplier.SupplierSurvey.ContactAfterHoursContact != null)
        {
            contacts_CRUD.update(afterHours);
        }
        else
        {
            contacts_CRUD.create(afterHours);
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
    public SupplierSurveyCertification getCertificationSelectedFromDropDown(){        
        long id = long.Parse(cboCertification.SelectedValue);
        foreach (SupplierSurveyCertification certification in allCertifications)
        {
            if(certification.Id == id){
                certification.forSaving = true;
                return certification;
            }
        }
        return null;
    }
    public SupplierSurveyIndustriesSupplied getIndustrieSelectedFromDropDown()
    {
        long id = long.Parse(cboIndustries.SelectedValue);
        foreach (SupplierSurveyIndustriesSupplied industrie in allIndustriesSupplied)
        {
            if (industrie.Id == id)
            {
                industrie.forSaving = true;
                return industrie;
            }
        }
        return null;
    }
    protected void btnAddCertification_Click(object sender, EventArgs e)
    {
        if(cboCertification.SelectedIndex > -1){
            SupplierSurveyCertification certification = getCertificationSelectedFromDropDown();

            if (certification != null)
            {
                supplier.SupplierSurvey.Certifications.Add(certification);
                bindCertifcations();
            }
        }        
    }
    protected void btnAddIndustrie_Click(object sender, EventArgs e)
    {
        if(cboIndustries.SelectedIndex > -1){
            SupplierSurveyIndustriesSupplied industrie = getIndustrieSelectedFromDropDown();
            if (industrie != null)
            {
                supplier.SupplierSurvey.IndustriesSupplied.Add(industrie);
                bindIndustries();
            }
        }        
    }
    protected void btnAddForecastSale_Click(object sender, EventArgs e)
    {
        if(txtYearForecastSales.Text.Trim() != "" && txtValueForecastYear.Text.Trim() != ""){
            SupplierSurveyForecastSales forecastSale = new SupplierSurveyForecastSales();
            forecastSale.ForecastSalesYear = txtYearForecastSales.Text;
            forecastSale.ForecastSales = txtValueForecastYear.Text;
            forecastSale.forSaving = true;
            forecastSale.SupplierSurveyKey = supplier.SupplierSurvey.Id;

            supplier.SupplierSurvey.ForecastSales.Add(forecastSale);
            bindForecastSales();
        }        
    }
    protected void btnRemoveCertification_Click(object sender, EventArgs e)
    {
        removeCertificationSelectedFromList();
    }
    protected void btnRemoveIndustrie_Click(object sender, EventArgs e)
    {        
        removeIndustrieSelectedFromList();
    }
    protected void btnRemoveForecastSale_Click(object sender, EventArgs e)
    {
        removeForecastSaleSelectedFromList();
    }
    public bool removeCertificationSelectedFromList()
    {
        try
        {
            if(lstCertifications.SelectedIndex > -1){
                supplier.SupplierSurvey.Certifications.RemoveAt(lstCertifications.SelectedIndex);
                bindCertifcations();
                return true;
            }            
        }
        catch (Exception e){   
        }
        return false;
    }
    public bool removeForecastSaleSelectedFromList()
    {
        try
        {
            if(lstForecastSales.SelectedIndex > -1){
                supplier.SupplierSurvey.ForecastSales.RemoveAt(lstForecastSales.SelectedIndex);
                bindForecastSales();
                return true;
            }            
        }catch(Exception e){            
        }
        return false;
    }
    public bool removeIndustrieSelectedFromList()
    {
        try
        {
            if(lstIndustries.SelectedIndex > -1){
                supplier.SupplierSurvey.IndustriesSupplied.RemoveAt(lstIndustries.SelectedIndex);
                bindIndustries();
                return true;
            }            
        }
        catch (Exception e){
        }
        return false;
    }

    protected void txtPrompt_ValueChanged(object sender, EventArgs e)
    {
        if (txtPrompt.Value.Trim() != "")
        {
            string[] prompt = txtPrompt.Value.Split('-');
            switch (prompt[0])
            {
                case "i":
                    SupplierSurveyIndustriesSupplied industrie = new SupplierSurveyIndustriesSupplied();
                    industrie.IndustriesSupplied = prompt[1];
                    industrie.SupplierSurveyKey = supplier.SupplierSurvey.Id;
                    if (industries_CRUD.create(industrie))
                    {
                        supplier.SupplierSurvey.IndustriesSupplied.Add(industrie);
                        loadDropDowns();
                        bindIndustries();
                    }
                    break;
                case "c":
                    SupplierSurveyCertification certification = new SupplierSurveyCertification();
                    certification.Certification = prompt[1];
                    certification.SupplierSurveyKey = supplier.SupplierSurvey.Id;
                    if (certification_CRUD.create(certification))
                    {
                        supplier.SupplierSurvey.Certifications.Add(certification);
                        loadDropDowns();
                        bindCertifcations();
                    }
                    break;
            }
            
            txtPrompt.Value = "";
        }
    }
}
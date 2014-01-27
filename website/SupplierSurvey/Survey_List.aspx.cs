using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupplierSurvey_Survey_List : System.Web.UI.Page
{
    private long supplierHeaderKey = -1;
    private List<SupplierSurvey> surveyList;
    private SupplierSurveyCRUD survey_CRUD = new SupplierSurveyCRUD();
    private Supplier supplier;
    private SupplierCRUD supplier_CRUD = new SupplierCRUD();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        tabSupplier.CssClass = "tabUnselected";
        tabSurvey.CssClass = "tabSelected";
        if (ViewState["supplierHeaderKey"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            lblTitle.InnerText = "Surveys > " + supplier.SupplierName;
            ViewState["supplierHeaderKey"] = supplierHeaderKey;
            uscSurveyList.load();
        }
        else
        {
            exitByError("Could not retrieve entity.");
        }
    }
    private bool retrieveEntity()
    {
        string sSupplier_ID = Request["supplier"]; //From Address Box
        if (sSupplier_ID != "" && sSupplier_ID != null)
        {
            supplierHeaderKey = long.Parse(sSupplier_ID);
        }
        else
        {
            supplierHeaderKey = -1;
        }
        surveyList = survey_CRUD.readByParentId(supplierHeaderKey);
        supplier = supplier_CRUD.readById(supplierHeaderKey);
        if (supplier != null)
        {
            SessionObject soSupplier = new SessionObject();
            soSupplier.Content = supplier;
            soSupplier.Status = "forUpdate";
            Session["SupplierObject"] = soSupplier;
            return true;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
    protected void tabSupplier_Click(object sender, EventArgs e)
    {
        if (ViewState["supplierHeaderKey"] != null)
        {
            Response.Redirect("~/Supplier/Supplier_Form.aspx?supplier=" + (long)ViewState["supplierHeaderKey"]);
        }
    }
    protected void tabSurvey_Click(object sender, EventArgs e)
    {
        if (ViewState["supplierHeaderKey"] != null)
        {
            Response.Redirect("~/SupplierSurvey/Survey_List.aspx?supplier=" + (long)ViewState["supplierHeaderKey"]);
        }
    }
    protected void btnSendSurvey_Click(object sender, EventArgs e)
    {
        Supplier supplier = (Supplier)((SessionObject)Session["SupplierObject"]).Content;
        if (supplier != null)
        {
            panelPopup.Visible = true;
            uscSendNewSurvey.load();
        }
        else
        {
            exitByError("Session has expired.");
        }
    }
    protected void on_send_survey(object sender, EventArgs e)
    {
        load();
        panelPopup.Visible = false;
    }
    protected void on_cancel_send_survey(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
}
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Reflection;

public partial class _Default : System.Web.UI.Page 
{
    Supplier supplier;
    private static string actualView = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["SECTION"] != null)
        {
            if (Session["supplierObject"] != null)
            {
                supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
                lblName.Text = supplier.SupplierName;
                switch (((SessionObject)Session["SECTION"]).Content.ToString())
                {
                    case "supplier":
                        actualView = "supplier";
                        MultiViewMain.SetActiveView(viewSupplier);
                        uscSupplierMasterForm.load();
                        break;
                    case "survey":
                        actualView = "survey";
                        MultiViewMain.SetActiveView(viewSurvey);
                        uscSurveyList.load();
                        break;
                    case "popupSendSurvey":
                        MultiViewMain.SetActiveView(viewSurvey);
                        uscSurveyList.load();
                        openpopupContainer();
                        popupContainer.Style.Add("height", "100px");
                        popupContainer.Style.Add("width", "500px");
                        uscSendNewSurvey.load();
                        break;
                    case "popupSurvey":
                        MultiViewMain.SetActiveView(viewSurvey);
                        multiViewPopup.SetActiveView(viewPopupSurvey);
                        openpopupContainer();
                        popupContainer.Style.Add("height", "550px");
                        popupContainer.Style.Add("width", "1060px");
                        popupContainer.Style.Add("left", "35%");
                        popupContainer.Style.Add("top", "35%");
                        uscSurveyForm.load();
                        break;
                    default:
                        break;
                }
            }
        }
    }    
    private void openpopupContainer()
    {
        panelPopup.Visible = true;
    }
    protected void on_ok_supplier(object sender, EventArgs e)
    {        
        Navigator.goToPage("~/default.aspx","supplier");
    }
    protected void on_cancel_supplier(object sender, EventArgs e)
    {       
        Navigator.goToPage("~/default.aspx", "supplier");
    }
    protected void tabSupplier_Click(object sender, EventArgs e)
    {
        if (Session["SupplierObject"] != null)
        {
            ((SessionObject)Session["SupplierObject"]).Status = "forUpdate";
        }
        Navigator.goToPage("~/Supplier/supplier.aspx","supplier");
    }
    protected void tabSurvey_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", "survey");
    }
    protected void btnSendSurvey_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", "popupSendSurvey");
    }
    protected void on_send_survey(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", actualView);
    }
    protected void on_cancel_send_survey(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", actualView);
    }
    protected void on_save_survey(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", actualView);
    }
    protected void on_cancel_survey(object sender, EventArgs e)
    {
        Navigator.goToPage("~/Supplier/supplier.aspx", actualView);        
    }
}
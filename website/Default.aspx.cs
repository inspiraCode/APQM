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
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["SECTION"] != null)
        {
            Left_Col.ActiveViewIndex = 1;
            switch (((SessionObject)Session["SECTION"]).Content.ToString())
            {
                case "sif":
                    MultiViewMain.SetActiveView(viewSIF);                    
                    uscSIFList.load();
                    break;
                case "bom":
                    MultiViewMain.SetActiveView(viewBOM);
                    uscBOMList.load();
                    break;
                case "rfq":
                    MultiViewMain.SetActiveView(viewRFQ);                    
                    break;
                case "supplier":
                    MultiViewMain.SetActiveView(viewSupplier);
                    uscSupplierList.load();
                    break;
                case "popupSupplier":
                    Session.Remove("supplierObject");
                    MultiViewMain.SetActiveView(viewSupplier);
                    uscSupplierList.load();
                    openpopupContainer();
                    popupContainer.Style.Add("height", "300px");
                    popupContainer.Style.Add("width", "570px");
                    popupContainer.Style.Add("left", "54%");
                    popupContainer.Style.Add("top", "57%");
                    uscSupplierForm.load();
                    disablePageForModalPopup();
                    break;
                case "popupSIF":
                    Session.Remove("sifObject");
                    MultiViewMain.SetActiveView(viewSIF);
                    multiViewPopup.SetActiveView(viewPopupSIF);
                    openpopupContainer();
                    popupContainer.Style.Add("height", "550px");
                    popupContainer.Style.Add("width", "910px");
                    popupContainer.Style.Add("left", "40%");
                    popupContainer.Style.Add("top", "40%");
                    uscSIFForm.load();
                    disablePageForModalPopup();
                    break;
                case "popupRFQ":                    
                    MultiViewMain.SetActiveView(viewRFQ);
                    multiViewPopup.SetActiveView(viewPopupRFQ);
                    openpopupContainer();
                    popupContainer.Style.Add("height", "860px");
                    popupContainer.Style.Add("width", "1250px");
                    popupContainer.Style.Add("left", "350px");
                    popupContainer.Style.Add("top", "220px");
                    uscRFQForm.load();
                    disablePageForModalPopup();
                    break;
                default:
                    //btnSuppliers_Click(null, null);
                    break;
            }
        }     
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        goHome();
        //logout.Visible = true;
    }
    private void goHome()
    {
        Left_Col.ActiveViewIndex = 1;
        MultiViewMain.SetActiveView(viewHome);
    }
    private void disablePageForModalPopup()
    {
        uscMenu.disableButtons();
        btnAddRFQ.Enabled = false;
        btnAddSIF.Enabled = false;
        btnAddSupplier.Enabled = false;        
    }
    private void openpopupContainer()
    {
        panelPopup.Visible = true;
    }

    protected void on_add_supplier(object sender, EventArgs e)
    {        
        Navigator.goToPage("~/default.aspx","supplier");
    }
    protected void on_cancelAdd_supplier(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","supplier");
    }
    protected void on_add_sif(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","sif");
    }
    protected void on_cancelAdd_sif(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","sif");
    }
    protected void on_add_rfq(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","rfq");
    }
    protected void on_cancelAdd_rfq(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","rfq");
    }



    protected void btnAddSupplier_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","popupSupplier");        
    }
    protected void btnAddSIF_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","popupSIF");
    }
    protected void btnAddRFQ_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","popupRFQ");
    }
}
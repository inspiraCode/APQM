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
                    break;
                case "bom":
                    MultiViewMain.SetActiveView(viewBOM);
                    break;
                case "rfq":
                    MultiViewMain.SetActiveView(viewRFQ);
                    break;
                case "supplier":
                    MultiViewMain.SetActiveView(viewSupplier);
                    break;



                case "popupSupplier":
                    Session.Remove("Supplier");
                    MultiViewMain.SetActiveView(viewSupplier);
                    openpopupContainer();
                    break;
                case "popupSIF":
                    Session.Remove("SIF");
                    MultiViewMain.SetActiveView(viewSIF);
                    multiViewPopup.SetActiveView(viewPopupSIF);
                    openpopupContainer();
                    break;
                case "popupRFQ":
                    Session.Remove("RFQ");
                    MultiViewMain.SetActiveView(viewRFQ);
                    multiViewPopup.SetActiveView(viewPopupRFQ);
                    openpopupContainer();
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
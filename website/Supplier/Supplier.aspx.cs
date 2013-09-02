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
            switch (((SessionObject)Session["SECTION"]).Content.ToString())
            {
                case "supplier":
                    MultiViewMain.SetActiveView(viewSupplier);
                    break;
                case "survey":
                    MultiViewMain.SetActiveView(viewSurvey);
                    break;
                case "popupSupplier":
                    //supplierMasterForm.fillWithId(long.Parse(Request.Params.Get("id")));
                    openpopupContainer("supplierMaster.ascx");
                    break;
                default:
                    break;
            }
        }
    }    
        
    private void openpopupContainer(string content)
    {
        panelPopup.Visible = true;
    }
    protected void on_ok_supplier(object sender, EventArgs e)
    {
        //panelPopup.Visible = false;
        Navigator.goToPage("~/default.aspx","supplier");
    }
    protected void on_cancel_supplier(object sender, EventArgs e)
    {
        //panelPopup.Visible = false;
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
}
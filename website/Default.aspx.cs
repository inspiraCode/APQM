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
        if (Request.Params.Get("section") != null)
        {
            Left_Col.ActiveViewIndex = 1;
            switch (Request.Params.Get("section"))
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
                case "suppliers":
                    MultiViewMain.SetActiveView(viewSupplier);
                    Control supplierList = LoadControl("supplierList.ascx");
                    divSupplier.Controls.Add(supplierList);
                    break;
                case "popupSupplier":
                    openPopupSupplierMaster("supplierMaster.ascx");                    
                    break;                    
                default:
                    btnSuppliers_Click(null, null);
                    break;
            }
        }
    }

    protected void btnSIF_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx?section=sif");
    }
    protected void btnBOM_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx?section=bom");
    }
    protected void btnRFQ_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx?section=rfq");
    }
    protected void btnSuppliers_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx?section=suppliers");
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

    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        panelPopupSupplierMaster.Visible = false;
    }

    private void openPopupSupplierMaster(string content)
    {
        panelPopupSupplierMaster.Visible = true;
        
        
    }
    protected void on_ok_supplier(object sender, EventArgs e)
    {
        panelPopupSupplierMaster.Visible = false;

        //TODO: Save Supplier to Database.

        btnSuppliers_Click(null,null);
    }

    protected void on_cancel_supplier(object sender, EventArgs e) 
    {
        panelPopupSupplierMaster.Visible = false;
        btnSuppliers_Click(null, null);
    }
    
}

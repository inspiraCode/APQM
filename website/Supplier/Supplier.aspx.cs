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
            switch (Request.Params.Get("section"))
            {
                case "supplier":
                    MultiViewMain.SetActiveView(viewSupplier);
                    break;
                case "survey":
                    MultiViewMain.SetActiveView(viewSurvey);
                    break;
                case "popupSupplier":
                    //supplierMasterForm.fillWithId(long.Parse(Request.Params.Get("id")));                    
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
        Response.Redirect("~/default.aspx?section=supplier");
    }
    protected void on_cancel_supplier(object sender, EventArgs e) 
    {
        panelPopupSupplierMaster.Visible = false;
        btnSuppliers_Click(null, null);
    }
    protected void tabSupplier_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Supplier/supplier.aspx?section=supplier");
    }
    protected void tabSurvey_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Supplier/supplier.aspx?section=survey");
    }
}

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
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["SECTION"] != null)
        {
            if (Session["supplierObject"] != null)
            {
                supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
                lblTitle.InnerText = "Suppliers > " + supplier.SupplierName;
                //lblName.Text = supplier.SupplierName;
                switch (((SessionObject)Session["SECTION"]).Content.ToString())
                {
                    case "supplier":                        
                        MultiViewMain.SetActiveView(viewSupplier);
                        uscSupplierMasterForm.load();
                        break;
                    default:
                        break;
                }
            }
        }
    }
    
    protected void on_ok_supplier(object sender, EventArgs e)
    {        
        Navigator.goToPage("~/default.aspx","supplier");
    }
    protected void on_after_cancel_supplier(object sender, EventArgs e)
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
    
   
    protected void on_activeView_changed(object sender, EventArgs e)
    {
        var objSent = sender;
        switch (((MultiView)sender).ActiveViewIndex)
        {
            case 0: //Supplier
                tabSupplier.CssClass = "tabSelected";
                tabSurvey.CssClass = "tabUnselected";                
                break;
            case 1: //Surveys
                tabSupplier.CssClass = "tabUnselected";
                tabSurvey.CssClass = "tabSelected"; 
                break;            
        }
    }
    protected void on_save_supplier(object sender, EventArgs e)
    {
        uscSupplierMasterForm.save();
    }
    protected void on_cancel_supplier(object sender, EventArgs e)
    {
        uscSupplierMasterForm.cancel();
    }
}
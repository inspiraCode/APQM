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
                case "SIF":
                    MultiViewMain.SetActiveView(viewSIF);
                    uscSIFMasterForm.load();
                    break;
                case "popupSIF":
                    disablePageForModalPopup();
                    openpopupContainer();
                    Session.Remove("SIFObject");
                    uscSIFMasterForm.load();
                    break;
                default:
                    break;
            }
        }
    }
    private void disablePageForModalPopup()
    {
        uscMenu.disableButtons();
        tabSIF.Enabled = false;    
    }
    private void openpopupContainer()
    {
        panelPopup.Visible = true;
    }
    protected void on_update_SIF(object sender, EventArgs e)
    {
        ((SessionObject)Session["SIFObject"]).Status = "forUpdate";
        uscSIFMasterForm.load();  
        //Navigator.goToPage("~/default.aspx","sif");
    }
    protected void on_cancel_SIF(object sender, EventArgs e) 
    {
        ((SessionObject)Session["SIFObject"]).Status = "forUpdate";
        uscSIFMasterForm.load();
        //Navigator.goToPage("~/default.aspx","sif");
    }
    protected void tabSIF_Click(object sender, EventArgs e)
    {
        if (Session["SIFObject"] != null)
        {
            ((SessionObject)Session["SIFObject"]).Status = "forUpdate";
        }
        //Navigator.goToPage("~/SIF/SIF.aspx", "SIF");               
    }
    
}
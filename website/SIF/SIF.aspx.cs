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
        if (Request.Params.Get("tab") != null)
        {
            switch (Request.Params.Get("tab"))
            {
                case "SIF":
                    MultiViewMain.SetActiveView(viewSIF);
                    break;
                //case "survey":
                //    MultiViewMain.SetActiveView(viewSurvey);
                //    break;
                case "popupSIF":                   
                    openpopupContainer();
                    break;
                default:                    
                    break;
            }
        }        
    }    
   
    private void openpopupContainer()
    {
        panelPopup.Visible = true;
    }
    protected void on_update_SIF(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        Server.Transfer("~/default.aspx?section=sif");
    }
    protected void on_cancel_SIF(object sender, EventArgs e) 
    {
        panelPopup.Visible = false;
        Server.Transfer("~/default.aspx?section=sif");
    }
    protected void tabSIF_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/SIF/SIF.aspx?tab=SIF");
    }   
}
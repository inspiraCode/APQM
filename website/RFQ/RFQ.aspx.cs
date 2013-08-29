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
                case "RFC":
                    MultiViewMain.SetActiveView(viewRFC);
                    break;
                //case "survey":
                //    MultiViewMain.SetActiveView(viewSurvey);
                //    break;
                case "popupRFC":                   
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
    protected void on_update_RFC(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        Server.Transfer("~/default.aspx?section=rfc");
    }
    protected void on_cancel_RFC(object sender, EventArgs e) 
    {
        panelPopup.Visible = false;
        Server.Transfer("~/default.aspx?section=rfc");
    }
    protected void tabRFC_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/RFC/RFC.aspx?tab=RFC");
    }   
}
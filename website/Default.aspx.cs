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
                default:
                    break;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        goHome();
    }
    private void goHome()
    {
        Left_Col.ActiveViewIndex = 1;
    }
    private void disablePageForModalPopup()
    {
        uscMenu.disableButtons();
    }
}
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

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = DateTime.Now.ToString("dddd, MMMM d, yyyy");
        
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Left_Col.ActiveViewIndex = 0;
        logout.Visible = false;
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {

    }
    protected void btnSIF_Click(object sender, EventArgs e)
    {
        MultiViewMain.SetActiveView(viewSIF);

    }
    protected void btnBOM_Click(object sender, EventArgs e)
    {
        MultiViewMain.SetActiveView(viewBOM);
    }
    protected void btnRFQ_Click(object sender, EventArgs e)
    {
        MultiViewMain.SetActiveView(viewRFQ);
    }
    protected void btnSuppliers_Click(object sender, EventArgs e)
    {
        MultiViewMain.SetActiveView(viewSupplier);
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Left_Col.ActiveViewIndex = 1;
        logout.Visible = true;
    }
   
}

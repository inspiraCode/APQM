using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnBOM_Click(object sender, EventArgs e)
    {
        //Server.Transfer("~/default.aspx?section=bom");
        Navigator.goToPage("~/default.aspx","bom");
    }   
    protected void btnRFQ_Click(object sender, EventArgs e)
    {
        //Server.Transfer("~/default.aspx?section=rfq");
        Navigator.goToPage("~/RFQ/RFQ_Main.aspx","RFQ");
    }
    //protected void btnSuppliers_Click(object sender, EventArgs e)
    //{
    //    //Server.Transfer("~/default.aspx?section=supplier");
    //    Navigator.goToPage("~/default.aspx","supplier");
    //}
    protected void btnRFQSummary_Click(object sender, EventArgs e)
    {       
        Navigator.goToPage("~/RFQ/RFQSummary.aspx", "RFQSummary");
    }
    public void disableButtons()
    {
        btnSIF.Enabled = false;
        btnRFQ.Enabled = false;
        btnSuppliers.Enabled = false;
    }
    public void enableButtons()
    {
        btnSIF.Enabled = true;
        btnRFQ.Enabled = true;
        btnSuppliers.Enabled = true;
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        FormsAuthentication.SignOut();
        Response.Redirect("~/Default.aspx",false);
    }
    protected void btnSIF_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/SIF/SIF_Main.aspx", "SIF");
    }
}

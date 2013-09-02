using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_RFQ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        
        btnHome.Visible = false;
    }
    protected void btnToRFQForm_Click(object sender, EventArgs e)
    {
        multiView.SetActiveView(viewRFQ);
    }
    protected void btnToSupplierForm_Click(object sender, EventArgs e)
    {
        multiView.SetActiveView(viewSupplier);
    }
}

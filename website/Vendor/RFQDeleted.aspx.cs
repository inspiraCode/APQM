using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_RFQDeleted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;
    }
}

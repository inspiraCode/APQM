﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSIF_Click(object sender, EventArgs e)
    {        
        Server.Transfer("~/default.aspx?section=sif");
    }
    protected void btnBOM_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/default.aspx?section=bom");
    }
    protected void btnRFQ_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/default.aspx?section=rfq");
    }
    protected void btnSuppliers_Click(object sender, EventArgs e)
    {
        //Server.Transfer("~/default.aspx?section=suppliers");
        Server.Transfer("~/default.aspx?section=supplier");
    }
}

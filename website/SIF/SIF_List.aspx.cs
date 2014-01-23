using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SIF_SIF_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         uscSIFList.setUserFilterWithCookie();
    }
    protected void btnAddSIF_Click(object sender, EventArgs e)
    {
        Session.Remove("SIFObject");
        uscSIFMaster.load();
        panelPopup.Visible = true;
    }
    protected void on_add_sif(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        uscSIFList.load();
    }
    protected void on_cancelAdd_sif(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
}
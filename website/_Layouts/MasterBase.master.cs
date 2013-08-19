using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Layouts_MasterBase : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = DateTime.Now.ToString("dddd, MMMM d, yyyy");

    }
   

    protected void logout_Click(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        popup.Visible = true;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        popup.Visible = false;
    }
}

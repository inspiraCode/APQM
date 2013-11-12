using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Utils_Alertify_notifier : System.Web.UI.UserControl
{
    public event EventHandler Prompt;
    
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void showAlert(String message)
    {
        this.txtAlertify.Text = message;
        this.alertify.Visible = true;
    }
    public void hide()
    {
        this.alertify.Visible = false;
    }
    protected void txtPrompt_ValueChanged(object sender, EventArgs e)
    {
        Prompt(sender, e);
    }
}
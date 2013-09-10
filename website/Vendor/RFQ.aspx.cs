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
    }
    public void load()
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
    protected void btnToSurvey_Click(object sender, EventArgs e)
    {
        multiView.SetActiveView(viewSurvey);
    }
    protected void btnToSurveyForm_Click(object sender, EventArgs e)
    {
        multiView.SetActiveView(viewSurvey);
    }
}
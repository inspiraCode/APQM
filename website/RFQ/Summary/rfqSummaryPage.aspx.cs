using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqSummaryPage : System.Web.UI.Page
{
    private long bomDetailKey = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            //Session["rfqSummary"] = bomDetailKey;
            uscRFQSummaryForm.setBomDetailID(bomDetailKey);
            FormView frmHeader = (FormView) uscRFQSummaryForm.FindControl("frmRFQSummaryHeader");
            frmHeader.Style.Remove("float");
            
        }
    }   
    private bool retrieveEntity()
    {
        Object oBomLine = Session["rfqSummary"];

        if (oBomLine != null)
        {
            bomDetailKey = (long)oBomLine;
            return true;
        }
        else
        {
            bomDetailKey = -1;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        ViewState.Remove("bomDetailKey");
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
}

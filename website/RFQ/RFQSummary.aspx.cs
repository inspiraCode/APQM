using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQSummaryDefault : System.Web.UI.Page
{
    private long bomDetailKey = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        load();
    }
    public void load()
    {
        if (retrieveEntity())
        {
            //Session["rfqSummary"] = bomDetailKey;

            uscRFQSummaryForm.setBomDetailID(bomDetailKey);
        }
    }
    public void setBomID(long bomDetailID)
    {
        bomDetailKey = bomDetailID;
    }
    private bool retrieveEntity()
    {
        Object oBomLine = Session["rfqSummary"];

        if (oBomLine != null)
        {
            bomDetailKey = (long) oBomLine;
            hlnkOpenPage.Visible = true;
            return true;
        }
        else
        {
            bomDetailKey = -1;
            hlnkOpenPage.Visible = false;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        ViewState.Remove("bomDetailKey"); 
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = true;
    }
    protected void on_rowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index;
        //long bomHeaderKey;
        switch (e.CommandName)
        {
            case "selectBOM":
                try
                {
                    index = Convert.ToInt32(e.CommandArgument);
                    long bomDetailKey = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());
                    Session["rfqSummary"] = bomDetailKey;
                    panelPopup.Visible = false;
                    load();
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                    string message = ex.Message;
                }
                break;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }    
}
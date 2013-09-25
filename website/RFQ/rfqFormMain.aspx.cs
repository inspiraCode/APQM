using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_rfqFormMain : System.Web.UI.Page
{
    private long rfqHeaderKey=-1;
    private RFQ rfq;
    private RfqCRUD rfqCRUD = new RfqCRUD();

    RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();


    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;
        if (ViewState["rfqHeaderKey"] == null)
        {
            load();
        }        
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["rfqHeaderKey"] = rfqHeaderKey;
            uscRfqForm.load();
            //Navigator.goToPage("~/RFQ/rfqFormMain.aspx?rfq=" + rfqHeaderKey, "");
        }
        else
        {
            exitByError();
        }
    }
    protected void on_cancel_rfqForm(object sender, EventArgs e)
    {
        load();
    }
    protected void on_save_rfqForm(object sender, EventArgs e)
    {
        load();
    }
    private bool retrieveEntity()
    {
        string sRFQ = Request["rfq"];
        if (sRFQ != "" && sRFQ != null)
        {
            rfqHeaderKey = long.Parse(Request["rfq"]);
        }
        else
        {
            rfqHeaderKey = -1;
        }
        rfq = rfqCRUD.readById(rfqHeaderKey);
        if (rfq != null)
        {
            List<RFQDetail> rfqDetail = rfqDetailCRUD.readByParentID(rfq.Id);
            rfq.RfqDetail = rfqDetail;

            List<RFQACR> rfqACR = rfqACRCRUD.readByParentID(rfq.Id);
            rfq.RfqAcr = rfqACR;

            SessionObject soRFQ = new SessionObject();
            soRFQ.Content = rfq;
            soRFQ.Status = "forUpdate";
            Session["rfqObject"] = soRFQ;
            return true;            
        }
        return false;
    }
    private void exitByError()
    {
        Session.Remove("rfqObject");
        Navigator.goToPage("~/Error.aspx", "");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqFormMain : System.Web.UI.Page
{
    private long rfqHeaderKey = -1;
    private RFQ rfq;
    private RfqCRUD rfqCRUD = new RfqCRUD();

    RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();
    RFQEAVCRUD rfqEAVCRUD = new RFQEAVCRUD();

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
            exitByError("Could not retrieve entity.");
        }
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
            
            List<RFQACR> rfqACR = rfqACRCRUD.readByParentID(rfq.Id);
            rfq.RfqAcr = rfqACR;

            List<RFQEAV> rfqEAVList = rfqEAVCRUD.readByParentID(rfq.Id);
            rfq.RfqEAV = rfqEAVList;

            foreach (RFQEAV rfqEAV in rfqEAVList)
            {
                List<RFQDetail> rfqDetail = rfqDetailCRUD.readByParentID(rfqEAV.Id);
                rfqEAV.RfqDetail = rfqDetail;
            }

            SessionObject soRFQ = new SessionObject();
            soRFQ.Content = rfq;
            soRFQ.Status = "forUpdate";
            Session["rfqObject"] = soRFQ;
            return true;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        Session.Remove("rfqObject");
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        load();
        uscRfqForm.showCancelMessage();
    }
    protected void on_afterSave_rfq(object sender, EventArgs e)
    {
        load();
    }
    protected void on_afterFinalize_rfq(object sender, EventArgs e)
    {
        load();
    }
}
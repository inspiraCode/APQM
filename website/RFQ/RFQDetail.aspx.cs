using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_RFQDetail : System.Web.UI.Page
{
    private long eavKeyFilter = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["RFQDetail_eavKeyFilter"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["RFQDetail_eavKeyFilter"] = eavKeyFilter;
            RfqDetailCRUD rfqDetail_CRUD = new RfqDetailCRUD();
            List<RFQDetail> rfqDetailList = rfqDetail_CRUD.readByParentID(eavKeyFilter);
            uscRFQDetailList.setEntity(rfqDetailList);
        }
        else
        {
            uscRFQDetailList.setEntity(null);
        }
    }
    private bool retrieveEntity()
    {
        string sEAVKey = Request["EAV_ID"];
        if (sEAVKey != "" && sEAVKey != null)
        {
            eavKeyFilter = long.Parse(Request["EAV_ID"]);
        }
        else
        {
            eavKeyFilter = -1;
        }
        return true;
    }
}
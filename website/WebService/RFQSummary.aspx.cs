using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class WebService_RFQSummary : System.Web.UI.Page
{
    RfqSummaryCRUD rfqSummaryDetil_CRUD = new RfqSummaryCRUD();
    RfqSummaryHeaderCRUD rfqSummaryHeader_CRUD = new RfqSummaryHeaderCRUD();
    bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "read":
                Response.Clear();
                Response.Write(getRFQSummarybyBOMDetailID(long.Parse(Request["id"])));
                Response.End();
                return;
        }
    }

    private string getRFQSummarybyBOMDetailID(long bomDetailID)
    {
        RFQSummaryHeader rfqSummaryHeader = rfqSummaryHeader_CRUD.readByBOMDetailID(bomDetailID);

        if (rfqSummaryHeader == null) rfqSummaryHeader = new RFQSummaryHeader();

        BOMDetail bomDetail = bomDetail_CRUD.readById(bomDetailID);
        rfqSummaryHeader.BomDetail = bomDetail;

        List<RFQSummary> rfqSummaryDetail = rfqSummaryDetil_CRUD.readByBOMDetailID(bomDetailID);
        rfqSummaryHeader.RfqSummaryList = rfqSummaryDetail;

        return JsonConvert.SerializeObject(rfqSummaryHeader);
    }
}
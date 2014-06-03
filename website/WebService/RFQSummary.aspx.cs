using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

public partial class WebService_RFQSummary : System.Web.UI.Page
{
    RfqSummaryCRUD rfqSummaryDetil_CRUD = new RfqSummaryCRUD();
    RfqSummaryHeaderCRUD rfqSummaryHeader_CRUD = new RfqSummaryHeaderCRUD();

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
            case "save":
                Response.Clear();
                Response.Write(saveRFQSummary());
                Response.End();
                return;
            case "selectRFQ":
                Response.Clear();
                Response.Write(selectRFQ(long.Parse(Request["rfqheaderkey"]), float.Parse(Request["newBomCost"])));
                Response.End();
                return;
        }
    }

    private string getRFQSummarybyBOMDetailID(long bomDetailID)
    {
        RFQSummaryHeader rfqSummaryHeader = rfqSummaryHeader_CRUD.readByBOMDetailID(bomDetailID);

        if (rfqSummaryHeader == null) rfqSummaryHeader = new RFQSummaryHeader();

        List<RFQSummary> rfqSummaryDetail = rfqSummaryDetil_CRUD.readByBOMDetailID(bomDetailID);
        rfqSummaryHeader.RfqSummaryList = rfqSummaryDetail;


        RFQSummary rfqSelected = rfqSummaryDetail.Find(item => item.Status == "SELECTED" || item.Status == "AWARDED");
        if (rfqSelected != null)
        {
            SupplierCRUD supplier_CRUD = new SupplierCRUD();
            Supplier supplierRecommended = supplier_CRUD.readById(rfqSelected.SupplierKey);
            rfqSummaryHeader.RecommendedSupplier = supplierRecommended.SupplierName;
        }

        return JsonConvert.SerializeObject(rfqSummaryHeader);
    }
    private string saveRFQSummary()
    {
        String s = new StreamReader(Request.InputStream).ReadToEnd();
        RFQSummaryHeader rfqSummaryHeader = JsonConvert.DeserializeObject<RFQSummaryHeader>(s);

        ///*Begin Transaction*/
        //ConnectionManager CM = new ConnectionManager();
        //Data_Base_MNG.SQL DM = CM.getDataManager();

        //DM.Open_Connection("RFQ Update");
        if (!rfqSummaryHeader_CRUD.updateOrCreate(rfqSummaryHeader))
        {
            return "ERROR:" + rfqSummaryHeader_CRUD.ErrorMessage;
        }

        foreach (RFQSummary currentDetail in rfqSummaryHeader.RfqSummaryList)
        {
            if (!rfqSummaryDetil_CRUD.updateOrCreate(currentDetail))
            {
                return "ERROR:" + rfqSummaryDetil_CRUD.ErrorMessage;
            }
        }


        //DM.CommitTransaction();
        //DM.Close_Open_Connection();

        //if (DM.ErrorOccur)
        //{
        //    return "ERROR:" + DM.Error_Mjs;
        //}

        return getRFQSummarybyBOMDetailID(rfqSummaryHeader.BomDetailKey);
    }

    public string selectRFQ(long rfqHeaderKey, float newBomCost)
    {
        saveRFQSummary();

        RfqCRUD rfqCRUD = new RfqCRUD();
        RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();

        RFQ rfq = rfqCRUD.readById(rfqHeaderKey);
        //List<RFQSummary> rfqSummaryList = rfqSummaryCRUD.readByBOMDetailIDAndEAU(rfq.BomDetailId, rfqSummary.EstimatedAnnualVolume);
        List<RFQ> rfqList = rfqCRUD.readByBOMDetailKey(rfq.BomDetailId);

        bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
        BOMDetail bomDetail = bomDetailCRUD.readById(rfq.BomDetailId);

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQ Selection");

        foreach (RFQ rfqObj in rfqList)
        {
            if (rfqObj.Id != rfq.Id)
            {
                rfqObj.Status = "DISMISSED";
                if (rfqObj.NoQuote == true)
                    rfqObj.Status = "NO QUOTE";
                if (!rfqCRUD.update(rfqObj, ref DM))
                {
                    return "ERROR:" + rfqCRUD.ErrorMessage;
                }
            }
        }

        if (rfq != null)
        {
            rfq.Status = "SELECTED";
            if (!rfqCRUD.update(rfq, ref DM))
            {
                return "ERROR:" + rfqCRUD.ErrorMessage;
            }
            else
            {
                if (bomDetail != null)
                {
                    if (newBomCost > -1)
                    {
                        bomDetail.Cost = newBomCost;
                    }
                    bomDetail.Status = "Processed";
                    if (!bomDetailCRUD.update(bomDetail, ref DM))
                    {
                        return "ERROR:" + bomDetailCRUD.ErrorMessage;
                    }
                }
                else
                {
                    return "ERROR:There was an error retrieving BOM Detail for BomDetailKey = " + rfq.BomDetailId;
                }
            }
        }
        else
        {
            return "ERROR:Could not retrieve RFQ for ID = " + rfqHeaderKey;
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            return "ERROR:" + DM.Error_Mjs;
        }
        return getRFQSummarybyBOMDetailID(rfq.BomDetailId);
    }

}
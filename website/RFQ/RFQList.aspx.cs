using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class RFQ_RFQList : System.Web.UI.Page
{
    private long bomDetailKeyFilter = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["RFQList_bomHeaderKeyFilter"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["RFQList_bomHeaderKeyFilter"] = bomDetailKeyFilter;
            uscRFQList.filterByBOMDetailKey(bomDetailKeyFilter);
        }
        else
        {
            uscRFQList.filterByBOMDetailKey(-1);
        }
    }
    private bool retrieveEntity()
    {
        string sBOMDetailKey = Request["bomComponent"];
        if (sBOMDetailKey != "" && sBOMDetailKey != null)
        {
            bomDetailKeyFilter = long.Parse(Request["bomComponent"]);
        }
        else
        {
            bomDetailKeyFilter = -1;
        }
        return true;
    }
    [WebMethod]
    public static string deleteByID(string sRFQHeaderKey)
    {
        long rfqHeaderKey = long.Parse(sRFQHeaderKey);
        RfqCRUD rfq_CRUD = new RfqCRUD();
        if (!rfq_CRUD.deleteByID(rfqHeaderKey))
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfq_CRUD.ErrorMessage);
            return "";
        }
        return "Correct";
    }

    [WebMethod]
    public static string awardByRFQID(string sRFQHeaderKey)
    {
        long rfqHeaderKey = long.Parse(sRFQHeaderKey);

        RfqCRUD rfqCRUD = new RfqCRUD();
        RFQ rfq = rfqCRUD.readById(rfqHeaderKey);

        bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
        BOMDetail bomDetail = bomDetailCRUD.readById(rfq.BomDetailId);
        List<RFQ> rfqList = rfqCRUD.readByBOMDetailKey(rfq.BomDetailId);

        if (rfq != null)
        {
            ConnectionManager CM = new ConnectionManager();
            Data_Base_MNG.SQL DM = CM.getDataManager();

            /*Begin Transaction*/
            DM.Open_Connection("RFQ Save");

            
            if (rfqList.Count > 0)
            {
                foreach (RFQ rfqLocal in rfqList)
                {
                    if (rfqLocal.Id != rfq.Id)
                    {
                        rfqLocal.Status = "DISMISSED";
                        if (rfqLocal.NoQuote == true)
                            rfqLocal.Status = "NO QUOTE";
                        if (!rfqCRUD.update(rfqLocal, ref DM))
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                            return "";
                        }
                    }
                }
            }

            rfq.Status = "AWARDED";
            if (!rfqCRUD.update(rfq, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                return "";
            }
            else
            {

                if (bomDetail != null)
                {
                    bomDetail.Status = "Processed";
                    if (!bomDetailCRUD.update(bomDetail, ref DM))
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailCRUD.ErrorMessage);
                        return "";
                    }
                }
                else
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:There was an error when retrieving a BOM Detail for rfq.BomDetailId = " + rfq.BomDetailId);
                    return "";
                }
            }

            DM.CommitTransaction();
            DM.Close_Open_Connection();

            if (DM.ErrorOccur)
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
                return "";
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve RFQ with rfqHeaderKey = " + rfqHeaderKey);
            return "";
        }
        return "Correct";
    }
    
    //[WebMethod]
    //public static string resendRFQbyID(string sRFQHeaderKey)
    //{
    //    long rfqHeaderKey = long.Parse(sRFQHeaderKey);
    //    RfqCRUD rfq_CRUD = new RfqCRUD();
        
    //    uscResendRFQ.setEntity(rfqHeaderKey);
    //    panelPopup.Visible = true;
        
    //    catch (Exception ex)
    //    {
    //        Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
    //    }
        
        
    //    if (!rfq_CRUD.deleteByID(rfqHeaderKey))
    //    {
    //        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfq_CRUD.ErrorMessage);
    //        return "";
    //    }
    //    return "Correct";
    //}
}
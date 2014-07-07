using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class HTMLReports_SalesReport : System.Web.UI.Page
{
    private List<SalesReportDetail> salesReportDetailList = new List<SalesReportDetail>();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strBOM = Request["BOM"].ToString();
        if (strBOM != "" && strBOM != null)
        {
            lblBOMHeader.Text = strBOM;
        }
        else
        {
            lblBOMHeader.Text = "";
        }
        SqlDataSourceForm.DataBind();

        //Calculating TotalCostMaterial and TotalCostReduction:

        float totalCostMaterial = 0;
        float totalCostReduction = 0;

        RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();
        RfqCRUD rfqCRUD = new RfqCRUD();

        RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();

        bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();


        List<BOMDetail> bomDetailList = bomDetailCRUD.readByParentID(long.Parse(lblBOMHeader.Text));
        foreach (BOMDetail bomDetail in bomDetailList)
        {
            List<RFQSummary> rfqSummaryList = rfqSummaryCRUD.readByBOMDetailID(bomDetail.Id);
            foreach (RFQSummary rfqSummary in rfqSummaryList)
            {
                if (rfqSummary.Eav_status == "SELECTED" || rfqSummary.Eav_status == "AWARDED")
                {
                    totalCostMaterial += rfqSummary.TotalACost;

                    RfqAcrCRUD rfqAcrCRUD = new RfqAcrCRUD();
                    List<RFQACR> rfqACRList = rfqAcrCRUD.readByParentID(rfqSummary.RfqHeaderKey);
                    RFQACR rfqACR_with_Highest_Cost_Saving = null;
                    foreach (RFQACR rfqACR in rfqACRList)
                    {
                        if (rfqACR_with_Highest_Cost_Saving == null || rfqACR.Porcentage > rfqACR_with_Highest_Cost_Saving.Porcentage)
                            rfqACR_with_Highest_Cost_Saving = rfqACR;

                    }
                    if (rfqACR_with_Highest_Cost_Saving != null)
                        totalCostReduction += rfqSummary.TotalACost * rfqACR_with_Highest_Cost_Saving.Porcentage / 100;
                    else
                    {
                        //totalCostReduction += rfqSummary.TotalACost; We dont sum any value if there was no Annual Cost Reduction.
                    }
                }
            }
        }
        ((Label)FormView1.FindControl("lblTotalMaterialCost")).Text = String.Format("{0:C}", totalCostMaterial);
        ((Label)FormView1.FindControl("lblTotalCostReduction")).Text = String.Format("{0:C}", totalCostReduction);
        ((Label)FormView1.FindControl("lblTotalMaterialCostWithReduction")).Text = String.Format("{0:C}", totalCostMaterial - totalCostReduction);

        SalesReportDetail_DAO salesReportDetailDAO = new SalesReportDetail_DAO();
        List<SalesReportDetail> salesReportDetailAllList = salesReportDetailDAO.readAllByBomHeaderKey(long.Parse(lblBOMHeader.Text));

        foreach (SalesReportDetail srd in salesReportDetailAllList)
        {
            SalesReportDetail srdInternal = salesReportDetailList.Find(r => r.BOMDetailKey == srd.BOMDetailKey);
            if (srdInternal == null)
            {
                if (srd.Quote100ToDrawing == true)
                {
                    srd.ExceptionsToDrawing = "";
                }
                switch (srd.Eau_status)
                {
                    case "":
                    case "CREATED":
                    case "PENDING":
                    case "IN PROGRESS":
                    case "COMPLETED":
                    case "IN PROCESS":
                        if (srd.RFQStatus == "")
                        {
                            srd.RFQStatus = "PROCESSED";
                            srd.Eau_status = "PROCESSED";
                        }
                        else if (srd.RFQStatus != "NO QUOTE")
                        {
                            srd.RFQStatus = "IN PROCESS";
                        }

                        srd.TotalACost = null;
                        srd.ProductionTooling = null;
                        srd.ToolingDetail = null;
                        srd.ProductionToolingLeadTime = null;

                        srd.LeadTimeFirstProductionOrder = null;
                        srd.LeadTimePPAPFAIR = null;
                        srd.LeadTimeNormalProductionOrders = null;
                        srd.EauCalendarYears = null;

                        srd.SupplierName = "";
                        salesReportDetailList.Add(srd);
                        break;
                    case "AWARDED":
                    case "SELECTED":
                        salesReportDetailList.Add(srd);
                        break;
                    case "DISMISSED":
                        break;
                }
            }
            else
            {
                switch (srd.Eau_status)
                {
                    case "":
                    case "CREATED":
                    case "PENDING":
                    case "IN PROGRESS":
                    case "COMPLETED":
                    case "NO QUOTE":
                    case "IN PROCESS":
                        break;
                    case "AWARDED":
                    case "SELECTED":
                        //for (int i = 0; i < salesReportDetailList.Count;i++ )
                        //{
                        //    if (salesReportDetailList[i].BOMDetailKey == srd.BOMDetailKey)
                        //    {
                        //        salesReportDetailList[i] = srd;
                        //        break;
                        //    }
                        //}
                        salesReportDetailList.Add(srd);
                        break;
                    case "DISMISSED":
                        break;
                }
            }
        }

        gridSalesReport.DataSource = salesReportDetailList;
        gridSalesReport.DataBind();

    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        string attachment = "attachment; filename=SalesReport.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        panelContent.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSourceForm.ConnectionString = connection.getConnection().ConnectionString;
    }

    private class SalesReportDetail
    {
        private string partNumber = "";

        public string PartNumber
        {
            get { return partNumber; }
            set { partNumber = value; }
        }
        private string capsonicPN = "";

        public string CapsonicPN
        {
            get { return capsonicPN; }
            set { capsonicPN = value; }
        }
        private string customerPN = "";

        public string CustomerPN
        {
            get { return customerPN; }
            set { customerPN = value; }
        }
        private string manufacturePN = "";

        public string ManufacturePN
        {
            get { return manufacturePN; }
            set { manufacturePN = value; }
        }
        private string supplierPN = "";

        public string SupplierPN
        {
            get { return supplierPN; }
            set { supplierPN = value; }
        }
        private string commCode = "";

        public string CommCode
        {
            get { return commCode; }
            set { commCode = value; }
        }
        private string material = "";

        public string Material
        {
            get { return material; }
            set { material = value; }
        }
        private string vendorQuoteEst = "";

        public string VendorQuoteEst
        {
            get { return vendorQuoteEst; }
            set { vendorQuoteEst = value; }
        }
        private float qty;

        public float Qty
        {
            get { return qty; }
            set { qty = value; }
        }
        private string eAU;

        public string EAU
        {
            get { return eAU; }
            set { eAU = value; }
        }
        private string mOQ = "";

        public string MOQ
        {
            get { return mOQ; }
            set { mOQ = value; }
        }
        private string supplierName = "";

        public string SupplierName
        {
            get { return supplierName; }
            set { supplierName = value; }
        }
        private string capComAssm = "";

        public string CapComAssm
        {
            get { return capComAssm; }
            set { capComAssm = value; }
        }
        private string purchasingComments = "";

        public string PurchasingComments
        {
            get { return purchasingComments; }
            set { purchasingComments = value; }
        }
        private string toolingDetail = "";

        public string ToolingDetail
        {
            get { return toolingDetail; }
            set { toolingDetail = value; }
        }
        private string productionToolingLeadTime = "";

        public string ProductionToolingLeadTime1
        {
            get { return productionToolingLeadTime; }
            set { productionToolingLeadTime = value; }
        }

        public string ProductionToolingLeadTime
        {
            get { return productionToolingLeadTime; }
            set { productionToolingLeadTime = value; }
        }
        private long bOMHeaderKey;

        public long BOMHeaderKey1
        {
            get { return bOMHeaderKey; }
            set { bOMHeaderKey = value; }
        }
        public long BOMHeaderKey
        {
            get { return bOMHeaderKey; }
            set { bOMHeaderKey = value; }
        }
        private string linePosition = "";

        public string LinePosition
        {
            get { return linePosition; }
            set { linePosition = value; }
        }
        private string status = "";

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        private string rFQStatus = "";

        public string RFQStatus
        {
            get { return rFQStatus; }
            set { rFQStatus = value; }
        }
        private string totalACost = "";

        public string TotalACost
        {
            get { return totalACost; }
            set { totalACost = value; }
        }
        private string productionTooling = "";

        public string ProductionTooling
        {
            get { return productionTooling; }
            set { productionTooling = value; }
        }
        private string user = "";

        public string User
        {
            get { return user; }
            set { user = value; }
        }
        private long bOMDetailKey;

        public long BOMDetailKey
        {
            get { return bOMDetailKey; }
            set { bOMDetailKey = value; }
        }

        private string leadTimePPAPFAIR = "";

        public string LeadTimePPAPFAIR
        {
            get { return leadTimePPAPFAIR; }
            set { leadTimePPAPFAIR = value; }
        }
        private string leadTimeFirstProductionOrder = "";

        public string LeadTimeFirstProductionOrder
        {
            get { return leadTimeFirstProductionOrder; }
            set { leadTimeFirstProductionOrder = value; }
        }
        private string leadTimeNormalProductionOrders = "";

        public string LeadTimeNormalProductionOrders
        {
            get { return leadTimeNormalProductionOrders; }
            set { leadTimeNormalProductionOrders = value; }
        }
        private string eauCalendarYears = "";

        public string EauCalendarYears
        {
            get { return eauCalendarYears; }
            set { eauCalendarYears = value; }
        }

        private string um = "";

        public string Um
        {
            get { return um; }
            set { um = value; }
        }

        private string eau_status = "";

        public string Eau_status
        {
            get { return eau_status; }
            set { eau_status = value; }
        }

        private float prototypeTooling;
        private string commentsToBuyer = "";
        private string exceptionsToDrawing = "";
        private bool quote100ToDrawing = true;
        private string purchasingStatus = "";

        public float PrototypeTooling
        {
            get { return prototypeTooling; }
            set { prototypeTooling = value; }
        }
        public string CommentsToBuyer
        {
            get { return commentsToBuyer; }
            set { commentsToBuyer = value; }
        }
        public string ExceptionsToDrawing
        {
            get { return exceptionsToDrawing; }
            set { exceptionsToDrawing = value; }
        }
        public bool Quote100ToDrawing
        {
            get { return quote100ToDrawing; }
            set { quote100ToDrawing = value; }
        }
        public string PurchasingStatus
        {
            get { return purchasingStatus; }
            set { purchasingStatus = value; }
        }
    }
    private class SalesReportDetail_DAO
    {
        private ConnectionManager connectionManager = new ConnectionManager();
        private Data_Base_MNG.SQL DM;

        public List<SalesReportDetail> readAllByBomHeaderKey(long id)
        {
            List<SalesReportDetail> recordset = new List<SalesReportDetail>();
            recordset.Clear();
            DM = connectionManager.getDataManager();

            string query = "SELECT distinct PartNumber, CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode, Material, " +
                            "VendorQuoteEst, Qty, EAU, MOQ, SupplierName, CapComAssm, PurchasingComments, ToolingDetail, " +
                            "ProductionToolingLeadTime, BOMHeaderKey, LinePosition, [Status], " +
                            "RFQStatus, TotalACost, ProductionTooling, [User], BOMDetailKey, " +
                            "LeadTimeFirstProductionOrder, LeadTimePPAP_FAIR, LeadTimeNormalProductionOrders, EAUCalendarYears, Um, EAV_Status, " +
                            "PrototypeTooling, CommentsToBuyer, Quote100ToPrint, ExceptionTo100ToPrint, PurchasingStatus " +
                            "FROM        viewSalesReportDetail " +
                            "WHERE       [BOMHeaderKey] = " + id +
                            " ORDER BY    LinePosition, BOMDetailKey";

            DataTable table = new DataTable();
            table = DM.Execute_Query(query);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                SalesReportDetail salesReportDetailLocal = new SalesReportDetail();

                salesReportDetailLocal.PartNumber = table.Rows[i][0].ToString();
                salesReportDetailLocal.CapsonicPN = table.Rows[i][1].ToString();
                salesReportDetailLocal.CustomerPN = table.Rows[i][2].ToString();
                salesReportDetailLocal.ManufacturePN = table.Rows[i][3].ToString();
                salesReportDetailLocal.SupplierPN = table.Rows[i][4].ToString();
                salesReportDetailLocal.CommCode = table.Rows[i][5].ToString();
                salesReportDetailLocal.Material = table.Rows[i][6].ToString();
                salesReportDetailLocal.VendorQuoteEst = table.Rows[i][7].ToString();
                salesReportDetailLocal.Qty = float.Parse(table.Rows[i][8].ToString());
                salesReportDetailLocal.EAU = table.Rows[i][9].ToString();
                salesReportDetailLocal.MOQ = table.Rows[i][10].ToString();
                salesReportDetailLocal.SupplierName = table.Rows[i][11].ToString();
                salesReportDetailLocal.CapComAssm = table.Rows[i][12].ToString();
                salesReportDetailLocal.PurchasingComments = table.Rows[i][13].ToString();
                salesReportDetailLocal.ToolingDetail = table.Rows[i][14].ToString();
                salesReportDetailLocal.ProductionToolingLeadTime = table.Rows[i][15].ToString();
                salesReportDetailLocal.BOMHeaderKey = long.Parse(table.Rows[i][16].ToString());
                salesReportDetailLocal.LinePosition = table.Rows[i][17].ToString();
                salesReportDetailLocal.Status = table.Rows[i][18].ToString();
                salesReportDetailLocal.RFQStatus = table.Rows[i][19].ToString();
                salesReportDetailLocal.TotalACost = table.Rows[i][20].ToString();
                salesReportDetailLocal.ProductionTooling = table.Rows[i][21].ToString();
                salesReportDetailLocal.User = table.Rows[i][22].ToString();
                salesReportDetailLocal.BOMDetailKey = long.Parse(table.Rows[i][23].ToString());
                salesReportDetailLocal.LeadTimeFirstProductionOrder = table.Rows[i][24].ToString();
                salesReportDetailLocal.LeadTimePPAPFAIR = table.Rows[i][25].ToString();
                salesReportDetailLocal.LeadTimeNormalProductionOrders = table.Rows[i][26].ToString();
                salesReportDetailLocal.EauCalendarYears = table.Rows[i][27].ToString();
                salesReportDetailLocal.Um = table.Rows[i][28].ToString();
                salesReportDetailLocal.Eau_status = table.Rows[i][29].ToString();
                try { salesReportDetailLocal.PrototypeTooling = float.Parse(table.Rows[i][30].ToString()); }
                catch { }
                salesReportDetailLocal.CommentsToBuyer = table.Rows[i][31].ToString();
                try { salesReportDetailLocal.Quote100ToDrawing = bool.Parse(table.Rows[i][32].ToString()); }
                catch { }
                salesReportDetailLocal.ExceptionsToDrawing = table.Rows[i][33].ToString();
                try { salesReportDetailLocal.PurchasingStatus = table.Rows[i][34].ToString(); }
                catch { }

                recordset.Add(salesReportDetailLocal);
            }

            return recordset;
        }
    }
}

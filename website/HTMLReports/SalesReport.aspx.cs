using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class HTMLReports_SalesReport : System.Web.UI.Page
{
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
        SqlDataSource1.DataBind();
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
                if (rfqSummary.Status == "SELECTED" || rfqSummary.Status == "AWARDED")
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
                        totalCostReduction += rfqSummary.TotalACost;
                    }
                }
            }
        }
        ((Label)FormView1.FindControl("lblTotalMaterialCost")).Text = String.Format("{0:C}", totalCostMaterial);
        ((Label)FormView1.FindControl("lblTotalCostReduction")).Text = String.Format("{0:C}", totalCostReduction);
        ((Label)FormView1.FindControl("lblTotalMaterialCostWithReduction")).Text = String.Format("{0:C}", totalCostMaterial - totalCostReduction);
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        string attachment = "attachment; filename=SalesReport.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition",attachment);
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
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
}

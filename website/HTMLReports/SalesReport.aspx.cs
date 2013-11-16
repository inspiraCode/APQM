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
}

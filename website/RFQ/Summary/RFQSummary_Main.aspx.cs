using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_Summary_RFQSummary_Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBomDetailID.Value = Request["bomline"];
        frmRFQSummaryHeader.DataBind();
        divRFQSummaryHeader.Visible = true;
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
}
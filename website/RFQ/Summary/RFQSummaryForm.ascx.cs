using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQSummaryForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void setBomDetailID(long bomDetailID)
    {
        txtBomDetailID.Text = bomDetailID.ToString();
        uscRfqSummaryList.setEntity(bomDetailID);
        frmRFQSummaryHeader.DataBind();
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        uscRfqSummaryList.save();
    }
}
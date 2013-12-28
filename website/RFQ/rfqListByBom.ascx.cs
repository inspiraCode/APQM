using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqListByBom : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void setBomID(long bomID)
    {
        try
        {
            lblBomDetailID.Text = bomID.ToString();
            gridRFQbyBOMLine.DataBind();
            frmBOMLine.DataBind();
        }
        catch (Exception e)
        {
            throw e;
        }
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSourceRFQCountPerBOMDetail.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
}
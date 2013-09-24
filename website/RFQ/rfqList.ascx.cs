using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqList : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
    }    
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource.ConnectionString = connection.getConnection().ConnectionString;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqCountPerSharedItems : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource.ConnectionString = connection.getConnection().ConnectionString;
    }
    public static void MakeAccessible(GridView grid)
    {
        if (grid.Rows.Count <= 0) return;
        grid.UseAccessibleHeader = true;
        grid.HeaderRow.TableSection = TableRowSection.TableHeader;
        if (grid.ShowFooter)
            grid.FooterRow.TableSection = TableRowSection.TableFooter;
    }

    protected void preRenderGridView(Object sender, EventArgs e)
    {
        base.OnPreRender(e);
        MakeAccessible(gridRFQCountPerSharedItems);
    }
}

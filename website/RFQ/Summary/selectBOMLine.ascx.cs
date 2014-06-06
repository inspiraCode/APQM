using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_Summary_selectBOMLine : System.Web.UI.UserControl
{
    public event GridViewCommandEventHandler Row_Command;  
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
    public static void MakeAccessible(GridView grid)
    {
        if (grid.Rows.Count <= 0) return;
        grid.UseAccessibleHeader = true;
        grid.HeaderRow.TableSection = TableRowSection.TableHeader;
        if (grid.ShowFooter)
            grid.FooterRow.TableSection = TableRowSection.TableFooter;
    }
    public void gridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        Row_Command(sender, e);
    }
    protected void preRenderGridView(Object sender, EventArgs e)
    {
        base.OnPreRender(e);
        MakeAccessible(gridViewBOM);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void gridViewBOM_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataKey keys = gridViewBOM.DataKeys[e.Row.RowIndex];
            string one_selected = keys.Values[1].ToString();

            if (one_selected == "ONE_SELECTED")
            {
                e.Row.BackColor = System.Drawing.Color.FromArgb(255,215,0);
            }
        }
    }
}
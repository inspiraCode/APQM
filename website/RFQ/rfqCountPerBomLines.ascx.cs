using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_rfqCountPerBomLines : System.Web.UI.UserControl
{
    public event GridViewCommandEventHandler Row_Command;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void gridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        Row_Command(sender, e);
    }
    public void refreshGrid()
    {
        GridViewRFQCountPerBOMDetail.DataBind();
    }
}
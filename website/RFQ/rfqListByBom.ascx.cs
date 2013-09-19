using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_rfqListByBom : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void setBomID(long bomID) {
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

}
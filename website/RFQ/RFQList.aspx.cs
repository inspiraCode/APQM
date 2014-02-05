using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class RFQ_RFQList : System.Web.UI.Page
{
    private long bomDetailKeyFilter = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["RFQList_bomHeaderKeyFilter"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["RFQList_bomHeaderKeyFilter"] = bomDetailKeyFilter;
            uscRFQList.filterByBOMDetailKey(bomDetailKeyFilter);
        }
        else
        {
            uscRFQList.filterByBOMDetailKey(-1);
        }
    }
    private bool retrieveEntity()
    {
        string sBOMDetailKey = Request["bomComponent"];
        if (sBOMDetailKey != "" && sBOMDetailKey != null)
        {
            bomDetailKeyFilter = long.Parse(Request["bomComponent"]);
        }
        else
        {
            bomDetailKeyFilter = -1;
        }
        return true;
    }
    [WebMethod]
    public static void deleteByID()
    {
        string hola = "";
    }
}
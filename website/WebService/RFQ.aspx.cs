using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using System.Configuration;

public partial class WebService_RFQ : System.Web.UI.Page
{
    RfqCRUD rfq_CRUD = new RfqCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "delete":
                deleteRFQbyID(long.Parse(Request["id"]));
                return;
        }
    }

    public void deleteRFQbyID(long idRFQ)
    {
        string response = "{\"Result\":\"" + "OK" + "\"}";
        if (!rfq_CRUD.setActiveByID(idRFQ, 0))
        {
            response = "ERROR:" + rfq_CRUD.ErrorMessage;
        }
        Response.Clear();
        Response.Write(response);
        Response.End();
    }
}
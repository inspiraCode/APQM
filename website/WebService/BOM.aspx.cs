using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

public partial class WebService_BOM : System.Web.UI.Page
{
    bomCRUD bom_CRUD = new bomCRUD();
    bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
    RfqCRUD rfq_CRUD = new RfqCRUD();
    sifDetailCRUD sif_detail_CRUD = new sifDetailCRUD();
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "read":
                Response.Clear();
                Response.Write(getBOMbyID(long.Parse(Request["id"])));
                Response.End();
                return;
            case "save":
                Response.Clear();
                Response.Write(saveBOM());
                Response.End();
                return;
            case "delete":
                deleteBOMLinebyID(long.Parse(Request["id"]));
                return;
        }
    }
    private string getBOMbyID(long bomID)
    {
        BOM bomHeader = bom_CRUD.readById(bomID);

        if (bomHeader == null) bomHeader = new BOM();

        bomHeader.BomDetail = bomDetail_CRUD.readByParentID(bomID);

        foreach (BOMDetail bomLine in bomHeader.BomDetail)
        {
            bomLine.RFQList = rfq_CRUD.readByBOMDetailKey(bomLine.Id);
        }

        bomHeader.SifDetail = sif_detail_CRUD.readByParentID(bomHeader.SifId);

        return JsonConvert.SerializeObject(bomHeader);
    }
    private string saveBOM()
    {
        String s = new StreamReader(Request.InputStream).ReadToEnd();
        BOM bomHeader = JsonConvert.DeserializeObject<BOM>(s);


        /*Begin Transaction*/
        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        DM.Open_Connection("BOM Update");
        if (!bom_CRUD.update(bomHeader, ref DM))
        {
            return "ERROR:" + bom_CRUD.ErrorMessage;
        }

        foreach (BOMDetail bomLine in bomHeader.BomDetail)
        {
            if (bomLine.Id > 0)
            {
                if (!bomDetail_CRUD.update(bomLine, ref DM))
                {
                    return "ERROR:" + bomDetail_CRUD.ErrorMessage;
                }
            }
            else
            {
                if (!bomDetail_CRUD.create(bomLine, ref DM))
                {
                    return "ERROR:" + bomDetail_CRUD.ErrorMessage;
                }
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            return "ERROR:" + DM.Error_Mjs;
        }

        return getBOMbyID(bomHeader.Id);
    }
    public void deleteBOMLinebyID(long idBOMLine)
    {
        string response = "{\"Result\":\"" + "OK" + "\"}";
        if (!bomDetail_CRUD.setActive(idBOMLine, 0))
        {
            response = "ERROR:" + rfq_CRUD.ErrorMessage;
        }
        Response.Clear();
        Response.Write(response);
        Response.End();
    }
}
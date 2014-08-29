using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

public partial class WebService_SIF : System.Web.UI.Page
{
    sifCRUD sif_CRUD = new sifCRUD();
    sifDetailCRUD sifDetail_CRUD = new sifDetailCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "readbyuser":
                Response.Clear();
                Response.Write(readRFQsByUser(Request["user"]));
                Response.End();
                return;
            case "delete":
                deleteSIFbyID(long.Parse(Request["id"]));
                return;
            case "update":
                Response.Clear();
                Response.Write(saveSIF());
                Response.End();
                return;
            case "takeSIF":
                Response.Clear();
                Response.Write(takeSIF(long.Parse(Request["sif_id"])));
                Response.End();
                return;
        }
    }
    public string readRFQsByUser(string user)
    {
        GatewayResponse response = new GatewayResponse();

        String dateFrom = Request["dateFrom"];
        String dateTo = Request["dateTo"];

        List<SIF> result = new List<SIF>();

        if (user == "All") user = "";

        result = sif_CRUD.readByUserOrDates(user, dateFrom, dateTo);

        foreach (SIF current in result)
        {
            current.SifDetail = sifDetail_CRUD.readByParentID(current.Id);
        }

        response.ErrorThrown = false;
        response.ResponseDescription = "";
        response.Result = result;
        return JsonConvert.SerializeObject(response);
    }
    public void deleteSIFbyID(long id)
    {
        string response = "{\"Result\":\"" + "OK" + "\"}";
        if (!sif_CRUD.setActive(id, 0))
        {
            response = "ERROR:" + sif_CRUD.ErrorMessage;
        }
        Response.Clear();
        Response.Write(response);
        Response.End();
    }
    private SIF getSIFbyID(long sifID)
    {
        SIF SIFHeader = sif_CRUD.readById(sifID);

        if (SIFHeader == null) SIFHeader = new SIF();

        SIFHeader.SifDetail = sifDetail_CRUD.readByParentID(sifID);

        return SIFHeader;
    }
    private string saveSIF()
    {
        GatewayResponse response = new GatewayResponse();

        String s = new StreamReader(Request.InputStream).ReadToEnd();
        SIF sif = JsonConvert.DeserializeObject<SIF>(s);

        /*Begin Transaction*/
        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        DM.Open_Connection("SIF Update");
        if (!sif_CRUD.update(sif, ref DM))
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR:" + sif_CRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }

        if (!sifDetail_CRUD.deleteByParentID(sif.Id, ref DM))
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR:" + sifDetail_CRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }


        foreach (SIFDetail sifVolume in sif.SifDetail)
        {
            sifVolume.SifHeaderKey = sif.Id;
            if (!sifDetail_CRUD.create(sifVolume, ref DM))
            {
                response.ErrorThrown = true;
                response.ResponseDescription = "ERROR:" + sifDetail_CRUD.ErrorMessage;
                return JsonConvert.SerializeObject(response);
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR:" + DM.Error_Mjs;
            return JsonConvert.SerializeObject(response);
        }

        response.ErrorThrown = false;
        response.ResponseDescription = "SIF updated successfully.";
        response.Result = getSIFbyID(sif.Id);
        return JsonConvert.SerializeObject(response);
    }
    private string takeSIF(long sif_id)
    {
        GatewayResponse response = new GatewayResponse();

        String authUser = HttpContext.Current.User.Identity.Name;

        if (!sif_CRUD.take(sif_id, authUser))
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR:" + sif_CRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }

        response.ErrorThrown = false;
        response.ResponseDescription = "SIF assigned to: " + authUser;
        response.Result = authUser;
        return JsonConvert.SerializeObject(response);
    }
}
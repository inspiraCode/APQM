using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

public partial class WebService_Catalogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "read":
                string catalog = Request["catalog"];
                if (catalog != null)
                {
                    switch (catalog)
                    {
                        case "commodity":
                            Response.Clear();
                            Response.Write(getCommodities());
                            Response.End();
                            return;
                        case "supplier":
                            Response.Clear();
                            Response.Write(getSuppliers());
                            Response.End();
                            return;
                        case "marketsector":
                            Response.Clear();
                            Response.Write(getMarketSectors());
                            Response.End();
                            return;
                        case "user":
                            Response.Clear();
                            Response.Write(getUsers());
                            Response.End();
                            return;
                    }
                }
                return;
        }
    }
    private string getCommodities()
    {
        CommodityCRUD commodity_CRUD = new CommodityCRUD();
        List<Commodity> listCommodities =(List<Commodity>) commodity_CRUD.readAll();

        return JsonConvert.SerializeObject(listCommodities);
    }
    private string getSuppliers()
    {
        SupplierCRUD supplier_CRUD = new SupplierCRUD();
        List<Supplier> listSuppliers = (List<Supplier>) supplier_CRUD.readAll();

        return JsonConvert.SerializeObject(listSuppliers);
    }
    private string getMarketSectors()
    {
        MarketSectorCRUD marketSector_CRUD = new MarketSectorCRUD();
        List<MarketSector> listMarketSectors = (List<MarketSector>)marketSector_CRUD.readAll();

        return JsonConvert.SerializeObject(listMarketSectors);
    }
    private string getUsers()
    {
        UserCRUD user_CRUD = new UserCRUD();
        List<User> listUsers = (List<User>)user_CRUD.getUsersWithRFQ();

        return JsonConvert.SerializeObject(listUsers);
    }
}
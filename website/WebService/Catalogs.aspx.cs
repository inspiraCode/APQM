﻿using System;
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
        string catalog = Request["catalog"];

        switch (cmd)
        {
            case "read":
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
                        case "item": 
                            Response.Clear();
                            Response.Write(getItems());
                            Response.End();
                            return;
                        case "um":
                            Response.Clear();
                            Response.Write(getUMs());
                            Response.End();
                            return;
                        case "customer":
                            Response.Clear();
                            Response.Write(getCustomers());
                            Response.End();
                            return;
                    }
                }
                return;
            case "create":
                if (catalog != null)
                {
                    switch (catalog)
                    {
                        case "supplier":
                            Response.Clear();
                            Response.Write(createSupplier());
                            Response.End();
                            return;
                        case "marketsector":
                            Response.Clear();
                            Response.Write(createMarketSector());
                            Response.End();
                            return;
                        case "customer":
                            Response.Clear();
                            Response.Write(createCustomer());
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
    private string getItems()
    {
        itemCRUD item_CRUD = new itemCRUD();
        List<Item> listItems = (List<Item>) item_CRUD.readAll();

        return JsonConvert.SerializeObject(listItems);
    }
    private string getCustomers()
    {
        customerCRUD customer_CRUD = new customerCRUD();
        List<Customer> listCustomers = (List<Customer>)customer_CRUD.readAll();

        return JsonConvert.SerializeObject(listCustomers);
    }
    private string getUMs()
    {
        List<UM> result = new List<UM>();
        List<string> UMs = new List<string> { "each", "lb", "in", "ft", "yd", "mm", "cm", "m", "g", "kg", "oz", "lt", "gal", "cubic meter" };
        foreach(string umName in UMs){
            result.Add(new UM(){Um=umName});
        }
        
        return JsonConvert.SerializeObject(result);
    }
    public string createSupplier()
    {
        Supplier resultSupplier = new Supplier();
        GatewayResponse response = new GatewayResponse();
        String s;
        try
        {
            s = new StreamReader(Request.InputStream).ReadToEnd();
            resultSupplier = JsonConvert.DeserializeObject<Supplier>(s);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
            return JsonConvert.SerializeObject(response);
        }

        SupplierCRUD supplierCRUD= new SupplierCRUD();
        string idGenerated = supplierCRUD.createAndReturnIdGenerated(resultSupplier);
        if (supplierCRUD.ErrorOccur)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: " + supplierCRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }

        resultSupplier.Id = long.Parse(idGenerated);
        response.ErrorThrown = false;
        response.ResponseDescription = "Supplier created successfully.";
        response.Result = resultSupplier;
        return JsonConvert.SerializeObject(response);
    }
    public string createMarketSector()
    {
        MarketSector resultMarketSector = new MarketSector();
        GatewayResponse response = new GatewayResponse();
        String s;
        try
        {
            s = new StreamReader(Request.InputStream).ReadToEnd();
            resultMarketSector = JsonConvert.DeserializeObject<MarketSector>(s);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
            return JsonConvert.SerializeObject(response);
        }

        MarketSectorCRUD marketSectorCRUD = new MarketSectorCRUD();
        string idGenerated = marketSectorCRUD.createAndReturnIdGenerated(resultMarketSector);
        if (marketSectorCRUD.ErrorOccur)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: " + marketSectorCRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }

        resultMarketSector.Id = long.Parse(idGenerated);
        response.ErrorThrown = false;
        response.ResponseDescription = "Market Sector created successfully.";
        response.Result = resultMarketSector;
        return JsonConvert.SerializeObject(response);
    }
    public string createCustomer()
    {
        Customer resultCustomer = new Customer();
        GatewayResponse response = new GatewayResponse();
        String s;
        try
        {
            s = new StreamReader(Request.InputStream).ReadToEnd();
            resultCustomer = JsonConvert.DeserializeObject<Customer>(s);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
            return JsonConvert.SerializeObject(response);
        }

        customerCRUD customer_CRUD = new customerCRUD();
        string idGenerated = customer_CRUD.createAndReturnIdGenerated(resultCustomer);
        if (customer_CRUD.ErrorOccur)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: " + customer_CRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }

        resultCustomer.Id = long.Parse(idGenerated);
        response.ErrorThrown = false;
        response.ResponseDescription = "Customer created successfully.";
        response.Result = resultCustomer;
        return JsonConvert.SerializeObject(response);
    }
}
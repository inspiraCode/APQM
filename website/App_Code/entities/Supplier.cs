using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for supplier
/// </summary>
/// 
[Serializable]
public class Supplier
{
    private long id;
    private string supplierName;
    private string manufacturingLocation;
    private string shipLocation;
    private string quotedCurrency;
    private string contactName;
    private string contactPhone;
    private string contactEmail;
    private SupplierSurvey supplierSurvey;

    public Supplier()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public string SupplierName
    {
        get { return supplierName; }
        set { supplierName = value; }
    }
    public string ManufacturingLocation
    {
        get { return manufacturingLocation; }
        set { manufacturingLocation = value; }
    }

    public string ShipLocation
    {
        get { return shipLocation; }
        set { shipLocation = value; }
    }    

    public string QuotedCurrency
    {
        get { return quotedCurrency; }
        set { quotedCurrency = value; }
    }
    
    public string ContactName
    {
        get { return contactName; }
        set { contactName = value; }
    }    

    public string ContactPhone
    {
        get { return contactPhone; }
        set { contactPhone = value; }
    }
    
    public string ContactEmail
    {
        get { return contactEmail; }
        set { contactEmail = value; }
    }

    public SupplierSurvey SupplierSurvey
    {
        get { return supplierSurvey; }
        set { supplierSurvey = value; }
    }
}
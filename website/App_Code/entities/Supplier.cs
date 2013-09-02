using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for supplier
/// </summary>
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
}

public class SupplierSurvey
{
    private long id;
    private long supplierMasterKey;
    private string streetAddress; 
    private string city; 
    private string state;
    private string zipCode;
    private string website; 
    private DateTime lastSurvey; 
    private DateTime nDARec; 
    private string primaryBusiness; 
    private string secundaryBusiness;
    private int unionYN; 
    private string local;
    private string contractExpiration;
    private string currentCapacity;
    private string manufacturingMetod; 
    private int toolingNewInHouseYN; 
    private int toolingNewOutsourcedYN; 
    private int toolingInHouseYN; 
    private int toolingOutsourcedYN; 
    private string notes;


    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    
    public long SupplierMasterKey
    {
        get { return supplierMasterKey; }
        set { supplierMasterKey = value; }
    }
    

    public string StreetAddress
    {
        get { return streetAddress; }
        set { streetAddress = value; }
    }
    

    public string City
    {
        get { return city; }
        set { city = value; }
    }
    

    public string State
    {
        get { return state; }
        set { state = value; }
    }
    

    public string ZipCode
    {
        get { return zipCode; }
        set { zipCode = value; }
    }
    

    public string Website
    {
        get { return website; }
        set { website = value; }
    }
    

    public DateTime LastSurvey
    {
        get { return lastSurvey; }
        set { lastSurvey = value; }
    }
    

    public DateTime NDARec
    {
        get { return nDARec; }
        set { nDARec = value; }
    }
    

    public string PrimaryBusiness
    {
        get { return primaryBusiness; }
        set { primaryBusiness = value; }
    }
    

    public string SecundaryBusiness
    {
        get { return secundaryBusiness; }
        set { secundaryBusiness = value; }
    }
    

    public int UnionYN
    {
        get { return unionYN; }
        set { unionYN = value; }
    }
    

    public string Local
    {
        get { return local; }
        set { local = value; }
    }
    

    public string ContractExpiration
    {
        get { return contractExpiration; }
        set { contractExpiration = value; }
    }
    

    public string CurrentCapacity
    {
        get { return currentCapacity; }
        set { currentCapacity = value; }
    }
    

    public string ManufacturingMetod
    {
        get { return manufacturingMetod; }
        set { manufacturingMetod = value; }
    }
    

    public int ToolingNewInHouseYN
    {
        get { return toolingNewInHouseYN; }
        set { toolingNewInHouseYN = value; }
    }
    

    public int ToolingNewOutsourcedYN
    {
        get { return toolingNewOutsourcedYN; }
        set { toolingNewOutsourcedYN = value; }
    }
    

    public int ToolingInHouseYN
    {
        get { return toolingInHouseYN; }
        set { toolingInHouseYN = value; }
    }
    

    public int ToolingOutsourcedYN
    {
        get { return toolingOutsourcedYN; }
        set { toolingOutsourcedYN = value; }
    }
    

    public string Notes
    {
        get { return notes; }
        set { notes = value; }
    }

}

public class SupplierSurveyIndustriesSupplied
{
    private long id;
    private long supplierSurveyKey;
    private string industriesSupplied;

    public long Id
    {
        get { return id; }
        set { id = value; }
    }   

    public long SupplierSurveyKey
    {
        get { return supplierSurveyKey; }
        set { supplierSurveyKey = value; }
    }
    
    public string IndustriesSupplied
    {
        get { return industriesSupplied; }
        set { industriesSupplied = value; }
    }
}

public class SupplierSurveyForecastSales
{
    private long id;
    private long supplierSurveyKey;
    private string forecastSalesYear;
    private string forecastSales;

    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    
    public long SupplierSurveyKey
    {
        get { return supplierSurveyKey; }
        set { supplierSurveyKey = value; }
    }
    
    public string ForecastSalesYear
    {
        get { return forecastSalesYear; }
        set { forecastSalesYear = value; }
    }    

    public string ForecastSales
    {
        get { return forecastSales; }
        set { forecastSales = value; }
    }
}

public class SupplierSurveyContacts
{
    private long id;
    private long supplierSurveyKey;
    private string position; 
    private string name;
    private string title; 
    private string phone; 
    private string cell; 
    private string email;

    public long Id
    {
        get { return id; }
        set { id = value; }
    }    

    public long SupplierSurveyKey
    {
        get { return supplierSurveyKey; }
        set { supplierSurveyKey = value; }
    }    

    public string Position
    {
        get { return position; }
        set { position = value; }
    }    

    public string Name
    {
        get { return name; }
        set { name = value; }
    }    

    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    private string address;

    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    
    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }    

    public string Cell
    {
        get { return cell; }
        set { cell = value; }
    }    

    public string Email
    {
        get { return email; }
        set { email = value; }
    }
}
public class SupplierSurveyCertification
{
    private long id;
    private long supplierSurveyKey;
    private string certification;

    public long Id
    {
        get { return id; }
        set { id = value; }
    }   

    public long SupplierSurveyKey
    {
        get { return supplierSurveyKey; }
        set { supplierSurveyKey = value; }
    }  

    public string Certification
    {
        get { return certification; }
        set { certification = value; }
    }
}
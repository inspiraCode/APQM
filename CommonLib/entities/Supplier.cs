using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Supplier
{
    private long id;
    private string supplierName = "";
    private string manufacturingLocation = "";
    private string shipLocation = "";
    private string quotedCurrency = "";
    private string contactName = "";
    private string contactPhone = "";
    private string contactEmail = "";
    private string capabilities = "";
    private bool visible = true;
    private string comments = "";
    private string commodity = "";
    private string contactCellPhone = "";

   

    private SupplierSurvey supplierSurvey;
   
    public string NameAndEmail
    {
        get { return supplierName.Trim() + " - " + contactEmail.Trim(); }
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
    public string Capabilities
    {
        get { return capabilities; }
        set { capabilities = value; }
    }
    public string Comments
    {
        get { return comments; }
        set { comments = value; }
    }
    public bool Visible
    {
        get { return visible; }
        set { visible = value; }
    }
    public string Commodity
    {
        get { return commodity; }
        set { commodity = value; }
    }
    public SupplierSurvey SupplierSurvey
    {
        get { return supplierSurvey; }
        set { supplierSurvey = value; }
    }
    public string ContactCellPhone
    {
        get { return contactCellPhone; }
        set { contactCellPhone = value; }
    }
}
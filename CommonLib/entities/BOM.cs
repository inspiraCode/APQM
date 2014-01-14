using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BOM
/// </summary>
public class BOM
{
    private long id;
    private long sifId = -1;
    private string topPartNumber = "";
    private string partDescription = "";
    private string revision = "";
    private string inquiryNumber = "";
    private int annualVolume;
    private string salesPerson = "";
    private string customerName = "";
    private string marketSector = ""; //Read from SIF table in view.
    private string assignedTo = "";

    public string MarketSector
    {
        get { return marketSector; }
        set { marketSector = value; }
    }
    
    private List<BOMDetail> bomDetail;

    public List<BOMDetail> BomDetail
    {
        get { return bomDetail; }
        set { bomDetail = value; }
    }
    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long SifId
    {
        get { return sifId; }
        set { sifId = value; }
    }
    public string TopPartNumber
    {
        get { return topPartNumber; }
        set { topPartNumber = value; }
    }
    public string PartDescription
    {
        get { return partDescription; }
        set { partDescription = value; }
    }
    public string Revision
    {
        get { return revision; }
        set { revision = value; }
    }
    public string InquiryNumber
    {
        get { return inquiryNumber; }
        set { inquiryNumber = value; }
    }
    public int AnnualVolume
    {
        get { return annualVolume; }
        set { annualVolume = value; }
    }
    public string SalesPerson
    {
        get { return salesPerson; }
        set { salesPerson = value; }
    }
    public string CustomerName
    {
        get { return customerName; }
        set { customerName = value; }
    }
    public string AssignedTo
    {
        get { return assignedTo; }
        set { assignedTo = value; }
    }
    public override string ToString()
    {
        return "{Inquiry Number: " + this.inquiryNumber + " Top Part Number: " + this.topPartNumber + " Part Description: " + this.partDescription + "}";
    }
}

public class BOMDetail
{
    private long id = -1;
    private long bomHeaderKey = -1;
    private long itemMasterkey = -1;
    private float qty;
    private float cost;
    private string status = "";
    private string description = "";
    private string partNumber = "";
    private string um = "";
    private string itemMaterial = "";
    private string linePosition = "";
    private string salesStatus = "";
    private string user = ""; 
    private string purchasingStatus = "";
    private bool directedBuy;
    private string material = "";
    private string itemDescription = "";
    private string itemUm = "";
    private string vendorQuoteEst = "";
    private string salesComments = "";
    private string purchasingComments = "";
    private string capComAssm = "";
    private string capsonicPN = "";
    private string customerPN = ""; 
    private string manufacturePN = ""; 
    private string supplierPN = ""; 
    private string commCode = ""; 
    private string eau = "0";
    private List<BOMDetailVolume> volumeList;    

    public string CapsonicPN
    {
        get { return capsonicPN; }
        set { capsonicPN = value; }
    }
    public string CustomerPN
    {
        get { return customerPN; }
        set { customerPN = value; }
    }    
    public string ManufacturePN
    {
        get { return manufacturePN; }
        set { manufacturePN = value; }
    }
    public string SupplierPN
    {
        get { return supplierPN; }
        set { supplierPN = value; }
    }
    public string CommCode
    {
        get { return commCode; }
        set { commCode = value; }
    }
    public string EAU
    {
        get { return eau; }
        set { eau = value; }
    }
    public string ItemUm
    {
        get { return itemUm; }
        set { itemUm = value; }
    }
    
    //Fields not in database:
    private int sequence = -1;
    public string internalAction = "";
    
    private Item item;

    public string PartNumber
    {
        get { return partNumber; }
        set { partNumber = value; }
    }
    public string Um
    {
        get { return um; }
        set { um = value; }
    }
    public string Material
    {
        get { return material; }
        set { material = value; }
    }
    public int Sequence
    {
        get { return sequence; }
        set { sequence = value; }
    }
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public long BomHeaderKey
    {
        get { return bomHeaderKey; }
        set { bomHeaderKey = value; }
    }
    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long ItemMasterkey
    {
        get { return itemMasterkey; }
        set { itemMasterkey = value; }
    }
    public float Qty
    {
        get { return qty; }
        set { qty = value; }
    }
    public float Cost
    {
        get { return cost; }
        set { cost = value; }
    }
    public string Status
    {
        get { return status; }
        set { status = value; }
    }
    public Item Item
    {
        get { return item; }
        set { item = value; }
    }
    public string LinePosition
    {
        get { return linePosition; }
        set { linePosition = value; }
    }
    public string SalesStatus
    {
        get { return salesStatus; }
        set { salesStatus = value; }
    }
    public string PurchasingStatus
    {
        get { return purchasingStatus; }
        set { purchasingStatus = value; }
    }
    public string User
    {
        get { return user; }
        set { user = value; }
    }
    public bool DirectedBuy
    {
        get { return directedBuy; }
        set { directedBuy = value; }
    }
    public string ItemMaterial
    {
        get { return itemMaterial; }
        set { itemMaterial = value; }
    }
    public string ItemDescription
    {
        get { return itemDescription; }
        set { itemDescription = value; }
    }
    public string VendorQuoteEst
    {
        get { return vendorQuoteEst; }
        set { vendorQuoteEst = value; }
    }
    public string SalesComments
    {
        get { return salesComments; }
        set { salesComments = value; }
    }
    public string PurchasingComments
    {
        get { return purchasingComments; }
        set { purchasingComments = value; }
    }
    public string CapComAssm
    {
        get { return capComAssm; }
        set { capComAssm = value; }
    }
    public List<BOMDetailVolume> VolumeList
    {
        get { return volumeList; }
        set { volumeList = value; }
    }
    public override string ToString()
    {
        return "{Description: " + this.description + " Quantity: " + this.qty + " Cost: " + this.cost + " Status:" + salesStatus + "}";
    }
}

public class BOMDetailVolume
{
    private long id;
    private long bomDetailKey = -1;
    private long volume;


    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long BomDetailKey
    {
        get { return bomDetailKey; }
        set { bomDetailKey = value; }
    }
    public long Volume
    {
        get { return volume; }
        set { volume = value; }
    }
}
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

    public override string ToString()
    {
        return "{Inquiry Number: " + this.inquiryNumber + " Top Part Number: " + this.topPartNumber + " Part Description: " + this.partDescription + "}";
    }

}

public class BOMDetail
{
    private long id = -1;
    private string description = "";
    private long itemMasterkey = -1;
    private float qty;
    private float cost;
    private string status = "";
    private long bomHeaderKey = -1;
    private int sequence = -1;
    private string linePosition = "";
    private string salesStatus = "";
    private string purchasingStatus = "";
    private long userKey = -1; 
    private bool directedBuy;

    

    public string internalAction = "";

    private Item item;

    //Item fields wrong way:
    private string partNumber = "";
    private string um = "";
    private string material = "";

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
    //TODO implement this correct way:
    //private Item item;

    //public Item Item
    //{
    //    get { return item; }
    //    set { item = value; }
    //}

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
    public long UserKey
    {
        get { return userKey; }
        set { userKey = value; }
    }
    public bool DirectedBuy
    {
        get { return directedBuy; }
        set { directedBuy = value; }
    }
    //private long id = -1;
    //private string description = "";
    //private long itemMasterkey = -1;
    //private float qty;
    //private float cost;
    //private string status = "";
    //private long bomHeaderKey = -1;
    //private int sequence = -1;
    //private string linePosition = "";
    //private string salesStatus = "";
    public override string ToString()
    {
        return "{Description: " + this.description + " Quantity: " + this.qty + " Cost: " + this.cost + " Status:" + salesStatus + "}";
    }
}
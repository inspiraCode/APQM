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
    private long sifId;
    private string topPartNumber;
    private string partDescription;
    private string revision;
    private BOMDetail bomDetail;

    public BOMDetail BomDetail
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

}
public class BOMDetail
{
    private long id;
    private string description = "";
    private long itemMasterkey = -1;
    private float qty;
    private float cost;
    private string status = "";
    private long bomHeaderKey = -1;
    
    
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
}
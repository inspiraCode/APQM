using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RFQ
/// </summary>
public class RFQ
{
    private long id;
    private long bomDetailId = -1;
    private long supplierId = -1;
    private string rfqNumber = "";
    private string drawingLevel = "";
    private string estimatedAnnualVolume = "";
    private string productionLeadTime = "";
    private string productionToolingLeadTime = "";
    private string prototypeToolingLeadTime = "";
    private string prototypePieceLeadTime = "";
    private string toolingDetail = "";
    private float productionTooling = 0;
    private float prototypeTooling = 0;
    private float prototypePiece = 0; 
    private float sgAProfit = 0; 
    private long packingPerUnit = 0; 
    private float assemblyCostPerUnit = 0;
    private string status = "";
    private DateTime dueDate = new DateTime(1985, 2, 10);
    private DateTime sentToVendor = new DateTime(1985, 2, 10);
    private DateTime filledUp = new DateTime(1985, 2, 10);

    private string partNumber = ""; //From Item Master
    private DateTime deadDate = new DateTime(1985, 2, 10); //From TokenMaster
    private string acknowledgement;//From TokenMaster
    private string preparedBy = "";
    private string supplierName = "";
    
    private List<RFQDetail> rfqDetail;

    public string Status
    {
        get { return status; }
        set { status = value; }
    }
    public string PartNumber
    {
        get { return partNumber; }
        set { partNumber = value; }
    }
    public DateTime DeadDate
    {
        get { return deadDate; }
        set { deadDate = value; }
    }    
    public string Acknowledgement
    {
        get { return acknowledgement; }
        set { acknowledgement = value; }
    }
    public List<RFQDetail> RfqDetail
    {
        get { return rfqDetail; }
        set { rfqDetail = value; }
    }
    public DateTime DueDate
    {
        get { return dueDate; }
        set { dueDate = value; }
    }
    public DateTime SentToVendor
    {
        get { return sentToVendor; }
        set { sentToVendor = value; }
    }
    public DateTime FilledUp
    {
        get { return filledUp; }
        set { filledUp = value; }
    }
    public long BomDetailId
    {
        get { return bomDetailId; }
        set { bomDetailId = value; }
    }    
    public long SupplierId
    {
        get { return supplierId; }
        set { supplierId = value; }
    }    
    public string RfqNumber
    {
        get { return rfqNumber; }
        set { rfqNumber = value; }
    }   
    public string DrawingLevel
    {
        get { return drawingLevel; }
        set { drawingLevel = value; }
    }
    public string EstimatedAnnualVolume
    {
        get { return estimatedAnnualVolume; }
        set { estimatedAnnualVolume = value; }
    }
    public string ProductionLeadTime
    {
        get { return productionLeadTime; }
        set { productionLeadTime = value; }
    }    
    public string ProductionToolingLeadTime
    {
        get { return productionToolingLeadTime; }
        set { productionToolingLeadTime = value; }
    }
    public string PrototypeToolingLeadTime
    {
        get { return prototypeToolingLeadTime; }
        set { prototypeToolingLeadTime = value; }
    } 
    public string PrototypePieceLeadTime
    {
        get { return prototypePieceLeadTime; }
        set { prototypePieceLeadTime = value; }
    }
    public string ToolingDetail
    {
        get { return toolingDetail; }
        set { toolingDetail = value; }
    }
    public float ProductionTooling
    {
        get { return productionTooling; }
        set { productionTooling = value; }
    }
    public float PrototypeTooling
    {
        get { return prototypeTooling; }
        set { prototypeTooling = value; }
    }
    public float PrototypePiece
    {
        get { return prototypePiece; }
        set { prototypePiece = value; }
    }
    public float SgAProfit
    {
        get { return sgAProfit; }
        set { sgAProfit = value; }
    }
    public long PackingPerUnit
    {
        get { return packingPerUnit; }
        set { packingPerUnit = value; }
    }
    public float AssemblyCostPerUnit
    {
        get { return assemblyCostPerUnit; }
        set { assemblyCostPerUnit = value; }
    }    
    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public string PreparedBy
    {
        get { return preparedBy; }
        set { preparedBy = value; }
    }
    public string SupplierName
    {
        get { return supplierName; }
        set { supplierName = value; }
    }
}


public class RFQDetail
{
    private long id;
    private long rfqHeaderKey;
    private long itemMasterKey;
    private long rpcQty;
    private float rpcCostPerUnit;
    private long oSQty;
    private float oSCostPerUnit;
    private float scrapValue;
    private float directHrlyLaborRate;
    private int stdHrs;
    private float burden;
    private int sequence = -1;
    private string uom = "";
    private Item item;

    public string Uom
    {
        get { return uom; }
        set { uom = value; }
    }
    public float MaterialTotal
    {
        get { return rpcQty * rpcCostPerUnit; }
        
    }
    public float ServiceTotal
    {
        get { return oSQty * oSCostPerUnit; }
    }
    public float ScrapCost
    {
        get { return (MaterialTotal + ServiceTotal) * scrapValue; }
    }
    public float LaborCost
    {
        get { return directHrlyLaborRate * stdHrs; }
    }
    public float BurdenTotal
    {
        get { return burden; }
    }
    public Item Item
    {
        get { return item; }
        set { item = value; }
    }
    public int Sequence
    {
        get { return sequence; }
        set { sequence = value; }
    }
    public int StdHrs
    {
        get { return stdHrs; }
        set { stdHrs = value; }
    }   
    public long Id
    {
        get { return id; }
        set { id = value; }
    } 
    public long RfqHeaderKey
    {
        get { return rfqHeaderKey; }
        set { rfqHeaderKey = value; }
    }
    public long ItemMasterKey
    {
        get { return itemMasterKey; }
        set { itemMasterKey = value; }
    }
    public long RpcQty
    {
        get { return rpcQty; }
        set { rpcQty = value; }
    }
    public float RpcCostPerUnit
    {
        get { return rpcCostPerUnit; }
        set { rpcCostPerUnit = value; }
    }
    public long OSQty
    {
        get { return oSQty; }
        set { oSQty = value; }
    }
    public float OSCostPerUnit
    {
        get { return oSCostPerUnit; }
        set { oSCostPerUnit = value; }
    }
    public float ScrapValue
    {
        get { return scrapValue; }
        set { scrapValue = value; }
    }
    public float DirectHrlyLaborRate
    {
        get { return directHrlyLaborRate; }
        set { directHrlyLaborRate = value; }
    }
    public float Burden
    {
        get { return burden; }
        set { burden = value; }
    }
}
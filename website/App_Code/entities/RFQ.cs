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
    private long bomDetailId;
    private long supplierId;
    private string rfqNumber;
    private string drawingLevel; 
    private string estimatedAnnualVolume; 
    private string productionLeadTime; 
    private string productionToolingLeadTime; 
    private string prototypePieceLeadTime;
    private string toolingDetail; 
    private string productionTooling;
    private string prototypeTooling;
    private float prototypePiece; 
    private float sgAProfit; 
    private long packingPerUnit; 
    private float assemblyCostPerUnit;

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
    public string ProductionTooling
    {
        get { return productionTooling; }
        set { productionTooling = value; }
    }
    public string PrototypeTooling
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
    public RFQ()
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
}

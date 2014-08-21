using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class RFQ
{
    private long id;
    private long sifHeaderKey = -1;
    private long bomDetailId = -1;
    private long supplierId = -1;
    private long rfqNumberKey = -1;
    private string drawingLevel = "";
    private string prototypeToolingLeadTime = "";
    private string prototypePieceLeadTime = "";
    private string toolingDetail = "";
    private float productionTooling;
    private float prototypeTooling;
    private float prototypePiece; 
    private string status = "";
    private DateTime dueDate = new DateTime(1985, 2, 10);
    private DateTime sentToVendor = new DateTime(1985, 2, 10);
    private DateTime filledUp = new DateTime(1985, 2, 10);

    private string partNumber = ""; //From Item Master
    private DateTime deadDate = new DateTime(1985, 2, 10); //From TokenMaster
    private string acknowledgement;//From TokenMaster
    private string preparedBy = "";
    private string supplierName = ""; //From SupplierMaster
    private string manufacturingLocation = ""; 
    private string shipLocation = "";

    private string rfqGenerated = ""; //From RFQNumber

    private string moq = ""; 
    private float targetPrice = -1; //-1 means that buyer did not want to specify targetPrice 
    private bool noQuote = false;
    private long marketSectorID = -1;
    private string marketSectorName = "";

    private string commentsToBuyer = "";
    private string commentsToVendor = "";
    
    private bool iAgree = false; 
    private DateTime dateFilledOut = new DateTime(1985, 2, 10); 
    private string make = "";
    private string reasonNoQuote = "";
    private float weight;
    private string umWeight = "lb"; //always lb
    private string partMaterial = "";

    private string sentAttachmentsFolder = "";
    private string inboxAttachmentsFolder = "";

    private List<RFQAttachments> attachmentsToVendor;
    private List<RFQAttachments> attachmentsToBuyer;

    private User user;

    public User User
    {
        get { return user; }
        set { user = value; }
    }
    
   
    /******************************************************************/
    /*Those fields:****************************************************/
    //private string productionLeadTime = "";
    private string productionToolingLeadTime = "";
    //private string leadTimePPAP = "";

    /*will be replaced by the next three fields:*/
    private string leadTimePPAPFAIR = "";
    private string leadTimeFirstProductionOrder = "";
    private string leadTimeNormalProductionOrders = "";
    /*Requested by Seth************************************************/
    /******************************************************************/
    
    private string createdBy = "";
    private string cavitation = "";
    private string material = "";

    private string exceptionTo100ToPrint = "";
    private bool quote100ToPrint = false;

    private string lastEmail = "";

    private string um = "";

    private List<RFQACR> rfqAcr;
    private List<RFQEAV> rfqEAV;

    public long SifHeaderKey
    {
        get { return sifHeaderKey; }
        set { sifHeaderKey = value; }
    }
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
    public long RfqNumberKey
    {
        get { return rfqNumberKey; }
        set { rfqNumberKey = value; }
    }   
    public string DrawingLevel
    {
        get { return drawingLevel; }
        set { drawingLevel = value; }
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
    public List<RFQACR> RfqAcr
    {
        get { return rfqAcr; }
        set { rfqAcr = value; }
    }
    public string RfqGenerated
    {
        get { return rfqGenerated; }
        set { rfqGenerated = value; }
    }
    public List<RFQEAV> RfqEAV
    {
        get { return rfqEAV; }
        set { rfqEAV = value; }
    }
    public string Moq
    {
        get { return moq; }
        set { moq = value; }
    }
    public float TargetPrice
    {
        get { return targetPrice; }
        set { targetPrice = value; }
    }
    public bool NoQuote
    {
        get { return noQuote; }
        set { noQuote = value; }
    }
    public long MarketSectorID
    {
        get { return marketSectorID; }
        set { marketSectorID = value; }
    }
    public bool IAgree
    {
        get { return iAgree; }
        set { iAgree = value; }
    }
    public DateTime DateFilledOut
    {
        get { return dateFilledOut; }
        set { dateFilledOut = value; }
    }
    public string Make
    {
        get { return make; }
        set { make = value; }
    }
    public string ReasonNoQuote
    {
        get { return reasonNoQuote; }
        set { reasonNoQuote = value; }
    }
    public float Weight
    {
        get { return weight; }
        set { weight = value; }
    }
    public string CommentsToBuyer
    {
        get { return commentsToBuyer; }
        set { commentsToBuyer = value; }
    }
    public string CommentsToVendor
    {
        get { return commentsToVendor; }
        set { commentsToVendor = value; }
    }
    public string UmWeight
    {
        get { return umWeight; }
        set { umWeight = value; }
    }
    public string PartMaterial
    {
        get { return partMaterial; }
        set { partMaterial = value; }
    }
    public string SentAttachmentsFolder
    {
        get { return sentAttachmentsFolder; }
        set { sentAttachmentsFolder = value; }
    }
    public string InboxAttachmentsFolder
    {
        get { return inboxAttachmentsFolder; }
        set { inboxAttachmentsFolder = value; }
    }
    public string MarketSectorName
    {
        get { return marketSectorName; }
        set { marketSectorName = value; }
    }
    public string CreatedBy
    {
        get { return createdBy; }
        set { createdBy = value; }
    }
    public string Cavitation
    {
        get { return cavitation; }
        set { cavitation = value; }
    }
    public string Material
    {
        get { return material; }
        set { material = value; }
    }
    public string LeadTimePPAPFAIR
    {
        get { return leadTimePPAPFAIR; }
        set { leadTimePPAPFAIR = value; }
    }
    public string LeadTimeFirstProductionOrder
    {
        get { return leadTimeFirstProductionOrder; }
        set { leadTimeFirstProductionOrder = value; }
    }
    public string LeadTimeNormalProductionOrders
    {
        get { return leadTimeNormalProductionOrders; }
        set { leadTimeNormalProductionOrders = value; }
    }
    public List<RFQAttachments> AttachmentsToVendor
    {
        get { return attachmentsToVendor; }
        set { attachmentsToVendor = value; }
    }

    public List<RFQAttachments> AttachmentsToBuyer
    {
        get { return attachmentsToBuyer; }
        set { attachmentsToBuyer = value; }
    }
    public string ExceptionTo100ToPrint
    {
        get { return exceptionTo100ToPrint; }
        set { exceptionTo100ToPrint = value; }
    }

    public bool Quote100ToPrint
    {
        get { return quote100ToPrint; }
        set { quote100ToPrint = value; }
    }
    public string LastEmail
    {
        get { return lastEmail; }
        set { lastEmail = value; }
    }
    public string Um
    {
        get { return um; }
        set { um = value; }
    }
}

public class RFQEAV
{
    private long id;
    private long rfqHeaderKey = -1;
    private string year = "";
    private float volume;
    private float sgAProfit;
    private float packingPerUnit;
    private float assemblyCostPerUnit;
    private string moq = "";
    private string status = "";
    
    private List<RFQDetail> rfqDetail;

    public List<RFQDetail> RfqDetail
    {
        get { return rfqDetail; }
        set { rfqDetail = value; }
    }
    
    public string EAV_Year_Volume
    {
        get { return year + " - " + volume; } 
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
    public string Year
    {
        get { return year; }
        set { year = value; }
    }
    public float Volume
    {
        get { return volume; }
        set { volume = value; }
    }
    public float SgAProfit
    {
        get { return sgAProfit; }
        set { sgAProfit = value; }
    }
    public float PackingPerUnit
    {
        get { return packingPerUnit; }
        set { packingPerUnit = value; }
    }
    public float AssemblyCostPerUnit
    {
        get { return assemblyCostPerUnit; }
        set { assemblyCostPerUnit = value; }
    }
    public string Moq
    {
        get { return moq; }
        set { moq = value; }
    }
    public string Status
    {
        get { return status; }
        set { status = value; }
    }
}

public class RFQNumberEntity
{
    private long id;
    private long rfqNumber = -1;
    private long bomDetailKey = -1;
    private long sifHeaderKey = -1;
    private string inquireyNumber = "";
    private string rfqGenerated = "";

    public long Id
    {
        get { return id; }
        set { id = value; }
    }    
    public string InquireyNumber
    {
        get { return inquireyNumber; }
        set { inquireyNumber = value; }
    }
    public string RfqGenerated
    {
        get { return rfqGenerated; }
        set { rfqGenerated = value; }
    }
    public long RFQNumber
    {
        get { return rfqNumber; }
        set { rfqNumber = value; }
    }
    public long BOMDetailKey
    {
        get { return bomDetailKey; }
        set { bomDetailKey = value; }
    }
    public long SifHeaderKey
    {
        get { return sifHeaderKey; }
        set { sifHeaderKey = value; }
    }
}

[Serializable]
public class RFQDetail
{
    private long id;
    private long rfqEAVKey;
    private string itemDescription = "";
    private string um = "";
    private float rpcQty;
    private float rpcCostPerUnit;
    private float oSQty;
    private float oSCostPerUnit;
    private float scrapValue;
    private float directHrlyLaborRate;
    private float stdHrs;
    private float burden;
    private int sequence = -1;

    //Fields not in database:
    public string internalAction = "";


    public string Um
    {
        get { return um; }
        set { um = value; }
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
        get { return (MaterialTotal + ServiceTotal) * scrapValue / 100; }
    }
    public float LaborCost
    {
        get { return directHrlyLaborRate * stdHrs; }
    }
    public float BurdenTotal
    {
        get { return burden; }
    }
    public float ManufacturingCost
    {
        get { return MaterialTotal + ServiceTotal + ScrapCost +
                    LaborCost + BurdenTotal; }
    } 
    public int Sequence
    {
        get { return sequence; }
        set { sequence = value; }
    }
    public float StdHrs
    {
        get { return stdHrs; }
        set { stdHrs = value; }
    }   
    public long Id
    {
        get { return id; }
        set { id = value; }
    } 
    public long RfqEAVKey
    {
        get { return rfqEAVKey; }
        set { rfqEAVKey = value; }
    }
    public string ItemDescription
    {
        get { return itemDescription; }
        set { itemDescription = value; }
    }
    public float RpcQty
    {
        get { return rpcQty; }
        set { rpcQty = value; }
    }
    public float RpcCostPerUnit
    {
        get { return rpcCostPerUnit; }
        set { rpcCostPerUnit = value; }
    }
    public float OSQty
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

public class RFQACR
{
    private long id;
    private long rfqHeaderKey = -1;
    private int year; 
    private float porcentage;

    public string ACR_Year_Porcentage
    {
        get { return year + " - " + porcentage + "%"; }
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
    public int Year
    {
        get { return year; }
        set { year = value; }
    }
    public float Porcentage
    {
        get { return porcentage; }
        set { porcentage = value; }
    }
}

public class RFQSummaryHeader
{
    private long id = -1;
    private long bomDetailKey = -1; 
    private DateTime ppapDate = new DateTime(1985, 2, 10); 
    private float initialReleaseQty; 
    private DateTime initialReleaseDate = new DateTime(1985, 2, 10);
    private float prebuildQty; 
    private DateTime prebuildDate = new DateTime(1985, 2, 10);
    private string purchasingAllRecommendations = ""; 
    private string engineeringAllConcurrences = ""; 
    private string manufacturingAllConcurrences = ""; 
    private string qualityAllConcurrences = ""; 
    private string salesAllConcurrences = "";
    private string notes = "";
    private int eauSelectedForView; //Used for know what EAU to show in RFQ Summary page.
    private string recommendedSupplier = "";

    private List<RFQSummary> rfqSummaryList;

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
    public DateTime PpapDate
    {
        get { return ppapDate; }
        set { ppapDate = value; }
    }
    public float InitialReleaseQty
    {
        get { return initialReleaseQty; }
        set { initialReleaseQty = value; }
    }
    public DateTime InitialReleaseDate
    {
        get { return initialReleaseDate; }
        set { initialReleaseDate = value; }
    }
    public float PrebuildQty
    {
        get { return prebuildQty; }
        set { prebuildQty = value; }
    }
    public DateTime PrebuildDate
    {
        get { return prebuildDate; }
        set { prebuildDate = value; }
    }
    public string PurchasingAllRecommendations
    {
        get { return purchasingAllRecommendations; }
        set { purchasingAllRecommendations = value; }
    }
    public string EngineeringAllConcurrences
    {
        get { return engineeringAllConcurrences; }
        set { engineeringAllConcurrences = value; }
    }
    public string ManufacturingAllConcurrences
    {
        get { return manufacturingAllConcurrences; }
        set { manufacturingAllConcurrences = value; }
    }
    public string QualityAllConcurrences
    {
        get { return qualityAllConcurrences; }
        set { qualityAllConcurrences = value; }
    }
    public string SalesAllConcurrences
    {
        get { return salesAllConcurrences; }
        set { salesAllConcurrences = value; }
    }
    public string Notes
    {
        get { return notes; }
        set { notes = value; }
    }
    public List<RFQSummary> RfqSummaryList
    {
        get { return rfqSummaryList; }
        set { rfqSummaryList = value; }
    }
    public int EauSelectedForView
    {
        get { return eauSelectedForView; }
        set { eauSelectedForView = value; }
    }
    public string RecommendedSupplier
    {
        get { return recommendedSupplier; }
        set { recommendedSupplier = value; }
    }
}

public class RFQSummary
{
    private long id =-1;
    private long bomDetailKey = -1;
    private string rfqNumber = "";
    private long supplierKey = -1;
    private string supplierName = "";
    private float materialTotal;
    private float serviceTotal; //Material O/S
    private float scrapTotal;
    private float laborTotal;
    private float burdenTotal;
    private int sequence;
    private float tooling; //Production Tooling
    private string cavitation;
    private string materialTooling;
    private long rfqEAVKey = -1;
    private long rfqHeaderKey = -1;
    private float prototypeTooling;
    private string um = "";

    public float PrototypeTooling
    {
        get { return prototypeTooling; }
        set { prototypeTooling = value; }
    }

    public long RfqHeaderKey
    {
        get { return rfqHeaderKey; }
        set { rfqHeaderKey = value; }
    }

    public long RfqEAVKey
    {
        get { return rfqEAVKey; }
        set { rfqEAVKey = value; }
    }
    
    public float ManufacturingCost
    {
        get { return MaterialTotal + ServiceTotal + ScrapTotal + LaborTotal + BurdenTotal; }       
    }
    
    private float sgaProfit;
    private float packingPerUnit;
    private float assemblyCostPerUnit;
    
    public float TotalACost
    {
        get { return ManufacturingCost + SgaProfit + PackingPerUnit + AssemblyCostPerUnit;}
    }
    private float totalBCost;
    private float totalCCost;
    
    public float TotalAcquisitionCost
    {
        get { return TotalACost + TotalBCost + TotalCCost; }
    }
    private float estimatedAnnualVolume;

    private string calendarYear = "";

    public string CalendarYear
    {
        get { return calendarYear; }
        set { calendarYear = value; }
    }

    public float AnnualPurchaseCost
    {
        get { return TotalAcquisitionCost * EstimatedAnnualVolume; }
    }    
    private float eav;

    private string status;

    private string leadTimePPAPFAIR = "";
    private string leadTimeFirstProductionOrder = "";
    private string leadTimeNormalProductionOrders = "";

    private string eav_status = "";

    public string Eav_status
    {
        get { return eav_status; }
        set { eav_status = value; }
    }

    public string LeadTimePPAPFAIR
    {
        get { return leadTimePPAPFAIR; }
        set { leadTimePPAPFAIR = value; }
    }
    public string LeadTimeFirstProductionOrder
    {
        get { return leadTimeFirstProductionOrder; }
        set { leadTimeFirstProductionOrder = value; }
    }
    public string LeadTimeNormalProductionOrders
    {
        get { return leadTimeNormalProductionOrders; }
        set { leadTimeNormalProductionOrders = value; }
    }
    public float EAV
    {
        get { return eav; }
        set { eav = value; }
    }
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
    public string RfqNumber
    {
        get { return rfqNumber; }
        set { rfqNumber = value; }
    } 
    public long SupplierKey
    {
        get { return supplierKey; }
        set { supplierKey = value; }
    }
    public string SupplierName
    {
        get { return supplierName; }
        set { supplierName = value; }
    }
    public float MaterialTotal
    {
        get { return materialTotal; }
        set { materialTotal = value; }
    }
    public float ServiceTotal
    {
        get { return serviceTotal; }
        set { serviceTotal = value; }
    }
    public float ScrapTotal
    {
        get { return scrapTotal; }
        set { scrapTotal = value; }
    }
    public float LaborTotal
    {
        get { return laborTotal; }
        set { laborTotal = value; }
    }
    public float BurdenTotal
    {
        get { return burdenTotal; }
        set { burdenTotal = value; }
    }
    public float SgaProfit
    {
        get { return sgaProfit; }
        set { sgaProfit = value; }
    }
    public float PackingPerUnit
    {
        get { return packingPerUnit; }
        set { packingPerUnit = value; }
    }
    public float AssemblyCostPerUnit
    {
        get { return assemblyCostPerUnit; }
        set { assemblyCostPerUnit = value; }
    }
    public float EstimatedAnnualVolume
    {
        get { return estimatedAnnualVolume; }
        set { estimatedAnnualVolume = value; }
    }
    public float TotalBCost
    {
        get { return totalBCost; }
        set { totalBCost = value; }
    }
    public float TotalCCost
    {
        get { return totalCCost; }
        set { totalCCost = value; }
    }
   public string Status
    {
        get { return status; }
        set { status = value; }
    }
    public int Sequence
    {
        get { return sequence; }
        set { sequence = value; }
    }
    public float Tooling
    {
        get { return tooling; }
        set { tooling = value; }
    }
    public string Cavitation
    {
        get { return cavitation; }
        set { cavitation = value; }
    }
    public string MaterialTooling
    {
        get { return materialTooling; }
        set { materialTooling = value; }
    }
    public string Um
    {
        get { return um; }
        set { um = value; }
    }
}

public class RFQAttachments
{
    private string fileName = ""; 
    private string comments = "";
    private string directory = "";

    public string Directory
    {
        get { return directory; }
        set { directory = value; }
    }

    public string FileName
    {
        get { return fileName; }
        set { fileName = value; }
    }
    public string Comments
    {
        get { return comments; }
        set { comments = value; }
    }
}
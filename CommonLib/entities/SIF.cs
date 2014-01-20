using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class SIF
{
    private long id;
    private long customerKey = -1;
    private string customerName = "";
    private long bomId = -1;
    private string inquiryNumber = "";
    private string priority = "";
    private string revision = "";
    private string salesPerson = "";
    private string costModelLoc = "";
    private string contact = "";
    private string bussinesClass = "";
    private string product = "";
    private string divLoc = "";
    private string department = "";
    private string reason4Quote = "";
    private string application = "";
    private string specification = "";
    private string drawingLevel = "";
    private string taskDescription = "";
    private string partPrint = "";
    private string sample = "";
    private string toolingTarget = "";
    private string primaryCompetitors = "";
    private string specificResourceRequirements = "";
    private string technical = "";
    private string topPartNumber = "";
    private DateTime quoteDue = new DateTime(1985, 2, 10);
    private DateTime sop = new DateTime(1985, 2, 10);
    private string salesStatus = "";
    private long salesDBID = -1;
    private List<SIFDetail> sifDetail = new List<SIFDetail>();
    private string marketSector = ""; //Auxiliar when importing from sales db
    private long marketSectorID = -1;
    private string assignedTo = "";
    private DateTime createdDate = new DateTime(1985, 2, 10);
    private string createdIn = "";

    public List<SIFDetail> SifDetail
    {
        get { return sifDetail; }
        set { sifDetail = value; }
    }

    public string CustomerName
    {
        get { return customerName; }
        set { customerName = value; }
    }
    public string TopPartNumber
    {
        get { return topPartNumber; }
        set { topPartNumber = value; }
    }
    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long CustomerKey
    {
        get { return customerKey; }
        set { customerKey = value; }
    }
    public long BomId
    {
        get { return bomId; }
        set { bomId = value; }
    }
    public string InquiryNumber
    {
        get { return inquiryNumber; }
        set { inquiryNumber = value; }
    }
    public string Priority
    {
        get { return priority; }
        set { priority = value; }
    }
    public string Revision
    {
        get { return revision; }
        set { revision = value; }
    }
    public string SalesPerson
    {
        get { return salesPerson; }
        set { salesPerson = value; }
    }
    public string CostModelLoc
    {
        get { return costModelLoc; }
        set { costModelLoc = value; }
    }
    public string Contact
    {
        get { return contact; }
        set { contact = value; }
    }
    public string BussinesClass
    {
        get { return bussinesClass; }
        set { bussinesClass = value; }
    }
    public string Product
    {
        get { return product; }
        set { product = value; }
    }
    public string DivLoc
    {
        get { return divLoc; }
        set { divLoc = value; }
    }
    public string Department
    {
        get { return department; }
        set { department = value; }
    }
    public string Reason4Quote
    {
        get { return reason4Quote; }
        set { reason4Quote = value; }
    }
    public string Application
    {
        get { return application; }
        set { application = value; }
    }
    public string Specification
    {
        get { return specification; }
        set { specification = value; }
    }
    public string DrawingLevel
    {
        get { return drawingLevel; }
        set { drawingLevel = value; }
    }
    public string TaskDescription
    {
        get { return taskDescription; }
        set { taskDescription = value; }
    }
    public string PartPrint
    {
        get { return partPrint; }
        set { partPrint = value; }
    }
    public string Sample
    {
        get { return sample; }
        set { sample = value; }
    }
    public string ToolingTarget
    {
        get { return toolingTarget; }
        set { toolingTarget = value; }
    }
    public string PrimaryCompetitors
    {
        get { return primaryCompetitors; }
        set { primaryCompetitors = value; }
    }
    public string SpecificResourceRequirements
    {
        get { return specificResourceRequirements; }
        set { specificResourceRequirements = value; }
    }
    public string Technical
    {
        get { return technical; }
        set { technical = value; }
    }

    public DateTime QuoteDue
    {
        get { return quoteDue; }
        set { quoteDue = value; }
    }
    public DateTime Sop
    {
        get { return sop; }
        set { sop = value; }
    }
    public string SalesStatus
    {
        get { return salesStatus; }
        set { salesStatus = value; }
    }
    public long SalesDBID
    {
        get { return salesDBID; }
        set { salesDBID = value; }
    }
    public string MarketSector
    {
        get { return marketSector; }
        set { marketSector = value; }
    }
    public long MarketSectorID
    {
        get { return marketSectorID; }
        set { marketSectorID = value; }
    }
    public string AssignedTo
    {
        get { return assignedTo; }
        set { assignedTo = value; }
    }
    public DateTime CreatedDate
    {
        get { return createdDate; }
        set { createdDate = value; }
    }
    public string CreatedIn
    {
        get { return createdIn; }
        set { createdIn = value; }
    }
    public override string ToString()
    {
        return "{Inquiry Number: " + this.InquiryNumber + " Revision: " + this.Revision + " Product: " + this.Product + " Sales Person: " + this.SalesPerson + "}";
    }
}

public class SIFDetail
{
    private long id;
    private long sifHeaderKey = -1;
    private string programYear = ""; 
    private long projectedAnnualVolume;
    private float percentVolumePerAward;
    private float projectedTargetPrice;
    private float annualRevenue;
    private int sequence;

    public int Sequence
    {
        get { return sequence; }
        set { sequence = value; }
    }

    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long SifHeaderKey
    {
        get { return sifHeaderKey; }
        set { sifHeaderKey = value; }
    }
    public string ProgramYear
    {
        get { return programYear; }
        set { programYear = value; }
    }
    public long ProjectedAnnualVolume
    {
        get { return projectedAnnualVolume; }
        set { projectedAnnualVolume = value; }
    }
    public float PercentVolumePerAward
    {
        get { return percentVolumePerAward; }
        set { percentVolumePerAward = value; }
    }
    public float ProjectedTargetPrice
    {
        get { return projectedTargetPrice; }
        set { projectedTargetPrice = value; }
    }
    public float AnnualRevenue
    {
        get { return annualRevenue; }
        set { annualRevenue = value; }
    }
}
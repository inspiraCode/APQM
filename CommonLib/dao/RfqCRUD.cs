using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for RFQ.
/// </summary>
public class RfqCRUD : ICRUD<RFQ>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public RfqCRUD()
	{}
    
    #region ICRUD<RFQ> Members

    public bool create(RFQ entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            DM.Load_SP_Parameters("@EstimatedAnnualVolume", entity.EstimatedAnnualVolume);
            DM.Load_SP_Parameters("@PrototypePiece", entity.PrototypePiece.ToString());
            DM.Load_SP_Parameters("@SG_A_Profit", entity.SgAProfit.ToString());
            DM.Load_SP_Parameters("@PackingPerUnit", entity.PackingPerUnit.ToString());
            DM.Load_SP_Parameters("@AssemblyCostPerUnit", entity.AssemblyCostPerUnit.ToString());
            DM.Load_SP_Parameters("@RFQNumberKey", entity.RfqNumberKey.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status.ToString());
            DM.Load_SP_Parameters("@DueDate", entity.DueDate.ToString());
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@FilledUp", entity.FilledUp.ToString());
            DM.Load_SP_Parameters("@PreparedBy", entity.PreparedBy.ToString());
            DM.Load_SP_Parameters("@MOQ", entity.Moq);
            DM.Load_SP_Parameters("@TargetPrice", entity.TargetPrice.ToString());
            DM.Load_SP_Parameters("@NoQuote", entity.NoQuote.ToString());
            DM.Load_SP_Parameters("@MarketSector", entity.MarketSectorID.ToString());
            DM.Load_SP_Parameters("@CommentsToBuyer", entity.CommentsToBuyer);
            DM.Load_SP_Parameters("@CommentsToVendor", entity.CommentsToVendor);
            DM.Load_SP_Parameters("@IAgree", entity.IAgree.ToString());
            DM.Load_SP_Parameters("@DateFilledOut", entity.DateFilledOut.ToString());
            DM.Load_SP_Parameters("@Make", entity.Make);
            DM.Load_SP_Parameters("@ReasonNoQuote", entity.ReasonNoQuote);
            DM.Load_SP_Parameters("@Weight", entity.Weight.ToString());
            DM.Load_SP_Parameters("@UMWeight", entity.UmWeight.ToString());
            DM.Load_SP_Parameters("@AttachmentsFolder", entity.SentAttachmentsFolder);
            DM.Load_SP_Parameters("@LeadTimePPAP", entity.LeadTimePPAP);
            DM.Load_SP_Parameters("@AttachmentsFolderVendor", entity.InboxAttachmentsFolder);
            
            result = DM.Execute_StoreProcedure("RFQHeader_NewRFQ", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }       

        return result;
    }
    public string createAndReturnIdGenerated(RFQ entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            DM.Load_SP_Parameters("@EstimatedAnnualVolume", entity.EstimatedAnnualVolume);
            DM.Load_SP_Parameters("@PrototypePiece", entity.PrototypePiece.ToString());
            DM.Load_SP_Parameters("@SG_A_Profit", entity.SgAProfit.ToString());
            DM.Load_SP_Parameters("@PackingPerUnit", entity.PackingPerUnit.ToString());
            DM.Load_SP_Parameters("@AssemblyCostPerUnit", entity.AssemblyCostPerUnit.ToString());
            DM.Load_SP_Parameters("@RFQNumberKey", entity.RfqNumberKey.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status.ToString());
            DM.Load_SP_Parameters("@DueDate", entity.DueDate.ToString());
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@FilledUp", entity.FilledUp.ToString());
            DM.Load_SP_Parameters("@PreparedBy", entity.PreparedBy.ToString());
            DM.Load_SP_Parameters("@MOQ", entity.Moq);
            DM.Load_SP_Parameters("@TargetPrice", entity.TargetPrice.ToString());
            DM.Load_SP_Parameters("@NoQuote", entity.NoQuote.ToString());
            DM.Load_SP_Parameters("@MarketSector", entity.MarketSectorID.ToString());
            DM.Load_SP_Parameters("@CommentsToBuyer", entity.CommentsToBuyer);
            DM.Load_SP_Parameters("@CommentsToVendor", entity.CommentsToVendor);
            DM.Load_SP_Parameters("@IAgree", entity.IAgree.ToString());
            DM.Load_SP_Parameters("@DateFilledOut", entity.DateFilledOut.ToString());
            DM.Load_SP_Parameters("@Make", entity.Make);
            DM.Load_SP_Parameters("@ReasonNoQuote", entity.ReasonNoQuote);
            DM.Load_SP_Parameters("@Weight", entity.Weight.ToString());
            DM.Load_SP_Parameters("@UMWeight", entity.UmWeight.ToString());
            DM.Load_SP_Parameters("@AttachmentsFolder", entity.SentAttachmentsFolder);
            DM.Load_SP_Parameters("@LeadTimePPAP", entity.LeadTimePPAP);
            DM.Load_SP_Parameters("@AttachmentsFolderVendor", entity.InboxAttachmentsFolder);

            idGenerated = DM.Execute_StoreProcedure_Scalar("RFQHeader_NewRFQ", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }
    public string createAndReturnIdGenerated(RFQ entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            DM.Load_SP_Parameters("@EstimatedAnnualVolume", entity.EstimatedAnnualVolume);
            DM.Load_SP_Parameters("@PrototypePiece", entity.PrototypePiece.ToString());
            DM.Load_SP_Parameters("@SG_A_Profit", entity.SgAProfit.ToString());
            DM.Load_SP_Parameters("@PackingPerUnit", entity.PackingPerUnit.ToString());
            DM.Load_SP_Parameters("@AssemblyCostPerUnit", entity.AssemblyCostPerUnit.ToString());
            DM.Load_SP_Parameters("@RFQNumberKey", entity.RfqNumberKey.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status.ToString());
            DM.Load_SP_Parameters("@DueDate", entity.DueDate.ToString());
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@FilledUp", entity.FilledUp.ToString());
            DM.Load_SP_Parameters("@PreparedBy", entity.PreparedBy.ToString());
            DM.Load_SP_Parameters("@MOQ", entity.Moq);
            DM.Load_SP_Parameters("@TargetPrice", entity.TargetPrice.ToString());
            DM.Load_SP_Parameters("@NoQuote", entity.NoQuote.ToString());
            DM.Load_SP_Parameters("@MarketSector", entity.MarketSectorID.ToString());
            DM.Load_SP_Parameters("@CommentsToBuyer", entity.CommentsToBuyer);
            DM.Load_SP_Parameters("@CommentsToVendor", entity.CommentsToVendor);
            DM.Load_SP_Parameters("@IAgree", entity.IAgree.ToString());
            DM.Load_SP_Parameters("@DateFilledOut", entity.DateFilledOut.ToString());
            DM.Load_SP_Parameters("@Make", entity.Make);
            DM.Load_SP_Parameters("@ReasonNoQuote", entity.ReasonNoQuote);
            DM.Load_SP_Parameters("@Weight", entity.Weight.ToString());
            DM.Load_SP_Parameters("@UMWeight", entity.UmWeight.ToString());
            DM.Load_SP_Parameters("@AttachmentsFolder", entity.SentAttachmentsFolder);
            DM.Load_SP_Parameters("@LeadTimePPAP", entity.LeadTimePPAP);
            DM.Load_SP_Parameters("@AttachmentsFolderVendor", entity.InboxAttachmentsFolder);

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("RFQHeader_NewRFQ", true);
            
            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;

        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }
    public RFQ readById(long id)
    {
        RFQ rfq = new RFQ();
        
        string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumberKey, DrawingLevel, EstimatedAnnualVolume, " +
            "ProductionLeadTime, ProductionToolingLeadTime, PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, " +
            "PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, AssemblyCostPerUnit,Status, DueDate, SentToVendor, FilledUp, PartNumber, " + 
            "DeadDate, Acknowledgement, SupplierName, ManufacturingLocation, ShipLocation, PreparedBy, RFQGenerated, " +
            "MOQ, TargetPrice, NoQuote, MarketSector, CommentsToBuyer, CommentsToVendor, IAgree, DateFilledOut, Make, ReasonNoQuote, Weight, UMWeight, " +
            "Material, SIFHeaderKey, AttachmentsFolder, LeadTimePPAP, AttachmentsFolderVendor, MarketSectorName FROM viewRFQHeader_ReadAll " + 
            "WHERE (RFQHeaderKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                rfq.Id = long.Parse(table.Rows[0][0].ToString());
                rfq.BomDetailId = long.Parse(table.Rows[0][1].ToString());
                rfq.SupplierId = long.Parse(table.Rows[0][2].ToString());
                rfq.RfqNumberKey = long.Parse(table.Rows[0][3].ToString());
                rfq.DrawingLevel = table.Rows[0][4].ToString();
                rfq.EstimatedAnnualVolume = table.Rows[0][5].ToString();
                rfq.ProductionLeadTime = (table.Rows[0][6].ToString());
                rfq.ProductionToolingLeadTime = table.Rows[0][7].ToString();
                rfq.PrototypeToolingLeadTime = table.Rows[0][8].ToString();
                rfq.PrototypePieceLeadTime = table.Rows[0][9].ToString();
                rfq.ToolingDetail = table.Rows[0][10].ToString();
                rfq.ProductionTooling = float.Parse(table.Rows[0][11].ToString());
                rfq.PrototypeTooling = float.Parse(table.Rows[0][12].ToString());
                rfq.PrototypePiece = float.Parse(table.Rows[0][13].ToString());
                rfq.SgAProfit = float.Parse(table.Rows[0][14].ToString());
                rfq.PackingPerUnit = float.Parse(table.Rows[0][15].ToString());
                rfq.AssemblyCostPerUnit = float.Parse(table.Rows[0][16].ToString());
                rfq.Status = table.Rows[0][17].ToString();
                rfq.DueDate = DateTime.Parse(table.Rows[0][18].ToString());
                rfq.SentToVendor = DateTime.Parse(table.Rows[0][19].ToString());
                rfq.FilledUp = DateTime.Parse(table.Rows[0][20].ToString());
                rfq.PartNumber = table.Rows[0][21].ToString();
                rfq.DeadDate = DateTime.Parse(table.Rows[0][22].ToString());
                rfq.Acknowledgement = table.Rows[0][23].ToString();
                rfq.SupplierName = table.Rows[0][24].ToString();
                rfq.ManufacturingLocation = table.Rows[0][25].ToString();
                rfq.ShipLocation = table.Rows[0][26].ToString();
                rfq.PreparedBy = table.Rows[0][27].ToString();
                rfq.RfqGenerated = table.Rows[0][28].ToString();
                rfq.Moq = table.Rows[0][29].ToString();
                rfq.TargetPrice = float.Parse(table.Rows[0][30].ToString());
                rfq.NoQuote = bool.Parse(table.Rows[0][31].ToString());
                rfq.MarketSectorID = long.Parse(table.Rows[0][32].ToString());
                rfq.CommentsToBuyer = table.Rows[0][33].ToString();
                rfq.CommentsToVendor = table.Rows[0][34].ToString();
                rfq.IAgree = bool.Parse( table.Rows[0][35].ToString());
                rfq.DateFilledOut = DateTime.Parse(table.Rows[0][36].ToString());
                rfq.Make = table.Rows[0][37].ToString();
                rfq.ReasonNoQuote = table.Rows[0][38].ToString();
                rfq.Weight = float.Parse(table.Rows[0][39].ToString());
                rfq.UmWeight = table.Rows[0][40].ToString();
                rfq.PartMaterial = table.Rows[0][41].ToString();
                rfq.SifHeaderKey = long.Parse(table.Rows[0][42].ToString());
                rfq.SentAttachmentsFolder = table.Rows[0][43].ToString();
                rfq.LeadTimePPAP = table.Rows[0][44].ToString();
                rfq.InboxAttachmentsFolder = table.Rows[0][45].ToString();
                rfq.MarketSectorName = table.Rows[0][46].ToString();
                    
                sqlConnection.Dispose();
                return rfq;
            }
        }
        return null;
    }
    public List<RFQ> readByBOMDetailKey(long id)
    {
        List<RFQ> recordset = new List<RFQ>();
        recordset.Clear();
        
        string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumberKey, DrawingLevel, EstimatedAnnualVolume, " +
            "ProductionLeadTime, ProductionToolingLeadTime, PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, " +
            "PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, AssemblyCostPerUnit,Status, DueDate, SentToVendor, FilledUp, PartNumber, " +
            "DeadDate, Acknowledgement, SupplierName, ManufacturingLocation, ShipLocation, PreparedBy, RFQGenerated, " +
            "MOQ, TargetPrice, NoQuote, MarketSector, CommentsToBuyer, CommentsToVendor, IAgree, DateFilledOut, Make, ReasonNoQuote, Weight, UMWeight, " +
            "Material, SIFHeaderKey, AttachmentsFolder, LeadTimePPAP, AttachmentsFolderVendor, MarketSectorName FROM viewRFQHeader_ReadAll " +
            "WHERE (BOMDetailKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)        
            {
                RFQ rfq = new RFQ();
                rfq.Id = long.Parse(table.Rows[i][0].ToString());
                rfq.BomDetailId = long.Parse(table.Rows[i][1].ToString());
                rfq.SupplierId = long.Parse(table.Rows[i][2].ToString());
                rfq.RfqNumberKey = long.Parse(table.Rows[i][3].ToString());
                rfq.DrawingLevel = table.Rows[i][4].ToString();
                rfq.EstimatedAnnualVolume = table.Rows[i][5].ToString();
                rfq.ProductionLeadTime = (table.Rows[i][6].ToString());
                rfq.ProductionToolingLeadTime = table.Rows[i][7].ToString();
                rfq.PrototypeToolingLeadTime = table.Rows[i][8].ToString();
                rfq.PrototypePieceLeadTime = table.Rows[i][9].ToString();
                rfq.ToolingDetail = table.Rows[i][10].ToString();
                rfq.ProductionTooling = float.Parse(table.Rows[i][11].ToString());
                rfq.PrototypeTooling = float.Parse(table.Rows[i][12].ToString());
                rfq.PrototypePiece = float.Parse(table.Rows[i][13].ToString());
                rfq.SgAProfit = float.Parse(table.Rows[i][14].ToString());
                rfq.PackingPerUnit = float.Parse(table.Rows[i][15].ToString());
                rfq.AssemblyCostPerUnit = float.Parse(table.Rows[i][16].ToString());
                rfq.Status = table.Rows[i][17].ToString();
                rfq.DueDate = DateTime.Parse(table.Rows[i][18].ToString());
                rfq.SentToVendor = DateTime.Parse(table.Rows[i][19].ToString());
                rfq.FilledUp = DateTime.Parse(table.Rows[i][20].ToString());
                rfq.PartNumber = table.Rows[i][21].ToString();
                rfq.DeadDate = DateTime.Parse(table.Rows[i][22].ToString());
                rfq.Acknowledgement = table.Rows[i][23].ToString();
                rfq.SupplierName = table.Rows[i][24].ToString();
                rfq.ManufacturingLocation = table.Rows[i][25].ToString();
                rfq.ShipLocation = table.Rows[i][26].ToString();
                rfq.PreparedBy = table.Rows[i][27].ToString();
                rfq.RfqGenerated = table.Rows[i][28].ToString();
                rfq.Moq = table.Rows[i][29].ToString();
                rfq.TargetPrice = float.Parse(table.Rows[i][30].ToString());
                rfq.NoQuote = bool.Parse(table.Rows[i][31].ToString());
                rfq.MarketSectorID = long.Parse(table.Rows[i][32].ToString());
                rfq.CommentsToBuyer = table.Rows[i][33].ToString();
                rfq.CommentsToVendor = table.Rows[i][34].ToString();
                rfq.IAgree = bool.Parse(table.Rows[i][35].ToString());
                rfq.DateFilledOut = DateTime.Parse(table.Rows[i][36].ToString());
                rfq.Make = table.Rows[i][37].ToString();
                rfq.ReasonNoQuote = table.Rows[i][38].ToString();
                rfq.Weight = float.Parse(table.Rows[i][39].ToString());
                rfq.UmWeight = table.Rows[i][40].ToString();
                rfq.PartMaterial = table.Rows[i][41].ToString();
                rfq.SifHeaderKey = long.Parse(table.Rows[i][42].ToString());
                rfq.SentAttachmentsFolder = table.Rows[i][43].ToString();
                rfq.LeadTimePPAP = table.Rows[i][44].ToString();
                rfq.InboxAttachmentsFolder = table.Rows[i][45].ToString();
                rfq.MarketSectorName = table.Rows[i][46].ToString();
                recordset.Add(rfq);
            }
        }
        return recordset;
    }
    public IList<RFQ> readAll()
    {
        List<RFQ>  recordset = new List<RFQ>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumberKey, DrawingLevel, " 
                    + "EstimatedAnnualVolume, ProductionLeadTime, ProductionToolingLeadTime, " +
                      "PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, "
                    + "PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, " 
                    + "AssemblyCostPerUnit, Status, DueDate, SentToVendor, FilledUp, PartNumber, DeadDate, " 
                    + "Acknowledgement, SupplierName, ManufacturingLocation, ShipLocation, PreparedBy, RFQGenerated, " +
                      "MOQ, TargetPrice, NoQuote, MarketSector, CommentsToBuyer, CommentsToVendor, IAgree, DateFilledOut, " +
                      "Make, ReasonNoQuote, Weight, UMWeight, Material, SIFHeaderKey, AttachmentsFolder, LeadTimePPAP, " +
                      "AttachmentsFolderVendor, MarketSectorName FROM viewRFQHeader_ReadAll";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQ rfq = new RFQ();
            rfq.Id = long.Parse(table.Rows[i][0].ToString());
            rfq.BomDetailId = long.Parse(table.Rows[i][1].ToString());
            rfq.SupplierId = long.Parse(table.Rows[i][2].ToString());
            rfq.RfqNumberKey = long.Parse(table.Rows[i][3].ToString());
            rfq.DrawingLevel = table.Rows[i][4].ToString();
            rfq.EstimatedAnnualVolume = table.Rows[i][5].ToString();
            rfq.ProductionLeadTime = (table.Rows[i][6].ToString());
            rfq.ProductionToolingLeadTime = table.Rows[i][7].ToString();
            rfq.PrototypeToolingLeadTime = table.Rows[i][8].ToString();
            rfq.PrototypePieceLeadTime = table.Rows[i][9].ToString();
            rfq.ToolingDetail = table.Rows[i][10].ToString();
            rfq.ProductionTooling = float.Parse(table.Rows[i][11].ToString());
            rfq.PrototypeTooling = float.Parse(table.Rows[i][12].ToString());
            rfq.PrototypePiece = float.Parse(table.Rows[i][13].ToString());
            rfq.SgAProfit = float.Parse(table.Rows[i][14].ToString());
            rfq.PackingPerUnit = float.Parse(table.Rows[i][15].ToString());
            rfq.AssemblyCostPerUnit = float.Parse(table.Rows[i][16].ToString());
            rfq.Status = table.Rows[i][17].ToString();
            rfq.DueDate = DateTime.Parse(table.Rows[i][18].ToString());
            rfq.SentToVendor = DateTime.Parse(table.Rows[i][19].ToString());
            rfq.FilledUp = DateTime.Parse(table.Rows[i][20].ToString());
            rfq.PartNumber = table.Rows[i][21].ToString();
            rfq.DeadDate = DateTime.Parse(table.Rows[i][22].ToString());
            rfq.Acknowledgement = table.Rows[i][23].ToString();
            rfq.SupplierName = table.Rows[i][24].ToString();
            rfq.ManufacturingLocation = table.Rows[i][25].ToString();
            rfq.ShipLocation = table.Rows[i][26].ToString();
            rfq.PreparedBy = table.Rows[i][27].ToString();
            rfq.RfqGenerated = table.Rows[i][28].ToString();
            rfq.Moq = table.Rows[i][29].ToString();
            rfq.TargetPrice = float.Parse(table.Rows[i][30].ToString());
            rfq.NoQuote = bool.Parse(table.Rows[i][31].ToString());
            rfq.MarketSectorID = long.Parse(table.Rows[i][32].ToString());
            rfq.CommentsToBuyer = table.Rows[i][33].ToString();
            rfq.CommentsToVendor = table.Rows[i][34].ToString();
            rfq.IAgree = bool.Parse(table.Rows[i][35].ToString());
            rfq.DateFilledOut = DateTime.Parse(table.Rows[i][36].ToString());
            rfq.Make = table.Rows[i][37].ToString();
            rfq.ReasonNoQuote = table.Rows[i][38].ToString();
            rfq.Weight = float.Parse(table.Rows[i][39].ToString());
            rfq.UmWeight = table.Rows[i][40].ToString();
            rfq.PartMaterial = table.Rows[i][41].ToString();
            rfq.SifHeaderKey = long.Parse(table.Rows[i][42].ToString());
            rfq.SentAttachmentsFolder = table.Rows[i][43].ToString();
            rfq.LeadTimePPAP = table.Rows[i][44].ToString();
            rfq.InboxAttachmentsFolder = table.Rows[i][45].ToString();
            rfq.MarketSectorName = table.Rows[i][46].ToString();
            recordset.Add(rfq);
        }       
        return recordset;
    }

    public bool update(RFQ entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            //DM.Load_SP_Parameters("@RFQNumberKey", entity.RfqNumberKey.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@EstimatedAnnualVolume", entity.EstimatedAnnualVolume);
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());
            DM.Load_SP_Parameters("@PrototypePiece", entity.PrototypePiece.ToString());
            DM.Load_SP_Parameters("@SG_A_Profit", entity.SgAProfit.ToString());
            DM.Load_SP_Parameters("@PackingPerUnit", entity.PackingPerUnit.ToString());
            DM.Load_SP_Parameters("@AssemblyCostPerUnit", entity.AssemblyCostPerUnit.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status.ToString());
            DM.Load_SP_Parameters("@DueDate", entity.DueDate.ToString());
            DM.Load_SP_Parameters("@FilledUp", entity.FilledUp.ToString());
            DM.Load_SP_Parameters("@PreparedBy", entity.PreparedBy.ToString());
            DM.Load_SP_Parameters("@MOQ", entity.Moq);
            DM.Load_SP_Parameters("@TargetPrice", entity.TargetPrice.ToString());
            DM.Load_SP_Parameters("@NoQuote", entity.NoQuote.ToString());
            DM.Load_SP_Parameters("@MarketSector", entity.MarketSectorID.ToString());
            DM.Load_SP_Parameters("@CommentsToBuyer", entity.CommentsToBuyer);
            DM.Load_SP_Parameters("@CommentsToVendor", entity.CommentsToVendor);
            DM.Load_SP_Parameters("@IAgree", entity.IAgree.ToString());
            DM.Load_SP_Parameters("@DateFilledOut", entity.DateFilledOut.ToString());
            DM.Load_SP_Parameters("@Make", entity.Make);
            DM.Load_SP_Parameters("@ReasonNoQuote", entity.ReasonNoQuote);
            DM.Load_SP_Parameters("@Weight", entity.Weight.ToString());
            DM.Load_SP_Parameters("@UMWeight", entity.UmWeight.ToString());
            DM.Load_SP_Parameters("@AttachmentsFolder", entity.SentAttachmentsFolder);
            DM.Load_SP_Parameters("@LeadTimePPAP", entity.LeadTimePPAP);
            DM.Load_SP_Parameters("@AttachmentsFolderVendor", entity.InboxAttachmentsFolder);

            result = DM.Execute_StoreProcedure("RFQHeader_EditRFQ", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool update(RFQ entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;        
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            //DM.Load_SP_Parameters("@RFQNumberKey", entity.RfqNumberKey.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@EstimatedAnnualVolume", entity.EstimatedAnnualVolume);
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());
            DM.Load_SP_Parameters("@PrototypePiece", entity.PrototypePiece.ToString());
            DM.Load_SP_Parameters("@SG_A_Profit", entity.SgAProfit.ToString());
            DM.Load_SP_Parameters("@PackingPerUnit", entity.PackingPerUnit.ToString());
            DM.Load_SP_Parameters("@AssemblyCostPerUnit", entity.AssemblyCostPerUnit.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status.ToString());
            DM.Load_SP_Parameters("@DueDate", entity.DueDate.ToString());
            DM.Load_SP_Parameters("@FilledUp", entity.FilledUp.ToString());
            DM.Load_SP_Parameters("@PreparedBy", entity.PreparedBy.ToString());
            DM.Load_SP_Parameters("@MOQ", entity.Moq);
            DM.Load_SP_Parameters("@TargetPrice", entity.TargetPrice.ToString());
            DM.Load_SP_Parameters("@NoQuote", entity.NoQuote.ToString());
            DM.Load_SP_Parameters("@MarketSector", entity.MarketSectorID.ToString());
            DM.Load_SP_Parameters("@CommentsToBuyer", entity.CommentsToBuyer);
            DM.Load_SP_Parameters("@CommentsToVendor", entity.CommentsToVendor);
            DM.Load_SP_Parameters("@IAgree", entity.IAgree.ToString());
            DM.Load_SP_Parameters("@DateFilledOut", entity.DateFilledOut.ToString());
            DM.Load_SP_Parameters("@Make", entity.Make);
            DM.Load_SP_Parameters("@ReasonNoQuote", entity.ReasonNoQuote);
            DM.Load_SP_Parameters("@Weight", entity.Weight.ToString());
            DM.Load_SP_Parameters("@UMWeight", entity.UmWeight.ToString());
            DM.Load_SP_Parameters("@AttachmentsFolder", entity.SentAttachmentsFolder);
            DM.Load_SP_Parameters("@LeadTimePPAP", entity.LeadTimePPAP);
            DM.Load_SP_Parameters("@AttachmentsFolderVendor", entity.InboxAttachmentsFolder);

            result = DM.Execute_StoreProcedure_Open_Conn("RFQHeader_EditRFQ", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        int rowsAffected=0;
        string query = "DELETE FROM RFQMaster WHERE RFQHeaderKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: RFQ Header.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();               
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }   
    #endregion
}

public class RFQEAVCRUD : ICRUD<RFQEAV>
{
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public RFQEAVCRUD()
    { }

    #region ICRUD<RFQEAV> Members

    public bool create(RFQEAV entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year);
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure("RFQEAV_NewEAV", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }

    public string createAndReturnIdGenerated(RFQEAV entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year);
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar("RFQEAV_NewEAV", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }

    public string createAndReturnIdGenerated(RFQEAV entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year);
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("RFQEAV_NewEAV", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }

    public RFQEAV readById(long id)
    {
        RFQEAV rfqEAV = new RFQEAV();

        string query = "SELECT EAVKey, RFQHeaderKey, Year, Volume " +
                        "FROM  RFQEAV WHERE     (EAVKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                rfqEAV.Id = long.Parse(table.Rows[0][0].ToString());
                rfqEAV.RfqHeaderKey = long.Parse(table.Rows[0][1].ToString());
                rfqEAV.Year = table.Rows[0][2].ToString();
                rfqEAV.Volume = float.Parse(table.Rows[0][3].ToString());

                sqlConnection.Dispose();
                return rfqEAV;
            }
        }
        return null;
    }
    public List<RFQEAV> readByParentID(long id)
    {
        List<RFQEAV> recordset = new List<RFQEAV>();

        string query = "SELECT EAVKey, RFQHeaderKey, Year, Volume " +
                        "FROM  RFQEAV WHERE RFQHeaderKey = @key ORDER BY RFQHeaderKey, Year";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                RFQEAV rfqEAV = new RFQEAV();
                rfqEAV.Id = long.Parse(table.Rows[i][0].ToString());
                rfqEAV.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
                rfqEAV.Year = table.Rows[i][2].ToString();
                rfqEAV.Volume = float.Parse(table.Rows[i][3].ToString());

                recordset.Add(rfqEAV);
            }
        }
        return recordset;
    }
    public IList<RFQEAV> readAll()
    {
        List<RFQEAV> recordset = new List<RFQEAV>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT EAVKey, RFQHeaderKey, Year, Volume " +
                        "FROM  RFQEAV ORDER BY RFQHeaderKey, Year";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQEAV rfqEAV = new RFQEAV();
            rfqEAV.Id = long.Parse(table.Rows[i][0].ToString());
            rfqEAV.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
            rfqEAV.Year = table.Rows[i][2].ToString();
            rfqEAV.Volume = float.Parse(table.Rows[i][3].ToString());

            recordset.Add(rfqEAV);
        }

        return recordset;
    }

    public bool update(RFQEAV entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@EAVKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year);
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure("RFQEAV_EditEAV", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool update(RFQEAV entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;

        try
        {
            DM.Load_SP_Parameters("@EAVKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year);
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("RFQEAV_EditEAV", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM RFQEAV WHERE EAVKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: RFQ_EAV.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }

    #endregion
}

public class RFQNumberCRUD : ICRUD<RFQNumberEntity>
{
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public RFQNumberCRUD()
    { }

    #region ICRUD<RFQ> Members

    public bool create(RFQNumberEntity entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BOMDetailKey.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifHeaderKey.ToString());
            DM.Load_SP_Parameters("@RFQNumber", entity.RFQNumber.ToString());
            
            result = DM.Execute_StoreProcedure("RFQNumber_NewNumber", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public string createAndReturnIdGenerated(RFQNumberEntity entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BOMDetailKey.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifHeaderKey.ToString());
            DM.Load_SP_Parameters("@RFQNumber", entity.RFQNumber.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar("RFQNumber_NewNumber", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }
    public string createAndReturnIdGenerated(RFQNumberEntity entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BOMDetailKey.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifHeaderKey.ToString());
            DM.Load_SP_Parameters("@RFQNumber", entity.RFQNumber.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("RFQNumber_NewNumber", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }
    public RFQNumberEntity readById(long id)
    {
        RFQNumberEntity rfqNumber = new RFQNumberEntity();

        string query =  "SELECT RFQNumberKey, BOMDetailKey, SIFHeaderKey, InquiryNumber, RFQNumber, RFQGenerated " +
                        "FROM   viewRFQNumber WHERE  RFQNumberKey = @key";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                rfqNumber.Id = long.Parse(table.Rows[0][0].ToString());
                rfqNumber.BOMDetailKey = long.Parse(table.Rows[0][1].ToString());
                rfqNumber.SifHeaderKey = long.Parse(table.Rows[0][2].ToString());
                rfqNumber.InquireyNumber = table.Rows[0][3].ToString();
                rfqNumber.RFQNumber = long.Parse(table.Rows[0][4].ToString());
                rfqNumber.RfqGenerated = table.Rows[0][5].ToString();
                
                sqlConnection.Dispose();
                return rfqNumber;
            }
        }
        return null;
    }

    public IList<RFQNumberEntity> readAll()
    {
        List<RFQNumberEntity> recordset = new List<RFQNumberEntity>();
        //recordset.Clear();
        //DM = connectionManager.getDataManager();

        //string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumber, DrawingLevel, EstimatedAnnualVolume, ProductionLeadTime, ProductionToolingLeadTime, " +
        //              "PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, " +
        //              "AssemblyCostPerUnit, Status, DueDate, SentToVendor, FilledUp, PartNumber, DeadDate, Acknowledgement, SupplierName, ManufacturingLocation, ShipLocation, PreparedBy FROM viewRFQHeader_ReadAll";

        //DataTable table = new DataTable();
        //table = DM.Execute_Query(query);

        //for (int i = 0; i < table.Rows.Count; i++)
        //{
        //    RFQ rfq = new RFQ();
        //    rfq.Id = long.Parse(table.Rows[i][0].ToString());
        //    rfq.BomDetailId = long.Parse(table.Rows[i][1].ToString());
        //    rfq.SupplierId = long.Parse(table.Rows[i][2].ToString());
        //    rfq.RfqNumber = table.Rows[i][3].ToString();
        //    rfq.DrawingLevel = table.Rows[i][4].ToString();
        //    rfq.EstimatedAnnualVolume = table.Rows[i][5].ToString();
        //    rfq.ProductionLeadTime = (table.Rows[i][6].ToString());
        //    rfq.ProductionToolingLeadTime = table.Rows[i][7].ToString();
        //    rfq.PrototypeToolingLeadTime = table.Rows[i][8].ToString();
        //    rfq.PrototypePieceLeadTime = table.Rows[i][9].ToString();
        //    rfq.ToolingDetail = table.Rows[i][10].ToString();
        //    rfq.ProductionTooling = float.Parse(table.Rows[i][11].ToString());
        //    rfq.PrototypeTooling = float.Parse(table.Rows[i][12].ToString());
        //    rfq.PrototypePiece = float.Parse(table.Rows[i][13].ToString());
        //    rfq.SgAProfit = float.Parse(table.Rows[i][14].ToString());
        //    rfq.PackingPerUnit = float.Parse(table.Rows[i][15].ToString());
        //    rfq.AssemblyCostPerUnit = float.Parse(table.Rows[i][16].ToString());
        //    rfq.Status = table.Rows[i][17].ToString();
        //    rfq.DueDate = DateTime.Parse(table.Rows[i][18].ToString());
        //    rfq.SentToVendor = DateTime.Parse(table.Rows[i][19].ToString());
        //    rfq.FilledUp = DateTime.Parse(table.Rows[i][20].ToString());
        //    rfq.PartNumber = table.Rows[i][21].ToString();
        //    rfq.DeadDate = DateTime.Parse(table.Rows[i][22].ToString());
        //    rfq.Acknowledgement = table.Rows[i][23].ToString();
        //    rfq.SupplierName = table.Rows[i][24].ToString();
        //    rfq.ManufacturingLocation = table.Rows[i][25].ToString();
        //    rfq.ShipLocation = table.Rows[i][26].ToString();
        //    rfq.PreparedBy = table.Rows[i][27].ToString();

        //    recordset.Add(rfq);
        //}
        return recordset;
    }

    public bool update(RFQNumberEntity entity)
    {
        ErrorOccur = false;
        bool result = false;
        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        return false;
    }
    #endregion


    public long generateNewRFQNumber(long SIFHeaderID)
    {
        ErrorOccur = false;
        RFQNumberEntity rfqNumber = new RFQNumberEntity();
        long RFQNumberGenerated = -1;

        string query = "SELECT TOP (1) RFQNumber, SIFHeaderKey " +
                        "FROM viewRFQNumber WHERE SIFHeaderKey = @key " +
                        "ORDER BY RFQNumber DESC";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", SIFHeaderID);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                RFQNumberGenerated = long.Parse(table.Rows[0][0].ToString());
                sqlConnection.Dispose();
            }
            RFQNumberGenerated++;
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return RFQNumberGenerated;
    }
}

public class RfqDetailCRUD : ICRUD<RFQDetail>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public RfqDetailCRUD()
    { }

    #region ICRUD<RFQDetail> Members

    public bool create(RFQDetail entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemDescription", entity.ItemDescription.ToString());
            DM.Load_SP_Parameters("@UM", entity.Um.ToString());
            DM.Load_SP_Parameters("@RPCQty", entity.RpcQty.ToString());
            DM.Load_SP_Parameters("@RPCCostPerUnit", entity.RpcCostPerUnit.ToString());
            DM.Load_SP_Parameters("@OSQty", entity.OSQty.ToString());
            DM.Load_SP_Parameters("@OSCostPerUnit", entity.OSCostPerUnit.ToString());
            DM.Load_SP_Parameters("@ScrapValue", entity.ScrapValue.ToString());
            DM.Load_SP_Parameters("@DirectHrlyLaborRate", entity.DirectHrlyLaborRate.ToString());
            DM.Load_SP_Parameters("@StdHrs", entity.StdHrs.ToString());
            DM.Load_SP_Parameters("@Burden", entity.Burden.ToString());

            result = DM.Execute_StoreProcedure("RFQDetail_NewDetail", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }

    public bool create(RFQDetail entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemDescription", entity.ItemDescription.ToString());
            DM.Load_SP_Parameters("@UM", entity.Um.ToString());
            DM.Load_SP_Parameters("@RPCQty", entity.RpcQty.ToString());
            DM.Load_SP_Parameters("@RPCCostPerUnit", entity.RpcCostPerUnit.ToString());
            DM.Load_SP_Parameters("@OSQty", entity.OSQty.ToString());
            DM.Load_SP_Parameters("@OSCostPerUnit", entity.OSCostPerUnit.ToString());
            DM.Load_SP_Parameters("@ScrapValue", entity.ScrapValue.ToString());
            DM.Load_SP_Parameters("@DirectHrlyLaborRate", entity.DirectHrlyLaborRate.ToString());
            DM.Load_SP_Parameters("@StdHrs", entity.StdHrs.ToString());
            DM.Load_SP_Parameters("@Burden", entity.Burden.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("RFQDetail_NewDetail", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }

    public RFQDetail readById(long id)
    {
        RFQDetail rfq = new RFQDetail();

        string query = "SELECT RFQDetailKey, RFQHeaderKey, ItemDescription, UM, RPCQty, RPCCostPerUnit, OSQty, " +
                        "OSCostPerUnit, ScrapValue, DirectHrlyLaborRate, StdHrs, Burden FROM RFQDetail " + 
                        "WHERE (RFQDetailKey = @key)";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                rfq.Id = long.Parse(table.Rows[0][0].ToString());
                rfq.RfqHeaderKey = long.Parse(table.Rows[0][1].ToString());
                rfq.ItemDescription = table.Rows[0][2].ToString();
                rfq.Um = table.Rows[0][3].ToString();
                rfq.RpcQty = float.Parse(table.Rows[0][4].ToString());
                rfq.RpcCostPerUnit = float.Parse(table.Rows[0][5].ToString());
                rfq.OSQty = float.Parse(table.Rows[0][6].ToString());
                rfq.OSCostPerUnit = float.Parse((table.Rows[0][7].ToString()));
                rfq.ScrapValue = float.Parse(table.Rows[0][8].ToString());
                rfq.DirectHrlyLaborRate = float.Parse(table.Rows[0][9].ToString());
                rfq.StdHrs = float.Parse(table.Rows[0][10].ToString());
                rfq.Burden = float.Parse(table.Rows[0][11].ToString());

                sqlConnection.Dispose();
                return rfq;
            }
        }
        return null;
    }

    public List<RFQDetail> readByParentID(long id)
    {
        List<RFQDetail> recordset = new List<RFQDetail>();

        string query = "SELECT RFQDetailKey, RFQHeaderKey, ItemDescription, UM, RPCQty, RPCCostPerUnit, OSQty, " +
                        "OSCostPerUnit, ScrapValue, DirectHrlyLaborRate, StdHrs, Burden FROM viewRFQDetail_ReadAll " +
                        "WHERE (RFQHeaderKey = @key) ORDER BY RFQDetailKey";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                RFQDetail rfq = new RFQDetail();
                rfq.Id = long.Parse(table.Rows[i][0].ToString());
                rfq.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
                rfq.ItemDescription = table.Rows[i][2].ToString();
                rfq.Um = table.Rows[i][3].ToString();
                rfq.RpcQty = float.Parse(table.Rows[i][4].ToString());
                rfq.RpcCostPerUnit = float.Parse(table.Rows[i][5].ToString());
                rfq.OSQty = float.Parse(table.Rows[i][6].ToString());
                rfq.OSCostPerUnit = float.Parse((table.Rows[i][7].ToString()));
                rfq.ScrapValue = float.Parse(table.Rows[i][8].ToString());
                rfq.DirectHrlyLaborRate = float.Parse(table.Rows[i][9].ToString());
                rfq.StdHrs = float.Parse(table.Rows[i][10].ToString());
                rfq.Burden = float.Parse(table.Rows[i][11].ToString());               
                rfq.Sequence = i;

                recordset.Add(rfq);
            }
        }
        return recordset;
    }

    public IList<RFQDetail> readAll()
    {
        List<RFQDetail> recordset = new List<RFQDetail>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT RFQDetailKey, RFQHeaderKey, ItemDescription, UM, RPCQty, RPCCostPerUnit, OSQty, " +
                        "OSCostPerUnit, ScrapValue, DirectHrlyLaborRate, StdHrs, Burden FROM RFQDetail " +
                        "ORDER BY RFQDetailKey";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQDetail rfq = new RFQDetail();
            rfq.Id = long.Parse(table.Rows[i][0].ToString());
            rfq.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
            rfq.ItemDescription =table.Rows[i][2].ToString();
            rfq.Um = table.Rows[i][3].ToString();
            rfq.RpcQty = float.Parse(table.Rows[i][4].ToString());
            rfq.RpcCostPerUnit = float.Parse(table.Rows[i][5].ToString());
            rfq.OSQty = float.Parse(table.Rows[i][6].ToString());
            rfq.OSCostPerUnit = float.Parse((table.Rows[i][7].ToString()));
            rfq.ScrapValue = float.Parse(table.Rows[i][8].ToString());
            rfq.DirectHrlyLaborRate = float.Parse(table.Rows[i][9].ToString());
            rfq.StdHrs = float.Parse(table.Rows[i][10].ToString());
            rfq.Burden = float.Parse(table.Rows[i][11].ToString());
            rfq.Sequence = i;

            recordset.Add(rfq);
        }

        return recordset;
    }
    public bool update(RFQDetail entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQDetailKey", entity.Id.ToString());

            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemDescription", entity.ItemDescription.ToString());
            DM.Load_SP_Parameters("@UM", entity.Um.ToString());
            DM.Load_SP_Parameters("@RPCQty", entity.RpcQty.ToString());
            DM.Load_SP_Parameters("@RPCCostPerUnit", entity.RpcCostPerUnit.ToString());
            DM.Load_SP_Parameters("@OSQty", entity.OSQty.ToString());
            DM.Load_SP_Parameters("@OSCostPerUnit", entity.OSCostPerUnit.ToString());
            DM.Load_SP_Parameters("@ScrapValue", entity.ScrapValue.ToString());
            DM.Load_SP_Parameters("@DirectHrlyLaborRate", entity.DirectHrlyLaborRate.ToString());
            DM.Load_SP_Parameters("@StdHrs", entity.StdHrs.ToString());
            DM.Load_SP_Parameters("@Burden", entity.Burden.ToString());

            result = DM.Execute_StoreProcedure("RFQHeader_EditRFQ", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM RFQDetail WHERE RFQDetailKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: RFQ Detail.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }
    public bool deleteByParentID(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM RFQDetail WHERE RFQHeaderKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: RFQ Detail.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }

    public bool deleteByParentID(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM RFQDetail WHERE RFQHeaderKey = " + id;
        if (DM.Execute_Command_Open_Connection(query))
        {
            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
            return true;
        }
        ErrorOccur = DM.ErrorOccur;
        ErrorMessage = DM.Error_Mjs;
        return false;
    }
    #endregion
}

public class RfqAcrCRUD : ICRUD<RFQACR>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public RfqAcrCRUD()
    { }

    #region ICRUD<RFQACR> Members

    public bool create(RFQACR entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year.ToString());
            DM.Load_SP_Parameters("@Porcentage", entity.Porcentage.ToString());

            result = DM.Execute_StoreProcedure("RFQACR_NewACR", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }

    public bool create(RFQACR entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year.ToString());
            DM.Load_SP_Parameters("@Porcentage", entity.Porcentage.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("RFQACR_NewACR", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }

    public RFQACR readById(long id)
    {
        RFQACR rfqAcr = new RFQACR();

        string query = "SELECT RFQACRKey, RFQHeaderKey, Year, Porcentage " +
                        "FROM RFQACR WHERE (RFQACRKey = @key)";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                rfqAcr.Id = long.Parse(table.Rows[0][0].ToString());
                rfqAcr.RfqHeaderKey = long.Parse(table.Rows[0][1].ToString());
                rfqAcr.Year = int.Parse(table.Rows[0][2].ToString());
                rfqAcr.Porcentage = float.Parse(table.Rows[0][3].ToString());

                sqlConnection.Dispose();
                return rfqAcr;
            }
        }
        return null;
    }

    public List<RFQACR> readByParentID(long id)
    {
        List<RFQACR> recordset = new List<RFQACR>();

        string query = "SELECT RFQACRKey, RFQHeaderKey, Year, Porcentage " +
                       "FROM RFQACR WHERE (RFQHeaderKey = @key) ORDER BY Year";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                RFQACR rfqAcr = new RFQACR();
                rfqAcr.Id = long.Parse(table.Rows[i][0].ToString());
                rfqAcr.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
                rfqAcr.Year = int.Parse(table.Rows[i][2].ToString());
                rfqAcr.Porcentage = float.Parse(table.Rows[i][3].ToString());
               
                //rfqAcr.Sequence = i;

                recordset.Add(rfqAcr);
            }
        }
        return recordset;
    }

    public IList<RFQACR> readAll()
    {
        List<RFQACR> recordset = new List<RFQACR>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT RFQACRKey, RFQHeaderKey, Year, Porcentage " +
                       "FROM RFQACR ORDER BY Year";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQACR rfqAcr = new RFQACR();
            rfqAcr.Id = long.Parse(table.Rows[i][0].ToString());
            rfqAcr.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
            rfqAcr.Year = int.Parse(table.Rows[i][2].ToString());
            rfqAcr.Porcentage = float.Parse(table.Rows[i][3].ToString());
            //rfqAcr.Sequence = i;

            recordset.Add(rfqAcr);
        }

        return recordset;
    }
    public bool update(RFQACR entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQACRKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@Year", entity.Year.ToString());
            DM.Load_SP_Parameters("@Porcentage", entity.Porcentage.ToString());

            result = DM.Execute_StoreProcedure("RFQACR_EditACR", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM RFQACR WHERE RFQACRKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: RFQ_ACR.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }
    public bool deleteByParentID(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM RFQACR WHERE RFQHeaderKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: RFQ_ACR.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }
    public bool deleteByParentID(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM RFQACR WHERE RFQHeaderKey=" + id;
        if (DM.Execute_Command_Open_Connection(query))
        {
            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
            return true;
        } 
        ErrorOccur = DM.ErrorOccur;
        ErrorMessage = DM.Error_Mjs;
        return false;
    }
    #endregion
}

public class RfqSummaryCRUD
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public RFQSummary readById(long id)
    {
        RFQSummary rfqSummary = new RFQSummary();

        string query = "SELECT RFQHeaderKey, BOMDetailKey, RFQGenerated, SupplierMasterKey, MaterialTotal, ServiceTotal, ScrapTotal, LaborTotal, BurdenTotal, SG_A_Profit, PackingPerUnit, " +
                        "AssemblyCostPerUnit, EstimatedAnnualVolume, SupplierName, " +
                        "RFQSummaryKey, BCost, CCost, EAV, Tooling, Cavitation, Material, Status, Sequence FROM viewRFQ_Summary WHERE (RFQSummaryKey = @key) ORDER BY RFQHeaderKey";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                rfqSummary.RfqHeaderKey = long.Parse(table.Rows[0][0].ToString());
                rfqSummary.BomDetailKey = long.Parse(table.Rows[0][1].ToString());
                rfqSummary.RfqNumber = table.Rows[0][2].ToString();
                rfqSummary.SupplierKey = long.Parse(table.Rows[0][3].ToString());
                rfqSummary.MaterialTotal = float.Parse(table.Rows[0][4].ToString());
                rfqSummary.ServiceTotal = float.Parse(table.Rows[0][5].ToString());
                rfqSummary.ScrapTotal = float.Parse(table.Rows[0][6].ToString());
                rfqSummary.LaborTotal = float.Parse((table.Rows[0][7].ToString()));
                rfqSummary.BurdenTotal = float.Parse(table.Rows[0][8].ToString());
                rfqSummary.SgaProfit = float.Parse(table.Rows[0][9].ToString());
                rfqSummary.PackingPerUnit = float.Parse(table.Rows[0][10].ToString());
                rfqSummary.AssemblyCostPerUnit = float.Parse(table.Rows[0][11].ToString());
                rfqSummary.EstimatedAnnualVolume = float.Parse(table.Rows[0][12].ToString());
                rfqSummary.SupplierName = table.Rows[0][13].ToString();
                rfqSummary.Id = long.Parse(table.Rows[0][14].ToString());
                rfqSummary.TotalBCost = float.Parse(table.Rows[0][15].ToString());
                rfqSummary.TotalCCost = float.Parse(table.Rows[0][16].ToString());
                rfqSummary.EAV = float.Parse(table.Rows[0][17].ToString());
                rfqSummary.Tooling = float.Parse(table.Rows[0][18].ToString());
                rfqSummary.Cavitation = float.Parse(table.Rows[0][19].ToString());
                rfqSummary.MaterialTooling = table.Rows[0][20].ToString();
                rfqSummary.Status = table.Rows[0][21].ToString();
                rfqSummary.Sequence = int.Parse(table.Rows[0][22].ToString());

                sqlConnection.Dispose();
                return rfqSummary;
            }
        }
        return null;
    }
    public RFQSummary readByRFQHeaderId(long id)
    {
        RFQSummary rfqSummary = new RFQSummary();

        string query = "SELECT RFQHeaderKey, BOMDetailKey, RFQGenerated, SupplierMasterKey, MaterialTotal, ServiceTotal, ScrapTotal, LaborTotal, BurdenTotal, SG_A_Profit, PackingPerUnit, " +
                        "AssemblyCostPerUnit, EstimatedAnnualVolume, SupplierName, Status, " +
                        "RFQSummaryKey, BCost, CCost, EAV, Tooling, Cavitation, Material, Sequence FROM viewRFQ_Summary WHERE (RFQHeaderKey = @key) ORDER BY Sequence";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                rfqSummary.RfqHeaderKey = long.Parse(table.Rows[0][0].ToString());
                rfqSummary.BomDetailKey = long.Parse(table.Rows[0][1].ToString());
                rfqSummary.RfqNumber = table.Rows[0][2].ToString();
                rfqSummary.SupplierKey = long.Parse(table.Rows[0][3].ToString());
                rfqSummary.MaterialTotal = float.Parse(table.Rows[0][4].ToString());
                rfqSummary.ServiceTotal = float.Parse(table.Rows[0][5].ToString());
                rfqSummary.ScrapTotal = float.Parse(table.Rows[0][6].ToString());
                rfqSummary.LaborTotal = float.Parse((table.Rows[0][7].ToString()));
                rfqSummary.BurdenTotal = float.Parse(table.Rows[0][8].ToString());
                rfqSummary.SgaProfit = float.Parse(table.Rows[0][9].ToString());
                rfqSummary.PackingPerUnit = float.Parse(table.Rows[0][10].ToString());
                rfqSummary.AssemblyCostPerUnit = float.Parse(table.Rows[0][11].ToString());
                rfqSummary.EstimatedAnnualVolume = float.Parse(table.Rows[0][12].ToString());
                rfqSummary.SupplierName = table.Rows[0][13].ToString();
                rfqSummary.Status = table.Rows[0][14].ToString();
                if (table.Rows[0][15].ToString() != "")
                {
                    rfqSummary.Id = long.Parse(table.Rows[0][15].ToString());
                    rfqSummary.TotalBCost = float.Parse(table.Rows[0][16].ToString());
                    rfqSummary.TotalCCost = float.Parse(table.Rows[0][17].ToString());
                    rfqSummary.EAV = float.Parse(table.Rows[0][18].ToString());
                    rfqSummary.Tooling = float.Parse(table.Rows[0][19].ToString());
                    rfqSummary.Cavitation = float.Parse(table.Rows[0][20].ToString());
                    rfqSummary.MaterialTooling = table.Rows[0][21].ToString();
                    rfqSummary.Sequence = int.Parse(table.Rows[0][22].ToString());
                }
                sqlConnection.Dispose();
                return rfqSummary;
            }
        }
        return null;
    }
    public List<RFQSummary> readByBOMDetailID(long id)
    {
        List<RFQSummary> recordset = new List<RFQSummary>();

        string query = "SELECT RFQHeaderKey, BOMDetailKey, RFQGenerated, SupplierMasterKey, MaterialTotal, ServiceTotal, ScrapTotal, LaborTotal, BurdenTotal, SG_A_Profit, PackingPerUnit, " +
                        "AssemblyCostPerUnit, EstimatedAnnualVolume, SupplierName, Status, " +
                        "RFQSummaryKey, BCost, CCost, EAV, Tooling, Cavitation, Material, Sequence FROM viewRFQ_Summary WHERE (BOMDetailKey = @key) ORDER BY Sequence";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                RFQSummary rfq = new RFQSummary();
                rfq.RfqHeaderKey = long.Parse(table.Rows[i][0].ToString());
                rfq.BomDetailKey = long.Parse(table.Rows[i][1].ToString());
                rfq.RfqNumber = table.Rows[i][2].ToString();
                rfq.SupplierKey = long.Parse(table.Rows[i][3].ToString());
                rfq.MaterialTotal = float.Parse(table.Rows[i][4].ToString());
                rfq.ServiceTotal = float.Parse(table.Rows[i][5].ToString());
                rfq.ScrapTotal = float.Parse(table.Rows[i][6].ToString());
                rfq.LaborTotal = float.Parse((table.Rows[i][7].ToString()));
                rfq.BurdenTotal = float.Parse(table.Rows[i][8].ToString());
                rfq.SgaProfit = float.Parse(table.Rows[i][9].ToString());
                rfq.PackingPerUnit = float.Parse(table.Rows[i][10].ToString());
                rfq.AssemblyCostPerUnit = float.Parse(table.Rows[i][11].ToString());
                rfq.EstimatedAnnualVolume = float.Parse(table.Rows[i][12].ToString());
                rfq.SupplierName = table.Rows[i][13].ToString();
                rfq.Status = table.Rows[i][14].ToString();
                if (table.Rows[i][15].ToString() != "")
                {
                    rfq.Id = long.Parse(table.Rows[i][15].ToString());
                    rfq.TotalBCost = float.Parse(table.Rows[i][16].ToString());
                    rfq.TotalCCost = float.Parse(table.Rows[i][17].ToString());
                    rfq.EAV = float.Parse(table.Rows[i][18].ToString());
                    rfq.Tooling = float.Parse(table.Rows[i][19].ToString());
                    rfq.Cavitation = float.Parse(table.Rows[i][20].ToString());
                    rfq.MaterialTooling = table.Rows[i][21].ToString();
                    rfq.Sequence = int.Parse(table.Rows[i][22].ToString());
                }

                recordset.Add(rfq);
            }
        }
        return recordset;
    }
    public bool updateOrCreate(RFQSummary entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            DM.Load_SP_Parameters("@BCost", entity.TotalBCost.ToString());
            DM.Load_SP_Parameters("@CCost", entity.TotalCCost.ToString());
            DM.Load_SP_Parameters("@EAV", entity.EAV.ToString());
            DM.Load_SP_Parameters("@Tooling", entity.Tooling.ToString());
            DM.Load_SP_Parameters("@Cavitation", entity.Cavitation.ToString());
            DM.Load_SP_Parameters("@Material", entity.MaterialTooling);
            DM.Load_SP_Parameters("@Sequence", entity.Sequence.ToString());

            if (entity.Id > -1)
            {
                DM.Load_SP_Parameters("@RFQSummaryKey", entity.Id.ToString());
                result = DM.Execute_StoreProcedure("RFQSummary_EditSummary", true);
            }
            else
            {
                result = DM.Execute_StoreProcedure("RFQSummary_NewSummary", true);
            }

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }
        return result;
    }
}
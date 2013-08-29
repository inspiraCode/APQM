using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for RFQ.
/// </summary>
public class rfqCRUD : ICRUD<RFQ>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public rfqCRUD()
	{}
    
    #region ICRUD<RFQ> Members

    public bool create(RFQ entity)
    {
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            if (entity.BomDetailId.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            }
            else {
                DM.Load_SP_Parameters("@BOMDetailKey", "0");
            }
            if (entity.SupplierId.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@SupplierMasterKey", "0");
            }
            if (entity.EstimatedAnnualVolume.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@EstimatedAnnualVolume", entity.EstimatedAnnualVolume);
            }
            else
            {
                DM.Load_SP_Parameters("@EstimatedAnnualVolume", "0");
            }
            if (entity.PrototypePiece.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@PrototypePiece", entity.PrototypePiece.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@PrototypePiece", "0");
            }
            if (entity.SgAProfit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@SG_A_Profit", entity.SgAProfit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@SG_A_Profit", "0");
            }
            if (entity.PackingPerUnit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@PackingPerUnit", entity.PackingPerUnit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@PackingPerUnit", "0");
            }
            if (entity.AssemblyCostPerUnit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@AssemblyCostPerUnit", entity.AssemblyCostPerUnit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@AssemblyCostPerUnit", "0");
            }
            
            DM.Load_SP_Parameters("@RFQNumber", entity.RfqNumber.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);            
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());
            
            result = DM.Execute_StoreProcedure("RFQHeader_NewRFQ", true);
        }
        catch (Exception e)
        {
            return false;
        }       

        return result;
    }

    public RFQ readById(long id)
    {
        RFQ rfq = new RFQ();
        
        string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumber, DrawingLevel, EstimatedAnnualVolume, " +
            "ProductionLeadTime, ProductionToolingLeadTime, PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, " + 
            "PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, AssemblyCostPerUnit FROM RFQHeader " +
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
                rfq.RfqNumber = table.Rows[0][3].ToString();
                rfq.DrawingLevel = table.Rows[0][4].ToString();
                rfq.EstimatedAnnualVolume = table.Rows[0][5].ToString();
                rfq.ProductionLeadTime = (table.Rows[0][6].ToString());
                rfq.ProductionToolingLeadTime = table.Rows[0][7].ToString();
                rfq.PrototypeToolingLeadTime = table.Rows[0][8].ToString();
                rfq.PrototypePieceLeadTime = table.Rows[0][9].ToString();
                rfq.ToolingDetail = table.Rows[0][10].ToString();
                rfq.ProductionTooling = float.Parse(table.Rows[0][11].ToString());
                rfq.PrototypeTooling = float.Parse(table.Rows[0][12].ToString());
                rfq.PrototypePiece = long.Parse(table.Rows[0][13].ToString());
                rfq.SgAProfit = long.Parse(table.Rows[0][14].ToString());
                rfq.PackingPerUnit = long.Parse(table.Rows[0][15].ToString());
                rfq.AssemblyCostPerUnit = long.Parse(table.Rows[0][16].ToString());

                sqlConnection.Dispose();
                return rfq;
            }
        }
        return null;
    }

    public IList<RFQ> readAll()
    {
        List<RFQ>  recordset = new List<RFQ>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumber, DrawingLevel, EstimatedAnnualVolume, " +
            "ProductionLeadTime, ProductionToolingLeadTime, PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, " +
            "PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, AssemblyCostPerUnit FROM RFQHeader ";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQ rfq = new RFQ();
            rfq.Id = long.Parse(table.Rows[0][0].ToString());
            rfq.BomDetailId = long.Parse(table.Rows[0][1].ToString());
            rfq.SupplierId = long.Parse(table.Rows[0][2].ToString());
            rfq.RfqNumber =table.Rows[0][3].ToString();
            rfq.DrawingLevel = table.Rows[0][4].ToString();
            rfq.EstimatedAnnualVolume = table.Rows[0][5].ToString();
            rfq.ProductionLeadTime = (table.Rows[0][6].ToString());
            rfq.ProductionToolingLeadTime = table.Rows[0][7].ToString();
            rfq.PrototypeToolingLeadTime = table.Rows[0][8].ToString();
            rfq.PrototypePieceLeadTime = table.Rows[0][9].ToString();
            rfq.ToolingDetail = table.Rows[0][10].ToString();
            rfq.ProductionTooling = float.Parse(table.Rows[0][11].ToString());
            rfq.PrototypeTooling = float.Parse(table.Rows[0][12].ToString());
            rfq.PrototypePiece = long.Parse(table.Rows[0][13].ToString());
            rfq.SgAProfit = long.Parse(table.Rows[0][14].ToString());
            rfq.PackingPerUnit = long.Parse(table.Rows[0][15].ToString());
            rfq.AssemblyCostPerUnit = long.Parse(table.Rows[0][16].ToString());

            recordset.Add(rfq);
        }
       
        return recordset;
    }

    public bool update(RFQ entity)
    {
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailId.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierId.ToString());
            DM.Load_SP_Parameters("@RFQNumber", entity.RfqNumber.ToString());
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

            result = DM.Execute_StoreProcedure("RFQHeader_EditRFQ", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
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
            }
            catch (Exception e)
            {
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();               
            }           
        }
        return false;
    }

    #endregion
}

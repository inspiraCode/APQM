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

    public RfqCRUD()
	{}
    
    #region ICRUD<RFQ> Members

    public bool create(RFQ entity)
    {
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
    public string createAndReturnIdGenerated(RFQ entity)
    {
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
            DM.Load_SP_Parameters("@RFQNumber", entity.RfqNumber.ToString());
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@ProductionLeadTime", entity.ProductionLeadTime);
            DM.Load_SP_Parameters("@ProductionToolingLeadTime", entity.ProductionToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypeToolingLeadTime", entity.PrototypeToolingLeadTime);
            DM.Load_SP_Parameters("@PrototypePieceLeadTime", entity.PrototypePieceLeadTime);
            DM.Load_SP_Parameters("@ToolingDetail", entity.ToolingDetail);
            DM.Load_SP_Parameters("@ProductionTooling", entity.ProductionTooling.ToString());
            DM.Load_SP_Parameters("@PrototypeTooling", entity.PrototypeTooling.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar("RFQHeader_NewRFQ", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
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

        string query = "SELECT RFQHeaderKey, BOMDetailKey, SupplierMasterKey, RFQNumber, DrawingLevel, EstimatedAnnualVolume, ProductionLeadTime, ProductionToolingLeadTime, " +
                      "PrototypeToolingLeadTime, PrototypePieceLeadTime, ToolingDetail, ProductionTooling, PrototypeTooling, PrototypePiece, SG_A_Profit, PackingPerUnit, " +
                      "AssemblyCostPerUnit, Status, DueDate, SentToVendor, FilledUp, PartNumber, DeadDate, Acknowledgement, SupplierName FROM viewRFQHeader_ReadAll";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQ rfq = new RFQ();
            rfq.Id = long.Parse(table.Rows[i][0].ToString());
            rfq.BomDetailId = long.Parse(table.Rows[i][1].ToString());
            rfq.SupplierId = long.Parse(table.Rows[i][2].ToString());
            rfq.RfqNumber =table.Rows[i][3].ToString();
            rfq.DrawingLevel = table.Rows[i][4].ToString();
            rfq.EstimatedAnnualVolume = table.Rows[i][5].ToString();
            rfq.ProductionLeadTime = (table.Rows[i][6].ToString());
            rfq.ProductionToolingLeadTime = table.Rows[i][7].ToString();
            rfq.PrototypeToolingLeadTime = table.Rows[i][8].ToString();
            rfq.PrototypePieceLeadTime = table.Rows[i][9].ToString();
            rfq.ToolingDetail = table.Rows[i][10].ToString();
            rfq.ProductionTooling = float.Parse(table.Rows[i][11].ToString());
            rfq.PrototypeTooling = float.Parse(table.Rows[i][12].ToString());
            rfq.PrototypePiece = long.Parse(table.Rows[i][13].ToString());
            rfq.SgAProfit = long.Parse(table.Rows[i][14].ToString());
            rfq.PackingPerUnit = long.Parse(table.Rows[i][15].ToString());
            rfq.AssemblyCostPerUnit = long.Parse(table.Rows[i][16].ToString());
            rfq.Status = table.Rows[i][17].ToString();
            rfq.DueDate = DateTime.Parse(table.Rows[i][18].ToString());
            rfq.SentToVendor = DateTime.Parse(table.Rows[i][19].ToString());
            rfq.FilledUp = DateTime.Parse(table.Rows[i][20].ToString());
            rfq.PartNumber = table.Rows[i][21].ToString();
            rfq.DeadDate = DateTime.Parse(table.Rows[i][22].ToString());
            rfq.Acknowledgement = table.Rows[i][23].ToString();
            rfq.SupplierName = table.Rows[i][24].ToString();
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

/// <summary>
/// Class for working with database for RFQ Detail.
/// </summary>
public class RfqDetailCRUD : ICRUD<RFQDetail>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public RfqDetailCRUD()
    { }

    #region ICRUD<RFQDetail> Members

    public bool create(RFQDetail entity)
    {
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            if (entity.RfqHeaderKey.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@RFQHeaderKey", "0");
            }
            if (entity.ItemMasterKey.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterKey.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@ItemMasterKey", "0");
            }
            if (entity.RpcQty.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@RPCQty", entity.RpcQty.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@RPCQty", "0");
            }
            if (entity.RpcCostPerUnit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@RPCCostPerUnit", entity.RpcCostPerUnit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@RPCCostPerUnit", "0");
            }
            if (entity.OSQty.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@OSQty", entity.OSQty.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@OSQty", "0");
            }
            if (entity.OSCostPerUnit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@OSCostPerUnit", entity.OSCostPerUnit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@OSCostPerUnit", "0");
            }
            if (entity.ScrapValue.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@ScrapValue", entity.ScrapValue.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@ScrapValue", "0");
            }
            if (entity.DirectHrlyLaborRate.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@DirectHrlyLaborRate", entity.DirectHrlyLaborRate.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@DirectHrlyLaborRate", "0");
            }
            if (entity.StdHrs.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@StdHrs", entity.StdHrs.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@StdHrs", "0");
            }
            if (entity.Burden.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@Burden", entity.Burden.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@Burden", "0");
            }

            result = DM.Execute_StoreProcedure("RFQDetail_NewDetail", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }

    public RFQDetail readById(long id)
    {
        RFQDetail rfq = new RFQDetail();

        string query =  "SELECT RFQDetailKey, RFQHeaderKey, ItemMasterKey, RPCQty, RPCCostPerUnit, OSQty, " +
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
                rfq.ItemMasterKey = long.Parse(table.Rows[0][2].ToString());
                rfq.RpcQty = long.Parse(table.Rows[0][3].ToString());
                rfq.RpcCostPerUnit = float.Parse(table.Rows[0][4].ToString());
                rfq.OSQty = long.Parse(table.Rows[0][5].ToString());
                rfq.OSCostPerUnit = float.Parse((table.Rows[0][6].ToString()));
                rfq.ScrapValue = float.Parse(table.Rows[0][7].ToString());
                rfq.DirectHrlyLaborRate = float.Parse(table.Rows[0][8].ToString());
                rfq.StdHrs = int.Parse(table.Rows[0][9].ToString());
                rfq.Burden = float.Parse(table.Rows[0][10].ToString());

                sqlConnection.Dispose();
                return rfq;
            }
        }
        return null;
    }

    public List<RFQDetail> readByParentID(long id)
    {
        List<RFQDetail> recordset = new List<RFQDetail>();

        string query = "SELECT RFQDetailKey, RFQHeaderKey, ItemMasterKey, RPCQty, RPCCostPerUnit, OSQty, " +
                        "OSCostPerUnit, ScrapValue, DirectHrlyLaborRate, StdHrs, Burden, PartNumber, UM FROM viewRFQDetail_ReadAll " +
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
                rfq.ItemMasterKey = long.Parse(table.Rows[i][2].ToString());
                rfq.RpcQty = long.Parse(table.Rows[i][3].ToString());
                rfq.RpcCostPerUnit = float.Parse(table.Rows[i][4].ToString());
                rfq.OSQty = long.Parse(table.Rows[i][5].ToString());
                rfq.OSCostPerUnit = float.Parse((table.Rows[i][6].ToString()));
                rfq.ScrapValue = float.Parse(table.Rows[i][7].ToString());
                rfq.DirectHrlyLaborRate = float.Parse(table.Rows[i][8].ToString());
                rfq.StdHrs = int.Parse(table.Rows[i][9].ToString());
                rfq.Burden = float.Parse(table.Rows[i][10].ToString());

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

        string query = "SELECT RFQDetailKey, RFQHeaderKey, ItemMasterKey, RPCQty, RPCCostPerUnit, OSQty, " +
                        "OSCostPerUnit, ScrapValue, DirectHrlyLaborRate, StdHrs, Burden FROM RFQDetail " +
                        "ORDER BY RFQDetailKey";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            RFQDetail rfq = new RFQDetail();
            rfq.Id = long.Parse(table.Rows[i][0].ToString());
            rfq.RfqHeaderKey = long.Parse(table.Rows[i][1].ToString());
            rfq.ItemMasterKey = long.Parse(table.Rows[i][2].ToString());
            rfq.RpcQty = long.Parse(table.Rows[i][3].ToString());
            rfq.RpcCostPerUnit = float.Parse(table.Rows[i][4].ToString());
            rfq.OSQty = long.Parse(table.Rows[i][5].ToString());
            rfq.OSCostPerUnit = float.Parse((table.Rows[i][6].ToString()));
            rfq.ScrapValue = float.Parse(table.Rows[i][7].ToString());
            rfq.DirectHrlyLaborRate = float.Parse(table.Rows[i][8].ToString());
            rfq.StdHrs = int.Parse(table.Rows[i][9].ToString());
            rfq.Burden = float.Parse(table.Rows[i][10].ToString());

            recordset.Add(rfq);
        }

        return recordset;
    }
    public bool update(RFQDetail entity)
    {
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@RFQDetailKey", entity.Id.ToString());

            if (entity.RfqHeaderKey.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@RFQHeaderKey", entity.RfqHeaderKey.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@RFQHeaderKey", "0");
            }
            if (entity.ItemMasterKey.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterKey.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@ItemMasterKey", "0");
            }
            if (entity.RpcQty.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@RPCQty", entity.RpcQty.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@RPCQty", "0");
            }
            if (entity.RpcCostPerUnit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@RPCCostPerUnit", entity.RpcCostPerUnit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@RPCCostPerUnit", "0");
            }
            if (entity.OSQty.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@OSQty", entity.OSQty.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@OSQty", "0");
            }
            if (entity.OSCostPerUnit.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@OSCostPerUnit", entity.OSCostPerUnit.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@OSCostPerUnit", "0");
            }
            if (entity.ScrapValue.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@ScrapValue", entity.ScrapValue.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@ScrapValue", "0");
            }
            if (entity.DirectHrlyLaborRate.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@DirectHrlyLaborRate", entity.DirectHrlyLaborRate.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@DirectHrlyLaborRate", "0");
            }
            if (entity.StdHrs.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@StdHrs", entity.StdHrs.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@StdHrs", "0");
            }
            if (entity.Burden.ToString().Trim() != "")
            {
                DM.Load_SP_Parameters("@Burden", entity.Burden.ToString());
            }
            else
            {
                DM.Load_SP_Parameters("@Burden", "0");
            }

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
    public bool deleteByParentID(long id)
    {
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